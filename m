Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAF413238
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302566E9A7;
	Tue, 21 Sep 2021 11:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94D6E95A;
 Tue, 21 Sep 2021 11:02:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284344234"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="284344234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="484141843"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 12/14] drm/i915: try to simplify make_{un}shrinkable
Date: Tue, 21 Sep 2021 12:01:19 +0100
Message-Id: <20210921110121.3783395-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210921110121.3783395-1-matthew.auld@intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
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

Drop the atomic shrink_pin stuff, and just have make_{un}shrinkable
update the shrinker visible lists immediately. This at least simplifies
the next patch, and does make the behaviour more obvious. The potential
downside is that make_unshrinkable now grabs a global lock even when the
object itself is no longer shrinkable(transitioning from purgeable <->
shrinkable doesn't seem to be a thing), for example in the ppGTT
insertion paths we should now be careful not to needlessly call
make_unshrinkable multiple times. Outside of that there is some fallout
in intel_context which relies on nesting calls to shrink_pin.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  9 ----
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 16 +-----
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 52 +++++++++++++------
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  1 -
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  1 -
 drivers/gpu/drm/i915/gt/intel_context.c       |  9 +---
 7 files changed, 41 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 6fb9afb65034..e8265a432fcb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -305,15 +305,6 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 	 */
 	atomic_inc(&i915->mm.free_count);
 
-	/*
-	 * This serializes freeing with the shrinker. Since the free
-	 * is delayed, first by RCU then by the workqueue, we want the
-	 * shrinker to be able to free pages of unreferenced objects,
-	 * or else we may oom whilst there are plenty of deferred
-	 * freed objects.
-	 */
-	i915_gem_object_make_unshrinkable(obj);
-
 	/*
 	 * Since we require blocking on struct_mutex to unbind the freed
 	 * object from the GPU before releasing resources back to the
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 1b7ba859cf5e..a0069c643e3d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -455,7 +455,6 @@ struct drm_i915_gem_object {
 		 * instead go through the pin/unpin interfaces.
 		 */
 		atomic_t pages_pin_count;
-		atomic_t shrink_pin;
 
 		/**
 		 * Priority list of potential placements for this object.
@@ -516,7 +515,7 @@ struct drm_i915_gem_object {
 		struct i915_gem_object_page_iter get_dma_page;
 
 		/**
-		 * Element within i915->mm.unbound_list or i915->mm.bound_list,
+		 * Element within i915->mm.shrink_list or i915->mm.purge_list,
 		 * locked by i915->mm.obj_lock.
 		 */
 		struct list_head link;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8eb1c3a6fc9c..f0df1394d7f6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -64,28 +64,16 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 		GEM_BUG_ON(i915_gem_object_has_tiling_quirk(obj));
 		i915_gem_object_set_tiling_quirk(obj);
 		GEM_BUG_ON(!list_empty(&obj->mm.link));
-		atomic_inc(&obj->mm.shrink_pin);
 		shrinkable = false;
 	}
 
 	if (shrinkable) {
-		struct list_head *list;
-		unsigned long flags;
-
 		assert_object_held(obj);
-		spin_lock_irqsave(&i915->mm.obj_lock, flags);
-
-		i915->mm.shrink_count++;
-		i915->mm.shrink_memory += obj->base.size;
 
 		if (obj->mm.madv != I915_MADV_WILLNEED)
-			list = &i915->mm.purge_list;
+			i915_gem_object_make_purgeable(obj);
 		else
-			list = &i915->mm.shrink_list;
-		list_add_tail(&obj->mm.link, list);
-
-		atomic_set(&obj->mm.shrink_pin, 0);
-		spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
+			i915_gem_object_make_shrinkable(obj);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 478663dc42b4..4f5d49ada9e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -460,23 +460,26 @@ void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
 
 #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
 
+/**
+ * i915_gem_object_make_unshrinkable - Hide the object from the shrinker. By
+ * default all object types that support shrinking(see IS_SHRINKABLE), will also
+ * make the object visible to the shrinker after allocating the system memory
+ * pages.
+ * @obj: The GEM object.
+ *
+ * This is typically used for special kernel internal objects that can't be
+ * easily processed by the shrinker, like if they are perma-pinned.
+ */
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = obj_to_i915(obj);
 	unsigned long flags;
 
-	/*
-	 * We can only be called while the pages are pinned or when
-	 * the pages are released. If pinned, we should only be called
-	 * from a single caller under controlled conditions; and on release
-	 * only one caller may release us. Neither the two may cross.
-	 */
-	if (atomic_add_unless(&obj->mm.shrink_pin, 1, 0))
+	if (!i915_gem_object_is_shrinkable(obj))
 		return;
 
 	spin_lock_irqsave(&i915->mm.obj_lock, flags);
-	if (!atomic_fetch_inc(&obj->mm.shrink_pin) &&
-	    !list_empty(&obj->mm.link)) {
+	if (!list_empty(&obj->mm.link)) {
 		list_del_init(&obj->mm.link);
 		i915->mm.shrink_count--;
 		i915->mm.shrink_memory -= obj->base.size;
@@ -494,28 +497,45 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
 	if (!i915_gem_object_is_shrinkable(obj))
 		return;
 
-	if (atomic_add_unless(&obj->mm.shrink_pin, -1, 1))
-		return;
-
 	spin_lock_irqsave(&i915->mm.obj_lock, flags);
+
 	GEM_BUG_ON(!kref_read(&obj->base.refcount));
-	if (atomic_dec_and_test(&obj->mm.shrink_pin)) {
-		GEM_BUG_ON(!list_empty(&obj->mm.link));
 
-		list_add_tail(&obj->mm.link, head);
+	if (list_empty(&obj->mm.link)) {
 		i915->mm.shrink_count++;
 		i915->mm.shrink_memory += obj->base.size;
-
+		list_add_tail(&obj->mm.link, head);
+	} else {
+		list_move_tail(&obj->mm.link, head);
 	}
+
 	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 }
 
+
+/**
+ * i915_gem_object_make_shrinkable - Move the object to the tail of the
+ * shrinkable list. Objects on this list might be swapped out. Used with
+ * WILLNEED objects.
+ * @obj: The GEM object.
+ *
+ * Should only be called on objects which have backing pages.
+ */
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
 {
 	__i915_gem_object_make_shrinkable(obj,
 					  &obj_to_i915(obj)->mm.shrink_list);
 }
 
+/**
+ * i915_gem_object_make_purgeable - Move the object to the tail of the purgeable
+ * list. Used with DONTNEED objects. Unlike with shrinkable objects, the
+ * shrinker will attempt to discard the backing pages, instead of trying to swap
+ * them out.
+ * @obj: The GEM object.
+ *
+ * Should only be called on objects which have backing pages.
+ */
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj)
 {
 	__i915_gem_object_make_shrinkable(obj,
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 1aee5e6b1b23..dd5ebc1659cf 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -185,7 +185,6 @@ static void gen6_alloc_va_range(struct i915_address_space *vm,
 
 			pt = stash->pt[0];
 			__i915_gem_object_pin_pages(pt->base);
-			i915_gem_object_make_unshrinkable(pt->base);
 
 			fill32_px(pt, vm->scratch[0]->encode);
 
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 6a5af995f5b1..1b946978e377 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -301,7 +301,6 @@ static void __gen8_ppgtt_alloc(struct i915_address_space * const vm,
 
 			pt = stash->pt[!!lvl];
 			__i915_gem_object_pin_pages(pt->base);
-			i915_gem_object_make_unshrinkable(pt->base);
 
 			fill_px(pt, vm->scratch[lvl]->encode);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index ff637147b1a9..1b7dc57e6ec1 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -111,11 +111,6 @@ static int __context_pin_state(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
 	if (err)
 		goto err_unpin;
 
-	/*
-	 * And mark it as a globally pinned object to let the shrinker know
-	 * it cannot reclaim the object until we release it.
-	 */
-	i915_vma_make_unshrinkable(vma);
 	vma->obj->mm.dirty = true;
 
 	return 0;
@@ -127,7 +122,6 @@ static int __context_pin_state(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
 
 static void __context_unpin_state(struct i915_vma *vma)
 {
-	i915_vma_make_shrinkable(vma);
 	i915_active_release(&vma->active);
 	__i915_vma_unpin(vma);
 }
@@ -180,7 +174,6 @@ static int intel_context_pre_pin(struct intel_context *ce,
 	if (err)
 		goto err_timeline;
 
-
 	return 0;
 
 err_timeline:
@@ -338,6 +331,8 @@ static void __intel_context_retire(struct i915_active *active)
 
 	set_bit(CONTEXT_VALID_BIT, &ce->flags);
 	intel_context_post_unpin(ce);
+	if (ce->state)
+		i915_vma_make_shrinkable(ce->state);
 	intel_context_put(ce);
 }
 
-- 
2.26.3

