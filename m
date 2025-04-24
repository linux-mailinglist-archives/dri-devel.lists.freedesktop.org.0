Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14790A9AD1E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BB110E7E4;
	Thu, 24 Apr 2025 12:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm9N6myb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8A010E7E1;
 Thu, 24 Apr 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745497139; x=1777033139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V3aPtzpMTbNB767ZqwaXDro+CpSMInULacr9ieCCa3A=;
 b=Cm9N6mybbRNCpXbCXSgUMRj5a8Ewx5i17xy6RlLVsdOyJxP0+DL5tBb5
 n8jajCgxOFTw0dGI8+7ji/YbZVls27WcrF+k3A8Hr+jjV/mlxpTFj7ahz
 dBu1RAO+RcpjQ+sTEPsD8zClZ7nEOaxZCQVOWmb1h58zbhNog/3wTm305
 p7Pn/Fn5ijto6MP0+etH7+RupO9leg886DvEfNa9ETF4txnT4S1nwAdD+
 g3Y+dquNrEWwTso/IY3OA/23Yy9X6CRvDySjLCvqaVLzB7nJeM0VibvNt
 B7/msq8zlvoNuIpric8ePYd6RVrdAL+EZt44zJrNlaBJNqq+CRzJmAisz w==;
X-CSE-ConnectionGUID: Un5R1K7gQwCKsGGAF2atQA==
X-CSE-MsgGUID: qlo8WAHDR7CPlmKjPemI4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50947971"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50947971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:58 -0700
X-CSE-ConnectionGUID: MjOO/1/4QheWznPZuKPLGQ==
X-CSE-MsgGUID: +F9BTvEFTnCiClN20fT9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137589485"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Date: Thu, 24 Apr 2025 13:18:35 +0100
Message-ID: <20250424121827.862729-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_pt.c       | 90 ++++++++++----------------------
 drivers/gpu/drm/xe/xe_pt_types.h |  2 -
 drivers/gpu/drm/xe/xe_svm.h      | 19 +++----
 3 files changed, 39 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ff898e518afd..a7db65f9913e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1393,8 +1393,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
-			    struct xe_vm_pgtable_update_ops *pt_update)
+static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+				struct xe_vm_pgtable_update_ops *pt_update)
 {
 	int err = 0;
 
@@ -1419,6 +1419,24 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
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
@@ -1426,7 +1444,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	return err;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
@@ -1439,12 +1457,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
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
@@ -1452,42 +1470,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
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
@@ -1858,7 +1840,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
 		++pt_update_ops->current_op;
-		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
 		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
@@ -1966,7 +1948,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
-	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
 	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
@@ -2289,22 +2271,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
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
@@ -2331,9 +2303,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
@@ -2455,8 +2425,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
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
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 923cb074d0cb..696496b52465 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -87,15 +87,6 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.pages.flags.has_dma_mapping;
 }
 
-#define xe_svm_assert_in_notifier(vm__) \
-	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
-
-#define xe_svm_notifier_lock(vm__)	\
-	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
-
-#define xe_svm_notifier_unlock(vm__)	\
-	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
-
 #else
 #include <linux/interval_tree.h>
 
@@ -187,4 +178,14 @@ static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
 {
 }
 #endif
+
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
 #endif
-- 
2.49.0

