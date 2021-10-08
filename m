Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12C426BC1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F246F50B;
	Fri,  8 Oct 2021 13:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2D16F509;
 Fri,  8 Oct 2021 13:35:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287388457"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="287388457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="522983721"
Received: from lenovo-x280.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.98])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/6] drm/i915/ttm: Failsafe migration blits
Date: Fri,  8 Oct 2021 15:35:27 +0200
Message-Id: <20211008133530.664509-4-thomas.hellstrom@linux.intel.com>
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

If the initial fill blit or copy blit of an object fails, the old
content of the data might be exposed and read as soon as either CPU- or
GPU PTEs are set up to point at the pages.

Intercept the blit fence with an async dma_fence_work that checks the
blit fence for errors and if there are errors performs an async cpu blit
instead. If there is a failure to allocate the async dma_fence_work,
allocate it on the stack and sync wait for the blit to complete.

Add selftests that simulate gpu blit failures and failure to allocate
the async dma_fence_work.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 268 ++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   4 +
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
 3 files changed, 240 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4b4d7457bef9..79d4d50aa4e5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -7,6 +7,7 @@
 #include <drm/ttm/ttm_placement.h>
 
 #include "i915_drv.h"
+#include "i915_sw_fence_work.h"
 #include "intel_memory_region.h"
 #include "intel_region_ttm.h"
 
@@ -25,6 +26,18 @@
 #define I915_TTM_PRIO_NO_PAGES  1
 #define I915_TTM_PRIO_HAS_PAGES 2
 
+I915_SELFTEST_DECLARE(static bool fail_gpu_migration;)
+I915_SELFTEST_DECLARE(static bool fail_work_allocation;)
+
+#ifdef CONFIG_DRM_I915_SELFTEST
+void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
+					bool work_allocation)
+{
+	fail_gpu_migration = gpu_migration;
+	fail_work_allocation = work_allocation;
+}
+#endif
+
 /*
  * Size of struct ttm_place vector in on-stack struct ttm_placement allocs
  */
@@ -466,11 +479,11 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 	return intel_region_ttm_resource_to_rsgt(obj->mm.region, res);
 }
 
-static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
-			       bool clear,
-			       struct ttm_resource *dst_mem,
-			       struct ttm_tt *dst_ttm,
-			       struct sg_table *dst_st)
+static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
+					     bool clear,
+					     struct ttm_resource *dst_mem,
+					     struct ttm_tt *dst_ttm,
+					     struct sg_table *dst_st)
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
 						     bdev);
@@ -481,30 +494,29 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 	int ret;
 
 	if (!i915->gt.migrate.context || intel_gt_is_wedged(&i915->gt))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	/* With fail_gpu_migration, we always perform a GPU clear. */
+	if (I915_SELFTEST_ONLY(fail_gpu_migration))
+		clear = true;
 
 	dst_level = i915_ttm_cache_level(i915, dst_mem, dst_ttm);
 	if (clear) {
-		if (bo->type == ttm_bo_type_kernel)
-			return -EINVAL;
+		if (bo->type == ttm_bo_type_kernel &&
+		    !I915_SELFTEST_ONLY(fail_gpu_migration))
+			return ERR_PTR(-EINVAL);
 
 		intel_engine_pm_get(i915->gt.migrate.context->engine);
 		ret = intel_context_migrate_clear(i915->gt.migrate.context, NULL,
 						  dst_st->sgl, dst_level,
 						  gpu_binds_iomem(dst_mem),
 						  0, &rq);
-
-		if (!ret && rq) {
-			i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
-			i915_request_put(rq);
-		}
-		intel_engine_pm_put(i915->gt.migrate.context->engine);
 	} else {
 		struct i915_refct_sgt *src_rsgt =
 			i915_ttm_resource_get_st(obj, bo->resource);
 
 		if (IS_ERR(src_rsgt))
-			return PTR_ERR(src_rsgt);
+			return ERR_CAST(src_rsgt);
 
 		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
 		intel_engine_pm_get(i915->gt.migrate.context->engine);
@@ -515,55 +527,201 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
 						 dst_st->sgl, dst_level,
 						 gpu_binds_iomem(dst_mem),
 						 &rq);
