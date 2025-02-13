Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F9A33537
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0DE10E9D1;
	Thu, 13 Feb 2025 02:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaaZ6GLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048010E9C3;
 Thu, 13 Feb 2025 02:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412618; x=1770948618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FyA2xjSExy7eEokv2Y48+Z7E7hTvvuo6Uav4suK4SsA=;
 b=BaaZ6GLyT19tLbJp+8m49ouukZJs4d93A9l1xER7qtSDAR8yOeav8fAv
 wuIniQkIpx2nft0V1O312uzpoMHvmksdBkGEHI7GteRzTYt8LLj7p4SH/
 4uJGlr6WunY62VrZSi0xhL+yP/fBjj/PpQ9Q+8tpbV2RDT+zvnlpXLijc
 RxDOhRff9JuqNDdj1IiRmr/3q6zaZtDHFV+RkC9MTN0DgfoYPK//iVURP
 nvWmO7OmyT6aBLlGAYl4cU+LBXQZhAYP5eUmZUBVcMYf9zuLERSkSY9+7
 00d+jCceEP2S3JqsdDGsawSlOW4csy5mMTxr0bprS44Tj9z9ZRZ9loBw7 g==;
X-CSE-ConnectionGUID: rdg61VIBR7KyH9DH9mzNfQ==
X-CSE-MsgGUID: jk4um8AQTTuCEqfUGm3Edw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455961"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
X-CSE-ConnectionGUID: bVkIt+r3QIShhAb0uovCWQ==
X-CSE-MsgGUID: wJGahddhT5+xHhFrya2Q9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945066"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 11/32] drm/xe: Nuke VM's mapping upon close
Date: Wed, 12 Feb 2025 18:10:51 -0800
Message-Id: <20250213021112.1228481-12-matthew.brost@intel.com>
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

Clear root PT entry and invalidate entire VM's address space when
closing the VM. Will prevent the GPU from accessing any of the VM's
memory after closing.

v2:
 - s/vma/vm in kernel doc (CI)
 - Don't nuke migration VM as this occur at driver unload (CI)
v3:
 - Rebase and pull into SVM series (Thomas)
 - Wait for pending binds (Thomas)
v5:
 - Remove xe_gt_tlb_invalidation_fence_fini in error case (Matt Auld)
 - Drop local migration bool (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 22 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
 drivers/gpu/drm/xe/xe_pt.c                  | 14 +++++++++++++
 drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
 drivers/gpu/drm/xe/xe_vm.c                  | 20 +++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 0a93831c0a02..03072e094991 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -410,6 +410,28 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
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
+	if (ret < 0)
+		return;
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
index cbfe5fad1680..9cfb068f5845 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1559,7 +1559,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 static void xe_vm_close(struct xe_vm *vm)
 {
 	down_write(&vm->lock);
+
 	vm->size = 0;
+
+	if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
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

