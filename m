Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC06409BD1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 20:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C065A6ECDE;
	Mon, 13 Sep 2021 18:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7A46E216;
 Mon, 13 Sep 2021 18:08:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221792536"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="221792536"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 11:08:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="551796994"
Received: from jpcooney-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 11:08:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 7/8] drm/i915/ttm: make evicted shmem pages visible to the
 shrinker
Date: Mon, 13 Sep 2021 19:06:04 +0100
Message-Id: <20210913180605.2778493-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210913180605.2778493-1-matthew.auld@intel.com>
References: <20210913180605.2778493-1-matthew.auld@intel.com>
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
pressure. For this case we lack the usual object mm.pages, which
effectively hides the pages from the i915-gem shrinker, until we
actually "attach" the TT to the object, or in the case of lmem-only
objects it just gets migrated back to lmem when touched again. For such
cases we can make the object visible as soon as we populate the TT with
shmem pages, and then hide it again when doing the unpopulate.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 29 +++++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 11 ++++++++
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 561d6bd0a5c9..28b831c78c47 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -540,6 +540,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
+void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj);
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj);
 
 static inline bool cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 6b38e4414c5a..02175e8ad069 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -482,13 +482,12 @@ void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
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
 
@@ -507,6 +506,21 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
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
@@ -518,8 +532,8 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
  */
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
 {
-	__i915_gem_object_make_shrinkable(obj,
-					  &obj_to_i915(obj)->mm.shrink_list);
+	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
+	__i915_gem_object_make_shrinkable(obj);
 }
 
 /**
@@ -533,6 +547,7 @@ void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
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
index 08894f6a296b..dbf06a2af8bf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -231,6 +231,15 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
 		ttm->page_flags &= ~TTM_PAGE_FLAG_SWAPPED;
 
+	/*
+	 * Even if we lack mm.pages for this object(which will be the case when
+	 * something is evicted to system memory by TTM), we still want to make
+	 * this object visible to the shrinker, since the underlying ttm_tt
+	 * still has the real shmem pages. When unpopulating the tt(possibly due
+	 * to shrinking) we hide it again from the shrinker.
+	 */
+	__i915_gem_object_make_shrinkable(obj);
+
 	i915_tt->cached_st = st;
 	return 0;
 
@@ -245,6 +254,8 @@ static void i915_ttm_tt_shmem_unpopulate(struct ttm_tt *ttm)
 	struct drm_i915_gem_object *obj = i915_tt->obj;
 	bool backup = i915_tt->backup;
 
+	i915_gem_object_make_unshrinkable(obj);
+
 	if (obj->mm.madv == I915_MADV_DONTNEED) {
 		obj->mm.dirty = false;
 		GEM_BUG_ON(backup);
-- 
2.26.3

