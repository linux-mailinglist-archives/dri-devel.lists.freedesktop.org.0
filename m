Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B6961C56
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0873A10E474;
	Wed, 28 Aug 2024 02:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9wYjkcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0164A10E450;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813291; x=1756349291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tZD8mug3jPxdp5TPQkl6IEM3eKj6lxJMgG/IzZW/DJM=;
 b=i9wYjkcvCCPfDM45yrsXOly925+aLvam3gVItSMGJHK13uJSPQhbATnd
 /w68si8SCDBRZyVQ7J5sU+ytfxZBQQYIBXwX86hMZG+4JcoM8L5X4NFYH
 b7Ld9t2xNEKmkj8ItgJ69ODF+YS7wEEBPvYWWckJMOacL3daNukHoVK4L
 3K0uqeAhXXsob8AcfPyKA8DP2Vi/0vRelCmoq/F8QzJmyl1HYtUzaQhkP
 /T3YoIC26m1pOnXQ9wZ9jalQajDGoaORofgcA8wGKhZA+/qZ8aORgyUWo
 Gwap+jUL1wUIFoKzSZ2jamx+oZwl14JpD3aYwFsrS/LXNxCZTxi8YoyKV Q==;
X-CSE-ConnectionGUID: o81DBNUhTkqb/FDkGStTaA==
X-CSE-MsgGUID: 2ccikKw3RjKdj9wyHxVbAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251946"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
X-CSE-ConnectionGUID: ORECK4K3Te+deQS540uMDA==
X-CSE-MsgGUID: zQykWTUIT2y71MkGjKXBCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224667"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 24/28] drm/xe: Basic SVM BO eviction
Date: Tue, 27 Aug 2024 19:48:57 -0700
Message-Id: <20240828024901.2582335-25-matthew.brost@intel.com>
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

Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 35 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
 drivers/gpu/drm/xe/xe_svm.c      |  2 ++
 drivers/gpu/drm/xe/xe_svm.h      | 13 ++++++++++++
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ad804b6f9e84..ae71fcbe5380 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -25,6 +25,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
+	struct xe_bo *bo;
+
 	if (!xe_bo_is_xe_bo(tbo)) {
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
@@ -261,6 +264,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	bo = ttm_to_xe_bo(tbo);
+	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
+		*placement = sys_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
@@ -758,6 +767,17 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		}
 	}
 
+	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) &&
+	    new_mem->mem_type == XE_PL_SYSTEM) {
+		ret = xe_svm_range_evict(bo->range);
+		if (!ret) {
+			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
+			ttm_bo_move_null(ttm_bo, new_mem);
+		}
+
+		goto out;
+	}
+
 	if (!move_lacks_source &&
 	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
 	     (mem_type_is_vram(old_mem_type) &&
@@ -1096,6 +1116,19 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
+				    const struct ttm_place *place)
+{
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
+	/* Do not evict SVMs before having a binding */
+	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC &&
+	    !xe_svm_range_has_vram_binding(bo->range))
+		return false;
+
+	return ttm_bo_eviction_valuable(ttm_bo, place);
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1106,7 +1139,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
 	.release_notify = xe_ttm_bo_release_notify,
-	.eviction_valuable = ttm_bo_eviction_valuable,
+	.eviction_valuable = xe_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 2ed558ac2264..4523b033417c 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -16,6 +16,7 @@
 #include "xe_ggtt_types.h"
 
 struct xe_device;
+struct xe_svm_range;
 struct xe_vm;
 
 #define XE_BO_MAX_PLACEMENTS	3
@@ -47,6 +48,8 @@ struct xe_bo {
 	struct ttm_bo_kmap_obj kmap;
 	/** @pinned_link: link to present / evicted list of pinned BO */
 	struct list_head pinned_link;
+	/** @range: SVM range for BO */
+	struct xe_svm_range *range;
 #ifdef CONFIG_PROC_FS
 	/**
 	 * @client: @xe_drm_client which created the bo
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fd8987e0a506..dc9810828c0a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -531,6 +531,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 			  range->base.va.start, ttm_bo_type_device,
 			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
+	if (!IS_ERR(bo))
+		bo->range = range;
 	xe_vm_unlock(vm);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3f432483a230..b9cf0e2500da 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -46,6 +46,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
 }
 
+static inline bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
+{
+	return xe_svm_range_in_vram(range) && range->tile_present;
+}
+
+static inline int xe_svm_range_evict(struct xe_svm_range *range)
+{
+	struct drm_gpusvm_ctx ctx = { .trylock_mmap = true, };
+
+	return drm_gpusvm_migrate_to_sram(range->base.gpusvm, &range->base,
+					  &ctx);
+}
+
 #define xe_svm_notifier_lock(vm__)	\
 	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
 
-- 
2.34.1

