Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5EA44971
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8144F10E785;
	Tue, 25 Feb 2025 18:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXdwr5Me";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD5E10E785;
 Tue, 25 Feb 2025 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740506721; x=1772042721;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QT7cdnbI4MDxTHl7VkjpNUyRVga2KezLh7mtv0V5HL4=;
 b=CXdwr5MesMEIE5G+v0BlZXQB9lIgtOh8DjtuAoCKDRDBsRmaNYmCoSeo
 TK5wI1nlEpnX3gSM3JEmkgGylJFv7VrwzKFKxXi1TnHNqz/aJ8zXqB2Ml
 gBnCzJIuISdBwKu17iTLg+kS8nYwk/B+4nidiA7jvysEwvtieJJ4C24go
 85H/tErfeBQHi9tT/KMypxCOiZ0TNtvGIr/GqXtffikK7fNHNz0x/7esD
 WO3ytInRu6Y6CG4thbdF+BIBTZ/kSiJQ0DtWykJ6DWAg4O7EmO2rEPKmN
 v/+bo7NzFhrcAx1A2mPgE4HMZ2Ka56ATnmPeMUuJHMKXB1HIvN4ucj02c g==;
X-CSE-ConnectionGUID: wdP8kHWjSniTmYhcCFRaSg==
X-CSE-MsgGUID: 9I5EC/9vTSeunYCWvqiC1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="44978526"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="44978526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:05:17 -0800
X-CSE-ConnectionGUID: pzk4bBc+QzS24p5Gaeva9w==
X-CSE-MsgGUID: i8NgVim3TuW3VzHg1cThYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117391576"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:05:15 -0800
Message-ID: <bf1b2e41-1380-45de-8772-59ebbcb5cf56@intel.com>
Date: Tue, 25 Feb 2025 18:05:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/32] drm/xe: Nuke VM's mapping upon close
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-12-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250225044311.3178695-12-matthew.brost@intel.com>
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

On 25/02/2025 04:42, Matthew Brost wrote:
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
> v5:
>   - Remove xe_gt_tlb_invalidation_fence_fini in error case (Matt Auld)
>   - Drop local migration bool (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 22 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
>   drivers/gpu/drm/xe/xe_pt.c                  | 14 +++++++++++++
>   drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
>   drivers/gpu/drm/xe/xe_vm.c                  | 20 +++++++++++++++++++
>   5 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 0a93831c0a02..03072e094991 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -410,6 +410,28 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
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
> +	if (ret < 0)
> +		return;
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
> index 1454f98e0cf6..f06b77a757bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1584,7 +1584,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   static void xe_vm_close(struct xe_vm *vm)
>   {
>   	down_write(&vm->lock);
> +
>   	vm->size = 0;
> +
> +	if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
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

CI looks to be crashing here with various flavours of:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v6/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

1> [310.004839] BUG: unable to handle page fault for address: 
ffffc901bc66e000
<1> [310.004854] #PF: supervisor write access in kernel mode
<1> [310.004861] #PF: error_code(0x0002) - not-present page
<6> [310.004867] PGD 100000067 P4D 100000067 PUD 0
<4> [310.005041]  <TASK>
<4> [310.005047]  ? show_regs+0x6c/0x80
<4> [310.005058]  ? __die+0x24/0x80
<4> [310.005068]  ? page_fault_oops+0x175/0x5d0
<4> [310.005079]  ? memset+0xb/0x20
<4> [310.005089]  ? kernelmode_fixup_or_oops.isra.0+0x69/0x90
<4> [310.005101]  ? __bad_area_nosemaphore+0x1bd/0x2f0
<4> [310.005112]  ? bad_area_nosemaphore+0x16/0x30
<4> [310.005122]  ? do_kern_addr_fault.part.0+0x62/0x80
<4> [310.005133]  ? exc_page_fault+0x2c8/0x300
<4> [310.005142]  ? asm_exc_page_fault+0x27/0x30
<4> [310.005155]  ? memset+0xb/0x20
<4> [310.005164]  ? memset_io+0x62/0x80
<4> [310.005174]  xe_pt_clear+0x81/0xa0 [xe]

I took a look and I think the root cause is that the error injection 
IGTs are unbinding the device (like hotunplug) with the vm still being 
left open (closed when driver instance is closed) so here the top level 
vram mapping has already been unmapped from the kernel address space 
during the unbind, and this here is then trying to write through that 
mapping. I think we need to sprinkle some drm_dev_enter() here, and 
maybe also for the inval below. If the device is already gone then we 
should be able to skip it.

> +
> +		for_each_gt(gt, vm->xe, id)
> +			xe_gt_tlb_invalidation_vm(gt, vm);
> +	}
> +
>   	up_write(&vm->lock);
>   }
>   

