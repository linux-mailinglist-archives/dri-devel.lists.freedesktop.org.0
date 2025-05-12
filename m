Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20CAB3BA2
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800BC10E44E;
	Mon, 12 May 2025 15:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iS4dKAX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8664710E44C;
 Mon, 12 May 2025 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747062427; x=1778598427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B2apuhP9RusKeYaL8N7daLjLojgq1GJPitTwj1AvwOo=;
 b=iS4dKAX87+g9cto/PNrwpVFJVsOugubdz+BNwjJX7OCCxlxg2AtfbwtY
 zX1LNp72ASpJCJLK5WfBKhgfKtjW+DLrtWCbyQFyQ6gcgCRbJPh57zcnT
 vvwDVi1gT+lF6kiJatKW5VBeRKniFFYvw3gOlrLj/7+h2F4qUR9y0shsf
 TutcPOEKtSsgTUahDgYkhSZoOkS9aE54w0XcwBHpgpRYRNAFaPGWYsLuS
 z2uWnBVjjpKB8M04NI5EWvxCQkshC8owdEVkb7qyct8yYYPH1FVj/gqAD
 BQX4Xf2xKVhNJyQXvkzFm+bydokAYMuPXpuHvIUJnqXanuTl/rXEfLgPm g==;
X-CSE-ConnectionGUID: UC+XMZSHTu2kLWLwe7Ui8A==
X-CSE-MsgGUID: Bew4jU9GQ+CkdwWI9qY5ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71377088"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="71377088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:07:07 -0700
X-CSE-ConnectionGUID: 62Vf3/1xTWOVThweOmH1kQ==
X-CSE-MsgGUID: fLKXLXflQq+euiRhhfsVDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137916570"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:07:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 8/8] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Date: Mon, 12 May 2025 16:06:46 +0100
Message-ID: <20250512150637.61462-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512150637.61462-10-matthew.auld@intel.com>
References: <20250512150637.61462-10-matthew.auld@intel.com>
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

We now use the same notifier lock for SVM and userptr, with that we can
combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.

v2: (Matt B)
  - Re-use xe_svm_notifier_lock/unlock for userptr.
  - Combine svm/userptr handling further down into op_check_svm_userptr.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 90 ++++++++++----------------------
 drivers/gpu/drm/xe/xe_pt_types.h |  2 -
 2 files changed, 29 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 92b6a4d63bb1..6642fdcc34fd 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1394,8 +1394,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
-			    struct xe_vm_pgtable_update_ops *pt_update)
+static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+				struct xe_vm_pgtable_update_ops *pt_update)
 {
 	int err = 0;
 
@@ -1420,6 +1420,24 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 		err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va),
 					pt_update);
 		break;
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			struct xe_svm_range *range = op->map_range.range;
+
+			xe_svm_range_debug(range, "PRE-COMMIT");
+
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				err = -EAGAIN;
+			}
+		}
+		break;
+#endif
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1427,7 +1445,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	return err;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
@@ -1440,12 +1458,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	if (err)
 		return err;
 
-	down_read(&vm->svm.gpusvm.notifier_lock);
+	xe_svm_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_check_userptr(vm, op, pt_update_ops);
+		err = op_check_svm_userptr(vm, op, pt_update_ops);
 		if (err) {
-			up_read(&vm->svm.gpusvm.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 			break;
 		}
 	}
@@ -1453,42 +1471,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return err;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
-static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
-{
-	struct xe_vm *vm = pt_update->vops->vm;
-	struct xe_vma_ops *vops = pt_update->vops;
-	struct xe_vma_op *op;
-	int err;
-
-	err = xe_pt_pre_commit(pt_update);
-	if (err)
-		return err;
-
-	xe_svm_notifier_lock(vm);
-
-	list_for_each_entry(op, &vops->list, link) {
-		struct xe_svm_range *range = op->map_range.range;
-
-		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
-			continue;
-
-		xe_svm_range_debug(range, "PRE-COMMIT");
-
-		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
-		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
-
-		if (!xe_svm_range_pages_valid(range)) {
-			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-			xe_svm_notifier_unlock(vm);
-			return -EAGAIN;
-		}
-	}
-
-	return 0;
-}
-#endif
-
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
 	struct xe_gt *gt;
@@ -1859,7 +1841,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
 		++pt_update_ops->current_op;
-		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
 		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
@@ -1967,7 +1949,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
-	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
 	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
@@ -2290,22 +2272,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
 	.pre_commit = xe_pt_pre_commit,
 };
 
-static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
+static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
 	.populate = xe_vm_populate_pgtable,
 	.clear = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_userptr_pre_commit,
+	.pre_commit = xe_pt_svm_userptr_pre_commit,
 };
 
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
-static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.clear = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_svm_pre_commit,
-};
-#else
-static const struct xe_migrate_pt_update_ops svm_migrate_ops;
-#endif
-
 /**
  * xe_pt_update_ops_run() - Run PT update operations
  * @tile: Tile of PT update operations
@@ -2332,9 +2304,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	int err = 0, i;
 	struct xe_migrate_pt_update update = {
 		.ops = pt_update_ops->needs_svm_lock ?
-			&svm_migrate_ops :
-			pt_update_ops->needs_userptr_lock ?
-			&userptr_migrate_ops :
+			&svm_userptr_migrate_ops :
 			&migrate_ops,
 		.vops = vops,
 		.tile_id = tile->id,
@@ -2456,8 +2426,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	if (pt_update_ops->needs_svm_lock)
 		xe_svm_notifier_unlock(vm);
-	if (pt_update_ops->needs_userptr_lock)
-		up_read(&vm->svm.gpusvm.notifier_lock);
 
 	return fence;
 
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 69eab6f37cfe..dc0b2d8c3af8 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -106,8 +106,6 @@ struct xe_vm_pgtable_update_ops {
 	u32 current_op;
 	/** @needs_svm_lock: Needs SVM lock */
 	bool needs_svm_lock;
-	/** @needs_userptr_lock: Needs userptr lock */
-	bool needs_userptr_lock;
 	/** @needs_invalidation: Needs invalidation */
 	bool needs_invalidation;
 	/**
-- 
2.49.0

