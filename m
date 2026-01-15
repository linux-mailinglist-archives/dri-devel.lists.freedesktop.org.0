Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200CD24272
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 12:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FD910E749;
	Thu, 15 Jan 2026 11:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 797C410E747
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 11:24:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EFCFFEC;
 Thu, 15 Jan 2026 03:24:49 -0800 (PST)
Received: from [10.1.35.30] (e122027.cambridge.arm.com [10.1.35.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF943F694;
 Thu, 15 Jan 2026 03:24:51 -0800 (PST)
Message-ID: <fe39739e-25fc-429d-ab4d-37c4fc387be4@arm.com>
Date: Thu, 15 Jan 2026 11:24:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <2e446bc2-e3db-4c37-b05c-c46d5782321a@arm.com>
 <20260115115043.0814268e@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260115115043.0814268e@fedora>
Content-Type: text/plain; charset=UTF-8
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

On 15/01/2026 10:50, Boris Brezillon wrote:
> Hi Steve,
> 
> On Wed, 14 Jan 2026 15:05:36 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 09/01/2026 13:08, Boris Brezillon wrote:
[...]
>>> @@ -1250,10 +1637,42 @@ static struct drm_info_list panthor_gem_debugfs_list[] = {
>>>  	{ "gems", panthor_gem_show_bos, 0, NULL },
>>>  };
>>>  
>>> +static int shrink_get(void *data, u64 *val)
>>> +{
>>> +	struct panthor_device *ptdev =
>>> +		container_of(data, struct panthor_device, base);
>>> +
>>> +	*val = ptdev->reclaim.nr_pages_reclaimed_on_last_scan;
>>> +	return 0;
>>> +}
>>> +
>>> +static int shrink_set(void *data, u64 val)
>>> +{
>>> +	struct panthor_device *ptdev =
>>> +		container_of(data, struct panthor_device, base);
>>> +	struct shrink_control sc = {
>>> +		.gfp_mask = GFP_KERNEL,
>>> +		.nr_to_scan = val,
>>> +	};
>>> +
>>> +	fs_reclaim_acquire(GFP_KERNEL);
>>> +	if (ptdev->reclaim.shrinker)
>>> +		panthor_gem_shrinker_scan(ptdev->reclaim.shrinker, &sc);
>>> +	fs_reclaim_release(GFP_KERNEL);
>>> +
>>> +	return 0;
>>> +}  
>>
>> Do you have some test to drive this?
> 
> Yes, I do [1].
> 
>> My immediate thought was that it
>> would be nice (for manual testing at least) to printk the return value
>> from panthor_gem_shrinker_scan(). But we probably wouldn't actually need
>> nr_pages_reclaimed_on_last_scan if you could just read that from dmesg.
>> But I can see integrating that into a test might not be ideal.
> 
> I basically based the interface on the existing MSM one. Might not be
> the best, but it was good enough for this initial testing.

Ah well if we're matching MSM then that's probably a good justification.
It just seemed a little odd throwing away the return value and then
having to have a separate mechanism to get the number of pages reclaimed
out. And given I'd just spotted a bug in the return value I thought I'd
ask ;)

>>
>>> +
>>> +DEFINE_DEBUGFS_ATTRIBUTE(panthor_gem_debugfs_shrink_fops,
>>> +			 shrink_get, shrink_set,
>>> +			 "0x%08llx\n");
>>> +
>>>  void panthor_gem_debugfs_init(struct drm_minor *minor)
>>>  {
>>>  	drm_debugfs_create_files(panthor_gem_debugfs_list,
>>>  				 ARRAY_SIZE(panthor_gem_debugfs_list),
>>>  				 minor->debugfs_root, minor);
>>> +	debugfs_create_file("shrink", 0600, minor->debugfs_root,
>>> +			    minor->dev, &panthor_gem_debugfs_shrink_fops);
>>>  }
>>>  #endif
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
>>> index c0a18dca732c..6cb5b597ff1e 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
>>> @@ -1,6 +1,7 @@
>>>  /* SPDX-License-Identifier: GPL-2.0 or MIT */
>>>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>>  /* Copyright 2023 Collabora ltd. */
>>> +/* Copyright 2025 ARM Limited. All rights reserved. */
>>>  
>>>  #ifndef __PANTHOR_GEM_H__
>>>  #define __PANTHOR_GEM_H__
>>> @@ -93,6 +94,62 @@ struct panthor_gem_dev_map {
>>>  	struct sg_table *sgt;
>>>  };
>>>  
>>> +/**
>>> + * enum panthor_gem_reclaim_state - Reclaim state of a GEM object
>>> + *
>>> + * This is defined in descending reclaimability order and some part
>>> + * of the code depends on that.
>>> + */
>>> +enum panthor_gem_reclaim_state {
>>> +	/**
>>> +	 * @PANTHOR_GEM_UNUSED: GEM is currently unused
>>> +	 *
>>> +	 * This can happen when the GEM was previously vmap-ed, mmap-ed,
>>> +	 * and/or GPU mapped and got unmapped. Because pages are lazily
>>> +	 * returned to the shmem layer, we want to keep a list of such
>>> +	 * BOs, because they should be fairly easy to reclaim (no need
>>> +	 * to wait for GPU to be done, and no need to tear down user
>>> +	 * mappings either).
>>> +	 */
>>> +	PANTHOR_GEM_UNUSED,
>>> +
>>> +	/**
>>> +	 * @PANTHOR_GEM_MMAPPED: GEM is currently mmap-ed
>>> +	 *
>>> +	 * When a GEM has pages allocated and the mmap_count is > 0, the
>>> +	 * GEM is placed in the mmapped list. This comes right after
>>> +	 * unused because we can relatively easily tear down user mappings.
>>> +	 */
>>> +	PANTHOR_GEM_MMAPPED,
>>> +
>>> +	/**
>>> +	 * @PANTHOR_GEM_GPU_MAPPED_PRIVATE: GEM is GPU mapped to only one VM
>>> +	 *
>>> +	 * When a GEM is mapped to a single VM, reclaim requests have more
>>> +	 * chances to succeed, because we only need to synchronize against
>>> +	 * a single GPU context. This is more annoying than reclaiming
>>> +	 * mmap-ed pages still, because we have to wait for in-flight jobs
>>> +	 * to land, and we might not be able to acquire all necessary locks
>>> +	 * at reclaim time either.
>>> +	 */
>>> +	PANTHOR_GEM_GPU_MAPPED_PRIVATE,
>>> +
>>> +	/**
>>> +	 * @PANTHOR_GEM_GPU_MAPPED_SHARED: GEM is GPU mapped to multiple VMs
>>> +	 *
>>> +	 * Like PANTHOR_GEM_GPU_MAPPED_PRIVATE, but the synchronization across
>>> +	 * VMs makes such BOs harder to reclaim.
>>> +	 */
>>> +	PANTHOR_GEM_GPU_MAPPED_SHARED,
>>> +
>>> +	/**
>>> +	 * @PANTHOR_GEM_UNRECLAIMABLE: GEM can't be reclaimed
>>> +	 *
>>> +	 * Happens when the GEM memory is pinned.  
>>
>> Also the initial state when creating a GEM object (which I found
>> non-obvious at least).
> 
> It's mostly because GEMs start being unpopulated, so there's nothing to
> reclaim (hence the unreclaimable) until pages are requested. I'll add a
> sentence to make that clear.

Yeah it makes perfect sense - I'd just read the descriptions and none
had mentioned being the start state so I'd assumed '0' and "unused"
makes some sense.

However (and you've already got a comment above that I didn't think
through when I first read the code) these are actually sorted in
reclaimability and fairly obvious a just created GEM object isn't
reclaimable because there's nothing to reclaim. So a comment here would
be appreciated for the future when I've forgotten everything ;)

>>
>>> +	 */
>>> +	PANTHOR_GEM_UNRECLAIMABLE,
>>> +};
>>> +
>>>  /**
>>>   * struct panthor_gem_object - Driver specific GEM object.
>>>   */
>>> @@ -109,6 +166,9 @@ struct panthor_gem_object {
>>>  	/** @dmap: Device mapping state */
>>>  	struct panthor_gem_dev_map dmap;
>>>  
>>> +	/** @reclaim_state: Cached reclaim state */
>>> +	enum panthor_gem_reclaim_state reclaim_state;
>>> +
>>>  	/**
>>>  	 * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM object
>>>  	 * is attached to.
>>> @@ -190,6 +250,13 @@ struct sg_table *
>>>  panthor_gem_get_dev_sgt(struct panthor_gem_object *bo);
>>>  int panthor_gem_pin(struct panthor_gem_object *bo);
>>>  void panthor_gem_unpin(struct panthor_gem_object *bo);
>>> +int panthor_gem_swapin_locked(struct panthor_gem_object *bo);
>>> +void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
>>> +					     enum panthor_gem_reclaim_state *old_state);
>>> +bool panthor_gem_try_evict(struct drm_gem_object *obj,
>>> +			   struct ww_acquire_ctx *ticket);
>>> +int panthor_gem_shrinker_init(struct panthor_device *ptdev);
>>> +void panthor_gem_shrinker_unplug(struct panthor_device *ptdev);
>>>  
>>>  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
>>>  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 3290e0b5facb..ffd821b3be46 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -1,6 +1,7 @@
>>>  // SPDX-License-Identifier: GPL-2.0 or MIT
>>>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>>  /* Copyright 2023 Collabora ltd. */
>>> +/* Copyright 2025 ARM Limited. All rights reserved. */
>>>  
>>>  #include <drm/drm_debugfs.h>
>>>  #include <drm/drm_drv.h>
>>> @@ -131,6 +132,9 @@ struct panthor_vma {
>>>  	 * Only map related flags are accepted.
>>>  	 */
>>>  	u32 flags;
>>> +
>>> +	/** @evicted: True if the VMA has been evicted. */
>>> +	bool evicted;
>>>  };
>>>  
>>>  /**
>>> @@ -191,13 +195,8 @@ struct panthor_vm_op_ctx {
>>>  		/** @map.bo_offset: Offset in the buffer object. */
>>>  		u64 bo_offset;
>>>  
>>> -		/**
>>> -		 * @map.sgt: sg-table pointing to pages backing the GEM object.
>>> -		 *
>>> -		 * This is gathered at job creation time, such that we don't have
>>> -		 * to allocate in ::run_job().
>>> -		 */
>>> -		struct sg_table *sgt;
>>> +		/** @map.bo: the BO being mapped. */
>>> +		struct panthor_gem_object *bo;
>>>  
>>>  		/**
>>>  		 * @map.new_vma: The new VMA object that will be inserted to the VA tree.
>>> @@ -385,6 +384,18 @@ struct panthor_vm {
>>>  		/** @locked_region.size: Size of the locked region. */
>>>  		u64 size;
>>>  	} locked_region;
>>> +
>>> +	/** @reclaim: Fields related to BO reclaim. */
>>> +	struct {
>>> +		/** @reclaim.lru: LRU of BOs that are only mapped to this VM. */
>>> +		struct drm_gem_lru lru;
>>> +
>>> +		/**
>>> +		 * @reclaim.lru_node: Node used to insert the VM in
>>> +		 * panthor_device::reclaim::vms.
>>> +		 */
>>> +		struct list_head lru_node;
>>> +	} reclaim;
>>>  };
>>>  
>>>  /**
>>> @@ -678,6 +689,16 @@ int panthor_vm_active(struct panthor_vm *vm)
>>>  	if (refcount_inc_not_zero(&vm->as.active_cnt))
>>>  		goto out_dev_exit;
>>>  
>>> +	/* As soon as active is called, we place the VM as the end of the VM LRU.
>>> +	 * If something fails after that, the only downside is that this VM that
>>> +	 * never became active in the first place will be reclaimed last, but
>>> +	 * that's an acceptable trade-off.
>>> +	 */
>>> +	mutex_lock(&ptdev->reclaim.lock);
>>> +	if (vm->reclaim.lru.count)
>>> +		list_move_tail(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
>>> +	mutex_unlock(&ptdev->reclaim.lock);
>>> +
>>>  	/* Make sure we don't race with lock/unlock_region() calls
>>>  	 * happening around VM bind operations.
>>>  	 */
>>> @@ -1074,7 +1095,15 @@ static void panthor_vm_bo_free(struct drm_gpuvm_bo *vm_bo)
>>>  {
>>>  	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
>>>  
>>> -	panthor_gem_unpin(bo);
>>> +	/* We couldn't call this when we unlinked, because the resv lock can't
>>> +	 * be taken in the dma signalling path, so call it now.
>>> +	 */
>>> +	dma_resv_lock(bo->base.resv, NULL);
>>> +	mutex_lock(&bo->base.gpuva.lock);
>>> +	panthor_gem_update_reclaim_state_locked(bo, NULL);
>>> +	mutex_unlock(&bo->base.gpuva.lock);
>>> +	dma_resv_unlock(bo->base.resv);
>>> +
>>>  	kfree(vm_bo);
>>>  }
>>>  
>>> @@ -1095,6 +1124,11 @@ static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>>>  	if (op_ctx->map.vm_bo)
>>>  		drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
>>>  
>>> +	if (op_ctx->map.bo) {
>>> +		panthor_gem_unpin(op_ctx->map.bo);
>>> +		drm_gem_object_put(&op_ctx->map.bo->base);
>>> +	}
>>> +
>>>  	for (u32 i = 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++)
>>>  		kfree(op_ctx->preallocated_vmas[i]);
>>>  
>>> @@ -1255,18 +1289,17 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>>>  	if (ret)
>>>  		goto err_cleanup;
>>>  
>>> +	drm_gem_object_get(&bo->base);
>>> +	op_ctx->map.bo = bo;
>>> +
>>>  	sgt = panthor_gem_get_dev_sgt(bo);
>>>  	if (IS_ERR(sgt)) {
>>> -		panthor_gem_unpin(bo);
>>>  		ret = PTR_ERR(sgt);
>>>  		goto err_cleanup;
>>>  	}
>>>  
>>> -	op_ctx->map.sgt = sgt;
>>> -
>>>  	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base);
>>>  	if (!preallocated_vm_bo) {
>>> -		panthor_gem_unpin(bo);
>>>  		ret = -ENOMEM;
>>>  		goto err_cleanup;
>>>  	}
>>> @@ -1280,9 +1313,19 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>>>  	dma_resv_lock(panthor_vm_resv(vm), NULL);
>>>  	mutex_lock(&bo->base.gpuva.lock);
>>>  	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
>>> +	if (panthor_vm_resv(vm) == bo->base.resv)
>>> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
>>>  	mutex_unlock(&bo->base.gpuva.lock);
>>>  	dma_resv_unlock(panthor_vm_resv(vm));
>>>  
>>> +	if (panthor_vm_resv(vm) != bo->base.resv) {
>>> +		dma_resv_lock(bo->base.resv, NULL);
>>> +		mutex_lock(&bo->base.gpuva.lock);
>>> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
>>> +		mutex_unlock(&bo->base.gpuva.lock);
>>> +		dma_resv_unlock(bo->base.resv);
>>> +	}
>>> +
>>>  	op_ctx->map.bo_offset = offset;
>>>  
>>>  	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
>>> @@ -1891,6 +1934,10 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
>>>  	struct panthor_vm *vm = container_of(gpuvm, struct panthor_vm, base);
>>>  	struct panthor_device *ptdev = vm->ptdev;
>>>  
>>> +	mutex_lock(&ptdev->reclaim.lock);
>>> +	list_del_init(&vm->reclaim.lru_node);
>>> +	mutex_unlock(&ptdev->reclaim.lock);
>>> +
>>>  	mutex_lock(&vm->heaps.lock);
>>>  	if (drm_WARN_ON(&ptdev->base, vm->heaps.pool))
>>>  		panthor_heap_pool_destroy(vm->heaps.pool);
>>> @@ -2104,7 +2151,7 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>>>  	panthor_vma_init(vma, op_ctx->flags & PANTHOR_VM_MAP_FLAGS);
>>>  
>>>  	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
>>> -				   op_ctx->map.sgt, op->map.gem.offset,
>>> +				   op_ctx->map.bo->dmap.sgt, op->map.gem.offset,
>>>  				   op->map.va.range);
>>>  	if (ret) {
>>>  		panthor_vm_op_ctx_return_vma(op_ctx, vma);
>>> @@ -2188,8 +2235,10 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>>>  	 * atomicity. panthor_vm_lock_region() bails out early if the new region
>>>  	 * is already part of the locked region, so no need to do this check here.
>>>  	 */
>>> -	panthor_vm_lock_region(vm, unmap_start, unmap_range);
>>> -	panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>>> +	if (!unmap_vma->evicted) {
>>> +		panthor_vm_lock_region(vm, unmap_start, unmap_range);
>>> +		panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>>> +	}
>>>  
>>>  	if (op->remap.prev) {
>>>  		struct panthor_gem_object *bo = to_panthor_bo(op->remap.prev->gem.obj);
>>> @@ -2203,6 +2252,7 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>>>  
>>>  		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
>>>  		panthor_vma_init(prev_vma, unmap_vma->flags);
>>> +		prev_vma->evicted = unmap_vma->evicted;
>>>  	}
>>>  
>>>  	if (op->remap.next) {
>>> @@ -2217,6 +2267,7 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>>>  
>>>  		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
>>>  		panthor_vma_init(next_vma, unmap_vma->flags);
>>> +		next_vma->evicted = unmap_vma->evicted;
>>>  	}
>>>  
>>>  	drm_gpuva_remap(prev_vma ? &prev_vma->base : NULL,
>>> @@ -2246,19 +2297,197 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
>>>  	struct panthor_vma *unmap_vma = container_of(op->unmap.va, struct panthor_vma, base);
>>>  	struct panthor_vm *vm = priv;
>>>  
>>> -	panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
>>> -			       unmap_vma->base.va.range);
>>> +	if (!unmap_vma->evicted) {
>>> +		panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
>>> +				       unmap_vma->base.va.range);
>>> +	}
>>> +
>>>  	drm_gpuva_unmap(&op->unmap);
>>>  	panthor_vma_unlink(unmap_vma);
>>>  	return 0;
>>>  }
>>>  
>>> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
>>> +	struct panthor_vm *vm = NULL;
>>> +	struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +	lockdep_assert_held(&bo->base.gpuva.lock);
>>> +
>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
>>> +		/* We're only supposed to have one vm_bo in the list if we get there. */
>>> +		drm_WARN_ON(&ptdev->base, vm);
>>> +		vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +
>>> +		mutex_lock(&ptdev->reclaim.lock);
>>> +		drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base);
>>> +		if (list_empty(&vm->reclaim.lru_node))
>>> +			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
>>> +		mutex_unlock(&ptdev->reclaim.lock);
>>> +	}
>>> +}
>>> +
>>> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
>>> +		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +		struct drm_gpuva *va;
>>> +
>>> +		if (!mutex_trylock(&vm->op_lock))
>>> +			return -EDEADLK;
>>> +
>>> +		drm_gpuvm_bo_evict(vm_bo, true);
>>> +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
>>> +
>>> +			panthor_vm_lock_region(vm, va->va.addr, va->va.range);
>>> +			panthor_vm_unmap_pages(vm, va->va.addr, va->va.range);
>>> +			panthor_vm_unlock_region(vm);
>>> +			vma->evicted = true;
>>> +		}
>>> +
>>> +		mutex_unlock(&vm->op_lock);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static struct panthor_vma *select_evicted_vma(struct drm_gpuvm_bo *vm_bo,
>>> +					      struct panthor_vm_op_ctx *op_ctx)
>>> +{
>>> +	struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +	struct panthor_vma *first_evicted_vma = NULL;
>>> +	struct drm_gpuva *va;
>>> +
>>> +	/* Take op_lock to protect against va insertion/removal. */
>>> +	mutex_lock(&vm->op_lock);
>>> +	drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +		struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
>>> +
>>> +		if (vma->evicted) {
>>> +			first_evicted_vma = vma;
>>> +			panthor_vm_init_op_ctx(op_ctx, va->va.range, va->va.addr, vma->flags);
>>> +			op_ctx->map.bo_offset = va->gem.offset;
>>> +			break;
>>> +		}
>>> +	}
>>> +	mutex_unlock(&vm->op_lock);
>>> +
>>> +	return first_evicted_vma;
>>> +}
>>> +
>>> +static int remap_evicted_vma(struct drm_gpuvm_bo *vm_bo,
>>> +			     struct panthor_vma *evicted_vma,
>>> +			     struct panthor_vm_op_ctx *op_ctx)
>>> +{
>>> +	struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
>>> +	struct drm_gpuva *va;
>>> +	bool found = false;
>>> +	int ret;
>>> +
>>> +	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
>>> +	if (ret)
>>> +		goto out_cleanup;
>>> +
>>> +	/* Take op_lock to protect against va insertion/removal. */
>>> +	mutex_lock(&vm->op_lock);
>>> +	drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +		struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
>>> +
>>> +		if (vma != evicted_vma)
>>> +			continue;
>>> +
>>> +		/* We can't rely solely on pointer equality, because the VMA might have been
>>> +		 * freed and a new one allocated at the same address. If the evicted bit
>>> +		 * is still set, we're sure it's our VMA, because population/eviction is
>>> +		 * serialized with the BO resv lock.
>>> +		 */
>>> +		if (vma->evicted)
>>> +			found = true;
>>> +
>>> +		break;
>>> +	}
>>> +
>>> +	if (found) {
>>> +		vm->op_ctx = op_ctx;
>>> +		ret = panthor_vm_lock_region(vm, evicted_vma->base.va.addr,
>>> +					     evicted_vma->base.va.range);
>>> +		if (!ret) {
>>> +			ret = panthor_vm_map_pages(vm, evicted_vma->base.va.addr,
>>> +						   flags_to_prot(evicted_vma->flags),
>>> +						   bo->dmap.sgt,
>>> +						   evicted_vma->base.gem.offset,
>>> +						   evicted_vma->base.va.range);
>>> +		}
>>> +
>>> +		if (!ret)
>>> +			evicted_vma->evicted = false;
>>> +
>>> +		panthor_vm_unlock_region(vm);
>>> +		vm->op_ctx = NULL;
>>> +	}
>>> +
>>> +	mutex_unlock(&vm->op_lock);
>>> +
>>> +out_cleanup:
>>> +	panthor_vm_cleanup_op_ctx(op_ctx, vm);
>>> +	return ret;
>>> +}
>>> +
>>> +static int panthor_vm_restore_vmas(struct drm_gpuvm_bo *vm_bo)
>>> +{
>>> +	struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
>>> +	struct panthor_vm_op_ctx op_ctx;
>>> +
>>> +	if (drm_WARN_ON_ONCE(&vm->ptdev->base, !bo->dmap.sgt))
>>> +		return -EINVAL;
>>> +
>>> +	for (struct panthor_vma *vma = select_evicted_vma(vm_bo, &op_ctx);
>>> +	     vma; vma = select_evicted_vma(vm_bo, &op_ctx)) {
>>> +		int ret;
>>> +
>>> +		ret = remap_evicted_vma(vm_bo, vma, &op_ctx);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int panthor_vm_bo_validate(struct drm_gpuvm_bo *vm_bo,
>>> +				  struct drm_exec *exec)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
>>> +	int ret;
>>> +
>>> +	ret = panthor_gem_swapin_locked(bo);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = panthor_vm_restore_vmas(vm_bo);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	drm_gpuvm_bo_evict(vm_bo, false);
>>> +	mutex_lock(&bo->base.gpuva.lock);
>>> +	panthor_gem_update_reclaim_state_locked(bo, NULL);
>>> +	mutex_unlock(&bo->base.gpuva.lock);
>>> +	return 0;
>>> +}
>>> +
>>>  static const struct drm_gpuvm_ops panthor_gpuvm_ops = {
>>>  	.vm_free = panthor_vm_free,
>>>  	.vm_bo_free = panthor_vm_bo_free,
>>>  	.sm_step_map = panthor_gpuva_sm_step_map,
>>>  	.sm_step_remap = panthor_gpuva_sm_step_remap,
>>>  	.sm_step_unmap = panthor_gpuva_sm_step_unmap,
>>> +	.vm_bo_validate = panthor_vm_bo_validate,
>>>  };
>>>  
>>>  /**
>>> @@ -2473,6 +2702,8 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>>>  	vm->kernel_auto_va.start = auto_kernel_va_start;
>>>  	vm->kernel_auto_va.end = vm->kernel_auto_va.start + auto_kernel_va_size - 1;
>>>  
>>> +	drm_gem_lru_init(&vm->reclaim.lru, &ptdev->reclaim.lock);
>>> +	INIT_LIST_HEAD(&vm->reclaim.lru_node);
>>>  	INIT_LIST_HEAD(&vm->node);
>>>  	INIT_LIST_HEAD(&vm->as.lru_node);
>>>  	vm->as.id = -1;
>>> @@ -2820,7 +3051,78 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
>>> +	ret = drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return drm_gpuvm_validate(&vm->base, exec);
>>> +}
>>> +
>>> +unsigned long
>>> +panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
>>> +			     unsigned int nr_to_scan, unsigned long *remaining,
>>> +			     bool (*shrink)(struct drm_gem_object *,
>>> +					    struct ww_acquire_ctx *))
>>> +{
>>> +	unsigned long freed = 0;
>>> +	LIST_HEAD(remaining_vms);
>>> +	LIST_HEAD(vms);
>>> +
>>> +	mutex_lock(&ptdev->reclaim.lock);
>>> +	list_splice_init(&ptdev->reclaim.vms, &vms);
>>> +
>>> +	while (freed < nr_to_scan) {
>>> +		struct panthor_vm *vm;
>>> +
>>> +		vm = list_first_entry_or_null(&vms, typeof(*vm),
>>> +					      reclaim.lru_node);
>>> +		if (!vm)
>>> +			break;
>>> +
>>> +		if (!kref_get_unless_zero(&vm->base.kref)) {
>>> +			list_del_init(&vm->reclaim.lru_node);
>>> +			continue;
>>> +		}
>>> +
>>> +		mutex_unlock(&ptdev->reclaim.lock);
>>> +
>>> +		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
>>> +					  remaining, shrink, NULL);
>>> +
>>> +		mutex_lock(&ptdev->reclaim.lock);
>>> +
>>> +		/* If the VM is still in the temporary list, remove it so we
>>> +		 * can proceed with the next VM.
>>> +		 */
>>> +		if (vm->reclaim.lru_node.prev == &vms) {
>>> +			list_del_init(&vm->reclaim.lru_node);
>>> +
>>> +			/* Keep the VM around if there are still things to
>>> +			 * reclaim, so we can preserve the LRU order when
>>> +			 * re-inserting in ptdev->reclaim.vms at the end.
>>> +			 */
>>> +			if (vm->reclaim.lru.count > 0)
>>> +				list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
>>> +		}
>>> +
>>> +		mutex_unlock(&ptdev->reclaim.lock);
>>> +
>>> +		panthor_vm_put(vm);
>>> +
>>> +		mutex_lock(&ptdev->reclaim.lock);
>>> +	}
>>> +
>>> +	/* Re-insert VMs with remaining data to reclaim at the beginning of
>>> +	 * the LRU. Note that any activeness change on the VM that happened
>>> +	 * while we were reclaiming would have moved the VM out of our
>>> +	 * temporary [remaining_]vms list, meaning anything we re-insert here
>>> +	 * preserves the LRU order.
>>> +	 */
>>> +	list_splice_tail(&vms, &remaining_vms);
>>> +	list_splice(&remaining_vms, &ptdev->reclaim.vms);
>>> +	mutex_unlock(&ptdev->reclaim.lock);
>>> +
>>> +	return freed;
>>>  }
>>>  
>>>  /**
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
>>> index 0e268fdfdb2f..3522fbbce369 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
>>> @@ -1,6 +1,7 @@
>>>  /* SPDX-License-Identifier: GPL-2.0 or MIT */
>>>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>>  /* Copyright 2023 Collabora ltd. */
>>> +/* Copyright 2025 ARM Limited. All rights reserved. */
>>>  
>>>  #ifndef __PANTHOR_MMU_H__
>>>  #define __PANTHOR_MMU_H__
>>> @@ -46,6 +47,13 @@ struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>>>  				     u64 kernel_auto_va_start,
>>>  				     u64 kernel_auto_va_size);
>>>  
>>> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo);
>>> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
>>> +unsigned long
>>> +panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
>>> +			     unsigned int nr_to_scan, unsigned long *remaining,
>>> +			     bool (*shrink)(struct drm_gem_object *,
>>> +					    struct ww_acquire_ctx *));
>>>  int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
>>>  					struct panthor_vm *vm,
>>>  					u32 slot_count);  
>>
>> I *think* there's an issue with objects being evicted then accessed by
>> mmap() or vmap. There's a call to drm_gpuvm_bo_evict(..., true) in
>> panthor_vm_evict_bo_mappings_locked() to evict, but the only
>> "de-eviction" (i.e. drm_gpuvm_bo_evict(..., false)) is
>> panthor_vm_bo_validate() which is called on the submission path but not
>> from other paths.
> 
> So, we don't allow vmap() reclaims yet (we pin on vmap()). That's
> something to add as a follow-up if we really care (MSM has something
> for that), but there's not many BOs that are vmap()-ed for a long period
> of time other than FW ones, and most of those can't be reclaimed anyway,
> expect maybe for the CSG buffers, but those should account for a very
> minimal of memory compared to the rest.
> 
> For mmap(), I'd expect the eviction to kill the user mappings, causing
> a fault on the next access, at which point we do repopulate. Now, we
> don't set the evicted bit back to zero just yet, because the GPU
> mapping is still gone, but this means the de-eviction on the next
> submit will only have half of the work to do (creating the sgt, and
> updating the page table).
> 
>>
>> If this is right then on the next submission panthor_gem_swapin_locked()
>> will it the WARN_ON for the pin_count being non-zero.
> 
> I see. So if the BO is vmap()ed before the next submit we will
> indeed hit this path. Maybe we should get rid of this WARN_ON() and keep
> going instead of returning EINVAL in that case.
> 
>>
>> I have to admit to being very unsure about all of this - I even resorted
>> to asking AI, which I think has made me more confused ;)
> 
> I think you're right that we shouldn't complain+fail if pin_count > 0
> in the de-eviction path. As I said above, de-eviction for the CPU is not
> the same as de-eviction for the GPU, so pages being present and pinned
> doesn't mean we have nothing to do for the GPU mapping to be restored.
> Maybe we should come with a better name for this function.

Yes the AI was insisting that the problem was the GPU submission would
fail. Sadly it was incredibly bad at actually explaining the issue.

So I agree it looks like it would be safe to remove the WARN_ON and keep
going in the case of pin_count > 0. The (also confusingly named)
"vm_bo_validate" will be called because the evicted flag is set which
will get the BO mapped on the GPU again.

I'm all for better names, but I'm afraid I don't have any suggestions.

Thanks,
Steve

> Thanks for the review!
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/commit/fc76934a5579767d2aabe787d40e38a17c3f4ea4

