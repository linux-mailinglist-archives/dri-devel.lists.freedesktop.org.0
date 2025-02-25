Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F181A43451
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770C210E57A;
	Tue, 25 Feb 2025 04:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crB7cwxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018AD10E559;
 Tue, 25 Feb 2025 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458536; x=1771994536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3BybytzLMKV454VXYdtyGZmutTPjmSn6bIAPeqzcws=;
 b=crB7cwxnR1YWDo9rMKbeo6FpY3fLjM12M7trryKQo1MtSagJqMZuGg3u
 kKaC8EHaEtUcI91njuXc/iMxA4OdC/bvDYqhgAb61ZUa6TOa3zvaX3YhW
 Jw6MMAnKUDiU7s76erwjB8TFU05OUKL3IKgp/O6iKjh177xvdKpGpOIjg
 5jSUjSeNTIRw6vdiMxSCYTLTVXdgSKhxL5QltEUfBsU2K1ddflwXCdui5
 FdKPwno9fU5g2tZxPE1/qtyTqTWaumUh8M+c1S41QNmjJCH7zBwuuhdEi
 wH0Gr+nkamG6G8iC3F9/5Mf1r3zM91ZoD4NijHaDjEuFTPHitgk6s8pFF Q==;
X-CSE-ConnectionGUID: VM9bwptbQkOw+AuqYfsa0g==
X-CSE-MsgGUID: k87xGttXRQWp/D4hw6WKVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885072"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
X-CSE-ConnectionGUID: f7nKW5x5RB2E/pFBeepT/g==
X-CSE-MsgGUID: f0+8/8pMT6iezW/gmA63uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290329"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 28/32] drm/xe: Basic SVM BO eviction
Date: Mon, 24 Feb 2025 20:43:07 -0800
Message-Id: <20250225044311.3178695-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Wire xe_bo_move to GPU SVM migration via new helper xe_svm_bo_evict.

v2:
 - Use xe_svm_bo_evict
 - Drop bo->range
v3:
 - Kernel doc (Thomas)
v4:
 - Add missing xe_bo.c code
v5:
 - Add XE_BO_FLAG_CPU_ADDR_MIRROR flag in this patch (Thomas)
 - Add message on eviction failure
v6:
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_svm.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h |  9 +++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 51cd22695592..0c7a7f5e5596 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -279,6 +279,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
+	struct xe_bo *bo;
+
 	if (!xe_bo_is_xe_bo(tbo)) {
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
@@ -290,6 +292,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	bo = ttm_to_xe_bo(tbo);
+	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
+		*placement = sys_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
@@ -734,6 +742,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
+	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) &&
+	    new_mem->mem_type == XE_PL_SYSTEM) {
+		ret = xe_svm_bo_evict(bo);
+		if (!ret) {
+			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
+			ttm_bo_move_null(ttm_bo, new_mem);
+		} else {
+			drm_dbg(&xe->drm, "Evict system allocator BO failed=%pe\n",
+				ERR_PTR(ret));
+		}
+
+		goto out;
+	}
+
 	if (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT && !handle_system_ccs) {
 		ttm_bo_move_null(ttm_bo, new_mem);
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9cab686dc872..2b9c0b0778a2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -47,6 +47,7 @@
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
 					 XE_BO_FLAG_GGTT3)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d8ff7fc708ee..e2f76692adc0 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -617,7 +617,8 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
 				 xe_svm_range_size(range),
 				 ttm_bo_type_device,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 XE_BO_FLAG_CPU_ADDR_MIRROR);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		if (xe_vm_validate_should_retry(NULL, err, &end))
@@ -772,6 +773,20 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_bo_evict() - SVM evict BO to system memory
+ * @bo: BO to evict
+ *
+ * SVM evict BO to system memory. GPU SVM layer ensures all device pages
+ * are evicted before returning.
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_svm_bo_evict(struct xe_bo *bo)
+{
+	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct drm_pagemap_device_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 5d4eeb2d34ce..855aa8e1dd38 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_bo;
 struct xe_vram_region;
 struct xe_tile;
 struct xe_vm;
@@ -67,6 +68,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    bool atomic);
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
+
+int xe_svm_bo_evict(struct xe_bo *bo);
 #else
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
@@ -108,6 +111,12 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 {
 	return false;
 }
+
+static inline
+int xe_svm_bo_evict(struct xe_bo *bo)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.34.1

