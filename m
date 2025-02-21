Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BBA3F839
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5BA10EA8A;
	Fri, 21 Feb 2025 15:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VU6mbU4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5AF10EA8A;
 Fri, 21 Feb 2025 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740150943; x=1771686943;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5uZo2snuqFobD0NTh7s0kJswMXsR9Jax/B64S3T6Yvc=;
 b=VU6mbU4x8Q26LwG5XYilY5EqKaRnuezE0SLAWkQSO5Bh9Ur9fZIuDpdI
 uQ4TEyXl7VjQtMTJVKaiXVwEjW9bVTX8FVPg/Pj2U/Uaw0qU9k0XO3xDk
 CGYLy4egT1MZTnYjUXpFTvQ5Md9NaUsob+rUv24GOiSxiYZhzXvDTar9k
 jT6M/STAoLnt4l5QqBdP4lUdzUiPApNnmvWrQgPD5igzQndKr5NzMax5r
 SsBpqGHC2kS/f3QtZrajJitwi6WlC6gufFicKAerj48QvQ4GoRZGyMMBv
 WdXk8thQqVvK9OV4wJFY+svl0ZNib1vUTYTqWsuLwtd3Y4BOtNMGlBQu3 A==;
X-CSE-ConnectionGUID: XA7HYsOcRBarUtQm3NLsSA==
X-CSE-MsgGUID: gy72OIQeRYKWKBUhUsRuHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40892417"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="40892417"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:15:42 -0800
X-CSE-ConnectionGUID: LotcIppZTiuUKIBik6ZP4A==
X-CSE-MsgGUID: hY/P4O1QQBCu9EjMnxuyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="146247313"
Received: from sosterlu-desk.ger.corp.intel.com (HELO [10.245.245.44])
 ([10.245.245.44])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:15:40 -0800
Message-ID: <e8753d24-a0bd-4f53-bf56-d72475cb73ee@intel.com>
Date: Fri, 21 Feb 2025 15:15:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <3de5325a-147e-4126-970c-765884a1f6da@intel.com>
 <b04945011524a4ee614cd830928ceedf9f9b6293.camel@linux.intel.com>
 <Z7eIyFMKBeAHiPPE@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z7eIyFMKBeAHiPPE@lstrano-desk.jf.intel.com>
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

