Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F715A89BEF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E983310E73F;
	Tue, 15 Apr 2025 11:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vpt+WFHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E3010E737;
 Tue, 15 Apr 2025 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744715999; x=1776251999;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+LrsEG9o8xUG4bYnZEZ5vsvpdvdXLPTZz6a9USF2zj4=;
 b=Vpt+WFHSiMF+iky9fxuPxXTpfzBxrMX9UmIRJAFVVyEdIC4El/8hg2fB
 YpmTT0SfgeJFMjNZZ28c1q2co5PLpp/HSlH8DO1FFVkOrlflCsAvIc6ui
 Y/vjTOdmVgBYM9O+4AGndnkYyplIRXBHTCr+TusRdnBXiR6yt0vA0tY/1
 XmHxiJ6J24gN6l9M7jX70Vxw4IYXdzUsNXe45BQsvnpBzjRKETLMqEV2T
 oTWRidRxtoCoQQTVp5RsKdjQ9WSnI5D3WcTW6t8l/MOxCvQftG3M3lIsh
 iVNPuUZfnweTKwAt99lFHoLku/YKaRPyfKk7PVmdWJwAkV1uMFjzJylNj w==;
X-CSE-ConnectionGUID: 7d40oG4URCW/Mid3jYEgHA==
X-CSE-MsgGUID: WqpaY5BQQ0mBZ+WAP63Vkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45452611"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45452611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:19:59 -0700
X-CSE-ConnectionGUID: jwemSUkJQ9iBW7MGf0jPdw==
X-CSE-MsgGUID: kVua3GnUSo2vtc99E6UM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134189512"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:19:56 -0700
Message-ID: <14c0b670-5eb7-46e4-955a-34bb8d1b6e11@intel.com>
Date: Tue, 15 Apr 2025 12:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/5] drm/xe/xe_vm: Add per VM fault info
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com
References: <20250414214059.30657-1-jonathan.cavitt@intel.com>
 <20250414214059.30657-5-jonathan.cavitt@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250414214059.30657-5-jonathan.cavitt@intel.com>
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

On 14/04/2025 22:40, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
> 
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
> 
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> 
> v3:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> 
> v4:
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Add and fix kernel docs (Michal W)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> 
> v5:
> - Store fault and access type instead of address type (Jianxun)
> 
> v6:
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> 
> v7:
> - Fix kernel docs and comments (Michal W)
> 
> v8:
> - Fix double-locking issue (Jianxun)
> 
> v9:
> - Do not report faults from reserved engines (Jianxun)
> 
> v10:
> - Remove engine class and instance (Ivan)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mzorek <michal.mzorek@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 26 +++++++++
>   drivers/gpu/drm/xe/xe_vm.c           | 87 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h           |  9 +++
>   drivers/gpu/drm/xe/xe_vm_types.h     | 28 +++++++++
>   4 files changed, 150 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 0cedf089a3f2..b7ad55682de3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -345,6 +345,31 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	return full ? -ENOSPC : 0;
>   }
>   
> +static void save_pagefault_to_vm(struct xe_device *xe, struct xe_gt_pagefault *pf)
> +{
> +	struct xe_vm *vm;
> +
> +	/*
> +	 * Pagefault may be associated to VM that is not in fault mode.
> +	 * Perform asid_to_vm behavior, except if vm is not in fault
> +	 * mode, return the VM anyways.
> +	 */
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	if (IS_ERR(vm))
> +		return;
> +
> +	xe_vm_add_fault_entry_pf(vm, pf);
> +
> +	xe_vm_put(vm);
> +}
> +
>   #define USM_QUEUE_MAX_RUNTIME_MS	20
>   
>   static void pf_queue_work_func(struct work_struct *w)
> @@ -364,6 +389,7 @@ static void pf_queue_work_func(struct work_struct *w)
>   		if (unlikely(ret)) {
>   			print_pagefault(xe, &pf);
>   			pf.fault_unsuccessful = 1;
> +			save_pagefault_to_vm(xe, &pf);
>   			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
>   		}
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 793f5bc393c2..1d97f4b9673f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,7 +27,9 @@
>   #include "xe_device.h"
>   #include "xe_drm_client.h"
>   #include "xe_exec_queue.h"
> +#include "xe_gt.h"
>   #include "xe_gt_pagefault.h"
> +#include "xe_gt_pagefault_types.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_migrate.h"
>   #include "xe_pat.h"
> @@ -778,6 +780,86 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>   		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>   }
>   
> +static struct xe_hw_engine *
> +hw_engine_lookup_class_instance(struct xe_vm *vm,
> +				enum xe_engine_class class,
> +				u16 instance)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id)
> +		for_each_hw_engine(hwe, gt, id)
> +			if (hwe->class == class && hwe->instance == instance)
> +				return hwe;
> +	return NULL;
> +}
> +
> +/**
> + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> + * @vm: The VM.
> + * @pf: The pagefault.
> + *
> + * This function takes the data from the pagefault @pf and saves it to @vm->faults.list.
> + *
> + * The function exits silently if the list is full, and reports a warning if the pagefault
> + * could not be saved to the list.
> + */
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault *pf)
> +{
> +	struct xe_vm_fault_entry *e = NULL;
> +	struct xe_hw_engine *hwe;
> +
> +	/* Do not report faults on reserved engines */
> +	hwe = hw_engine_lookup_class_instance(vm, pf->engine_class, pf->engine_instance);
> +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> +		return;
> +
> +	spin_lock(&vm->faults.lock);
> +
> +	/*
> +	 * Limit the number of faults in the fault list to prevent
> +	 * memory overuse.
> +	 */
> +	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM)
> +		goto out;
> +
> +	e = kzalloc(sizeof(*e), GFP_KERNEL);

