Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9DC64CD4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE9010E087;
	Mon, 17 Nov 2025 15:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7555B10E087
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:07:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81049FEC;
 Mon, 17 Nov 2025 07:07:46 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B2D33F66E;
 Mon, 17 Nov 2025 07:07:52 -0800 (PST)
Message-ID: <713a36aa-c8ff-4110-ae84-e67851b3efc1@arm.com>
Date: Mon, 17 Nov 2025 15:07:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/panthor: Make panthor_vm_[un]map_pages() more
 robust
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113103953.1519935-6-boris.brezillon@collabora.com>
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
> There's no reason for panthor_vm_[un]map_pages() to fail unless the
> drm_gpuvm state and the page table are out of sync, so let's reflect that
> by making panthor_vm_unmap_pages() a void function and adding
> WARN_ON()s in various places. We also try to recover from those
> unexpected mismatch by checking for already unmapped ranges and skipping
> them. But there's only so much we can do to try and cope with such
> SW bugs, so when we see a mismatch, we flag the VM unusable and disable
> the AS to avoid further GPU accesses to the memory.
> 
> It could be that the as_disable() call fails because the MMU unit is
> stuck, in which case the whole GPU is frozen, and only a GPU reset can
> unblock things. Ater the reset, the VM will be seen as unusable and
> any attempt to re-use it will fail, so we should be covered for any
> use-after-unmap issues.
> 
> v2:
> - Fix double unlock
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 82 ++++++++++++++++++---------
>  1 file changed, 55 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 21389137a324..35aad1e0ecaa 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -842,12 +842,32 @@ static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>  	return SZ_2M;
>  }
>  
> -static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
> +static void panthor_vm_declare_unusable(struct panthor_vm *vm)
> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +	int cookie;
> +
> +	if (vm->unusable)
> +		return;
> +
> +	vm->unusable = true;
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +	if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
> +		panthor_mmu_as_disable(ptdev, vm->as.id);
> +		drm_dev_exit(cookie);
> +	}
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +}
> +
> +static void panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  {
>  	struct panthor_device *ptdev = vm->ptdev;
>  	struct io_pgtable_ops *ops = vm->pgtbl_ops;
>  	u64 offset = 0;
>  
> +	if (!size)
> +		return;
> +
>  	drm_WARN_ON(&ptdev->base,
>  		    (iova < vm->locked_region.start) ||
>  		    (iova + size > vm->locked_region.start + vm->locked_region.size));
> @@ -858,18 +878,32 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  		size_t pgsize = get_pgsize(iova + offset, size - offset, &pgcount);
>  
>  		unmapped_sz = ops->unmap_pages(ops, iova + offset, pgsize, pgcount, NULL);
> +		if (drm_WARN_ON_ONCE(&ptdev->base, unmapped_sz != pgsize * pgcount)) {
> +			/* Gracefully handle sparsely unmapped regions to avoid leaving
> +			 * page table pages behind when the drm_gpuvm and VM page table
> +			 * are out-of-sync. This is not supposed to happen, hence the
> +			 * above WARN_ON().
> +			 */
> +			while (!ops->iova_to_phys(ops, iova + unmapped_sz) &&
> +			       unmapped_sz < pgsize * pgcount)
> +				unmapped_sz += SZ_4K;
>  
> -		if (drm_WARN_ON(&ptdev->base, unmapped_sz != pgsize * pgcount)) {
> -			drm_err(&ptdev->base, "failed to unmap range %llx-%llx (requested range %llx-%llx)\n",
> -				iova + offset + unmapped_sz,
> -				iova + offset + pgsize * pgcount,
> -				iova, iova + size);
> -			return  -EINVAL;
> +			/* We're passed the point where we can try to fix things,
> +			 * so flag the VM unusable to make sure it's not going
> +			 * to be used anymore.
> +			 */
> +			panthor_vm_declare_unusable(vm);
> +
> +			/* If we don't make progress, we're screwed. That also means
> +			 * something else prevents us from unmapping the region, but
> +			 * there's not much we can do here: time for debugging.
> +			 */
> +			if (drm_WARN_ON_ONCE(&ptdev->base, !unmapped_sz))
> +				return;
>  		}
> +
>  		offset += unmapped_sz;
>  	}
> -
> -	return 0;
>  }
>  
>  static int
> @@ -917,16 +951,17 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>  			paddr += mapped;
>  			len -= mapped;
>  
> -			if (drm_WARN_ON(&ptdev->base, !ret && !mapped))
> +			/* If nothing was mapped, consider it an ENOMEM. */
> +			if (!ret && !mapped)
>  				ret = -ENOMEM;
>  
> -			if (ret) {
> -				/* If something failed, unmap what we've already mapped before
> -				 * returning. The unmap call is not supposed to fail.
> +			/* If something fails, we stop there, and flag the VM unusable. */
> +			if (drm_WARN_ON_ONCE(&ptdev->base, ret)) {
> +				/* Unmap what we've already mapped to avoid leaving page
> +				 * table pages behind.
>  				 */
> -				drm_WARN_ON(&ptdev->base,
> -					    panthor_vm_unmap_pages(vm, start_iova,
> -								   iova - start_iova));
> +				panthor_vm_unmap_pages(vm, start_iova, iova - start_iova);
> +				panthor_vm_declare_unusable(vm);
>  				return ret;
>  			}
>  		}
> @@ -2109,12 +2144,9 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>  	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
>  	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
>  	u64 unmap_start, unmap_range;
> -	int ret;
>  
>  	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> -	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
> -	if (ret)
> -		return ret;
> +	panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>  
>  	if (op->remap.prev) {
>  		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
> @@ -2154,13 +2186,9 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
>  {
>  	struct panthor_vma *unmap_vma = container_of(op->unmap.va, struct panthor_vma, base);
>  	struct panthor_vm *vm = priv;
> -	int ret;
> -
> -	ret = panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
> -				     unmap_vma->base.va.range);
> -	if (drm_WARN_ON(&vm->ptdev->base, ret))
> -		return ret;
>  
> +	panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
> +			       unmap_vma->base.va.range);
>  	drm_gpuva_unmap(&op->unmap);
>  	panthor_vma_unlink(vm, unmap_vma);
>  	return 0;
> @@ -2240,7 +2268,7 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  
>  out:
>  	if (ret && flag_vm_unusable_on_failure)
> -		vm->unusable = true;
> +		panthor_vm_declare_unusable(vm);
>  
>  	vm->op_ctx = NULL;
>  	mutex_unlock(&vm->op_lock);

