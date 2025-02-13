Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB6A33545
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019110E9EB;
	Thu, 13 Feb 2025 02:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRsw7In8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56D10E9D4;
 Thu, 13 Feb 2025 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412620; x=1770948620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Epe8sXuyU+UZMirjutL3+uAO3uI8N0zu1jzdXrPaleM=;
 b=GRsw7In8IvMOAMFVEDZlUprc149qnzpJQthskoePEHRaw6rAsAJPkjme
 J0SG/SE5PqPe+PpyS5SKGCa5Co51pQVIBfiYkOzRnzETVGRFwUkgYK0hR
 FRk3zafVsBnTU1ReweT+l6HyfhXENgXvEaBczfy9bcxr0H80s4lykA7cL
 wOdsQ8gS3SHIypBAtlhhNb15fM5qikOnYFrO9eXvoWArqR+i3/Z4awokF
 NOQJ2mmz+nc3G35jEM9LO80f/xNNQOvrc/n+ZzukMvenFgoTeZSJqjrKa
 //ICl9L5g6i9+k04ec5JrWKq0CBy9rvAL+TmTheWcPURFgzX36Lb7KBVl Q==;
X-CSE-ConnectionGUID: PbC5WSsNSZWf58uxu41okg==
X-CSE-MsgGUID: mQtqaDBKQqaOQw/YpTypig==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456071"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: hLvvODtBSRCKP3rHZksSZg==
X-CSE-MsgGUID: Q9SGD1CBS0WjhMB4HaMACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945117"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 28/32] drm/xe: Basic SVM BO eviction
Date: Wed, 12 Feb 2025 18:11:08 -0800
Message-Id: <20250213021112.1228481-29-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_svm.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h |  3 +++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a2a924b531e5..60d92698e85c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -263,6 +263,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
+	struct xe_bo *bo;
+
 	if (!xe_bo_is_xe_bo(tbo)) {
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
@@ -274,6 +276,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
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
@@ -718,6 +726,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
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
index 9dfec438d1c7..13430f9b5d38 100644
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
index 2e1e0f31c1a8..ea43dd00d226 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -621,7 +621,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
 				 xe_svm_range_size(range),
 				 ttm_bo_type_device,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 XE_BO_FLAG_CPU_ADDR_MIRROR);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		if (xe_vm_validate_should_retry(NULL, err, &end))
@@ -790,6 +791,20 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
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
index 984a61651d9e..ff43a6193536 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,6 +11,7 @@
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
+struct xe_bo;
 struct xe_vram_region;
 struct xe_tile;
 struct xe_vm;
@@ -56,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+int xe_svm_bo_evict(struct xe_bo *bo);
+
 /**
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
-- 
2.34.1

