Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA953B0062
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738816E483;
	Tue, 22 Jun 2021 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F109E6E466;
 Tue, 22 Jun 2021 09:34:36 +0000 (UTC)
IronPort-SDR: +P/iBCZg89c1xpKbz9rU6cOgY6DJCk9e6uHo2wO6qaN5ACz+eZ7ZuaRdqhAls9bBrajY8VGgWC
 +AowK35LWsYA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="194159564"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="194159564"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:34:35 -0700
IronPort-SDR: Q9Q8Lw5zDph6t6U4M0UqmuRs6hFebsZLu0N59zwosXOTOGeYvz6M7fC0RSXfqH8nhxlziYJtP+
 8MFG1+G7FLLA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="623410046"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.95])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:34:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 3/3] drm/i915/ttm: Use TTM for system memory
Date: Tue, 22 Jun 2021 11:34:18 +0200
Message-Id: <20210622093418.153400-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
References: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
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

For discrete, use TTM for both cached and WC system memory. That means
we currently rely on the TTM memory accounting / shrinker. For cached
system memory we should consider remaining shmem-backed, which can be
implemented from our ttm_tt_populate callback. We can then also reuse our
own very elaborate shrinker for that memory.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v2:
- Fix IS_ERR_OR_NULL() check to IS_ERR() (Reported by Matthew Auld)
v3:
- Commit message typo fix
v6:
- Fix TODO:s for supporting system memory with TTM.
- Update the object GEM region after a TTM move if compatible.
- Add a couple of warnings for shmem on DGFX.
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 51 +++++++++++++++++-----
 drivers/gpu/drm/i915/i915_drv.h            |  3 --
 drivers/gpu/drm/i915/intel_memory_region.c |  7 ++-
 drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++
 5 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 7aa1c95c7b7d..3648ae1d6628 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -284,6 +284,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 				bool needs_clflush)
 {
 	GEM_BUG_ON(obj->mm.madv == __I915_MADV_PURGED);
+	GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
 
 	if (obj->mm.madv == I915_MADV_DONTNEED)
 		obj->mm.dirty = false;
@@ -302,6 +303,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
 	struct pagevec pvec;
 	struct page *page;
 
+	GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
 	__i915_gem_object_release_shmem(obj, pages, true);
 
 	i915_gem_gtt_finish_pages(obj, pages);
@@ -560,6 +562,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 	resource_size_t offset;
 	int err;
 
+	GEM_WARN_ON(IS_DGFX(dev_priv));
 	obj = i915_gem_object_create_shmem(dev_priv, round_up(size, PAGE_SIZE));
 	if (IS_ERR(obj))
 		return obj;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 966b292d07da..07097f150065 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -286,6 +286,25 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 {
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
+	if (intel_region_to_ttm_type(obj->mm.region) != bo->resource->mem_type) {
+		for (i = 0; i < obj->mm.n_placements; ++i) {
+			struct intel_memory_region *mr = obj->mm.placements[i];
+
+			if (intel_region_to_ttm_type(mr) == bo->resource->mem_type &&
+			    mr != obj->mm.region) {
+				intel_memory_region_put(obj->mm.region);
+				obj->mm.region = intel_memory_region_get(mr);
+			}
+		}
+	}
 
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 
@@ -615,13 +634,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 	/* Move to the requested placement. */
 	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
 
-	/*
-	 * For now we support LMEM only with TTM.
-	 * TODO: Remove with system support
-	 */
-	GEM_BUG_ON(requested.mem_type < I915_PL_LMEM0 ||
-		   busy[0].mem_type < I915_PL_LMEM0);
-
 	/* First try only the requested placement. No eviction. */
 	real_num_busy = fetch_and_zero(&placement.num_busy_placement);
 	ret = ttm_bo_validate(bo, &placement, &ctx);
@@ -635,9 +647,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 		    ret == -EAGAIN)
 			return ret;
 
-		/* TODO: Remove this when we support system as TTM. */
-		real_num_busy = 1;
-
 		/*
 		 * If the initial attempt fails, allow all accepted placements,
 		 * evicting if necessary.
@@ -872,3 +881,25 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 
 	return 0;
 }
+
+static const struct intel_memory_region_ops ttm_system_region_ops = {
+	.init_object = __i915_gem_ttm_object_init,
+};
+
+struct intel_memory_region *
+i915_gem_ttm_system_setup(struct drm_i915_private *i915,
+			  u16 type, u16 instance)
+{
+	struct intel_memory_region *mr;
+
+	mr = intel_memory_region_create(i915, 0,
+					totalram_pages() << PAGE_SHIFT,
+					PAGE_SIZE, 0,
+					type, instance,
+					&ttm_system_region_ops);
+	if (IS_ERR(mr))
+		return mr;
+
+	intel_memory_region_set_name(mr, "system-ttm");
+	return mr;
+}
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 01e11fe38642..bfbfbae57573 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1751,9 +1751,6 @@ void i915_gem_cleanup_userptr(struct drm_i915_private *dev_priv);
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
 
-struct intel_memory_region *i915_gem_shmem_setup(struct drm_i915_private *i915,
-						 u16 type, u16 instance);
-
 static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
 {
 	/*
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index df59f884d37c..779eb2fa90b6 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -173,7 +173,12 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		instance = intel_region_map[i].instance;
 		switch (type) {
 		case INTEL_MEMORY_SYSTEM:
-			mem = i915_gem_shmem_setup(i915, type, instance);
+			if (IS_DGFX(i915))
+				mem = i915_gem_ttm_system_setup(i915, type,
+								instance);
+			else
+				mem = i915_gem_shmem_setup(i915, type,
+							   instance);
 			break;
 		case INTEL_MEMORY_STOLEN_LOCAL:
 			mem = i915_gem_stolen_lmem_setup(i915, type, instance);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 2be8433d373a..b1b9e461d53b 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -125,4 +125,12 @@ intel_memory_region_set_name(struct intel_memory_region *mem,
 int intel_memory_region_reserve(struct intel_memory_region *mem,
 				resource_size_t offset,
 				resource_size_t size);
+
+struct intel_memory_region *
+i915_gem_ttm_system_setup(struct drm_i915_private *i915,
+			  u16 type, u16 instance);
+struct intel_memory_region *
+i915_gem_shmem_setup(struct drm_i915_private *i915,
+		     u16 type, u16 instance);
+
 #endif
-- 
2.31.1