+
 		i915_refct_sgt_put(src_rsgt);
-		if (!ret && rq) {
-			i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
-			i915_request_put(rq);
-		}
-		intel_engine_pm_put(i915->gt.migrate.context->engine);
 	}
 
-	return ret;
+	intel_engine_pm_put(i915->gt.migrate.context->engine);
+
+	if (ret && rq) {
+		i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
+		i915_request_put(rq);
+	}
+
+	return ret ? ERR_PTR(ret) : &rq->fence;
+}
+
+/**
+ * struct i915_ttm_memcpy_work - memcpy work item under a dma-fence
+ * @base: The struct dma_fence_work we subclass.
+ * @_dst_iter: Storage space for the destination kmap iterator.
+ * @_src_iter: Storage space for the source kmap iterator.
+ * @dst_iter: Pointer to the destination kmap iterator.
+ * @src_iter: Pointer to the source kmap iterator.
+ * @clear: Whether to clear instead of copy.
+ * @num_pages: Number of pages in the copy.
+ * @src_rsgt: Refcounted scatter-gather list of source memory.
+ * @dst_rsgt: Refcounted scatter-gather list of destination memory.
+ */
+struct i915_ttm_memcpy_work {
+	struct dma_fence_work base;
+	union {
+		struct ttm_kmap_iter_tt tt;
+		struct ttm_kmap_iter_iomap io;
+	} _dst_iter,
+	_src_iter;
+	struct ttm_kmap_iter *dst_iter;
+	struct ttm_kmap_iter *src_iter;
+	unsigned long num_pages;
+	bool clear;
+	struct i915_refct_sgt *src_rsgt;
+	struct i915_refct_sgt *dst_rsgt;
+};
+
+static void __memcpy_work(struct dma_fence_work *work)
+{
+	struct i915_ttm_memcpy_work *copy_work =
+		container_of(work, typeof(*copy_work), base);
+
+	if (I915_SELFTEST_ONLY(fail_gpu_migration))
+		cmpxchg(&work->error, 0, -EINVAL);
+
+	/* If there was an error in the gpu copy operation, run memcpy. */
+	if (work->error)
+		ttm_move_memcpy(copy_work->clear, copy_work->num_pages,
+				copy_work->dst_iter, copy_work->src_iter);
+
+	/*
+	 * Can't signal before we unref the rsgts, because then
+	 * ttms might be unpopulated before we unref these and we'll hit
+	 * a GEM_WARN_ON() in i915_ttm_tt_unpopulate. Not a real problem,
+	 * but good to keep the GEM_WARN_ON to check that we don't leak rsgts.
+	 */
+	i915_refct_sgt_put(copy_work->src_rsgt);
+	i915_refct_sgt_put(copy_work->dst_rsgt);
+}
+
+static const struct dma_fence_work_ops i915_ttm_memcpy_ops = {
+	.work = __memcpy_work,
+};
+
+static void i915_ttm_memcpy_work_init(struct i915_ttm_memcpy_work *copy_work,
+				      struct ttm_buffer_object *bo, bool clear,
+				      struct ttm_resource *dst_mem,
+				      struct ttm_tt *dst_ttm,
+				      struct i915_refct_sgt *dst_rsgt)
+{
+	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	struct intel_memory_region *dst_reg, *src_reg;
+
+	dst_reg = i915_ttm_region(bo->bdev, dst_mem->mem_type);
+	src_reg = i915_ttm_region(bo->bdev, bo->resource->mem_type);
+	GEM_BUG_ON(!dst_reg || !src_reg);
+
+	/*
+	 * We could consider populating only parts of this structure
+	 * (like avoiding the iterators) until it's actually
+	 * determined that we need it. But initializing the iterators
+	 * shouldn't be that costly really.
+	 */
+
+	copy_work->dst_iter = !cpu_maps_iomem(dst_mem) ?
+		ttm_kmap_iter_tt_init(&copy_work->_dst_iter.tt, dst_ttm) :
+		ttm_kmap_iter_iomap_init(&copy_work->_dst_iter.io, &dst_reg->iomap,
+					 &dst_rsgt->table, dst_reg->region.start);
+
+	copy_work->src_iter = !cpu_maps_iomem(bo->resource) ?
+		ttm_kmap_iter_tt_init(&copy_work->_src_iter.tt, bo->ttm) :
+		ttm_kmap_iter_iomap_init(&copy_work->_src_iter.io, &src_reg->iomap,
+					 &obj->ttm.cached_io_rsgt->table,
+					 src_reg->region.start);
+	copy_work->clear = clear;
+	copy_work->num_pages = bo->base.size >> PAGE_SHIFT;
+
+	copy_work->dst_rsgt = i915_refct_sgt_get(dst_rsgt);
+	copy_work->src_rsgt = clear ? NULL :
+		i915_ttm_resource_get_st(obj, bo->resource);
 }
 
