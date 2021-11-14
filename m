Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD544F78F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 12:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F8089E41;
	Sun, 14 Nov 2021 11:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286B89E2B;
 Sun, 14 Nov 2021 11:12:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10167"; a="233258161"
X-IronPort-AV: E=Sophos;i="5.87,233,1631602800"; d="scan'208";a="233258161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 03:12:38 -0800
X-IronPort-AV: E=Sophos;i="5.87,233,1631602800"; d="scan'208";a="505519857"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.235])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 03:12:36 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/i915/ttm: Implement asynchronous TTM moves
Date: Sun, 14 Nov 2021 12:12:17 +0100
Message-Id: <20211114111218.623138-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
References: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't wait sync while migrating, but rather make the GPU blit await the
dependencies and add a moving fence to the object.

This also enables asynchronous VRAM management in that on eviction,
rather than waiting for the moving fence to expire before freeing VRAM,
it is freed immediately and the fence is stored with the VRAM manager and
handed out to newly allocated objects to await before clears and swapins,
or for kernel objects before setting up gpu vmas or mapping.

To collect dependencies before migrating, add a set of utilities that
coalesce these to a single dma_fence.

What is still missing for fully asynchronous operation is asynchronous vma
unbinding, which is still to be implemented.

This commit substantially reduces execution time in the gem_lmem_swapping
test.

v2:
- Make a couple of functions static.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  10 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 329 +++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c     |   4 +-
 4 files changed, 318 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index a1df49378a0f..111a4282d779 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -326,6 +326,9 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
