Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36223A9E37
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FE189CC4;
	Wed, 16 Jun 2021 14:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C53A89D63;
 Wed, 16 Jun 2021 14:53:37 +0000 (UTC)
IronPort-SDR: Qb3UBzJ2sC5xRIkKatYX17H1gwZfCuLsDxlSO753tt0mumdWbNYOKG8jG6TOxSOFBW9pbrHI5S
 OtJcP9674reQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="270039035"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="270039035"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 07:53:35 -0700
IronPort-SDR: fKJo7tM23cG/G4+A9VlBtZ391kvZpZur7IrebPo3tNfi74Nxv5ArY7ck1qrtNZ7tZWtS4NjZ1s
 eQWt4z4mAQTw==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="442903090"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.236.122])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 07:53:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/7] drm/i915/ttm: Calculate the object placement at
 get_pages time
Date: Wed, 16 Jun 2021 15:52:55 +0100
Message-Id: <20210616145259.357146-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210616145259.357146-1-matthew.auld@intel.com>
References: <20210616145259.357146-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Instead of relying on a static placement, calculate at get_pages() time.
This should work for LMEM regions and system for now. For stolen we need
to take preallocated range into account. That well be added later.

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
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 93 ++++++++++++++++++-------
 drivers/gpu/drm/i915/intel_region_ttm.c |  8 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h |  2 +
 3 files changed, 77 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index bf33724bed5c..c67d6d5481b1 100644
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
@@ -42,36 +47,71 @@ struct i915_ttm_tt {
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
@@ -89,7 +129,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	    man->use_tt)
 		page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_write_combined);
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
+			  i915_ttm_select_tt_caching(obj));
 	if (ret) {
 		kfree(i915_tt);
 		return NULL;
@@ -414,10 +455,15 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
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
 
@@ -623,7 +669,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
-
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
 		ttm_bo_type_kernel;
 
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
index e8cf830fda6f..5eedcc397bd5 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -22,6 +22,8 @@ int intel_region_ttm_init(struct intel_memory_region *mem);
 
 void intel_region_ttm_fini(struct intel_memory_region *mem);
 
+int intel_region_to_ttm_type(const struct intel_memory_region *mem);
+
 struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
 					     struct ttm_resource *res);
 
-- 
2.26.3

