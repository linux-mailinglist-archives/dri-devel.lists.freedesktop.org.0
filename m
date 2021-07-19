Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFEC3CD429
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D26E082;
	Mon, 19 Jul 2021 11:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FD96E082
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:51:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f10-20020a05600c4e8ab029023e8d74d693so5286432wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t60ofD/G++l3BTqAzT/UNLM8iyHAwF1pDGZVsHckdd0=;
 b=tk+GiNQBwqoHNyuIE56htnxXnxOWKawhZJ4B5+q9EG343SY8lpxgdRr2FhCDhjkVyL
 HfUb0hkSLUdpaMWtpthw2BcgVM0c/0UmaQJVu5aXqcCw0/jwVB9Hx6zzg1MbCnNaqNUJ
 wZDQVr+GSseH96Bkiv4faEIToykt6LxQNVPCt69MGjkOg8UE+evTpzJXuQuKC19/SH1x
 yuWzKQN1m77gdZNX5B8SIE9mowj3axW5OLzZK8N6+zgkBkdP7balPijb7Tz9d/y2bGNX
 nT13d6y+xxtZGocMCQEs3Nmw3A0ITPkLlhZW7Z/Wm9aS84pP5D9CKqtvcUN5QyPU1OUX
 5SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t60ofD/G++l3BTqAzT/UNLM8iyHAwF1pDGZVsHckdd0=;
 b=XQZFMZJ/XwpbhQjzdmAz49msZzffcjgkSGeX1K1t732k9r2D6loUTD9+o8IAYamS1i
 Abua1+LRKjrwZY4asv+1drzQVjNrcJjJph41bKWcCIEztPxwD4jS9FEK11GldlgS8wkq
 J9avgvg53Sh0gANUvMGorPVEXxQ7wv6CirAeqRnmMV28YNvQRkmO5NzaBgtya8DTNmJM
 uP5p2+HUx5FFunuO2uayvH+0V+tFS28n/lCADU/oiSqQl0rRTKcRVJ+3H8Gf8NA02dP0
 JWusvcCvJYHnDLr0dA3mRmfqI1CZdKRCwf8MRuAiDlIiML45scK98Z6zHF3GaaUA01J5
 p+ig==
X-Gm-Message-State: AOAM530JCKoabgmWkZo1p/wPWxe6m9yUn2tb0wZILmkB/NHmu5v1/tNK
 qbySB/kcdFKe67qHyFvnXJdqGKLXcME=
X-Google-Smtp-Source: ABdhPJyULAWqGYQk7OGu0zPjR6l99I3g6Ocx9qvc+tQwLiFSi9gTLJCG7KvqeVNih35IB0t6SNMGGw==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr26165179wmc.2.1626695509434;
 Mon, 19 Jul 2021 04:51:49 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bb37:8df9:3c3c:217f])
 by smtp.gmail.com with ESMTPSA id p5sm16034104wme.2.2021.07.19.04.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:51:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: add resource iterator
Date: Mon, 19 Jul 2021 13:51:45 +0200
Message-Id: <20210719115145.1260-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719115145.1260-1-christian.koenig@amd.com>
References: <20210719115145.1260-1-christian.koenig@amd.com>
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

Instead of duplicating that at different places add an iterator over all
the resources in a resource manager.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 41 +++++++++++----------------
 drivers/gpu/drm/ttm/ttm_device.c   | 37 ++++++++++++------------
 drivers/gpu/drm/ttm/ttm_resource.c | 45 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 +++++++++++++++
 4 files changed, 102 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 09a62ad06b9d..98ad0b819deb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -585,38 +585,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ww_acquire_ctx *ticket)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
+	struct ttm_resource_cursor cursor;
 	struct ttm_resource *res;
 	bool locked = false;
-	unsigned i;
 	int ret;
 
 	spin_lock(&bdev->lru_lock);
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		list_for_each_entry(res, &man->lru[i], lru) {
-			bool busy;
-
-			bo = res->bo;
-			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
-							    &locked, &busy)) {
-				if (busy && !busy_bo && ticket !=
-				    dma_resv_locking_ctx(bo->base.resv))
-					busy_bo = bo;
-				continue;
-			}
-
-			if (!ttm_bo_get_unless_zero(bo)) {
-				if (locked)
-					dma_resv_unlock(bo->base.resv);
-				continue;
-			}
-			break;
+	ttm_resource_manager_for_each_res(man, &cursor, res) {
+		bool busy;
+
+		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
+						    &locked, &busy)) {
+			if (busy && !busy_bo && ticket !=
+			    dma_resv_locking_ctx(bo->base.resv))
+				busy_bo = res->bo;
+			continue;
 		}
 