+	if (!obj)
+		return false;
+
 	/*
 	 * EXTERNAL objects should never be swapped out by TTM, instead we need
 	 * to handle that ourselves. TTM will already skip such objects for us,
@@ -448,6 +451,10 @@ static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
 	if (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED)
 		return 0;
 
+	ret = ttm_bo_wait_ctx(bo, &ctx);
+	if (ret)
+		return ret;
+
 	bo->ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
 	ret = ttm_bo_validate(bo, &place, &ctx);
 	if (ret) {
@@ -549,6 +556,9 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	int ret = i915_ttm_move_notify(bo);
 
+	if (!obj)
+		return;
+
 	GEM_WARN_ON(ret);
 	GEM_WARN_ON(obj->ttm.cached_io_rsgt);
 	if (!ret && obj->mm.madv != I915_MADV_WILLNEED)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 82cdabb542be..9d698ad00853 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -37,7 +37,7 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
 static inline struct drm_i915_gem_object *
 i915_ttm_to_gem(struct ttm_buffer_object *bo)
 {
-	if (GEM_WARN_ON(bo->destroy != i915_ttm_bo_destroy))
+	if (bo->destroy != i915_ttm_bo_destroy)
 		return NULL;
 
 	return container_of(bo, struct drm_i915_gem_object, __do_not_access);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index f35b386c56ca..ae2c49fc3500 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <linux/dma-fence-array.h>
+
 #include <drm/ttm/ttm_bo_driver.h>
 
 #include "i915_drv.h"
@@ -41,6 +43,228 @@ void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
 }
 #endif
 
+/**
+ * DOC: Set of utilities to dynamically collect dependencies and
+ * eventually coalesce them into a single fence which is fed into
+ * the migration code. That single fence is, in the case of dependencies
+ * from multiple contexts, a struct dma_fence_array, since the
+ * i915 request code can break that up and await the individual
+ * fences.
+ *
+ * While collecting the individual dependencies, we store the refcounted
+ * struct dma_fence pointers in a realloc-type-managed pointer array, since
+ * that can be easily fed into a dma_fence_array. Other options are
+ * available, like for example an xarray for similarity with drm/sched.
+ * Can be changed easily if needed.
+ *
+ * We might want to break this out into a separate file as a utility.
+ */
+
+#define I915_DEPS_MIN_ALLOC_CHUNK 8U
+
+/**
+ * struct i915_deps - Collect dependencies into a single dma-fence
+ * @single: Storage for pointer if the collection is a single fence.
+ * @fence: Allocated array of fence pointers if more than a single fence;
+ * otherwise points to the address of @single.
+ * @num_deps: Current number of dependency fences.
+ * @fences_size: Size of the @fences array in number of pointers.
+ * @gfp: Allocation mode.
+ */
+struct i915_deps {
+	struct dma_fence *single;
+	struct dma_fence **fences;
+	unsigned int num_deps;
+	unsigned int fences_size;
+	gfp_t gfp;
+};
+
+static void i915_deps_reset_fences(struct i915_deps *deps)
+{
+	if (deps->fences != &deps->single)
+		kfree(deps->fences);
+	deps->num_deps = 0;
+	deps->fences_size = 1;
+	deps->fences = &deps->single;
+}
+
+static void i915_deps_init(struct i915_deps *deps, gfp_t gfp)
+{
+	deps->fences = NULL;
+	deps->gfp = gfp;
+	i915_deps_reset_fences(deps);
+}
+
+static void i915_deps_fini(struct i915_deps *deps)
+{
+	unsigned int i;
+
+	for (i = 0; i < deps->num_deps; ++i)
+		dma_fence_put(deps->fences[i]);
+
+	if (deps->fences != &deps->single)
+		kfree(deps->fences);
+}
+
+static int i915_deps_grow(struct i915_deps *deps, struct dma_fence *fence,
+			  const struct ttm_operation_ctx *ctx)
+{
+	int ret;
+
+	if (deps->num_deps >= deps->fences_size) {
+		unsigned int new_size = 2 * deps->fences_size;
+		struct dma_fence **new_fences;
+
+		new_size = max(new_size, I915_DEPS_MIN_ALLOC_CHUNK);
+		new_fences = kmalloc_array(new_size, sizeof(*new_fences), deps->gfp);
+		if (!new_fences)
+			goto sync;
+
+		memcpy(new_fences, deps->fences,
+		       deps->fences_size * sizeof(*new_fences));
+		swap(new_fences, deps->fences);
+		if (new_fences != &deps->single)
+			kfree(new_fences);
+		deps->fences_size = new_size;
+	}
+	deps->fences[deps->num_deps++] = dma_fence_get(fence);
+	return 0;
+
+sync:
+	if (ctx->no_wait_gpu) {
+		ret = -EBUSY;
+		goto unref;
+	}
+
+	ret = dma_fence_wait(fence, ctx->interruptible);
+	if (ret)
+		goto unref;
+
+	ret = fence->error;
+	if (ret)
+		goto unref;
+
+	return 0;
+
+unref:
+	i915_deps_fini(deps);
+	return ret;
+}
+
+static int i915_deps_sync(struct i915_deps *deps,
+			  const struct ttm_operation_ctx *ctx)
+{
+	unsigned int i;
+	int ret = 0;
+	struct dma_fence **fences = deps->fences;
+
+	for (i = 0; i < deps->num_deps; ++i, ++fences) {
+		if (ctx->no_wait_gpu) {
+			ret = -EBUSY;
+			goto unref;
+		}
+
+		ret = dma_fence_wait(*fences, ctx->interruptible);
+		if (ret)
+			goto unref;
+
+		ret = (*fences)->error;
+		if (ret)
+			goto unref;
+	}
+
+	i915_deps_fini(deps);
+	return 0;
+
+unref:
+	i915_deps_fini(deps);
+	return ret;
+}
+
+static int i915_deps_add_dependency(struct i915_deps *deps,
+				    struct dma_fence *fence,
+				    const struct ttm_operation_ctx *ctx)
+{
+	unsigned int i;
+	int ret;
+
+	if (!fence)
+		return 0;
+
+	if (dma_fence_is_signaled(fence)) {
+		ret = fence->error;
+		if (ret)
+			i915_deps_fini(deps);
+		return ret;
+	}
+
+	for (i = 0; i < deps->num_deps; ++i) {
+		struct dma_fence *entry = deps->fences[i];
+
+		if (!entry->context || entry->context != fence->context)
+			continue;
+
+		if (dma_fence_is_later(fence, entry)) {
+			dma_fence_put(entry);
+			deps->fences[i] = dma_fence_get(fence);
+		}
+
+		return 0;
+	}
+
+	return i915_deps_grow(deps, fence, ctx);
+}
+
+static struct dma_fence *i915_deps_to_fence(struct i915_deps *deps,
+					    const struct ttm_operation_ctx *ctx)
+{
+	struct dma_fence_array *array;
+
+	if (deps->num_deps == 0)
+		return NULL;
+
+	if (deps->num_deps == 1) {
+		deps->num_deps = 0;
+		return deps->fences[0];
+	}
+
+	/*
+	 * TODO: Alter the allocation mode here to not try too hard to
+	 * make things async.
+	 */
+	array = dma_fence_array_create(deps->num_deps, deps->fences, 0, 0,
+				       false);
+	if (!array)
+		return ERR_PTR(i915_deps_sync(deps, ctx));
+
+	deps->fences = NULL;
+	i915_deps_reset_fences(deps);
+
+	return &array->base;
+}
+
+static int i915_deps_add_resv(struct i915_deps *deps, struct dma_resv *resv,
+			      bool all, const bool no_excl,
+			      const struct ttm_operation_ctx *ctx)
+{
+	struct dma_resv_iter iter;
+	struct dma_fence *fence;
+
+	dma_resv_assert_held(resv);
+	dma_resv_for_each_fence(&iter, resv, all, fence) {
+		int ret;
+
+		if (no_excl && !iter.index)
+			continue;
+
+		ret = i915_deps_add_dependency(deps, fence, ctx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static enum i915_cache_level
 i915_ttm_cache_level(struct drm_i915_private *i915, struct ttm_resource *res,
 		     struct ttm_tt *ttm)
@@ -156,7 +380,8 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 					     bool clear,
 					     struct ttm_resource *dst_mem,
 					     struct ttm_tt *dst_ttm,
-					     struct sg_table *dst_st)
+					     struct sg_table *dst_st,
+					     struct dma_fence *dep)
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
 						     bdev);
