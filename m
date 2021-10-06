Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC8423A63
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84546F642;
	Wed,  6 Oct 2021 09:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C676F640;
 Wed,  6 Oct 2021 09:16:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225843498"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="225843498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 02:16:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="589690788"
Received: from dcharle1-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 02:16:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v7 6/8] drm/i915/ttm: move shrinker management into adjust_lru
Date: Wed,  6 Oct 2021 10:16:11 +0100
Message-Id: <20211006091614.970596-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211006091614.970596-1-matthew.auld@intel.com>
References: <20211006091614.970596-1-matthew.auld@intel.com>
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

We currently just evict lmem objects to system memory when under memory
pressure. For this case we might lack the usual object mm.pages, which
effectively hides the pages from the i915-gem shrinker, until we
actually "attach" the TT to the object, or in the case of lmem-only
objects it just gets migrated back to lmem when touched again.

For all cases we can just adjust the i915 shrinker LRU each time we also
adjust the TTM LRU. The two cases we care about are:

  1) When something is moved by TTM, including when initially populating
     an object. Importantly this covers the case where TTM moves something from
     lmem <-> smem, outside of the normal get_pages() interface, which
     should still ensure the shmem pages underneath are reclaimable.

  2) When calling into i915_gem_object_unlock(). The unlock should
     ensure the object is removed from the shinker LRU, if it was indeed
     swapped out, or just purged, when the shrinker drops the object lock.

v2(Thomas):
  - Handle managing the shrinker LRU in adjust_lru, where it is always
    safe to touch the object.
v3(Thomas):
  - Pretty much a re-write. This time piggy back off the shrink_pin
    stuff, which actually seems to fit quite well for what we want here.
v4(Thomas):
  - Just use a simple boolean for tracking ttm_shrinkable.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 14 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 45 +++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 60 +++++++++++++++++--
 5 files changed, 114 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index e641db297e0e..3eac8cf2ae10 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -294,6 +294,12 @@ i915_gem_object_is_shrinkable(const struct drm_i915_gem_object *obj)
 	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_IS_SHRINKABLE);
 }
 
+static inline bool
+i915_gem_object_has_self_managed_shrink_list(const struct drm_i915_gem_object *obj)
+{
+	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST);
+}
+
 static inline bool
 i915_gem_object_is_proxy(const struct drm_i915_gem_object *obj)
 {
@@ -531,6 +537,8 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
+void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
+void __i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj);
 
 static inline bool cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index f4233c4e8d2e..5718a09f5533 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -34,9 +34,11 @@ struct i915_lut_handle {
 
 struct drm_i915_gem_object_ops {
 	unsigned int flags;
-#define I915_GEM_OBJECT_IS_SHRINKABLE	BIT(1)
-#define I915_GEM_OBJECT_IS_PROXY	BIT(2)
-#define I915_GEM_OBJECT_NO_MMAP		BIT(3)
+#define I915_GEM_OBJECT_IS_SHRINKABLE			BIT(1)
+/* Skip the shrinker management in set_pages/unset_pages */
+#define I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST	BIT(2)
+#define I915_GEM_OBJECT_IS_PROXY			BIT(3)
+#define I915_GEM_OBJECT_NO_MMAP				BIT(4)
 
 	/* Interface between the GEM object and its backing storage.
 	 * get_pages() is called once prior to the use of the associated set
@@ -485,6 +487,12 @@ struct drm_i915_gem_object {
 		 */
 		atomic_t shrink_pin;
 
+		/**
+		 * @ttm_shrinkable: True when the object is using shmem pages
+		 * underneath. Protected by the object lock.
+		 */
+		bool ttm_shrinkable;
+
 		/**
 		 * Priority list of potential placements for this object.
 		 */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index ea6d9b3d2d6b..308e22a80af4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -68,7 +68,7 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 		shrinkable = false;
 	}
 
-	if (shrinkable) {
+	if (shrinkable && !i915_gem_object_has_self_managed_shrink_list(obj)) {
 		struct list_head *list;
 		unsigned long flags;
 
@@ -210,7 +210,8 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 	if (i915_gem_object_is_volatile(obj))
 		obj->mm.madv = I915_MADV_WILLNEED;
 
-	i915_gem_object_make_unshrinkable(obj);
+	if (!i915_gem_object_has_self_managed_shrink_list(obj))
+		i915_gem_object_make_unshrinkable(obj);
 
 	if (obj->mm.mapping) {
 		unmap_object(obj, page_mask_bits(obj->mm.mapping));
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 66121fedc655..dde0a5c232f8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -497,13 +497,12 @@ void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
 	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 }
 
-static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
-					      struct list_head *head)
+static void ___i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
+					       struct list_head *head)
 {
 	struct drm_i915_private *i915 = obj_to_i915(obj);
 	unsigned long flags;
 
-	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
 	if (!i915_gem_object_is_shrinkable(obj))
 		return;
 
@@ -523,6 +522,38 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
 	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 }
 
+/**
+ * __i915_gem_object_make_shrinkable - Move the object to the tail of the
+ * shrinkable list. Objects on this list might be swapped out. Used with
+ * WILLNEED objects.
+ * @obj: The GEM object.
+ *
+ * DO NOT USE. This is intended to be called on very special objects that don't
+ * yet have mm.pages, but are guaranteed to have potentially reclaimable pages
+ * underneath.
+ */
+void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
+{
+	___i915_gem_object_make_shrinkable(obj,
+					   &obj_to_i915(obj)->mm.shrink_list);
+}
+
+/**
+ * __i915_gem_object_make_purgeable - Move the object to the tail of the
+ * purgeable list. Objects on this list might be swapped out. Used with
+ * DONTNEED objects.
+ * @obj: The GEM object.
+ *
+ * DO NOT USE. This is intended to be called on very special objects that don't
+ * yet have mm.pages, but are guaranteed to have potentially reclaimable pages
+ * underneath.
+ */
+void __i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj)
+{
+	___i915_gem_object_make_shrinkable(obj,
+					   &obj_to_i915(obj)->mm.purge_list);
+}
+
 /**
  * i915_gem_object_make_shrinkable - Move the object to the tail of the
  * shrinkable list. Objects on this list might be swapped out. Used with
@@ -535,8 +566,8 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
  */
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
 {
-	__i915_gem_object_make_shrinkable(obj,
-					  &obj_to_i915(obj)->mm.shrink_list);
+	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
+	__i915_gem_object_make_shrinkable(obj);
 }
 
 /**
@@ -552,6 +583,6 @@ void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
  */
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj)
 {
-	__i915_gem_object_make_shrinkable(obj,
-					  &obj_to_i915(obj)->mm.purge_list);
+	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
+	__i915_gem_object_make_purgeable(obj);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 0fe1eb8f38e9..5521c5457a4f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -851,7 +851,6 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 			return i915_ttm_err_to_gem(ret);
 	}
 
