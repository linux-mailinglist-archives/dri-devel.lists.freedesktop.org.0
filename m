Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79E6D0FC4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 22:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD3510E1CF;
	Thu, 30 Mar 2023 20:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5C010E1CF;
 Thu, 30 Mar 2023 20:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680207252; x=1711743252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IfDsXOX+am26qhUOPvmXOslDXLj5q6Lvq+lbvLySEp0=;
 b=gf6vIvWK1wsGrhwz2maH48bUP/57Uyt7RL9hDfQ2PL5sHLsbjDwz44QK
 bXm/pSWWwivr5HjpitUZyslfgyxA33yn3WHf3HuIQrdaCsku1jLIO5Tks
 1GvSeEsvN746cBjQT7o93IQURydFS3VjxFGajW2BcMs1hJkRZohOtFfql
 FS6sY5iX60hT2TZObkFy+wqbGhhH4XSEZa/vsZHsgCH80QqI4Cggu+kKK
 PboEaWh+SZwKMtv6wcgeKPEplxxQBPui7ITShCucqtlLGFO1EhhjTzo+Y
 lpdesSY9zztyoopTBxe2fl32LoGdE4ByVza4D7rzDoExxS95scB+s95uC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342921697"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="342921697"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 13:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="930870474"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="930870474"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2023 13:14:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1phyeu-000LBA-29;
 Thu, 30 Mar 2023 20:14:08 +0000
Date: Fri, 31 Mar 2023 04:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/12] drm/radeon: remove radeon_connector_edid() and
 stop using edid_blob_ptr
Message-ID: <202303310350.HnqZZxIV-lkp@intel.com>
References: <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Pan@freedesktop.org, jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-exynos/exynos-drm-next linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-parse-display-info-has_audio-similar-to-is_hdmi/20230330-234201
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula%40intel.com
patch subject: [PATCH 04/12] drm/radeon: remove radeon_connector_edid() and stop using edid_blob_ptr
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303310350.HnqZZxIV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ad73d8b0ebf2124b058e95ef5831caa8f2d34229
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-edid-parse-display-info-has_audio-similar-to-is_hdmi/20230330-234201
        git checkout ad73d8b0ebf2124b058e95ef5831caa8f2d34229
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310350.HnqZZxIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/radeon/radeon_audio.c: In function 'radeon_audio_write_sad_regs':
>> drivers/gpu/drm/radeon/radeon_audio.c:312:37: error: 'radeon_connector' undeclared (first use in this function)
     312 |         sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
         |                                     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_audio.c:312:37: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/radeon/radeon_audio.c: In function 'radeon_audio_write_speaker_allocation':
   drivers/gpu/drm/radeon/radeon_audio.c:335:52: error: 'radeon_connector' undeclared (first use in this function)
     335 |         sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
         |                                                    ^~~~~~~~~~~~~~~~


vim +/radeon_connector +312 drivers/gpu/drm/radeon/radeon_audio.c

   301	
   302	static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
   303	{
   304		struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
   305		struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
   306		struct cea_sad *sads;
   307		int sad_count;
   308	
   309		if (!connector)
   310			return;
   311	
 > 312		sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
   313		if (sad_count < 0)
   314			DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
   315		if (sad_count <= 0)
   316			return;
   317		BUG_ON(!sads);
   318	
   319		if (radeon_encoder->audio && radeon_encoder->audio->write_sad_regs)
   320			radeon_encoder->audio->write_sad_regs(encoder, sads, sad_count);
   321	
   322		kfree(sads);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
