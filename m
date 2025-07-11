Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F5B02451
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AC110E3C1;
	Fri, 11 Jul 2025 19:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YiiFkTtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927A410E3BF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752261080; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QQHsWfaQWduGbYVfJfhvhwCtWadu9pBFuRwzhPoUzQzi1H/WAg9fNG6VqjrJxhkuy0aI078bctii0Psg3f9hSyIhUeBs220UZZ6wPN6xQMsSSwRHRl0uWGNiox8c73ZCzXY2M3Mop9xDWjcnPjTon2M1GrMufloRRatNK3H2vwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752261080;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Leldv3LSDYNFE4XlW4jcvrOGC0GRo6S1v6TISIZCd3k=; 
 b=Eh/2Owu33vvx3YNkFOHHs96Ipq9VDTNJJaZxNsLh4cYMs7ky5qFTxS+Hk32JBebuvTnXDlllpY2X7e8aUQY+FBOgD0nTKAxZGl97N9aJ7gmaIVdFIr7Uq6/qIuZrkpfcvYOn126cfP8VSMQl4h8Ripp8GdBZEtL3ryB+C8qBzfI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752261080; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Leldv3LSDYNFE4XlW4jcvrOGC0GRo6S1v6TISIZCd3k=;
 b=YiiFkTtzwDYxaUqhXz5FEipWe7vnDTQ2Jo5fLh7xw8HhTMvodbRH6UzGbD10trFo
 Rbb+/V/qsCxwbFRHuA0fg+2WO+i0Bm9pxQ9S9GXSqsN8FfhwtiyCn8IlLKo7QDxGFhF
 orsRce0IsPt3vPT9ZcnCRYB7BZEEr/QhurgBvtDw=
Received: by mx.zohomail.com with SMTPS id 1752261079263492.4174914567179;
 Fri, 11 Jul 2025 12:11:19 -0700 (PDT)
Date: Fri, 11 Jul 2025 20:11:15 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/panthor: Add support for atomic page table
 updates
Message-ID: <5wxljw27mc4f2i6ag54upmpjxjj5odnd6d57fiiozpb3hjl4zi@okwx34aj56b6>
References: <20250703152908.16702-2-caterina.shablia@collabora.com>
 <20250703152908.16702-3-caterina.shablia@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703152908.16702-3-caterina.shablia@collabora.com>
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

Hi Caterina,

On 03.07.2025 15:28, Caterina Shablia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> Move the lock/flush_mem operations around the gpuvm_sm_map() calls so
> we can implement true atomic page updates, where any access in the
> locked range done by the GPU has to wait for the page table updates
> to land before proceeding.
>
> This is needed for vkQueueBindSparse(), so we can replace the dummy
> page mapped over the entire object by actual BO backed pages in an atomic
> way.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 65 +++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b39ea6acc6a9..1e58948587a9 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -387,6 +387,15 @@ struct panthor_vm {
>  	 * flagged as faulty as a result.
>  	 */
>  	bool unhandled_fault;
> +
> +	/** @locked_region: Information about the currently locked region currently. */

Nit: delete second 'current'

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
> @@ -775,6 +784,10 @@ int panthor_vm_active(struct panthor_vm *vm)
>  	}
>
>  	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
> +	if (!ret && vm->locked_region.size) {
> +		lock_region(ptdev, vm->as.id, vm->locked_region.start, vm->locked_region.size);

Why do we need to lock the region after enabling a new AS?

> +		ret = wait_ready(ptdev, vm->as.id);
> +	}
>
>  out_make_active:
>  	if (!ret) {
> @@ -902,6 +915,9 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  	struct io_pgtable_ops *ops = vm->pgtbl_ops;
>  	u64 offset = 0;
>
> +	drm_WARN_ON(&ptdev->base,
> +		    (iova < vm->locked_region.start) ||
> +		    (iova + size > vm->locked_region.start + vm->locked_region.size));
>  	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
>
>  	while (offset < size) {
> @@ -915,13 +931,12 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  				iova + offset + unmapped_sz,
>  				iova + offset + pgsize * pgcount,
>  				iova, iova + size);
> -			panthor_vm_flush_range(vm, iova, offset + unmapped_sz);

We've removed all calls to panthor_vm_flush_range(), but I don't see it being done in panthor_vm_exec_op()
before the region is unlocked. It's effectively become dead code.

However, even if we did 'panthor_vm_flush_range(vm, op->va.addr, op->va.range);' in panthor_vm_exec_op() right
before we unlock the region, we wouldn't be dealing well with the case in which only a partial unmap happens,
but maybe this isn't a big deal either.

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
> @@ -938,6 +953,10 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
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
> @@ -985,7 +1004,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>  		offset = 0;
>  	}
>
> -	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);


> +	return 0;
>  }
>
>  static int flags_to_prot(u32 flags)
> @@ -1654,6 +1673,38 @@ static const char *access_type_name(struct panthor_device *ptdev,
>  	}
>  }
>
> +static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +	int ret;
> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
> +	vm->locked_region.start = start;
> +	vm->locked_region.size = size;
> +	if (vm->as.id >= 0) {

I guess VM bind operations don't increase the active_cnt of a VM, so we might try to
be mapping addresses from UM while no active groups are submitting jobs targetting this VM?

> +		lock_region(ptdev, vm->as.id, start, size);
> +		ret = wait_ready(ptdev, vm->as.id);

I've noticed in mmu_hw_do_operation_locked() we don't do wait_ready() after locking the region.
Is it missing or else maybe waiting for the AS to be locked isn't necessary here?

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
> +		write_cmd(ptdev, vm->as.id, AS_COMMAND_FLUSH_MEM);

I guess this is why we no longer need to call panthor_vm_flush_range() right before this function.
Does AS_COMMAND_FLUSH_MEM only flush the locked region? Also, why not AS_COMMAND_FLUSH_PT instead?

> +		drm_WARN_ON(&ptdev->base, wait_ready(ptdev, vm->as.id));
> +	}
> +	vm->locked_region.start = 0;
> +	vm->locked_region.size = 0;
> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +}
> +
>  static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	bool has_unhandled_faults = false;
> @@ -2179,6 +2230,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx = op;
> +
> +	ret = panthor_vm_lock_region(vm, op->va.addr, op->va.range);
> +	if (ret)
> +		goto out;
> +
>  	switch (op_type) {
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
>  		if (vm->unusable) {
> @@ -2199,6 +2255,9 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  		break;
>  	}
>
> +	panthor_vm_unlock_region(vm);
> +
> +out:
>  	if (ret && flag_vm_unusable_on_failure)
>  		vm->unusable = true;
>
> --
> 2.47.2

Adrian Larumbe