@@ -180,7 +405,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 			return ERR_PTR(-EINVAL);
 
 		intel_engine_pm_get(i915->gt.migrate.context->engine);
-		ret = intel_context_migrate_clear(i915->gt.migrate.context, NULL,
+		ret = intel_context_migrate_clear(i915->gt.migrate.context, dep,
 						  dst_st->sgl, dst_level,
 						  i915_ttm_gtt_binds_lmem(dst_mem),
 						  0, &rq);
@@ -194,7 +419,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
 		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
 		intel_engine_pm_get(i915->gt.migrate.context->engine);
 		ret = intel_context_migrate_copy(i915->gt.migrate.context,
-						 NULL, src_rsgt->table.sgl,
+						 dep, src_rsgt->table.sgl,
 						 src_level,
 						 i915_ttm_gtt_binds_lmem(bo->resource),
 						 dst_st->sgl, dst_level,
@@ -378,10 +603,11 @@ i915_ttm_memcpy_work_arm(struct i915_ttm_memcpy_work *work,
 	return &work->fence;
 }
 
-static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
-			    struct ttm_resource *dst_mem,
-			    struct ttm_tt *dst_ttm,
-			    struct i915_refct_sgt *dst_rsgt, bool allow_accel)
+static struct dma_fence *
+__i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
+		struct ttm_resource *dst_mem, struct ttm_tt *dst_ttm,
+		struct i915_refct_sgt *dst_rsgt, bool allow_accel,
+		struct dma_fence *move_dep)
 {
 	struct i915_ttm_memcpy_work *copy_work = NULL;
 	struct i915_ttm_memcpy_arg _arg, *arg = &_arg;
@@ -389,7 +615,7 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 
 	if (allow_accel) {
 		fence = i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm,
-					    &dst_rsgt->table);
+					    &dst_rsgt->table, move_dep);
 
 		/*
 		 * We only need to intercept the error when moving to lmem.
@@ -423,6 +649,11 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 
 		if (!IS_ERR(fence))
 			goto out;
+	} else if (move_dep) {
+		int err = dma_fence_wait(move_dep, true);
+
+		if (err)
+			return ERR_PTR(err);
 	}
 
 	/* Error intercept failed or no accelerated migration to start with */
@@ -433,16 +664,35 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
 	i915_ttm_memcpy_release(arg);
 	kfree(copy_work);
 
-	return;
+	return NULL;
 out:
