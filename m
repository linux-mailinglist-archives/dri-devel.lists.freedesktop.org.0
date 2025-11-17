Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141DC64A37
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CEF10E0AA;
	Mon, 17 Nov 2025 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14A1A10E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:26:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29135FEC;
 Mon, 17 Nov 2025 06:26:04 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A61A3F740;
 Mon, 17 Nov 2025 06:26:09 -0800 (PST)
Message-ID: <6de63f18-bd10-4e13-9aa5-4190ba01db6e@arm.com>
Date: Mon, 17 Nov 2025 14:26:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/panthor: Add support for atomic page table
 updates
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113103953.1519935-5-boris.brezillon@collabora.com>
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

On 13/11/2025 10:39, Boris Brezillon wrote:
> Move the lock/flush_mem operations around the gpuvm_sm_[un]map() calls
> so we can implement true atomic page updates, where any access in the
> locked range done by the GPU has to wait for the page table updates
> to land before proceeding.
> 
> This is needed for vkQueueBindSparse(), so we can replace the dummy
> page mapped over the entire object by actual BO backed pages in an atomic
> way. But it's also useful to avoid "AS_ACTIVE bit stuck" failures in
> the sm_[un]map() path, leading to gpuvm state inconsistencies.
> 
> v2:
> - Adjust to match the two new preliminary patches
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks fine to me.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 184 +++++++++++++-------------
>  1 file changed, 95 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index f109c1588186..21389137a324 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -389,6 +389,15 @@ struct panthor_vm {
>  	 * flagged as faulty as a result.
>  	 */
>  	bool unhandled_fault;
> +
> +	/** @locked_region: Information about the currently locked region currently. */
> +	struct {
> +		/** @locked_region.start: Start of the locked region. */
> +		u64 start;
> +
> +		/** @locked_region.size: Size of the locked region. */
> +		u64 size;
> +	} locked_region;
>  };
>  
>  /**
> @@ -566,76 +575,9 @@ static u64 pack_region_range(u64 region_start, u64 size)
>  	return region_width | region_start;
>  }
>  
> -static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
> -				      u64 iova, u64 size, u32 op)
> -{
> -	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
> -	u32 lsc_flush_op;
> -	int ret;
> -
> -	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
> -
> -	switch (op) {
> -	case AS_COMMAND_FLUSH_MEM:
> -		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
> -		break;
> -	case AS_COMMAND_FLUSH_PT:
> -		lsc_flush_op = 0;
> -		break;
> -	default:
> -		drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
> -		return -EINVAL;
> -	}
> -
> -	if (as_nr < 0)
> -		return 0;
> -
> -	/*
> -	 * If the AS number is greater than zero, then we can be sure
> -	 * the device is up and running, so we don't need to explicitly
> -	 * power it up
> -	 */
> -
> -	/* Lock the region that needs to be updated */
> -	gpu_write64(ptdev, AS_LOCKADDR(as_nr), pack_region_range(iova, size));
> -	ret = as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
> -	if (ret)
> -		return ret;
> -
> -	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Explicitly unlock the region as the AS is not unlocked automatically
> -	 * at the end of the GPU_CONTROL cache flush command, unlike
> -	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
> -	 */
> -	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UNLOCK);
> -}
> -
> -static int mmu_hw_do_operation(struct panthor_vm *vm,
> -			       u64 iova, u64 size, u32 op)
> -{
> -	struct panthor_device *ptdev = vm->ptdev;
> -	int ret;
> -
> -	mutex_lock(&ptdev->mmu->as.slots_lock);
> -	ret = mmu_hw_do_operation_locked(ptdev, vm->as.id, iova, size, op);
> -	mutex_unlock(&ptdev->mmu->as.slots_lock);
> -
> -	return ret;
> -}
> -
>  static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  				 u64 transtab, u64 transcfg, u64 memattr)
>  {
> -	int ret;
> -
> -	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
> -	if (ret)
> -		return ret;
> -
>  	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
>  	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
>  	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
> @@ -647,7 +589,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  {
>  	int ret;
>  
> -	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
> +	/* Flush+invalidate RW caches, invalidate RO ones. */
> +	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> +				       CACHE_CLEAN | CACHE_INV, CACHE_INV);
>  	if (ret)
>  		return ret;
>  
> @@ -729,6 +673,10 @@ int panthor_vm_active(struct panthor_vm *vm)
>  	if (refcount_inc_not_zero(&vm->as.active_cnt))
>  		goto out_dev_exit;
>  
> +	/* Make sure we don't race with lock/unlock_region() calls
> +	 * happening around VM bind operations.
> +	 */
> +	mutex_lock(&vm->op_lock);
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  
>  	if (refcount_inc_not_zero(&vm->as.active_cnt))
> @@ -796,6 +744,10 @@ int panthor_vm_active(struct panthor_vm *vm)
>  		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
>  	}
>  
> +	/* The VM update is guarded by ::op_lock, which we take at the beginning
> +	 * of this function, so we don't expect any locked region here.
> +	 */
> +	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
>  	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
>  
>  out_make_active:
> @@ -806,6 +758,7 @@ int panthor_vm_active(struct panthor_vm *vm)
>  
>  out_unlock:
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +	mutex_unlock(&vm->op_lock);
>  
>  out_dev_exit:
>  	drm_dev_exit(cookie);
> @@ -889,30 +842,15 @@ static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>  	return SZ_2M;
>  }
>  
> -static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
> -{
> -	struct panthor_device *ptdev = vm->ptdev;
> -	int ret = 0, cookie;
> -
> -	if (vm->as.id < 0)
> -		return 0;
> -
> -	/* If the device is unplugged, we just silently skip the flush. */
> -	if (!drm_dev_enter(&ptdev->base, &cookie))
> -		return 0;
> -
> -	ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
> -
> -	drm_dev_exit(cookie);
> -	return ret;
> -}
> -
>  static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  {
>  	struct panthor_device *ptdev = vm->ptdev;
>  	struct io_pgtable_ops *ops = vm->pgtbl_ops;
>  	u64 offset = 0;
>  
> +	drm_WARN_ON(&ptdev->base,
> +		    (iova < vm->locked_region.start) ||
> +		    (iova + size > vm->locked_region.start + vm->locked_region.size));
>  	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
>  
>  	while (offset < size) {
> @@ -926,13 +864,12 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  				iova + offset + unmapped_sz,
>  				iova + offset + pgsize * pgcount,
>  				iova, iova + size);
> -			panthor_vm_flush_range(vm, iova, offset + unmapped_sz);
>  			return  -EINVAL;
>  		}
>  		offset += unmapped_sz;
>  	}
>  
> -	return panthor_vm_flush_range(vm, iova, size);
> +	return 0;
>  }
>  
>  static int
> @@ -949,6 +886,10 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>  	if (!size)
>  		return 0;
>  
> +	drm_WARN_ON(&ptdev->base,
> +		    (iova < vm->locked_region.start) ||
> +		    (iova + size > vm->locked_region.start + vm->locked_region.size));
> +
>  	for_each_sgtable_dma_sg(sgt, sgl, count) {
>  		dma_addr_t paddr = sg_dma_address(sgl);
>  		size_t len = sg_dma_len(sgl);
> @@ -996,7 +937,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>  		offset = 0;
>  	}
>  
> -	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
> +	return 0;
>  }
>  
>  static int flags_to_prot(u32 flags)
> @@ -1679,6 +1620,61 @@ static const char *access_type_name(struct panthor_device *ptdev,
>  	}
>  }
>  
> +static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +	int ret = 0;
> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
> +	if (vm->as.id >= 0 && size) {
> +		/* Lock the region that needs to be updated */
> +		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id), pack_region_range(start, size));
> +
> +		/* If the lock succeeded, update the locked_region info. */
> +		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
> +	}
> +
> +	if (!ret) {
> +		vm->locked_region.start = start;
> +		vm->locked_region.size = size;
> +	}
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +
> +	return ret;
> +}
> +
> +static void panthor_vm_unlock_region(struct panthor_vm *vm)
> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +	if (vm->as.id >= 0) {
> +		int ret;
> +
> +		/* flush+invalidate RW caches and invalidate RO ones.
> +		 * TODO: See if we can use FLUSH_PA_RANGE when the physical
> +		 * range is narrow enough and the HW supports it.
> +		 */
> +		ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> +					       CACHE_CLEAN | CACHE_INV,
> +					       CACHE_INV);
> +
> +		/* Unlock the region if the flush is effective. */
> +		if (!ret)
> +			ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
> +
> +		/* If we fail to flush or unlock the region, schedule a GPU reset
> +		 * to unblock the situation.
> +		 */
> +		if (ret)
> +			panthor_device_schedule_reset(ptdev);
> +	}
> +	vm->locked_region.start = 0;
> +	vm->locked_region.size = 0;
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +}
> +
>  static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	bool has_unhandled_faults = false;
> @@ -1883,6 +1879,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
>  	drm_sched_entity_destroy(&vm->entity);
>  	drm_sched_fini(&vm->sched);
>  
> +	mutex_lock(&vm->op_lock);
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  	if (vm->as.id >= 0) {
>  		int cookie;
> @@ -1897,6 +1894,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
>  		list_del(&vm->as.lru_node);
>  	}
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +	mutex_unlock(&vm->op_lock);
>  
>  	free_io_pgtable_ops(vm->pgtbl_ops);
>  
> @@ -2206,6 +2204,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx = op;
> +
> +	ret = panthor_vm_lock_region(vm, op->va.addr, op->va.range);
> +	if (ret)
> +		goto out;
> +
>  	switch (op_type) {
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
>  		const struct drm_gpuvm_map_req map_req = {
> @@ -2233,6 +2236,9 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  		break;
>  	}
>  
> +	panthor_vm_unlock_region(vm);
> +
> +out:
>  	if (ret && flag_vm_unusable_on_failure)
>  		vm->unusable = true;
>  

