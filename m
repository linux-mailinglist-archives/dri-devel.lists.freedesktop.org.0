Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8A399121
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0816EE11;
	Wed,  2 Jun 2021 17:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D216EDD4;
 Wed,  2 Jun 2021 17:08:37 +0000 (UTC)
IronPort-SDR: 6KIkjmw87PQtVQrC3Nq7Sbpt1K4nL7epnRfv0m73brVxOwDFWSU2IQ3eeLr+iEKQ8b5czYriW5
 +oeCGcKcYFZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="225133296"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="225133296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:07:44 -0700
IronPort-SDR: xUtMbYRvyLG/AzvlJXwpRAWGWTqhvQZgYhalomuIMuImn8ihLxS5dDhPIcCgkOe37ex4DSEH6l
 U4fMMEnc/D1g==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="550220249"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:07:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/ttm: Calculate the object placement at get_pages
 time
Date: Wed,  2 Jun 2021 19:07:14 +0200
Message-Id: <20210602170716.280491-4-thomas.hellstrom@linux.intel.com>
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

Instead of relying on a static placement, calculate at get_pages() time.
This should work for LMEM regions and system for now. For stolen we need
to take preallocated range into account. That well be added later.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 92 ++++++++++++++++++-------
 drivers/gpu/drm/i915/intel_region_ttm.c |  8 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h |  2 +
 3 files changed, 75 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index c73c51755c20..8e1c01168c6d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -24,6 +24,11 @@
 #define I915_TTM_PRIO_NO_PAGES  1
 #define I915_TTM_PRIO_HAS_PAGES 2
 
+/*
+ * Size of struct ttm_place vector in on-stack struct ttm_placement allocs
+ */
+#define I915_TTM_MAX_PLACEMENTS 10
+
 /**
  * struct i915_ttm_tt - TTM page vector with additional private information
  * @ttm: The base TTM page vector.
@@ -42,32 +47,18 @@ struct i915_ttm_tt {
 	struct sg_table *cached_st;
 };
 
-static const struct ttm_place lmem0_sys_placement_flags[] = {
-	{
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = I915_PL_LMEM0,
-		.flags = 0,
-	}, {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = I915_PL_SYSTEM,
-		.flags = 0,
-	}
-};
-
-static struct ttm_placement i915_lmem0_placement = {
-	.num_placement = 1,
-	.placement = &lmem0_sys_placement_flags[0],
-	.num_busy_placement = 1,
-	.busy_placement = &lmem0_sys_placement_flags[0],
+static const struct ttm_place sys_placement_flags = {
+	.fpfn = 0,
+	.lpfn = 0,
+	.mem_type = I915_PL_SYSTEM,
+	.flags = 0,
 };
 
 static struct ttm_placement i915_sys_placement = {
 	.num_placement = 1,
-	.placement = &lmem0_sys_placement_flags[1],
+	.placement = &sys_placement_flags,
 	.num_busy_placement = 1,
-	.busy_placement = &lmem0_sys_placement_flags[1],
+	.busy_placement = &sys_placement_flags,
 };
 
 static bool gpu_binds_iomem(struct ttm_resource *mem)
@@ -83,6 +74,55 @@ static bool cpu_maps_iomem(struct ttm_resource *mem)
 
 static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
 
+static enum ttm_caching
+i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
+{
+	/*
+	 * Objects only allowed in system get cached cpu-mappings.
+	 * Other objects get WC mapping for now. Even if in system.
+	 */
+	if (obj->mm.region->type == INTEL_MEMORY_SYSTEM &&
+	    obj->mm.n_placements <= 1)
+		return ttm_cached;
+
+	return ttm_write_combined;
+}
+
+static void
+i915_ttm_place_from_region(const struct intel_memory_region *mr,
+			   struct ttm_place *place)
+{
+	memset(place, 0, sizeof(*place));
+	place->mem_type = intel_region_to_ttm_type(mr);
+}
+
+static void
+i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
+			    struct ttm_place *requested,
+			    struct ttm_place *busy,
+			    struct ttm_placement *placement)
+{
+	unsigned int i;
+	unsigned int num_allowed = obj->mm.n_placements;
+
+	placement->num_placement = 1;
+	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
+				   obj->mm.region, requested);
+
+	/* Cache this on object? */
+	placement->num_busy_placement = num_allowed;
+	for (i = 0; i < placement->num_busy_placement; ++i)
+		i915_ttm_place_from_region(obj->mm.placements[i], busy + i);
+
+	if (num_allowed == 0) {
+		*busy = *requested;
+		placement->num_busy_placement = 1;
+	}
+
+	placement->placement = requested;
+	placement->busy_placement = busy;
+}
+
 static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 					 uint32_t page_flags)
 {
@@ -100,7 +140,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	    man->use_tt)
 		page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_write_combined);
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
+			  i915_ttm_select_tt_caching(obj));
 	if (ret) {
 		kfree(i915_tt);
 		return NULL;
@@ -465,10 +506,13 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 		.no_wait_gpu = false,
 	};
 	struct sg_table *st;
+	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
+	struct ttm_placement placement;
 	int ret;
 
 	/* Move to the requested placement. */
-	ret = ttm_bo_validate(bo, &i915_lmem0_placement, &ctx);
+	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
+	ret = ttm_bo_validate(bo, &placement, &ctx);
 	if (ret)
 		return ret == -ENOSPC ? -ENXIO : ret;
 
@@ -684,7 +728,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
-
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
 		ttm_bo_type_kernel;
 
@@ -708,7 +751,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_ttm_adjust_domains_after_cpu_move(obj);
 	i915_ttm_adjust_gem_after_move(obj);
 	i915_gem_object_unlock(obj);
-
 out:
 	/* i915 wants -ENXIO when out of memory region space. */
 	return (ret == -ENOSPC) ? -ENXIO : ret;
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 0b41a1545570..bc58ea942ef9 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -49,12 +49,16 @@ void intel_region_ttm_device_fini(struct drm_i915_private *dev_priv)
  * driver-private types for now, reserving TTM_PL_VRAM for stolen
  * memory and TTM_PL_TT for GGTT use if decided to implement this.
  */
-static int intel_region_to_ttm_type(struct intel_memory_region *mem)
+int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 {
 	int type;
 
 	GEM_BUG_ON(mem->type != INTEL_MEMORY_LOCAL &&
-		   mem->type != INTEL_MEMORY_MOCK);
+		   mem->type != INTEL_MEMORY_MOCK &&
+		   mem->type != INTEL_MEMORY_SYSTEM);
+
+	if (mem->type == INTEL_MEMORY_SYSTEM)
+		return TTM_PL_SYSTEM;
 
 	type = mem->instance + TTM_PL_PRIV;
 	GEM_BUG_ON(type >= TTM_NUM_MEM_TYPES);
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index eaa3eccfa252..88960ae6cff6 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -27,6 +27,8 @@ struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
 void intel_region_ttm_node_free(struct intel_memory_region *mem,
 				void *node);
 
+int intel_region_to_ttm_type(const struct intel_memory_region *mem);
+
 struct ttm_device_funcs *i915_ttm_driver(void);
 
 #ifdef CONFIG_DRM_I915_SELFTEST
-- 
2.31.1