I think this can sleep, which is not allowed with spin_lock held. CI is 
complaining here:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v19/shard-lnl-5/igt@xe_waitfence@exec_queue-reset-wait.html

Is it possible to move this outside of the lock?

> +	if (!e) {
> +		drm_warn(&vm->xe->drm,
> +			 "Could not allocate memory for fault %i!",
> +			 vm->faults.len);
> +		goto out;
> +	}
> +
> +	e->address = pf->page_addr;
> +	e->address_precision = 1;
> +	e->access_type = pf->access_type;
> +	e->fault_type = pf->fault_type;
> +	e->fault_level = pf->fault_level;
> +
> +	list_add_tail(&e->list, &vm->faults.list);
> +	vm->faults.len++;
> +out:
> +	spin_unlock(&vm->faults.lock);
> +}
> +
> +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> +{
> +	struct xe_vm_fault_entry *e, *tmp;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> +		list_del(&e->list);
> +		kfree(e);
> +	}
> +	vm->faults.len = 0;
> +	spin_unlock(&vm->faults.lock);
> +}
> +
>   static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>   {
>   	int i;
> @@ -1660,6 +1742,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	init_rwsem(&vm->userptr.notifier_lock);
>   	spin_lock_init(&vm->userptr.invalidated_lock);
>   
> +	INIT_LIST_HEAD(&vm->faults.list);
> +	spin_lock_init(&vm->faults.lock);
> +
>   	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>   
>   	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> @@ -1930,6 +2015,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	}
>   	up_write(&xe->usm.lock);
>   
> +	xe_vm_clear_fault_entries(vm);
> +
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0ef811fc2bde..9bd7e93824da 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,12 @@
>   #include "xe_map.h"
>   #include "xe_vm_types.h"
>   
> +/**
> + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can store before future
> + * faults are discarded to prevent memory overuse
> + */
> +#define MAX_FAULTS_SAVED_PER_VM	50
> +
>   struct drm_device;
>   struct drm_printer;
>   struct drm_file;
> @@ -22,6 +28,7 @@ struct dma_fence;
>   
>   struct xe_exec_queue;
>   struct xe_file;
> +struct xe_gt_pagefault;
>   struct xe_sync_entry;
>   struct xe_svm_range;
>   struct drm_exec;
> @@ -257,6 +264,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>   
>   int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>   
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault *pf);
> +
>   bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>   
>   int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84fa41b9fa20..dc47c49c25e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -19,6 +19,7 @@
>   #include "xe_range_fence.h"
>   
>   struct xe_bo;
> +struct xe_pagefault;
>   struct xe_svm_range;
>   struct xe_sync_entry;
>   struct xe_user_fence;
> @@ -142,6 +143,23 @@ struct xe_userptr_vma {
>   
>   struct xe_device;
>   
> +/**
> + * struct xe_vm_fault_entry - Elements of vm->faults.list
> + * @list: link into @xe_vm.faults.list
> + * @address: address of the fault
> + * @address_type: type of address access that resulted in fault
> + * @address_precision: precision of faulted address
> + * @fault_level: fault level of the fault
> + */
> +struct xe_vm_fault_entry {
> +	struct list_head list;
> +	u64 address;
> +	u32 address_precision;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +};
> +
>   struct xe_vm {
>   	/** @gpuvm: base GPUVM used to track VMAs */
>   	struct drm_gpuvm gpuvm;
> @@ -305,6 +323,16 @@ struct xe_vm {
>   		bool capture_once;
>   	} error_capture;
>   
> +	/** @faults: List of all faults associated with this VM */
> +	struct {
> +		/** @faults.lock: lock protecting @faults.list */
> +		spinlock_t lock;
> +		/** @faults.list: list of xe_vm_fault_entry entries */
> +		struct list_head list;
> +		/** @faults.len: length of @faults.list */
> +		unsigned int len;
> +	} faults;
> +
>   	/**
>   	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
>   	 * protected by the vm resv.

