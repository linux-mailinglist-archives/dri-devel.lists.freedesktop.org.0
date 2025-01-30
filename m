Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABFA22F89
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 15:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E6810E98B;
	Thu, 30 Jan 2025 14:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Es7vPwS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801038924B;
 Thu, 30 Jan 2025 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738246981; x=1769782981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PE74vHnQne5VUV42hgwUYXWS5nlgBFa+nP4B1MIDu8g=;
 b=Es7vPwS5JKvlPRP/biWaEhs8dFtoooZa37Tf391uY/7C9EDOQirxokMP
 BrJClDh3eP8UexRcd1FC5UD+8lDLkbaXxcZ1i0TQYI8rkh03aBIxrHoS3
 r/rQ+3GZm77OIPND5SdmUyFkfpS8idzU9jo+BPMW2pErNTwWLXVUce9pw
 YxawOgLZZK08E5Yrs3zFG9VTHrlBfiXY4wtAogBUEdm+XDDWptA2rduw4
 5MoKZiFXGC+riXx1qSQQy01IXgOnhbFpOcVAxpHNhLX0H4q8NTsOilraJ
 aJ/Y4YLHNZhp0trlRW/pv5+l+yM8DM5ScO5oPvOSFd/wsWbhoaEJ+oDr2 Q==;
X-CSE-ConnectionGUID: he4wz+LcRO6a0UaQmnmIUA==
X-CSE-MsgGUID: icUrDBJ+RI6RUd3ewa6OtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="26395123"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="26395123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 06:23:00 -0800
X-CSE-ConnectionGUID: EoYYVc8MS0qAWFZYaNLwfg==
X-CSE-MsgGUID: xA4ClSBaTrO3q51OEtKg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146534318"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 06:22:57 -0800
Message-ID: <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
Date: Thu, 30 Jan 2025 14:22:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/33] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-29-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250129195212.745731-29-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29/01/2025 19:52, Matthew Brost wrote:
> Migration is implemented with range granularity, with VRAM backing being
> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> SVM range is migrated to SRAM, the TTM BO is destroyed).
> 
> The design choice for using TTM BO for VRAM backing store, as opposed to
> direct buddy allocation, is as follows:
> 
> - DRM buddy allocations are not at page granularity, offering no
>    advantage over a BO.
> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>    evict each other).
> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>    require a dma-resv.
> - Likely allocation size is 2M which makes of size of BO (872)
>    acceptable per allocation (872 / 2M == .0004158).
> 
> With this, using TTM BO for VRAM backing store seems to be an obvious
> choice as it allows leveraging of the TTM eviction code.
> 
> Current migration policy is migrate any SVM range greater than or equal
> to 64k once.
> 
> [1] https://patchwork.freedesktop.org/series/133643/
> 
> v2:
>   - Rebase on latest GPU SVM
>   - Retry page fault on get pages returning mixed allocation
>   - Use drm_gpusvm_devmem
> v3:
>   - Use new BO flags
>   - New range structure (Thomas)
>   - Hide migration behind Kconfig
>   - Kernel doc (Thomas)
>   - Use check_pages_threshold
> v4:
>   - Don't evict partial unmaps in garbage collector (Thomas)
>   - Use %pe to print errors (Thomas)
>   - Use %p to print pointers (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 99 +++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_svm.h |  5 ++
>   2 files changed, 100 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ba1db030bf33..fc030855d078 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -502,7 +502,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>   	return 0;
>   }
>   
> -__maybe_unused
>   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>   	.devmem_release = xe_svm_devmem_release,
>   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> @@ -582,6 +581,64 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>   	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>   }
>   
> +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +				       struct xe_svm_range *range,
> +				       const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct xe_mem_region *mr = tile_to_mr(tile);
> +	struct drm_buddy_block *block;
> +	struct list_head *blocks;
> +	struct xe_bo *bo;
> +	ktime_t end = 0;
> +	int err;
> +
> +retry:
> +	xe_vm_lock(vm, false);
> +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.itree.last + 1 -
> +			  range->base.itree.start, ttm_bo_type_device,
> +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +			  XE_BO_FLAG_CPU_ADDR_MIRROR);
> +	xe_vm_unlock(vm);

What was the trick again to ensure eviction is not triggered at this 
point? I thought there was some trick with eviction_valuable() but I 
can't find it.

> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
> +		return bo;
> +	}
> +
> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> +			       vm->xe->drm.dev, vm->svm.gpusvm.mm,
> +			       &gpusvm_devmem_ops,
> +			       &tile->mem.vram.dpagemap,
> +			       range->base.itree.last + 1 -
> +			       range->base.itree.start);
> +
> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private = mr;
> +
> +	/*
> +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
> +	 * creation ref can be dropped upon CPU fault or unmap.
> +	 */
> +	xe_bo_get(bo);
> +
> +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> +					   &bo->devmem_allocation, ctx);
> +	if (err) {
> +		xe_bo_put(bo);	/* Local ref */
> +		xe_bo_put(bo);	/* Creation ref */
> +		return ERR_PTR(err);
> +	}
> +
> +	return bo;
> +}
> +
>   /**
>    * xe_svm_handle_pagefault() - SVM handle page fault
>    * @vm: The VM.
> @@ -590,7 +647,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>    * @fault_addr: The GPU fault address.
>    * @atomic: The fault atomic access bit.
>    *
> - * Create GPU bindings for a SVM page fault.
> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> + * memory.
>    *
>    * Return: 0 on success, negative error code on error.
>    */
> @@ -598,11 +656,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			    struct xe_tile *tile, u64 fault_addr,
>   			    bool atomic)
>   {
> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +		.devmem_possible = IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
> +	struct xe_bo *bo = NULL;
>   	ktime_t end = 0;
>   	int err;
>   
> @@ -610,6 +675,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>   
>   retry:
> +	xe_bo_put(bo);
> +	bo = NULL;
> +
>   	/* Always process UNMAPs first so view SVM ranges is current */
>   	err = xe_svm_garbage_collector(vm);
>   	if (err)
> @@ -625,9 +693,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (xe_svm_range_is_valid(range, tile))
>   		return 0;
>   
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (!range->migrated && range->base.flags.migrate_devmem &&
> +	    (range->base.itree.last + 1 - range->base.itree.start) >= SZ_64K) {
> +		range->migrated = true;
> +
> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (IS_ERR(bo)) {
> +			drm_info(&vm->xe->drm,
> +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
> +				 vm->usm.asid, bo);
> +			bo = NULL;
> +			goto retry;
> +		}
> +	}
> +
>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> +	/* Corner where CPU mappings have changed */
> +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> +		if (err == -EOPNOTSUPP)
> +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +		drm_info(&vm->xe->drm,
> +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>   		goto retry;
> +	}
>   	if (err)
>   		goto err_out;
>   
> @@ -658,6 +748,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	dma_fence_put(fence);
>   
>   err_out:
> +	xe_bo_put(bo);
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 63daffdfdbf6..4c2576162c39 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -35,6 +35,11 @@ struct xe_svm_range {
>   	 * range. Protected by GPU SVM notifier lock.
>   	 */
>   	u8 tile_invalidated;
> +	/**
> +	 * @migrated: Range has been migrated to device memory, protected by
> +	 * GPU fault handler locking.
> +	 */
> +	u8 migrated	:1;
>   };
>   
>   int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);

