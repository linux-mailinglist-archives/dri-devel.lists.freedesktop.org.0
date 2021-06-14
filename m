Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A663A6618
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 13:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F08589D73;
	Mon, 14 Jun 2021 11:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A7389D56;
 Mon, 14 Jun 2021 11:54:23 +0000 (UTC)
IronPort-SDR: qM7iBEH4D4r9OBUdR4LxTHomA53d0ebDk1tUGmtBstNGkaWsE3TvZbdW3uw9mXZPKfHTkumJPX
 VGZgoNR8tJhg==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="185490616"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="185490616"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 04:54:22 -0700
IronPort-SDR: lCYdhFYHGx6Ss5eEr42Wr+ftEgWAGwFlTodaJhTHJhc9S9+dOZnw8A0OheogODyiCkdMrPvPdf
 uCPYDboFbcgA==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="451570255"
Received: from janlundk-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 04:54:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/i915/ttm: Calculate the object placement at
 get_pages time
Date: Mon, 14 Jun 2021 13:54:05 +0200
Message-Id: <20210614115406.153107-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614115406.153107-1-thomas.hellstrom@linux.intel.com>
References: <20210614115406.153107-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of relying on a static placement, calculate at get_pages() time.
This should work for LMEM regions and system for now. For stolen we need
to take preallocated range into account. That will if needed be added
later.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v2:
- Fixed a style issue (Reported by Matthew Auld)
v3:
- Make sure we don't add more placements to the stack-allocated vector
  than there is room for. (Reported by Matthew Auld)
v4:
- Remove confusion around shrinkable objects (Reported by Matthew Auld)
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 95 ++++++++++++++++++-------
 drivers/gpu/drm/i915/intel_region_ttm.c |  8 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h |  2 +
 3 files changed, 77 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5176682a7d19..1c45f9c87946 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -24,6 +24,11 @@
 #define I915_TTM_PRIO_NO_PAGES  1
 #define I915_TTM_PRIO_HAS_PAGES 2
 
+/*
+ * Size of struct ttm_place vector in on-stack struct ttm_placement allocs
+ */
+#define I915_TTM_MAX_PLACEMENTS INTEL_REGION_UNKNOWN
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
+	unsigned int num_allowed = obj->mm.n_placements;
+	unsigned int i;
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
@@ -464,10 +505,15 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 		.no_wait_gpu = false,
 	};
 	struct sg_table *st;
+	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
+	struct ttm_placement placement;
 	int ret;
 
+	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
+
 	/* Move to the requested placement. */
-	ret = ttm_bo_validate(bo, &i915_lmem0_placement, &ctx);
+	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
+	ret = ttm_bo_validate(bo, &placement, &ctx);
 	if (ret)
 		return ret == -ENOSPC ? -ENXIO : ret;
 
@@ -621,7 +667,6 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
 
 const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
-	.flags = I915_GEM_OBJECT_IS_SHRINKABLE,
 
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
@@ -683,7 +728,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
-
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
 		ttm_bo_type_kernel;
 
@@ -707,7 +751,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_ttm_adjust_domains_after_cpu_move(obj);
 	i915_ttm_adjust_gem_after_move(obj);
 	i915_gem_object_unlock(obj);
-
 out:
 	/* i915 wants -ENXIO when out of memory region space. */
 	return (ret == -ENOSPC) ? -ENXIO : ret;
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 27fe0668d094..5a664f6cc93f 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -50,12 +50,16 @@ void intel_region_ttm_device_fini(struct drm_i915_private *dev_priv)
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
index e8cf830fda6f..649491844e79 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -28,6 +28,8 @@ struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
 void intel_region_ttm_node_free(struct intel_memory_region *mem,
 				struct ttm_resource *node);
 
+int intel_region_to_ttm_type(const struct intel_memory_region *mem);
+
 struct ttm_device_funcs *i915_ttm_driver(void);
 
 #ifdef CONFIG_DRM_I915_SELFTEST
-- 
2.31.1

