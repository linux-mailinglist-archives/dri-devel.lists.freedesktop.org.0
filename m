Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9124B7413
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B1910E5A5;
	Tue, 15 Feb 2022 17:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273210E476
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:23:05 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id hw13so17150069ejc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 09:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtJlILqfMb9Sn1TjVcNrWNw2lWSN00mqNDtHbIbCNlk=;
 b=mhZaZHkvncSwOShrcpwR6eszfNQm9PuqIMhan+Ujmbd8N9A0SwzvFWHSMyJSiIQg+U
 hS1yDGM04ytKOyIrA+yc00QLvVB0GDP+JaXHadipkqoE8fyzdwzqayI2Tq6oqFh2CKkY
 1h8fptEmUAKwQy34mCVEbRTXRTXbtufPMEyz8m3IUJHlqXs2yE6nCuIjfT4rNiVvmc25
 eg0vTVMzGwigU6rPJD6KCb5lxywJxcGRsZjRJ8LOaXpnMVfkfd90mKzYg5oQZvh3XDvr
 b94uDLZto72J1NlBFHenS1xs0Lapfr7IRF8XIzr33WOn7uLluecsCoAFU7LRYk4OZTog
 paGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtJlILqfMb9Sn1TjVcNrWNw2lWSN00mqNDtHbIbCNlk=;
 b=k/suzWQnimP2Q6XAL43LZFeETKQxWBekEV/Gx6DOfz+l344O3auiLP0L6/GsNuVDaF
 SoXa5e+0Ros8HabBLyMvdCS/u+83Pfgz1e7+0bdElZXHbtv/Mzn5ytC636jIGcI3AVM7
 XlQhLkhN4mZNYvabC7c1Kh8khJtvBSj3NNaq5Y2h2RFpaIlG6YzcU24JZE28mBUqUa07
 jiqJGEZ3vHnLnpEtCKdd4pP2S30z1jxBWOIs2Mj9AZk40hUzLVRnOCg8uWhT3XEHmFC+
 9ynjSMz6r4l4446zNDie8fiey6rQl5zAfOncLjMwm5aJYxO8YVnPyA0/4PK04vGF7FdS
 koLA==
X-Gm-Message-State: AOAM533IQmr3MEIHVGCqwjfnu6jIlRrkPOpA+9ZIW6YWS30XIdkXhXbX
 VHZygq8nxyYGtGbxw4qfJFY=
X-Google-Smtp-Source: ABdhPJy4TKxiYw3UKnqJ9guTwYUsM+dqlwkrkgbLW8xhgibTeLBt2703nNeC7H94qUk9uFwSAs1veQ==
X-Received: by 2002:a17:906:814a:: with SMTP id
 z10mr103594ejw.354.1644945783838; 
 Tue, 15 Feb 2022 09:23:03 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 18sm3521310ejj.1.2022.02.15.09.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 09:23:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com,
	felix.kuehling@amd.com,
	daniel@ffwll.ch
Subject: [PATCH 2/6] drm/ttm: add resource iterator v3
Date: Tue, 15 Feb 2022 18:22:55 +0100
Message-Id: <20220215172259.196645-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215172259.196645-1-christian.koenig@amd.com>
References: <20220215172259.196645-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of duplicating that at different places add an iterator over all
the resources in a resource manager.

v2: add lockdep annotation and kerneldoc
v3: fix various bugs pointed out by Felix

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v3)
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 42 ++++++++++--------------
 drivers/gpu/drm/ttm/ttm_device.c   | 26 +++++++--------
 drivers/gpu/drm/ttm/ttm_resource.c | 51 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 ++++++++++++++
 4 files changed, 102 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cb0fa932d495..11e698e3374c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -579,38 +579,30 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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
+			    dma_resv_locking_ctx(res->bo->base.resv))
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
+		break;
 	}
 
 	if (!bo) {
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index ba35887147ba..a0562ab386f5 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -142,10 +142,10 @@ EXPORT_SYMBOL(ttm_global_swapout);
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
 {
+	struct ttm_resource_cursor cursor;
 	struct ttm_resource_manager *man;
-	struct ttm_buffer_object *bo;
 	struct ttm_resource *res;
-	unsigned i, j;
+	unsigned i;
 	int ret;
 
 	spin_lock(&bdev->lru_lock);
@@ -154,20 +154,16 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		if (!man || !man->use_tt)
 			continue;
 
-		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
-			list_for_each_entry(res, &man->lru[j], lru) {
-				uint32_t num_pages;
-
-				bo = res->bo;
-				num_pages = PFN_UP(bo->base.size);
+		ttm_resource_manager_for_each_res(man, &cursor, res) {
+			struct ttm_buffer_object *bo = res->bo;
+			uint32_t num_pages = PFN_UP(bo->base.size);
 
-				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-				/* ttm_bo_swapout has dropped the lru_lock */
-				if (!ret)
-					return num_pages;
-				if (ret != -EBUSY)
-					return ret;
-			}
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
index 3af788dd197e..88fc96c315b8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -385,6 +385,57 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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
+	lockdep_assert_held(&man->bdev->lru_lock);
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
+ * @res: the current resource pointer
+ *
+ * Returns the next resource from the resource manager.
+ */
+struct ttm_resource *
+ttm_resource_manager_next(struct ttm_resource_manager *man,
+			  struct ttm_resource_cursor *cursor,
+			  struct ttm_resource *res)
+{
+	lockdep_assert_held(&man->bdev->lru_lock);
+
+	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
+		return res;
+
+	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
+	     ++cursor->priority)
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
index 181e82e3d806..ef0ec700e896 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -184,6 +184,17 @@ struct ttm_resource {
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
@@ -328,6 +339,18 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
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

