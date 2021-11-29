Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7C46172D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313376EDC2;
	Mon, 29 Nov 2021 13:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFAB6ED07;
 Mon, 29 Nov 2021 13:57:17 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/16] drm/i915: Remove assert_object_held_shared
Date: Mon, 29 Nov 2021 14:47:33 +0100
Message-Id: <20211129134735.628712-15-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
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

This duck tape workaround is no longer required, unbind and destroy are
fixed to take the obj->resv mutex before destroying and obj->mm.lock has
been removed, always requiring obj->resv as well.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c  |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h  | 14 --------------
 drivers/gpu/drm/i915/gem/i915_gem_pages.c   | 12 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  2 +-
 drivers/gpu/drm/i915/i915_vma.c             |  6 +++---
 5 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 39cd563544a5..0ae86812ed66 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -544,7 +544,7 @@ bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
 #ifdef CONFIG_LOCKDEP
 	if (IS_DGFX(to_i915(obj->base.dev)) &&
 	    i915_gem_object_evictable((void __force *)obj))
-		assert_object_held_shared(obj);
+		assert_object_held(obj);
 #endif
 	return obj->mem_flags & I915_BO_FLAG_STRUCT_PAGE;
 }
@@ -563,7 +563,7 @@ bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
 #ifdef CONFIG_LOCKDEP
 	if (IS_DGFX(to_i915(obj->base.dev)) &&
 	    i915_gem_object_evictable((void __force *)obj))
-		assert_object_held_shared(obj);
+		assert_object_held(obj);
 #endif
 	return obj->mem_flags & I915_BO_FLAG_IOMEM;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index f66d46882ea7..09cf1c92373a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -157,20 +157,6 @@ i915_gem_object_put(struct drm_i915_gem_object *obj)
 
 #define assert_object_held(obj) dma_resv_assert_held((obj)->base.resv)
 
-/*
- * If more than one potential simultaneous locker, assert held.
- */
-static inline void assert_object_held_shared(const struct drm_i915_gem_object *obj)
-{
-	/*
-	 * Note mm list lookup is protected by
-	 * kref_get_unless_zero().
-	 */
-	if (IS_ENABLED(CONFIG_LOCKDEP) &&
-	    kref_read(&obj->base.refcount) > 0)
-		assert_object_held(obj);
-}
-
 static inline int __i915_gem_object_lock(struct drm_i915_gem_object *obj,
 					 struct i915_gem_ww_ctx *ww,
 					 bool intr)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 49c6e55c68ce..6805b46170be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -19,7 +19,7 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 	bool shrinkable;
 	int i;
 
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 
 	if (i915_gem_object_is_volatile(obj))
 		obj->mm.madv = I915_MADV_DONTNEED;
@@ -95,7 +95,7 @@ int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int err;
 
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 
 	if (unlikely(obj->mm.madv != I915_MADV_WILLNEED)) {
 		drm_dbg(&i915->drm,
@@ -122,7 +122,7 @@ int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
 
 	assert_object_held(obj);
 
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 
 	if (unlikely(!i915_gem_object_has_pages(obj))) {
 		GEM_BUG_ON(i915_gem_object_has_pinned_pages(obj));
@@ -171,7 +171,7 @@ int i915_gem_object_truncate(struct drm_i915_gem_object *obj)
 /* Try to discard unwanted pages */
 void i915_gem_object_writeback(struct drm_i915_gem_object *obj)
 {
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 	GEM_BUG_ON(i915_gem_object_has_pages(obj));
 
 	if (obj->ops->writeback)
@@ -202,7 +202,7 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 {
 	struct sg_table *pages;
 
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 
 	pages = fetch_and_zero(&obj->mm.pages);
 	if (IS_ERR_OR_NULL(pages))
@@ -233,7 +233,7 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
 		return -EBUSY;
 
 	/* May be called by shrinker from within get_pages() (on another bo) */
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 
 	i915_gem_object_release_mmap_offset(obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 3173c9f9a040..a315c010f635 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -109,7 +109,7 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
 {
 	struct page **pvec = NULL;
 
-	assert_object_held_shared(obj);
+	assert_object_held(obj);
 
 	if (!--obj->userptr.page_ref) {
 		pvec = obj->userptr.pvec;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7261d82162af..100739b3e084 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1723,7 +1723,7 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 void __i915_vma_evict(struct i915_vma *vma)
 {
 	GEM_BUG_ON(i915_vma_is_pinned(vma));
-	assert_object_held_shared(vma->obj);
+	assert_object_held(vma->obj);
 
 	if (i915_vma_is_map_and_fenceable(vma)) {
 		/* Force a pagefault for domain tracking on next user access */
@@ -1769,7 +1769,7 @@ int __i915_vma_unbind(struct i915_vma *vma)
 	int ret;
 
 	lockdep_assert_held(&vma->vm->mutex);
-	assert_object_held_shared(vma->obj);
+	assert_object_held(vma->obj);
 
 	if (!drm_mm_node_allocated(&vma->node))
 		return 0;
@@ -1801,7 +1801,7 @@ int i915_vma_unbind(struct i915_vma *vma)
 	intel_wakeref_t wakeref = 0;
 	int err;
 
-	assert_object_held_shared(vma->obj);
+	assert_object_held(vma->obj);
 
 	/* Optimistic wait before taking the mutex */
 	err = i915_vma_sync(vma);
-- 
2.34.0

