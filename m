Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D694D423
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4A10E996;
	Fri,  9 Aug 2024 16:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOo3BN14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DC710E97A;
 Fri,  9 Aug 2024 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723219537; x=1754755537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lBSrFiwP4CAfe3yLoQSuk+Dwe76uO5UMvfBrNDBtdKM=;
 b=IOo3BN14ZJZ4UK57vgvPF2dpDn3/CwSOFYGdNIkbHx1hVVYnNko1gm2O
 GIJ7F1wkyXSoxe39DAchmPBSsiTB16GbcqXDuo4ycXPHcXObL3F/flaHe
 UuN6w57xs6D/IDZCaVXJ7LD2Ozy0FXbv8PbCXCgawk6ch2tPXVNreySTz
 FldYBtuwJgSlgmcb50QVCi3HnULf/t5k5KAo1Qh1DRbQztfFfLgUb1fQ/
 l7xgAxDues+2mmx3zhsxehgM4mRUxsUUOwKNDczLDYQ1OmmKR8tICKCFw
 4B1Or778sgh5CnD/fzQaLn3QMj8+mcw35o7BdbivA/EFuifo2ZR2ZTziO w==;
X-CSE-ConnectionGUID: ZSBYdprkSS+aACCa5/slwA==
X-CSE-MsgGUID: wldfsq9dSUmBLnshD60evQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25167224"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="25167224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:05:36 -0700
X-CSE-ConnectionGUID: sV9n561IQnWPaYcnUjUtdA==
X-CSE-MsgGUID: JRzT13nfSOylHYTAtmRUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="62554899"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.147])
 ([10.245.245.147])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:05:35 -0700
Message-ID: <203b9f66-ffe8-4ec9-97c9-cc224c7afca0@intel.com>
Date: Fri, 9 Aug 2024 17:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-12-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240703153813.182001-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

