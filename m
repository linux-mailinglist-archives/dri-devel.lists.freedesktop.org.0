Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34083A59D2F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 18:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53610E4A0;
	Mon, 10 Mar 2025 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJBI+axq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADA510E035;
 Mon, 10 Mar 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741627115; x=1773163115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsipTt1k9/FM2apeWsJlDMOg2QIEVx+/BwBUSDI+FD4=;
 b=OJBI+axqz2QTC14b+BRt485K1IUu4EjW1QynpCqjtkvWH/CK4+DjdT5E
 a1XrLTy1ctUgykm7TwXvkpMny8t9AsmmGX4JzSqUYacweDpl7WQ7xAHpb
 hhaaXwTF2DjJYMvyzsVWN+i7ZhxGyXPX5LDjIX3Dnzdcif+dW/kV1cntw
 FioF2z3/VozXV9hVhQNroKe19myn0rrBnFVDw4IfcYJUXuoxPh6qlQCVQ
 Oiu9qjYOPEVlbvSJ+AFVRqjfXfAMM0gNg1HxPdeVoioI2HroU6IyFc+sp
 dLgmG6HfVNisz17yO65KecenS6p7bdHUNoN9Ekqv7kvHp+73SxiyxZkEp A==;
X-CSE-ConnectionGUID: JicM/SjfRM6MdobHKiQThA==
X-CSE-MsgGUID: ZZYDpBsLR56HIEl/nY4Pmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42669301"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42669301"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:35 -0700
X-CSE-ConnectionGUID: qBLZt45iR+eh7LirqTebAw==
X-CSE-MsgGUID: tgcP2OqzQRexJjMgrJGjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125097621"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:34 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 3/6] drm/xe/xe_vm: Add per VM pagefault info
Date: Mon, 10 Mar 2025 17:18:31 +0000
Message-ID: <20250310171834.78299-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310171834.78299-1-jonathan.cavitt@intel.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
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

v3:
- Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
- Fix double-locking error (jcavitt)
- Assert kmemdump is successful (Shuicheng)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 32 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  6 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++++++
 4 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c8a9058aa09f..7661b9ad1cd0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -343,6 +343,34 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
+
+	/**
+	 * Limit the number of pfs in the pf list to prevent memory overuse.
+	 */
+	if (vm->pfs.len < MAX_PFS) {
+		store = kmemdup(pf, sizeof(*pf), GFP_KERNEL);
+		if (store)
+			xe_vm_add_pf_entry(vm, store);
+		else
+			drm_warn(&vm->xe->drm,
+				 "Could not allocate memory for fault %i!",
+				 vm->pfs.len);
+	}
+
+	spin_unlock(&vm->pfs.lock);
+	xe_vm_put(vm);
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -362,6 +390,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
 			pf.fault_unsuccessful = 1;
+			save_pagefault_to_vm(xe, &pf);
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22a26aff3a6e..ff79ba8d3794 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -778,6 +778,33 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	/** vm->pfs.lock must be held before calling this function */
+	struct xe_vm_pf_entry *e = NULL;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	xe_assert(vm->xe, e);
+	e->pf = pf;
+
+	list_add_tail(&e->list, &vm->pfs.list);
+	vm->pfs.len++;
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
@@ -1660,6 +1687,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->pfs.list);
+	spin_lock_init(&vm->pfs.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1930,6 +1960,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
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

