Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C86A3FB2BE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E937B89CE1;
	Mon, 30 Aug 2021 08:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63F989C2C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id e26so2855235wmk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=P67/BYLUo6MHXbxwYMf0Y3kNpMxZMl+hFVZBfMeQHWo=;
 b=qrATY9srchswKqwlnWsfSoicxd0FF7ZpJY5tfNNZDxhBEkWMM7ze7WzY8r/0F8DyZ/
 dsJpTIx2A2Uf0JxuFeWrksmbhDD0xbUWGh8aApkeH4WyDLrwjlJG4c2WLy1h6PDrl9gi
 fZ6xYxJ1kvfFiroAPdA8py3mdBClF0m+Oan0MMnKiCILC5+IoC8hFM8a0L3IucJ+5pot
 LYL7IxzxYzDDdw+wKmjJf3y8juTr1N0uVGbQvMVJogU3F/tkjpPYkcA78M6CinhCIYpg
 COjyf1ghS+Kh6iIKFSI9aRRguTEc5wGzSupsqU6ppdR73oiu26Crrf35LkwgbYyFkieJ
 AsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P67/BYLUo6MHXbxwYMf0Y3kNpMxZMl+hFVZBfMeQHWo=;
 b=QKlb00S0pJam4EPpScWhNQU4n0GpgdDlx9UL8/ZqT7gcFBlUVVYHTz0CeKCez4zLRP
 i0ZK2duhnbrysVyoxii4RONu6uxkJtSzjg8ej75YLA6iRyFFQHoJKsiW4qhQhdSVJAPL
 Z9IZo0Q+xz5fHQDuM2iKXZu51yEprpUZ9ECqtcmBtk/coBXx1FPutCVC1htyqtxGnJ8W
 eyJvWzRnMzXRDEyr++qKOm46qAhkUuCgqXY207V9HG+UM/+TDERLyqSdoZriDCT1eYYQ
 R7mP7FizDbx9/B0xD0CzxfW/9VKontmeQ58ZPDzPuItnABC7H2GewQG0WcZagV+RG4ns
 NVCQ==
X-Gm-Message-State: AOAM531JB/3uIlgf1Z517eybA/QnCTFG7uzPLfNPhLFbRRiemYJP8YR+
 G5/wynYmbdZOSz2lGN+DK5wM8uay7VHXrXW0
X-Google-Smtp-Source: ABdhPJwrdl6JYg7WyCL/r0JceHT7yOxqq6q5cq2ngUxJCn9agrqw/b9OefXxB/O7g7JChM3FRwz5VQ==
X-Received: by 2002:a05:600c:4786:: with SMTP id
 k6mr20824028wmo.177.1630313833478; 
 Mon, 30 Aug 2021 01:57:13 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 06/12] drm/ttm: add resource iterator
Date: Mon, 30 Aug 2021 10:57:01 +0200
Message-Id: <20210830085707.209508-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/ttm/ttm_device.c   | 34 ++++++++++++----------
 drivers/gpu/drm/ttm/ttm_resource.c | 45 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 +++++++++++++++
 4 files changed, 103 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d5c6e096fd31..8ca418d4a059 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -586,38 +586,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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
index 9e0dfceff68c..c019d8dcd82c 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -132,10 +132,11 @@ EXPORT_SYMBOL(ttm_global_swapout);
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
@@ -144,20 +145,23 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		if (!man || !man->use_tt)
 			continue;
 
-		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			list_for_each_entry(res, &man->lru[j], lru) {
-				uint32_t num_pages;
-
-				bo = res->bo;
-				num_pages = PFN_UP(bo->base.size);
-
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
+			num_pages = PFN_UP(bo->base.size);
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
index 355c542758b5..6e5678ad3a13 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -312,6 +312,51 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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
index 5f9797f9d64a..fc2da89c9c41 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -182,6 +182,17 @@ struct ttm_resource {
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
@@ -336,6 +347,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
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

