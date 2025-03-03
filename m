Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B4A4CDCF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 23:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80E10E4D9;
	Mon,  3 Mar 2025 22:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rhhy0l0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBECB10E235;
 Mon,  3 Mar 2025 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741039224; x=1772575224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ksrhyIFFuVNADM71BLAvUe4t69j+RSl3hoFpoJSaVg=;
 b=Rhhy0l0z9Jnc4p2bb+OcT/NZzisacUyI3APXbnTb9juJLJ/zE422j3N8
 gjXhM2C3+AII/AeaSsOQgXnKkj8npm0MjXtvMhaNNDuebHxpyKpNW+3hd
 GlSv70L5mrn6oIvaMdnsvPZZCYfyxrmu4Bsnr/UuQphM44y35Qm1Q8LRt
 4M1btLA3ukEK12eWl4CSp2/BcO1IwamOhyUh5oR7Gg1+aue7mvw23jxBV
 xDM8eV2Kc8imqMqn7DuXs2ff2HM2a7JnehncREtXY4UA4hHvSj4jK6xBn
 733/nLxaomkWZxS8+FzwtAaKhfFytvfm8JnVElIaPJsJrK/U4vnR+GFHr A==;
X-CSE-ConnectionGUID: hNa7iliNREeHvWQ1G086lw==
X-CSE-MsgGUID: SwxorS8PTbqtQ+IFLyBN/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41846106"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41846106"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:24 -0800
X-CSE-ConnectionGUID: q5aOpjvKQAKju/gxjMYWvA==
X-CSE-MsgGUID: h14D1PlaRHiSW1V9P6EXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118020897"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:23 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/6] drm/xe/xe_vm: Add per VM pagefault info
Date: Mon,  3 Mar 2025 22:00:19 +0000
Message-ID: <20250303220022.67200-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303220022.67200-1-jonathan.cavitt@intel.com>
References: <20250303220022.67200-1-jonathan.cavitt@intel.com>
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

Add additional information to each VM so they can report up to the last
50 seen pagefaults.  Only failed pagefaults are saved this way, as
successful pagefaults should recover and not need to be reported to
userspace.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 45 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 07b52d3c1a60..84907fb4295e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -335,6 +335,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
+	store = kzalloc(sizeof(*pf), GFP_KERNEL);
+	memcpy(store, pf, sizeof(*pf));
+	xe_vm_add_pf_entry(vm, store);
+	spin_unlock(&vm->pfs.lock);
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -353,6 +369,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		ret = handle_pagefault(gt, &pf);
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
+			save_pagefault_to_vm(xe, &pf);
 			pf.fault_unsuccessful = 1;
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..6211b971bbbd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -746,6 +746,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+static void free_pf_entry(struct xe_vm *vm, struct xe_vm_pf_entry *e)
+{
+	list_del(&e->list);
+	kfree(e->pf);
+	kfree(e);
+	vm->pfs.len--;
+}
+
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	struct xe_vm_pf_entry *e = NULL;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	xe_assert(vm->xe, e);
+
+	spin_lock(&vm->pfs.lock);
+	list_add_tail(&e->list, &vm->pfs.list);
+	vm->pfs.len++;
+	/**
+	 * Limit the number of pfs in the pf list to prevent memory overuse.
+	 */
+	if (vm->pfs.len > MAX_PFS) {
+		struct xe_vm_pf_entry *rem =
+			list_first_entry(&vm->pfs.list, struct xe_vm_pf_entry, list);
+
+		free_pf_entry(vm, rem);
+	}
+	spin_unlock(&vm->pfs.lock);
+}
+
+void xe_vm_remove_pf_entries(struct xe_vm *vm)
+{
+	struct xe_vm_pf_entry *e, *tmp;
+
+	spin_lock(&vm->pfs.lock);
+	list_for_each_entry_safe(e, tmp, &vm->pfs.list, list)
+		free_pf_entry(vm, e);
+	spin_unlock(&vm->pfs.lock);
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1448,6 +1488,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->pfs.list);
+	spin_lock_init(&vm->pfs.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1672,6 +1715,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	up_write(&xe->usm.lock);
 
+	xe_vm_remove_pf_entries(vm);
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f66075f8a6fe..4d94ab5c8ea4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -12,6 +12,8 @@
 #include "xe_map.h"
 #include "xe_vm_types.h"
 
+#define MAX_PFS 50
+
 struct drm_device;
 struct drm_printer;
 struct drm_file;
@@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
+
+void xe_vm_remove_pf_entries(struct xe_vm *vm);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52467b9b5348..10b0952db56c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,6 +18,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
@@ -135,6 +136,13 @@ struct xe_userptr_vma {
 
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
@@ -274,6 +282,18 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/**
+	 * @pfs: List of all pagefaults associated with this VM
+	 */
+	struct {
+		/** @lock: lock protecting @bans.list */
+		spinlock_t lock;
+		/** @list: list of xe_exec_queue_ban_entry entries */
+		struct list_head list;
+		/** @len: length of @bans.list */
+		unsigned int len;
+	} pfs;
+
 	/**
 	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
 	 * protected by the vm resv.
-- 
2.43.0

