Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E525BA3AD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 03:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756F010E34B;
	Fri, 16 Sep 2022 01:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768110E2F1;
 Fri, 16 Sep 2022 01:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663290302; x=1694826302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r7VXKS4fwfCQfaLFydmq0GRUyL33h9ZGM1jdnNQEW38=;
 b=eaT3XuNMt4PrIGNgAFQxEK1/H9MCXohXLz6d/DZ2p1mtpi3IgEV89VjD
 gufgS+/36twpWMd3pwXo10TMKLTXhfUxf7CpCU9t7bu1iY4GMK7AlkyxA
 Oh6jbIqWNSdhhQDEXr1Z3bwO8wvEy+uUZRpIMg40hH7PYLBbzGHhEJKNf
 9Kv2VA1eGCxUyKlna6kwl0WJHgEO+wPpmRQEgFAlyUg4L+MSMInHnfmzC
 znwwJU29KbuMTDxcPAeEcyE/MyCZn3oRTOTT6ENaOyHL6noq9t0Q6nltW
 VRKz/BcJLcVDm2hc10cPrhl5Xe5m0m/b/9PNPToJndaaGM3u/3Kad7QZE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278609746"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="278609746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 18:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="946193501"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2022 18:05:00 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oYzmt-0001GN-1d;
 Fri, 16 Sep 2022 01:04:59 +0000
Date: Fri, 16 Sep 2022 09:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v1 2/4] drm/i915: Add missing mask when
 reading GEN12_DSMBASE
Message-ID: <202209160835.MMBeObmU-lkp@intel.com>
References: <20220915-stolen-v1-2-117c5f295bb2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915-stolen-v1-2-117c5f295bb2@intel.com>
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
Cc: tejas.upadhyay@intel.com, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bb4f6b2281b11b009210f62eecd291f7b75c1e85]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-De-Marchi/drm-i915-Improvements-to-stolen-memory-setup/20220916-044155
base:   bb4f6b2281b11b009210f62eecd291f7b75c1e85
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220916/202209160835.MMBeObmU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b0c14c92efecabadc483675b606c1ce109cfa415
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-De-Marchi/drm-i915-Improvements-to-stolen-memory-setup/20220916-044155
        git checkout b0c14c92efecabadc483675b606c1ce109cfa415
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:817:58: warning: shift count is negative [-Wshift-count-negative]
           dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
                                                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:7956:28: note: expanded from macro 'GEN12_BDSM_MASK'
   #define   GEN12_BDSM_MASK               GENMASK(63, 20)
                                           ^~~~~~~~~~~~~~~
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +817 drivers/gpu/drm/i915/gem/i915_gem_stolen.c

   798	
   799	struct intel_memory_region *
   800	i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
   801				   u16 instance)
   802	{
   803		struct intel_uncore *uncore = &i915->uncore;
   804		struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
   805		resource_size_t dsm_size, dsm_base, lmem_size;
   806		struct intel_memory_region *mem;
   807		resource_size_t io_start, io_size;
   808		resource_size_t min_page_size;
   809	
   810		if (WARN_ON_ONCE(instance))
   811			return ERR_PTR(-ENODEV);
   812	
   813		if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
   814			return ERR_PTR(-ENXIO);
   815	
   816		/* Use DSM base address instead for stolen memory */
 > 817		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
   818		if (IS_DG1(uncore->i915)) {
   819			lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
   820			if (WARN_ON(lmem_size < dsm_base))
   821				return ERR_PTR(-ENODEV);
   822		} else {
   823			resource_size_t lmem_range;
   824	
   825			lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
   826			lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
   827			lmem_size *= SZ_1G;
   828		}
   829	
   830		dsm_size = lmem_size - dsm_base;
   831		if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
   832			io_start = 0;
   833			io_size = 0;
   834		} else {
   835			io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
   836			io_size = dsm_size;
   837		}
   838	
   839		min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
   840							I915_GTT_PAGE_SIZE_4K;
   841	
   842		mem = intel_memory_region_create(i915, dsm_base, dsm_size,
   843						 min_page_size,
   844						 io_start, io_size,
   845						 type, instance,
   846						 &i915_region_stolen_lmem_ops);
   847		if (IS_ERR(mem))
   848			return mem;
   849	
   850		/*
   851		 * TODO: consider creating common helper to just print all the
   852		 * interesting stuff from intel_memory_region, which we can use for all
   853		 * our probed regions.
   854		 */
   855	
   856		drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
   857			&mem->io_start);
   858		drm_dbg(&i915->drm, "Stolen Local DSM base: %pa\n", &dsm_base);
   859	
   860		intel_memory_region_set_name(mem, "stolen-local");
   861	
   862		mem->private = true;
   863	
   864		return mem;
   865	}
   866	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
