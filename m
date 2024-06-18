Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15C90C42D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725310E299;
	Tue, 18 Jun 2024 07:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAXMKP8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934AF10E4F5;
 Tue, 18 Jun 2024 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695117; x=1750231117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9+UMcc6DgrWqiuioXloJ6NWvnKibXI0eXhqp3Cl0SlA=;
 b=iAXMKP8T3Ts1M7NDUeZXLpdj/P7kJ4gYqXN0MY62fLKaeq08NwO6NYGn
 eDGeJ72VL6yfxfEu0MJOoHMRy2207wUSgl2TGLD3rPyUyg6Qe69BG4SJO
 vKDDw6MQiVbYf9KenfqBL4FeFI4Oe4kyT0cx18Y6C7RLSGtS3B3Ww07Og
 aQ8RuBbBL7/tNpCiU0vq2jJhFG4RYGYEuO1cfhJmfraP4bdxIA9S15M9Z
 2iI7PzzKwBteNJTntPlgnlEu9xNsFSYbiHvibkdFl3TUp8FRU5SH3IPsx
 KaU/ZhdnBJR+Kpj53onF9ThAKzXdzVOn6xuvvYURGGDQXfaNCXQR/9ea5 Q==;
X-CSE-ConnectionGUID: SuWTSPwHQE6N141T+nxbVg==
X-CSE-MsgGUID: qT+Z6pXtSyqs0ZfwODtrXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15389290"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15389290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:37 -0700
X-CSE-ConnectionGUID: hb+ABEJGRFqE1MNri4O7Ow==
X-CSE-MsgGUID: A4mX0/7hQsyrkgYZnkJwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="78910627"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/12] drm/ttm: Allow TTM LRU list nodes of different types
Date: Tue, 18 Jun 2024 09:18:09 +0200
Message-ID: <20240618071820.130917-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
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
v3:
- Introduce ttm_lru_first_res_or_null()
  (Christian König, Thomas Hellström)
v5:
- Update also the TTM test code (Xe CI).

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  6 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c            | 89 +++++++++++++++----
 include/drm/ttm/ttm_resource.h                | 54 ++++++++++-
 5 files changed, 129 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc92..ddbb895feaa2 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -265,7 +265,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
 
 	man = ttm_manager_type(priv->ttm_dev, mem_type);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
+			list_is_last(&res1->lru.link, &man->lru[bo->priority]), 1);
 
 	ttm_resource_free(bo, &res2);
 	ttm_resource_free(bo, &res1);
@@ -302,11 +302,11 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	err = ttm_resource_alloc(bo, place, &res2);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
+			list_is_last(&res2->lru.link, &priv->ttm_dev->pinned), 1);
 
 	ttm_bo_unreserve(bo);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
+			list_is_last(&res1->lru.link, &priv->ttm_dev->pinned), 1);
 
 	ttm_resource_free(bo, &res1);
 	ttm_resource_free(bo, &res2);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 029e1f094bb0..681ac8b746ef 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -198,7 +198,7 @@ static void ttm_resource_fini_basic(struct kunit *test)
 	ttm_resource_init(bo, place, res);
 	ttm_resource_fini(man, res);
 
-	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
+	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru.link));
 	KUNIT_ASSERT_EQ(test, man->usage, 0);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 434cf0258000..09411978a13a 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -274,14 +274,14 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 	struct ttm_resource *res;
 
 	spin_lock(&bdev->lru_lock);
-	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
+	while ((res = ttm_lru_first_res_or_null(list))) {
 		struct ttm_buffer_object *bo = res->bo;
 
 		/* Take ref against racing releases once lru_lock is unlocked */
 		if (!ttm_bo_get_unless_zero(bo))
 			continue;
 
-		list_del_init(&res->lru);
+		list_del_init(&bo->resource->lru.link);
 		spin_unlock(&bdev->lru_lock);
 
 		if (bo->ttm)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4a66b851b67d..db9a7a3717c4 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -70,8 +70,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 			dma_resv_assert_held(pos->last->bo->base.resv);
 
 			man = ttm_manager_type(pos->first->bo->bdev, i);
-			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
-					    &pos->last->lru);
+			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
+					    &pos->last->lru.link);
 		}
 	}
 }
@@ -84,14 +84,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
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
@@ -122,11 +146,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
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
 
@@ -155,7 +179,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
 	if (bo->pin_count) {
-		list_move_tail(&res->lru, &bdev->pinned);
+		list_move_tail(&res->lru.link, &bdev->pinned);
 
 	} else	if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
@@ -166,7 +190,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 		struct ttm_resource_manager *man;
 
 		man = ttm_manager_type(bdev, res->mem_type);
-		list_move_tail(&res->lru, &man->lru[bo->priority]);
+		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
 	}
 }
 
@@ -197,9 +221,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
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
@@ -221,7 +245,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 	struct ttm_device *bdev = man->bdev;
 
 	spin_lock(&bdev->lru_lock);
-	list_del_init(&res->lru);
+	list_del_init(&res->lru.link);
 	man->usage -= res->size;
 	spin_unlock(&bdev->lru_lock);
 }
@@ -472,14 +496,16 @@ struct ttm_resource *
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
@@ -498,15 +524,40 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
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
+
+	return NULL;
+}
+
+/**
+ * ttm_lru_first_res_or_null() - Return the first resource on an lru list
+ * @head: The list head of the lru list.
+ *
+ * Return: Pointer to the first resource on the lru list or NULL if
+ * there is none.
+ */
+struct ttm_resource *ttm_lru_first_res_or_null(struct list_head *head)
+{
+	struct ttm_lru_item *lru;
+
+	list_for_each_entry(lru, head, link) {
+		if (ttm_lru_item_is_res(lru))
+			return ttm_lru_item_to_res(lru);
+	}
 
 	return NULL;
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69769355139f..1511d91e290d 100644
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
@@ -393,6 +442,9 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res);
 
+struct ttm_resource *
+ttm_lru_first_res_or_null(struct list_head *head);
+
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
  * @man: the resource manager
-- 
2.44.0

