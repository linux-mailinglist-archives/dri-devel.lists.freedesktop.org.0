Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92524961C54
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F345910E45E;
	Wed, 28 Aug 2024 02:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb+Kprj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E363910E443;
 Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813289; x=1756349289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QQOoj7usOfsVkGJhx1Uhtdq3rwl6xhH5Dkkdh4E17wA=;
 b=Kb+Kprj2Yo54BFF94z6Ew06XCtkD0CkhgnAlYZ/fSmGPzjHdWBzEJhez
 N4PZOLrd1d8dJVD2AQ8I/GWF/I+xE4zR6VnIV5wEfRHm/Ms8JOFWI69og
 9sZegX0iCJN6OyjI+N6JnkZC72yv0HloVdaVLLYg4S6+Io4T5bGphsfgc
 ZG15k0QikgZ2YBe7qsqYtTA3QDlKdKnILeqUw4W/upotWLnb9xkVmutCZ
 tD0d4XknS6XT5R2mTabEgnkJJlXzHz0MY00QA50RocKpy2uPafiOPQQ46
 hvPB/hFMsXp5agVs1eQ2ECMRrs+t/a4T4TzAovyHh10DxsWxr2jP6TriJ w==;
X-CSE-ConnectionGUID: bY+Oa2osQ6qTIlukJ4BgOw==
X-CSE-MsgGUID: ANGL60zpQU661H8WkQoVbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251896"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251896"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
X-CSE-ConnectionGUID: BlVk3JLbQrKPBQIXROAhdw==
X-CSE-MsgGUID: aXztgtR+TNis8GVuO6pSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224621"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 12/28] drm/xe: Add SVM garbage collector
Date: Tue, 27 Aug 2024 19:48:45 -0700
Message-Id: <20240828024901.2582335-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Add basic SVM garbage collector which can destroy an SVM range upon an
MMU UNMAP event.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 85 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h      |  1 +
 drivers/gpu/drm/xe/xe_vm.c       |  6 +++
 drivers/gpu/drm/xe/xe_vm_types.h |  5 ++
 4 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 28d139b3dbb7..20010c09e125 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -30,6 +30,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 	if (!range)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&range->garbage_collector_link);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
 
 	return &range->base;
@@ -46,6 +47,24 @@ static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
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
@@ -88,7 +107,9 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
 
 	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
-	/* TODO: Add range to garbage collector */
+	if (mmu_range->event == MMU_NOTIFY_UNMAP)
+		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
+						   mmu_range);
 }
 
 static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
@@ -185,6 +206,58 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
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
+	struct xe_svm_range *range, *next;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return -ENOENT;
+
+	spin_lock(&vm->svm.garbage_collector.lock);
+	list_for_each_entry_safe(range, next,
+				 &vm->svm.garbage_collector.range_list,
+				 garbage_collector_link) {
+		list_del(&range->garbage_collector_link);
+		spin_unlock(&vm->svm.garbage_collector.lock);
+
+		err = __xe_svm_garbage_collector(vm, range);
+		if (err) {
+			drm_warn(&vm->xe->drm,
+				 "Garbage collection failed: %d\n", err);
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
@@ -199,6 +272,11 @@ static const u64 fault_chunk_sizes[] = {
 
 int xe_svm_init(struct xe_vm *vm)
 {
+	spin_lock_init(&vm->svm.garbage_collector.lock);
+	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
+	INIT_WORK(&vm->svm.garbage_collector.work,
+		  xe_svm_garbage_collector_work_func);
+
 	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 			       current->mm, NULL, 0, vm->size,
 			       SZ_512M, &gpusvm_ops, fault_chunk_sizes,
@@ -231,7 +309,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held_write(&vm->lock);
 
 retry:
-	/* TODO: Run garbage collector */
+	/* Always process UNMAPs first so view SVM ranges is current */
+	err = xe_svm_garbage_collector(vm);
+	if (err)
+		return err;
 
 	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
 					    xe_vma_start(vma), xe_vma_end(vma),
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 7dabffaf4c65..84fd0d8c3380 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -14,6 +14,7 @@ struct xe_vma;
 
 struct xe_svm_range {
 	struct drm_gpusvm_range base;
+	struct list_head garbage_collector_link;
 	u8 tile_present;
 	u8 tile_invalidated;
 };
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6261a4cb2e1d..1fd2c99245f2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1633,6 +1633,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->svm.garbage_collector.work);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -3064,6 +3066,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto put_exec_queue;
 	}
 
+	/* Ensure all UNMAPs visable */
+	if (xe_vm_in_fault_mode(vm))
+		flush_work(&vm->svm.garbage_collector.work);
+
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index b736e53779d2..2eae3575c409 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -146,6 +146,11 @@ struct xe_vm {
 	struct {
 		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
 		struct drm_gpusvm gpusvm;
+		struct {
+			spinlock_t lock;
+			struct list_head range_list;
+			struct work_struct work;
+		} garbage_collector;
 	} svm;
 
 	struct xe_device *xe;
-- 
2.34.1

