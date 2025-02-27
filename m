Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161CA488BB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E9910EB7D;
	Thu, 27 Feb 2025 19:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlVp5NM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553A10EB6C;
 Thu, 27 Feb 2025 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683703; x=1772219703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ygwgseD+pSXL9WMXnIjtX2LYFLZARZO4ekv2sJ0SsHQ=;
 b=SlVp5NM/v66iDscMwvRPyzGJ/5lvtu0GQ2PhJQY+r4JPcYQ4+UBpIPhb
 h4TXVReO+LYVJxaox9+G72mJi4gVEtrzNRwTbXjCkwb/UtV4NjDeeQoOe
 iKvao9nbXU+cmMTB4dZe6JIi6iZaWw8HDhECkMy1Brx7t5u4cnKBp25EQ
 Xrdj1D1WUeJEFy8pwX7oYv2mKV9hoDsS5+JCD1dbl9NovcJHMa9E52578
 rQ42wtAKVgL/cHqJwR+lw6r7zhhzCVCtFWdHRT9aqg3XLwAQ/4RYVLs67
 EGcqhgE/Wsm11wKGib+z2UWEmW+m01vJJTAZil4yeRDEq9VBIgIAcaz6B Q==;
X-CSE-ConnectionGUID: UkecLeLFTxKHMaE9nSfV8A==
X-CSE-MsgGUID: 7aLVJk2mQ4KMe7zbUmEQzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41850057"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41850057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
X-CSE-ConnectionGUID: 2ocHOdmNT8a46KgI2ys5zw==
X-CSE-MsgGUID: iWHQHUj5TRSKPlzdGanmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117775291"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/xe/xe_vm: Add per VM pagefault info
Date: Thu, 27 Feb 2025 19:14:53 +0000
Message-ID: <20250227191457.84035-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227191457.84035-1-jonathan.cavitt@intel.com>
References: <20250227191457.84035-1-jonathan.cavitt@intel.com>
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

Add additional information to vm so it can report up to the last 50
relevant exec queues to have been banned on it, as well as the last
pagefault seen when said exec queues were banned.  Since we cannot
reasonably associate a pagefault to a specific exec queue, we
currently report the last seen pagefault on the associated vm instead.

The last pagefault seen per exec queue is saved to the vm, and the
pagefault is updated during the pagefault handling process in
xe_gt_pagefault.  The last seen pagefault is reset once it has been
associated to the next banned exec queue.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c   |  6 +++
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 16 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 +
 drivers/gpu/drm/xe/xe_vm.c           | 69 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  6 +++
 drivers/gpu/drm/xe/xe_vm_types.h     | 31 +++++++++++++
 6 files changed, 130 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4a98a5d0e405..e0764f3dfd76 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -712,6 +712,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	q->id = id;
 	args->exec_queue_id = id;
 
+	/**
+	 * If an exec queue in the ban list shares the same exec queue
+	 * ID, remove it from the ban list to avoid confusion.
+	 */
+	xe_vm_remove_ban_entry(q->vm, q);
+
 	return 0;
 
 kill_exec_queue:
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 07b52d3c1a60..e23b9d33afa5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -335,6 +335,21 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
+{
+	struct xe_vm *vm;
+
+	vm = asid_to_vm(xe, pf->asid);
+	if (IS_ERR(vm))
+		return;
+
+	spin_lock(&vm->pf.lock);
+	if (!vm->pf.info)
+		vm->pf.info = kzalloc(sizeof(*pf), GFP_KERNEL);
+	memcpy(vm->pf.info, pf, sizeof(*pf));
+	spin_unlock(&vm->pf.lock);
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS	20
 
 static void pf_queue_work_func(struct work_struct *w)
@@ -353,6 +368,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		ret = handle_pagefault(gt, &pf);
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
+			save_pagefault_to_vm(xe, &pf);
 			pf.fault_unsuccessful = 1;
 			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 		}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b6a2dd742ebd..f0bfc9d109cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2066,6 +2066,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
