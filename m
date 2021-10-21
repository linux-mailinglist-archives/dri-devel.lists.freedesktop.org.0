Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F8435F4A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026AB6EC49;
	Thu, 21 Oct 2021 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6400E6EC39;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 19/28] drm/i915: Pass trylock context to callers
Date: Thu, 21 Oct 2021 12:35:56 +0200
Message-Id: <20211021103605.735002-19-maarten.lankhorst@linux.intel.com>
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  5 +++-
 drivers/gpu/drm/i915/i915_gem_evict.c         | 15 ++++++-----
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  8 +++---
 drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +++
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 13 +++++----
 .../gpu/drm/i915/selftests/i915_gem_evict.c   | 27 ++++++++++++-------
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 14 +++++-----
 18 files changed, 70 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index e614591ca510..bbf2a10738f7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -764,7 +764,7 @@ static int eb_reserve(struct i915_execbuffer *eb)
 		case 1:
 			/* Too fragmented, unbind everything and retry */
 			mutex_lock(&eb->context->vm->mutex);
-			err = i915_gem_evict_vm(eb->context->vm);
+			err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
 			mutex_unlock(&eb->context->vm->mutex);
 			if (err)
 				return err;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 59201801cec5..accd8fad0ed7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -211,9 +211,13 @@ static inline int i915_gem_object_lock_interruptible(struct drm_i915_gem_object
 	return __i915_gem_object_lock(obj, ww, true);
 }
 
-static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj)
+static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj,
+					   struct i915_gem_ww_ctx *ww)
 {
-	return dma_resv_trylock(obj->base.resv);
+	if (!ww)
+		return dma_resv_trylock(obj->base.resv);
+	else
+		return ww_mutex_trylock(&obj->base.resv->lock, &ww->ctx);
 }
 
 static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 34c12e5983eb..5375f3f9f016 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -210,7 +210,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 
 			/* May arrive from get_pages on another bo */
 			if (!ww) {
-				if (!i915_gem_object_trylock(obj))
+				if (!i915_gem_object_trylock(obj, NULL))
 					goto skip;
 			} else {
 				err = i915_gem_object_lock(obj, ww);
@@ -408,7 +408,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 		if (!vma->iomap || i915_vma_is_active(vma))
 			continue;
 
-		if (!i915_gem_object_trylock(obj))
+		if (!i915_gem_object_trylock(obj, NULL))
 			continue;
 
 		if (__i915_vma_unbind(vma) == 0)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ddd37ccb1362..d629ef5abf9a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -653,7 +653,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
 	i915_gem_object_set_cache_coherency(obj, cache_level);
 
-	if (WARN_ON(!i915_gem_object_trylock(obj)))
+	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
 		return -EBUSY;
 
 	i915_gem_object_init_memory_region(obj, mem);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 849fbb229bd3..d66c8bd50ae3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -26,7 +26,7 @@ static void dbg_poison_ce(struct intel_context *ce)
 		int type = i915_coherent_map_type(ce->engine->i915, obj, true);
 		void *map;
 
-		if (!i915_gem_object_trylock(obj))
+		if (!i915_gem_object_trylock(obj, NULL))
 			return;
 
 		map = i915_gem_object_pin_map(obj, type);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 6da57199bb33..df29fd992b45 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -487,7 +487,7 @@ static int ggtt_reserve_guc_top(struct i915_ggtt *ggtt)
 	GEM_BUG_ON(ggtt->vm.total <= GUC_GGTT_TOP);
 	size = ggtt->vm.total - GUC_GGTT_TOP;
 
-	ret = i915_gem_gtt_reserve(&ggtt->vm, &ggtt->uc_fw, size,
+	ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, &ggtt->uc_fw, size,
 				   GUC_GGTT_TOP, I915_COLOR_UNEVICTABLE,
 				   PIN_NOEVICT);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index bb99fc03f503..240265354274 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -17,7 +17,7 @@ static int mock_timeline_pin(struct intel_timeline *tl)
 {
 	int err;
 
-	if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj)))
+	if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj, NULL)))
 		return -EBUSY;
 
 	err = intel_timeline_pin_map(tl);
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 7e2d99dd012d..572f942c3c5d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -1378,7 +1378,7 @@ static int evict_vma(void *data)
 	complete(&arg->completion);
 
 	mutex_lock(&vm->mutex);
