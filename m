Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D946C4D80B3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 12:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A29689568;
	Mon, 14 Mar 2022 11:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF65810E60F;
 Mon, 14 Mar 2022 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647257351; x=1678793351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2EXcxclK/0tLiPMUsPF1a6Vnn87am9SwJXQr4l2gAPQ=;
 b=E0HxFqlFni57daan/ywhMgAIRXcsE+lNa/jkWpzRVhDd6g5iXQ5AEEtn
 HZ4w0KptjWb1HctTbXQrP9VHZT5mTrPGebw9SzcaZDqRiCIIjsF8I7tUU
 rQPg0xiK9h99HBiaM2BAMmez5n6edVpgZ+PekbMCNI7QGAhGJeyi92FUn
 kT4KxA1jMFAs9+CPdwLnXqjon6WxIR4EPMeLGyzeOEfwHxLUyyE6zUM6F
 3Rap+t45CxRmTJiRj13mt6bH3iQETRCXjjCfrL6QlczsvBrD8iLmWvAqQ
 ATkiWBQMI01DQGSmkMm2G8hcvZ3sexp60tR7KHP7by1mdQSmhNRQM/l1d w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="254830980"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="254830980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="556374348"
Received: from znagyx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/i915/ttm: wire up the object offset
Date: Mon, 14 Mar 2022 11:28:35 +0000
Message-Id: <20220314112837.352931-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314112837.352931-1-matthew.auld@intel.com>
References: <20220314112837.352931-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the ttm backend we can use existing placements fpfn and lpfn to
force the allocator to place the object at the requested offset,
potentially evicting stuff if the spot is currently occupied.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h   |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c        | 18 ++++++++++++++----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c  |  3 ++-
 drivers/gpu/drm/i915/intel_region_ttm.c        |  7 ++++++-
 drivers/gpu/drm/i915/intel_region_ttm.h        |  1 +
 drivers/gpu/drm/i915/selftests/mock_region.c   |  3 +++
 6 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index fd54eb8f4826..2c88bdb8ff7c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -631,6 +631,8 @@ struct drm_i915_gem_object {
 
 		struct drm_mm_node *stolen;
 
+		resource_size_t bo_offset;
+
 		unsigned long scratch;
 		u64 encode;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5e543ed867a2..e4a06fcf741a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -126,6 +126,8 @@ i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
 static void
 i915_ttm_place_from_region(const struct intel_memory_region *mr,
 			   struct ttm_place *place,
+			   resource_size_t offset,
+			   resource_size_t size,
 			   unsigned int flags)
 {
 	memset(place, 0, sizeof(*place));
@@ -133,7 +135,10 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
-	if (mr->io_size && mr->io_size < mr->total) {
+	if (offset != I915_BO_INVALID_OFFSET) {
+		place->fpfn = offset >> PAGE_SHIFT;
+		place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
+	} else if (mr->io_size && mr->io_size < mr->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place->flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
@@ -155,12 +160,14 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 
 	placement->num_placement = 1;
 	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
-				   obj->mm.region, requested, flags);
+				   obj->mm.region, requested, obj->bo_offset,
+				   obj->base.size, flags);
 
 	/* Cache this on object? */
 	placement->num_busy_placement = num_allowed;
 	for (i = 0; i < placement->num_busy_placement; ++i)
-		i915_ttm_place_from_region(obj->mm.placements[i], busy + i, flags);
+		i915_ttm_place_from_region(obj->mm.placements[i], busy + i,
+					   obj->bo_offset, obj->base.size, flags);
 
 	if (num_allowed == 0) {
 		*busy = *requested;
@@ -802,7 +809,8 @@ static int __i915_ttm_migrate(struct drm_i915_gem_object *obj,
 	struct ttm_placement placement;
 	int ret;
 
-	i915_ttm_place_from_region(mr, &requested, flags);
+	i915_ttm_place_from_region(mr, &requested, obj->bo_offset,
+				   obj->base.size, flags);
 	placement.num_placement = 1;
 	placement.num_busy_placement = 1;
 	placement.placement = &requested;
@@ -1159,6 +1167,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 
+	obj->bo_offset = offset;
+
 	/* Don't put on a region list until we're either locked or fully initialized. */
 	obj->mm.region = mem;
 	INIT_LIST_HEAD(&obj->mm.region_link);
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 129f668f21ff..8e4e3f72c1ef 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -71,7 +71,8 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+	if (place->fpfn + bman_res->base.num_pages != place->lpfn &&
+	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
 		unsigned long pages;
 
 		size = roundup_pow_of_two(size);
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 737ef3f4ab54..62ff77445b01 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -12,6 +12,7 @@
 
 #include "intel_region_ttm.h"
 
+#include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h" /* For the funcs/ops export only */
 /**
  * DOC: TTM support structure
@@ -191,6 +192,7 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
  */
 struct ttm_resource *
 intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
+				resource_size_t offset,
 				resource_size_t size,
 				unsigned int flags)
 {
@@ -202,7 +204,10 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
-	if (mem->io_size && mem->io_size < mem->total) {
+	if (offset != I915_BO_INVALID_OFFSET) {
+		place.fpfn = offset >> PAGE_SHIFT;
+		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
+	} else if (mem->io_size && mem->io_size < mem->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index fdee5e7bd46c..cf9d86dcf409 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -36,6 +36,7 @@ struct ttm_device_funcs *i915_ttm_driver(void);
 #ifdef CONFIG_DRM_I915_SELFTEST
 struct ttm_resource *
 intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
+				resource_size_t offset,
 				resource_size_t size,
 				unsigned int flags);
 #endif
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index f16c0b7198c7..670557ce1024 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -26,6 +26,7 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 	int err;
 
 	obj->mm.res = intel_region_ttm_resource_alloc(obj->mm.region,
+						      obj->bo_offset,
 						      obj->base.size,
 						      obj->flags);
 	if (IS_ERR(obj->mm.res))
@@ -71,6 +72,8 @@ static int mock_object_init(struct intel_memory_region *mem,
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &mock_region_obj_ops, &lock_class, flags);
 
+	obj->bo_offset = offset;
+
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
 
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
-- 
2.34.1

