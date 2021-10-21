Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C93435F4C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321436EC69;
	Thu, 21 Oct 2021 10:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16B96E42C;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 28/28] drm/i915: Remove short-term pins from execbuf, v4.
Date: Thu, 21 Oct 2021 12:36:05 +0200
Message-Id: <20211021103605.735002-28-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
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

When evicting the entire vm in eb_reserve() we do temporarily pin objects
that are marked with EXEC_OBJECT_PINNED. This is because they are already
at their destination, and i915_gem_evict_vm() would otherwise unbind them.

However, we reduce the visibility of those pins by limiting the pin
to our call to i915_gem_evict_vm() only, and pin with vm->mutex held,
instead of the entire duration of the execbuf.

Not sure the latter matters, one can hope..
In theory we could kill the pinning by adding an extra flag to the vma
to temporarily prevent unbinding for gtt for i915_gem_evict_vm only, but
I think that might be overkill. We're still holding the object lock, and
we don't have blocking eviction yet. It's likely sufficient to simply
enforce EXEC_OBJECT_PINNED for all objects on >= gen12.

Changes since v1:
- Split out eb_reserve() into separate functions for readability.
Changes since v2:
- Make batch buffer mappable on platforms where only GGTT is available,
  to prevent moving the batch buffer during relocations.
