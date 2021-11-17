Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA0454884
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B43F6E500;
	Wed, 17 Nov 2021 14:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16496E4DD;
 Wed, 17 Nov 2021 14:20:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="232675097"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="232675097"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 06:20:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="593363789"
Received: from ianock-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.140])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 06:20:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/i915: vma is always backed by an object.
Date: Wed, 17 Nov 2021 14:20:22 +0000
Message-Id: <20211117142024.1043017-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117142024.1043017-1-matthew.auld@intel.com>
References: <20211117142024.1043017-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

vma->obj and vma->resv are now never NULL, and some checks can be removed.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 48 ++++++++-----------
 drivers/gpu/drm/i915/i915_vma.h               |  3 --
 4 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 4c296de1d67d..268c51f886b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -219,7 +219,7 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 	 */
 
 	err = i915_gem_object_lock(ce->timeline->hwsp_ggtt->obj, ww);
-	if (!err && ce->ring->vma->obj)
+	if (!err)
 		err = i915_gem_object_lock(ce->ring->vma->obj, ww);
 	if (!err && ce->state)
 		err = i915_gem_object_lock(ce->state->obj, ww);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 586dca1731ce..3e6fac0340ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -1357,7 +1357,7 @@ int intel_ring_submission_setup(struct intel_engine_cs *engine)
 	err = i915_gem_object_lock(timeline->hwsp_ggtt->obj, &ww);
 	if (!err && gen7_wa_vma)
 		err = i915_gem_object_lock(gen7_wa_vma->obj, &ww);
-	if (!err && engine->legacy.ring->vma->obj)
+	if (!err)
 		err = i915_gem_object_lock(engine->legacy.ring->vma->obj, &ww);
 	if (!err)
 		err = intel_timeline_pin(timeline, &ww);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 0896656896d0..502ae9c73b09 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -40,12 +40,12 @@
 
 static struct kmem_cache *slab_vmas;
 
-struct i915_vma *i915_vma_alloc(void)
+static struct i915_vma *i915_vma_alloc(void)
 {
 	return kmem_cache_zalloc(slab_vmas, GFP_KERNEL);
 }
 
-void i915_vma_free(struct i915_vma *vma)
+static void i915_vma_free(struct i915_vma *vma)
 {
 	return kmem_cache_free(slab_vmas, vma);
 }
@@ -423,10 +423,8 @@ int i915_vma_bind(struct i915_vma *vma,
 
 		work->base.dma.error = 0; /* enable the queue_work() */
 
-		if (vma->obj) {
-			__i915_gem_object_pin_pages(vma->obj);
-			work->pinned = i915_gem_object_get(vma->obj);
-		}
+		__i915_gem_object_pin_pages(vma->obj);
+		work->pinned = i915_gem_object_get(vma->obj);
 	} else {
 		vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
 	}
@@ -667,7 +665,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 	}
 
 	color = 0;
-	if (vma->obj && i915_vm_has_cache_coloring(vma->vm))
+	if (i915_vm_has_cache_coloring(vma->vm))
 		color = vma->obj->cache_level;
 
 	if (flags & PIN_OFFSET_FIXED) {
@@ -792,17 +790,14 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 static int vma_get_pages(struct i915_vma *vma)
 {
 	int err = 0;
-	bool pinned_pages = false;
+	bool pinned_pages = true;
 
 	if (atomic_add_unless(&vma->pages_count, 1, 0))
 		return 0;
 
-	if (vma->obj) {
-		err = i915_gem_object_pin_pages(vma->obj);
-		if (err)
-			return err;
-		pinned_pages = true;
-	}
+	err = i915_gem_object_pin_pages(vma->obj);
+	if (err)
+		return err;
 
 	/* Allocations ahoy! */
 	if (mutex_lock_interruptible(&vma->pages_mutex)) {
@@ -835,8 +830,8 @@ static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
 	if (atomic_sub_return(count, &vma->pages_count) == 0) {
 		vma->ops->clear_pages(vma);
 		GEM_BUG_ON(vma->pages);
-		if (vma->obj)
-			i915_gem_object_unpin_pages(vma->obj);
+
+		i915_gem_object_unpin_pages(vma->obj);
 	}
 	mutex_unlock(&vma->pages_mutex);
 }
@@ -872,7 +867,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	int err;
 
 #ifdef CONFIG_PROVE_LOCKING
-	if (debug_locks && !WARN_ON(!ww) && vma->resv)
+	if (debug_locks && !WARN_ON(!ww))
 		assert_vma_held(vma);
 #endif
 
@@ -980,7 +975,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 	GEM_BUG_ON(!vma->pages);
 	err = i915_vma_bind(vma,
-			    vma->obj ? vma->obj->cache_level : 0,
+			    vma->obj->cache_level,
 			    flags, work);
 	if (err)
 		goto err_remove;
@@ -1034,7 +1029,7 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 
 #ifdef CONFIG_LOCKDEP
-	WARN_ON(!ww && vma->resv && dma_resv_held(vma->resv));
+	WARN_ON(!ww && dma_resv_held(vma->resv));
 #endif
 
 	do {
@@ -1113,6 +1108,7 @@ void i915_vma_reopen(struct i915_vma *vma)
 void i915_vma_release(struct kref *ref)
 {
 	struct i915_vma *vma = container_of(ref, typeof(*vma), ref);
+	struct drm_i915_gem_object *obj = vma->obj;
 
 	if (drm_mm_node_allocated(&vma->node)) {
 		mutex_lock(&vma->vm->mutex);
@@ -1123,15 +1119,11 @@ void i915_vma_release(struct kref *ref)
 	}
 	GEM_BUG_ON(i915_vma_is_active(vma));
 
-	if (vma->obj) {
-		struct drm_i915_gem_object *obj = vma->obj;
-
-		spin_lock(&obj->vma.lock);
-		list_del(&vma->obj_link);
-		if (!RB_EMPTY_NODE(&vma->obj_node))
-			rb_erase(&vma->obj_node, &obj->vma.tree);
-		spin_unlock(&obj->vma.lock);
-	}
+	spin_lock(&obj->vma.lock);
+	list_del(&vma->obj_link);
+	if (!RB_EMPTY_NODE(&vma->obj_node))
+		rb_erase(&vma->obj_node, &obj->vma.tree);
+	spin_unlock(&obj->vma.lock);
 
 	__i915_vma_remove_closed(vma);
 	i915_vm_put(vma->vm);
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 648dbe744c96..312933c06017 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -418,9 +418,6 @@ static inline void i915_vma_clear_scanout(struct i915_vma *vma)
 	list_for_each_entry(V, &(OBJ)->vma.list, obj_link)		\
 		for_each_until(!i915_vma_is_ggtt(V))
 
-struct i915_vma *i915_vma_alloc(void);
-void i915_vma_free(struct i915_vma *vma);
-
 struct i915_vma *i915_vma_make_unshrinkable(struct i915_vma *vma);
 void i915_vma_make_shrinkable(struct i915_vma *vma);
 void i915_vma_make_purgeable(struct i915_vma *vma);
-- 
2.31.1

