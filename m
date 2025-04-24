Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD5A9B129
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC210E838;
	Thu, 24 Apr 2025 14:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/w/Zzy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D22B10E446;
 Thu, 24 Apr 2025 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505494; x=1777041494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcoBbx2tQXPZRHnvkDwpXRZZanH+wBCZxJwdKdlI7UI=;
 b=g/w/Zzy7kQR+hdenU5FSYcLJg7Y9xnEVTvu9jTNaD3ae0w8N11E6cqPW
 x12VXa9n2yXUEwhxjOQUuERUBi5xH2YShhYdJuZ1NPJKfut/hE21sSTrj
 ojvKsltlxVyW7t6wii74OMaRyhKkpdU9K06XRt3No7n1bEZfCSeE6HP8p
 4bECAdIOslwY3gkRk47v+ulaPqhf4vryBgwa1HdhekyDmoWr19qJiqbEw
 jIhXueT41IOHcNYGYUPIqT/QzZt1nsv9jsX04VK6cKqBz6XeU6Xwya+2X
 AbQnsnPI03p72y0Nx3UdukjWEIyuW5JoSXRS2/uxRJga5fW+HU8+56ef5 Q==;
X-CSE-ConnectionGUID: cvkUfgMnR6+Gzb+E2f0UTw==
X-CSE-MsgGUID: 7FqpE06RQhqdy7sSspZ7Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50952217"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50952217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:38:13 -0700
X-CSE-ConnectionGUID: Bk2xcOjvScazpcPVq97Ahw==
X-CSE-MsgGUID: b6412Gy+QHyjLruxiGzgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132615120"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4046PTLH.fm.intel.com) ([10.105.8.85])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:38:12 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com
Subject: [PATCH v22 4/5] drm/xe/xe_vm: Add per VM fault info
Date: Thu, 24 Apr 2025 14:38:09 +0000
Message-ID: <20250424143812.11210-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424143812.11210-1-jonathan.cavitt@intel.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Jianxun Zhang <jianxun.zhang@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Michal Mzorek <michal.mzorek@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 26 ++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 88 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  9 +++
 drivers/gpu/drm/xe/xe_vm_types.h     | 29 +++++++++
 4 files changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 93afa54c8780..a84f6247f8a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -345,6 +345,31 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+static void save_pagefault_to_vm(struct xe_device *xe, struct xe_gt_pagefault *pf)
+{
+	struct xe_vm *vm;
+
+	/*
+	 * Pagefault may be associated to VM that is not in fault mode.
+	 * Perform asid_to_vm behavior, except if vm is not in fault
+	 * mode, return the VM anyways.
+	 */
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
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
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -364,6 +389,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
 			pf.fault_unsuccessful = 1;
+			save_pagefault_to_vm(xe, &pf);
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c69ef6b5ec5..107e397b4987 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -27,7 +27,9 @@
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
+#include "xe_gt.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_pagefault_types.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
@@ -778,6 +780,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+static struct xe_hw_engine *
+hw_engine_lookup_class_instance(struct xe_vm *vm,
+				enum xe_engine_class class,
+				u16 instance)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id)
+		for_each_hw_engine(hwe, gt, id)
+			if (hwe->class == class && hwe->instance == instance)
+				return hwe;
+	return NULL;
+}
+
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
+void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault *pf)
+{
+	struct xe_vm_fault_entry *e = NULL;
+	struct xe_hw_engine *hwe;
+
+	/* Do not report faults on reserved engines */
+	hwe = hw_engine_lookup_class_instance(vm, pf->engine_class, pf->engine_instance);
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
+	spin_lock(&vm->faults.lock);
+
+	/*
+	 * Limit the number of faults in the fault list to prevent
+	 * memory overuse.
+	 */
+	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM) {
+		kfree(e);
+		goto out;
+	}
+
+	e->address = pf->page_addr;
+	e->address_precision = 1;
+	e->access_type = pf->access_type;
+	e->fault_type = pf->fault_type;
+	e->fault_level = pf->fault_level;
+
+	list_add_tail(&e->list, &vm->faults.list);
+	vm->faults.len++;
+out:
+	spin_unlock(&vm->faults.lock);
+}
+
+static void xe_vm_clear_fault_entries(struct xe_vm *vm)
+{
+	struct xe_vm_fault_entry *e, *tmp;
+
+	spin_lock(&vm->faults.lock);
+	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
+		list_del(&e->list);
+		kfree(e);
+	}
+	vm->faults.len = 0;
+	spin_unlock(&vm->faults.lock);
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1660,6 +1743,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->faults.list);
+	spin_lock_init(&vm->faults.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1930,6 +2016,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	up_write(&xe->usm.lock);
 
+	xe_vm_clear_fault_entries(vm);
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0ef811fc2bde..9bd7e93824da 100644
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
+struct xe_gt_pagefault;
 struct xe_sync_entry;
 struct xe_svm_range;
 struct drm_exec;
@@ -257,6 +264,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault *pf);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1662604c4486..38e9f5d66386 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -19,6 +19,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
@@ -142,6 +143,24 @@ struct xe_userptr_vma {
 
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
@@ -305,6 +324,16 @@ struct xe_vm {
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
 	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
 	 * protected by the vm resv.
-- 
2.43.0

