Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617687DEBC9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389310E80C;
	Thu,  2 Nov 2023 04:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D110E800;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxC2nAobvtmH45pcWnnEyOv5q+f4BZEE/xT/CeWnvo8=;
 b=DQtDAdtHi2OdTsWT0MeDfiHrR1pYM8fLYFQu2O/8SaSaCmB1MuQglJLA
 mWiQXCV/Wru6dwYcvFCBOKes8dY5vt55r2lKXuj+1BfA5olak4hTpsiOu
 JCTzLIhLRQtpajOoK1r+vvh4FTHJUymRwwro8K6HGCHGRThctp1vKNLo1
 TwuvUVG8/FAWKWqzYMO7LHtPgodLtfv8XLmaiIOJMFI1i0vQNeMBoT+ap
 le3aFgh8I1msh/PEMfiqnYjg/Pj9DeTdK7v6hsuswX1TrQBkxzLqPYY02
 JnZtOx4LMxB31BlLFbnEoHkLMGk3BX8nmuc3mgw5GepD7YQ5jOuLQPLk0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930930"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930930"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762639"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762639"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 09/11] drm/ttm: Use drm LRU manager iterator
Date: Thu,  2 Nov 2023 00:33:04 -0400
Message-Id: <20231102043306.2931989-10-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
MIME-Version: 1.0
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since TTM resource LRU list is moved to drm LRU manager layer,
use drm lru manager iterator instead of TTM resource manager
iterator. TTM resource manager iterator is deleted. No function
change.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  7 ++--
 drivers/gpu/drm/ttm/ttm_device.c   | 10 ++++--
 drivers/gpu/drm/ttm/ttm_resource.c | 51 ------------------------------
 include/drm/ttm/ttm_resource.h     | 33 ++-----------------
 4 files changed, 14 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 26e0555bad0c..4a5ffa920665 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -43,6 +43,7 @@
 #include <linux/module.h>
 #include <linux/atomic.h>
 #include <linux/dma-resv.h>
+#include <drm/drm_evictable_lru.h>
 
 #include "ttm_module.h"
 
@@ -593,15 +594,17 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ww_acquire_ctx *ticket)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
-	struct ttm_resource_cursor cursor;
+	struct drm_lru_cursor cursor;
 	struct ttm_resource *res;
+	struct drm_lru_entity *entity;
 	bool locked = false;
 	int ret;
 
 	spin_lock(bdev->lru_lock);
-	ttm_resource_manager_for_each_res(man, &cursor, res) {
+	drm_lru_for_each_entity(man->lru_mgr, &cursor, entity) {
 		bool busy;
 
+		res = container_of(entity, struct ttm_resource, lru_entity);
 		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
 						    &locked, &busy)) {
 			if (busy && !busy_bo && ticket !=
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 393c3e27016e..881662d69aba 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -33,6 +33,7 @@
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_evictable_lru.h>
 
 #include "ttm_module.h"
 
@@ -141,7 +142,8 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
 {
-	struct ttm_resource_cursor cursor;
+	struct drm_lru_cursor cursor;
+	struct drm_lru_entity *entity;
 	struct ttm_resource_manager *man;
 	struct ttm_resource *res;
 	unsigned i;
@@ -153,10 +155,12 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		if (!man || !man->use_tt)
 			continue;
 
-		ttm_resource_manager_for_each_res(man, &cursor, res) {
-			struct ttm_buffer_object *bo = res->bo;
+		drm_lru_for_each_entity(man->lru_mgr, &cursor, entity) {
+			struct ttm_buffer_object *bo;
 			uint32_t num_pages;
 
+			res = container_of(entity, struct ttm_resource, lru_entity);
+			bo = res->bo;
 			if (!bo || bo->resource != res)
 				continue;
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 05eef866065e..0c6e0dbeff07 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -488,57 +488,6 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
-/**
- * ttm_resource_manager_first
- *
- * @man: resource manager to iterate over
- * @cursor: cursor to record the position
- *
- * Returns the first resource from the resource manager.
- */
-struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor)
-{
-	struct ttm_resource *res;
-
-	lockdep_assert_held(man->bdev->lru_lock);
-
-	for (cursor->priority = 0; cursor->priority < DRM_MAX_LRU_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(res, &man->lru[cursor->priority], lru)
-			return res;
-
-	return NULL;
-}
-
-/**
- * ttm_resource_manager_next
- *
- * @man: resource manager to iterate over
- * @cursor: cursor to record the position
- * @res: the current resource pointer
- *
- * Returns the next resource from the resource manager.
- */
-struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res)
-{
-	lockdep_assert_held(man->bdev->lru_lock);
-
-	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
-		return res;
-
-	for (++cursor->priority; cursor->priority < DRM_MAX_LRU_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(res, &man->lru[cursor->priority], lru)
-			return res;
-
-	return NULL;
-}
-
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
 					  struct iosys_map *dmap,
 					  pgoff_t i)
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index e4fc1ada5236..c2528cec12e6 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -207,6 +207,7 @@ struct ttm_bus_placement {
  * @placement: Placement flags.
  * @bus: Placement on io bus accessible to the CPU
  * @bo: weak reference to the BO, protected by ttm_device::lru_lock
+ * @lru_entity: lru entity for this ttm resource.
  *
  * Structure indicating the placement and space resources used by a
  * buffer object.
@@ -223,17 +224,7 @@ struct ttm_resource {
 	 * @lru: Least recently used list, see &ttm_resource_manager.lru
 	 */
 	struct list_head lru;
-};
-
-/**
- * struct ttm_resource_cursor
- *
- * @priority: the current priority
- *
- * Cursor to iterate over the resources in a manager.
- */
-struct ttm_resource_cursor {
-	unsigned int priority;
+	struct drm_lru_entity lru_entity;
 };
 
 /**
@@ -402,26 +393,6 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
 void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
-struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor);
-struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res);
-
-/**
- * ttm_resource_manager_for_each_res - iterate over all resources
- * @man: the resource manager
- * @cursor: struct ttm_resource_cursor for the current position
- * @res: the current resource
- *
- * Iterate over all the evictable resources in a resource manager.
- */
-#define ttm_resource_manager_for_each_res(man, cursor, res)		\
-	for (res = ttm_resource_manager_first(man, cursor); res;	\
-	     res = ttm_resource_manager_next(man, cursor, res))
-
 struct ttm_kmap_iter *
 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
 			 struct io_mapping *iomap,
-- 
2.26.3

