# encoding: UTF-8

require 'spec_helper'
require 'pronounce/syllabification_context'
require 'pronounce/syllable_rules'
require 'pronounce/syllable_rules/english'

module Pronounce
  describe SyllableRules do
    describe '/ng/ cannot start a syllable' do
      subject do
        context = Pronounce::SyllabificationContext.new [], phones, index
        SyllableRules[:en]['/ng/ cannot start a syllable'].evaluate context
      end

      let(:phones) { make_phones %w[AA B NG EH NG ER M OW] }

      context '/ŋ/ in a cluster' do
        let(:index) { 2 }
        it { should be :no_new_syllable }
      end

      context 'single /ŋ/' do
        let(:index) { 4 }
        it { should be :no_new_syllable }
      end

      context 'other nasals' do
        let(:index) { 6 }
        it { should be :not_applicable }
      end

    end
  end
end