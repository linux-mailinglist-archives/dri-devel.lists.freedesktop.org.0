Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080CBA33549
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16DA10E9F9;
	Thu, 13 Feb 2025 02:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Czty0FO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940BC10E397;
 Thu, 13 Feb 2025 02:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412618; x=1770948618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fv3fkyR6germfRGByo2a+Euzom3ewJl8GmTpgUT20nA=;
 b=Czty0FO+XuXMxybbYrAXiQciBY0HXQQaXyqLH+WrDvtzLXBcbeumUkV4
 lJeFN0t6+yqTNuDATtSt4Kg/vZ5D65/x5zLk7SapQ+xrsZTF3RWvR/pQy
 Nzep/rgYDCAafeMU5ZXjblwN95pzAoEg12Z4TY2hdIJiY0OInImAy2DDn
 kdvA8p0Jsum503xo0dF15WnsO+PWd2/olTbD9i9i4c+igI3fODK1+G9Nu
 +13k7Bjq+p9YqbnMs6HOsdsc1/gcbCgBv0vKiuPUU+dawCyPh7vUVQS87
 3XwI9YnyyZeR2dnzAyy8U9CyfWqd/yQiS2MkC4PJz/ajkktzvQHYTn3A/ g==;
X-CSE-ConnectionGUID: grjIM0J6RVaRVcowEVUlVA==
X-CSE-MsgGUID: oh4BNZDqS8GNLkKTBG5LAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455992"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455992"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
X-CSE-ConnectionGUID: ZGGMmRkbTP2V2T2dzBLyXg==
X-CSE-MsgGUID: 1t1PVidMSZWeOG1EpAH4VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945078"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 15/32] drm/xe: Add SVM garbage collector
Date: Wed, 12 Feb 2025 18:10:55 -0800
Message-Id: <20250213021112.1228481-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add basic SVM garbage collector which destroy a SVM range upon a MMU
UNMAP event. The garbage collector runs on worker or in GPU fault
handler and is required as locks in the path of reclaim are required and
cannot be taken the notifier.

v2:
 - Flush garbage collector in xe_svm_close
v3:
 - Better commit message (Thomas)
 - Kernel doc (Thomas)
 - Use list_first_entry_or_null for garbage collector loop (Thomas)
 - Don't add to garbage collector if VM is closed (Thomas)
v4:
 - Use %pe to print error (Thomas)
v5:
 - s/visable/visible (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 91 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h      |  5 ++
 drivers/gpu/drm/xe/xe_vm.c       |  4 ++
 drivers/gpu/drm/xe/xe_vm_types.h | 18 +++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d9d93d12f595..ed91291a24db 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -38,6 +38,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 	if (!range)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&range->garbage_collector_link);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
 
 	return &range->base;
@@ -54,6 +55,24 @@ static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 	return container_of(r, struct xe_svm_range, base);
 }
 
+static void
+xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
+				   const struct mmu_notifier_range *mmu_range)
+{
+	struct xe_device *xe = vm->xe;
+
+	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
+
+	spin_lock(&vm->svm.garbage_collector.lock);
+	if (list_empty(&range->garbage_collector_link))
+		list_add_tail(&range->garbage_collector_link,
+			      &vm->svm.garbage_collector.range_list);
+	spin_unlock(&vm->svm.garbage_collector.lock);
+
+	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
+		   &vm->svm.garbage_collector.work);
+}
+
 static u8
 xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 				  const struct mmu_notifier_range *mmu_range,
@@ -100,7 +119,9 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	xe_svm_assert_in_notifier(vm);
 
 	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
-	/* TODO: Add range to garbage collector if VM is not closed */
+	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
+		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
+						   mmu_range);
 }
 
 static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
@@ -202,6 +223,63 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 		xe_svm_range_notifier_event_end(vm, r, mmu_range);
 }
 
