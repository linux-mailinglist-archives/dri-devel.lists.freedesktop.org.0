Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B25A75034
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E40D10EA91;
	Fri, 28 Mar 2025 18:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhH5fcAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7158610EA92;
 Fri, 28 Mar 2025 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185470; x=1774721470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATFQNyFpsfomqKlEXA9NRgfOqUkfrM0sCeOWFmfzwRE=;
 b=OhH5fcAkTNgcmZdHrftG29cxXlsYZt4uKHtR/Y/qiYOG8rJaSVaPH7Hn
 kIv+/CZcTX+Nb855uXHqQgezIr77OsCiFQLNfRub4QKYkEcN8ekGYeJ+W
 TDpL1B88nGOeAod5dl6SF02VvqLNdiQI8NJm42tooxtQjf0dFej5CpWUm
 tcBdy/xrpqDYPLoNQQ/KRxpWLTb/Smj9Q1sZXQB5l80f7XB5+sEh7Q3Gg
 K+/LTsI8i4mMUl1ueotLwM3U7JHv198RtB/LkLzFA9LwXuu7cZH3cFY7d
 Ow00wYtJCxylxWEEcj7wWtQa644GOlLa3Y39bEC2/OnctpgLxH135/SHV A==;
X-CSE-ConnectionGUID: B7W/cZflT8O3n/n/fGipOA==
X-CSE-MsgGUID: cw3tvps7T/+h4sxRHWhnXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55926156"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55926156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:10 -0700
X-CSE-ConnectionGUID: 25UdLOwpRrOGgAPFbi971A==
X-CSE-MsgGUID: S5+zBQXXRpmFu/x86+9Ktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156436012"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.28])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Date: Fri, 28 Mar 2025 18:10:36 +0000
Message-ID: <20250328181028.288312-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328181028.288312-9-matthew.auld@intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
 1 file changed, 33 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b097c91e2e02..947b82aa19a6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	return err;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
@@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	if (err)
 		return err;
 
-	down_read(&vm->svm.gpusvm.notifier_lock);
+	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_check_userptr(vm, op, pt_update_ops);
-		if (err) {
-			up_read(&vm->svm.gpusvm.notifier_lock);
-			break;
+		if (pt_update_ops->needs_svm_lock) {
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+			struct xe_svm_range *range = op->map_range.range;
+
+			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
+				continue;
+
+			xe_svm_range_debug(range, "PRE-COMMIT");
+
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
+				return -EAGAIN;
+			}
+#endif
+		} else {
+			err = op_check_userptr(vm, op, pt_update_ops);
+			if (err) {
+				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
+				break;
+			}
 		}
 	}
 
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
@@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
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
@@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vma_op *op;
 	int err = 0, i;
 	struct xe_migrate_pt_update update = {
-		.ops = pt_update_ops->needs_svm_lock ?
-			&svm_migrate_ops :
-			pt_update_ops->needs_userptr_lock ?
-			&userptr_migrate_ops :
+		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
+			&svm_userptr_migrate_ops :
 			&migrate_ops,
 		.vops = vops,
 		.tile_id = tile->id,
@@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				  &ifence->base.base, &mfence->base.base);
 	}
 
-	if (pt_update_ops->needs_svm_lock)
-		xe_svm_notifier_unlock(vm);
-	if (pt_update_ops->needs_userptr_lock)
-		up_read(&vm->svm.gpusvm.notifier_lock);
+	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
+		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
 
 	return fence;
 
-- 
2.48.1

