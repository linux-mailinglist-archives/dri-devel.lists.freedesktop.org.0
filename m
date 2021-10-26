Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1543ACA6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 09:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82F6E434;
	Tue, 26 Oct 2021 07:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706896E3F9;
 Tue, 26 Oct 2021 07:08:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="253373705"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="253373705"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 00:08:00 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="572263793"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 00:07:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>
Subject: [PATCH 3/3] drm/i915: Initial introduction of vma resources
Date: Tue, 26 Oct 2021 09:07:44 +0200
Message-Id: <20211026070744.337554-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026070744.337554-1-thomas.hellstrom@linux.intel.com>
References: <20211026070744.337554-1-thomas.hellstrom@linux.intel.com>
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

From: Thomas Hellström <thomas.hellstrom@intel.com>

The vma resource are needed for asynchronous bind management and are
similar to TTM resources. They contain the data needed for
asynchronous unbinding (typically the vm range, any backend
private information and a means to do refcounting and to hold
the unbinding for error capture).

When a vma is bound, a vma resource is created and attached to the
vma, and on async unbinding it is detached from the vma, and instead
the vm records the fence marking unbind complete. This fence needs to
be waited on before we can bind the same region again, so either
the fence can be recorded for this particular range only, using an
interval tree, or as a simpler approach, for the whole vm. The latter
means no binding can take place on a vm until all detached vma
resources scheduled for unbind are signaled. With an interval tree
fence recording, the interval tree needs to be searched for fences
to be signaled before binding can take place.

But most of that is for later, this patch only introduces stub vma
resources without unbind capability and the fences of which are waited
for sync during unbinding. At this point we're interested in the hold
capability as a POC for error capture. Note that the current sync waiting
at unbind time is done uninterruptible, but that's OK since we're
only ever waiting during error capture, and in that case there's very
little gpu activity (if any) that can stall.

Signed-off-by: Thomas Hellström <thomas.hellstrom@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   8 +-
 drivers/gpu/drm/i915/i915_vma.c               | 192 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  15 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.c      |  14 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.h      |   2 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 6 files changed, 217 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9338cdb0ed56..3b7d5de14b23 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1374,9 +1374,15 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		 */
 		if (reloc->write_domain == I915_GEM_DOMAIN_INSTRUCTION &&
 		    GRAPHICS_VER(eb->i915) == 6) {
+			struct i915_vma_resource *vma_res =
+				i915_vma_resource_alloc();
+
+			if (IS_ERR(vma_res))
+				return PTR_ERR(vma_res);
+
 			err = i915_vma_bind(target->vma,
 					    target->vma->obj->cache_level,
-					    PIN_GLOBAL, NULL);
+					    PIN_GLOBAL, NULL, vma_res);
 			if (err)
 				return err;
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 90546fa58fc1..2b331c5f0a5f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -38,8 +38,35 @@
 #include "i915_trace.h"
 #include "i915_vma.h"
 
+/**
+ * struct i915_vma_resource - Snapshotted unbind information.
+ * @unbind_fence: Fence to mark unbinding complete. Note that this fence
+ * is not considered published until unbind is scheduled, and as such it
+ * is illegal to access this fence before scheduled unbind other than
+ * for refcounting.
+ * @lock: The @unbind_fence lock. We're also using it to protect the weak
+ * pointer to the struct i915_vma, @vma during lookup and takedown.
+ * @vma: Weak back-pointer to the parent vma struct. This pointer is
+ * protected by @lock, and a reference on @vma needs to be taken
+ * using kref_get_unless_zero.
+ * @hold_count: Number of holders blocking the fence from finishing.
+ * The vma itself is keeping a hold, which is released when unbind
+ * is scheduled.
+ */
+struct i915_vma_resource {
+	struct dma_fence unbind_fence;
+	/* See above for description of the lock. */
+	spinlock_t lock;
+	struct i915_vma *vma;
+	refcount_t hold_count;
+};
+
 static struct kmem_cache *slab_vmas;
 
