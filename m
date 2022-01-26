Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF249CE07
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D90610E937;
	Wed, 26 Jan 2022 15:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434B10E91D;
 Wed, 26 Jan 2022 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210540; x=1674746540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnWmj9FacuPI9GqmZBWOkjKnaNI6dQQzeWchNgLjf0Y=;
 b=KHHIOztMMgX2gMCom5+lwS5ZCMRprIIAEyFMSv+m5GzTMrP9nPwpqFK/
 yvQhD4DZSreVDWFCk9NVGJIPnHsvUzcupVZ5i4F44AtIsX2SLmg7B508M
 Mt1LCC8gke3e7U/opU07e8DnCU4zcXRDBkbwXeepsgg4zJWYD/LKsLTyB
 7fuCdfUTHPbpVtE3apyaBakpSSwENW0nAuUCQJ6YNzBtE5x8vrrJUgjda
 D7pmMgng/ntbDJKYqD0fPIluPnGSUdygZ+EWecY7P25/JvuMTOhdqBYxv
 K760J0uIRRexI8++Bv60STY31dJFAT+cDo5B5AbY9OHL30qJ4VDXgY/db w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885245"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885245"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386287"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:19 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/20] drm/i915/ttm: make eviction mappable aware
Date: Wed, 26 Jan 2022 15:21:47 +0000
Message-Id: <20220126152155.3070602-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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

If we need to make room for some some mappable object, then we should
only victimize objects that have one or pages that occupy the visible
portion of LMEM. Let's also create a new priority hint for objects that
are placed in mappable memory, where we know that CPU access was
requested, that way we hopefully victimize these last.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 65 ++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e4cd6ccf5ab1..8376e4c3d290 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -5,8 +5,10 @@
 
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_buddy.h>
 
 #include "i915_drv.h"
+#include "i915_ttm_buddy_manager.h"
 #include "intel_memory_region.h"
 #include "intel_region_ttm.h"
 
@@ -20,6 +22,7 @@
 #define I915_TTM_PRIO_PURGE     0
 #define I915_TTM_PRIO_NO_PAGES  1
 #define I915_TTM_PRIO_HAS_PAGES 2
+#define I915_TTM_PRIO_NEEDS_CPU_ACCESS 3
 
 /*
  * Size of struct ttm_place vector in on-stack struct ttm_placement allocs
@@ -337,6 +340,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 				       const struct ttm_place *place)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	struct ttm_resource *res = bo->resource;
 
 	if (!obj)
 		return false;
@@ -350,7 +354,48 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 		return false;
 
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
-	return i915_gem_object_evictable(obj);
+	if (!i915_gem_object_evictable(obj))
+		return false;
+
+	switch (res->mem_type) {
+	case TTM_PL_PRIV: {
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
@@ -850,7 +895,23 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
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
+		    !(obj->flags & I915_BO_ALLOC_TOPDOWN))
+			bo->priority = I915_TTM_PRIO_NEEDS_CPU_ACCESS;
+		else
+			bo->priority = I915_TTM_PRIO_HAS_PAGES;
 	}
 
 	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
-- 
2.34.1

