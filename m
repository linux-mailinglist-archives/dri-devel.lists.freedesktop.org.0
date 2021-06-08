Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B6739F48E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 13:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE766EBA4;
	Tue,  8 Jun 2021 11:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B8D6E123;
 Tue,  8 Jun 2021 11:03:34 +0000 (UTC)
IronPort-SDR: AfuDIvWaUHdgtkYU9q3tG9Jrtagf3USmqmQf278hOFSfPGf43AzIkAuomDSumx2u/McFO2xoxm
 ctamzVtAZ2gQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268674763"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268674763"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:31 -0700
IronPort-SDR: u6CwvgIbX6jgOPlWdEqrtUq6SAFsjhFTHufr7AG/zRszy2ma9bPnjemK4Ajm1Qey/8slfO6wzp
 24f5i9y3O6Og==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="552237180"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/i915/ttm: Calculate the object placement at
 get_pages time
Date: Tue,  8 Jun 2021 12:02:50 +0100
Message-Id: <20210608110254.169357-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608110254.169357-1-matthew.auld@intel.com>
References: <20210608110254.169357-1-matthew.auld@intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 69 +++++++++++++++++++++----
 drivers/gpu/drm/i915/intel_region_ttm.c |  8 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h |  2 +
 3 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 9dd6e4f69d53..73d52df8f2be 100644
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
@@ -56,13 +61,6 @@ static const struct ttm_place lmem0_sys_placement_flags[] = {
 	}
 };
 
-static struct ttm_placement i915_lmem0_placement = {
-	.num_placement = 1,
-	.placement = &lmem0_sys_placement_flags[0],
-	.num_busy_placement = 1,
-	.busy_placement = &lmem0_sys_placement_flags[0],
-};
-
 static struct ttm_placement i915_sys_placement = {
 	.num_placement = 1,
 	.placement = &lmem0_sys_placement_flags[1],
@@ -72,6 +70,55 @@ static struct ttm_placement i915_sys_placement = {
 
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
@@ -89,7 +136,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	    man->use_tt)
 		page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_write_combined);
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
+			  i915_ttm_select_tt_caching(obj));
 	if (ret) {
 		kfree(i915_tt);
 		return NULL;
@@ -414,10 +462,13 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
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

