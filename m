Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923E49D6BD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 01:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A57710E361;
	Thu, 27 Jan 2022 00:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1F10E361;
 Thu, 27 Jan 2022 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643243455; x=1674779455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YsLQGkeoBEGwJtnkBo5sKvLzE0zagKgDka+fB9nfGJg=;
 b=kiNWlH42p1P5nIXGYl7frEnjasG6B1YHo2Qz2CwC/tyd7HJVFx2HL0z0
 fQ2ef1Sn18xa8x0/wAmfnvs/Tqupp7z3duDxXLGhKpRoUqMF+/ZqMsAzR
 22rQmIj26QvFHmX5GtROnKW7Mn6Z/p3SYCVEcBnOGMhVNaRTwpWHfzPfD
 sg8u324ZM9zEulGPpc2CIaETNzYifm0NqEsCyN6EhdybgfYoVner2nVNA
 7UeNiS6ronB5GYEK9UUy769QeqkE3IfWyhBccFgHcpyjfdhDxu1htgmG0
 KW+wFlEkfvEJ08Agm2gFNXClqPaN3t0b8vJRlTYv3NYUnHXUmCSyeXgy6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333054497"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333054497"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 16:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="597647339"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2022 16:30:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nCsgE-000Lr3-Cx; Thu, 27 Jan 2022 00:30:26 +0000
Date: Thu, 27 Jan 2022 08:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 16/19] drm/i915/guc: Use a single pass to calculate regset
Message-ID: <202201270827.CLIhfdPe-lkp@intel.com>
References: <20220126203702.1784589-17-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126203702.1784589-17-lucas.demarchi@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220125]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next linus/master airlied/drm-next v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lucas-De-Marchi/drm-i915-guc-Refactor-ADS-access-to-use-dma_buf_map/20220127-043912
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-m021-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270827.CLIhfdPe-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/313757d9ed833acea4ee2bb0e3f3565d6efcf3cc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/drm-i915-guc-Refactor-ADS-access-to-use-dma_buf_map/20220127-043912
        git checkout 313757d9ed833acea4ee2bb0e3f3565d6efcf3cc
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from drivers/gpu/drm/i915/i915_vma.h:31,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc.h:20,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:18,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:10,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:9:
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'guc_mmio_reg_state_create':
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:369:38: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     369 |  drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %lu KB for temporary ADS regset\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     370 |   (temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
         |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                        |
         |                                                        u32 {aka unsigned int}
   include/drm/drm_print.h:461:56: note: in definition of macro 'drm_dbg'
     461 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                                        ^~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:369:46: note: format string is defined here
     369 |  drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %lu KB for temporary ADS regset\n",
         |                                            ~~^
         |                                              |
         |                                              long unsigned int
         |                                            %u


vim +369 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c

   348	
   349	static long guc_mmio_reg_state_create(struct intel_guc *guc)
   350	{
   351		struct intel_gt *gt = guc_to_gt(guc);
   352		struct intel_engine_cs *engine;
   353		enum intel_engine_id id;
   354		struct temp_regset temp_set = {};
   355		long total = 0;
   356	
   357		for_each_engine(engine, gt, id) {
   358			u32 used = temp_set.storage_used;
   359	
   360			if (guc_mmio_regset_init(&temp_set, engine) < 0)
   361				return -1;
   362	
   363			guc->ads_regset_count[id] = temp_set.storage_used - used;
   364			total += guc->ads_regset_count[id];
   365		}
   366	
   367		guc->ads_regset = temp_set.storage;
   368	
 > 369		drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %lu KB for temporary ADS regset\n",
   370			(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
   371	
   372		return total * sizeof(struct guc_mmio_reg);
   373	}
   374	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