-	i915_ttm_adjust_lru(obj);
 	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
 		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
 		if (ret)
@@ -871,10 +870,9 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 			return PTR_ERR(st);
 
 		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
-		if (!bo->ttm || !i915_tt->is_shmem)
-			i915_gem_object_make_unshrinkable(obj);
 	}
 
+	i915_ttm_adjust_lru(obj);
 	return ret;
 }
 
@@ -945,8 +943,6 @@ static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
 	 * If the object is not destroyed next, The TTM eviction logic
 	 * and shrinkers will move it out if needed.
 	 */
-
-	i915_ttm_adjust_lru(obj);
 }
 
 static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
@@ -954,6 +950,8 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	struct i915_ttm_tt *i915_tt =
 		container_of(bo->ttm, typeof(*i915_tt), ttm);
+	bool shrinkable =
+		bo->ttm && i915_tt->filp && ttm_tt_is_populated(bo->ttm);
 
 	/*
 	 * Don't manipulate the TTM LRUs while in TTM bo destruction.
@@ -962,11 +960,40 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	if (!kref_read(&bo->kref))
 		return;
 
+	/*
+	 * We skip managing the shrinker LRU in set_pages() and just manage
+	 * everything here. This does at least solve the issue with having
+	 * temporary shmem mappings(like with evicted lmem) not being visible to
+	 * the shrinker. Only our shmem objects are shrinkable, everything else
+	 * we keep as unshrinkable.
+	 *
+	 * To make sure everything plays nice we keep an extra shrink pin in TTM
+	 * if the underlying pages are not currently shrinkable. Once we release
+	 * our pin, like when the pages are moved to shmem, the pages will then
+	 * be added to the shrinker LRU, assuming the caller isn't also holding
+	 * a pin.
+	 *
+	 * TODO: consider maybe also bumping the shrinker list here when we have
+	 * already unpinned it, which should give us something more like an LRU.
+	 */
+	if (shrinkable != obj->mm.ttm_shrinkable) {
+		if (shrinkable) {
+			if (obj->mm.madv == I915_MADV_WILLNEED)
+				__i915_gem_object_make_shrinkable(obj);
+			else
+				__i915_gem_object_make_purgeable(obj);
+		} else {
+			i915_gem_object_make_unshrinkable(obj);
+		}
+
+		obj->mm.ttm_shrinkable = shrinkable;
+	}
+
 	/*
 	 * Put on the correct LRU list depending on the MADV status
 	 */
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->ttm && i915_tt->filp) {
+	if (shrinkable) {
 		/* Try to keep shmem_tt from being considered for shrinking. */
 		bo->priority = TTM_MAX_BO_PRIORITY - 1;
 	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
@@ -1067,6 +1094,7 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
 
 static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
+	.flags = I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
 
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
@@ -1089,6 +1117,18 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 	mutex_destroy(&obj->ttm.get_io_page.lock);
 
 	if (obj->ttm.created) {
+		/*
+		 * We freely manage the shrinker LRU outide of the mm.pages life
+		 * cycle. As a result when destroying the object we should be
+		 * extra paranoid and ensure we remove it from the LRU, before
+		 * we free the object.
+		 *
+		 * Touching the ttm_shrinkable outside of the object lock here
+		 * should be safe now that the last GEM object ref was dropped.
+		 */
+		if (obj->mm.ttm_shrinkable)
+			i915_gem_object_make_unshrinkable(obj);
+
 		i915_ttm_backup_free(obj);
 
 		/* This releases all gem object bindings to the backend. */
@@ -1141,6 +1181,14 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	/* Forcing the page size is kernel internal only */
 	GEM_BUG_ON(page_size && obj->mm.n_placements);
 
+	/*
+	 * Keep an extra shrink pin to prevent the object from being made
+	 * shrinkable too early. If the ttm_tt is ever allocated in shmem, we
+	 * drop the pin. The TTM backend manages the shrinker LRU itself,
+	 * outside of the normal mm.pages life cycle.
+	 */
+	i915_gem_object_make_unshrinkable(obj);
+
 	/*
 	 * If this function fails, it will call the destructor, but
 	 * our caller still owns the object. So no freeing in the
-- 
2.26.3

