Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C04A71DF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BED010E637;
	Wed,  2 Feb 2022 13:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E7610E5F3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:46:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s9so38426084wrb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 05:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eyJlTyibSgvbNcBnGPOCHnD75SOPIvAe0/hdkElTKcA=;
 b=H8Ejn/ijeHBhMrWEiPn2oScHXfuXgmjcd6pge/9D2Kf+wPUaM9a+ups6YxNodr1TBS
 56ePUAA+/z5DGWDWu9ODbsK9h3h+dyUtaKn5llf0b1TrkmzzXoyZ0uvf8zDr93GmSnAR
 /BmgVRH+Q2jTTrvTS187WSInELdm0Umoidt9LupYCyQYbW/g3J/u3IAUicanYlTQezUn
 MAbp8XodsSGn0vBTDNnI9Sx0fGj/dAyeUPCoav0ECOSbJPrxSR6jBh9aVvniGLjFUSJJ
 xNY9JBGzcibI1okQtad1rOqL3ViSL7+4wguCd7g91a/I7KABGKXofA1DZdfERCepNMDu
 hiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyJlTyibSgvbNcBnGPOCHnD75SOPIvAe0/hdkElTKcA=;
 b=3sWP7c5ca2O4eKz05F5a7/2dAbEL8YDLGs9UhUiNg2lKoUOInX10f6MiMKTY6uCYWK
 Jq7cpXh5bvJFvaoqORnFIiQ/BvC2Po1NcxCgIPi7jqY8zYOY/FXYGy5Kt38JQ3KBXCt8
 OCdUqMW8eBA1p4ho17BVm/pyezTIRX7xps2K38wC41vi5MVit1b7SQuoPF0KK+eS5TCH
 hafI2cYQRRrVcYkfn3Y/vAnxfi1dwhxnluMF8PcR7cKAc5ybXhhjmk67EBp1sZCa6V0S
 ktuOhWaqXFn8GeZ5DBJLZzTtPG4e9c+q0os6Siol4an8tMzlAhmxtN5+y+SjOSQc7lM7
 O+Og==
X-Gm-Message-State: AOAM533aXbJ6z08RELj0rcZpDxrt33sRLlafUD3NIRVqoMnqYr0eqiU6
 Ufytc1X5c5T58ebEwOplTXXeoIzv4T8=
X-Google-Smtp-Source: ABdhPJziDTpy7STL0iedhFi+NTKCIOP915/FFl9/y8lSK2aswb6HMeGOEa/w0aJqPUiC9VPoM+U8Dg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr25128310wrz.391.1643809615182; 
 Wed, 02 Feb 2022 05:46:55 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id c13sm17471876wrv.24.2022.02.02.05.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:46:54 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH 3/9] drm/ttm: add resource iterator
Date: Wed,  2 Feb 2022 14:46:45 +0100
Message-Id: <20220202134651.296584-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202134651.296584-1-christian.koenig@amd.com>
References: <20220202134651.296584-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/ttm/ttm_device.c   | 26 ++++++++---------
 drivers/gpu/drm/ttm/ttm_resource.c | 45 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 +++++++++++++++
 4 files changed, 95 insertions(+), 40 deletions(-)

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
index c124db5039f0..5bfe6eed8f82 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -385,6 +385,51 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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
index 9bc5c0280a09..cd3a6ed0c82c 100644
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

