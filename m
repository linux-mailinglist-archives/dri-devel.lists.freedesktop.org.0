Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC0A5FF52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 19:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE22410E911;
	Thu, 13 Mar 2025 18:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETxOkPzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556B10E90B;
 Thu, 13 Mar 2025 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741890858; x=1773426858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oOFeBTpk3EErhmr27oaHR3HsjNEksIbd7NWrIX1Uszk=;
 b=ETxOkPzkQ8jbDY6RsCjLyT7DPHS+xMOZeg8RB3C8JSw9dGOkL2jr3+rC
 PM2AqhRuvmQ4haEDegJjQiAiferjHDGU96syVIGYZkz64lbpsnrYihOm/
 B4GNPP51/KYIjuu95tzIJUAnCJm+fG09V14iWgWGzJpzZNsmKCbuTKwwi
 wOzO2SCamyZODl1r0OgcOrukazHeBnglV6ZYEksd1gSPxP/p9Si7CUtcJ
 bKD+xKVmMmTLE8+Erko0lW4LOsh1QqY5g0Y0b96K+4/m9dPfwlHRMQQBp
 x0ht+05mr/i505B9FQR04EaOiR9/CbUb+5qSN7fIM/R3/toT9EFt1+dHp g==;
X-CSE-ConnectionGUID: NEPV0cZ/SquRhfo26j/O5Q==
X-CSE-MsgGUID: 1GLKl0tsSk2QGeuEE/JWlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="65485462"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="65485462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:34:18 -0700
X-CSE-ConnectionGUID: E2Db/AffSSOms+pl21uvhg==
X-CSE-MsgGUID: Qh7+YtX/QjeeunOZYfjlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="151900781"
Received: from dut4440lnl.fm.intel.com ([10.105.10.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:34:18 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mzorek@intel.com
Subject: [PATCH v8 5/6] drm/xe/xe_vm: Add per VM fault info
Date: Thu, 13 Mar 2025 18:34:07 +0000
Message-ID: <20250313183415.133863-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313183415.133863-1-jonathan.cavitt@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Jianxun Zhang <jianxun.zhang@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Michal Mzorek <michal.mzorek@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 21 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 58 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  9 +++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 33 ++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e67ee7ac3df7..927b83f7a384 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -346,6 +346,26 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+static void save_pagefault_to_vm(struct xe_device *xe, struct xe_gt_pagefault *pf)
+{
+	struct xe_vm *vm;
+
+	vm = asid_to_vm(xe, pf->asid);
+	if (IS_ERR(vm))
+		return;
+
+	spin_lock(&vm->faults.lock);
+
+	/**
+	 * Limit the number of faults in the fault list to prevent memory overuse.
+	 */
+	if (vm->faults.len < MAX_FAULTS_SAVED_PER_VM)
+		xe_vm_add_fault_entry_pf(vm, pf);
+
+	spin_unlock(&vm->faults.lock);
+	xe_vm_put(vm);
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -365,6 +385,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
 			pf.fault_unsuccessful = 1;
+			save_pagefault_to_vm(xe, &pf);
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 60303998bd61..067a9cedcad9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -778,6 +778,59 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
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
+void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault *pf)
+{
+	struct xe_vm_fault_entry *e = NULL;
+
+	spin_lock(&vm->faults.lock);
+
+	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM)
+		goto out;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e) {
+		drm_warn(&vm->xe->drm,
+			 "Could not allocate memory for fault %i!",
+			 vm->faults.len);
+		goto out;
+	}
+
+	e->address = pf->page_addr;
+	e->address_type = pf->address_type;
+	e->address_precision = 1;
+	e->fault_level = pf->fault_level;
+	e->engine_class = pf->engine_class;
+	e->engine_instance = pf->engine_instance;
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
@@ -1660,6 +1713,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->faults.list);
+	spin_lock_init(&vm->faults.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1930,6 +1986,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
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
index 84fa41b9fa20..da5beace981b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -19,6 +19,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_user_fence;
@@ -142,6 +143,26 @@ struct xe_userptr_vma {
 
 struct xe_device;
 
+/**
+ * struct xe_vm_fault_entry - Elements of vm->faults.list
+ * @list: link into @xe_vm.faults.list
+ * @address: address of the fault
+ * @address_type: type of address access that resulted in fault
+ * @address_precision: precision of faulted address
+ * @fault_level: fault level of the fault
+ * @engine_class: class of engine fault was reported on
+ * @engine_instance: instance of engine fault was reported on
+ */
+struct xe_vm_fault_entry {
+	struct list_head list;
+	u64 address;
+	u32 address_type;
+	u32 address_precision;
+	u8 fault_level;
+	u8 engine_class;
+	u8 engine_instance;
+};
+
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
@@ -305,6 +326,18 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/**
+	 * @faults: List of all faults associated with this VM
+	 */
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

