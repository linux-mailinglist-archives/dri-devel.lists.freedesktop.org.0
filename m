Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE567A57508
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEE610EC4F;
	Fri,  7 Mar 2025 22:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn97wpRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75D610EC4A;
 Fri,  7 Mar 2025 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741387287; x=1772923287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVEIr0GAt/ehGXtUiySLkm+uo9SWZ64IkwXf4+N1b4c=;
 b=dn97wpRur6+xkh5dxX6wrDBE6oenFB7XWc5EFzDKX+2509nrEOV3Teza
 5KnuAGnOVhLi5ZFKG9aiBICc7V75DzErKcIe82oefgK/d388SVdlbdJof
 DOVzZfzV8CzPYjoG7eK6BW8e4awBfe//uNaHs+KXn8EX4zO2DlLCNIdVw
 O3k0DD+QB2kW8fGEZjnuERCNjdAqgHxt/J8QcUtfJTE1v9PwbD15GIp4u
 1Qk6sjo1ghhRRnicsDwcYbOalAs/Y2pBjx3JlKw1fiYC/ip627BDKjAQ1
 oEcsaW4iFtkXuds4M3HB/2IdtAYIeIUNP4ygo8uYmmlMgQpCm/ws5qBPO A==;
X-CSE-ConnectionGUID: qDh9VGVvTbqGeq18bAfYFg==
X-CSE-MsgGUID: JX5KdErUQHWq2I0Q50T/vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41704518"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="41704518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:26 -0800
X-CSE-ConnectionGUID: 923c6qudTw2EUMhI8cGasQ==
X-CSE-MsgGUID: 1WvN6JyhS+aRvK/pume62A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124457950"
Received: from dut4440lnl.fm.intel.com ([10.105.10.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:26 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/6] drm/xe/xe_vm: Add per VM pagefault info
Date: Fri,  7 Mar 2025 22:41:21 +0000
Message-ID: <20250307224125.111430-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307224125.111430-1-jonathan.cavitt@intel.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
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

Add additional information to each VM so they can report up to the first
50 seen pagefaults.  Only failed pagefaults are saved this way, as
successful pagefaults should recover and not need to be reported to
userspace.

v2:
- Free vm after use (Shuicheng)
- Compress pf copy logic (Shuicheng)
- Update fault_unsuccessful before storing (Shuicheng)
- Fix old struct name in comments (Shuicheng)
- Keep first 50 pagefaults instead of last 50 (Jianxun)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 42 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c8a9058aa09f..964ca1efb698 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -343,6 +343,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
+{
+	struct xe_vm *vm;
+	struct xe_pagefault *store;
+
+	vm = asid_to_vm(xe, pf->asid);
+	if (IS_ERR(vm))
+		return;
+
+	spin_lock(&vm->pfs.lock);
+	store = kmemdup(pf, sizeof(*pf), GFP_KERNEL);
+	xe_vm_add_pf_entry(vm, store);
+	spin_unlock(&vm->pfs.lock);
+	xe_vm_put(vm);
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -362,6 +378,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
 			pf.fault_unsuccessful = 1;
+			save_pagefault_to_vm(xe, &pf);
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22a26aff3a6e..eada3ecc2364 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -778,6 +778,43 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct xe_vm_pf_entry *e = NULL;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	xe_assert(vm->xe, e);
+
+	spin_lock(&vm->pfs.lock);
+
+	/**
+	 * Limit the number of pfs in the pf list to prevent memory overuse.
+	 */
+	if (vm->pfs.len >= MAX_PFS) {
+		kfree(e);
+		spin_unlock(&vm->pfs.lock);
+		return;
+	}
+
+	list_add_tail(&e->list, &vm->pfs.list);
+	vm->pfs.len++;
+	spin_unlock(&vm->pfs.lock);
+}
+
+void xe_vm_remove_pf_entries(struct xe_vm *vm)
+{
+	struct xe_vm_pf_entry *e, *tmp;
+
+	spin_lock(&vm->pfs.lock);
+	list_for_each_entry_safe(e, tmp, &vm->pfs.list, list) {
+		list_del(&e->list);
+		kfree(e->pf);
+		kfree(e);
+	}
+	vm->pfs.len = 0;
+	spin_unlock(&vm->pfs.lock);
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1660,6 +1697,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->pfs.list);
+	spin_lock_init(&vm->pfs.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1930,6 +1970,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	up_write(&xe->usm.lock);
 
+	xe_vm_remove_pf_entries(vm);
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0ef811fc2bde..fe068e4448a6 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -12,6 +12,8 @@
 #include "xe_map.h"
 #include "xe_vm_types.h"
 
+#define MAX_PFS	50
+
 struct drm_device;
 struct drm_printer;
 struct drm_file;
@@ -257,6 +259,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
+
+void xe_vm_remove_pf_entries(struct xe_vm *vm);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 84fa41b9fa20..3a2329f54fb1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -19,6 +19,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
@@ -142,6 +143,13 @@ struct xe_userptr_vma {
 
 struct xe_device;
 
+struct xe_vm_pf_entry {
+	/** @pf: observed pagefault */
+	struct xe_pagefault *pf;
+	/** @list: link into @xe_vm.pfs.list */
+	struct list_head list;
+};
+
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
@@ -305,6 +313,18 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/**
+	 * @pfs: List of all pagefaults associated with this VM
+	 */
+	struct {
+		/** @lock: lock protecting @pfs.list */
+		spinlock_t lock;
+		/** @list: list of xe_exec_queue_ban_entry entries */
+		struct list_head list;
+		/** @len: length of @pfs.list */
+		unsigned int len;
+	} pfs;
+
 	/**
 	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
 	 * protected by the vm resv.
-- 
2.43.0