+static void i915_vma_resource_init(struct i915_vma_resource *vma_res,
+				   struct i915_vma *vma);
+static struct dma_fence *i915_vma_resource_unbind(struct i915_vma_resource *vma_res);
+
 struct i915_vma *i915_vma_alloc(void)
 {
 	return kmem_cache_zalloc(slab_vmas, GFP_KERNEL);
@@ -363,6 +390,8 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
  * @cache_level: mapping cache level
  * @flags: flags like global or local mapping
  * @work: preallocated worker for allocating and binding the PTE
+ * @vma_res: pointer to a preallocated vma resource. The resource is either
+ * consumed or freed.
  *
  * DMA addresses are taken from the scatter-gather table of this object (or of
  * this VMA in case of non-default GGTT views) and PTE entries set up.
@@ -371,7 +400,8 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
 int i915_vma_bind(struct i915_vma *vma,
 		  enum i915_cache_level cache_level,
 		  u32 flags,
-		  struct i915_vma_work *work)
+		  struct i915_vma_work *work,
+		  struct i915_vma_resource *vma_res)
 {
 	u32 bind_flags;
 	u32 vma_flags;
@@ -381,11 +411,15 @@ int i915_vma_bind(struct i915_vma *vma,
 
 	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
 					      vma->node.size,
-					      vma->vm->total)))
+					      vma->vm->total))) {
+		kfree(vma_res);
 		return -ENODEV;
+	}
 
-	if (GEM_DEBUG_WARN_ON(!flags))
+	if (GEM_DEBUG_WARN_ON(!flags)) {
+		kfree(vma_res);
 		return -EINVAL;
+	}
 
 	bind_flags = flags;
 	bind_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
@@ -394,11 +428,15 @@ int i915_vma_bind(struct i915_vma *vma,
 	vma_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
 
 	bind_flags &= ~vma_flags;
-	if (bind_flags == 0)
+	if (bind_flags == 0) {
+		kfree(vma_res);
 		return 0;
+	}
 
 	GEM_BUG_ON(!vma->pages);
 
+	i915_vma_resource_init(vma_res, vma);
+	vma->resource = vma_res;
 	trace_i915_vma_bind(vma, bind_flags);
 	if (work && bind_flags & vma->vm->bind_async_flags) {
 		struct dma_fence *prev;
@@ -870,6 +908,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		    u64 size, u64 alignment, u64 flags)
 {
 	struct i915_vma_work *work = NULL;
+	struct i915_vma_resource *vma_res;
 	intel_wakeref_t wakeref = 0;
 	unsigned int bound;
 	int err;
@@ -923,6 +962,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		}
 	}
 
+	vma_res = i915_vma_resource_alloc();
+	if (IS_ERR(vma_res)) {
+		err = PTR_ERR(vma_res);
+		goto err_fence;
+	}
+
 	/*
 	 * Differentiate between user/kernel vma inside the aliasing-ppgtt.
 	 *
@@ -984,7 +1029,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!vma->pages);
 	err = i915_vma_bind(vma,
 			    vma->obj ? vma->obj->cache_level : 0,
-			    flags, work);
+			    flags, work, vma_res);
 	if (err)
 		goto err_remove;
 
@@ -1014,6 +1059,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (wakeref)
 		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
 	vma_put_pages(vma);
+
 	return err;
 }
 
@@ -1331,6 +1377,7 @@ void __i915_vma_evict(struct i915_vma *vma)
 
 int __i915_vma_unbind(struct i915_vma *vma)
 {
+	struct dma_fence *unbind_fence;
 	int ret;
 
 	lockdep_assert_held(&vma->vm->mutex);
@@ -1356,6 +1403,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
 	__i915_vma_evict(vma);
 
 	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
+	unbind_fence = i915_vma_resource_unbind(vma->resource);
+
+	/*
+	 * This uninterruptible wait under the vm mutex is currently
+	 * only ever blocking while the vma is being captured from.
+	 * With async unbinding, this wait here will be removed.
+	 */
+	dma_fence_wait(unbind_fence, false);
+	dma_fence_put(unbind_fence);
+
 	return 0;
 }
 
@@ -1388,7 +1445,6 @@ int i915_vma_unbind(struct i915_vma *vma)
 
 	err = __i915_vma_unbind(vma);
 	mutex_unlock(&vm->mutex);
-
 out_rpm:
 	if (wakeref)
 		intel_runtime_pm_put(&vm->i915->runtime_pm, wakeref);
