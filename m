Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D7478E83
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB7911287B;
	Fri, 17 Dec 2021 14:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D147711287B;
 Fri, 17 Dec 2021 14:52:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300540426"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="300540426"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:52:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="506789776"
Received: from olindum-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.180])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:52:54 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915: Use vma resources for async unbinding
Date: Fri, 17 Dec 2021 15:52:27 +0100
Message-Id: <20211217145228.10987-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
References: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
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

Implement async (non-blocking) unbinding by not syncing the vma before
calling unbind on the vma_resource.
Add the resulting unbind fence to the object's dma_resv from where it is
picked up by the ttm migration code.
Ideally these unbind fences should be coalesced with the migration blit
fence to avoid stalling the migration blit waiting for unbind, as they
can certainly go on in parallel, but since we don't yet have a
reasonable data structure to use to coalesce fences and attach the
resulting fence to a timeline, we defer that for now.

Note that with async unbinding, even while the unbind waits for the
preceding bind to complete before unbinding, the vma itself might have been
destroyed in the process, clearing the vma pages. Therefore we can
only allow async unbinding if we have a refcounted sg-list and keep a
refcount on that for the vma resource pages to stay intact until
binding occurs. If this condition is not met, a request for an async
unbind is diverted to a sync unbind.

v2:
- Use a separate kmem_cache for vma resources for now to isolate their
  memory allocation and aid debugging.
- Move the check for vm closed to the actual unbinding thread. Regardless
  of whether the vm is closed, we need the unbind fence to properly wait
  for capture.
- Clear vma_res::vm on unbind and update its documentation.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  11 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c         |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c          |   4 +
 drivers/gpu/drm/i915/gt/intel_gtt.h          |   3 +
 drivers/gpu/drm/i915/i915_drv.h              |   1 +
 drivers/gpu/drm/i915/i915_gem.c              |   3 +
 drivers/gpu/drm/i915/i915_module.c           |   3 +
 drivers/gpu/drm/i915/i915_vma.c              | 180 ++++++++--
 drivers/gpu/drm/i915/i915_vma.h              |   3 +-
 drivers/gpu/drm/i915/i915_vma_resource.c     | 325 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_vma_resource.h     |  45 +++
 11 files changed, 518 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index e8a99e8cd129..0b0477f0af8b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -142,7 +142,16 @@ int i915_ttm_move_notify(struct ttm_buffer_object *bo)
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	int ret;
 
-	ret = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
+	/*
+	 * Note: The async unbinding here will actually transform the
+	 * blocking wait for unbind into a wait before finally submitting
+	 * evict / migration blit and thus stall the migration timeline
+	 * which may not be good for overall throughput. We should make
+	 * sure we await the unbind fences *after* the migration blit
+	 * instead of *before* as we currently do.
+	 */
+	ret = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE |
+				     I915_GEM_OBJECT_UNBIND_ASYNC);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index ad54941fcb98..3e9fbbfa13c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -145,7 +145,7 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
 			continue;
 
 		if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND)) {
-			__i915_vma_evict(vma);
+			__i915_vma_evict(vma, false);
 			drm_mm_remove_node(&vma->node);
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 30683c06b344..b582a4c6c3c7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -161,6 +161,9 @@ static void __i915_vm_release(struct work_struct *work)
 	struct i915_address_space *vm =
 		container_of(work, struct i915_address_space, release_work);
 
+	/* Synchronize async unbinds. */
+	i915_vma_resource_bind_dep_sync_all(vm);
+
 	vm->cleanup(vm);
 	i915_address_space_fini(vm);
 
@@ -189,6 +192,7 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	if (!kref_read(&vm->resv_ref))
 		kref_init(&vm->resv_ref);
 
+	vm->pending_unbind = RB_ROOT_CACHED;
 	INIT_WORK(&vm->release_work, __i915_vm_release);
 	atomic_set(&vm->open, 1);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 19c2497630e8..b9bd60cb2687 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -267,6 +267,9 @@ struct i915_address_space {
 	/* Flags used when creating page-table objects for this vm */
 	unsigned long lmem_pt_obj_flags;
 
+	/* Interval tree for pending unbind vma resources */
+	struct rb_root_cached pending_unbind;
+
 	struct drm_i915_gem_object *
 		(*alloc_pt_dma)(struct i915_address_space *vm, int sz);
 	struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ed48179bacd8..a99696500045 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1666,6 +1666,7 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 #define I915_GEM_OBJECT_UNBIND_BARRIER BIT(1)
 #define I915_GEM_OBJECT_UNBIND_TEST BIT(2)
 #define I915_GEM_OBJECT_UNBIND_VM_TRYLOCK BIT(3)
+#define I915_GEM_OBJECT_UNBIND_ASYNC BIT(4)
 
 void i915_gem_runtime_suspend(struct drm_i915_private *dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 527228d4da7e..22ffa6636f0e 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -165,6 +165,9 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 					} else {
 						ret = -EBUSY;
 					}
+				} else if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
+					assert_object_held(vma->obj);
+					ret = i915_vma_unbind_async(vma);
 				} else {
 					ret = i915_vma_unbind(vma);
 				}
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index f6bcd2f89257..a8f175960b34 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -17,6 +17,7 @@
 #include "i915_scheduler.h"
 #include "i915_selftest.h"
 #include "i915_vma.h"
