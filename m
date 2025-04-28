Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96968A9E8F2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002E10E074;
	Mon, 28 Apr 2025 07:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3J8+hYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729410E074;
 Mon, 28 Apr 2025 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745824447; x=1777360447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=InPFv7NzxrLdMuKj7vrbwJrkYbLdh0+6ESBqGAOmfF0=;
 b=D3J8+hYZqveK+I6Sk2tH4A0LjdBWwg/4wyQR6KDJPECsDco5hco1Cwiz
 QPN4JVgHdT2hNMyVOvsJPIJQCW0WDzAmaI1B4tjS8jFtff+17dCinWOfJ
 ONsSFfByk+9Jfr+aOpgKvHn2eoAli8F0Us9esOZiUMLZFewYb1dkaUxs1
 OTSNKHzeXYDNJ42PheBW88AycosiUcUkxWLlGee6MUQ6YLorPCuT+ZG10
 NBQMaOsyV2IPzFgKk12VcDP2inB3v9MHXgbLO58+Pq9MGh/fGCFEQNBER
 A9CKZqw/VXGXgY5eAD4Iq3+Og8J7uqHgN6IrW5XJXnmuMDZdQyaZ+X0Pc g==;
X-CSE-ConnectionGUID: bJxO8MFUS2qAsq6OUFFaKA==
X-CSE-MsgGUID: 3xvgIvV8QnWuhshUju8yMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50055387"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50055387"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:14:06 -0700
X-CSE-ConnectionGUID: LSbsf5n/Qnex1vpO6CEr5Q==
X-CSE-MsgGUID: ca64yB/wRj+r5F14JJoB2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="156655031"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 28 Apr 2025 00:14:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u9Igk-0006hZ-33;
 Mon, 28 Apr 2025 07:14:02 +0000
Date: Mon, 28 Apr 2025 15:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/tests: fix the bo evict build break
Message-ID: <202504281424.5u93dWXu-lkp@intel.com>
References: <20250428034043.407486-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428034043.407486-1-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on drm/drm-next drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.15-rc3 next-20250424]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-xe-tests-fix-the-bo-evict-build-break/20250428-114114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250428034043.407486-1-airlied%40gmail.com
patch subject: [PATCH] drm/xe/tests: fix the bo evict build break
config: loongarch-randconfig-002-20250428 (https://download.01.org/0day-ci/archive/20250428/202504281424.5u93dWXu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504281424.5u93dWXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504281424.5u93dWXu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_migrate.c:1723:
   drivers/gpu/drm/xe/tests/xe_migrate.c: In function 'test_migrate':
>> drivers/gpu/drm/xe/tests/xe_migrate.c:515:15: error: too few arguments to function 'xe_bo_evict'
     515 |         ret = xe_bo_evict(vram_bo);
         |               ^~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_migrate.c:23:
   drivers/gpu/drm/xe/xe_bo.h:274:5: note: declared here
     274 | int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
         |     ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/xe/xe_dma_buf.c:322:
   drivers/gpu/drm/xe/tests/xe_dma_buf.c: In function 'check_residency':
>> drivers/gpu/drm/xe/tests/xe_dma_buf.c:68:15: error: too few arguments to function 'xe_bo_evict'
      68 |         ret = xe_bo_evict(exported);
         |               ^~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_dma_buf.c:17:
   drivers/gpu/drm/xe/xe_bo.h:274:5: note: declared here
     274 | int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
         |     ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/xe/xe_bo.c:2949:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
>> drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too few arguments to function 'xe_bo_evict'
      63 |         ret = xe_bo_evict(bo);
         |               ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:2769:5: note: declared here
    2769 | int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
         |     ^~~~~~~~~~~


vim +/xe_bo_evict +515 drivers/gpu/drm/xe/tests/xe_migrate.c

   493	
   494	static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
   495				 struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *ccs_bo,
   496				 struct kunit *test)
   497	{
   498		struct dma_fence *fence;
   499		u64 expected, retval;
   500		long timeout;
   501		long ret;
   502	
   503		expected = 0xd0d0d0d0d0d0d0d0;
   504		xe_map_memset(xe, &sys_bo->vmap, 0, 0xd0, sys_bo->size);
   505	
   506		fence = blt_copy(tile, sys_bo, vram_bo, false, "Blit copy from sysmem to vram", test);
   507		if (!sanity_fence_failed(xe, fence, "Blit copy from sysmem to vram", test)) {
   508			retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
   509			if (retval == expected)
   510				KUNIT_FAIL(test, "Sanity check failed: VRAM must have compressed value\n");
   511		}
   512		dma_fence_put(fence);
   513	
   514		kunit_info(test, "Evict vram buffer object\n");
 > 515		ret = xe_bo_evict(vram_bo);
   516		if (ret) {
   517			KUNIT_FAIL(test, "Failed to evict bo.\n");
   518			return;
   519		}
   520	
   521		ret = xe_bo_vmap(vram_bo);
   522		if (ret) {
   523			KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
   524			return;
   525		}
   526	
   527		retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
   528		check(retval, expected, "Clear evicted vram data first value", test);
   529		retval = xe_map_rd(xe, &vram_bo->vmap, vram_bo->size - 8, u64);
   530		check(retval, expected, "Clear evicted vram data last value", test);
   531	
   532		fence = blt_copy(tile, vram_bo, ccs_bo,
   533				 true, "Blit surf copy from vram to sysmem", test);
   534		if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
   535			retval = xe_map_rd(xe, &ccs_bo->vmap, 0, u64);
   536			check(retval, 0, "Clear ccs data first value", test);
   537	
   538			retval = xe_map_rd(xe, &ccs_bo->vmap, ccs_bo->size - 8, u64);
   539			check(retval, 0, "Clear ccs data last value", test);
   540		}
   541		dma_fence_put(fence);
   542	
   543		kunit_info(test, "Restore vram buffer object\n");
   544		ret = xe_bo_validate(vram_bo, NULL, false);
   545		if (ret) {
   546			KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
   547			return;
   548		}
   549	
   550		/* Sync all migration blits */
   551		timeout = dma_resv_wait_timeout(vram_bo->ttm.base.resv,
   552						DMA_RESV_USAGE_KERNEL,
   553						true,
   554						5 * HZ);
   555		if (timeout <= 0) {
   556			KUNIT_FAIL(test, "Failed to sync bo eviction.\n");
   557			return;
   558		}
   559	
   560		ret = xe_bo_vmap(vram_bo);
   561		if (ret) {
   562			KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
   563			return;
   564		}
   565	
   566		retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
   567		check(retval, expected, "Restored value must be equal to initial value", test);
   568		retval = xe_map_rd(xe, &vram_bo->vmap, vram_bo->size - 8, u64);
   569		check(retval, expected, "Restored value must be equal to initial value", test);
   570	
   571		fence = blt_copy(tile, vram_bo, ccs_bo,
   572				 true, "Blit surf copy from vram to sysmem", test);
   573		if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
   574			retval = xe_map_rd(xe, &ccs_bo->vmap, 0, u64);
   575			check(retval, 0, "Clear ccs data first value", test);
   576			retval = xe_map_rd(xe, &ccs_bo->vmap, ccs_bo->size - 8, u64);
   577			check(retval, 0, "Clear ccs data last value", test);
   578		}
   579		dma_fence_put(fence);
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
