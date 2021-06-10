Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F93A29DE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64216ED01;
	Thu, 10 Jun 2021 11:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4AC6ECFB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:06:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so6147589wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FaGtT2vXmiy0hGMnUrFVIeeksffFKL/YomWPnU9mJso=;
 b=NDdHXvrLQk7CJ4r1eISOG9fV4HUDIU7ErlOqKi5HpKBNTSL33CtudpGE5rrLp25+ue
 ZG1HBTt3qyWplWnGttLbcRuiml2Ej0hFuXkOL/Hq8PhIj5WvMvUinGB5YZTMdxn4+TTR
 pIf3f5Tr2IVUAebznsjSXU3C3hSq2mWfWx82j8gaO3nNFtHbCbRkFwtoZyYSpqnGTdQo
 pOTEgnhY6ePka4NANYtn/nffdWWEwR/lTvF/OYf+yzLIW/gqcT2j0D4x2Az6kHuYW2zN
 EietxS1awzWWkruTbyxE+mPTRtCoK8t+DTh6ZCIoU0zdDmAsfXu8o1CELdgjU3XYd3g3
 ICkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaGtT2vXmiy0hGMnUrFVIeeksffFKL/YomWPnU9mJso=;
 b=OgJs1CY5IJlUZIH1dJ2WsWzvyB2FKmagAa8T6R/MXMqbOK8C9vuoPBjYSHQHfHAknG
 RMhmwR0D1WglNwoluGnf9WCQn+zFoX5DSvjnUfpLHO1CdAeMgKw+kiMztMozq5Sjl8Mc
 XZVboKLZxUF8QmA/j0bY2maXKBv0PcrhvJ0h7Wdoixic13aMHAZZDWjyHICOO0wtJovX
 R75QNyh9S4GhFNWyF44Olf7GyPIf0ltRKa8ymEWaW1bCae8qzYZeUjppRh6iJSQXnnz1
 3kndjMePCVSJfpe4cWLE52s71kvL4xLX88F267GihTdI6Dvftp6q7afV6tbeeVmdTXCY
 zIiA==
X-Gm-Message-State: AOAM533smjyBjI6+nMMVfctW9n5njUqoQElDl7jQSBwy9TJ1Kfhsty8N
 rAeIgTRpXPm3nn94BmvO5Cs=
X-Google-Smtp-Source: ABdhPJzpxsCN6UUUsgUc8H9EIKdUze6bYkduOGlCpdq2Q9Q0whVkt+sBeN4M0fKuxdcTTn2eeyvxow==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4381013wmc.95.1623323162495;
 Thu, 10 Jun 2021 04:06:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:14a0:1c64:4cb2:9d16])
 by smtp.gmail.com with ESMTPSA id z12sm3234372wmc.5.2021.06.10.04.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:06:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm: add resource iterator
Date: Thu, 10 Jun 2021 13:05:59 +0200
Message-Id: <20210610110559.1758-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610110559.1758-1-christian.koenig@amd.com>
References: <20210610110559.1758-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/ttm/ttm_bo.c       | 41 ++++++++++++------------------
 drivers/gpu/drm/ttm/ttm_device.c   | 37 +++++++++++++--------------
 drivers/gpu/drm/ttm/ttm_resource.c | 29 +++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 +++++++++++++++++
 4 files changed, 86 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e081d48aad76..c2408d53f85a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -555,38 +555,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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
index bc2b71922235..53ef3462a26d 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -284,6 +284,35 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
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
index 56583b2392ed..c854664be2b2 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -177,6 +177,17 @@ struct ttm_resource {
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
@@ -314,6 +325,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
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

