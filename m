Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBUDBA/wqmncYwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:17:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C1C223A19
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677B10E3ED;
	Fri,  6 Mar 2026 15:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5D0A10E3ED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 15:17:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D93B497;
 Fri,  6 Mar 2026 07:17:23 -0800 (PST)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A44AE3F836;
 Fri,  6 Mar 2026 07:17:26 -0800 (PST)
Message-ID: <0fbe7ff5-62e4-4345-882b-ca27195aa510@arm.com>
Date: Fri, 6 Mar 2026 15:17:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
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
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
 <20260305124320.156606-10-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260305124320.156606-10-boris.brezillon@collabora.com>
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
X-Rspamd-Queue-Id: 70C1C223A19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.727];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:mid,arm.com:email]
X-Rspamd-Action: no action

On 05/03/2026 12:43, Boris Brezillon wrote:
> From: Akash Goel <akash.goel@arm.com>
> 
> This implementation is losely based on the MSM shrinker, and it's
> relying on the drm_gpuvm eviction/validation infrastructure.
> 
> Right now we only support swapout/eviction, but we could add an extra
> flag to specify when buffer content doesn't need to be preserved to
> avoid the swapout/swapin dance.
> 
> Locking is a bit of a nightmare, but using _trylock() all the way in
> the reclaim path seems to make lockdep happy. And yes, we might be
> missing opportunities to reclaim when the system is under heavy GPU
> load/heavy memory pressure/heavy GPU VM activity, but that's better
> than no reclaim at all.
> 
> v2:
> - Move gpu_mapped_shared next to the mmapped LRU
> - Add a bunch of missing is_[vm_bo,vma]_evicted() tests
> - Only test mmap_count to check if a BO is mmaped
> - Remove stale comment about shrinker not being a thing
> - Allow pin_count to be non-zero in panthor_gem_swapin_locked()
> - Fix panthor_gem_sync() to check for BO residency before doing the CPU sync
> - Fix the value returned by panthor_gem_shrinker_count() in case some
>   memory has been released
> - Check drmm_mutex_init() ret code
> - Explicitly mention that PANTHOR_GEM_UNRECLAIMABLE is the initial state
>   of all BOs
> 
> v3:
> - Make panthor_gem_try_evict() static
> - Collect {A,R}-bs
> 
> v4:
> - Update the reclaim_state in panthor_gem_mmap()
> - Don't reclaim GPU-mapped BOs if can_block() returns false
> - Skip evicited vm_bos in panthor_vm_update_bo_reclaim_lru_locked() to
>   avoid spurious WARN_ON()s
> - Explain why we have to do this
>   select_evicted_vma/repopulate_evicted_vma dance
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

You've already got my Reviewed-by, but one minor point below.

> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  11 +-
>  drivers/gpu/drm/panthor/panthor_device.h |  73 ++++
>  drivers/gpu/drm/panthor/panthor_gem.c    | 466 ++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h    |  68 ++++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 352 ++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_mmu.h    |   8 +
>  6 files changed, 951 insertions(+), 27 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 5d07c1b96e0a..3daf7ee0961e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c

[...]

> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> +		struct drm_gpuva *va;
> +
> +		/* Skip already evicted GPU mappings. */
> +		if (vm_bo->evicted)
> +			continue;
> +
> +		if (!mutex_trylock(&vm->op_lock))
> +			return -EDEADLK;
> +
> +		drm_gpuvm_bo_evict(vm_bo, true);
> +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> +			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
> +
> +			if (vma->evicted)
> +				continue;
> +
> +			panthor_vm_lock_region(vm, va->va.addr, va->va.range);

NIT: You are ignoring the return value here - it might be better to bail
out instead if this happens. Admittedly this is a "should never happen"
case.

Thanks,
Steve