-static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
-			    struct ttm_resource *dst_mem,
-			    struct ttm_tt *dst_ttm,
-			    struct i915_refct_sgt *dst_rsgt,
-			    bool allow_accel)
+/*
+ * This is only used as a last fallback if the copy_work
+ * memory allocation fails, prohibiting async moves.
+ */
+static void __i915_ttm_move_fallback(struct ttm_buffer_object *bo, bool clear,
+				     struct ttm_resource *dst_mem,
+				     struct ttm_tt *dst_ttm,
+				     struct i915_refct_sgt *dst_rsgt,
+				     bool allow_accel)
 {
 	int ret = -EINVAL;
 
-	if (allow_accel)
-		ret = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm,
-					  &dst_rsgt->table);
-	if (ret) {
-		struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
-		struct intel_memory_region *dst_reg, *src_reg;
-		union {
-			struct ttm_kmap_iter_tt tt;
-			struct ttm_kmap_iter_iomap io;
-		} _dst_iter, _src_iter;
-		struct ttm_kmap_iter *dst_iter, *src_iter;
-
-		dst_reg = i915_ttm_region(bo->bdev, dst_mem->mem_type);
-		src_reg = i915_ttm_region(bo->bdev, bo->resource->mem_type);
-		GEM_BUG_ON(!dst_reg || !src_reg);
-
-		dst_iter = !cpu_maps_iomem(dst_mem) ?
-			ttm_kmap_iter_tt_init(&_dst_iter.tt, dst_ttm) :
-			ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
-						 &dst_rsgt->table,
-						 dst_reg->region.start);
-
-		src_iter = !cpu_maps_iomem(bo->resource) ?
-			ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
-			ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
-						 &obj->ttm.cached_io_rsgt->table,
-						 src_reg->region.start);
-
-		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
+	if (allow_accel) {
+		struct dma_fence *fence;
+
+		fence = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm,
+					    &dst_rsgt->table);
+		if (IS_ERR(fence)) {
+			ret = PTR_ERR(fence);
+		} else {
+			ret = dma_fence_wait(fence, false);
+			if (!ret)
+				ret = fence->error;
+			dma_fence_put(fence);
+		}
+	}
+
+	if (ret || I915_SELFTEST_ONLY(fail_gpu_migration)) {
+		struct i915_ttm_memcpy_work copy_work;
+
+		i915_ttm_memcpy_work_init(&copy_work, bo, clear, dst_mem,
+					  dst_ttm, dst_rsgt);
+
+		/* Trigger a copy by setting an error value */
+		copy_work.base.dma.error = -EINVAL;
+		__memcpy_work(&copy_work.base);
+	}
+}
+
+static int __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
+			   struct ttm_resource *dst_mem, struct ttm_tt *dst_ttm,
+			   struct i915_refct_sgt *dst_rsgt, bool allow_accel)
+{
+	struct i915_ttm_memcpy_work *copy_work;
+	struct dma_fence *fence;
+	int ret;
+
+	if (!I915_SELFTEST_ONLY(fail_work_allocation))
+		copy_work = kzalloc(sizeof(*copy_work), GFP_KERNEL);
+	else
+		copy_work = NULL;
+
+	if (!copy_work) {
+		/* Don't fail with -ENOMEM. Move sync instead. */
+		__i915_ttm_move_fallback(bo, clear, dst_mem, dst_ttm, dst_rsgt,
+					 allow_accel);
+		return 0;
+	}
+
+	dma_fence_work_init(&copy_work->base, &i915_ttm_memcpy_ops);
+	if (allow_accel) {
+		fence = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm,
+					    &dst_rsgt->table);
+		if (IS_ERR(fence)) {
+			i915_sw_fence_set_error_once(&copy_work->base.chain,
+						     PTR_ERR(fence));
+		} else {
+			ret = dma_fence_work_chain(&copy_work->base, fence);
+			dma_fence_put(fence);
+			GEM_WARN_ON(ret < 0);
+		}
+	} else {
+		i915_sw_fence_set_error_once(&copy_work->base.chain, -EINVAL);
 	}
