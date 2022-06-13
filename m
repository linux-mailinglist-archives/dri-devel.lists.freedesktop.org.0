Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7854814B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FCD10E735;
	Mon, 13 Jun 2022 08:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B9210E726;
 Mon, 13 Jun 2022 08:08:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v19so6025508edd.4;
 Mon, 13 Jun 2022 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaefOleXp7tfkdwEdueGWxPvSY7lD620uT2G9aQl73I=;
 b=g+bLshvn5EjqABd/tY4D5Hsqhq2yvCSENwlBFOiL3LuypC6wcoh6AXZD5XX0rPZZ8Z
 OXzlkTFds2XK98lZb4g0Vbw0ag5udNKIAlUTfBLeySoCqJ4ghkTeu7b54QAdeCF/6zxO
 PL57UmWAETkSEjr6RE7aL8B9Ewfx/QGKDsKBMM+FeuElCVop0aopqlOvtoNaA0bwyioU
 LIh4MQxlFLHTMyjU/5orR+SQNviCT6SjLg+4VtKTuIgGaGiKhPolmoHry4DHYQgWsPSx
 Qt32jWg3nq0bGZbaYVS6p9yYLgPkk/5xI8moxIxCVnDphMYFRN/rxxXC3wiORC5AAA7F
 URfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaefOleXp7tfkdwEdueGWxPvSY7lD620uT2G9aQl73I=;
 b=zwqnTWGe1KGWh1GBV5JHcX3zeVqeeSpbvx77J2mXCdSPT4Hq5lHGcOCU/6wrcJSwNa
 GPod1KDzl6nICZFgBGNdlk4pBv3FAyGc29vK+wFvhGzqxC9s6R6jYOuvxvKsC996nh43
 mL54d41eFJFmK/gZdmlCDiPXIHrhZbhTf7xkNlHikd1ozzwiNF42NMlH7YwgPggjgEpj
 CWZBnjNM+3+Gr88dIppKF81qvlHYb5Cqs6uQa+2H0Boj4QiTrP8rOzLO8/9SVLChnZit
 hIJnCb4qz2Tbo3ZDiFbjnEOD5L5tj7/NbH1sQjPY07s1MplGpPZKXx0lm7Ii4vtQGtUK
 20OQ==
X-Gm-Message-State: AOAM530qPGmY8CCE6J9nnzcHPrgODTe2ICk0A8fSUZJ5uouYRX8HcAOA
 INB+Lr7lRyMd/F6A9TgWpYU=
X-Google-Smtp-Source: ABdhPJwLAePhKt/6dSJ9sjn+Z99vx2bR1dmZZ7vw1LD0Uyzl8AMU1OfrmXOSnFsUuiYbDael2r47Dw==
X-Received: by 2002:a05:6402:430d:b0:42e:199a:4eb8 with SMTP id
 m13-20020a056402430d00b0042e199a4eb8mr60358009edc.411.1655107698827; 
 Mon, 13 Jun 2022 01:08:18 -0700 (PDT)
Received: from able.fritz.box (p57b0b659.dip0.t-ipconnect.de. [87.176.182.89])
 by smtp.gmail.com with ESMTPSA id
 zo16-20020a170906ff5000b0070efa110afcsm3512604ejb.83.2022.06.13.01.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 01:08:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Arunpravin.PaneerSelvam@amd.com, mike@fireburn.co.uk,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix bulk move handling v2
Date: Mon, 13 Jun 2022 10:08:16 +0200
Message-Id: <20220613080816.4965-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The resource must be on the LRU before ttm_lru_bulk_move_add() is called
and we need to check if the BO is pinned or not before adding it.

Additional to that we missed taking the LRU spinlock in ttm_bo_unpin().

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 22 ++++++++-----
 drivers/gpu/drm/ttm/ttm_resource.c | 52 +++++++++++++++++++++---------
 include/drm/ttm/ttm_resource.h     |  8 ++---
 3 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 296af2b89951..0e210df65c30 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -103,11 +103,11 @@ void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 		return;
 
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->bulk_move && bo->resource)
-		ttm_lru_bulk_move_del(bo->bulk_move, bo->resource);
+	if (bo->resource)
+		ttm_resource_del_bulk_move(bo->resource, bo);
 	bo->bulk_move = bulk;
