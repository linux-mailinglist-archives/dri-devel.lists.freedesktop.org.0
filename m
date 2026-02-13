Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP50Gu+mj2kVSQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:34:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C143E139D01
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0763A10E863;
	Fri, 13 Feb 2026 22:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQU/VJ+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5610E859;
 Fri, 13 Feb 2026 22:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771022055; x=1802558055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PLD7C4e6VXPhARYaTv+BJo236ap4wE8szQ1utPJ1HVA=;
 b=NQU/VJ+Nxg482+z3AsZvG6YgnkjCSg/YJGE3MEUT/KPnB5H/rZRClGXo
 WVSZaI/Eb5f3ucZFlnhkJdqwVTZCkqqDzScQwVZA6VwniDgO/J+L/rg/X
 Q62X8iuHqhuC7ufjiDlz9WvOBcxSdeZqPdrMuDK8xVkC9rHy6bMum1tFx
 JfCgq7c7FXOoGtoxhwawbSFho50EZmE6xt7tnGJ8lqDmdgsVNYL+NEnZd
 B8G4vmPcEfJSMJXDlg5Df7EQKmdpWA5Qf/cbt+qTYDidJQ9DdiBcdJAbm
 Go+1nm2d65G2q+ZRoZ9Nj+0rzZCKGVivosa7la2r/jxvgrvVy7trC8k1Y g==;
X-CSE-ConnectionGUID: bAJNoDvhTv2mzz7P0BVCUw==
X-CSE-MsgGUID: Ay4c7myfTF2UhV/xHFDv2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="94844923"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="94844923"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:34:15 -0800
X-CSE-ConnectionGUID: g5rn0XL5Qv+P6RVqodCQlw==
X-CSE-MsgGUID: COfsONUiRl+magH6ezWT7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="250698309"
Received: from dut4086lnl.fm.intel.com ([10.105.11.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:34:14 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v34 5/6] drm/xe/xe_vm: Add per VM fault info
Date: Fri, 13 Feb 2026 22:34:16 +0000
Message-ID: <20260213223410.99613-13-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213223410.99613-8-jonathan.cavitt@intel.com>
References: <20260213223410.99613-8-jonathan.cavitt@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pf.gt:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C143E139D01
X-Rspamd-Action: no action

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

uAPI: https://github.com/intel/compute-runtime/pull/878
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
 drivers/gpu/drm/xe/xe_pagefault.c | 26 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c        | 74 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h        |  9 ++++
 drivers/gpu/drm/xe/xe_vm_types.h  | 29 ++++++++++++
 4 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index c2ab183ded29..ff749bab27e8 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -254,6 +254,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 			     pf->consumer.engine_class_instance));
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
@@ -273,6 +298,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			xe_pagefault_print(&pf);
+			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
 			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
 				   ERR_PTR(err));
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 708e8c7becf8..d9004f9aae8a 100644
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
@@ -577,6 +578,74 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
+	u16 engine_class, engine_instance;
+	struct xe_hw_engine *hwe;
+
+	engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
+				 pf->consumer.engine_class_instance);
+	engine_instance = FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
+				    pf->consumer.engine_class_instance);
+	/* Do not report faults on reserved engines */
+	hwe = xe_gt_hw_engine(pf->gt, engine_class,
+			      engine_instance, false);
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
+	e->fault_type = FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
+				  pf->consumer.fault_type_level),
+	e->fault_level = FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
+				   pf->consumer.fault_type_level),
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
@@ -1538,6 +1607,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->faults.list);
+	spin_lock_init(&vm->faults.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1854,6 +1926,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	up_write(&xe->usm.lock);
 
+	xe_vm_clear_fault_entries(vm);
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 288115c7844a..fd3fc60f92bb 100644
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
@@ -312,6 +319,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
 
+void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf);
+
 /**
  * xe_vm_set_validating() - Register this task as currently making bos resident
  * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 43203e90ee3e..07546953cb19 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -23,6 +23,7 @@
 struct drm_pagemap;
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
@@ -175,6 +176,24 @@ struct xe_userptr_vma {
 
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
@@ -331,6 +350,16 @@ struct xe_vm {
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

