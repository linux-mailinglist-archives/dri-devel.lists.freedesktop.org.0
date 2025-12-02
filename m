Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D1C9D2E6
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37EF10E6FF;
	Tue,  2 Dec 2025 22:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOYMM7Ej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB45310E6F3;
 Tue,  2 Dec 2025 22:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764713545; x=1796249545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcR4u2yrXvcyaeC14bm3N8nV9DL5sgJHgpFNzLBwHyw=;
 b=MOYMM7EjRFG5uiZsT1fmayNzxRjLGDlUu+dHsMBnhaWCl6wSHqqCn8BW
 mX6UurvqpcavPZFNTTsRk0R6CTgyDXZ4Ny3uzpFVdI5H39Y4gtvQ6ZdG+
 8rL7uI4WJ6BC+zX2QNYRLlE099JwJUSwdCwgY7iLYq9a9YKjU7huQ4dOn
 kWtFZvltRdc60PP2Lb/nypu8d0Q1dDXOyD3T9QvZgNL16vREDV47Aq2sN
 9Tc8ye/O+HEfEr0ytaIsl//HvVqGfOHminIIUBgZE3OO8lW2wSj9Vln0E
 U20ERb3ioZ7diR1SmO0jCvZrxZBMeQAUcbHmfAicB3JQK06Lv9t9bedzn g==;
X-CSE-ConnectionGUID: qUonLzCbRZO8lvKzzqcDEA==
X-CSE-MsgGUID: U6lJyaedRXebKITqyjE6Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84096320"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="84096320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:12:25 -0800
X-CSE-ConnectionGUID: Hcy+M9llSc2SeEgK9lW/kw==
X-CSE-MsgGUID: IozWHKyzTcOmdiRsom8jPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194490342"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:12:25 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v30 4/5] drm/xe/xe_vm: Add per VM fault info
Date: Tue,  2 Dec 2025 22:12:26 +0000
Message-ID: <20251202221221.106060-11-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202221221.106060-7-jonathan.cavitt@intel.com>
References: <20251202221221.106060-7-jonathan.cavitt@intel.com>
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

v16:
- Set address precision programmatically (Matt Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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
index 47dec46515b5..ee1b788bcfbd 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -249,6 +249,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
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
@@ -268,6 +293,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			xe_pagefault_print(&pf);
+			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
 			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
 				  ERR_PTR(err));
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 00ffd3f03983..41fd352dcfb2 100644
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
+	e->address_precision = BIT(pf->consumer.addr_precision);
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