-	if (bo->bulk_move && bo->resource)
-		ttm_lru_bulk_move_add(bo->bulk_move, bo->resource);
+	if (bo->resource)
+		ttm_resource_add_bulk_move(bo->resource, bo);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_set_bulk_move);
@@ -683,8 +683,11 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
 	WARN_ON_ONCE(!kref_read(&bo->kref));
-	if (!(bo->pin_count++) && bo->bulk_move && bo->resource)
-		ttm_lru_bulk_move_del(bo->bulk_move, bo->resource);
+	spin_lock(&bo->bdev->lru_lock);
+	if (bo->resource)
+		ttm_resource_del_bulk_move(bo->resource, bo);
+	++bo->pin_count;
+	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_pin);
 
@@ -701,8 +704,11 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 	if (WARN_ON_ONCE(!bo->pin_count))
 		return;
 
-	if (!(--bo->pin_count) && bo->bulk_move && bo->resource)
-		ttm_lru_bulk_move_add(bo->bulk_move, bo->resource);
+	spin_lock(&bo->bdev->lru_lock);
+	--bo->pin_count;
+	if (bo->resource)
+		ttm_resource_add_bulk_move(bo->resource, bo);
+	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_unpin);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 65889b3caf50..20f9adcc3235 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -91,8 +91,8 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
 }
 
 /* Add the resource to a bulk_move cursor */
-void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
-			   struct ttm_resource *res)
+static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
+				  struct ttm_resource *res)
 {
 	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
 
@@ -105,8 +105,8 @@ void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
 }
 
 /* Remove the resource from a bulk_move range */
-void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
-			   struct ttm_resource *res)
+static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
+				  struct ttm_resource *res)
 {
 	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
 
@@ -122,6 +122,22 @@ void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 	}
 }
 
+/* Add the resource to a bulk move if the BO is configured for it */
+void ttm_resource_add_bulk_move(struct ttm_resource *res,
+				struct ttm_buffer_object *bo)
+{
+	if (bo->bulk_move && !bo->pin_count)
+		ttm_lru_bulk_move_add(bo->bulk_move, res);
+}
+
+/* Remove the resource from a bulk move if the BO is configured for it */
+void ttm_resource_del_bulk_move(struct ttm_resource *res,
+				struct ttm_buffer_object *bo)
+{
+	if (bo->bulk_move && !bo->pin_count)
+		ttm_lru_bulk_move_del(bo->bulk_move, res);
+}
+
 /* Move a resource to the LRU or bulk tail */
 void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 {
@@ -169,15 +185,14 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
-	INIT_LIST_HEAD(&res->lru);
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
-	man->usage += res->num_pages << PAGE_SHIFT;
-	if (bo->bulk_move)
-		ttm_lru_bulk_move_add(bo->bulk_move, res);
+	if (bo->pin_count)
+		list_add_tail(&res->lru, &bo->bdev->pinned);
 	else
-		ttm_resource_move_to_lru_tail(res);
+		list_add_tail(&res->lru, &man->lru[bo->priority]);
+	man->usage += res->num_pages << PAGE_SHIFT;
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
@@ -210,8 +225,16 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 {
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, place->mem_type);
+	int ret;
+
+	ret = man->func->alloc(man, bo, place, res_ptr);
+	if (ret)
+		return ret;
 
-	return man->func->alloc(man, bo, place, res_ptr);
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_resource_add_bulk_move(*res_ptr, bo);
+	spin_unlock(&bo->bdev->lru_lock);
+	return 0;
 }
 
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
@@ -221,12 +244,9 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 	if (!*res)
 		return;
 
-	if (bo->bulk_move) {
-		spin_lock(&bo->bdev->lru_lock);
-		ttm_lru_bulk_move_del(bo->bulk_move, *res);
-		spin_unlock(&bo->bdev->lru_lock);
-	}
-
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_resource_del_bulk_move(*res, bo);
+	spin_unlock(&bo->bdev->lru_lock);
 	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
 	man->func->free(man, *res);
 	*res = NULL;
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 441653693970..ca89a48c2460 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -311,12 +311,12 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 }
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
-void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
-			   struct ttm_resource *res);
-void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
-			   struct ttm_resource *res);
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
 
+void ttm_resource_add_bulk_move(struct ttm_resource *res,
+				struct ttm_buffer_object *bo);
+void ttm_resource_del_bulk_move(struct ttm_resource *res,
+				struct ttm_buffer_object *bo);
 void ttm_resource_move_to_lru_tail(struct ttm_resource *res);
 
 void ttm_resource_init(struct ttm_buffer_object *bo,
-- 
2.25.1