-	err = i915_gem_evict_for_node(vm, &evict, 0);
+	err = i915_gem_evict_for_node(vm, NULL, &evict, 0);
 	mutex_unlock(&vm->mutex);
 
 	return err;
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 12ef2837c89b..78993c760f12 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -464,7 +464,7 @@ create_init_lmem_internal(struct intel_gt *gt, size_t sz, bool try_lmem)
 			return obj;
 	}
 
-	i915_gem_object_trylock(obj);
+	i915_gem_object_trylock(obj, NULL);
 	err = i915_gem_object_pin_pages(obj);
 	if (err) {
 		i915_gem_object_unlock(obj);
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 0d6d59871308..c08098a167e9 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -63,7 +63,7 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
 
 	mutex_lock(&gt->ggtt->vm.mutex);
 	mmio_hw_access_pre(gt);
-	ret = i915_gem_gtt_insert(&gt->ggtt->vm, node,
+	ret = i915_gem_gtt_insert(&gt->ggtt->vm, NULL, node,
 				  size, I915_GTT_PAGE_SIZE,
 				  I915_COLOR_UNEVICTABLE,
 				  start, end, flags);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index a8d733a7e1d9..22c891720c6d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1920,14 +1920,17 @@ i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
 
 /* i915_gem_evict.c */
 int __must_check i915_gem_evict_something(struct i915_address_space *vm,
+					  struct i915_gem_ww_ctx *ww,
 					  u64 min_size, u64 alignment,
 					  unsigned long color,
 					  u64 start, u64 end,
 					  unsigned flags);
 int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
+					 struct i915_gem_ww_ctx *ww,
 					 struct drm_mm_node *node,
 					 unsigned int flags);
-int i915_gem_evict_vm(struct i915_address_space *vm);
+int i915_gem_evict_vm(struct i915_address_space *vm,
+		      struct i915_gem_ww_ctx *ww);
 
 /* i915_gem_internal.c */
 struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 286efa462eca..24f5e3345e43 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -51,6 +51,7 @@ static int ggtt_flush(struct intel_gt *gt)
 
 static bool
 mark_free(struct drm_mm_scan *scan,
+	  struct i915_gem_ww_ctx *ww,
 	  struct i915_vma *vma,
 	  unsigned int flags,
 	  struct list_head *unwind)
@@ -58,7 +59,7 @@ mark_free(struct drm_mm_scan *scan,
 	if (i915_vma_is_pinned(vma))
 		return false;
 
-	if (!i915_gem_object_trylock(vma->obj))
+	if (!i915_gem_object_trylock(vma->obj, ww))
 		return false;
 
 	list_add(&vma->evict_link, unwind);
@@ -101,6 +102,7 @@ static bool defer_evict(struct i915_vma *vma)
  */
 int
 i915_gem_evict_something(struct i915_address_space *vm,
+			 struct i915_gem_ww_ctx *ww,
 			 u64 min_size, u64 alignment,
 			 unsigned long color,
 			 u64 start, u64 end,
@@ -173,7 +175,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 			continue;
 		}
 
-		if (mark_free(&scan, vma, flags, &eviction_list))
+		if (mark_free(&scan, ww, vma, flags, &eviction_list))
 			goto found;
 	}
 
@@ -250,7 +252,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 
 		/* If we find any non-objects (!vma), we cannot evict them */
 		if (vma->node.color != I915_COLOR_UNEVICTABLE &&
-		    i915_gem_object_trylock(vma->obj)) {
+		    i915_gem_object_trylock(vma->obj, ww)) {
 			ret = __i915_vma_unbind(vma);
 			i915_gem_object_unlock(vma->obj);
 		} else {
@@ -273,6 +275,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
  * memory in e.g. the shrinker.
  */
 int i915_gem_evict_for_node(struct i915_address_space *vm,
+			    struct i915_gem_ww_ctx *ww,
 			    struct drm_mm_node *target,
 			    unsigned int flags)
 {
@@ -345,7 +348,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 			break;
 		}
 
-		if (!i915_gem_object_trylock(vma->obj)) {
+		if (!i915_gem_object_trylock(vma->obj, ww)) {
 			ret = -ENOSPC;
 			break;
 		}
@@ -386,7 +389,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
  * To clarify: This is for freeing up virtual address space, not for freeing
  * memory in e.g. the shrinker.
  */
-int i915_gem_evict_vm(struct i915_address_space *vm)
+int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 {
 	int ret = 0;
 
@@ -412,7 +415,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
 			if (i915_vma_is_pinned(vma))
 				continue;
 
-			if (!i915_gem_object_trylock(vma->obj))
+			if (!i915_gem_object_trylock(vma->obj, ww))
 				continue;
 
 			__i915_vma_pin(vma);
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index cd5f2348a187..c810da476c2b 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -93,6 +93,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
  * asked to wait for eviction and interrupted.
  */
 int i915_gem_gtt_reserve(struct i915_address_space *vm,
+			 struct i915_gem_ww_ctx *ww,
 			 struct drm_mm_node *node,
 			 u64 size, u64 offset, unsigned long color,
 			 unsigned int flags)
@@ -117,7 +118,7 @@ int i915_gem_gtt_reserve(struct i915_address_space *vm,
 	if (flags & PIN_NOEVICT)
 		return -ENOSPC;
 
-	err = i915_gem_evict_for_node(vm, node, flags);
+	err = i915_gem_evict_for_node(vm, ww, node, flags);
 	if (err == 0)
 		err = drm_mm_reserve_node(&vm->mm, node);
 
@@ -184,6 +185,7 @@ static u64 random_offset(u64 start, u64 end, u64 len, u64 align)
  * asked to wait for eviction and interrupted.
  */
 int i915_gem_gtt_insert(struct i915_address_space *vm,
+			struct i915_gem_ww_ctx *ww,
 			struct drm_mm_node *node,
 			u64 size, u64 alignment, unsigned long color,
 			u64 start, u64 end, unsigned int flags)
@@ -269,7 +271,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 	 */
 	offset = random_offset(start, end,
 			       size, alignment ?: I915_GTT_MIN_ALIGNMENT);
-	err = i915_gem_gtt_reserve(vm, node, size, offset, color, flags);
+	err = i915_gem_gtt_reserve(vm, ww, node, size, offset, color, flags);
 	if (err != -ENOSPC)
 		return err;
 
@@ -277,7 +279,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 		return -ENOSPC;
 
 	/* Randomly selected placement is pinned, do a search */
-	err = i915_gem_evict_something(vm, size, alignment, color,
+	err = i915_gem_evict_something(vm, ww, size, alignment, color,
 				       start, end, flags);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index c9b0ee5e1d23..e4938aba3fe9 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -16,6 +16,7 @@
 
 struct drm_i915_gem_object;
 struct i915_address_space;
+struct i915_gem_ww_ctx;
 
 int __must_check i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 					    struct sg_table *pages);
@@ -23,11 +24,13 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages);
 
 int i915_gem_gtt_reserve(struct i915_address_space *vm,
+			 struct i915_gem_ww_ctx *ww,
 			 struct drm_mm_node *node,
 			 u64 size, u64 offset, unsigned long color,
 			 unsigned int flags);
 
 int i915_gem_gtt_insert(struct i915_address_space *vm,
+			struct i915_gem_ww_ctx *ww,
 			struct drm_mm_node *node,
 			u64 size, u64 alignment, unsigned long color,
 			u64 start, u64 end, unsigned int flags);
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index 31a105bc1792..c97323973f9b 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -197,7 +197,7 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
 	drm_info(&dev_priv->drm,
 		 "balloon space: range [ 0x%lx - 0x%lx ] %lu KiB.\n",
 		 start, end, size / 1024);
-	ret = i915_gem_gtt_reserve(&ggtt->vm, node,
+	ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, node,
 				   size, start, I915_COLOR_UNEVICTABLE,
 				   0);
 	if (!ret)
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 2877dcd62acb..3275b2364785 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -623,7 +623,8 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
  * 0 on success, negative error code otherwise.
  */
 static int
-i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
+i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
+		u64 size, u64 alignment, u64 flags)
 {
 	unsigned long color;
 	u64 start, end;
@@ -675,7 +676,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 		    range_overflows(offset, size, end))
 			return -EINVAL;
 
-		ret = i915_gem_gtt_reserve(vma->vm, &vma->node,
+		ret = i915_gem_gtt_reserve(vma->vm, ww, &vma->node,
 					   size, offset, color,
 					   flags);
 		if (ret)
@@ -714,7 +715,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 				size = round_up(size, I915_GTT_PAGE_SIZE_2M);
 		}
 
-		ret = i915_gem_gtt_insert(vma->vm, &vma->node,
+		ret = i915_gem_gtt_insert(vma->vm, ww, &vma->node,
 					  size, alignment, color,
 					  start, end, flags);
 		if (ret)
@@ -1293,7 +1294,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		goto err_unlock;
 
 	if (!(bound & I915_VMA_BIND_MASK)) {
-		err = i915_vma_insert(vma, size, alignment, flags);
+		err = i915_vma_insert(vma, ww, size, alignment, flags);
 		if (err)
 			goto err_active;
 
@@ -1369,7 +1370,9 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		/* Unlike i915_vma_pin, we don't take no for an answer! */
 		flush_idle_contexts(vm->gt);
 		if (mutex_lock_interruptible(&vm->mutex) == 0) {
-			i915_gem_evict_vm(vm);
+
+			/* We pass NULL ww here, as we don't want to unbind locked objects */
+			i915_gem_evict_vm(vm, NULL);
 			mutex_unlock(&vm->mutex);
 		}
 	} while (1);
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index f99bb0113726..4591be1a8803 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -117,7 +117,7 @@ static int igt_evict_something(void *arg)
 
 	/* Everything is pinned, nothing should happen */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_something(&ggtt->vm,
+	err = i915_gem_evict_something(&ggtt->vm, NULL,
 				       I915_GTT_PAGE_SIZE, 0, 0,
 				       0, U64_MAX,
 				       0);
@@ -132,11 +132,12 @@ static int igt_evict_something(void *arg)
 
 	/* Everything is unpinned, we should be able to evict something */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_something(&ggtt->vm,
+	err = i915_gem_evict_something(&ggtt->vm, NULL,
 				       I915_GTT_PAGE_SIZE, 0, 0,
 				       0, U64_MAX,
 				       0);
 	mutex_unlock(&ggtt->vm.mutex);
+
 	if (err) {
 		pr_err("i915_gem_evict_something failed on a full GGTT with err=%d\n",
 		       err);
@@ -204,7 +205,7 @@ static int igt_evict_for_vma(void *arg)
 
 	/* Everything is pinned, nothing should happen */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err != -ENOSPC) {
 		pr_err("i915_gem_evict_for_node on a full GGTT returned err=%d\n",
@@ -216,7 +217,7 @@ static int igt_evict_for_vma(void *arg)
 
 	/* Everything is unpinned, we should be able to evict the node */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err) {
 		pr_err("i915_gem_evict_for_node returned err=%d\n",
@@ -297,7 +298,7 @@ static int igt_evict_for_cache_color(void *arg)
 
 	/* Remove just the second vma */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err) {
 		pr_err("[0]i915_gem_evict_for_node returned err=%d\n", err);
@@ -310,7 +311,7 @@ static int igt_evict_for_cache_color(void *arg)
 	target.color = I915_CACHE_L3_LLC;
 
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
+	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (!err) {
 		pr_err("[1]i915_gem_evict_for_node returned err=%d\n", err);
@@ -331,6 +332,7 @@ static int igt_evict_vm(void *arg)
 {
 	struct intel_gt *gt = arg;
 	struct i915_ggtt *ggtt = gt->ggtt;
+	struct i915_gem_ww_ctx ww;
 	LIST_HEAD(objects);
 	int err;
 
@@ -342,7 +344,7 @@ static int igt_evict_vm(void *arg)
 
 	/* Everything is pinned, nothing should happen */
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_vm(&ggtt->vm);
+	err = i915_gem_evict_vm(&ggtt->vm, NULL);
 	mutex_unlock(&ggtt->vm.mutex);
 	if (err) {
 		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
@@ -352,9 +354,14 @@ static int igt_evict_vm(void *arg)
 
 	unpin_ggtt(ggtt);
 
+	i915_gem_ww_ctx_init(&ww, false);
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_evict_vm(&ggtt->vm);
+	err = i915_gem_evict_vm(&ggtt->vm, &ww);
 	mutex_unlock(&ggtt->vm.mutex);
+
+	/* no -EDEADLK handling; can't happen with vm.mutex in place */
+	i915_gem_ww_ctx_fini(&ww);
+
 	if (err) {
 		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
 		       err);
@@ -402,7 +409,7 @@ static int igt_evict_contexts(void *arg)
 	/* Reserve a block so that we know we have enough to fit a few rq */
 	memset(&hole, 0, sizeof(hole));
 	mutex_lock(&ggtt->vm.mutex);
-	err = i915_gem_gtt_insert(&ggtt->vm, &hole,
+	err = i915_gem_gtt_insert(&ggtt->vm, NULL, &hole,
 				  PRETEND_GGTT_SIZE, 0, I915_COLOR_UNEVICTABLE,
 				  0, ggtt->vm.total,
 				  PIN_NOEVICT);
@@ -422,7 +429,7 @@ static int igt_evict_contexts(void *arg)
 			goto out_locked;
 		}
 
-		if (i915_gem_gtt_insert(&ggtt->vm, &r->node,
+		if (i915_gem_gtt_insert(&ggtt->vm, NULL, &r->node,
 					1ul << 20, 0, I915_COLOR_UNEVICTABLE,
 					0, ggtt->vm.total,
 					PIN_NOEVICT)) {
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 4574fb51b656..6b1db83119b3 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1378,7 +1378,7 @@ static int igt_gtt_reserve(void *arg)
 		}
 
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_reserve(&ggtt->vm, &vma->node,
+		err = i915_gem_gtt_reserve(&ggtt->vm, NULL, &vma->node,
 					   obj->base.size,
 					   total,
 					   obj->cache_level,
@@ -1430,7 +1430,7 @@ static int igt_gtt_reserve(void *arg)
 		}
 
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_reserve(&ggtt->vm, &vma->node,
+		err = i915_gem_gtt_reserve(&ggtt->vm, NULL, &vma->node,
 					   obj->base.size,
 					   total,
 					   obj->cache_level,
@@ -1477,7 +1477,7 @@ static int igt_gtt_reserve(void *arg)
 					   I915_GTT_MIN_ALIGNMENT);
 
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_reserve(&ggtt->vm, &vma->node,
+		err = i915_gem_gtt_reserve(&ggtt->vm, NULL, &vma->node,
 					   obj->base.size,
 					   offset,
 					   obj->cache_level,
@@ -1552,7 +1552,7 @@ static int igt_gtt_insert(void *arg)
 	/* Check a couple of obviously invalid requests */
 	for (ii = invalid_insert; ii->size; ii++) {
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_insert(&ggtt->vm, &tmp,
+		err = i915_gem_gtt_insert(&ggtt->vm, NULL, &tmp,
 					  ii->size, ii->alignment,
 					  I915_COLOR_UNEVICTABLE,
 					  ii->start, ii->end,
@@ -1594,7 +1594,7 @@ static int igt_gtt_insert(void *arg)
 		}
 
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_insert(&ggtt->vm, &vma->node,
+		err = i915_gem_gtt_insert(&ggtt->vm, NULL, &vma->node,
 					  obj->base.size, 0, obj->cache_level,
 					  0, ggtt->vm.total,
 					  0);
@@ -1654,7 +1654,7 @@ static int igt_gtt_insert(void *arg)
 		}
 
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_insert(&ggtt->vm, &vma->node,
+		err = i915_gem_gtt_insert(&ggtt->vm, NULL, &vma->node,
 					  obj->base.size, 0, obj->cache_level,
 					  0, ggtt->vm.total,
 					  0);
@@ -1703,7 +1703,7 @@ static int igt_gtt_insert(void *arg)
 		}
 
 		mutex_lock(&ggtt->vm.mutex);
-		err = i915_gem_gtt_insert(&ggtt->vm, &vma->node,
+		err = i915_gem_gtt_insert(&ggtt->vm, NULL, &vma->node,
 					  obj->base.size, 0, obj->cache_level,
 					  0, ggtt->vm.total,
 					  0);
-- 
2.33.0

