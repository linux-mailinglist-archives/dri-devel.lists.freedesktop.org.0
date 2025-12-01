Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62DC99A1B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B49110E4EF;
	Mon,  1 Dec 2025 23:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGJ5OXU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B43B10E4E6;
 Mon,  1 Dec 2025 23:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764633344; x=1796169344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wnaUOhTqzHm0ixA9xTuLMLaegi0P+UccqYVXdgYlnD4=;
 b=OGJ5OXU9BOAO57OJbqGr9DL9KylK0H5Z3pjK3Tn0APlEjPok/ACbARdF
 ykMA2hiJc9D82Nmu+5BGT+wlX470Osi9TiBNh6DupX4+IjjTe4rMiDT2w
 rpccObmUsrcGgSPsoE+YDIpn0Z4rNlhDe5bPwOlEWMP8oyS3xcr+jVyiQ
 6xL7Q5xfrxHhuQmO02nSZFbd4V4s/sESyrDxpS+gHK0qJKT+Z61f7/CmN
 +eEivQ05bdPufU310MTn6ZDJkoLMmb9uJGMJfCMJBeqlObJy95/fpqEL/
 WJg3+pkE3G6dN6FP+VSUQmoGyTc/H5mYgsCZqVCDsqjDxaKKVYN4Bpbcp A==;
X-CSE-ConnectionGUID: hRqU3OlQQM+StaIREzi/sw==
X-CSE-MsgGUID: rNf5KKoLR1+5lE7tUBciyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89235940"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89235940"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:55:43 -0800
X-CSE-ConnectionGUID: pqVTVjZ5T06M69uSrhvbeA==
X-CSE-MsgGUID: D+0Y1bqqSbS07VW/ACnwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198410931"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:55:44 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Date: Mon,  1 Dec 2025 23:55:43 +0000
Message-ID: <20251201235539.236686-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201235539.236686-6-jonathan.cavitt@intel.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
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
50 seen faults.  Only pagefaults are saved this way currently, though in
the future, all faults should be tracked by the VM for future reporting.

Additionally, of the pagefaults reported, only failed pagefaults are
saved this way, as successful pagefaults should recover silently and not
need to be reported to userspace.

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

v4:
- Rename xe_vm.pfs to xe_vm.faults (jcavitt)
- Store fault data and not pagefault in xe_vm faults list (jcavitt)
- Store address, address type, and address precision per fault (jcavitt)
- Store engine class and instance data per fault (Jianxun)
- Add and fix kernel docs (Michal W)
- Properly handle kzalloc error (Michal W)
- s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
- Store fault level per fault (Micahl M)

v5:
- Store fault and access type instead of address type (Jianxun)

v6:
- Store pagefaults in non-fault-mode VMs as well (Jianxun)

v7:
- Fix kernel docs and comments (Michal W)

v8:
- Fix double-locking issue (Jianxun)

v9:
- Do not report faults from reserved engines (Jianxun)

v10:
- Remove engine class and instance (Ivan)

v11:
- Perform kzalloc outside of lock (Auld)

v12:
- Fix xe_vm_fault_entry kernel docs (Shuicheng)

v13:
- Rebase and refactor (jcavitt)

v14:
- Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)

v15:
- s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
- Use guard instead of spin_lock/unlock (Matt Brost)
- GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
  instead of creating a new helper function (Matt Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Jianxun Zhang <jianxun.zhang@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Michal Mzorek <michal.mzorek@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 26 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c        | 67 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h        |  9 +++++
 drivers/gpu/drm/xe/xe_vm_types.h  | 29 +++++++++++++
 4 files changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 0b625a52a598..0fe092226d0a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		  pf->consumer.engine_instance);
 }
 
