Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1836248980C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405314AC15;
	Mon, 10 Jan 2022 11:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9567014AB0A;
 Mon, 10 Jan 2022 11:51:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/i915: Remove short-term pins from execbuf, v6.
Date: Mon, 10 Jan 2022 12:51:33 +0100
Message-Id: <20220110115133.1500718-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220110115133.1500718-1-maarten.lankhorst@linux.intel.com>
References: <20220110115133.1500718-1-maarten.lankhorst@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a flag PIN_VALIDATE, to indicate we don't need to pin and only
protected by the object lock.

This removes the need to unpin, which is done by just releasing the
lock.

eb_reserve is slightly reworked for readability, but the same steps
are still done:
- First pass pins with NONBLOCK.
- Second pass unbinds all objects first, then pins.
- Third pass is only called when not all objects are softpinned, and
  unbinds all objects, then calls i915_gem_evict_vm(), then pins.

Changes since v1:
- Split out eb_reserve() into separate functions for readability.
Changes since v2:
- Make batch buffer mappable on platforms where only GGTT is available,
  to prevent moving the batch buffer during relocations.
Changes since v3:
- Preserve current behavior for batch buffer, instead be cautious when
  calling i915_gem_object_ggtt_pin_ww, and re-use the current batch vma
  if it's inside ggtt and map-and-fenceable.
