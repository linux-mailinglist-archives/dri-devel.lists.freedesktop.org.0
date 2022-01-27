Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CF49D9A9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 05:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0B010E4D8;
	Thu, 27 Jan 2022 04:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3794910E503;
 Thu, 27 Jan 2022 04:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643258324; x=1674794324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+v3zHy14So8/zIIcQ7/xxtqMJ9lKyrTICYz8G+VcnfE=;
 b=eQrDGt2L3Oc8vR7Va5DETmnLuAaXIJk/10SZGnmoWJu2Hc+YNSLemkIW
 JvZ+l9p7lg7T8EnbnxIHTMhPuSN84Y4HhXP3VSpamYceLsg9K0FZE/YaZ
 BTAHpplxJS4x8cwGup+idgD3QgRfwL+rlGppJZY9pvNeoA0TFi5b2tWQ8
 LiHcYMTZ3eLuI4mmm6M0uNrotXbJpep6YrYdcfndmmktHgHJyHYWWQqY8
 X9CZB3rQR6i5bun7ebv/14/8AWb6eAdj/N+VP/xnk4xoQguNIFmAc7Kaa
 XxJblSadICSY02C3sibN5ICcpkKKdsgcTzAFQLGxxm4CWI48Rv93hsHGy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234121023"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="234121023"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 20:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="696499027"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 26 Jan 2022 20:38:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nCwYS-000M8T-Qd; Thu, 27 Jan 2022 04:38:40 +0000
Date: Thu, 27 Jan 2022 12:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 16/19] drm/i915/guc: Use a single pass to calculate regset
Message-ID: <202201271208.kELpe3Mn-lkp@intel.com>
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on next-20220125]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next linus/master airlied/drm-next v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lucas-De-Marchi/drm-i915-guc-Refactor-ADS-access-to-use-dma_buf_map/20220127-043912
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220127/202201271208.kELpe3Mn-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/313757d9ed833acea4ee2bb0e3f3565d6efcf3cc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/drm-i915-guc-Refactor-ADS-access-to-use-dma_buf_map/20220127-043912
        git checkout 313757d9ed833acea4ee2bb0e3f3565d6efcf3cc
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from drivers/gpu/drm/i915/i915_vma.h:31,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc.h:20,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:18,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:10,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:9:
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c: In function 'guc_mmio_reg_state_create':
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:369:38: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Werror=format=]
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
   cc1: all warnings being treated as errors


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
