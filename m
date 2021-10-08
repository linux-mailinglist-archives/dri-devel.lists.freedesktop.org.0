Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AEB426BC5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DF96F514;
	Fri,  8 Oct 2021 13:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1196F50D;
 Fri,  8 Oct 2021 13:35:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287388467"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="287388467"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="522983736"
Received: from lenovo-x280.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.98])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 5/6] drm/i915/ttm: Attach the migration fence to a region
 timeline on eviction
Date: Fri,  8 Oct 2021 15:35:29 +0200
Message-Id: <20211008133530.664509-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
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

On eviction, TTM requires that migration fences from the same region are
ordered using dma_fence_is_later(). For request-based fences we therefore
need to use the same context for the migration, but now that we use a
dma_fence_work for error recovery, and, in addition, might need to coalesce
the migration fence with async unbind fences, Create a coalesce fence for
this.

Chain the coalesce fence on the migration fence and attach it to a region
timeline.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 84 ++++++++++++++++++----
 drivers/gpu/drm/i915/intel_memory_region.c | 43 +++++++++++
 drivers/gpu/drm/i915/intel_memory_region.h |  7 ++
 3 files changed, 119 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 79d4d50aa4e5..625ce52e8662 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -672,9 +672,10 @@ static void __i915_ttm_move_fallback(struct ttm_buffer_object *bo, bool clear,
 	}
 }
 
-static int __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
-			   struct ttm_resource *dst_mem, struct ttm_tt *dst_ttm,
-			   struct i915_refct_sgt *dst_rsgt, bool allow_accel)
+static struct dma_fence *
+__i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
+		struct ttm_resource *dst_mem, struct ttm_tt *dst_ttm,
+		struct i915_refct_sgt *dst_rsgt, bool allow_accel)
 {
 	struct i915_ttm_memcpy_work *copy_work;
 	struct dma_fence *fence;
@@ -689,7 +690,7 @@ static int __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 		/* Don't fail with -ENOMEM. Move sync instead. */
 		__i915_ttm_move_fallback(bo, clear, dst_mem, dst_ttm, dst_rsgt,
 					 allow_accel);
-		return 0;
+		return NULL;
 	}
 
 	dma_fence_work_init(&copy_work->base, &i915_ttm_memcpy_ops);
@@ -714,14 +715,45 @@ static int __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 	fence = dma_fence_get(&copy_work->base.dma);
 	dma_fence_work_commit_imm(&copy_work->base);
 
-	/*
-	 * We're synchronizing here for now. For async moves, return the
-	 * fence.
-	 */
-	dma_fence_wait(fence, false);
-	dma_fence_put(fence);
+	return fence;
+}
 
-	return ret;
+/**
+ * struct i915_coalesce_fence - A dma-fence used to coalesce multiple fences
+ * similar to struct dm_fence_array, and at the same time being timeline-
+ * attached.
+ * @base: struct dma_fence_work base.
+ * @cb: Callback for timeline attachment.
+ */
+struct i915_coalesce_fence {
+	struct dma_fence_work base;
+	struct i915_sw_dma_fence_cb cb;
+};
+
+/* No .work or .release callback. Just coalescing. */
+static const struct dma_fence_work_ops i915_coalesce_fence_ops = {
+	.name = "Coalesce fence",
+};
+
+static struct dma_fence *
+i915_ttm_coalesce_fence(struct dma_fence *fence, struct intel_memory_region *mr)
+{
+	struct i915_coalesce_fence *coalesce =
+		kmalloc(sizeof(*coalesce), GFP_KERNEL);
+
+	if (!coalesce) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+		return NULL;
+	}
+
+	dma_fence_work_init(&coalesce->base, &i915_coalesce_fence_ops);
+	dma_fence_work_chain(&coalesce->base, fence);
+	dma_fence_work_timeline_attach(&mr->tl, &coalesce->base, &coalesce->cb);
+	dma_fence_get(&coalesce->base.dma);
+	dma_fence_work_commit_imm(&coalesce->base);
+	dma_fence_put(fence);
+	return &coalesce->base.dma;
 }
 
 static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