+static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
+{
+	struct xe_vm *vm;
+
+	/*
+	 * Pagefault may be asociated to VM that is not in fault mode.
+	 * Perform asid_to_vm behavior, except if VM is not in fault
+	 * mode, return VM anyways.
+	 */
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
+	if (vm)
+		xe_vm_get(vm);
+	else
+		vm = ERR_PTR(-EINVAL);
+	up_read(&xe->usm.lock);
+
+	if (IS_ERR(vm))
+		return;
+
+	xe_vm_add_fault_entry_pf(vm, pf);
+
+	xe_vm_put(vm);
+}
+
 static void xe_pagefault_queue_work(struct work_struct *w)
 {
 	struct xe_pagefault_queue *pf_queue =
@@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			xe_pagefault_print(&pf);
+			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
 			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
 				  ERR_PTR(err));
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8ab726289583..dc6c36191274 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -27,6 +27,7 @@
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
+#include "xe_gt.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -578,6 +579,67 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
+/**
+ * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
+ * @vm: The VM.
+ * @pf: The pagefault.
+ *
+ * This function takes the data from the pagefault @pf and saves it to @vm->faults.list.
+ *
+ * The function exits silently if the list is full, and reports a warning if the pagefault
+ * could not be saved to the list.
+ */
+void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct xe_vm_fault_entry *e = NULL;
+	struct xe_hw_engine *hwe;
+
+	/* Do not report faults on reserved engines */
+	hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
+			      pf->consumer.engine_instance, false);
+	if (!hwe || xe_hw_engine_is_reserved(hwe))
+		return;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e) {
+		drm_warn(&vm->xe->drm,
+			 "Could not allocate memory for fault!\n");
+		return;
+	}
+
+	guard(spinlock)(&vm->faults.lock);
+
+	/*
+	 * Limit the number of faults in the fault list to prevent
+	 * memory overuse.
+	 */
+	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM) {
+		kfree(e);
+		return;
+	}
+
+	e->address = pf->consumer.page_addr;
+	e->address_precision = 1;
+	e->access_type = pf->consumer.access_type;
+	e->fault_type = pf->consumer.fault_type;
+	e->fault_level = pf->consumer.fault_level;
+
+	list_add_tail(&e->list, &vm->faults.list);
+	vm->faults.len++;
+}
+
+static void xe_vm_clear_fault_entries(struct xe_vm *vm)
+{
+	struct xe_vm_fault_entry *e, *tmp;
+
+	guard(spinlock)(&vm->faults.lock);
+	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
+		list_del(&e->list);
+		kfree(e);
+	}
+	vm->faults.len = 0;
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1503,6 +1565,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->faults.list);
+	spin_lock_init(&vm->faults.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1808,6 +1873,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	up_write(&xe->usm.lock);
 
+	xe_vm_clear_fault_entries(vm);
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 361f10b3c453..e9f2de4189e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -12,6 +12,12 @@
 #include "xe_map.h"
 #include "xe_vm_types.h"
 
+/**
+ * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can store before future
+ * faults are discarded to prevent memory overuse
+ */
+#define MAX_FAULTS_SAVED_PER_VM	50
+
 struct drm_device;
 struct drm_printer;
 struct drm_file;
@@ -22,6 +28,7 @@ struct dma_fence;
 
 struct xe_exec_queue;
 struct xe_file;
+struct xe_pagefault;
 struct xe_sync_entry;
 struct xe_svm_range;
 struct drm_exec;
@@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
 
+void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf);
+
 /**
  * xe_vm_set_validating() - Register this task as currently making bos resident
  * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3bf912bfbdcc..fff914fb0aa6 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -20,6 +20,7 @@
 #include "xe_userptr.h"
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
@@ -165,6 +166,24 @@ struct xe_userptr_vma {
 
 struct xe_device;
 
+/**
+ * struct xe_vm_fault_entry - Elements of vm->faults.list
+ * @list: link into @xe_vm.faults.list
+ * @address: address of the fault
+ * @address_precision: precision of faulted address
+ * @access_type: type of address access that resulted in fault
+ * @fault_type: type of fault reported
+ * @fault_level: fault level of the fault
+ */
+struct xe_vm_fault_entry {
+	struct list_head list;
+	u64 address;
+	u32 address_precision;
+	u8 access_type;
+	u8 fault_type;
+	u8 fault_level;
+};
+
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
@@ -302,6 +321,16 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/** @faults: List of all faults associated with this VM */
+	struct {
+		/** @faults.lock: lock protecting @faults.list */
+		spinlock_t lock;
+		/** @faults.list: list of xe_vm_fault_entry entries */
+		struct list_head list;
+		/** @faults.len: length of @faults.list */
+		unsigned int len;
+	} faults;
+
 	/**
 	 * @validation: Validation data only valid with the vm resv held.
 	 * Note: This is really task state of the task holding the vm resv,
-- 
2.43.0