+	xe_vm_add_ban_entry(q->vm, q);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..3e88652670e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -746,6 +746,62 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+static void free_ban_entry(struct xe_exec_queue_ban_entry *b)
+{
+	list_del(&b->list);
+	kfree(b->pf);
+	kfree(b);
+}
+
+void xe_vm_add_ban_entry(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	struct xe_exec_queue_ban_entry *b = NULL;
+	struct xe_file *xef = q->xef;
+
+	b = kzalloc(sizeof(*b), GFP_KERNEL);
+	xe_assert(xef->xe, b);
+
+	spin_lock(&vm->bans.lock);
+	list_add_tail(&b->list, &vm->bans.list);
+	vm->bans.len++;
+	/**
+	 * Limit the number of bans in the bans list to prevent memory overuse.
+	 */
+	if (vm->bans.len > MAX_BANS) {
+		struct xe_exec_queue_ban_entry *rem =
+			list_first_entry(&vm->bans.list, struct xe_exec_queue_ban_entry, list);
+
+		free_ban_entry(rem);
+		vm->bans.len--;
+	}
+	spin_unlock(&vm->bans.lock);
+
+	/**
+	 * Associate the current pagefault saved to the VM to the ban entry, and clear
+	 * the VM pagefault cache.  This is still valid if vm->pf.info is NULL.
+	 */
+	spin_lock(&vm->pf.lock);
+	b->pf = vm->pf.info;
+	vm->pf.info = NULL;
+	spin_unlock(&vm->pf.lock);
+
+	/** Save blame data to list element */
+	b->exec_queue_id = q->id;
+}
+
+void xe_vm_remove_ban_entry(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	struct xe_exec_queue_ban_entry *b, *tmp;
+
+	spin_lock(&vm->bans.lock);
+	list_for_each_entry_safe(b, tmp, &vm->bans.list, list)
+		if (b->exec_queue_id == q->id) {
+			free_ban_entry(b);
+			vm->bans.len--;
+		}
+	spin_unlock(&vm->bans.lock);
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1448,6 +1504,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
+	INIT_LIST_HEAD(&vm->bans.list);
+	spin_lock_init(&vm->bans.lock);
+	spin_lock_init(&vm->pf.lock);
+
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1672,6 +1732,15 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	up_write(&xe->usm.lock);
 
+	if (vm->bans.len) {
+		struct xe_exec_queue_ban_entry *b, *tmp;
+
+		spin_lock(&vm->bans.lock);
+		list_for_each_entry_safe(b, tmp, &vm->bans.list, list)
+			free_ban_entry(b);
+		spin_unlock(&vm->bans.lock);
+	}
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f66075f8a6fe..9f8457ceb905 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -12,6 +12,8 @@
 #include "xe_map.h"
 #include "xe_vm_types.h"
 
+#define MAX_BANS 50
+
 struct drm_device;
 struct drm_printer;
 struct drm_file;
@@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+void xe_vm_add_ban_entry(struct xe_vm *vm, struct xe_exec_queue *q);
+
+void xe_vm_remove_ban_entry(struct xe_vm *vm, struct xe_exec_queue *q);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52467b9b5348..e7e2d682b1b6 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,6 +18,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_pagefault;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
@@ -135,6 +136,15 @@ struct xe_userptr_vma {
 
 struct xe_device;
 
+struct xe_exec_queue_ban_entry {
+	/** @exec_queue_id: ID number of banned exec queue */
+	u32 exec_queue_id;
+	/** @pf: pagefault on engine of banned exec queue, if any at time */
+	struct xe_pagefault *pf;
+	/** @list: link into @xe_vm.bans.list */
+	struct list_head list;
+};
+
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
@@ -274,6 +284,27 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/**
+	 * @ban_list: List of relevant banned exec queues associated with this
+	 * vm, as well as any pagefaults at time of ban.
+	 */
+	struct {
+		/** @lock: lock protecting @bans.list */
+		spinlock_t lock;
+		/** @list: list of xe_exec_queue_ban_entry entries */
+		struct list_head list;
+		/** @len: length of @bans.list */
+		unsigned int len;
+	} bans;
+
+	/** @pf: the last pagefault seen on this VM */
+	struct {
+		/** @pf.info: info containing last seen pagefault details */
+		struct xe_pagefault *info;
+		/** @pf.lock: lock protecting @pf.info */
+		spinlock_t lock;
+	} pf;
+
 	/**
 	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
 	 * protected by the vm resv.
-- 
2.43.0