@@ -734,6 +766,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		ttm_manager_type(bo->bdev, dst_mem->mem_type);
 	struct ttm_tt *ttm = bo->ttm;
 	struct i915_refct_sgt *dst_rsgt;
+	struct dma_fence *fence = NULL;
 	bool clear;
 	int ret;
 
@@ -765,7 +798,23 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 
 	clear = !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
 	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
-		__i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_rsgt, true);
+		fence = __i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_rsgt, true);
+	if (fence && evict) {
+		struct intel_memory_region *mr =
+			i915_ttm_region(bo->bdev, bo->resource->mem_type);
+
+		/*
+		 * Attach to the region timeline and for future async unbind,
+		 * which requires a timeline. Also future async unbind fences
+		 * can be attached here.
+		 */
+		fence = i915_ttm_coalesce_fence(fence, mr);
+	}
+
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
 
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 	i915_ttm_adjust_domains_after_move(obj);
@@ -1223,6 +1272,7 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 		.interruptible = intr,
 	};
 	struct i915_refct_sgt *dst_rsgt;
+	struct dma_fence *fence;
 	int ret;
 
 	assert_object_held(dst);
@@ -1238,10 +1288,14 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 		return ret;
 
 	dst_rsgt = i915_ttm_resource_get_st(dst, dst_bo->resource);
-	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
-			dst_rsgt, allow_accel);
-
+	fence = __i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
+				dst_rsgt, allow_accel);
 	i915_refct_sgt_put(dst_rsgt);
 
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index e7f7e6627750..aa1733e840f7 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -7,6 +7,9 @@
 #include "i915_drv.h"
 #include "i915_ttm_buddy_manager.h"
 
+static const struct dma_fence_work_timeline_ops tl_ops;
+static void intel_region_timeline_release_work(struct work_struct *work);
+
 static const struct {
 	u16 class;
 	u16 instance;
@@ -127,6 +130,10 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	}
 
 	kref_init(&mem->kref);
+
+	INIT_WORK(&mem->tl_put_work, intel_region_timeline_release_work);
+	dma_fence_work_timeline_init(&mem->tl, NULL, &tl_ops);
+
 	return mem;
 
 err_free:
@@ -238,6 +245,42 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
 	}
 }
 
+static void intel_region_timeline_get(struct dma_fence_work_timeline *tl)
+{
+	struct intel_memory_region *mr = container_of(tl, typeof(*mr), tl);
+
+	intel_memory_region_get(mr);
+}
+
+static void intel_region_timeline_release_work(struct work_struct *work)
+{
+	struct intel_memory_region *mr =
+		container_of(work, typeof(*mr), tl_put_work);
+
+	__intel_memory_region_destroy(&mr->kref);
+}
+
+static void intel_region_timeline_release(struct kref *ref)
+{
+	struct intel_memory_region *mr = container_of(ref, typeof(*mr), kref);
+
+	/* May be called from hardirq context, so queue the final release. */
+	queue_work(system_unbound_wq, &mr->tl_put_work);
+}
+
+static void intel_region_timeline_put(struct dma_fence_work_timeline *tl)
+{
+	struct intel_memory_region *mr = container_of(tl, typeof(*mr), tl);
+
+	kref_put(&mr->kref, intel_region_timeline_release);
+}
+
+static const struct dma_fence_work_timeline_ops tl_ops = {
+	.name = "Region timeline",
+	.get = intel_region_timeline_get,
+	.put = intel_region_timeline_put,
+};
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/intel_memory_region.c"
 #include "selftests/mock_region.c"
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3feae3353d33..928819e2edba 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -13,6 +13,8 @@
 #include <drm/drm_mm.h>
 #include <drm/i915_drm.h>
 
+#include "i915_sw_fence_work.h"
+
 struct drm_i915_private;
 struct drm_i915_gem_object;
 struct drm_printer;
@@ -94,6 +96,11 @@ struct intel_memory_region {
 	bool is_range_manager;
 
 	void *region_private;
+
+	/** Timeline for TTM eviction fences */
+	struct dma_fence_work_timeline tl;
+	/** Work struct for _region_put() from atomic / irq context */
+	struct work_struct tl_put_work;
 };
 
 struct intel_memory_region *
-- 
2.31.1

