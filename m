Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B058A67C2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4776410EF59;
	Tue, 16 Apr 2024 10:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+7WJkjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B128210E063;
 Tue, 16 Apr 2024 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713262117; x=1744798117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFlz2C22//vD/Qnr7rzww/FZXd+EiBu5Zv8/ldPGKDE=;
 b=M+7WJkjWggpE5c02SPWJxCcL4RZF4bJgUxaSKlBgQwEJi48IC2qx0gk6
 bhwtSwFDhCx2qbssOuvCyW3JOuzTiv00B40NVpW9A93jI6BF3n+oINH+H
 T+HsXmnnVG0pGMcuMEs7v+gPZC3QofKzvjfmh0S0KyR9Fv1Rol6NtjQZO
 UJf6PhV0S5vX6UeJIxlXOMDkcC4RgRPfsk0qGk3ad9bQWhsD5APrfbVJ8
 f0fcE9LJ0QbQm1gn43/7VIO8aW6Yr9EOf7oT2+mqB2SJK0Wm8NqierlOr
 5EPHYVdfaw6ew2hmqwaOLw6zADu53SLsbJuwskjz2YLj/xsri7Trh4CJn Q==;
X-CSE-ConnectionGUID: 2tP5yrJTR+6zfzwqlDHeTQ==
X-CSE-MsgGUID: XsiMPZCRQYKsTqdWdNOxSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20112363"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="20112363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:37 -0700
X-CSE-ConnectionGUID: kigCwgSQSgqXMsyCEQ8mQg==
X-CSE-MsgGUID: YTDvp0yfQYaVnttOSxaggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22620276"
Received: from fcgoea-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/9] drm/ttm: Allow TTM LRU list nodes of different types
Date: Tue, 16 Apr 2024 12:07:22 +0200
Message-ID: <20240416100730.6666-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

To be able to handle list unlocking while traversing the LRU
list, we want the iterators not only to point to the next
position of the list traversal, but to insert themselves as
list nodes at that point to work around the fact that the
next node might otherwise disappear from the list while
the iterator is pointing to it.

These list nodes need to be easily distinguishable from other
list nodes so that others traversing the list can skip
over them.

So declare a struct ttm_lru_item, with a struct list_head member
and a type enum. This will slightly increase the size of a
struct ttm_resource.

Changes in previous series:
- Update enum ttm_lru_item_type documentation.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c   | 13 ++++--
 drivers/gpu/drm/ttm/ttm_resource.c | 70 ++++++++++++++++++++++--------
 include/drm/ttm/ttm_resource.h     | 51 +++++++++++++++++++++-
 3 files changed, 110 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 76027960054f..f27406e851e5 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -270,17 +270,22 @@ EXPORT_SYMBOL(ttm_device_fini);
 static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 					      struct list_head *list)
 {
-	struct ttm_resource *res;
+	struct ttm_lru_item *lru;
 
 	spin_lock(&bdev->lru_lock);
-	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
-		struct ttm_buffer_object *bo = res->bo;
+	while ((lru = list_first_entry_or_null(list, typeof(*lru), link))) {
+		struct ttm_buffer_object *bo;
+
+		if (!ttm_lru_item_is_res(lru))
+			continue;
+
+		bo = ttm_lru_item_to_res(lru)->bo;
 
 		/* Take ref against racing releases once lru_lock is unlocked */
 		if (!ttm_bo_get_unless_zero(bo))
 			continue;
 
-		list_del_init(&res->lru);
+		list_del_init(&bo->resource->lru.link);
 		spin_unlock(&bdev->lru_lock);
 
 		if (bo->ttm)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index be8d286513f9..7aa5ca5c0e33 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -69,8 +69,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 			dma_resv_assert_held(pos->last->bo->base.resv);
 
 			man = ttm_manager_type(pos->first->bo->bdev, i);
-			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
-					    &pos->last->lru);
+			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
+					    &pos->last->lru.link);
 		}
 	}
 }
@@ -83,14 +83,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
 	return &bulk->pos[res->mem_type][res->bo->priority];
 }
 
+/* Return the previous resource on the list (skip over non-resource list items) */
+static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource *cur)
+{
+	struct ttm_lru_item *lru = &cur->lru;
+
+	do {
+		lru = list_prev_entry(lru, link);
+	} while (!ttm_lru_item_is_res(lru));
+
+	return ttm_lru_item_to_res(lru);
+}
+
+/* Return the next resource on the list (skip over non-resource list items) */
+static struct ttm_resource *ttm_lru_next_res(struct ttm_resource *cur)
+{
+	struct ttm_lru_item *lru = &cur->lru;
+
+	do {
+		lru = list_next_entry(lru, link);
+	} while (!ttm_lru_item_is_res(lru));
+
+	return ttm_lru_item_to_res(lru);
+}
+
 /* Move the resource to the tail of the bulk move range */
 static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
 				       struct ttm_resource *res)
 {
 	if (pos->last != res) {
 		if (pos->first == res)
-			pos->first = list_next_entry(res, lru);
-		list_move(&res->lru, &pos->last->lru);
+			pos->first = ttm_lru_next_res(res);
+		list_move(&res->lru.link, &pos->last->lru.link);
 		pos->last = res;
 	}
 }
