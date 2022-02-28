Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666E4C6CAE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 13:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367D110E3E5;
	Mon, 28 Feb 2022 12:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5CF10E3E5;
 Mon, 28 Feb 2022 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646051799; x=1677587799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hFyPoifGxwSPsV9DnD1x71Tkbl7ZkhzKFRXT7wpq8Hw=;
 b=I1rzKV9voeUMxt6BiONrY3MbCJ456q+IwlgyzNXf+jcxEhAtWPtNyuFF
 9Phy2ZJ+j2oplal2gAxfj1MFsRgNJtXi3mdsz4C10ldsYezOYYpSyyNix
 Jg9isKuq+NCFM5Bsu3bYT7gSL8KnOEBL7/llY+2f0sxaOHdMolIEOegKp
 4o3BzgqNKm0sWS0QHybO7UfmtJIGWN++7u6Rw2X/tSRuGFGu3WXCCEdqD
 d9G0ACZcoJLfo88IZGJMk2K+QYpJFtruAGQnWR4uYTxK8b+rds/ALs5YB
 MvJ1lOnS4ao/DUGQ0CyGwK/mPoEN80BUyYbFxpouHbRNuGW2w/Hh8saxw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="233490726"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="233490726"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 04:36:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="550218601"
Received: from acroni2x-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 04:36:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 1/4] drm/i915/ttm: make eviction mappable aware
Date: Mon, 28 Feb 2022 12:36:04 +0000
Message-Id: <20220228123607.580432-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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

If we need to make room for some mappable object, then we should
only victimize objects that have one or pages that occupy the visible
portion of LMEM. Let's also create a new priority hint for objects that
are placed in mappable memory, where we know that CPU access was
requested, that way we hopefully victimize these last.

v2(Thomas): s/TTM_PL_PRIV/I915_PL_LMEM0/

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 65 ++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index a13e0204a139..3c2f044b9c6b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -7,8 +7,10 @@
 
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_buddy.h>
 
 #include "i915_drv.h"
+#include "i915_ttm_buddy_manager.h"
 #include "intel_memory_region.h"
 #include "intel_region_ttm.h"
 
@@ -22,6 +24,7 @@
 #define I915_TTM_PRIO_PURGE     0
 #define I915_TTM_PRIO_NO_PAGES  1
 #define I915_TTM_PRIO_HAS_PAGES 2
+#define I915_TTM_PRIO_NEEDS_CPU_ACCESS 3
 
 /*
  * Size of struct ttm_place vector in on-stack struct ttm_placement allocs
@@ -339,6 +342,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 				       const struct ttm_place *place)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	struct ttm_resource *res = bo->resource;
 
 	if (!obj)
 		return false;
@@ -352,7 +356,48 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 		return false;
 
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
-	return i915_gem_object_evictable(obj);
+	if (!i915_gem_object_evictable(obj))
+		return false;
+
+	switch (res->mem_type) {
+	case I915_PL_LMEM0: {
+		struct ttm_resource_manager *man =
+			ttm_manager_type(bo->bdev, res->mem_type);
+		struct i915_ttm_buddy_resource *bman_res =
+			to_ttm_buddy_resource(res);
+		struct drm_buddy *mm = bman_res->mm;
+		struct drm_buddy_block *block;
+
+		if (!place->fpfn && !place->lpfn)
+			return true;
+
+		GEM_BUG_ON(!place->lpfn);
+
+		/*
+		 * If we just want something mappable then we can quickly check
+		 * if the current victim resource is using any of the CPU
+		 * visible portion.
+		 */
+		if (!place->fpfn &&
+		    place->lpfn == i915_ttm_buddy_man_visible_size(man))
+			return bman_res->used_visible_size > 0;
+
+		/* Real range allocation */
+		list_for_each_entry(block, &bman_res->blocks, link) {
+			unsigned long fpfn =
+				drm_buddy_block_offset(block) >> PAGE_SHIFT;
+			unsigned long lpfn = fpfn +
+				(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
+			if (place->fpfn < lpfn && place->lpfn > fpfn)
+				return true;
+		}
+		return false;
+	} default:
+		break;
+	}
+
+	return true;
 }
 
 static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
@@ -852,7 +897,23 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	} else if (!i915_gem_object_has_pages(obj)) {
 		bo->priority = I915_TTM_PRIO_NO_PAGES;
 	} else {
-		bo->priority = I915_TTM_PRIO_HAS_PAGES;
+		struct ttm_resource_manager *man =
+			ttm_manager_type(bo->bdev, bo->resource->mem_type);
+
+		/*
+		 * If we need to place an LMEM resource which doesn't need CPU
+		 * access then we should try not to victimize mappable objects
+		 * first, since we likely end up stealing more of the mappable
+		 * portion. And likewise when we try to find space for a mappble
+		 * object, we know not to ever victimize objects that don't
+		 * occupy any mappable pages.
+		 */
+		if (i915_ttm_cpu_maps_iomem(bo->resource) &&
+		    i915_ttm_buddy_man_visible_size(man) < man->size &&
+		    !(obj->flags & I915_BO_ALLOC_GPU_ONLY))
+			bo->priority = I915_TTM_PRIO_NEEDS_CPU_ACCESS;
+		else
+			bo->priority = I915_TTM_PRIO_HAS_PAGES;
 	}
 
 	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
-- 
2.34.1