-	/* Sync here for now, forward the fence to caller when fully async. */
-	if (fence) {
-		dma_fence_wait(fence, false);
-		dma_fence_put(fence);
-	} else if (copy_work) {
+	if (!fence && copy_work) {
 		i915_ttm_memcpy_release(arg);
 		kfree(copy_work);
 	}
+
+	return fence;
+}
+
+static struct dma_fence *prev_fence(struct ttm_buffer_object *bo,
+				    struct ttm_operation_ctx *ctx)
+{
+	struct i915_deps deps;
+	int ret;
+
+	/*
+	 * Instead of trying hard with GFP_KERNEL to allocate memory,
+	 * the dependency collection will just sync if it doesn't
+	 * succeed.
+	 */
+	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
+	ret = i915_deps_add_dependency(&deps, bo->moving, ctx);
+	if (!ret)
+		ret = i915_deps_add_resv(&deps, bo->base.resv, false, false, ctx);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return i915_deps_to_fence(&deps, ctx);
 }
 
 /**
@@ -462,16 +712,12 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	struct ttm_resource_manager *dst_man =
 		ttm_manager_type(bo->bdev, dst_mem->mem_type);
+	struct dma_fence *migration_fence = NULL;
 	struct ttm_tt *ttm = bo->ttm;
 	struct i915_refct_sgt *dst_rsgt;
 	bool clear;
 	int ret;
 
-	/* Sync for now. We could do the actual copy async. */
-	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (ret)
-		return ret;
-
 	ret = i915_ttm_move_notify(bo);
 	if (ret)
 		return ret;
@@ -494,10 +740,37 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		return PTR_ERR(dst_rsgt);
 
 	clear = !i915_ttm_cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
-	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
-		__i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_rsgt, true);
+	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))) {
+		struct dma_fence *dep = prev_fence(bo, ctx);
+
+		if (IS_ERR(dep)) {
+			i915_refct_sgt_put(dst_rsgt);
+			return PTR_ERR(dep);
+		}
+
+		migration_fence = __i915_ttm_move(bo, clear, dst_mem, bo->ttm,
+						  dst_rsgt, true, dep);
+		dma_fence_put(dep);
+	}
+
+	/* We can possibly get an -ERESTARTSYS here */
+	if (IS_ERR(migration_fence)) {
+		i915_refct_sgt_put(dst_rsgt);
+		return PTR_ERR(migration_fence);
+	}
+
+	if (migration_fence) {
+		ret = ttm_bo_move_accel_cleanup(bo, migration_fence, evict,
+						true, dst_mem);
+		if (ret) {
+			dma_fence_wait(migration_fence, false);
+			ttm_bo_move_sync_cleanup(bo, dst_mem);
+		}
+		dma_fence_put(migration_fence);
+	} else {
+		ttm_bo_move_sync_cleanup(bo, dst_mem);
+	}
 
-	ttm_bo_move_sync_cleanup(bo, dst_mem);
 	i915_ttm_adjust_domains_after_move(obj);
 	i915_ttm_free_cached_io_rsgt(obj);
 
@@ -538,6 +811,7 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 		.interruptible = intr,
 	};
 	struct i915_refct_sgt *dst_rsgt;
+	struct dma_fence *copy_fence;
 	int ret;
 
 	assert_object_held(dst);
@@ -553,10 +827,17 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
 		return ret;
 
 	dst_rsgt = i915_ttm_resource_get_st(dst, dst_bo->resource);
-	__i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
-			dst_rsgt, allow_accel);
+	copy_fence = __i915_ttm_move(src_bo, false, dst_bo->resource,
+				     dst_bo->ttm, dst_rsgt, allow_accel, NULL);
 
 	i915_refct_sgt_put(dst_rsgt);
+	if (IS_ERR(copy_fence))
+		return PTR_ERR(copy_fence);
+
+	if (copy_fence) {
+		dma_fence_wait(copy_fence, false);
+		dma_fence_put(copy_fence);
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..bae65796a6cc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -306,6 +306,6 @@ int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
 				   unsigned int flags)
 {
 	might_sleep();
-	/* NOP for now. */
-	return 0;
+
+	return i915_gem_object_wait_moving_fence(obj, !!(flags & I915_WAIT_INTERRUPTIBLE));
 }
-- 
2.31.1

