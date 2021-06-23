Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016803B13F3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 08:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079EE89EA6;
	Wed, 23 Jun 2021 06:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CDC89C18;
 Wed, 23 Jun 2021 06:28:50 +0000 (UTC)
IronPort-SDR: e6Rf2pV0fMWmoB9nfjwFS99CFh2utO3RbbLmbsTsSkowcUSHxN6jqXcW52/Z8ymJvoRSh6zOb/
 Szqc1dt5b43g==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="268342193"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="268342193"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 23:28:48 -0700
IronPort-SDR: jxpg3eUYfdVT96C2HOxCJ2cA1mWXDu2zHrEMu8QtzyHy5NYx3GR+6/ITVFacEllC+d6rEDHBC3
 3hwhUZY4orIQ==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="639346885"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.100])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 23:28:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 3/3] drm/i915/ttm: Use TTM for system memory
Date: Wed, 23 Jun 2021 08:28:25 +0200
Message-Id: <20210623062825.417187-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623062825.417187-1-thomas.hellstrom@linux.intel.com>
References: <20210623062825.417187-1-thomas.hellstrom@linux.intel.com>
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

If an object is evicted to a gem allowable region, we will now consider
the object migrated, and we flip the gem region and move the object to a
different region list. Since we are now changing gem regions, we can't
any longer rely on the CONTIGUOUS flag being set based on the region
min page size, so remove that flag update. If we want to reintroduce it,
we need to put it in the mutable flags.

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
v8:
- When changing regions, also move the object to the new region list
  (Reported by Matthew Auld).
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c |  4 --
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 52 +++++++++++++++++-----
 drivers/gpu/drm/i915/i915_drv.h            |  3 --
 drivers/gpu/drm/i915/intel_memory_region.c |  7 ++-
 drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++
 6 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index d1f1840540dd..4925563018b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -13,11 +13,7 @@ void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
 {
 	obj->mm.region = intel_memory_region_get(mem);
 
-	if (obj->base.size <= mem->min_page_size)
-		obj->flags |= I915_BO_ALLOC_CONTIGUOUS;
-
 	mutex_lock(&mem->objects.lock);
-
 	list_add(&obj->mm.region_link, &mem->objects.list);
 	mutex_unlock(&mem->objects.lock);
 }
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
index a1dc592c11bc..3641a6c7b3d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -286,6 +286,26 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
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
+				i915_gem_object_release_memory_region(obj);
+				i915_gem_object_init_memory_region(obj, mr);
+				break;
+			}
+		}
+	}
 
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 
@@ -615,13 +635,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
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
@@ -635,9 +648,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
 		    ret == -EAGAIN)
 			return ret;
 
-		/* TODO: Remove this when we support system as TTM. */
-		real_num_busy = 1;
-
 		/*
 		 * If the initial attempt fails, allow all accepted placements,
 		 * evicting if necessary.
@@ -873,3 +883,25 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 
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

