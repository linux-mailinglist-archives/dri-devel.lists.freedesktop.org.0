Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A553D7DEBCD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4973910E804;
	Thu,  2 Nov 2023 04:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BC410E7F9;
 Thu,  2 Nov 2023 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899071; x=1730435071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jh8YduMlkBO3fPFoyyIlELlsSlB5g9xW1LHQvAUwav0=;
 b=QsUjQlnUiocY2QcVHJtCFGv9IKmX1/rvb1eplx52LM+VvwJEBxWBzb+R
 OEI9uuu6ViMzd0jvFLcHUqJSjoA8iJyAX3M2OoptxhzTaSmcOcHwcJ9il
 2LTMYhjCM3+IdkHk12osVJrK33VyXUo/vWBKESuLTC2O4XL8fhHAyetlG
 7RFZZCofVWUVyvmEpB7t41fFAshgTO9HZ25jHhqp6jRP2RM1PlRe2kHkt
 XrMESOiHY/S2X4U3SZJv8D0UG1B3dGtRq4fSJc0Cjm1FUqePKIfJRsFi2
 Zxrg1mAI8C0inA9fES9EvrZ4leWZgAffWdkNfAtQwW5s9FLv3gOzPaM1H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930913"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930913"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762622"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762622"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 04/11] drm: Add evict function pointer to drm lru entity
Date: Thu,  2 Nov 2023 00:32:59 -0400
Message-Id: <20231102043306.2931989-5-oak.zeng@intel.com>
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

Drm lru manager provides generic functions to manage lru list,
and function to evict a lru entity. But how to evict an entity
is implemented in an entity's sub-class. This patch introduces
a few function pointers to drm lru entity for this purpose. Those
functions are abstracted from the current ttm resource eviction
process. They need to be tunned in the future when svm code comes
into the picture.

Also implemented a drm_lru_evict_first function to evict the first
lru entity from lru manager. Both ttm and svm codes are supposed
to call this function to evict the first resource from lru list.
This way ttm and svm codes can mutually evict resources from each
other.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_evictable_lru.c | 36 +++++++++++++-
 include/drm/drm_evictable_lru.h     | 74 ++++++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_evictable_lru.c b/drivers/gpu/drm/drm_evictable_lru.c
index 2ba9105cca03..7b62cae2dfea 100644
--- a/drivers/gpu/drm/drm_evictable_lru.c
+++ b/drivers/gpu/drm/drm_evictable_lru.c
@@ -19,13 +19,15 @@ static inline struct drm_lru_mgr *entity_to_mgr(struct drm_lru_entity *entity)
 }
 
 void drm_lru_entity_init(struct drm_lru_entity *entity, struct drm_device *drm,
-			uint32_t mem_type, uint64_t size, uint32_t priority)
+			uint32_t mem_type, uint64_t size, uint32_t priority,
+			struct drm_lru_evict_func *evict_func)
 {
 	entity->drm = drm;
 	entity->mem_type = mem_type;
 	entity->size = size;
 	entity->priority = priority;
 	INIT_LIST_HEAD(&entity->lru);
+	entity->evict_func = evict_func;
 }
 
 /**
@@ -230,3 +232,35 @@ void drm_lru_del_bulk_move(struct drm_lru_entity *entity,
 	}
 }
 EXPORT_SYMBOL(drm_lru_del_bulk_move);
+
+int drm_lru_evict_first(struct drm_lru_mgr *mgr,
+			const struct drm_lru_evict_ctx *evict_ctx)
+{
+	struct drm_lru_entity *entity, *busy_entity = NULL;
+	struct drm_lru_cursor cursor;
+	bool locked = false, busy = false, found = false;
+
+	spin_lock(mgr->lru_lock);
+
+	/* First find a victim to evict*/
+	drm_lru_for_each_entity(mgr, &cursor, entity) {
+		if (!entity->evict_func->evict_allowable(entity,
+			evict_ctx, &busy, &locked)) {
+			if (!busy_entity && busy)
+				busy_entity = entity;
+			continue;
+		}
+		found = true;
+		break;
+	}
+
+	/* We didn't find a victim, but we found a busy entity, i.e.,
+	 * other clients hold a reservation lock of this entity. Try
+	 * to wait and evict this busy entity.
+	 */
+	if (!found && busy_entity)
+		return busy_entity->evict_func->evict_busy_entity(busy_entity, evict_ctx);
+
+	/* If here, we found a victim to evict*/
+	return entity->evict_func->evict_entity(entity, evict_ctx, locked);
+}
diff --git a/include/drm/drm_evictable_lru.h b/include/drm/drm_evictable_lru.h
index 3fd6bd2475d9..7f49964f2f9b 100644
--- a/include/drm/drm_evictable_lru.h
+++ b/include/drm/drm_evictable_lru.h
@@ -15,6 +15,12 @@ struct drm_device;
 #define DRM_MAX_LRU_PRIORITY 4
 #define DRM_NUM_MEM_TYPES 8
 
