Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B62399124
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1236EE17;
	Wed,  2 Jun 2021 17:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA26B6EDD4;
 Wed,  2 Jun 2021 17:08:37 +0000 (UTC)
IronPort-SDR: ef3tKBVlIFVov8bBW3L9laldWJviRAg0DWbnhZBHoV7MWa3/WsBX0DqNWFzuXpxs7dPumqbq3C
 xqMMIHPh4jdw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="225133309"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="225133309"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:07:47 -0700
IronPort-SDR: wNv1OZCyfIIUYGdKrw1RPGOErYKVVWDfdIfuCwCab+8JdSOw0BaAflRWFlCSKDF1LSr62NaWzI
 pR591XvmQNwA==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="550220271"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:07:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/ttm: Implement object migration
Date: Wed,  2 Jun 2021 19:07:16 +0200
Message-Id: <20210602170716.280491-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement object migration, needed primarily for dma-buf exports of
objects currently residing in LMEM, until we land p2pdma.
There are no users yet of this code.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 100 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  10 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   7 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  51 ++++++++-
 4 files changed, 164 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 07e8ff9a8aae..1589053ea99e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -475,6 +475,106 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj)
 	return obj->mm.n_placements > 1;
 }
 
+bool i915_gem_object_can_migrate_to_region(struct drm_i915_gem_object *obj,
+					   struct intel_memory_region *mr,
+					   unsigned int *placement_index)
+{
+	unsigned int i;
+	unsigned int num_allowed = obj->mm.n_placements;
+
+	if (!i915_gem_object_evictable(obj))
+		return false;
+
+	if (num_allowed == 0 && mr != obj->mm.region)
+		return false;
+
+	if (num_allowed == 1 && mr != obj->mm.placements[0])
+		return false;
+
+	for (i = 0; i < num_allowed; ++i) {
+		if (mr == obj->mm.placements[i]) {
+			if (placement_index)
+				*placement_index = i;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * i915_gem_object_migrate_to_region_lazy - Lazily migrate an object
+ * @obj: The object to migrate.
+ * @mr: The region to migrate to.
+ *
+ * Check that @obj can migrate to @mr, and update all data necessary to
+ * make that happen on the next get_pages(). We sync and unbind gpu bindings
+ * and put pages. The word "lazy" means that the actual migration blit
+ * is not triggered by this function.
+ *
+ * Return: Zero on success, negative error code on failure.
+ */
+int i915_gem_object_migrate_to_region_lazy(struct drm_i915_gem_object *obj,
+					   struct intel_memory_region *mr)
+{
+	unsigned int index;
+	int ret;
+
+	if (obj->mm.region == mr)
+		return 0;
+
+	if (!i915_gem_object_can_migrate_to_region(obj, mr, &index))
+		return -EINVAL;
+
+	ret = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
+	if (ret)
+		return ret;
+
+	ret = __i915_gem_object_put_pages(obj);
+	if (ret)
+		return ret;
+
+	/*
+	 * The next get_pages() will pick up the new desired placement
+	 * and migrate.
+	 */
+	if (obj->mm.override_region) {
+		intel_memory_region_put(obj->mm.override_region);
+		obj->mm.override_region = NULL;
+	}
+
+	if (index != 0)
+		obj->mm.override_region =
+			intel_memory_region_get(obj->mm.placements[index]);
+
+	return 0;
+}
+
+/**
+ * i915_gem_object_migrate_to_region - Migrate an object
+ * @obj: The object to migrate.
+ * @mr: The region to migrate to.
+ *
+ * Check that @obj can migrate to @mr, and migrate the object.
+ * The caller needs to check that the final region was the
+ * desired one since the object may have ended up elsewhere on
+ * lack of space in the desired region, and if there are other
+ * allowed placements.
+ *
+ * Return: Zero on success, negative error code on failure.
+ */
+int i915_gem_object_migrate_to_region(struct drm_i915_gem_object *obj,
+				      struct intel_memory_region *mr)
+{
+	int ret;
+
+	ret = i915_gem_object_migrate_to_region_lazy(obj, mr);
+	if (ret)
+		return ret;
+
+	return ____i915_gem_object_get_pages(obj);
+}
+
 /**
  * i915_gem_object_has_struct_page - Whether the object is page-backed
  * @obj: The object to query.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 23e26f6b1db9..dfab5b080c54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -592,6 +592,16 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj);
 
 bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj);
 
+bool i915_gem_object_can_migrate_to_region(struct drm_i915_gem_object *obj,
+					   struct intel_memory_region *mr,
+					   unsigned int *placement_index);
+
+int i915_gem_object_migrate_to_region_lazy(struct drm_i915_gem_object *obj,
+					   struct intel_memory_region *mr);
+
+int i915_gem_object_migrate_to_region(struct drm_i915_gem_object *obj,
+				      struct intel_memory_region *mr);
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline bool
 i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index fb9ccc3f50e7..d645fa6f4c37 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -264,6 +264,13 @@ struct drm_i915_gem_object {
 		 */
 		struct intel_memory_region *region;
 
+		/**
+		 * Override memory region for this object. Use to
+		 * override the order of the placement list to migrate
+		 * an object to the desired region.
+		 */
+		struct intel_memory_region *override_region;
+
 		/**
 		 * Memory manager node allocated for this object.
 		 */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 42e89bf43708..c798470173e2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -104,19 +104,45 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 {
 	unsigned int i;
 	unsigned int num_allowed = obj->mm.n_placements;
+	struct intel_memory_region *requested_mr;
+	unsigned int swap_index = 0;
 
 	placement->num_placement = 1;
-	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
-				   obj->mm.region, requested);
 
-	/* Cache this on object? */
+	/*
+	 * We migrate by setting the override region to something sensible.
+	 * Warn if the override region is not in the allowed regions list
+	 */
+	if (obj->mm.override_region && !GEM_WARN_ON(!num_allowed)) {
+		requested_mr = obj->mm.override_region;
+		swap_index = num_allowed;
+	} else if (num_allowed) {
+		requested_mr = obj->mm.placements[0];
+	} else {
+		requested_mr = obj->mm.region;
+	}
+	i915_ttm_place_from_region(requested_mr, requested);
+
+	/* In the future we might want to cache the busy list on the object? */
 	placement->num_busy_placement = num_allowed;
-	for (i = 0; i < placement->num_busy_placement; ++i)
+	for (i = 0; i < placement->num_busy_placement; ++i) {
 		i915_ttm_place_from_region(obj->mm.placements[i], busy + i);
+		if (requested_mr == obj->mm.placements[i])
+			swap_index = i;
+	}
+
+	/* Override region was not in placement list. */
+	if (num_allowed && GEM_WARN_ON(swap_index == num_allowed)) {
+		swap_index = 0;
+		i915_ttm_place_from_region(obj->mm.placements[0], requested);
+	}
 
 	if (num_allowed == 0) {
 		*busy = *requested;
 		placement->num_busy_placement = 1;
+	} else if (swap_index != 0) {
+		/* Put the override placement highest in the busy list */
+		swap(busy[0], busy[swap_index]);
 	}
 
 	placement->placement = requested;
@@ -246,6 +272,23 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	unsigned int cache_level;
+	unsigned int i;
+
+	/*
+	 * If object was moved to an allowable region, update the object
+	 * region to consider it migrated. Note that if it's currently not
+	 * in an allowable region, it's evicted and we don't update the
+	 * object region.
+	 */
+	for (i = 0; i < obj->mm.n_placements; ++i) {
+		struct intel_memory_region *mr = obj->mm.placements[i];
+
+		if (intel_region_to_ttm_type(mr) == bo->mem.mem_type &&
+		    mr != obj->mm.region) {
+			intel_memory_region_put(obj->mm.region);
+			obj->mm.region = intel_memory_region_get(mr);
+		}
+	}
 
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 
-- 
2.31.1

