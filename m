Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94287928BB3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AA710EC15;
	Fri,  5 Jul 2024 15:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVTzNnw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA6A10EC18;
 Fri,  5 Jul 2024 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720193552; x=1751729552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4CaczmofBD4rSAxW0ImUhf6jSNtAOm73ciyVdpeW8iU=;
 b=BVTzNnw2WaFBx0EwnU5mwdHRRawgzHb8gmZmysoqT9R4SZre+zEx+Jiw
 6f2iaU7Oj0LlYBk746Hx161Jxm2tEG48cy7cR4dOUQ8FYaO5y7nhvc826
 VVzFCxaJcaLNdL60j41957Vl7bYRCxgMz55Lx92f+LRYdYuRiDwnJMsTe
 3gdKuhzs46cCvQnD6qUTFDJlIIhUkJmMdYLHV1+bm/wqPYy1fNuvPUZnS
 yY8jWJwPNxyLdTH7COvmnYgqY0IqRwjcBoKYfVDhWbYgG+po3vK+ZlJkB
 184HBgDpKTvQPVk8Mrashjxywu8vq3oJZcyRI/re0yhavZEcWGy/ZJdhi A==;
X-CSE-ConnectionGUID: WCbDAKBZS2yZQ6LytPMT8A==
X-CSE-MsgGUID: 52HYQ1DER4Wzl9628eOQmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17622930"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17622930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:32 -0700
X-CSE-ConnectionGUID: fkb+kTZSQuOqUD1z/IRKxg==
X-CSE-MsgGUID: QnSnJ4+SQAK4HRxdXnjZeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="46844980"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 8/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
Date: Fri,  5 Jul 2024 17:32:06 +0200
Message-ID: <20240705153206.68526-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
References: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
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

Make the interface more symmetric by providing and using a
ttm_resource_cursor_init().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  3 ++-
 drivers/gpu/drm/ttm/ttm_bo_util.c  |  4 +++-
 drivers/gpu/drm/ttm/ttm_resource.c | 34 +++++++++++++++++++++---------
 include/drm/ttm/ttm_resource.h     | 12 ++++++-----
 4 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0131ec802066..7fcd9cb0478e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -449,7 +449,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	int ret = 0;
 
 	spin_lock(&bdev->lru_lock);
-	res = ttm_resource_manager_first(man, &cursor);
+	ttm_resource_cursor_init(&cursor, man);
+	res = ttm_resource_manager_first(&cursor);
 	ttm_resource_cursor_fini(&cursor);
 	if (!res) {
 		ret = -ENOENT;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c07f4712d5c..ec6a0482cd94 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -865,7 +865,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 	s64 lret;
 
 	spin_lock(&bdev->lru_lock);
-	ttm_resource_manager_for_each_res(man, &cursor, res) {
+	ttm_resource_cursor_init(&cursor, man);
+	ttm_resource_manager_for_each_res(&cursor, res) {
 		struct ttm_buffer_object *bo = res->bo;
 		bool bo_needs_unlock = false;
 		bool bo_locked = false;
@@ -906,6 +907,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 		ttm_lru_walk_unlock(bo, bo_needs_unlock);
 		ttm_bo_put(bo);
+
 		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
 		progress = (lret < 0) ? lret : progress + lret;
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 6d764ba88aab..b300d615e196 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -80,6 +80,23 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
 		ttm_resource_cursor_clear_bulk(cursor);
 }
 
+/**
+ * ttm_resource_cursor_init() - Initialize a struct ttm_resource_cursor
+ * @cursor: The cursor to initialize.
+ * @man: The resource manager.
+ *
+ * Initialize the cursor before using it for iteration.
+ */
+void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
+			      struct ttm_resource_manager *man)
+{
+	cursor->priority = 0;
+	cursor->man = man;
+	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	INIT_LIST_HEAD(&cursor->bulk_link);
+	INIT_LIST_HEAD(&cursor->hitch.link);
+}
+
 /**
  * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
  * @cursor: The struct ttm_resource_cursor to finalize.
@@ -586,17 +603,16 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
  * Return: The first resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor)
+ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
 {
-	lockdep_assert_held(&man->bdev->lru_lock);
+	struct ttm_resource_manager *man = cursor->man;
 
-	cursor->priority = 0;
-	cursor->man = man;
-	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
-	INIT_LIST_HEAD(&cursor->bulk_link);
-	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
+	if (WARN_ON_ONCE(!man))
+		return NULL;
+
+	lockdep_assert_held(&man->bdev->lru_lock);
 
+	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 	return ttm_resource_manager_next(cursor);
 }
 
@@ -632,8 +648,6 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		ttm_resource_cursor_clear_bulk(cursor);
 	}
 
-	ttm_resource_cursor_fini(cursor);
-
 	return NULL;
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index be034be56ba1..ee0e652328b3 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -30,6 +30,7 @@
 #include <linux/mutex.h>
 #include <linux/iosys-map.h>
 #include <linux/dma-fence.h>
+#include <linux/cleanup.h>
 
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
@@ -325,6 +326,9 @@ struct ttm_resource_cursor {
 	unsigned int priority;
 };
 
+void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
+			      struct ttm_resource_manager *man);
+
 void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
 
 /**
@@ -456,8 +460,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor);
+ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
 struct ttm_resource *
 ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
@@ -466,14 +469,13 @@ ttm_lru_first_res_or_null(struct list_head *head);
 
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
- * @man: the resource manager
  * @cursor: struct ttm_resource_cursor for the current position
  * @res: the current resource
  *
  * Iterate over all the evictable resources in a resource manager.
  */
-#define ttm_resource_manager_for_each_res(man, cursor, res)		\
-	for (res = ttm_resource_manager_first(man, cursor); res;	\
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
-- 
2.44.0

