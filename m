Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595BB3A195
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C809910E9F6;
	Thu, 28 Aug 2025 14:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTk/p+FR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B404710E9D1;
 Thu, 28 Aug 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756391169; x=1787927169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8KlCyXIE4Gl5+6biDG1weLDlfsNbBA6TVtDd6C+NHqE=;
 b=lTk/p+FR3YHcfh8FFOdtjYnrDBP0g3+KbVZBjUPOBSByt8KLbnL7qi1q
 BmQEXibSfoccT2gI/zF3kjDT7inhLYG6pKKljB0kJVBGG3OvnBrUl/9oW
 WbOO0ScFEPFxosu6qDAuX6EMtzo0kSYPncWxPRfhxgFimk0XQFvrkQCfp
 uDV/BjheftYiBbs0ch6PmX3JXqTJ1GPU6K1lif3u4K8c6Sle5/uD/C4JR
 5QvGSSm75ekstIvEEKR1pUlbLJrQLiHMk7yryqYXwxg1k0b2S/MA8D4GZ
 fZaE6jro5BdiZoJkNK6PcIq4jwcbc9PdAZS99doITmq8VtghD9mfx0JLF A==;
X-CSE-ConnectionGUID: aHK7r+laRDuOiNRcs7qdDQ==
X-CSE-MsgGUID: e53Djt8LQ6mNswWa9GC76w==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58763208"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58763208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:09 -0700
X-CSE-ConnectionGUID: +daweScbTpa9aauHrdz8og==
X-CSE-MsgGUID: 28pEB4sSQjqaWbdfP7OHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170025913"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 8/8] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Date: Thu, 28 Aug 2025 15:24:39 +0100
Message-ID: <20250828142430.615826-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828142430.615826-10-matthew.auld@intel.com>
References: <20250828142430.615826-10-matthew.auld@intel.com>
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
v3:
  - Only hide the ops if we lack DRM_GPUSVM, since we also need them for
    userptr.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 123 ++++++++++++-------------------
 drivers/gpu/drm/xe/xe_pt_types.h |   2 -
 2 files changed, 46 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 382b25798bc3..74e33153c827 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1432,8 +1432,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
-			    struct xe_vm_pgtable_update_ops *pt_update)
+static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+				struct xe_vm_pgtable_update_ops *pt_update)
 {
 	int err = 0;
 
@@ -1455,9 +1455,40 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	case DRM_GPUVA_OP_UNMAP:
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va),
-					pt_update);
+		if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va))) {
+			struct xe_svm_range *range = op->map_range.range;
+			unsigned long i;
+
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
+			xa_for_each(&op->prefetch_range.range, i, range) {
+				xe_svm_range_debug(range, "PRE-COMMIT");
+
+				if (!xe_svm_range_pages_valid(range)) {
+					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+					return -ENODATA;
+				}
+			}
+		} else {
+			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
+		}
 		break;
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			struct xe_svm_range *range = op->map_range.range;
+
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+
+			xe_svm_range_debug(range, "PRE-COMMIT");
+
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				return -EAGAIN;
+			}
+		}
+		break;
+#endif
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1465,7 +1496,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	return err;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
@@ -1478,12 +1509,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
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
@@ -1491,58 +1522,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return err;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
-static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
-{
-	struct xe_vm *vm = pt_update->vops->vm;
-	struct xe_vma_ops *vops = pt_update->vops;
-	struct xe_vma_op *op;
-	unsigned long i;
-	int err;
-
-	err = xe_pt_pre_commit(pt_update);
-	if (err)
-		return err;
-
-	xe_svm_notifier_lock(vm);
-
-	list_for_each_entry(op, &vops->list, link) {
-		struct xe_svm_range *range = NULL;
-
-		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
-			continue;
-
-		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
-			xe_assert(vm->xe,
-				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
-			xa_for_each(&op->prefetch_range.range, i, range) {
-				xe_svm_range_debug(range, "PRE-COMMIT");
-
-				if (!xe_svm_range_pages_valid(range)) {
-					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-					xe_svm_notifier_unlock(vm);
-					return -ENODATA;
-				}
-			}
-		} else {
-			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
-			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
-			range = op->map_range.range;
-
-			xe_svm_range_debug(range, "PRE-COMMIT");
-
-			if (!xe_svm_range_pages_valid(range)) {
-				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-				xe_svm_notifier_unlock(vm);
-				return -EAGAIN;
-			}
-		}
-	}
-
-	return 0;
-}
-#endif
-
 struct xe_pt_stage_unbind_walk {
 	/** @base: The pagewalk base-class. */
 	struct xe_pt_walk base;
@@ -1844,7 +1823,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
 		++pt_update_ops->current_op;
-		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
 		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
@@ -1952,7 +1931,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
-	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
 	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
@@ -2339,20 +2318,14 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
 	.pre_commit = xe_pt_pre_commit,
 };
 
-static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
 	.populate = xe_vm_populate_pgtable,
 	.clear = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_userptr_pre_commit,
-};
-
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
-static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.clear = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_svm_pre_commit,
+	.pre_commit = xe_pt_svm_userptr_pre_commit,
 };
 #else
-static const struct xe_migrate_pt_update_ops svm_migrate_ops;
+static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops;
 #endif
 
 static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
@@ -2390,9 +2363,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
@@ -2534,8 +2505,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	if (pt_update_ops->needs_svm_lock)
 		xe_svm_notifier_unlock(vm);
-	if (pt_update_ops->needs_userptr_lock)
-		up_read(&vm->svm.gpusvm.notifier_lock);
 
 	xe_tlb_inval_job_put(mjob);
 	xe_tlb_inval_job_put(ijob);
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 17cdd7c7e9f5..881f01e14db8 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -105,8 +105,6 @@ struct xe_vm_pgtable_update_ops {
 	u32 current_op;
 	/** @needs_svm_lock: Needs SVM lock */
 	bool needs_svm_lock;
-	/** @needs_userptr_lock: Needs userptr lock */
-	bool needs_userptr_lock;
 	/** @needs_invalidation: Needs invalidation */
 	bool needs_invalidation;
 	/**
-- 
2.51.0