On 20/02/2025 19:55, Matthew Brost wrote:
> On Thu, Feb 20, 2025 at 04:59:29PM +0100, Thomas Hellström wrote:
>> On Thu, 2025-02-20 at 15:53 +0000, Matthew Auld wrote:
>>> On 13/02/2025 02:11, Matthew Brost wrote:
>>>> Migration is implemented with range granularity, with VRAM backing
>>>> being
>>>> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime
>>>> of the
>>>> TTM BO is limited to when the SVM range is in VRAM (i.e., when a
>>>> VRAM
>>>> SVM range is migrated to SRAM, the TTM BO is destroyed).
>>>>
>>>> The design choice for using TTM BO for VRAM backing store, as
>>>> opposed to
>>>> direct buddy allocation, is as follows:
>>>>
>>>> - DRM buddy allocations are not at page granularity, offering no
>>>>     advantage over a BO.
>>>> - Unified eviction is required (SVM VRAM and TTM BOs need to be
>>>> able to
>>>>     evict each other).
>>>> - For exhaustive eviction [1], SVM VRAM allocations will almost
>>>> certainly
>>>>     require a dma-resv.
>>>> - Likely allocation size is 2M which makes of size of BO (872)
>>>>     acceptable per allocation (872 / 2M == .0004158).
>>>>
>>>> With this, using TTM BO for VRAM backing store seems to be an
>>>> obvious
>>>> choice as it allows leveraging of the TTM eviction code.
>>>>
>>>> Current migration policy is migrate any SVM range greater than or
>>>> equal
>>>> to 64k once.
>>>>
>>>> [1] https://patchwork.freedesktop.org/series/133643/
>>>>
>>>> v2:
>>>>    - Rebase on latest GPU SVM
>>>>    - Retry page fault on get pages returning mixed allocation
>>>>    - Use drm_gpusvm_devmem
>>>> v3:
>>>>    - Use new BO flags
>>>>    - New range structure (Thomas)
>>>>    - Hide migration behind Kconfig
>>>>    - Kernel doc (Thomas)
>>>>    - Use check_pages_threshold
>>>> v4:
>>>>    - Don't evict partial unmaps in garbage collector (Thomas)
>>>>    - Use %pe to print errors (Thomas)
>>>>    - Use %p to print pointers (Thomas)
>>>> v5:
>>>>    - Use range size helper (Thomas)
>>>>    - Make BO external (Thomas)
>>>>    - Set tile to NULL for BO creation (Thomas)
>>>>    - Drop BO mirror flag (Thomas)
>>>>    - Hold BO dma-resv lock across migration (Auld, Thomas)
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_svm.c | 111
>>>> ++++++++++++++++++++++++++++++++++--
>>>>    drivers/gpu/drm/xe/xe_svm.h |   5 ++
>>>>    2 files changed, 112 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>>>> b/drivers/gpu/drm/xe/xe_svm.c
>>>> index 0a78a838508c..2e1e0f31c1a8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>> @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct
>>>> xe_svm_range *range)
>>>>    	return drm_gpusvm_range_end(&range->base);
>>>>    }
>>>>    
>>>> +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
>>>> +{
>>>> +	return drm_gpusvm_range_size(&range->base);
>>>> +}
>>>> +
>>>>    static void *xe_svm_devm_owner(struct xe_device *xe)
>>>>    {
>>>>    	return xe;
>>>> @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct
>>>> drm_gpusvm_devmem *devmem_allocatio
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -__maybe_unused
>>>>    static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>>>>    	.devmem_release = xe_svm_devmem_release,
>>>>    	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
>>>> @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct
>>>> xe_svm_range *range,
>>>>    	return (range->tile_present & ~range->tile_invalidated) &
>>>> BIT(tile->id);
>>>>    }
>>>>    
>>>> +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>>> +{
>>>> +	return &tile->mem.vram;
>>>> +}
>>>> +
>>>> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
>>>> xe_tile *tile,
>>>> +				       struct xe_svm_range *range,
>>>> +				       const struct drm_gpusvm_ctx
>>>> *ctx)
>>>> +{
>>>> +	struct mm_struct *mm = vm->svm.gpusvm.mm;
>>>> +	struct xe_vram_region *vr = tile_to_vr(tile);
>>>> +	struct drm_buddy_block *block;
>>>> +	struct list_head *blocks;
>>>> +	struct xe_bo *bo;
>>>> +	ktime_t end = 0;
>>>> +	int err;
>>>> +
>>>> +	if (!mmget_not_zero(mm))
>>>> +		return ERR_PTR(-EFAULT);
>>>> +	mmap_read_lock(mm);
>>>> +
>>>> +retry:
>>>> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
>>>> +				 xe_svm_range_size(range),
>>>> +				 ttm_bo_type_device,
>>>> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
>>>
>>> Just to confirm, there is nothing scary with the vram still
>>> potentially
>>> being used by the GPU at this point (like with an async eviction +
>>> clear
>>> op), right? At some point we have some kind of synchronisation before
>>> the user can touch this memory?
>>
>> Good point. I don't think there is.
>>
> 
> Agree - there shouldn't be anything scary happening here. The new VRAM
> is allocated from buddy which doesn't have dma-resv attached to it (and
> thus no outstanding fences) and creating a new dma-resv object. A clear
> is issued and then we do an immediate copy but those operations are
> serialized on the same queue.

So there is basically always a copy operation after this? Is is not 
possible to have completely empty entries on the CPU side such that 
there is nothing to actually copy?

