Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E7857D64
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1035388F94;
	Fri, 16 Feb 2024 13:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMroCgxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451B310EB57;
 Fri, 16 Feb 2024 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708089207; x=1739625207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dqKY0cZBO0WFra0o+6LiJ7QTPzxiA2cnYG/KjRBiy0I=;
 b=XMroCgxTjdKocUvfsac6x8yDUbzZLXicFmI7Oq5xtL5Uf4nW9R9Xp1RW
 s7gMh0Pc2GxucJKzJiLaZ+YaaK0HdluCpo1uqBnkCzs+KgSvit6v4uz5m
 E4ws0lFt4BFSWHjNe2tnkvu0aIVSwBQI+LmTHGA7nHQPOyRPzN6aqGOw0
 4xbIWT3AHaBLgDpvM2+BwsjhA/ydBByHgGT0ems8HXHrH0lLAT2v+lp53
 eLOqi6yLtPe0itlgkw6HKtoT492xeNDiBjl1vHsK2ukf+ITJjgRw0jX3H
 8vbDHJGB8IQGGXX/BMci9dHF5qoLeUhvf9oRXe+A1zOOgi8359jlU1qCx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2328532"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2328532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="8504793"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:13:25 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@list.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/ttm: Use LRU hitches
Date: Fri, 16 Feb 2024 14:13:04 +0100
Message-ID: <20240216131306.101932-3-thomas.hellstrom@linux.intel.com>
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

Have iterators insert themselves into the list they are iterating
over using hitch list nodes. Since only the iterator owner
can remove these list nodes from the list, it's safe to unlock
the list and when continuing, use them as a starting point. Due to
the way LRU bumping works in TTM, newly added items will not be
missed, and bumped items will be iterated over a second time before
reaching the end of the list.

The exception is list with bulk move sublists. When bumping a
sublist, a hitch that is part of that sublist will also be moved
and we might miss items if restarting from it. This will be
addressed in a later patch.

Cc: Christian König <christian.koenig@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
 drivers/gpu/drm/ttm/ttm_device.c   |  9 ++-
 drivers/gpu/drm/ttm/ttm_resource.c | 94 ++++++++++++++++++++----------
 include/drm/ttm/ttm_resource.h     | 16 +++--
 4 files changed, 82 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 96a724e8f3ff..2a048b940840 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -622,6 +622,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		if (locked)
 			dma_resv_unlock(res->bo->base.resv);
 	}
+	ttm_resource_cursor_fini_locked(&cursor);
 
 	if (!bo) {
 		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index f27406e851e5..e8a6a1dab669 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -169,12 +169,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			num_pages = PFN_UP(bo->base.size);
 			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
 			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret)
+			if (!ret) {
+				ttm_resource_cursor_fini(&cursor);
 				return num_pages;
-			if (ret != -EBUSY)
+			}
+			if (ret != -EBUSY) {
+				ttm_resource_cursor_fini(&cursor);
 				return ret;
+			}
 		}
 	}
+	ttm_resource_cursor_fini_locked(&cursor);
 	spin_unlock(&bdev->lru_lock);
 	return 0;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 0b8beb356b8a..911364e0a5fd 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -32,6 +32,37 @@
 
 #include <drm/drm_util.h>
 
+/**
+ * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
+ * @cursor: The struct ttm_resource_cursor to finalize.
+ *
+ * The function pulls the LRU list cursor off any lists it was previusly
+ * attached to. Needs to be called with the LRU lock held. The function
+ * can be called multiple times after eachother.
+ */
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
+{
+	lockdep_assert_held(&cursor->man->bdev->lru_lock);
+	list_del_init(&cursor->hitch.link);
+}
+
+/**
+ * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
+ * @cursor: The struct ttm_resource_cursor to finalize.
+ *
+ * The function pulls the LRU list cursor off any lists it was previusly
+ * attached to. Needs to be called without the LRU list lock held. The
+ * function can be called multiple times after eachother.
+ */
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
+{
+	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
+
+	spin_lock(lru_lock);
+	ttm_resource_cursor_fini_locked(cursor);
+	spin_unlock(lru_lock);
+}
+
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
  * @bulk: the structure to init
@@ -475,62 +506,63 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
 /**
- * ttm_resource_manager_first
- *
- * @man: resource manager to iterate over
+ * ttm_resource_manager_next() - Continue iterating over the resource manager
+ * resources
  * @cursor: cursor to record the position
  *
- * Returns the first resource from the resource manager.
+ * Return: The next resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor)
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 {
+	struct ttm_resource_manager *man = cursor->man;
 	struct ttm_lru_item *lru;
 
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
+	do {
+		lru = &cursor->hitch;
+		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru)) {
+				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
+			}
 		}
 
+		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
+			break;
+
+		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+	} while (true);
+
+	list_del_init(&cursor->hitch.link);
+
 	return NULL;
 }
 
 /**
- * ttm_resource_manager_next
- *
+ * ttm_resource_manager_first() - Start iterating over the resources
+ * of a resource manager
  * @man: resource manager to iterate over
  * @cursor: cursor to record the position
- * @res: the current resource pointer
  *
- * Returns the next resource from the resource manager.
+ * Initializes the cursor and starts iterating. When done iterating,
+ * the caller must explicitly call ttm_resource_cursor_fini().
+ *
+ * Return: The first resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res)
+ttm_resource_manager_first(struct ttm_resource_manager *man,
+			   struct ttm_resource_cursor *cursor)
 {
-	struct ttm_lru_item *lru = &res->lru;
-
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
-		if (ttm_lru_item_is_res(lru))
-			return ttm_lru_item_to_res(lru);
-	}
+	cursor->priority = 0;
+	cursor->man = man;
+	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 
-	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
-				ttm_lru_item_to_res(lru);
-		}
-
-	return NULL;
+	return ttm_resource_manager_next(cursor);
 }
 
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 527140579ab5..7fdb9d32371b 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -271,15 +271,23 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 
 /**
  * struct ttm_resource_cursor
- *
+ * @man: The resource manager currently being iterated over
+ * @hitch: A hitch list node inserted before the next resource
+ * to iterate over.
  * @priority: the current priority
  *
  * Cursor to iterate over the resources in a manager.
  */
 struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct ttm_lru_item hitch;
 	unsigned int priority;
 };
 
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
+
 /**
  * struct ttm_lru_bulk_move_pos
  *
@@ -434,9 +442,7 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor);
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res);
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
@@ -448,7 +454,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
  */
 #define ttm_resource_manager_for_each_res(man, cursor, res)		\
 	for (res = ttm_resource_manager_first(man, cursor); res;	\
-	     res = ttm_resource_manager_next(man, cursor, res))
+	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
-- 
2.43.0

