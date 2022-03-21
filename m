Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF04E277A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAD610E2FD;
	Mon, 21 Mar 2022 13:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A909510E292
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:26:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t11so20704435wrm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQRlqUrLw1r5Rpismeir7Q4nBm/3sHmaG0KKcbbLLw0=;
 b=p9cSEI7FJk1k6SxDecW1VOp6u79ONvMbYjCV5PqIX7Cwvs4Wo+5xSBZCw5IPsbtVJ1
 5YegQ0y9FXSzynoEDB51S6okCAvy1kXUbF7i5AF8NWgDq0cyNaosCxlWzLyQZ2dBdyDs
 3aNLkTWB+sW08Prn57XDZB687RK7k1ofLC9tSVRcYgNQ/M47zUq21pbo0F2fwpu5IEI4
 W0kXxABLw0nHE4ZYFN2qkEMJ3rYCLL8An+sZyf33rZXvbRp4yopKYXP2DEaRBkffrd+d
 P2WDUtHWJGfx8tcotI5FXs1XT0SVaiyQWB2sFmMPJbAw9gjkRD2TEoaJf6uJH6rEPQUJ
 GDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQRlqUrLw1r5Rpismeir7Q4nBm/3sHmaG0KKcbbLLw0=;
 b=geJLIh3w27ZBkER0f80v9piTZdCXw54sU6G59JFn6CFTuhrL1r4hSRsYMi+UEzzig3
 4qrapohwQ76yX1ym/7VjCM7wtL6azMJt9hJc9/4Tbc/9lggmQyd4S48479clx0hgOmPR
 2VzeIRr9yzGUdOgHJE5pwFtVZGGA0ivpkq8RyI6pwMz5+MLRchP6+YlrRXfWA1U3TDaU
 FAbZZkQV2ItK6FecBFBhSYtjbFoCw+OqiLLfY2Cr49hEunaZ9J3Qq2E29kyxft1keFos
 A4wDOZuJ5Q7kFC+QYylKfy5jbCyNDFImOXiwEhpApFyngmr3n+adKJmkBsTuq3W6Rb1s
 Q6Tg==
X-Gm-Message-State: AOAM531HfKzkZhh9nOo4T0bFDdOWo9EDPDGV+4Jp8bCE4RT8smI3FIlw
 8Ek9bx6bh5f5lpIZQqQbp6a0JoTyuA0=
X-Google-Smtp-Source: ABdhPJyisRJslr/IsVKy1jyxOBXuF0DV8saRHcfpiWb84taKnKLBdHduQfO+mUY0+eJXnA+zOif6nw==
X-Received: by 2002:a5d:5704:0:b0:203:f9bb:b969 with SMTP id
 a4-20020a5d5704000000b00203f9bbb969mr11219516wrv.459.1647869165057; 
 Mon, 21 Mar 2022 06:26:05 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm13714494wma.21.2022.03.21.06.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:26:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, felix.kuehling@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: add resource iterator v4
Date: Mon, 21 Mar 2022 14:25:57 +0100
Message-Id: <20220321132601.2161-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321132601.2161-1-christian.koenig@amd.com>
References: <20220321132601.2161-1-christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of duplicating that at different places add an iterator over all
the resources in a resource manager.

v2: add lockdep annotation and kerneldoc
v3: fix various bugs pointed out by Felix
v4: simplify the code a bit more

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v2)
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 37 ++++++++--------------
 drivers/gpu/drm/ttm/ttm_device.c   | 26 +++++++--------
 drivers/gpu/drm/ttm/ttm_resource.c | 51 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 23 ++++++++++++++
 4 files changed, 99 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cb0fa932d495..b119af33e7d7 100644
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
+	ttm_resource_manager_for_each_res(man, &cursor, res) {
+		bool busy;
+
+		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
+						    &locked, &busy)) {
+			if (busy && !busy_bo && ticket !=
+			    dma_resv_locking_ctx(res->bo->base.resv))
+				busy_bo = res->bo;
+			continue;
+		}
 
+		if (ttm_bo_get_unless_zero(res->bo)) {
 			bo = res->bo;
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
 			break;
 		}
-
-		/* If the inner loop terminated early, we have our candidate */
-		if (&res->lru != &man->lru[i])
-			break;
-
-		bo = NULL;
+		if (locked)
+			dma_resv_unlock(res->bo->base.resv);
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
index 8c253b6de6cc..81676c3dbeee 100644
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

