Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA4C55B30
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 05:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CE310E1EB;
	Thu, 13 Nov 2025 04:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOYExeE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8E10E0EB;
 Thu, 13 Nov 2025 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763009485; x=1794545485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=faKTN2zfSgzoE0fq/oUr30oRaLncfX0+bO+XMulJPas=;
 b=TOYExeE3EouOLk7/mCZ2d65BuvHkD+jl/8x+WqHBeK2zoeAtiYRQfwlO
 l3YIjUC+cwsH+XncMvXuolzbPRrdJ5lfYiTBgDXX0cjF/1O1Ky3kT8oJ0
 H/tnIrGjlooJ59vdsHVotrfaOLfTPEfl4uFIaLUR7yfVUFr5l03mkzaEG
 W/3VRwPqlPhLWFC9oLT1GOaOlOj5p/EQ51GHLhiTUpHr3UNitreqgNAzG
 g747TqjFxaAMLqsd7XdqzL09dmxXMMLwgXREcBPhIyzCFkhYnVaymGNIA
 rFwgEXqT93Sio4PsmJrgyT1QNHDG1MyUgQbuCls53cG3lK3ur4omtat77 Q==;
X-CSE-ConnectionGUID: HsF4euo8RlCXDZ8JhI3gVA==
X-CSE-MsgGUID: WBKZtAlZQJWGSIMRf0lnug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008616"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65008616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 20:51:24 -0800
X-CSE-ConnectionGUID: GDEXkLYqR3eqOO99PChUcQ==
X-CSE-MsgGUID: /rZVsUijQlChPJAxNv47Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220161062"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vJPIk-0004tJ-37;
 Thu, 13 Nov 2025 04:51:18 +0000
Date: Thu, 13 Nov 2025 12:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 11/17] drm/xe: Use the vma attibute drm_pagemap to
 select where to migrate
Message-ID: <202511130207.qwkzEI6l-lkp@intel.com>
References: <20251111164408.113070-12-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111164408.113070-12-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20251112]
[cannot apply to linus/master v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-xe-svm-Fix-a-debug-printout/20251112-004643
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251111164408.113070-12-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 11/17] drm/xe: Use the vma attibute drm_pagemap to select where to migrate
config: x86_64-buildonly-randconfig-005-20251112 (https://download.01.org/0day-ci/archive/20251113/202511130207.qwkzEI6l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130207.qwkzEI6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130207.qwkzEI6l-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_vm.c: In function 'prefetch_ranges':
>> drivers/gpu/drm/xe/xe_vm.c:2914:72: error: passing argument 3 of 'xe_svm_range_needs_migrate_to_vram' makes integer from pointer without a cast [-Wint-conversion]
    2914 |                 if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
         |                                                                        ^~~~~~~~
         |                                                                        |
         |                                                                        struct drm_pagemap *
   In file included from drivers/gpu/drm/xe/xe_res_cursor.h:38,
                    from drivers/gpu/drm/xe/xe_vm.c:36:
   drivers/gpu/drm/xe/xe_svm.h:321:45: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct drm_pagemap *'
     321 |                                         u32 region)
         |                                         ~~~~^~~~~~


vim +/xe_svm_range_needs_migrate_to_vram +2914 drivers/gpu/drm/xe/xe_vm.c

  2889	
  2890	static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
  2891	{
  2892		bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
  2893		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
  2894		struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
  2895		int err = 0;
  2896	
  2897		struct xe_svm_range *svm_range;
  2898		struct drm_gpusvm_ctx ctx = {};
  2899		unsigned long i;
  2900	
  2901		if (!xe_vma_is_cpu_addr_mirror(vma))
  2902			return 0;
  2903	
  2904		ctx.read_only = xe_vma_read_only(vma);
  2905		ctx.devmem_possible = devmem_possible;
  2906		ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
  2907		ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
  2908	
  2909		/* TODO: Threading the migration */
  2910		xa_for_each(&op->prefetch_range.range, i, svm_range) {
  2911			if (!dpagemap)
  2912				xe_svm_range_migrate_to_smem(vm, svm_range);
  2913	
> 2914			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
  2915				err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
  2916				if (err) {
  2917					drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
  2918						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
  2919					return -ENODATA;
  2920				}
  2921				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
  2922			}
  2923	
  2924			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
  2925			if (err) {
  2926				drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
  2927					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
  2928				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
  2929					err = -ENODATA;
  2930				return err;
  2931			}
  2932			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
  2933		}
  2934	
  2935		return err;
  2936	}
  2937	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