Changes since v3:
- Preserve current behavior for batch buffer, instead be cautious when
  calling i915_gem_object_ggtt_pin_ww, and re-use the current batch vma
  if it's inside ggtt and map-and-fenceable.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 252 ++++++++++--------
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  24 +-
 3 files changed, 161 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index bbf2a10738f7..19f91143cfcf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -439,7 +439,7 @@ eb_pin_vma(struct i915_execbuffer *eb,
 	else
 		pin_flags = entry->offset & PIN_OFFSET_MASK;
 
-	pin_flags |= PIN_USER | PIN_NOEVICT | PIN_OFFSET_FIXED;
+	pin_flags |= PIN_USER | PIN_NOEVICT | PIN_OFFSET_FIXED | PIN_VALIDATE;
 	if (unlikely(ev->flags & EXEC_OBJECT_NEEDS_GTT))
 		pin_flags |= PIN_GLOBAL;
 
@@ -457,17 +457,15 @@ eb_pin_vma(struct i915_execbuffer *eb,
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
@@ -483,13 +481,9 @@ eb_pin_vma(struct i915_execbuffer *eb,
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
 
@@ -682,10 +676,8 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
 
 	if (unlikely(ev->flags & EXEC_OBJECT_NEEDS_FENCE)) {
 		err = i915_vma_pin_fence(vma);
-		if (unlikely(err)) {
-			i915_vma_unpin(vma);
+		if (unlikely(err))
 			return err;
-		}
 
 		if (vma->fence)
 			ev->flags |= __EXEC_OBJECT_HAS_FENCE;
@@ -697,85 +689,129 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
 	return 0;
 }
 
-static int eb_reserve(struct i915_execbuffer *eb)
+static int eb_evict_vm(struct i915_execbuffer *eb)
+{
+	const unsigned int count = eb->buffer_count;
+	unsigned int i;
+	int err;
+
+	err = mutex_lock_interruptible(&eb->context->vm->mutex);
+	if (err)
+		return err;
+
+	/* pin to protect against i915_gem_evict_vm evicting below */
+	for (i = 0; i < count; i++) {
+		struct eb_vma *ev = &eb->vma[i];
+
+		if (ev->flags & __EXEC_OBJECT_HAS_PIN)
+			__i915_vma_pin(ev->vma);
+	}
+
+	/* Too fragmented, unbind everything and retry */
+	err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
+
+	/* unpin objects.. */
+	for (i = 0; i < count; i++) {
+		struct eb_vma *ev = &eb->vma[i];
+
+		if (ev->flags & __EXEC_OBJECT_HAS_PIN)
+			i915_vma_unpin(ev->vma);
+	}
+
+	mutex_unlock(&eb->context->vm->mutex);
+
+	return err;
+}
+
+static bool eb_unbind(struct i915_execbuffer *eb)
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
+		if (flags & EXEC_OBJECT_PINNED &&
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
+			unpinned = eb_unbind(eb);
 
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
+		if (pass == 2) {
+			/* No point in defragmenting gtt if all is pinned */
+			if (!unpinned)
+				return -ENOSPC;
 
-		case 1:
-			/* Too fragmented, unbind everything and retry */
-			mutex_lock(&eb->context->vm->mutex);
-			err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
-			mutex_unlock(&eb->context->vm->mutex);
+			err = eb_evict_vm(eb);
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
@@ -1184,10 +1220,11 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
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
@@ -1197,7 +1234,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
 		intel_gt_flush_ggtt_writes(ggtt->vm.gt);
 		io_mapping_unmap_atomic((void __force __iomem *) unmask_page(cache->vaddr));
 	} else {
-		struct i915_vma *vma;
+		struct i915_vma *vma = ERR_PTR(-ENODEV);
 		int err;
 
 		if (i915_gem_object_is_tiled(obj))
@@ -1210,10 +1247,23 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
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
 
@@ -1251,7 +1301,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
 	return vaddr;
 }
 
-static void *reloc_vaddr(struct drm_i915_gem_object *obj,
+static void *reloc_vaddr(struct i915_vma *vma,
 			 struct i915_execbuffer *eb,
 			 unsigned long page)
 {
@@ -1263,9 +1313,9 @@ static void *reloc_vaddr(struct drm_i915_gem_object *obj,
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
@@ -1306,7 +1356,7 @@ relocate_entry(struct i915_vma *vma,
 	void *vaddr;
 
 repeat:
-	vaddr = reloc_vaddr(vma->obj, eb,
+	vaddr = reloc_vaddr(vma, eb,
 			    offset >> PAGE_SHIFT);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
@@ -2074,7 +2124,7 @@ shadow_batch_pin(struct i915_execbuffer *eb,
 	if (IS_ERR(vma))
 		return vma;
 
-	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, flags);
+	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, flags | PIN_VALIDATE);
 	if (err)
 		return ERR_PTR(err);
 
@@ -2088,7 +2138,7 @@ static struct i915_vma *eb_dispatch_secure(struct i915_execbuffer *eb, struct i9
 	 * batch" bit. Hence we need to pin secure batches into the global gtt.
 	 * hsw should have this fixed, but bdw mucks it up again. */
 	if (eb->batch_flags & I915_DISPATCH_SECURE)
-		return i915_gem_object_ggtt_pin_ww(vma->obj, &eb->ww, NULL, 0, 0, 0);
+		return i915_gem_object_ggtt_pin_ww(vma->obj, &eb->ww, NULL, 0, 0, PIN_VALIDATE);
 
 	return NULL;
 }
@@ -2139,13 +2189,12 @@ static int eb_parse(struct i915_execbuffer *eb)
 
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
@@ -2157,25 +2206,21 @@ static int eb_parse(struct i915_execbuffer *eb)
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
@@ -2183,7 +2228,7 @@ static int eb_parse(struct i915_execbuffer *eb)
 				      eb->batch_len[0],
 				      shadow, trampoline);
 	if (err)
-		goto err_unpin_batch;
+		return err;
 
 	eb->batches[0] = &eb->vma[eb->buffer_count++];
 	eb->batches[0]->vma = i915_vma_get(shadow);
@@ -2202,17 +2247,6 @@ static int eb_parse(struct i915_execbuffer *eb)
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
@@ -3337,8 +3371,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
 err_vma:
 	eb_release_vmas(&eb, true);
-	if (eb.trampoline)
-		i915_vma_unpin(eb.trampoline);
 	WARN_ON(err == -EDEADLK);
 	i915_gem_ww_ctx_fini(&eb.ww);
 
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
index 65168db534f0..0706731b211d 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -751,6 +751,15 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
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
@@ -1176,7 +1185,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!(flags & (PIN_USER | PIN_GLOBAL)));
 
 	/* First try and grab the pin without rebinding the vma */
-	if (try_qad_pin(vma, flags & I915_VMA_BIND_MASK))
+	if (try_qad_pin(vma, flags))
 		return 0;
 
 	err = i915_vma_get_pages(vma);
@@ -1255,7 +1264,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	}
 
 	if (unlikely(!(flags & ~bound & I915_VMA_BIND_MASK))) {
-		__i915_vma_pin(vma);
+		if (!(flags & PIN_VALIDATE))
+			__i915_vma_pin(vma);
 		goto err_unlock;
 	}
 
@@ -1284,8 +1294,10 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
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
 
@@ -1538,8 +1550,6 @@ static int __i915_vma_move_to_active(struct i915_vma *vma, struct i915_request *
 {
 	int err;
 
-	GEM_BUG_ON(!i915_vma_is_pinned(vma));
-
 	/* Wait for the vma to be bound before we start! */
 	err = __i915_request_await_bind(rq, vma);
 	if (err)
@@ -1558,6 +1568,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 
 	assert_object_held(obj);
 
+	GEM_BUG_ON(!vma->pages);
+
 	err = __i915_vma_move_to_active(vma, rq);
 	if (unlikely(err))
 		return err;
-- 
2.33.0

