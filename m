Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4EA224B7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EE710E892;
	Wed, 29 Jan 2025 19:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db8wsuSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7010E88F;
 Wed, 29 Jan 2025 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180284; x=1769716284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0RMng3vHqyaF+07tNPbokByEAsZf6hJO1hmNtsI2BQ=;
 b=db8wsuSmMvfEOKJcL0U7XTOjFc1eIIBRwJk621UimFdqdEWP03eQxB1v
 mAnhpCdBMiRq9JpWx4MBOCGygZHTyv4HZfS0zjzZ1HPvcLzEsDuq1/uWS
 646ANrb47Pjygf0xKvbAaNRJn6RXgtKssZ5RsUmAKwustlsG5RIpg0t+M
 pMZU5x5J7qqH9r6PdxbW0c6mu6FKA8Y+sgHGGcoqQO/QnAnr+XUJRNrpm
 q6XIQoVIJxQinsDVMU244U/Uppr+bWUCsQb0Lw/X0wLaVjzXpDZtuxQPt
 y7cg+ioF1Vena2zlqd6vP/iyWIHZyuHZba1xzURj2bi//p0sqjduUh7pk A==;
X-CSE-ConnectionGUID: CwScz2KpRa+DZx4AJc+zOg==
X-CSE-MsgGUID: /OyRGyT1QFakcGuTXnKtFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132799"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132799"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
X-CSE-ConnectionGUID: 1QenvASXR0u/2w0ednFy0g==
X-CSE-MsgGUID: 75qreUm/QTC7ZaiHNxAOWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392150"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 15/33] drm/xe: Add SVM garbage collector
Date: Wed, 29 Jan 2025 11:51:54 -0800
Message-Id: <20250129195212.745731-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 91 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h      |  5 ++
 drivers/gpu/drm/xe/xe_vm.c       |  4 ++
 drivers/gpu/drm/xe/xe_vm_types.h | 18 +++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ace8c32f3428..3788196b2925 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -28,6 +28,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 	if (!range)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&range->garbage_collector_link);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
 
 	return &range->base;
@@ -44,6 +45,24 @@ static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
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
@@ -90,7 +109,9 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	xe_svm_assert_in_notifier(vm);
 
 	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
-	/* TODO: Add range to garbage collector if VM is not closed */
+	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
+		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
+						   mmu_range);
 }
 
 static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
@@ -192,6 +213,63 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
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
@@ -216,6 +294,11 @@ int xe_svm_init(struct xe_vm *vm)
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
@@ -237,6 +320,7 @@ int xe_svm_init(struct xe_vm *vm)
 void xe_svm_close(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	flush_work(&vm->svm.garbage_collector.work);
 }
 
 /**
@@ -286,7 +370,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
index 03341c8547d5..ef5bc4e919e8 100644
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
index 57083b75a602..bdc9b75e0aee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3123,6 +3123,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	/* Ensure all UNMAPs visable */
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->svm.garbage_collector.work);
+
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_exec_queue;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 983f724c911b..576316729249 100644
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

