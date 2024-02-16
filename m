Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA5857D65
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5BE10E08E;
	Fri, 16 Feb 2024 13:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT4cqPvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41A810EB57;
 Fri, 16 Feb 2024 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708089209; x=1739625209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sf1130kQEcFahWCYwsRUqvpb708HgfyNexfW0cLqv5k=;
 b=IT4cqPvhXQWne3ZCdCX9PcyXmIo5yX+sjFdjv3Cd5g9rePJR4RnMdfpP
 rEYojwZcuXtA3uXAco9yPgtZG+uavSJZetndh80IDHZRG+L9Uf52cpYNk
 51+SU4hqMhUQp8Ia+u888J0m6UXXDIFBsKr4a0Ug0qHyzVQap9EzyIDpC
 DifsVrcrgukXLKJLNXzaR2GHrWy/+Lm0R73CkBIS5mdjWeyY2os7ATwUv
 SIxlYE6myoeu4bc/S/F1iLsXlYBsrCKTQymFiOL0Jyq5sJSce01jJEbAX
 2IJU6G4wn/I0Uqvq7+YvVRWEupgYKnQeu0Zf91MM2/nciQxqAn0IfgB1/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2328536"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2328536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="8504795"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:13:27 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@list.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/ttm: Consider hitch moves within bulk sublist moves
Date: Fri, 16 Feb 2024 14:13:05 +0100
Message-ID: <20240216131306.101932-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To work around the problem with hitches moving when bulk move
sublists are bumped, keep a second hitch when traversing a bulk
move sublist, which is attached to the list *after* the bulk
move sublist. If we detect a sublist bump, we use that second
hitch as the continuation point of list traversal.

Sublist bumps are detected by checking the sublist age which is
increased by 1 each time it was bumped. The age is then compared
to that of the last iteration returning an item within the sublist.

Cc: Christian König <christian.koenig@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 64 +++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_resource.h     | 50 +++++++++++++----------
 2 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 911364e0a5fd..3139c27c9262 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -32,6 +32,14 @@
 
 #include <drm/drm_util.h>
 
+/* Detach the cursor's bulk hitch from the LRU list */
+static void
+ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
+{
+	cursor->bulk = NULL;
+	list_del_init(&cursor->bulk_hitch.link);
+}
+
 /**
  * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
  * @cursor: The struct ttm_resource_cursor to finalize.
@@ -44,6 +52,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
 {
 	lockdep_assert_held(&cursor->man->bdev->lru_lock);
 	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_clear_bulk(cursor);
 }
 
 /**
@@ -104,6 +113,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 					    &pos->last->lru.link);
 		}
 	}
+	bulk->age++;
 }
 EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
 
@@ -505,6 +515,54 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
+/* Adjust to a bulk sublist being bumped while traversing it.*/
+static bool
+ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
+			       struct ttm_lru_item *next_lru)
+{
+	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
+	struct ttm_lru_bulk_move *bulk = NULL;
+	struct ttm_buffer_object *bo = next->bo;
+
+	lockdep_assert_held(&cursor->man->bdev->lru_lock);
+	if (bo && bo->resource == next)
+		bulk = bo->bulk_move;
+
+	if (!bulk) {
+		ttm_resource_cursor_clear_bulk(cursor);
+		return false;
+	}
+
+	/*
+	 * We encountered a bulk sublist. Record its age and
+	 * set a hitch after the sublist.
+	 */
+	if (cursor->bulk != bulk) {
+		struct ttm_lru_bulk_move_pos *pos =
+			ttm_lru_bulk_move_pos(bulk, next);
+
+		cursor->bulk = bulk;
+		cursor->bulk_age = &bulk->age;
+		list_move(&cursor->bulk_hitch.link, &pos->last->lru.link);
+		return false;
+	}
+
+	/* Continue iterating down the bulk sublist */
+	if (cursor->bulk_age == &bulk->age)
+		return false;
+
+	/*
+	 * The bulk sublist in which we had a hitch has moved and the
+	 * hitch moved with it. Restart iteration from a previously
+	 * set hitch after the bulk_move, and remove that backup
+	 * hitch.
+	 */
+	list_move(&cursor->hitch.link, &cursor->bulk_hitch.link);
+	ttm_resource_cursor_clear_bulk(cursor);
+
+	return true;
+}
+
 /**
  * ttm_resource_manager_next() - Continue iterating over the resource manager
  * resources
@@ -524,6 +582,8 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		lru = &cursor->hitch;
 		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
 			if (ttm_lru_item_is_res(lru)) {
+				if (ttm_resource_cursor_check_bulk(cursor, lru))
+					continue;
 				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
 			}
@@ -533,9 +593,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 			break;
 
 		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+		ttm_resource_cursor_clear_bulk(cursor);
 	} while (true);
 
-	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_fini_locked(cursor);
 
 	return NULL;
 }
@@ -560,6 +621,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 	cursor->priority = 0;
 	cursor->man = man;
 	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	ttm_lru_item_init(&cursor->bulk_hitch, TTM_LRU_HITCH);
 	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 
 	return ttm_resource_manager_next(cursor);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 7fdb9d32371b..432a93d0f789 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -269,25 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 	return container_of(item, struct ttm_resource, lru);
 }
 
-/**
- * struct ttm_resource_cursor
- * @man: The resource manager currently being iterated over
- * @hitch: A hitch list node inserted before the next resource
- * to iterate over.
- * @priority: the current priority
- *
- * Cursor to iterate over the resources in a manager.
- */
-struct ttm_resource_cursor {
-	struct ttm_resource_manager *man;
-	struct ttm_lru_item hitch;
-	unsigned int priority;
-};
-
-void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
-
-void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
-
 /**
  * struct ttm_lru_bulk_move_pos
  *
@@ -303,16 +284,45 @@ struct ttm_lru_bulk_move_pos {
 
 /**
  * struct ttm_lru_bulk_move
- *
  * @pos: first/last lru entry for resources in the each domain/priority
+ * @age: The number of times the bulk sublists were bumped, (moved to
+ * the LRU list tail). Protected by the lru_lock.
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
  */
 struct ttm_lru_bulk_move {
 	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
+	u64 age;
 };
 
+/**
+ * struct ttm_resource_cursor
+ * @man: The resource manager currently being iterated over
+ * @hitch: A hitch list node inserted before the next resource
+ * to iterate over.
+ * @bulk_hitch: A hitch list node inserted before the next
+ * resource to iterate over if the bulk sublist @hitch was
+ * inserted in is bumped.
+ * @bulk_age: The age of @bulk when @bulk_hitch was inserted.
+ * Used to detect whether @bulk was bumped since last iteration.
+ * @priority: the current priority
+ *
+ * Cursor to iterate over the resources in a manager.
+ */
+struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct ttm_lru_item hitch;
+	struct ttm_lru_item bulk_hitch;
+	struct ttm_lru_bulk_move *bulk;
+	u64 bulk_age;
+	unsigned int priority;
+};
+
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
+
 /**
  * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
  * struct sg_table backed struct ttm_resource.
-- 
2.43.0