+static int __xe_svm_garbage_collector(struct xe_vm *vm,
+				      struct xe_svm_range *range)
+{
+	/* TODO: Do unbind */
+
+	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+
+	return 0;
+}
+
+static int xe_svm_garbage_collector(struct xe_vm *vm)
+{
+	struct xe_svm_range *range;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return -ENOENT;
+
+	spin_lock(&vm->svm.garbage_collector.lock);
+	for (;;) {
+		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
+						 typeof(*range),
+						 garbage_collector_link);
+		if (!range)
+			break;
+
+		list_del(&range->garbage_collector_link);
+		spin_unlock(&vm->svm.garbage_collector.lock);
+
+		err = __xe_svm_garbage_collector(vm, range);
+		if (err) {
+			drm_warn(&vm->xe->drm,
+				 "Garbage collection failed: %pe\n",
+				 ERR_PTR(err));
+			xe_vm_kill(vm, true);
+			return err;
+		}
+
+		spin_lock(&vm->svm.garbage_collector.lock);
+	}
+	spin_unlock(&vm->svm.garbage_collector.lock);
+
+	return 0;
+}
+
+static void xe_svm_garbage_collector_work_func(struct work_struct *w)
+{
+	struct xe_vm *vm = container_of(w, struct xe_vm,
+					svm.garbage_collector.work);
+
+	down_write(&vm->lock);
+	xe_svm_garbage_collector(vm);
+	up_write(&vm->lock);
+}
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
@@ -226,6 +304,11 @@ int xe_svm_init(struct xe_vm *vm)
 {
 	int err;
 
+	spin_lock_init(&vm->svm.garbage_collector.lock);
+	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
+	INIT_WORK(&vm->svm.garbage_collector.work,
+		  xe_svm_garbage_collector_work_func);
+
 	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 			      current->mm, NULL, 0, vm->size,
 			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
@@ -247,6 +330,7 @@ int xe_svm_init(struct xe_vm *vm)
 void xe_svm_close(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	flush_work(&vm->svm.garbage_collector.work);
 }
 
 /**
@@ -296,7 +380,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
 retry:
-	/* TODO: Run garbage collector */
+	/* Always process UNMAPs first so view SVM ranges is current */
+	err = xe_svm_garbage_collector(vm);
+	if (err)
+		return err;
 
 	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
 					    xe_vma_start(vma), xe_vma_end(vma),
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 03ae43d8b4ee..b3a4f2e82b50 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -19,6 +19,11 @@ struct xe_vma;
 struct xe_svm_range {
 	/** @base: base drm_gpusvm_range */
 	struct drm_gpusvm_range base;
+	/**
+	 * @garbage_collector_link: Link into VM's garbage collect SVM range
+	 * list. Protected by VM's garbage collect lock.
+	 */
+	struct list_head garbage_collector_link;
 	/**
 	 * @tile_present: Tile mask of binding is present for this range.
 	 * Protected by GPU SVM notifier lock.
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3565c2673b9f..f57fc30b969a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3150,6 +3150,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	/* Ensure all UNMAPs visible */
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->svm.garbage_collector.work);
+
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_exec_queue;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2d988a867e63..8aa77aaaae6b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -146,6 +146,24 @@ struct xe_vm {
 	struct {
 		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
 		struct drm_gpusvm gpusvm;
+		/**
+		 * @svm.garbage_collector: Garbage collector which is used unmap
+		 * SVM range's GPU bindings and destroy the ranges.
+		 */
+		struct {
+			/** @svm.garbage_collector.lock: Protect's range list */
+			spinlock_t lock;
+			/**
+			 * @svm.garbage_collector.range_list: List of SVM ranges
+			 * in the garbage collector.
+			 */
+			struct list_head range_list;
+			/**
+			 * @svm.garbage_collector.work: Worker which the
+			 * garbage collector runs on.
+			 */
+			struct work_struct work;
+		} garbage_collector;
 	} svm;
 
 	struct xe_device *xe;
-- 
2.34.1