- Remove impossible condition check from eb_reserve. (Matt)
Changes since v5:
- Do not even temporarily pin, just call i915_gem_evict_vm() and mark
  all vma's as unpinned.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 220 +++++++++---------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |   1 -
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  24 +-
 4 files changed, 128 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index da35a143af36..cfff194d90e7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -441,7 +441,7 @@ eb_pin_vma(struct i915_execbuffer *eb,
 	else
 		pin_flags = entry->offset & PIN_OFFSET_MASK;
 
-	pin_flags |= PIN_USER | PIN_NOEVICT | PIN_OFFSET_FIXED;
+	pin_flags |= PIN_USER | PIN_NOEVICT | PIN_OFFSET_FIXED | PIN_VALIDATE;
 	if (unlikely(ev->flags & EXEC_OBJECT_NEEDS_GTT))
 		pin_flags |= PIN_GLOBAL;
 
@@ -459,17 +459,15 @@ eb_pin_vma(struct i915_execbuffer *eb,
 					     entry->pad_to_size,
 					     entry->alignment,
 					     eb_pin_flags(entry, ev->flags) |
-					     PIN_USER | PIN_NOEVICT);
+					     PIN_USER | PIN_NOEVICT | PIN_VALIDATE);
 		if (unlikely(err))
 			return err;
 	}
 
 	if (unlikely(ev->flags & EXEC_OBJECT_NEEDS_FENCE)) {
 		err = i915_vma_pin_fence(vma);
-		if (unlikely(err)) {
-			i915_vma_unpin(vma);
+		if (unlikely(err))
 			return err;
-		}
 
 		if (vma->fence)
 			ev->flags |= __EXEC_OBJECT_HAS_FENCE;
@@ -485,13 +483,9 @@ eb_pin_vma(struct i915_execbuffer *eb,
 static inline void
 eb_unreserve_vma(struct eb_vma *ev)
 {
-	if (!(ev->flags & __EXEC_OBJECT_HAS_PIN))
-		return;
-
 	if (unlikely(ev->flags & __EXEC_OBJECT_HAS_FENCE))
 		__i915_vma_unpin_fence(ev->vma);
 
-	__i915_vma_unpin(ev->vma);
 	ev->flags &= ~__EXEC_OBJECT_RESERVED;
 }
 
@@ -684,10 +678,8 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
 
 	if (unlikely(ev->flags & EXEC_OBJECT_NEEDS_FENCE)) {
 		err = i915_vma_pin_fence(vma);
-		if (unlikely(err)) {
-			i915_vma_unpin(vma);
+		if (unlikely(err))
 			return err;
-		}
 
 		if (vma->fence)
 			ev->flags |= __EXEC_OBJECT_HAS_FENCE;
@@ -699,85 +691,95 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
 	return 0;
 }
 
-static int eb_reserve(struct i915_execbuffer *eb)
+static bool eb_unbind(struct i915_execbuffer *eb, bool force)
 {
 	const unsigned int count = eb->buffer_count;
-	unsigned int pin_flags = PIN_USER | PIN_NONBLOCK;
+	unsigned int i;
 	struct list_head last;
+	bool unpinned = false;
+
+	/* Resort *all* the objects into priority order */
+	INIT_LIST_HEAD(&eb->unbound);
+	INIT_LIST_HEAD(&last);
+
+	for (i = 0; i < count; i++) {
+		struct eb_vma *ev = &eb->vma[i];
+		unsigned int flags = ev->flags;
+
+		if (!force && flags & EXEC_OBJECT_PINNED &&
+		    flags & __EXEC_OBJECT_HAS_PIN)
+			continue;
+
+		unpinned = true;
+		eb_unreserve_vma(ev);
+
+		if (flags & EXEC_OBJECT_PINNED)
+			/* Pinned must have their slot */
+			list_add(&ev->bind_link, &eb->unbound);
+		else if (flags & __EXEC_OBJECT_NEEDS_MAP)
+			/* Map require the lowest 256MiB (aperture) */
+			list_add_tail(&ev->bind_link, &eb->unbound);
+		else if (!(flags & EXEC_OBJECT_SUPPORTS_48B_ADDRESS))
+			/* Prioritise 4GiB region for restricted bo */
+			list_add(&ev->bind_link, &last);
+		else
+			list_add_tail(&ev->bind_link, &last);
+	}
+
+	list_splice_tail(&last, &eb->unbound);
+	return unpinned;
+}
+
+static int eb_reserve(struct i915_execbuffer *eb)
+{
 	struct eb_vma *ev;
-	unsigned int i, pass;
+	unsigned int pass;
 	int err = 0;
+	bool unpinned;
 
 	/*
 	 * Attempt to pin all of the buffers into the GTT.
-	 * This is done in 3 phases:
+	 * This is done in 2 phases:
 	 *
-	 * 1a. Unbind all objects that do not match the GTT constraints for
-	 *     the execbuffer (fenceable, mappable, alignment etc).
-	 * 1b. Increment pin count for already bound objects.
-	 * 2.  Bind new objects.
-	 * 3.  Decrement pin count.
+	 * 1. Unbind all objects that do not match the GTT constraints for
+	 *    the execbuffer (fenceable, mappable, alignment etc).
+	 * 2. Bind new objects.
 	 *
 	 * This avoid unnecessary unbinding of later objects in order to make
 	 * room for the earlier objects *unless* we need to defragment.
+	 *
+	 * Defragmenting is skipped if all objects are pinned at a fixed location.
 	 */
-	pass = 0;
-	do {
-		list_for_each_entry(ev, &eb->unbound, bind_link) {
-			err = eb_reserve_vma(eb, ev, pin_flags);
-			if (err)
-				break;
-		}
-		if (err != -ENOSPC)
-			return err;
+	for (pass = 0; pass <= 2; pass++) {
+		int pin_flags = PIN_USER | PIN_VALIDATE;
 
-		/* Resort *all* the objects into priority order */
-		INIT_LIST_HEAD(&eb->unbound);
-		INIT_LIST_HEAD(&last);
-		for (i = 0; i < count; i++) {
-			unsigned int flags;
+		if (pass == 0)
+			pin_flags |= PIN_NONBLOCK;
 
-			ev = &eb->vma[i];
-			flags = ev->flags;
-			if (flags & EXEC_OBJECT_PINNED &&
-			    flags & __EXEC_OBJECT_HAS_PIN)
-				continue;
+		if (pass >= 1)
+			unpinned = eb_unbind(eb, pass == 2);
 
-			eb_unreserve_vma(ev);
-
-			if (flags & EXEC_OBJECT_PINNED)
-				/* Pinned must have their slot */
-				list_add(&ev->bind_link, &eb->unbound);
-			else if (flags & __EXEC_OBJECT_NEEDS_MAP)
-				/* Map require the lowest 256MiB (aperture) */
-				list_add_tail(&ev->bind_link, &eb->unbound);
-			else if (!(flags & EXEC_OBJECT_SUPPORTS_48B_ADDRESS))
-				/* Prioritise 4GiB region for restricted bo */
-				list_add(&ev->bind_link, &last);
-			else
-				list_add_tail(&ev->bind_link, &last);
-		}
-		list_splice_tail(&last, &eb->unbound);
-
-		switch (pass++) {
-		case 0:
-			break;
-
-		case 1:
-			/* Too fragmented, unbind everything and retry */
-			mutex_lock(&eb->context->vm->mutex);
-			err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
-			mutex_unlock(&eb->context->vm->mutex);
+		if (pass == 2) {
+			err = mutex_lock_interruptible(&eb->context->vm->mutex);
+			if (!err) {
+				err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
+				mutex_unlock(&eb->context->vm->mutex);
+			}
 			if (err)
 				return err;
-			break;
+		}
 
-		default:
-			return -ENOSPC;
+		list_for_each_entry(ev, &eb->unbound, bind_link) {
+			err = eb_reserve_vma(eb, ev, pin_flags);
+			if (err)
+				break;
 		}
 
-		pin_flags = PIN_USER;
-	} while (1);
+		if (err != -ENOSPC)
+			break;
+	}
+
+	return err;
 }
 
 static int eb_select_context(struct i915_execbuffer *eb)
@@ -1225,10 +1227,11 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
 	return vaddr;
 }
 
-static void *reloc_iomap(struct drm_i915_gem_object *obj,
+static void *reloc_iomap(struct i915_vma *batch,
 			 struct i915_execbuffer *eb,
 			 unsigned long page)
 {
+	struct drm_i915_gem_object *obj = batch->obj;
 	struct reloc_cache *cache = &eb->reloc_cache;
 	struct i915_ggtt *ggtt = cache_to_ggtt(cache);
 	unsigned long offset;
@@ -1238,7 +1241,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
 		intel_gt_flush_ggtt_writes(ggtt->vm.gt);
 		io_mapping_unmap_atomic((void __force __iomem *) unmask_page(cache->vaddr));
 	} else {
-		struct i915_vma *vma;
+		struct i915_vma *vma = ERR_PTR(-ENODEV);
 		int err;
 
 		if (i915_gem_object_is_tiled(obj))
@@ -1251,10 +1254,23 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
 		if (err)
 			return ERR_PTR(err);
 
-		vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
-						  PIN_MAPPABLE |
-						  PIN_NONBLOCK /* NOWARN */ |
-						  PIN_NOEVICT);
+		/*
+		 * i915_gem_object_ggtt_pin_ww may attempt to remove the batch
+		 * VMA from the object list because we no longer pin.
+		 *
+		 * Only attempt to pin the batch buffer to ggtt if the current batch
+		 * is not inside ggtt, or the batch buffer is not misplaced.
+		 */
+		if (!i915_is_ggtt(batch->vm)) {
+			vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
+							  PIN_MAPPABLE |
+							  PIN_NONBLOCK /* NOWARN */ |
+							  PIN_NOEVICT);
+		} else if (i915_vma_is_map_and_fenceable(batch)) {
+			__i915_vma_pin(batch);
+			vma = batch;
+		}
+
 		if (vma == ERR_PTR(-EDEADLK))
 			return vma;
 
@@ -1292,7 +1308,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
 	return vaddr;
 }
 
-static void *reloc_vaddr(struct drm_i915_gem_object *obj,
+static void *reloc_vaddr(struct i915_vma *vma,
 			 struct i915_execbuffer *eb,
 			 unsigned long page)
 {
@@ -1304,9 +1320,9 @@ static void *reloc_vaddr(struct drm_i915_gem_object *obj,
 	} else {
 		vaddr = NULL;
 		if ((cache->vaddr & KMAP) == 0)
-			vaddr = reloc_iomap(obj, eb, page);
+			vaddr = reloc_iomap(vma, eb, page);
 		if (!vaddr)
-			vaddr = reloc_kmap(obj, cache, page);
+			vaddr = reloc_kmap(vma->obj, cache, page);
 	}
 
 	return vaddr;
@@ -1347,7 +1363,7 @@ relocate_entry(struct i915_vma *vma,
 	void *vaddr;
 
 repeat:
-	vaddr = reloc_vaddr(vma->obj, eb,
+	vaddr = reloc_vaddr(vma, eb,
 			    offset >> PAGE_SHIFT);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
@@ -2209,7 +2225,7 @@ shadow_batch_pin(struct i915_execbuffer *eb,
 	if (IS_ERR(vma))
 		return vma;
 
-	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, flags);
+	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, flags | PIN_VALIDATE);
 	if (err)
 		return ERR_PTR(err);
 
@@ -2223,7 +2239,7 @@ static struct i915_vma *eb_dispatch_secure(struct i915_execbuffer *eb, struct i9
 	 * batch" bit. Hence we need to pin secure batches into the global gtt.
 	 * hsw should have this fixed, but bdw mucks it up again. */
 	if (eb->batch_flags & I915_DISPATCH_SECURE)
-		return i915_gem_object_ggtt_pin_ww(vma->obj, &eb->ww, NULL, 0, 0, 0);
+		return i915_gem_object_ggtt_pin_ww(vma->obj, &eb->ww, NULL, 0, 0, PIN_VALIDATE);
 
 	return NULL;
 }
@@ -2274,13 +2290,12 @@ static int eb_parse(struct i915_execbuffer *eb)
 
 	err = i915_gem_object_lock(pool->obj, &eb->ww);
 	if (err)
-		goto err;
+		return err;
 
 	shadow = shadow_batch_pin(eb, pool->obj, eb->context->vm, PIN_USER);
-	if (IS_ERR(shadow)) {
-		err = PTR_ERR(shadow);
-		goto err;
-	}
+	if (IS_ERR(shadow))
+		return PTR_ERR(shadow);
+
 	intel_gt_buffer_pool_mark_used(pool);
 	i915_gem_object_set_readonly(shadow->obj);
 	shadow->private = pool;
@@ -2292,25 +2307,21 @@ static int eb_parse(struct i915_execbuffer *eb)
 		shadow = shadow_batch_pin(eb, pool->obj,
 					  &eb->gt->ggtt->vm,
 					  PIN_GLOBAL);
-		if (IS_ERR(shadow)) {
-			err = PTR_ERR(shadow);
-			shadow = trampoline;
-			goto err_shadow;
-		}
+		if (IS_ERR(shadow))
+			return PTR_ERR(shadow);
+
 		shadow->private = pool;
 
 		eb->batch_flags |= I915_DISPATCH_SECURE;
 	}
 
 	batch = eb_dispatch_secure(eb, shadow);
-	if (IS_ERR(batch)) {
-		err = PTR_ERR(batch);
-		goto err_trampoline;
-	}
+	if (IS_ERR(batch))
+		return PTR_ERR(batch);
 
 	err = dma_resv_reserve_shared(shadow->obj->base.resv, 1);
 	if (err)
-		goto err_trampoline;
+		return err;
 
 	err = intel_engine_cmd_parser(eb->context->engine,
 				      eb->batches[0]->vma,
@@ -2318,7 +2329,7 @@ static int eb_parse(struct i915_execbuffer *eb)
 				      eb->batch_len[0],
 				      shadow, trampoline);
 	if (err)
-		goto err_unpin_batch;
+		return err;
 
 	eb->batches[0] = &eb->vma[eb->buffer_count++];
 	eb->batches[0]->vma = i915_vma_get(shadow);
@@ -2337,17 +2348,6 @@ static int eb_parse(struct i915_execbuffer *eb)
 		eb->batches[0]->vma = i915_vma_get(batch);
 	}
 	return 0;
-
-err_unpin_batch:
-	if (batch)
-		i915_vma_unpin(batch);
-err_trampoline:
-	if (trampoline)
-		i915_vma_unpin(trampoline);
-err_shadow:
-	i915_vma_unpin(shadow);
-err:
-	return err;
 }
 
 static int eb_request_submit(struct i915_execbuffer *eb,
@@ -3468,8 +3468,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
 err_vma:
 	eb_release_vmas(&eb, true);
-	if (eb.trampoline)
-		i915_vma_unpin(eb.trampoline);
 	WARN_ON(err == -EDEADLK);
 	i915_gem_ww_ctx_fini(&eb.ww);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index beabf3bc9b75..c52d255e8ef3 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -425,7 +425,6 @@ int i915_vma_pin_fence(struct i915_vma *vma)
 	 * must keep the device awake whilst using the fence.
 	 */
 	assert_rpm_wakelock_held(vma->vm->gt->uncore->rpm);
-	GEM_BUG_ON(!i915_vma_is_pinned(vma));
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 
 	err = mutex_lock_interruptible(&vma->vm->mutex);
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index e4938aba3fe9..8c2f57eb5dda 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -44,6 +44,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 #define PIN_HIGH		BIT_ULL(5)
 #define PIN_OFFSET_BIAS		BIT_ULL(6)
 #define PIN_OFFSET_FIXED	BIT_ULL(7)
+#define PIN_VALIDATE		BIT_ULL(8) /* validate placement only, no need to call unpin() */
 
 #define PIN_GLOBAL		BIT_ULL(10) /* I915_VMA_GLOBAL_BIND */
 #define PIN_USER		BIT_ULL(11) /* I915_VMA_LOCAL_BIND */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 8859feb7d131..5f43100638b5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -779,6 +779,15 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
 	unsigned int bound;
 
 	bound = atomic_read(&vma->flags);
+
+	if (flags & PIN_VALIDATE) {
+		flags &= I915_VMA_BIND_MASK;
+
+		return (flags & bound) == flags;
+	}
+
+	/* with the lock mandatory for unbind, we don't race here */
+	flags &= I915_VMA_BIND_MASK;
 	do {
 		if (unlikely(flags & ~bound))
 			return false;
@@ -1254,7 +1263,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!(flags & (PIN_USER | PIN_GLOBAL)));
 
 	/* First try and grab the pin without rebinding the vma */
-	if (try_qad_pin(vma, flags & I915_VMA_BIND_MASK))
+	if (try_qad_pin(vma, flags))
 		return 0;
 
 	err = i915_vma_get_pages(vma);
@@ -1336,7 +1345,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	}
 
 	if (unlikely(!(flags & ~bound & I915_VMA_BIND_MASK))) {
-		__i915_vma_pin(vma);
+		if (!(flags & PIN_VALIDATE))
+			__i915_vma_pin(vma);
 		goto err_unlock;
 	}
 
@@ -1365,8 +1375,10 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	atomic_add(I915_VMA_PAGES_ACTIVE, &vma->pages_count);
 	list_move_tail(&vma->vm_link, &vma->vm->bound_list);
 
-	__i915_vma_pin(vma);
-	GEM_BUG_ON(!i915_vma_is_pinned(vma));
+	if (!(flags & PIN_VALIDATE)) {
+		__i915_vma_pin(vma);
+		GEM_BUG_ON(!i915_vma_is_pinned(vma));
+	}
 	GEM_BUG_ON(!i915_vma_is_bound(vma, flags));
 	GEM_BUG_ON(i915_vma_misplaced(vma, size, alignment, flags));
 
@@ -1626,8 +1638,6 @@ static int __i915_vma_move_to_active(struct i915_vma *vma, struct i915_request *
 {
 	int err;
 
-	GEM_BUG_ON(!i915_vma_is_pinned(vma));
-
 	/* Wait for the vma to be bound before we start! */
 	err = __i915_request_await_bind(rq, vma);
 	if (err)
@@ -1646,6 +1656,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 
 	assert_object_held(obj);
 
+	GEM_BUG_ON(!vma->pages);
+
 	err = __i915_vma_move_to_active(vma, rq);
 	if (unlikely(err))
 		return err;
-- 
2.34.1

