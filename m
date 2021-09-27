Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28541937D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6D6E84E;
	Mon, 27 Sep 2021 11:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ABA89FEC;
 Mon, 27 Sep 2021 11:42:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610636"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553159076"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 11/13] drm/i915/ttm: make evicted shmem pages visible to
 the shrinker
Date: Mon, 27 Sep 2021 12:41:12 +0100
Message-Id: <20210927114114.152310-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210927114114.152310-1-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
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
pressure, and in the next patch we want to use the shmem backend even
for this case. For this case we lack the usual object mm.pages, which
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

We can optimise this(if needed) by tracking if the object is already
visible to the shrinker(protected by the object lock), so we don't touch
the shrinker LRU more than needed.

v2(Thomas)
  - Handle managing the shrinker LRU in adjust_lru, where it is always
    safe to touch the object.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 29 +++++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 28 +++++++++++++++----
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 1c9a1d8d3434..640dfbf1f01e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -523,6 +523,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
+void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj);
 
 static inline bool cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 0440696f786a..4b6b2bb6f180 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -487,13 +487,12 @@ void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
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
 
@@ -512,6 +511,21 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
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
 
 /**
  * i915_gem_object_make_shrinkable - Move the object to the tail of the
@@ -523,8 +537,8 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
  */
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
 {
-	__i915_gem_object_make_shrinkable(obj,
-					  &obj_to_i915(obj)->mm.shrink_list);
+	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
+	__i915_gem_object_make_shrinkable(obj);
 }
 
 /**
@@ -538,6 +552,7 @@ void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
  */
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj)
 {
-	__i915_gem_object_make_shrinkable(obj,
-					  &obj_to_i915(obj)->mm.purge_list);
+	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
+	___i915_gem_object_make_shrinkable(obj,
+					   &obj_to_i915(obj)->mm.purge_list);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index c7402995a8f9..194e5f1deda8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -749,6 +749,8 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 			return ret;
 	}
 
+	i915_ttm_adjust_lru(obj);
+
 	dst_st = i915_ttm_resource_get_st(obj, dst_mem);
 	if (IS_ERR(dst_st))
 		return PTR_ERR(dst_st);
@@ -856,7 +858,6 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 			return i915_ttm_err_to_gem(ret);
 	}
 
-	i915_ttm_adjust_lru(obj);
 	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
 		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
 		if (ret)
@@ -876,10 +877,10 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 			return PTR_ERR(st);
 
 		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
-		if (!bo->ttm || !i915_tt->is_shmem)
-			i915_gem_object_make_unshrinkable(obj);
 	}
 
+	i915_ttm_adjust_lru(obj);
+
 	return ret;
 }
 
@@ -950,8 +951,6 @@ static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
 	 * If the object is not destroyed next, The TTM eviction logic
 	 * and shrinkers will move it out if needed.
 	 */
-
-	i915_ttm_adjust_lru(obj);
 }
 
 static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
@@ -967,6 +966,17 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	if (!kref_read(&bo->kref))
 		return;
 
+	/*
+	 * Even if we lack mm.pages for this object(which will be the case when
+	 * something is evicted to system memory by TTM), we still want to make
+	 * this object visible to the shrinker, since the underlying ttm_tt
+	 * still has the real shmem pages.
+	 */
+	if (bo->ttm && i915_tt->filp && ttm_tt_is_populated(bo->ttm))
+		__i915_gem_object_make_shrinkable(obj);
+	else
+		i915_gem_object_make_unshrinkable(obj);
+
 	/*
 	 * Put on the correct LRU list depending on the MADV status
 	 */
@@ -1006,6 +1016,14 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 {
 	if (obj->ttm.created) {
+		/*
+		 * We freely manage the shrinker LRU outide of the mm.pages life
+		 * cycle. As a result when destroying the object it's up to us
+		 * to ensure we remove it from the LRU, before we free the
+		 * object.
+		 */
+		i915_gem_object_make_unshrinkable(obj);
+
 		ttm_bo_put(i915_gem_to_ttm(obj));
 	} else {
 		__i915_gem_free_object(obj);
-- 
2.26.3

