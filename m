Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77309AA29A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 14:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BC910E12B;
	Tue, 22 Oct 2024 12:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3aA0gCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373FB10E12B;
 Tue, 22 Oct 2024 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729601980; x=1761137980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ag4Wq4v+6OftkIVeeXDYFwwuXXilPEH4BI9PwlNBx0g=;
 b=T3aA0gCW+5Slaw24V0Mwk7FdbE1TB8jUDd/duJUi0Ji9zPU7o4IhiSv3
 7/OL5IeT5JclkVTTd6ohB6aryfDrAi2o8oq3i9jNXKlk/MyZxqmvOtK7F
 4U6i2PbdvQkybWYBxuzqUQxz6+0wMZX1Dc8sRO66ryj474o/UzHptqo+0
 QUaJcjqzlpVwAidtu/cc9Cqlt1FkYmUIDxXQihyAzmZbYqSqLPjwS07Y1
 Lza8NNLu6dDmBCFoTRES6k5aMqpahSMgrcz9o1onApjrOw/SMKfdPb9AF
 Py4jvWpj46+Ro3soxpQJtvZGbI8cDCHyAC+ZbzCnHzuPvyqj6ir0ezOSu A==;
X-CSE-ConnectionGUID: 72J+MF/MTfiiIUXDvWDAyw==
X-CSE-MsgGUID: wF81twU1T9SNNUOzSvD0NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29008861"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29008861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 05:59:39 -0700
X-CSE-ConnectionGUID: Z3uW2xWzSOa/5fcKg4i2Xg==
X-CSE-MsgGUID: sB11bFZ/QOatpkbuf1+V6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84469418"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2024 05:59:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t3EU3-000Tb8-0p;
 Tue, 22 Oct 2024 12:59:35 +0000
Date: Tue, 22 Oct 2024 20:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/pt: Add an additional check for dmabuf BOs
 while updating PTEs
Message-ID: <202410222048.8IhSS8iE-lkp@intel.com>
References: <20241021052236.1820329-6-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021052236.1820329-6-vivek.kasireddy@intel.com>
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

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/PCI-P2PDMA-Don-t-enforce-ACS-check-for-functions-of-same-device/20241021-134804
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241021052236.1820329-6-vivek.kasireddy%40intel.com
patch subject: [PATCH v2 5/5] drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs
config: i386-buildonly-randconfig-003-20241022 (https://download.01.org/0day-ci/archive/20241022/202410222048.8IhSS8iE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410222048.8IhSS8iE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410222048.8IhSS8iE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_pt.c: In function 'xe_pt_stage_bind':
>> drivers/gpu/drm/xe/xe_pt.c:682:25: error: implicit declaration of function 'xe_res_first_dma'; did you mean 'xe_res_first_sg'? [-Werror=implicit-function-declaration]
     682 |                         xe_res_first_dma(bo->dma_addr, xe_vma_bo_offset(vma),
         |                         ^~~~~~~~~~~~~~~~
         |                         xe_res_first_sg
   cc1: some warnings being treated as errors


vim +682 drivers/gpu/drm/xe/xe_pt.c

   583	
   584	/**
   585	 * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
   586	 * range.
   587	 * @tile: The tile we're building for.
   588	 * @vma: The vma indicating the address range.
   589	 * @entries: Storage for the update entries used for connecting the tree to
   590	 * the main tree at commit time.
   591	 * @num_entries: On output contains the number of @entries used.
   592	 *
   593	 * This function builds a disconnected page-table tree for a given address
   594	 * range. The tree is connected to the main vm tree for the gpu using
   595	 * xe_migrate_update_pgtables() and for the cpu using xe_pt_commit_bind().
   596	 * The function builds xe_vm_pgtable_update structures for already existing
   597	 * shared page-tables, and non-existing shared and non-shared page-tables
   598	 * are built and populated directly.
   599	 *
   600	 * Return 0 on success, negative error code on error.
   601	 */
   602	static int
   603	xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
   604			 struct xe_vm_pgtable_update *entries, u32 *num_entries)
   605	{
   606		struct xe_device *xe = tile_to_xe(tile);
   607		struct xe_bo *bo = xe_vma_bo(vma);
   608		bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
   609			(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
   610		struct xe_res_cursor curs;
   611		struct xe_pt_stage_bind_walk xe_walk = {
   612			.base = {
   613				.ops = &xe_pt_stage_bind_ops,
   614				.shifts = xe_normal_pt_shifts,
   615				.max_level = XE_PT_HIGHEST_LEVEL,
   616			},
   617			.vm = xe_vma_vm(vma),
   618			.tile = tile,
   619			.curs = &curs,
   620			.va_curs_start = xe_vma_start(vma),
   621			.vma = vma,
   622			.wupd.entries = entries,
   623			.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
   624		};
   625		struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
   626		int ret;
   627	
   628		/**
   629		 * Default atomic expectations for different allocation scenarios are as follows:
   630		 *
   631		 * 1. Traditional API: When the VM is not in LR mode:
   632		 *    - Device atomics are expected to function with all allocations.
   633		 *
   634		 * 2. Compute/SVM API: When the VM is in LR mode:
   635		 *    - Device atomics are the default behavior when the bo is placed in a single region.
   636		 *    - In all other cases device atomics will be disabled with AE=0 until an application
   637		 *      request differently using a ioctl like madvise.
   638		 */
   639		if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
   640			if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
   641				if (bo && xe_bo_has_single_placement(bo))
   642					xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
   643				/**
   644				 * If a SMEM+LMEM allocation is backed by SMEM, a device
   645				 * atomics will cause a gpu page fault and which then
   646				 * gets migrated to LMEM, bind such allocations with
   647				 * device atomics enabled.
   648				 */
   649				else if (is_devmem && !xe_bo_has_single_placement(bo))
   650					xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
   651			} else {
   652				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
   653			}
   654	
   655			/**
   656			 * Unset AE if the platform(PVC) doesn't support it on an
   657			 * allocation
   658			 */
   659			if (!xe->info.has_device_atomics_on_smem && !is_devmem)
   660				xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
   661		}
   662	
   663		if (is_devmem || bo->is_devmem_external)
   664			xe_walk.default_pte |= XE_PPGTT_PTE_DM;
   665	
   666		if (is_devmem)
   667			xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
   668	
   669		if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
   670			xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
   671	
   672		xe_bo_assert_held(bo);
   673	
   674		if (!xe_vma_is_null(vma)) {
   675			if (xe_vma_is_userptr(vma))
   676				xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
   677						xe_vma_size(vma), &curs);
   678			else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
   679				xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
   680					     xe_vma_size(vma), &curs);
   681			else if (bo->is_devmem_external)
 > 682				xe_res_first_dma(bo->dma_addr, xe_vma_bo_offset(vma),
   683						xe_vma_size(vma), &curs);
   684			else
   685				xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
   686						xe_vma_size(vma), &curs);
   687		} else {
   688			curs.size = xe_vma_size(vma);
   689		}
   690	
   691		ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
   692				       xe_vma_end(vma), &xe_walk.base);
   693	
   694		*num_entries = xe_walk.wupd.num_used_entries;
   695		return ret;
   696	}
   697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
