Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D94B740C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDB510E476;
	Tue, 15 Feb 2022 17:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A0C10E476
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:23:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jg20so20803253ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQucRYUmo/alJVAAT/eWqoTTHzi05u826FTGn2EZQ8U=;
 b=f1dUjWJMLtvxII5WnqxqVAIzayAYbLXcOUY5VQA1+2eTRRSQTD91S31U2Vx/344N5n
 qyVInzjFZ+o9jmEJdE7EpTyabY6ewUDtWXaApnACvp2nTtb+NzhlbNMHJKewx1iFw2e7
 C43/i3jx7ytWd3E/RkzYQyxge5LHG5tzayS3X9lpxGk0eGesMpy4e+mWduV8I3WhCl5r
 gARWZCuHtYaY43+7s2qnk3DohSWgOT58swV91tp1p07TRbcMBXCgdnEVyUL5Zn49o9cm
 iiAYsYWHSz0s6wkepyGj1xGThpPuo0ZURABp2PWVqvz07rt1gqVSERGWh//nadsqHLAx
 AUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fQucRYUmo/alJVAAT/eWqoTTHzi05u826FTGn2EZQ8U=;
 b=z8EBfU7oGUfbdeGxWEHLk0QM6qVUq67MT6hRkwy7KeDz9YU8xZyIOYAhNwS59YVRKK
 Q5f9b712mSfM3ANSNgT0IPsmPVHOl9WuM3z3ZEUytVKjerwTcgsrtTzOf/KK0CXaRJVq
 YROetOJZsk1aCIGr2S76ZfCu5ZF1RHqWadiFVufIC7FMJNoBXncSnJB1nDOAxJkARWJV
 IheF+wA7wzypKwzt2k4VlridKNtV1xTzkc0kX8hRVT/15RtqrV8sYHkZtLuj8AKHS3y4
 IkBZQ8kSWnfBIQ1cOEQf+VEDY3RpxaaKSB/BUCENnrEJY4PR/VlpYwkyz0esBcK82V2Z
 ysfw==
X-Gm-Message-State: AOAM530jrJNCw2UrjKdHeMsNumKoOHnFblbD86Tr0NIv25b4Yn/d5cdA
 twj9BwWNDYV0fozMsz3INzk=
X-Google-Smtp-Source: ABdhPJz9pBn3p7/+nmCLO/ZvupjmgO/Z9Mn42Y1aDH55s3UseWJDZZb0RIqsUnIwwtfFnHml5MSltw==
X-Received: by 2002:a17:906:5356:: with SMTP id
 j22mr90896ejo.602.1644945784588; 
 Tue, 15 Feb 2022 09:23:04 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 18sm3521310ejj.1.2022.02.15.09.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 09:23:04 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com,
	felix.kuehling@amd.com,
	daniel@ffwll.ch
Subject: [PATCH 3/6] drm/ttm: allow bulk moves for all domains
Date: Tue, 15 Feb 2022 18:22:56 +0100
Message-Id: <20220215172259.196645-4-christian.koenig@amd.com>
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

Not just TT and VRAM.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 52 +++++++++---------------------
 include/drm/ttm/ttm_device.h       |  2 --
 include/drm/ttm/ttm_resource.h     |  4 +--
 3 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 88fc96c315b8..85a33473e4d2 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -51,38 +51,24 @@ EXPORT_SYMBOL(ttm_lru_bulk_move_init);
  */
 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 {
-	unsigned i;
-
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
-		struct ttm_resource_manager *man;
+	unsigned i, j;
 
-		if (!pos->first)
-			continue;
+	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
+		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
+			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
+			struct ttm_resource_manager *man;
 
-		lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
-		dma_resv_assert_held(pos->first->bo->base.resv);
-		dma_resv_assert_held(pos->last->bo->base.resv);
+			if (!pos->first)
+				continue;
 
-		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
-		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
-				    &pos->last->lru);
-	}
-
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
-		struct ttm_resource_manager *man;
+			lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
+			dma_resv_assert_held(pos->first->bo->base.resv);
+			dma_resv_assert_held(pos->last->bo->base.resv);
 
-		if (!pos->first)
-			continue;
-
-		lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
-		dma_resv_assert_held(pos->first->bo->base.resv);
-		dma_resv_assert_held(pos->last->bo->base.resv);
-
-		man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
-		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
-				    &pos->last->lru);
+			man = ttm_manager_type(pos->first->bo->bdev, i);
+			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
+					    &pos->last->lru);
+		}
 	}
 }
 EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
@@ -122,15 +108,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
 	if (!bulk)
 		return;
 
-	switch (res->mem_type) {
-	case TTM_PL_TT:
-		ttm_lru_bulk_move_set_pos(&bulk->tt[bo->priority], res);
-		break;
-
-	case TTM_PL_VRAM:
-		ttm_lru_bulk_move_set_pos(&bulk->vram[bo->priority], res);
-		break;
-	}
+	ttm_lru_bulk_move_set_pos(&bulk->pos[res->mem_type][bo->priority], res);
 }
 
 /**
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 0a4ddec78d8f..425150f35fbe 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -30,8 +30,6 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_pool.h>
 
-#define TTM_NUM_MEM_TYPES 8
-
 struct ttm_device;
 struct ttm_placement;
 struct ttm_buffer_object;
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ef0ec700e896..e8a64ca3cf25 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -37,6 +37,7 @@
 #include <drm/ttm/ttm_kmap_iter.h>
 
 #define TTM_MAX_BO_PRIORITY	4U
+#define TTM_NUM_MEM_TYPES 8
 
 struct ttm_device;
 struct ttm_resource_manager;
@@ -217,8 +218,7 @@ struct ttm_lru_bulk_move_pos {
  * Helper structure for bulk moves on the LRU list.
  */
 struct ttm_lru_bulk_move {
-	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
-	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
+	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
 };
 
 /**
-- 
2.25.1

