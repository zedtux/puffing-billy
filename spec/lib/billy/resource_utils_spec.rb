require 'spec_helper'
include Billy::ResourceUtils

describe Billy::ResourceUtils do
  describe 'sorting' do
    let!(:helper) { ResourceUtilsSpecHelper }
    let(:sorted_hash_1_level) { helper.sorted_hash_1_level }
    let(:sorted_hash_2_level) { helper.sorted_hash_2_level }
    let(:unsorted_hash_1_level) { helper.unsorted_hash_1_level }
    let(:unsorted_hash_2_level) { helper.unsorted_hash_2_level }

    describe 'sorted_hash' do
      it 'sorts nested hashes 1 level deep' do
        expect(sorted_hash(unsorted_hash_1_level)).to eq sorted_hash_1_level
      end
      it 'sorts nested hashes 2 levels deep' do
        expect(sorted_hash(unsorted_hash_2_level)).to eq sorted_hash_2_level
      end
    end

    describe 'sorted_json' do
      it 'sorts nested JSON 1 level deep' do
        expect(sorted_json(unsorted_hash_1_level.to_json)).to eq sorted_hash_1_level.to_json
      end
      it 'sorts nested JSON 2 levels deep' do
        expect(sorted_json(unsorted_hash_2_level.to_json)).to eq sorted_hash_2_level.to_json
      end
    end
  end

  describe 'json?' do
    let(:json) { {a: '1'}.to_json }
    let(:non_json) { 'Not JSON.' }

    it 'identifies JSON' do
      expect(json?(json)).to be_true
    end
    it 'identifies non-JSON' do
      expect(json?(non_json)).to be_false
    end
  end

  describe 'parse_anchor' do
    let(:anchor_url) { 'http://example.com/#stuff' }
    let(:non_anchor_url) { 'http://example.com' }

    it 'returns the anchor value' do
      expect(parse_anchor(anchor_url)).to eq 'stuff'
    end
    it 'returns nil if non-anchor URL' do
      expect(parse_anchor(non_anchor_url)).to be_nil
    end
  end
end