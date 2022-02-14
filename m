Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326324B4655
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D1010E261;
	Mon, 14 Feb 2022 09:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DCD10E261
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id e7so31994661ejn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1vmN+hMfOo7dwoLfS3j8zaK2cxmVw+eWz8F6zOCOu28=;
 b=io9OdnyW9kLV6XL5lIKMaCLAZnE+g1pGg10fGADh7YUpUs6EnrtLKUgVvKVerkcnYi
 sPyM2Kjdbrg87R3MPeh25c6xNu/I1X0TBz5vX5QdDoTw/ner4OYyUV+epPawVIH+kY49
 bRZQPeC6XcLMV87yIyFF8LG4YcY8Qpl02V5NzjXz/5WWRAhHMwgLQVS6YjDj62k3vKKE
 sUY+aJ+BNfG+PGlpsWJmcJM66acE7q+2S7qnFx0qLXYTXb0Wj1Ny0ZizoBMu9Cl6tt03
 /j9y4e2vrc9gourh3KeRSeId88TI2cemFjmmyzC4UdnURA2qLAF9r6Y0fdRR3wu8vDmr
 luhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vmN+hMfOo7dwoLfS3j8zaK2cxmVw+eWz8F6zOCOu28=;
 b=OdlIdx77fS//7vJE53WI8xsYQxmcCo5kNbOewcTbKvtRFhOjCRY97f6AbdogEnz2eQ
 4xVmpXFG/ZRu6uouqjqwruzlJ8hJRavSgrC/sHhn1UYLSRoS+oNmqbIrGnGa1nisNRlr
 b3PcXxudbyJOpme0O/AAx90oPvP36olmagyaGuR/aNUZykv4AuKBjaqbJeAnEqcZ2VJ3
 NSqOdyB6MXDUwFJGf+6/1PgHepKjt617mmpxZ3FSnhqvl1jffqAlKos2AeliGU4HHPjS
 c/zd68TSrHR/jdTEqhUWMiv6K2nbXxjOm4ITALdYMFUUg2U3nxD0psxdpW+LyA765Bq1
 +u6g==
X-Gm-Message-State: AOAM532BuAJZOMbhhcvnRzTE8zGMBfvhoWDoMKbryXRaO59SBmE/Es8D
 BzBJZB4Yk1KmCpuAJF2QfT0=
X-Google-Smtp-Source: ABdhPJzIGQQBpQxl+kLOskTr/FdO68Entgyec6a2MMKv0hAVKxG+pLd9oUrNjTBdUxcBg4k84Sl70g==
X-Received: by 2002:a17:906:64cd:: with SMTP id
 p13mr3889369ejn.297.1644831283358; 
 Mon, 14 Feb 2022 01:34:43 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm/ttm: add resource iterator v2
Date: Mon, 14 Feb 2022 10:34:32 +0100
Message-Id: <20220214093439.2989-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
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

v2: add lockdep annotation and kerneldoc

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 41 ++++++++++---------------
 drivers/gpu/drm/ttm/ttm_device.c   | 26 +++++++---------
 drivers/gpu/drm/ttm/ttm_resource.c | 49 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 ++++++++++++++
 4 files changed, 99 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cb0fa932d495..599be3dda8a9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -579,38 +579,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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
index 411b3f001eeb..1f9b8205b3a5 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -385,6 +385,55 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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