-		/* If the inner loop terminated early, we have our candidate */
-		if (&res->lru != &man->lru[i])
-			break;
-
-		bo = NULL;
+		if (!ttm_bo_get_unless_zero(res->bo)) {
+			if (locked)
+				dma_resv_unlock(res->bo->base.resv);
+			continue;
+		}
+		bo = res->bo;
 	}
 
 	if (!bo) {
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index a6e533c3ac56..8225575d2d0f 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -130,10 +130,11 @@ EXPORT_SYMBOL(ttm_global_swapout);
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
 {
+	struct ttm_resource_cursor cursor;
 	struct ttm_resource_manager *man;
 	struct ttm_buffer_object *bo;
 	struct ttm_resource *res;
-	unsigned i, j;
+	unsigned i;
 	int ret;
 
 	spin_lock(&bdev->lru_lock);
@@ -142,24 +143,22 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		if (!man || !man->use_tt)
 			continue;
 
-		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			list_for_each_entry(res, &man->lru[j], lru) {
-				uint32_t num_pages;
-
-				bo = res->bo;
-				if (!bo->ttm ||
-				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
-				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
-					continue;
-
-				num_pages = bo->ttm->num_pages;
-				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-				/* ttm_bo_swapout has dropped the lru_lock */
-				if (!ret)
-					return num_pages;
-				if (ret != -EBUSY)
-					return ret;
-			}
+		ttm_resource_manager_for_each_res(man, &cursor, res) {
+			uint32_t num_pages;
+
+			bo = res->bo;
+			if (!bo->ttm ||
+			    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
+			    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
+				continue;
+
+			num_pages = bo->ttm->num_pages;
+			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
+			/* ttm_bo_swapout has dropped the lru_lock */
+			if (!ret)
+				return num_pages;
+			if (ret != -EBUSY)
+				return ret;
 		}
 	}
 	spin_unlock(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index d4eac7c08e82..2349e264e58e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -301,6 +301,51 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
+/**
+ * ttm_resource_manager_first
+ *
+ * @man: resource manager to iterate over
+ * @cursor: cursor to record the position
+ *
+ * Returns the first resource from the resource manager.
+ */
+struct ttm_resource *
+ttm_resource_manager_first(struct ttm_resource_manager *man,
+			   struct ttm_resource_cursor *cursor)
+{
+	struct ttm_resource *res;
+
+	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
+	     ++cursor->priority)
+		list_for_each_entry(res, &man->lru[cursor->priority], lru)
+			return res;
+
+	return NULL;
+}
+
+/**
+ * ttm_resource_manager_next
+ *
+ * @man: resource manager to iterate over
+ * @cursor: cursor to record the position
+ *
+ * Returns the next resource from the resource manager.
+ */
+struct ttm_resource *
+ttm_resource_manager_next(struct ttm_resource_manager *man,
+			  struct ttm_resource_cursor *cursor,
+			  struct ttm_resource *res)
+{
+	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
+		return res;
+
+	for (; cursor->priority < TTM_MAX_BO_PRIORITY; ++cursor->priority)
+		list_for_each_entry(res, &man->lru[cursor->priority], lru)
+			return res;
+
+	return NULL;
+}
+
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
 					  struct dma_buf_map *dmap,
 					  pgoff_t i)
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 500711415ae9..a42cdb94fd9f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -183,6 +183,17 @@ struct ttm_resource {
 	struct list_head lru;
 };
 
+/**
+ * struct ttm_resource_cursor
+ *
+ * @priority: the current priority
+ *
+ * Cursor to iterate over the resources in a manager.
+ */
+struct ttm_resource_cursor {
+	unsigned int priority;
+};
+
 /**
  * struct ttm_lru_bulk_move_pos
  *
@@ -334,6 +345,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
+struct ttm_resource *
+ttm_resource_manager_first(struct ttm_resource_manager *man,
+			   struct ttm_resource_cursor *cursor);
+struct ttm_resource *
+ttm_resource_manager_next(struct ttm_resource_manager *man,
+			  struct ttm_resource_cursor *cursor,
+			  struct ttm_resource *res);
+
+#define ttm_resource_manager_for_each_res(man, cursor, res)		\
+	for (res = ttm_resource_manager_first(man, cursor); res;	\
+	     res = ttm_resource_manager_next(man, cursor, res))
+
 struct ttm_kmap_iter *
 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
 			 struct io_mapping *iomap,
-- 
2.25.1

