Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9860A224B3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1F10E893;
	Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2T5E0Wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A4210E88F;
 Wed, 29 Jan 2025 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180282; x=1769716282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcGvCNtjJwcvJ6I4ys0nQdDuKG0CzCcDTnh4ymDhsxA=;
 b=c2T5E0Wk6m8lWEOoSjc1m0TdZAiN6BUTA2OFYNU/ZPT+QL0rWSarkyOe
 QIirFVjzKnYOW4KQMosDknQtfEKjwrEhhgEvzTdFHcA6/E36Bl11Uk3b6
 uLUM2ordNmw10Xe/zKBhRzQmyS/1tFfk9jLOsVsvK6J3ezEEdACSLEHwe
 OmlcG5AP1OWiB+S+jyAm55wl8s3bqzyDCgzZYqfo51lzFAlQ+lalgjPpC
 jsaPR0OOSZSwLOvm9J+Wi172eLujutzPyvhVbXkbN8tZLPAEGR6n7GTXg
 P5aNtFcFQuQPJcPcJ7mSWiO3tttqkl9Ys7sHEqqCnUUAlhfWjwWp4xi8Q A==;
X-CSE-ConnectionGUID: b+ausho0Sjm7pJ/nKcqr0g==
X-CSE-MsgGUID: 6bT3iAGOTkCfn+2kYxm1Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132774"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:22 -0800
X-CSE-ConnectionGUID: 7SXNNdUhQuSKABTmh3/zRg==
X-CSE-MsgGUID: beCySzKMQpCKU13t+PK8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392135"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 11/33] drm/xe: Nuke VM's mapping upon close
Date: Wed, 29 Jan 2025 11:51:50 -0800
Message-Id: <20250129195212.745731-12-matthew.brost@intel.com>
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

Clear root PT entry and invalidate entire VM's address space when
closing the VM. Will prevent the GPU from accessing any of the VM's
memory after closing.

v2:
 - s/vma/vm in kernel doc (CI)
 - Don't nuke migration VM as this occur at driver unload (CI)
v3:
 - Rebase and pull into SVM series (Thomas)
 - Wait for pending binds (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
 drivers/gpu/drm/xe/xe_pt.c                  | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
 drivers/gpu/drm/xe/xe_vm.c                  | 22 +++++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 0a93831c0a02..1ef21ed01d1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -410,6 +410,30 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
 
+/**
+ * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
+ * @gt: graphics tile
+ * @vm: VM to invalidate
+ *
+ * Invalidate entire VM's address space
+ */
+void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
+{
+	struct xe_gt_tlb_invalidation_fence fence;
+	u64 range = 1ull << vm->xe->info.va_bits;
+	int ret;
+
+	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+
+	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
+	if (ret < 0) {
+		xe_gt_tlb_invalidation_fence_fini(&fence);
+		return;
+	}
+
+	xe_gt_tlb_invalidation_fence_wait(&fence);
+}
+
 /**
  * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
  * @gt: GT structure
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 672acfcdf0d7..abe9b03d543e 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -12,6 +12,7 @@
 
 struct xe_gt;
 struct xe_guc;
+struct xe_vm;
 struct xe_vma;
 
 int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
@@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
 			       struct xe_vma *vma);
+void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 99b97bf37c05..c5060011ad43 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -214,6 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 	xe_pt_free(pt);
 }
 
+/**
+ * xe_pt_clear() - Clear a page-table.
+ * @xe: xe device.
+ * @pt: The page-table.
+ *
+ * Clears page-table by setting to zero.
+ */
+void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
+{
+	struct iosys_map *map = &pt->bo->vmap;
+
+	xe_map_memset(xe, map, 0, 0, SZ_4K);
+}
+
 /**
  * DOC: Pagetable building
  *
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..8e43912ae8e9 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -13,6 +13,7 @@ struct dma_fence;
 struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
+struct xe_svm_range;
 struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
@@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
+void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
+
 int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
 struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 				       struct xe_vma_ops *vops);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bc34e6738c8c..82026c5a154d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1537,8 +1537,30 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 static void xe_vm_close(struct xe_vm *vm)
 {
+	bool migration = (vm->flags & XE_VM_FLAG_MIGRATION);
+
 	down_write(&vm->lock);
+
 	vm->size = 0;
+
+	if (!migration) {
+		struct xe_tile *tile;
+		struct xe_gt *gt;
+		u8 id;
+
+		/* Wait for pending binds */
+		dma_resv_wait_timeout(xe_vm_resv(vm),
+				      DMA_RESV_USAGE_BOOKKEEP,
+				      false, MAX_SCHEDULE_TIMEOUT);
+
+		for_each_tile(tile, vm->xe, id)
+			if (vm->pt_root[id])
+				xe_pt_clear(vm->xe, vm->pt_root[id]);
+
+		for_each_gt(gt, vm->xe, id)
+			xe_gt_tlb_invalidation_vm(gt, vm);
+	}
+
 	up_write(&vm->lock);
 }
 
-- 
2.34.1

