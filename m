Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A2A22BFA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008D710E923;
	Thu, 30 Jan 2025 10:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErmnALRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8D810E923;
 Thu, 30 Jan 2025 10:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738234259; x=1769770259;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ocVtArkOQPPz13EbY5+CEd/on9yreXEvb6PuSP61Py8=;
 b=ErmnALRCE0//6wj96Vj5PUMa6ORenBIb8aqy32AoA9FtX8cqnTmOiXlR
 6vb2ezUeMVZzBVmq77dLFyo05f6fuPP2lcEt5w0e5mFT/13HmjZ2sM8gs
 HHEC+MQAcLbgiGhSZXbKc8d/VtoJJGZGEF6wLEbmmzNLUMaBcEaArVZCs
 XSEe4DWFo/UZe1rAybTeZ3HwcSi10N76rqx2a4aHLGLUSumHE4IR1Hxlt
 xpPvKMolTmxQYsKqyu1mwAw/uGiVzHp+PwgoO8KvBghRSL6ioqvvfXM4j
 4oNgt5l3zaqSJ3H5mzJGaD7ExBht7mEM7FjGxeQzMpdLcWSBlM0VaKV/f Q==;
X-CSE-ConnectionGUID: C61XH7VtTR2C0YSf+3a6NQ==
X-CSE-MsgGUID: EsijYU0pSsulMRHJYLEW+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="50155642"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="50155642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:50:59 -0800
X-CSE-ConnectionGUID: R/t4ryp2TBCQJxlRYZoDHQ==
X-CSE-MsgGUID: 988JOFNORY+KGLiHkiJxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140172389"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:50:53 -0800
Message-ID: <3b539bf7-0294-45ef-9a1d-289b4932a1dc@intel.com>
Date: Thu, 30 Jan 2025 10:50:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/33] drm/xe: Nuke VM's mapping upon close
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-12-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250129195212.745731-12-matthew.brost@intel.com>
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

On 29/01/2025 19:51, Matthew Brost wrote:
> Clear root PT entry and invalidate entire VM's address space when
> closing the VM. Will prevent the GPU from accessing any of the VM's
> memory after closing.
> 
> v2:
>   - s/vma/vm in kernel doc (CI)
>   - Don't nuke migration VM as this occur at driver unload (CI)
> v3:
>   - Rebase and pull into SVM series (Thomas)
>   - Wait for pending binds (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
>   drivers/gpu/drm/xe/xe_pt.c                  | 14 ++++++++++++
>   drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
>   drivers/gpu/drm/xe/xe_vm.c                  | 22 +++++++++++++++++++
>   5 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 0a93831c0a02..1ef21ed01d1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -410,6 +410,30 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>   	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
>   }
>   
> +/**
> + * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
> + * @gt: graphics tile
> + * @vm: VM to invalidate
> + *
> + * Invalidate entire VM's address space
> + */
> +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
> +{
> +	struct xe_gt_tlb_invalidation_fence fence;
> +	u64 range = 1ull << vm->xe->info.va_bits;
> +	int ret;
> +
> +	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> +
> +	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
> +	if (ret < 0) {
> +		xe_gt_tlb_invalidation_fence_fini(&fence);

IIRC we changed the tlb inval flow to do the fini() in the error case, 
so this will lead to double fini() I think?

> +		return;
> +	}
> +
> +	xe_gt_tlb_invalidation_fence_wait(&fence);
> +}
> +
>   /**
>    * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
>    * @gt: GT structure
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index 672acfcdf0d7..abe9b03d543e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -12,6 +12,7 @@
>   
>   struct xe_gt;
>   struct xe_guc;
> +struct xe_vm;
>   struct xe_vma;
>   
>   int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> @@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>   int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   			       struct xe_gt_tlb_invalidation_fence *fence,
>   			       struct xe_vma *vma);
> +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
>   int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>   				 struct xe_gt_tlb_invalidation_fence *fence,
>   				 u64 start, u64 end, u32 asid);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 99b97bf37c05..c5060011ad43 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -214,6 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>   	xe_pt_free(pt);
>   }
>   
> +/**
> + * xe_pt_clear() - Clear a page-table.
> + * @xe: xe device.
> + * @pt: The page-table.
> + *
> + * Clears page-table by setting to zero.
> + */
> +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> +{
> +	struct iosys_map *map = &pt->bo->vmap;
> +
> +	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +}
> +
>   /**
>    * DOC: Pagetable building
>    *
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..8e43912ae8e9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -13,6 +13,7 @@ struct dma_fence;
>   struct xe_bo;
>   struct xe_device;
>   struct xe_exec_queue;
> +struct xe_svm_range;
>   struct xe_sync_entry;
>   struct xe_tile;
>   struct xe_vm;
> @@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>   
>   void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
>   
> +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
> +
>   int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
>   struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
>   				       struct xe_vma_ops *vops);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bc34e6738c8c..82026c5a154d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1537,8 +1537,30 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   static void xe_vm_close(struct xe_vm *vm)
>   {
> +	bool migration = (vm->flags & XE_VM_FLAG_MIGRATION);
> +
>   	down_write(&vm->lock);
> +
>   	vm->size = 0;
> +
> +	if (!migration) {
> +		struct xe_tile *tile;
> +		struct xe_gt *gt;
> +		u8 id;
> +
> +		/* Wait for pending binds */
> +		dma_resv_wait_timeout(xe_vm_resv(vm),
> +				      DMA_RESV_USAGE_BOOKKEEP,
> +				      false, MAX_SCHEDULE_TIMEOUT);
> +
> +		for_each_tile(tile, vm->xe, id)
> +			if (vm->pt_root[id])
> +				xe_pt_clear(vm->xe, vm->pt_root[id]);
> +
> +		for_each_gt(gt, vm->xe, id)
> +			xe_gt_tlb_invalidation_vm(gt, vm);
> +	}
> +
>   	up_write(&vm->lock);
>   }
>   