+
+	/* Setup async memcpy */
+	i915_ttm_memcpy_work_init(copy_work, bo, clear, dst_mem, dst_ttm,
+				  dst_rsgt);
+	fence = dma_fence_get(&copy_work->base.dma);
+	dma_fence_work_commit_imm(&copy_work->base);
+
+	/*
+	 * We're synchronizing here for now. For async moves, return the
+	 * fence.
+	 */
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 0b7291dd897c..c5bf8863446d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -51,6 +51,10 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 			  struct drm_i915_gem_object *src,
 			  bool allow_accel, bool intr);
 
+I915_SELFTEST_DECLARE
+(void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
+					 bool work_allocation);)
+
 /* Internal I915 TTM declarations and definitions below. */
 
 #define I915_PL_LMEM0 TTM_PL_PRIV
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 28a700f08b49..a2122bdcc1cb 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -4,6 +4,7 @@
  */
 
 #include "gt/intel_migrate.h"
+#include "gem/i915_gem_ttm.h"
 
 static int igt_fill_check_buffer(struct drm_i915_gem_object *obj,
 				 bool fill)
@@ -227,13 +228,34 @@ static int igt_lmem_pages_migrate(void *arg)
 	return err;
 }
 
+static int igt_lmem_pages_failsafe_migrate(void *arg)
+{
+	int fail_gpu, fail_alloc, ret;
+
+	for (fail_gpu = 0; fail_gpu < 2; ++fail_gpu) {
+		for (fail_alloc = 0; fail_alloc < 2; ++fail_alloc) {
+			pr_info("Simulated failure modes: gpu: %d, alloc: %d\n",
+				fail_gpu, fail_alloc);
+			i915_ttm_migrate_set_failure_modes(fail_gpu,
+							   fail_alloc);
+			ret = igt_lmem_pages_migrate(arg);
+			if (ret)
+				goto out_err;
+		}
+	}
+
+out_err:
+	i915_ttm_migrate_set_failure_modes(false, false);
+	return ret;
+}
+
 int i915_gem_migrate_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_smem_create_migrate),
 		SUBTEST(igt_lmem_create_migrate),
 		SUBTEST(igt_same_create_migrate),
-		SUBTEST(igt_lmem_pages_migrate),
+		SUBTEST(igt_lmem_pages_failsafe_migrate),
 	};
 
 	if (!HAS_LMEM(i915))
-- 
2.31.1