@@ -1411,6 +1467,130 @@ void i915_vma_make_purgeable(struct i915_vma *vma)
 	i915_gem_object_make_purgeable(vma->obj);
 }
 
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
+static struct dma_fence_ops unbind_fence_ops = {
+	.get_driver_name = get_driver_name,
+	.get_timeline_name = get_timeline_name,
+};
+
+struct i915_vma_resource *i915_vma_resource_alloc(void)
+{
+	struct i915_vma_resource *vma_res =
+		kzalloc(sizeof(*vma_res), GFP_KERNEL);
+
+	return vma_res ? vma_res : ERR_PTR(-ENOMEM);
+}
+
+static void i915_vma_resource_init(struct i915_vma_resource *vma_res,
+				   struct i915_vma *vma)
+{
+	vma_res->vma = vma;
+	spin_lock_init(&vma_res->lock);
+	dma_fence_init(&vma_res->unbind_fence, &unbind_fence_ops,
+		       &vma_res->lock, 0, 0);
+	refcount_set(&vma_res->hold_count, 1);
+}
+
+static void __i915_vma_resource_unhold(struct i915_vma_resource *vma_res)
+{
+	if (refcount_dec_and_test(&vma_res->hold_count))
+		dma_fence_signal(&vma_res->unbind_fence);
+}
+
+/**
+ * i915_vma_resource_hold - Unhold the signaling of the vma resource unbind
+ * fence.
+ * @vma_res: The vma resource.
+ * @lockdep_cookie: The lockdep cookie returned from i915_vma_resource_hold.
+ *
+ * The function may leave a dma_fence critical section.
+ */
+void i915_vma_resource_unhold(struct i915_vma_resource *vma_res,
+			      bool lockdep_cookie)
+{
+	dma_fence_end_signalling(lockdep_cookie);
+
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		unsigned long irq_flags;
+
+		/* Inefficient open-coded might_lock_irqsave() */
+		spin_lock_irqsave(&vma_res->lock, irq_flags);
+		spin_unlock_irqrestore(&vma_res->lock, irq_flags);
+	}
+
+	__i915_vma_resource_unhold(vma_res);
+}
+
+/**
+ * i915_vma_resource_hold - Hold the signaling of the vma resource unbind fence.
+ * @vma_res: The vma resource.
+ * @lockdep_cookie: Pointer to a bool serving as a lockdep cooke that should
+ * be given as an argument to the pairing i915_vma_resource_unhold.
+ *
+ * If returning true, the function enters a dma_fence signalling critical
+ * section is not in one already.
+ *
+ * Return: true if holding successful, false if not.
+ */
+bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
+			    bool *lockdep_cookie)
+{
+	bool held = refcount_inc_not_zero(&vma_res->hold_count);
+
+	if (held)
+		*lockdep_cookie = dma_fence_begin_signalling();
+
+	return held;
+}
+
+/**
+ * i915_vma_get_current_resource - Return the vma's current vma resource
+ * @vma: The vma referencing the resource.
+ *
+ * Return: A refcounted pointer to the vma's current vma resource.
+ */
+struct i915_vma_resource *i915_vma_get_current_resource(struct i915_vma *vma)
+{
+	GEM_BUG_ON(!vma->resource);
+
+	dma_fence_get(&vma->resource->unbind_fence);
+	return vma->resource;
+}
+
+/**
+ * i915_vma_resource_put - Release a reference to a struct i915_vma_resource
+ * @vma_res: The resource
+ */
+void i915_vma_resource_put(struct i915_vma_resource *vma_res)
+{
+	dma_fence_put(&vma_res->unbind_fence);
+}
+
+static struct dma_fence *
+i915_vma_resource_unbind(struct i915_vma_resource *vma_res)
+{
+	/* Reference is transferred to the returned dma_fence pointer */
+	vma_res->vma->resource = NULL;
+
+	spin_lock(&vma_res->lock);
+	/* Kill the weak reference under the spinlock. */
+	vma_res->vma = NULL;
+	spin_unlock(&vma_res->lock);
+
+	/* With async unbind, schedule it here. */
+	__i915_vma_resource_unhold(vma_res);
+	return &vma_res->unbind_fence;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_vma.c"
 #endif
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 648dbe744c96..6235989ec425 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -206,7 +206,8 @@ struct i915_vma_work *i915_vma_work(void);
 int i915_vma_bind(struct i915_vma *vma,
 		  enum i915_cache_level cache_level,
 		  u32 flags,
-		  struct i915_vma_work *work);
+		  struct i915_vma_work *work,
+		  struct i915_vma_resource *vma_res);
 
 bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color);
 bool i915_vma_misplaced(const struct i915_vma *vma,
@@ -433,6 +434,18 @@ static inline int i915_vma_sync(struct i915_vma *vma)
 	return i915_active_wait(&vma->active);
 }
 
+bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
+			    bool *lockdep_cookie);
+
+void i915_vma_resource_unhold(struct i915_vma_resource *vma_res,
+			      bool lockdep_cookie);
+
+void i915_vma_resource_put(struct i915_vma_resource *vma_res);
+
+struct i915_vma_resource *i915_vma_get_current_resource(struct i915_vma *vma);
+
+struct i915_vma_resource *i915_vma_resource_alloc(void);
+
 void i915_vma_module_exit(void);
 int i915_vma_module_init(void);
 
diff --git a/drivers/gpu/drm/i915/i915_vma_snapshot.c b/drivers/gpu/drm/i915/i915_vma_snapshot.c
index 44985d600f96..b4ee8220df85 100644
--- a/drivers/gpu/drm/i915/i915_vma_snapshot.c
+++ b/drivers/gpu/drm/i915/i915_vma_snapshot.c
@@ -36,7 +36,7 @@ void i915_vma_snapshot_init(struct i915_vma_snapshot *vsnap,
 	if (vma->obj->mm.region)
 		vsnap->mr = intel_memory_region_get(vma->obj->mm.region);
 	kref_init(&vsnap->kref);
-	vsnap->vma_resource = &vma->active;
+	vsnap->vma_resource = i915_vma_get_current_resource(vma);
 	vsnap->onstack = false;
 	vsnap->present = true;
 }
@@ -63,6 +63,7 @@ static void vma_snapshot_release(struct kref *ref)
 		container_of(ref, typeof(*vsnap), kref);
 
 	vsnap->present = false;
+	i915_vma_resource_put(vsnap->vma_resource);
 	if (vsnap->mr)
 		intel_memory_region_put(vsnap->mr);
 	if (vsnap->pages_rsgt)
@@ -112,12 +113,7 @@ void i915_vma_snapshot_put_onstack(struct i915_vma_snapshot *vsnap)
 bool i915_vma_snapshot_resource_pin(struct i915_vma_snapshot *vsnap,
 				    bool *lockdep_cookie)
 {
-	bool pinned = i915_active_acquire_if_busy(vsnap->vma_resource);
-
-	if (pinned)
-		*lockdep_cookie = dma_fence_begin_signalling();
-
-	return pinned;
+	return i915_vma_resource_hold(vsnap->vma_resource, lockdep_cookie);
 }
 
 /**
@@ -131,7 +127,5 @@ bool i915_vma_snapshot_resource_pin(struct i915_vma_snapshot *vsnap,
 void i915_vma_snapshot_resource_unpin(struct i915_vma_snapshot *vsnap,
 				      bool lockdep_cookie)
 {
-	dma_fence_end_signalling(lockdep_cookie);
-
-	return i915_active_release(vsnap->vma_resource);
+	i915_vma_resource_unhold(vsnap->vma_resource, lockdep_cookie);
 }
diff --git a/drivers/gpu/drm/i915/i915_vma_snapshot.h b/drivers/gpu/drm/i915/i915_vma_snapshot.h
index 940581df4622..d083b6bf1b11 100644
--- a/drivers/gpu/drm/i915/i915_vma_snapshot.h
+++ b/drivers/gpu/drm/i915/i915_vma_snapshot.h
@@ -49,7 +49,7 @@ struct i915_vma_snapshot {
 	struct i915_refct_sgt *pages_rsgt;
 	struct intel_memory_region *mr;
 	struct kref kref;
-	struct i915_active *vma_resource;
+	struct i915_vma_resource *vma_resource;
 	u32 page_sizes;
 	bool onstack:1;
 	bool present:1;
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 80e93bf00f2e..14d20ac5350c 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -95,6 +95,8 @@ enum i915_cache_level;
  *
  */
 
+struct i915_vma_resource;
+
 struct intel_remapped_plane_info {
 	/* in gtt pages */
 	u32 offset;
@@ -284,6 +286,9 @@ struct i915_vma {
 	struct list_head evict_link;
 
 	struct list_head closed_link;
+
+	/** The async vma resource. Protected by the vm_mutex */
+	struct i915_vma_resource *resource;
 };
 
 #endif
-- 
2.31.1