> 
> Matt
> 
>>>
>>>> +	if (IS_ERR(bo)) {
>>>> +		err = PTR_ERR(bo);
>>>> +		if (xe_vm_validate_should_retry(NULL, err, &end))
>>>> +			goto retry;
>>>> +		goto unlock;
>>>> +	}
>>>> +
>>>> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
>>>> +			       vm->xe->drm.dev, mm,
>>>> +			       &gpusvm_devmem_ops,
>>>> +			       &tile->mem.vram.dpagemap,
>>>> +			       xe_svm_range_size(range));
>>>> +
>>>> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
>>>>> blocks;
>>>> +	list_for_each_entry(block, blocks, link)
>>>> +		block->private = vr;
>>>> +
>>>> +	/*
>>>> +	 * Take ref because as soon as
>>>> drm_gpusvm_migrate_to_devmem succeeds the
>>>> +	 * creation ref can be dropped upon CPU fault or unmap.
>>>> +	 */
>>>> +	xe_bo_get(bo);
>>>> +
>>>> +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
>>>> &range->base,
>>>> +					   &bo->devmem_allocation,
>>>> ctx);
>>>> +	xe_bo_unlock(bo);
>>>> +	if (err) {
>>>> +		xe_bo_put(bo);	/* Local ref */
>>>> +		xe_bo_put(bo);	/* Creation ref */
>>>> +		bo = ERR_PTR(err);
>>>> +	}
>>>> +
>>>> +unlock:
>>>> +	mmap_read_unlock(mm);
>>>> +	mmput(mm);
>>>> +
>>>> +	return bo;
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_svm_handle_pagefault() - SVM handle page fault
>>>>     * @vm: The VM.
>>>> @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct
>>>> xe_svm_range *range,
>>>>     * @fault_addr: The GPU fault address.
>>>>     * @atomic: The fault atomic access bit.
>>>>     *
>>>> - * Create GPU bindings for a SVM page fault.
>>>> + * Create GPU bindings for a SVM page fault. Optionally migrate to
>>>> device
>>>> + * memory.
>>>>     *
>>>>     * Return: 0 on success, negative error code on error.
>>>>     */
>>>> @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
>>>> struct xe_vma *vma,
>>>>    			    struct xe_tile *tile, u64 fault_addr,
>>>>    			    bool atomic)
>>>>    {
>>>> -	struct drm_gpusvm_ctx ctx = { .read_only =
>>>> xe_vma_read_only(vma), };
>>>> +	struct drm_gpusvm_ctx ctx = {
>>>> +		.read_only = xe_vma_read_only(vma),
>>>> +		.devmem_possible = IS_DGFX(vm->xe) &&
>>>> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>>>> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>>> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
>>>> SZ_64K : 0,
>>>> +	};
>>>>    	struct xe_svm_range *range;
>>>>    	struct drm_gpusvm_range *r;
>>>>    	struct drm_exec exec;
>>>>    	struct dma_fence *fence;
>>>> +	struct xe_bo *bo = NULL;
>>>>    	ktime_t end = 0;
>>>>    	int err;
>>>>    
>>>> @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
>>>> struct xe_vma *vma,
>>>>    	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>>>>    
>>>>    retry:
>>>> +	xe_bo_put(bo);
>>>> +	bo = NULL;
>>>> +
>>>>    	/* Always process UNMAPs first so view SVM ranges is
>>>> current */
>>>>    	err = xe_svm_garbage_collector(vm);
>>>>    	if (err)
>>>> @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
>>>> struct xe_vma *vma,
>>>>    	if (xe_svm_range_is_valid(range, tile))
>>>>    		return 0;
>>>>    
>>>> +	/* XXX: Add migration policy, for now migrate range once
>>>> */
>>>> +	if (!range->migrated && range->base.flags.migrate_devmem
>>>> &&
>>>> +	    xe_svm_range_size(range) >= SZ_64K) {
>>>> +		range->migrated = true;
>>>> +
>>>> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>>> +		if (IS_ERR(bo)) {
>>>> +			drm_info(&vm->xe->drm,
>>>> +				 "VRAM allocation failed, falling
>>>> back to retrying, asid=%u, errno %pe\n",
>>>> +				 vm->usm.asid, bo);
>>>> +			bo = NULL;
>>>> +			goto retry;
>>>> +		}
>>>> +	}
>>>> +
>>>>    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
>>>> &ctx);
>>>> -	if (err == -EFAULT || err == -EPERM)	/* Corner where
>>>> CPU mappings have changed */
>>>> +	/* Corner where CPU mappings have changed */
>>>> +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
>>>> {
>>>> +		if (err == -EOPNOTSUPP)
>>>> +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
>>>> &range->base);
>>>> +		drm_info(&vm->xe->drm,
>>>> +			 "Get pages failed, falling back to
>>>> retrying, asid=%u, gpusvm=%p, errno %pe\n",
>>>> +			 vm->usm.asid, &vm->svm.gpusvm,
>>>> ERR_PTR(err));
>>>>    		goto retry;
>>>> +	}
>>>>    	if (err)
>>>>    		goto err_out;
>>>>    
>>>> @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
>>>> struct xe_vma *vma,
>>>>    	dma_fence_put(fence);
>>>>    
>>>>    err_out:
>>>> +	xe_bo_put(bo);
>>>>    
>>>>    	return err;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h
>>>> b/drivers/gpu/drm/xe/xe_svm.h
>>>> index 0fa525d34987..984a61651d9e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>>> @@ -35,6 +35,11 @@ struct xe_svm_range {
>>>>    	 * range. Protected by GPU SVM notifier lock.
>>>>    	 */
>>>>    	u8 tile_invalidated;
>>>> +	/**
>>>> +	 * @migrated: Range has been migrated to device memory,
>>>> protected by
>>>> +	 * GPU fault handler locking.
>>>> +	 */
>>>> +	u8 migrated	:1;
>>>>    };
>>>>    
>>>>    int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
>>>
>>