On 03/07/2024 16:38, Thomas Hellström wrote:
> Rather than relying on the TTM watermark accounting add a shrinker
> for xe_bos in TT or system memory.
> 
> Leverage the newly added TTM per-page shrinking and shmem backup
> support.
> 
> Although xe doesn't fully support WONTNEED (purgeable) bos yet,
> introduce and add shrinker support for purgeable ttm_tts.
> 
> v2:
> - Cleanups bugfixes and a KUNIT shrinker test.
> - Add writeback support, and activate if kswapd.
> v3:
> - Move the try_shrink() helper to core TTM.
> - Minor cleanups.
> v4:
> - Add runtime pm for the shrinker. Shrinking may require an active
>    device for CCS metadata copying.
> v5:
> - Separately purge ghost- and zombie objects in the shrinker.
> - Fix a format specifier - type inconsistency. (Kernel test robot).
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c     |  67 ++++++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/tests/xe_bo.c      | 118 +++++++++++
>   drivers/gpu/drm/xe/tests/xe_bo_test.c |   1 +
>   drivers/gpu/drm/xe/tests/xe_bo_test.h |   1 +
>   drivers/gpu/drm/xe/xe_bo.c            | 155 ++++++++++++--
>   drivers/gpu/drm/xe/xe_bo.h            |  26 +++
>   drivers/gpu/drm/xe/xe_device.c        |   8 +
>   drivers/gpu/drm/xe/xe_device_types.h  |   2 +
>   drivers/gpu/drm/xe/xe_shrinker.c      | 287 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_shrinker.h      |  18 ++
>   include/drm/ttm/ttm_bo.h              |   3 +
>   12 files changed, 671 insertions(+), 16 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index c4f678f30fc2..563e96a4cf06 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -924,3 +924,70 @@ long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>   
>   	return progress;
>   }
> +EXPORT_SYMBOL(ttm_lru_walk_for_evict);
> +
> +/**
> + * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer object.
> + * @walk: The struct xe_ttm_lru_walk that describes the walk.
> + * @bo: The buffer object.
> + * @purge: Whether to attempt to purge the bo content since it's no
> + * longer needed.
> + * @writeback: If !@purge, attempt to write out to persistent storage.
> + *
> + * The function uses the ttm_tt_back_up functionality to back up or
> + * purge a struct ttm_tt. If the bo is not in system, it's first
> + * moved there.
> + *
> + * Return: The number of pages shrunken or purged, or
> + * negative error code on failure.
> + */
> +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
> +		       bool purge, bool writeback)
> +{
> +	static const struct ttm_place sys_placement_flags = {
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = TTM_PL_SYSTEM,
> +		.flags = 0,
> +	};
> +	static struct ttm_placement sys_placement = {
> +		.num_placement = 1,
> +		.placement = &sys_placement_flags,
> +	};
> +	struct ttm_operation_ctx *ctx = walk->ctx;
> +	struct ttm_tt *tt = bo->ttm;
> +	long lret;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return 0;
> +
> +	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
> +		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
> +
> +		if (ret) {
> +			if (ret == -EINTR || ret == -EDEADLK ||
> +			    ret == -ERESTARTSYS)
> +				return ret;
> +			return 0;
> +		}
> +	}
> +
> +	lret = ttm_bo_wait_ctx(bo, ctx);
> +	if (lret < 0) {
> +		if (lret == -ERESTARTSYS)
> +			return lret;
> +		return 0;
> +	}
> +
> +	if (bo->deleted)
> +		lret = ttm_tt_backup(bo->bdev, tt, true, writeback);
> +	else
> +		lret = ttm_tt_backup(bo->bdev, tt, purge, writeback);
> +	if (lret < 0 && lret != -EINTR)
> +		return 0;
> +
> +	return lret;
> +}
> +EXPORT_SYMBOL(ttm_bo_try_shrink);
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1e03bfe4a68..1eba51bdd172 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -112,6 +112,7 @@ xe-y += xe_bb.o \
>   	xe_ring_ops.o \
>   	xe_sa.o \
>   	xe_sched_job.o \
> +	xe_shrinker.o \
>   	xe_step.o \
>   	xe_sync.o \
>   	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 9f3c02826464..49617f16dc76 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -6,6 +6,8 @@
>   #include <kunit/test.h>
>   #include <kunit/visibility.h>
>   
> +#include <uapi/linux/sysinfo.h>
> +
>   #include "tests/xe_bo_test.h"
>   #include "tests/xe_pci_test.h"
>   #include "tests/xe_test.h"
> @@ -350,3 +352,119 @@ void xe_bo_evict_kunit(struct kunit *test)
>   	xe_call_for_each_device(evict_test_run_device);
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
> +
> +struct xe_bo_link {
> +	struct list_head link;
> +	struct xe_bo *bo;
> +};
> +
> +#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
> +
> +/*
> + * Try to create system bos corresponding to twice the amount
> + * of available system memory to test shrinker functionality.
> + * If no swap space is available to accommodate the
> + * memory overcommit, mark bos purgeable.
> + */
> +static int shrink_test_run_device(struct xe_device *xe)
> +{
> +	struct kunit *test = xe_cur_kunit();
> +	LIST_HEAD(bos);
> +	struct xe_bo_link *link, *next;
> +	struct sysinfo si;
> +	size_t total, alloced;
> +	unsigned int interrupted = 0, successful = 0;
> +
> +	si_meminfo(&si);
> +	total = si.freeram * si.mem_unit;
> +
> +	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
> +		   (unsigned long) total);
> +
> +	total <<= 1;
> +	for (alloced = 0; alloced < total ; alloced += XE_BO_SHRINK_SIZE) {
> +		struct xe_bo *bo;
> +		unsigned int mem_type;
> +
> +		link = kzalloc(sizeof(*link), GFP_KERNEL);
> +		if (!link) {
> +			KUNIT_FAIL(test, "Unexpeced link allocation failure\n");
> +			break;
> +		}
> +
> +		INIT_LIST_HEAD(&link->link);
> +
> +		/* We can create bos using WC caching here. But it is slower. */
> +		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
> +				       DRM_XE_GEM_CPU_CACHING_WB,
> +				       ttm_bo_type_device,
> +				       XE_BO_FLAG_SYSTEM);
> +		if (IS_ERR(bo)) {
> +			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
> +			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
> +				KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
> +			kfree(link);
> +			break;
> +		}
> +		link->bo = bo;
> +		list_add_tail(&link->link, &bos);
> +		xe_bo_lock(bo, false);
> +
> +		/*
> +		 * If we're low on swap entries, we can't shrink unless the bo
> +		 * is marked purgeable.
> +		 */
> +		if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >> PAGE_SHIFT) * 128) {
> +			struct xe_ttm_tt *xe_tt =
> +				container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
> +			long num_pages = xe_tt->ttm.num_pages;
> +
> +			xe_tt->purgeable = true;
> +			xe_shrinker_mod_pages(xe->mem.shrinker, -num_pages,
> +					      num_pages);
> +		}
> +
> +		mem_type = bo->ttm.resource->mem_type;
> +		xe_bo_unlock(bo);
> +		if (mem_type != XE_PL_TT)
> +			KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
> +				   bo->ttm.resource->mem_type);
> +		cond_resched();
> +		if (signal_pending(current))
> +			break;
> +	}
> +
> +	/* Read back and destroy bos */
> +	list_for_each_entry_safe_reverse(link, next, &bos, link) {
> +		static struct ttm_operation_ctx ctx = {.interruptible = true};
> +		struct xe_bo *bo = link->bo;
> +		int ret;
> +
> +		if (!signal_pending(current)) {
> +			xe_bo_lock(bo, NULL);
> +			ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
> +			xe_bo_unlock(bo);
> +			if (ret && ret != -EINTR)
> +				KUNIT_FAIL(test, "Validation failed: %pe\n",
> +					   ERR_PTR(ret));
> +			else if (ret)
> +				interrupted++;
> +			else
> +				successful++;
> +		}
> +		xe_bo_put(link->bo);
> +		list_del(&link->link);
> +		kfree(link);
> +		cond_resched();
> +	}
> +	kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
> +		   interrupted, successful);
> +
> +	return 0;
> +}
> +
> +void xe_bo_shrink_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(shrink_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_bo_shrink_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> index a324cde77db8..317fa923e287 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> @@ -10,6 +10,7 @@
>   static struct kunit_case xe_bo_tests[] = {
>   	KUNIT_CASE(xe_ccs_migrate_kunit),
>   	KUNIT_CASE(xe_bo_evict_kunit),
> +	KUNIT_CASE_SLOW(xe_bo_shrink_kunit),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> index 0113ab45066a..7f44d14a45c5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> @@ -10,5 +10,6 @@ struct kunit;
>   
>   void xe_ccs_migrate_kunit(struct kunit *test);
>   void xe_bo_evict_kunit(struct kunit *test);
> +void xe_bo_shrink_kunit(struct kunit *test);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 65c696966e96..6ab63d1642ae 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
> +#include <drm/ttm/ttm_backup.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_tt.h>
> @@ -25,6 +26,7 @@
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_res_cursor.h"
> +#include "xe_shrinker.h"
>   #include "xe_trace_bo.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_vm.h"
> @@ -278,11 +280,15 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>   	}
>   }
>   
> +/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
>   struct xe_ttm_tt {
>   	struct ttm_tt ttm;
> -	struct device *dev;
> +	/** @xe - The xe device */
> +	struct xe_device *xe;
>   	struct sg_table sgt;
>   	struct sg_table *sg;
> +	/** @purgeable - Whether the bo is purgeable (WONTNEED) */
> +	bool purgeable;
>   };
>   
>   static int xe_tt_map_sg(struct ttm_tt *tt)
> @@ -291,7 +297,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>   	unsigned long num_pages = tt->num_pages;
>   	int ret;
>   
> -	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
> +	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> +		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
>   
>   	if (xe_tt->sg)
>   		return 0;
> @@ -299,13 +306,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>   	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
>   						num_pages, 0,
>   						(u64)num_pages << PAGE_SHIFT,
> -						xe_sg_segment_size(xe_tt->dev),
> +						xe_sg_segment_size(xe_tt->xe->drm.dev),
>   						GFP_KERNEL);
>   	if (ret)
>   		return ret;
>   
>   	xe_tt->sg = &xe_tt->sgt;
> -	ret = dma_map_sgtable(xe_tt->dev, xe_tt->sg, DMA_BIDIRECTIONAL,
> +	ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
>   			      DMA_ATTR_SKIP_CPU_SYNC);
>   	if (ret) {
>   		sg_free_table(xe_tt->sg);
> @@ -321,7 +328,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
>   	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>   
>   	if (xe_tt->sg) {
> -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> +		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
>   				  DMA_BIDIRECTIONAL, 0);
>   		sg_free_table(xe_tt->sg);
>   		xe_tt->sg = NULL;
> @@ -336,21 +343,41 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
>   	return xe_tt->sg;
>   }
>   
> +/*
> + * Account ttm pages against the device shrinker's shrinkable and
> + * purgeable counts.
> + */
> +static void xe_ttm_tt_account(struct ttm_tt *tt, bool add)
> +{
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +	long num_pages = tt->num_pages;
> +
> +	if (!add)
> +		num_pages = -num_pages;
> +
> +	if (xe_tt->purgeable)
> +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, num_pages);
> +	else
> +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, num_pages, 0);
> +}
> +
>   static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   				       u32 page_flags)
>   {
>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>   	struct xe_device *xe = xe_bo_device(bo);
> -	struct xe_ttm_tt *tt;
> +	struct xe_ttm_tt *xe_tt;
> +	struct ttm_tt *tt;
>   	unsigned long extra_pages;
>   	enum ttm_caching caching;
>   	int err;
>   
> -	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> -	if (!tt)
> +	xe_tt = kzalloc(sizeof(*xe_tt), GFP_KERNEL);
> +	if (!xe_tt)
>   		return NULL;
>   
> -	tt->dev = xe->drm.dev;
> +	tt = &xe_tt->ttm;
> +	xe_tt->xe = xe;
>   
>   	extra_pages = 0;
>   	if (xe_bo_needs_ccs_pages(bo))
> @@ -387,42 +414,128 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   		caching = ttm_uncached;
>   	}
>   
> -	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
> +	if (ttm_bo->type != ttm_bo_type_sg)
> +		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
> +
> +	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
>   	if (err) {
> -		kfree(tt);
> +		kfree(xe_tt);
>   		return NULL;
>   	}
>   
> -	return &tt->ttm;
> +	tt->backup = ttm_backup_shmem_create(tt->num_pages << PAGE_SHIFT);

I guess we should make this (loff_t)tt->num_pages << PAGE_SHIFT or similar?