+#include "i915_vma_resource.h"
 
 static int i915_check_nomodeset(void)
 {
@@ -64,6 +65,8 @@ static const struct {
 	  .exit = i915_scheduler_module_exit },
 	{ .init = i915_vma_module_init,
 	  .exit = i915_vma_module_exit },
+	{ .init = i915_vma_resource_module_init,
+	  .exit = i915_vma_resource_module_exit },
 	{ .init = i915_mock_selftests },
 	{ .init = i915_pmu_init,
 	  .exit = i915_pmu_exit },
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7ad7e5251df6..aac0d78d25dd 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -286,9 +286,10 @@ struct i915_vma_work {
 	struct dma_fence_work base;
 	struct i915_address_space *vm;
 	struct i915_vm_pt_stash stash;
-	struct i915_vma *vma;
+	struct i915_vma_resource *vma_res;
 	struct drm_i915_gem_object *pinned;
 	struct i915_sw_dma_fence_cb cb;
+	struct i915_refct_sgt *rsgt;
 	enum i915_cache_level cache_level;
 	unsigned int flags;
 };
@@ -296,10 +297,11 @@ struct i915_vma_work {
 static void __vma_bind(struct dma_fence_work *work)
 {
 	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
-	struct i915_vma *vma = vw->vma;
+	struct i915_vma_resource *vma_res = vw->vma_res;
+
+	vma_res->ops->bind_vma(vma_res->vm, &vw->stash,
+			       vma_res, vw->cache_level, vw->flags);
 
-	vma->ops->bind_vma(vw->vm, &vw->stash,
-			   vma->resource, vw->cache_level, vw->flags);
 }
 
 static void __vma_release(struct dma_fence_work *work)
@@ -313,6 +315,10 @@ static void __vma_release(struct dma_fence_work *work)
 
 	i915_vm_free_pt_stash(vw->vm, &vw->stash);
 	i915_vm_put(vw->vm);
+	if (vw->vma_res)
+		i915_vma_resource_put(vw->vma_res);
+	if (vw->rsgt)
+		i915_refct_sgt_put(vw->rsgt);
 }
 
 static const struct dma_fence_work_ops bind_ops = {
@@ -386,13 +392,11 @@ i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
 {
 	struct drm_i915_gem_object *obj = vma->obj;
 
-	i915_vma_resource_init(vma_res, vma->pages, &vma->page_sizes,
+	i915_vma_resource_init(vma_res, vma->vm, vma->pages, &vma->page_sizes,
 			       i915_gem_object_is_readonly(obj),
 			       i915_gem_object_is_lmem(obj),
-			       vma->private,
-			       vma->node.start,
-			       vma->node.size,
-			       vma->size);
+			       vma->ops, vma->private, vma->node.start,
+			       vma->node.size, vma->size);
 }
 
 /**
@@ -416,6 +420,7 @@ int i915_vma_bind(struct i915_vma *vma,
 {
 	u32 bind_flags;
 	u32 vma_flags;
+	int ret;
 
 	lockdep_assert_held(&vma->vm->mutex);
 	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
@@ -424,12 +429,12 @@ int i915_vma_bind(struct i915_vma *vma,
 	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
 					      vma->node.size,
 					      vma->vm->total))) {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 		return -ENODEV;
 	}
 
 	if (GEM_DEBUG_WARN_ON(!flags)) {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 		return -EINVAL;
 	}
 
@@ -441,12 +446,30 @@ int i915_vma_bind(struct i915_vma *vma,
 
 	bind_flags &= ~vma_flags;
 	if (bind_flags == 0) {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 		return 0;
 	}
 
 	GEM_BUG_ON(!vma->pages);
 
+	/* Wait for or await async unbinds touching our range */
+	if (work && bind_flags & vma->vm->bind_async_flags)
+		ret = i915_vma_resource_bind_dep_await(vma->vm,
+						       &work->base.chain,
+						       vma->node.start,
+						       vma->node.size,
+						       true,
+						       GFP_NOWAIT |
+						       __GFP_RETRY_MAYFAIL |
+						       __GFP_NOWARN);
+	else
+		ret = i915_vma_resource_bind_dep_sync(vma->vm, vma->node.start,
+						      vma->node.size, true);
+	if (ret) {
+		i915_vma_resource_free(vma_res);
+		return ret;
+	}
+
 	if (vma->resource || !vma_res) {
 		/* Rebinding with an additional I915_VMA_*_BIND */
 		GEM_WARN_ON(!vma_flags);
@@ -459,9 +482,11 @@ int i915_vma_bind(struct i915_vma *vma,
 	if (work && bind_flags & vma->vm->bind_async_flags) {
 		struct dma_fence *prev;
 
-		work->vma = vma;
+		work->vma_res = i915_vma_resource_get(vma->resource);
 		work->cache_level = cache_level;
 		work->flags = bind_flags;
+		if (vma->obj->mm.rsgt)
+			work->rsgt = i915_refct_sgt_get(vma->obj->mm.rsgt);
 
 		/*
 		 * Note we only want to chain up to the migration fence on
@@ -489,8 +514,12 @@ int i915_vma_bind(struct i915_vma *vma,
 			int ret;
 
 			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
-			if (ret)
+			if (ret) {
+				i915_vma_resource_free(vma->resource);
+				vma->resource = NULL;
+
 				return ret;
+			}
 		}
 		vma->ops->bind_vma(vma->vm, NULL, vma->resource, cache_level,
 				   bind_flags);
@@ -1361,7 +1390,7 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 	return 0;
 }
 
-void __i915_vma_evict(struct i915_vma *vma)
+struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
 {
 	struct dma_fence *unbind_fence;
 
@@ -1395,27 +1424,36 @@ void __i915_vma_evict(struct i915_vma *vma)
 	GEM_BUG_ON(vma->fence);
 	GEM_BUG_ON(i915_vma_has_userfault(vma));
 
-	if (likely(atomic_read(&vma->vm->open))) {
-		trace_i915_vma_unbind(vma);
-		vma->ops->unbind_vma(vma->vm, vma->resource);
-	}
-	atomic_and(~(I915_VMA_BIND_MASK | I915_VMA_ERROR | I915_VMA_GGTT_WRITE),
-		   &vma->flags);
+	/* Object backend must be async capable. */
+	GEM_WARN_ON(async && !vma->obj->mm.rsgt);
 
+	trace_i915_vma_unbind(vma);
 	unbind_fence = i915_vma_resource_unbind(vma->resource);
 	i915_vma_resource_put(vma->resource);
 	vma->resource = NULL;
 
+	atomic_and(~(I915_VMA_BIND_MASK | I915_VMA_ERROR | I915_VMA_GGTT_WRITE),
+		   &vma->flags);
+
+	/* Object backend must be async capable. */
+	GEM_WARN_ON(async && !vma->obj->mm.rsgt);
+
 	i915_vma_detach(vma);
-	vma_unbind_pages(vma);
+
+	if (!async && unbind_fence) {
+		dma_fence_wait(unbind_fence, false);
+		dma_fence_put(unbind_fence);
+		unbind_fence = NULL;
+	}
 
 	/*
-	 * This uninterruptible wait under the vm mutex is currently
-	 * only ever blocking while the vma is being captured from.
-	 * With async unbinding, this wait here will be removed.
+	 * Binding itself may not have completed until the unbind fence signals,
+	 * so don't drop the pages until that happens, unless the resource is
+	 * async_capable.
 	 */
-	dma_fence_wait(unbind_fence, false);
-	dma_fence_put(unbind_fence);
+
+	vma_unbind_pages(vma);
+	return unbind_fence;
 }
 
 int __i915_vma_unbind(struct i915_vma *vma)
@@ -1442,12 +1480,51 @@ int __i915_vma_unbind(struct i915_vma *vma)
 		return ret;
 
 	GEM_BUG_ON(i915_vma_is_active(vma));
-	__i915_vma_evict(vma);
+	__i915_vma_evict(vma, false);
 
 	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
 	return 0;
 }
 
+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
+{
+	struct dma_fence *fence;
+
+	lockdep_assert_held(&vma->vm->mutex);
+
+	if (!drm_mm_node_allocated(&vma->node))
+		return NULL;
+
+	if (i915_vma_is_pinned(vma)) {
+		vma_print_allocator(vma, "is pinned");
+		return ERR_PTR(-EAGAIN);
+	}
+
+	/*
+	 * We probably need to replace this with awaiting the fences of the
+	 * object's dma_resv when the vma active goes away. When doing that
+	 * we need to be careful to not add the vma_resource unbind fence
+	 * immediately to the object's dma_resv, because then unbinding
+	 * the next vma from the object, in case there are many, will
+	 * actually await the unbinding of the previous vmas, which is
+	 * undesirable.
+	 */
+	if (i915_sw_fence_await_active(&vma->resource->chain, &vma->active,
+				       I915_ACTIVE_AWAIT_EXCL |
+				       I915_ACTIVE_AWAIT_ACTIVE) < 0) {
+		int ret = i915_vma_sync(vma);
+
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	fence = __i915_vma_evict(vma, true);
+
+	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
+
+	return fence;
+}
+
 int i915_vma_unbind(struct i915_vma *vma)
 {
 	struct i915_address_space *vm = vma->vm;
@@ -1484,6 +1561,53 @@ int i915_vma_unbind(struct i915_vma *vma)
 	return err;
 }
 
+int i915_vma_unbind_async(struct i915_vma *vma)
+{
+	struct drm_i915_gem_object *obj = vma->obj;
+	struct i915_address_space *vm = vma->vm;
+	struct dma_fence *fence;
+	int err;
+
+	/*
+	 * We need the dma-resv lock since we add the
+	 * unbind fence to the dma-resv object.
+	 */
+	assert_object_held(obj);
+
+	if (!drm_mm_node_allocated(&vma->node))
+		return 0;
+
+	if (i915_vma_is_pinned(vma)) {
+		vma_print_allocator(vma, "is pinned");
+		return -EAGAIN;
+	}
+
+	if (!obj->mm.rsgt)
+		return i915_vma_unbind(vma);
+
+	if (i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
+		/* Might require pm. Not handled yet.*/
+		return i915_vma_unbind(vma);
+
+	err = dma_resv_reserve_shared(obj->base.resv, 1);
+	if (err)
+		return i915_vma_unbind(vma);
+
+	err = mutex_lock_interruptible(&vma->vm->mutex);
+	if (err)
+		return err;
+
+	fence = __i915_vma_unbind_async(vma);
+	mutex_unlock(&vm->mutex);
+	if (IS_ERR_OR_NULL(fence))
+		return PTR_ERR_OR_ZERO(fence);
+
+	dma_resv_add_shared_fence(obj->base.resv, fence);
+	dma_fence_put(fence);
+
+	return 0;
+}
+
 struct i915_vma *i915_vma_make_unshrinkable(struct i915_vma *vma)
 {
 	i915_gem_object_make_unshrinkable(vma->obj);
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index e634fb1d22bf..2b823d1943a1 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -215,9 +215,10 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
 			u64 size, u64 alignment, u64 flags);
 void __i915_vma_set_map_and_fenceable(struct i915_vma *vma);
 void i915_vma_revoke_mmap(struct i915_vma *vma);
-void __i915_vma_evict(struct i915_vma *vma);
+struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async);
 int __i915_vma_unbind(struct i915_vma *vma);
 int __must_check i915_vma_unbind(struct i915_vma *vma);
+int __must_check i915_vma_unbind_async(struct i915_vma *vma);
 void i915_vma_unlink_ctx(struct i915_vma *vma);
 void i915_vma_close(struct i915_vma *vma);
 void i915_vma_reopen(struct i915_vma *vma);
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index c86db89ab5d2..0cee831fa83e 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -2,39 +2,43 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
+
+#include <linux/interval_tree_generic.h>
 #include <linux/slab.h>
 
+#include "i915_sw_fence.h"
 #include "i915_vma_resource.h"
 
-/* Callbacks for the unbind dma-fence. */
-static const char *get_driver_name(struct dma_fence *fence)
-{
-	return "vma unbind fence";
-}
+#include "gt/intel_gtt.h"
 
-static const char *get_timeline_name(struct dma_fence *fence)
-{
-	return "unbound";
-}
-
-static struct dma_fence_ops unbind_fence_ops = {
-	.get_driver_name = get_driver_name,
-	.get_timeline_name = get_timeline_name,
-};
+static struct kmem_cache *slab_vma_resources;
 
 /**
- * __i915_vma_resource_init - Initialize a vma resource.
- * @vma_res: The vma resource to initialize
+ * DOC:
+ * We use a per-vm interval tree to keep track of vma_resources
+ * scheduled for unbind but not yet unbound. The tree is protected by
+ * the vm mutex, and nodes are removed just after the unbind fence signals.
+ * The removal takes the vm mutex from a kernel thread which we need to
+ * keep in mind so that we don't grab the mutex and try to wait for all
+ * pending unbinds to complete, because that will temporaryily block many
+ * of the workqueue threads, and people will get angry.
  *
- * Initializes the private members of a vma resource.
+ * We should consider using a single ordered fence per VM instead but that
+ * requires ordering the unbinds and might introduce unnecessary waiting
+ * for unrelated unbinds. Amount of code will probably be roughly the same
+ * due to the simplicity of using the interval tree interface.
+ *
+ * Another drawback of this interval tree is that the complexity of insertion
+ * and removal of fences increases as O(ln(pending_unbinds)) instead of
+ * O(1) for a single fence without interval tree.
  */
-void __i915_vma_resource_init(struct i915_vma_resource *vma_res)
-{
-	spin_lock_init(&vma_res->lock);
-	dma_fence_init(&vma_res->unbind_fence, &unbind_fence_ops,
-		       &vma_res->lock, 0, 0);
-	refcount_set(&vma_res->hold_count, 1);
-}
+#define VMA_RES_START(_node) ((_node)->start)
+#define VMA_RES_LAST(_node) ((_node)->start + (_node)->node_size - 1)
+INTERVAL_TREE_DEFINE(struct i915_vma_resource, rb,
+		     unsigned long, __subtree_last,
+		     VMA_RES_START, VMA_RES_LAST, static, vma_res_itree);
+
+/* Callbacks for the unbind dma-fence. */
 
 /**
  * i915_vma_resource_alloc - Allocate a vma resource
@@ -45,15 +49,60 @@ void __i915_vma_resource_init(struct i915_vma_resource *vma_res)
 struct i915_vma_resource *i915_vma_resource_alloc(void)
 {
 	struct i915_vma_resource *vma_res =
-		kzalloc(sizeof(*vma_res), GFP_KERNEL);
+		kmem_cache_zalloc(slab_vma_resources, GFP_KERNEL);
 
 	return vma_res ? vma_res : ERR_PTR(-ENOMEM);
 }
 
+/**
+ * i915_vma_resource_free - Free a vma resource
+ * @vma_res: The vma resource to free.
+ */
+void i915_vma_resource_free(struct i915_vma_resource *vma_res)
+{
+	kmem_cache_free(slab_vma_resources, vma_res);
+}
+
+static const char *get_driver_name(struct dma_fence *fence)
+{
+	return "vma unbind fence";
+}
+
+static const char *get_timeline_name(struct dma_fence *fence)
+{
+	return "unbound";
+}
+
+static void unbind_fence_free_rcu(struct rcu_head *head)
+{
+	struct i915_vma_resource *vma_res =
+		container_of(head, typeof(*vma_res), unbind_fence.rcu);
+
+	i915_vma_resource_free(vma_res);
+}
+
+static void unbind_fence_release(struct dma_fence *fence)
+{
+	struct i915_vma_resource *vma_res =
+		container_of(fence, typeof(*vma_res), unbind_fence);
+
+	i915_sw_fence_fini(&vma_res->chain);
+
+	call_rcu(&fence->rcu, unbind_fence_free_rcu);
+}
+
+static struct dma_fence_ops unbind_fence_ops = {
+	.get_driver_name = get_driver_name,
+	.get_timeline_name = get_timeline_name,
+	.release = unbind_fence_release,
+};
+
 static void __i915_vma_resource_unhold(struct i915_vma_resource *vma_res)
 {
-	if (refcount_dec_and_test(&vma_res->hold_count))
-		dma_fence_signal(&vma_res->unbind_fence);
+	if (!refcount_dec_and_test(&vma_res->hold_count))
+		return;
+
+	dma_fence_signal(&vma_res->unbind_fence);
 }
 
 /**
@@ -102,6 +151,53 @@ bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
 	return held;
 }
 
+static void i915_vma_resource_unbind_work(struct work_struct *work)
+{
+	struct i915_vma_resource *vma_res =
+		container_of(work, typeof(*vma_res), work);
+	struct i915_address_space *vm = vma_res->vm;
+
+	if (likely(atomic_read(&vm->open)))
+		vma_res->ops->unbind_vma(vm, vma_res);
+
+	vma_res->vm = NULL;
+	if (!RB_EMPTY_NODE(&vma_res->rb)) {
+		mutex_lock(&vm->mutex);
+		vma_res_itree_remove(vma_res, &vm->pending_unbind);
+		mutex_unlock(&vm->mutex);
+	}
+
+	__i915_vma_resource_unhold(vma_res);
+	i915_vma_resource_put(vma_res);
+}
+
+static int
+i915_vma_resource_fence_notify(struct i915_sw_fence *fence,
+			       enum i915_sw_fence_notify state)
+{
+	struct i915_vma_resource *vma_res =
+		container_of(fence, typeof(*vma_res), chain);
+	struct dma_fence *unbind_fence =
+		&vma_res->unbind_fence;
+
+	switch (state) {
+	case FENCE_COMPLETE:
+		dma_fence_get(unbind_fence);
+		if (vma_res->immediate_unbind) {
+			i915_vma_resource_unbind_work(&vma_res->work);
+		} else {
+			INIT_WORK(&vma_res->work, i915_vma_resource_unbind_work);
+			queue_work(system_unbound_wq, &vma_res->work);
+		}
+		break;
+	case FENCE_FREE:
+		i915_vma_resource_put(vma_res);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 /**
  * i915_vma_resource_unbind - Unbind a vma resource
  * @vma_res: The vma resource to unbind.
@@ -112,10 +208,177 @@ bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
  * Return: A refcounted pointer to a dma-fence that signals when unbinding is
  * complete.
  */
-struct dma_fence *
-i915_vma_resource_unbind(struct i915_vma_resource *vma_res)
+struct dma_fence *i915_vma_resource_unbind(struct i915_vma_resource *vma_res)
 {
-	__i915_vma_resource_unhold(vma_res);
-	dma_fence_get(&vma_res->unbind_fence);
+	/* Reference for the returned fence. */
+	i915_vma_resource_get(vma_res);
+	/* Reference for the sw fence */
+	i915_vma_resource_get(vma_res);
+
+	if (atomic_read(&vma_res->chain.pending) <= 1) {
+		RB_CLEAR_NODE(&vma_res->rb);
+		vma_res->immediate_unbind = 1;
+	} else {
+		vma_res_itree_insert(vma_res, &vma_res->vm->pending_unbind);
+	}
+
+	i915_sw_fence_commit(&vma_res->chain);
+
 	return &vma_res->unbind_fence;
 }
+
+/**
+ * __i915_vma_resource_init - Initialize a vma resource.
+ * @vma_res: The vma resource to initialize
+ *
+ * Initializes the private members of a vma resource.
+ */
+void __i915_vma_resource_init(struct i915_vma_resource *vma_res)
+{
+	spin_lock_init(&vma_res->lock);
+	dma_fence_init(&vma_res->unbind_fence, &unbind_fence_ops,
+		       &vma_res->lock, 0, 0);
+	refcount_set(&vma_res->hold_count, 1);
+	i915_sw_fence_init(&vma_res->chain, i915_vma_resource_fence_notify);
+}
+
+/**
+ * i915_vma_resource_bind_dep_sync - Wait for / sync all unbinds touching a
+ * certain vm range.
+ * @vm: The vm to look at.
+ * @offset: The range start.
+ * @size: The range size.
+ * @intr: Whether to wait interrubtible.
+ *
+ * The function needs to be called with the vm lock held.
+ *
+ * Return: Zero on success, -ERESTARTSYS if interrupted and @intr==true
+ */
+int i915_vma_resource_bind_dep_sync(struct i915_address_space *vm,
+				    unsigned long offset,
+				    unsigned long size,
+				    bool intr)
+{
+	struct i915_vma_resource *node;
+	unsigned long last = offset + size - 1;
+
+	lockdep_assert_held(&vm->mutex);
+	might_sleep();
+
+	node = vma_res_itree_iter_first(&vm->pending_unbind, offset, last);
+	while (node) {
+		int ret = dma_fence_wait(&node->unbind_fence, intr);
+
+		if (ret)
+			return ret;
+
+		node = vma_res_itree_iter_next(node, offset, last);
+	}
+
+	return 0;
+}
+
+/**
+ * i915_vma_resource_bind_dep_sync_all - Wait for / sync all unbinds of a vm,
+ * releasing the vm lock while waiting.
+ * @vm: The vm to look at.
+ *
+ * The function may not be called with the vm lock held.
+ * Typically this is called at vm destruction to finish any pending
+ * unbind operations. The vm mutex is released while waiting to avoid
+ * stalling kernel workqueues trying to grab the mutex.
+ */
+void i915_vma_resource_bind_dep_sync_all(struct i915_address_space *vm)
+{
+	struct i915_vma_resource *node;
+	struct dma_fence *fence;
+
+	do {
+		fence = NULL;
+		mutex_lock(&vm->mutex);
+		node = vma_res_itree_iter_first(&vm->pending_unbind, 0,
+						ULONG_MAX);
+		if (node)
+			fence = dma_fence_get_rcu(&node->unbind_fence);
+		mutex_unlock(&vm->mutex);
+
+		if (fence) {
+			/*
+			 * The wait makes sure the node eventually removes
+			 * itself from the tree.
+			 */
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		}
+	} while (node);
+}
+
+/**
+ * i915_vma_resource_bind_dep_await - Have a struct i915_sw_fence await all
+ * pending unbinds in a certain range of a vm.
+ * @vm: The vm to look at.
+ * @sw_fence: The struct i915_sw_fence that will be awaiting the unbinds.
+ * @offset: The range start.
+ * @size: The range size.
+ * @intr: Whether to wait interrubtible.
+ * @gfp: Allocation mode for memory allocations.
+ *
+ * The function makes @sw_fence await all pending unbinds in a certain
+ * vm range before calling the complete notifier. To be able to await
+ * each individual unbind, the function needs to allocate memory using
+ * the @gpf allocation mode. If that fails, the function will instead
+ * wait for the unbind fence to signal, using @intr to judge whether to
+ * wait interruptible or not. Note that @gfp should ideally be selected so
+ * as to avoid any expensive memory allocation stalls and rather fail and
+ * synchronize itself. For now the vm mutex is required when calling this
+ * function with means that @gfp can't call into direct reclaim. In reality
+ * this means that during heavy memory pressure, we will sync in this
+ * function.
+ *
+ * Return: Zero on success, -ERESTARTSYS if interrupted and @intr==true
+ */
+int i915_vma_resource_bind_dep_await(struct i915_address_space *vm,
+				     struct i915_sw_fence *sw_fence,
+				     unsigned long offset,
+				     unsigned long size,
+				     bool intr,
+				     gfp_t gfp)
+{
+	struct i915_vma_resource *node;
+	unsigned long last = offset + size - 1;
+
+	lockdep_assert_held(&vm->mutex);
+	might_alloc(gfp);
+	might_sleep();
+
+	node = vma_res_itree_iter_first(&vm->pending_unbind, offset, last);
+	while (node) {
+		int ret;
+
+		ret = i915_sw_fence_await_dma_fence(sw_fence,
+						    &node->unbind_fence,
+						    MAX_SCHEDULE_TIMEOUT, gfp);
+		if (ret)
+			ret = dma_fence_wait(&node->unbind_fence, intr);
+		if (ret)
+			return ret;
+
+		node = vma_res_itree_iter_next(node, offset, last);
+	}
+
+	return 0;
+}
+
+void i915_vma_resource_module_exit(void)
+{
+	kmem_cache_destroy(slab_vma_resources);
+}
+
+int __init i915_vma_resource_module_init(void)
+{
+	slab_vma_resources = KMEM_CACHE(i915_vma_resource, SLAB_HWCACHE_ALIGN);
+	if (!slab_vma_resources)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
index 9872de58268b..26914558bf6f 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.h
+++ b/drivers/gpu/drm/i915/i915_vma_resource.h
@@ -10,6 +10,7 @@
 #include <linux/refcount.h>
 
 #include "i915_gem.h"
+#include "i915_sw_fence.h"
 
 struct i915_page_sizes {
 	/**
@@ -39,6 +40,13 @@ struct i915_page_sizes {
  * @hold_count: Number of holders blocking the fence from finishing.
  * The vma itself is keeping a hold, which is released when unbind
  * is scheduled.
+ * @work: Work struct for deferred unbind work.
+ * @chain: Pointer to struct i915_sw_fence used to await dependencies.
+ * @rb: Rb node for the vm's pending unbind interval tree.
+ * @__subtree_last: Interval tree private member.
+ * @vm: non-refcounted pointer to the vm. This is for internal use only and
+ * this member is cleared after vm_resource unbind.
+ * @ops: Pointer to the backend i915_vma_ops.
  * @private: Bind backend private info.
  * @start: Offset into the address space of bind range start.
  * @node_size: Size of the allocated range manager node.
@@ -46,6 +54,8 @@ struct i915_page_sizes {
  * @page_sizes_gtt: Resulting page sizes from the bind operation.
  * @bound_flags: Flags indicating binding status.
  * @allocated: Backend private data. TODO: Should move into @private.
+ * @immediate_unbind: Unbind can be done immediately and don't need to be
+ * deferred to a work item awaiting unsignaled fences.
  *
  * The lifetime of a struct i915_vma_resource is from a binding request to
  * the actual possible asynchronous unbind has completed.
@@ -55,6 +65,11 @@ struct i915_vma_resource {
 	/* See above for description of the lock. */
 	spinlock_t lock;
 	refcount_t hold_count;
+	struct work_struct work;
+	struct i915_sw_fence chain;
+	struct rb_node rb;
+	unsigned long __subtree_last;
+	struct i915_address_space *vm;
 
 	/**
 	 * struct i915_vma_bindinfo - Information needed for async bind
@@ -74,13 +89,16 @@ struct i915_vma_resource {
 		bool lmem:1;
 	} bi;
 
+	const struct i915_vma_ops *ops;
 	void *private;
 	unsigned long start;
 	unsigned long node_size;
 	unsigned long vma_size;
 	u32 page_sizes_gtt;
+
 	u32 bound_flags;
 	bool allocated:1;
+	bool immediate_unbind:1;
 };
 
 bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
@@ -91,6 +109,8 @@ void i915_vma_resource_unhold(struct i915_vma_resource *vma_res,
 
 struct i915_vma_resource *i915_vma_resource_alloc(void);
 
+void i915_vma_resource_free(struct i915_vma_resource *vma_res);
+
 struct dma_fence *i915_vma_resource_unbind(struct i915_vma_resource *vma_res);
 
 void __i915_vma_resource_init(struct i915_vma_resource *vma_res);
@@ -120,10 +140,12 @@ static inline void i915_vma_resource_put(struct i915_vma_resource *vma_res)
 /**
  * i915_vma_resource_init - Initialize a vma resource.
  * @vma_res: The vma resource to initialize
+ * @vm: Pointer to the vm.
  * @pages: The pages sg-table.
  * @page_sizes: Page sizes of the pages.
  * @readonly: Whether the vma should be bound read-only.
  * @lmem: Whether the vma points to lmem.
+ * @ops: The backend ops.
  * @private: Bind backend private info.
  * @start: Offset into the address space of bind range start.
  * @node_size: Size of the allocated range manager node.
@@ -135,20 +157,24 @@ static inline void i915_vma_resource_put(struct i915_vma_resource *vma_res)
  * allocation is not allowed.
  */
 static inline void i915_vma_resource_init(struct i915_vma_resource *vma_res,
+					  struct i915_address_space *vm,
 					  struct sg_table *pages,
 					  const struct i915_page_sizes *page_sizes,
 					  bool readonly,
 					  bool lmem,
+					  const struct i915_vma_ops *ops,
 					  void *private,
 					  unsigned long start,
 					  unsigned long node_size,
 					  unsigned long size)
 {
 	__i915_vma_resource_init(vma_res);
+	vma_res->vm = vm;
 	vma_res->bi.pages = pages;
 	vma_res->bi.page_sizes = *page_sizes;
 	vma_res->bi.readonly = readonly;
 	vma_res->bi.lmem = lmem;
+	vma_res->ops = ops;
 	vma_res->private = private;
 	vma_res->start = start;
 	vma_res->node_size = node_size;
@@ -158,6 +184,25 @@ static inline void i915_vma_resource_init(struct i915_vma_resource *vma_res,
 static inline void i915_vma_resource_fini(struct i915_vma_resource *vma_res)
 {
 	GEM_BUG_ON(refcount_read(&vma_res->hold_count) != 1);
+	i915_sw_fence_fini(&vma_res->chain);
 }
 
+int i915_vma_resource_bind_dep_sync(struct i915_address_space *vm,
+				    unsigned long first,
+				    unsigned long last,
+				    bool intr);
+
+int i915_vma_resource_bind_dep_await(struct i915_address_space *vm,
+				     struct i915_sw_fence *sw_fence,
+				     unsigned long first,
+				     unsigned long last,
+				     bool intr,
+				     gfp_t gfp);
+
+void i915_vma_resource_bind_dep_sync_all(struct i915_address_space *vm);
+
+void i915_vma_resource_module_exit(void);
+
+int i915_vma_resource_module_init(void);
+
 #endif
-- 
2.31.1