> +			panthor_vm_unmap_pages(vm, va->va.addr, va->va.range);
> +			panthor_vm_unlock_region(vm);
> +			vma->evicted = true;
> +		}
> +
> +		mutex_unlock(&vm->op_lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct panthor_vma *select_evicted_vma(struct drm_gpuvm_bo *vm_bo,
> +					      struct panthor_vm_op_ctx *op_ctx)
> +{
> +	struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> +	struct panthor_vma *first_evicted_vma = NULL;
> +	struct drm_gpuva *va;
> +
> +	/* Take op_lock to protect against va insertion/removal. */
> +	mutex_lock(&vm->op_lock);
> +	drm_gpuvm_bo_for_each_va(va, vm_bo) {
> +		struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
> +
> +		if (vma->evicted) {
> +			first_evicted_vma = vma;
> +			panthor_vm_init_op_ctx(op_ctx, va->va.range, va->va.addr, vma->flags);
> +			op_ctx->map.bo_offset = va->gem.offset;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&vm->op_lock);
> +
> +	return first_evicted_vma;
> +}
> +
> +static int remap_evicted_vma(struct drm_gpuvm_bo *vm_bo,
> +			     struct panthor_vma *evicted_vma,
> +			     struct panthor_vm_op_ctx *op_ctx)
> +{
> +	struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> +	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
> +	struct drm_gpuva *va;
> +	bool found = false;
> +	int ret;
> +
> +	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
> +	if (ret)
> +		goto out_cleanup;
> +
> +	/* Take op_lock to protect against va insertion/removal. Note that the
> +	 * evicted_vma selection was done with the same lock held, but we had
> +	 * to release it so we can allocate PTs, because this very same lock
> +	 * is taken in a DMA-signalling path.
> +	 */
> +	mutex_lock(&vm->op_lock);
> +	drm_gpuvm_bo_for_each_va(va, vm_bo) {
> +		struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
> +
> +		if (vma != evicted_vma)
> +			continue;
> +
> +		/* Because we had to release the lock between the evicted_vma selection
> +		 * and its repopulation, we can't rely solely on pointer equality (the
> +		 * VMA might have been freed and a new one allocated at the same address).
> +		 * If the evicted bit is still set, we're sure it's our VMA, because
> +		 * population/eviction is serialized with the BO resv lock.
> +		 */
> +		if (vma->evicted)
> +			found = true;
> +
> +		break;
> +	}
> +
> +	if (found) {
> +		vm->op_ctx = op_ctx;
> +		ret = panthor_vm_lock_region(vm, evicted_vma->base.va.addr,
> +					     evicted_vma->base.va.range);
> +		if (!ret) {
> +			ret = panthor_vm_map_pages(vm, evicted_vma->base.va.addr,
> +						   flags_to_prot(evicted_vma->flags),
> +						   bo->dmap.sgt,
> +						   evicted_vma->base.gem.offset,
> +						   evicted_vma->base.va.range);
> +		}
> +
> +		if (!ret)
> +			evicted_vma->evicted = false;
> +
> +		panthor_vm_unlock_region(vm);
> +		vm->op_ctx = NULL;
> +	}
> +
> +	mutex_unlock(&vm->op_lock);
> +
> +out_cleanup:
> +	panthor_vm_cleanup_op_ctx(op_ctx, vm);
> +	return ret;
> +}
> +
> +static int panthor_vm_restore_vmas(struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> +	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
> +	struct panthor_vm_op_ctx op_ctx;
> +
> +	if (drm_WARN_ON_ONCE(&vm->ptdev->base, !bo->dmap.sgt))
> +		return -EINVAL;
> +
> +	for (struct panthor_vma *vma = select_evicted_vma(vm_bo, &op_ctx);
> +	     vma; vma = select_evicted_vma(vm_bo, &op_ctx)) {
> +		int ret;
> +
> +		ret = remap_evicted_vma(vm_bo, vma, &op_ctx);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int panthor_vm_bo_validate(struct drm_gpuvm_bo *vm_bo,
> +				  struct drm_exec *exec)
> +{
> +	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
> +	int ret;
> +
> +	ret = panthor_gem_swapin_locked(bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_vm_restore_vmas(vm_bo);
> +	if (ret)
> +		return ret;
> +
> +	drm_gpuvm_bo_evict(vm_bo, false);
> +	mutex_lock(&bo->base.gpuva.lock);
> +	panthor_gem_update_reclaim_state_locked(bo, NULL);
> +	mutex_unlock(&bo->base.gpuva.lock);
> +	return 0;
> +}
> +
>  static const struct drm_gpuvm_ops panthor_gpuvm_ops = {
>  	.vm_free = panthor_vm_free,
>  	.vm_bo_free = panthor_vm_bo_free,
>  	.sm_step_map = panthor_gpuva_sm_step_map,
>  	.sm_step_remap = panthor_gpuva_sm_step_remap,
>  	.sm_step_unmap = panthor_gpuva_sm_step_unmap,
> +	.vm_bo_validate = panthor_vm_bo_validate,
>  };
>  
>  /**
> @@ -2463,6 +2706,8 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>  	vm->kernel_auto_va.start = auto_kernel_va_start;
>  	vm->kernel_auto_va.end = vm->kernel_auto_va.start + auto_kernel_va_size - 1;
>  
> +	drm_gem_lru_init(&vm->reclaim.lru, &ptdev->reclaim.lock);
> +	INIT_LIST_HEAD(&vm->reclaim.lru_node);
>  	INIT_LIST_HEAD(&vm->node);
>  	INIT_LIST_HEAD(&vm->as.lru_node);
>  	vm->as.id = -1;
> @@ -2810,7 +3055,78 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
>  	if (ret)
>  		return ret;
>  
> -	return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
> +	ret = drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gpuvm_validate(&vm->base, exec);
> +}
> +
> +unsigned long
> +panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> +			     unsigned int nr_to_scan, unsigned long *remaining,
> +			     bool (*shrink)(struct drm_gem_object *,
> +					    struct ww_acquire_ctx *))
> +{
> +	unsigned long freed = 0;
> +	LIST_HEAD(remaining_vms);
> +	LIST_HEAD(vms);
> +
> +	mutex_lock(&ptdev->reclaim.lock);
> +	list_splice_init(&ptdev->reclaim.vms, &vms);
> +
> +	while (freed < nr_to_scan) {
> +		struct panthor_vm *vm;
> +
> +		vm = list_first_entry_or_null(&vms, typeof(*vm),
> +					      reclaim.lru_node);
> +		if (!vm)
> +			break;
> +
> +		if (!kref_get_unless_zero(&vm->base.kref)) {
> +			list_del_init(&vm->reclaim.lru_node);
> +			continue;
> +		}
> +
> +		mutex_unlock(&ptdev->reclaim.lock);
> +
> +		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
> +					  remaining, shrink, NULL);
> +
> +		mutex_lock(&ptdev->reclaim.lock);
> +
> +		/* If the VM is still in the temporary list, remove it so we
> +		 * can proceed with the next VM.
> +		 */
> +		if (vm->reclaim.lru_node.prev == &vms) {
> +			list_del_init(&vm->reclaim.lru_node);
> +
> +			/* Keep the VM around if there are still things to
> +			 * reclaim, so we can preserve the LRU order when
> +			 * re-inserting in ptdev->reclaim.vms at the end.
> +			 */
> +			if (vm->reclaim.lru.count > 0)
> +				list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
> +		}
> +
> +		mutex_unlock(&ptdev->reclaim.lock);
> +
> +		panthor_vm_put(vm);
> +
> +		mutex_lock(&ptdev->reclaim.lock);
> +	}
> +
> +	/* Re-insert VMs with remaining data to reclaim at the beginning of
> +	 * the LRU. Note that any activeness change on the VM that happened
> +	 * while we were reclaiming would have moved the VM out of our
> +	 * temporary [remaining_]vms list, meaning anything we re-insert here
> +	 * preserves the LRU order.
> +	 */
> +	list_splice_tail(&vms, &remaining_vms);
> +	list_splice(&remaining_vms, &ptdev->reclaim.vms);
> +	mutex_unlock(&ptdev->reclaim.lock);
> +
> +	return freed;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 0e268fdfdb2f..3522fbbce369 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 or MIT */
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
> +/* Copyright 2025 ARM Limited. All rights reserved. */
>  
>  #ifndef __PANTHOR_MMU_H__
>  #define __PANTHOR_MMU_H__
> @@ -46,6 +47,13 @@ struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>  				     u64 kernel_auto_va_start,
>  				     u64 kernel_auto_va_size);
>  
> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo);
> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
> +unsigned long
> +panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> +			     unsigned int nr_to_scan, unsigned long *remaining,
> +			     bool (*shrink)(struct drm_gem_object *,
> +					    struct ww_acquire_ctx *));
>  int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
>  					struct panthor_vm *vm,
>  					u32 slot_count);