@@ -121,11 +145,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 		pos->first = NULL;
 		pos->last = NULL;
 	} else if (pos->first == res) {
-		pos->first = list_next_entry(res, lru);
+		pos->first = ttm_lru_next_res(res);
 	} else if (pos->last == res) {
-		pos->last = list_prev_entry(res, lru);
+		pos->last = ttm_lru_prev_res(res);
 	} else {
-		list_move(&res->lru, &pos->last->lru);
+		list_move(&res->lru.link, &pos->last->lru.link);
 	}
 }
 
@@ -154,7 +178,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
 	if (bo->pin_count) {
-		list_move_tail(&res->lru, &bdev->pinned);
+		list_move_tail(&res->lru.link, &bdev->pinned);
 
 	} else	if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
@@ -165,7 +189,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 		struct ttm_resource_manager *man;
 
 		man = ttm_manager_type(bdev, res->mem_type);
-		list_move_tail(&res->lru, &man->lru[bo->priority]);
+		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
 	}
 }
 
@@ -196,9 +220,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->pin_count)
-		list_add_tail(&res->lru, &bo->bdev->pinned);
+		list_add_tail(&res->lru.link, &bo->bdev->pinned);
 	else
-		list_add_tail(&res->lru, &man->lru[bo->priority]);
+		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
 	man->usage += res->size;
 	spin_unlock(&bo->bdev->lru_lock);
 }
@@ -220,7 +244,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 	struct ttm_device *bdev = man->bdev;
 
 	spin_lock(&bdev->lru_lock);
-	list_del_init(&res->lru);
+	list_del_init(&res->lru.link);
 	man->usage -= res->size;
 	spin_unlock(&bdev->lru_lock);
 }
@@ -471,14 +495,16 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor)
 {
-	struct ttm_resource *res;
+	struct ttm_lru_item *lru;
 
 	lockdep_assert_held(&man->bdev->lru_lock);
 
 	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
 	     ++cursor->priority)
-		list_for_each_entry(res, &man->lru[cursor->priority], lru)
-			return res;
+		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru))
+				return ttm_lru_item_to_res(lru);
+		}
 
 	return NULL;
 }
@@ -497,15 +523,21 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res)
 {
+	struct ttm_lru_item *lru = &res->lru;
+
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
-		return res;
+	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
+		if (ttm_lru_item_is_res(lru))
+			return ttm_lru_item_to_res(lru);
+	}
 
 	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
 	     ++cursor->priority)
-		list_for_each_entry(res, &man->lru[cursor->priority], lru)
-			return res;
+		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru))
+				ttm_lru_item_to_res(lru);
+		}
 
 	return NULL;
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69769355139f..4babc4ff10b0 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -49,6 +49,43 @@ struct io_mapping;
 struct sg_table;
 struct scatterlist;
 
+/**
+ * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
+ */
+enum ttm_lru_item_type {
+	/** @TTM_LRU_RESOURCE: The resource subclass */
+	TTM_LRU_RESOURCE,
+	/** @TTM_LRU_HITCH: The iterator hitch subclass */
+	TTM_LRU_HITCH
+};
+
+/**
+ * struct ttm_lru_item - The TTM lru list node base class
+ * @link: The list link
+ * @type: The subclass type
+ */
+struct ttm_lru_item {
+	struct list_head link;
+	enum ttm_lru_item_type type;
+};
+
+/**
+ * ttm_lru_item_init() - initialize a struct ttm_lru_item
+ * @item: The item to initialize
+ * @type: The subclass type
+ */
+static inline void ttm_lru_item_init(struct ttm_lru_item *item,
+				     enum ttm_lru_item_type type)
+{
+	item->type = type;
+	INIT_LIST_HEAD(&item->link);
+}
+
+static inline bool ttm_lru_item_is_res(const struct ttm_lru_item *item)
+{
+	return item->type == TTM_LRU_RESOURCE;
+}
+
 struct ttm_resource_manager_func {
 	/**
 	 * struct ttm_resource_manager_func member alloc
@@ -217,9 +254,21 @@ struct ttm_resource {
 	/**
 	 * @lru: Least recently used list, see &ttm_resource_manager.lru
 	 */
-	struct list_head lru;
+	struct ttm_lru_item lru;
 };
 
+/**
+ * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
+ * @item: The struct ttm_lru_item to downcast
+ *
+ * Return: Pointer to the embedding struct ttm_resource
+ */
+static inline struct ttm_resource *
+ttm_lru_item_to_res(struct ttm_lru_item *item)
+{
+	return container_of(item, struct ttm_resource, lru);
+}
+
 /**
  * struct ttm_resource_cursor
  *
-- 
2.44.0