+struct drm_lru_evict_ctx {
+	void *data1;
+	void *data2;
+	void *data3;
+};
+
 /**
  * struct drm_lru_entity
  *
@@ -23,6 +29,7 @@ struct drm_device;
  * @size: resource size of this entity
  * @priority: The priority of this entity
  * @lru: least recent used list node, see &drm_lru_mgr.lru
+ * @evict_func: functions to evict this entity
  *
  * This structure represents an entity in drm_lru_mgr's
  * list. This structure is supposed to be embedded in
@@ -34,6 +41,7 @@ struct drm_lru_entity {
 	uint64_t size;
 	uint32_t priority;
 	struct list_head lru;
+	struct drm_lru_evict_func *evict_func;
 };
 
 /**
@@ -97,7 +105,67 @@ struct drm_lru_bulk_move {
 	struct drm_lru_bulk_move_range range[DRM_NUM_MEM_TYPES][DRM_MAX_LRU_PRIORITY];
 };
 
+struct drm_lru_evict_func {
+	/**
+	 * evict_allowable
+	 *
+	 * @lru_entity: The struct ttm_resource::lru_entity when this resource is
+	 * added to drm lru list.
+	 * @evict_ctx: eviction context. This is opaque data to drm lru layer. It is
+	 * passed to drm lru layer through drm_lru_evict_first function and drm lru
+	 * layer just pass it back to ttm or svm code by calling some ttm or svm
+	 * callback functions.
+	 * @busy: used to return whether the current resource is busy (i.e., locked
+	 * by other clients)
+	 * @locked: used to return whether this resource is locked during this check,
+	 * i.e., successfully trylocked bo's dma reservation object
+	 *
+	 * Check whether we are allowed to evict a memory resource. Return true if we
+	 * are allowed to evict resource; otherwise false.
+	 *
+	 * When this function returns true, a resource reference counter is hold. This
+	 * reference counter need to be released after evict operation later on.
+	 *
+	 * This function should be called with lru_lock hold.
+	 */
+	bool (*evict_allowable)(struct drm_lru_entity *lru_entity,
+			const struct drm_lru_evict_ctx *evict_ctx,
+			bool *busy, bool *locked);
 
+	/**
+	 * evict_busy_entity
+	 *
+	 * @lru_entity: The struct ttm_resource::lru_entity when this resource is
+	 * added to drm lru list.
+	 * @evict_ctx: eviction context. This is opaque data to drm lru layer. It is
+	 * passed to drm lru layer through drm_lru_evict_first function and drm lru
+	 * layer just pass it back to ttm or svm code by calling some ttm or svm
+	 * callback functions.
+	 *
+	 * Evict a busy memory resource.
+	 * This function should be called with lru_lock hold.
+	 */
+	int (*evict_busy_entity)(struct drm_lru_entity *lru_entity,
+			const struct drm_lru_evict_ctx *evict_ctx);
+
+	/**
+	 * evict_entity
+	 *
+	 * @lru_entity: The struct ttm_resource::lru_entity when this resource is
+	 * added to drm lru list.
+	 * @evict_ctx: eviction context. This is opaque data to drm lru layer. It is
+	 * passed to drm lru layer through drm_lru_evict_first function and drm lru
+	 * layer just pass it back to ttm or svm code by calling some ttm or svm
+	 * callback functions.
+	 * @locked: whether this resource is dma-reserved (if reserved, we need to
+	 * unreserve it in this function)
+	 *
+	 * Evict a memory resource corresponding to a lru_entity. This should be
+	 * called holding lru_lock
+	 */
+	int (*evict_entity)(struct drm_lru_entity *lru_entity,
+			const struct drm_lru_evict_ctx *evict_ctx, bool locked);
+};
 
 /**
  * drm_lru_add_entity
@@ -145,7 +213,8 @@ static inline void drm_lru_mgr_fini(struct drm_lru_mgr *mgr)
 }
 
 void drm_lru_entity_init(struct drm_lru_entity *entity, struct drm_device *drm,
-			uint32_t mem_type, uint64_t size, uint32_t priority);
+			uint32_t mem_type, uint64_t size, uint32_t priority,
+			struct drm_lru_evict_func *evict_func);
 
 struct drm_lru_entity *
 drm_lru_first(struct drm_lru_mgr *mgr, struct drm_lru_cursor *cursor);
@@ -172,6 +241,9 @@ void drm_lru_add_bulk_move(struct drm_lru_entity *entity,
 
 void drm_lru_del_bulk_move(struct drm_lru_entity *entity,
 		struct drm_lru_bulk_move *bulk_move);
+
+int drm_lru_evict_first(struct drm_lru_mgr *mgr,
+			const struct drm_lru_evict_ctx *evict_ctx);
 /**
  * drm_lru_for_each_entity
  *
-- 
2.26.3

