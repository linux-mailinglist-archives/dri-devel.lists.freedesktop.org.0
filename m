Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BEA497F68
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4D010EAC6;
	Mon, 24 Jan 2022 12:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DD610EA87
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h29so10610318wrb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=reNHSkedLLRdsPCa9ikZR9nGjtzrqWMgZdGa7MJh10c=;
 b=VTpXD2rZBdLPNCpNxoBPpwW681oLuToi9wMSAZOWH8Jk23EQEDAI01y/ip87pc2Drb
 VKK9z6+yWgStPbljQ9U8yPjbZDuwpHgozrboXK38yDd6D87Slx8+HrbSeS4WamS49x5O
 O+4IaXROir4aYOCDaHeffEmiSCvtCiUU+aw5rHgrBrZ4V8H5ToJihrwg7XFNtXelv+Qq
 jBDyMBNlWBQ/+oFeN5HlO546jQBerMpoZI9eUSr+1k/zKRFYxLQCx6KFBrE0NC06plbL
 Qd6AwACvYNKVFOlUPMxCVJw1nzHaw6/kP0qPxu4ko32vqpnAosx2PQ1UahcOEwXFZb7s
 S3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=reNHSkedLLRdsPCa9ikZR9nGjtzrqWMgZdGa7MJh10c=;
 b=I2F2FyABcxfaD4bbphaWbESd5dhB6Bxl5j+KoYlFfcaeWIT9tl59QdEpmlsi8U2g8I
 w6UGS3FnGji9RmBff2bY5SUQoW7Un3wm74nUAE5irPh25+Tru+qORnfenfIBIN77IoZh
 cwvCKi3gTaHH1+CbjdRo6U+Z0kElWcOlG6sR8a81HoB2ji0orbzz8UODCoS30P5qsDQD
 AzEZT/S90vo8YdUuCCw4gUMZBCashrFhfusRwYjm6MJiinCmWkokobDJIcD0jPDMZAZI
 DKPjpP/4FH4sy5hkEMYW2+nEnZEn4JYGPFW6wSPh3zSWOlKZhAlAl2Jc+qB0v+J+dVEF
 riMw==
X-Gm-Message-State: AOAM530lyisMXMbtCzJxFyIJVQmkKpCrIdh58umKC1PPcG2U1Xvq7uUD
 xMz8xJiTwzvb/AUezJNCpU0=
X-Google-Smtp-Source: ABdhPJwWEyJy0McgdI+OVgJtw9uurfAFuWwMr/84u3g4PL9SpkyhmaVPFV+HHqvqPdSXAvemJxMX5w==
X-Received: by 2002:adf:e351:: with SMTP id n17mr13785982wrj.243.1643027124901; 
 Mon, 24 Jan 2022 04:25:24 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: [PATCH 11/12] drm/ttm: allow bulk moves for all domains
Date: Mon, 24 Jan 2022 13:25:13 +0100
Message-Id: <20220124122514.1832-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124122514.1832-1-christian.koenig@amd.com>
References: <20220124122514.1832-1-christian.koenig@amd.com>
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

Not just TT and VRAM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 49 +++++++++---------------------
 include/drm/ttm/ttm_device.h       |  2 --
 include/drm/ttm/ttm_resource.h     |  4 +--
 3 files changed, 16 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 9e68d36a1546..2ea8fb83377e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -51,36 +51,23 @@ EXPORT_SYMBOL(ttm_lru_bulk_move_init);
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
+			dma_resv_assert_held(pos->first->bo->base.resv);
+			dma_resv_assert_held(pos->last->bo->base.resv);
 
-		if (!pos->first)
-			continue;
-
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
@@ -118,15 +105,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
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
 
 void ttm_resource_init(struct ttm_buffer_object *bo,
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
index 13da5e337350..1556d1f62251 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -37,6 +37,7 @@
 #include <drm/ttm/ttm_kmap_iter.h>
 
 #define TTM_MAX_BO_PRIORITY	4U
+#define TTM_NUM_MEM_TYPES 8
 
 struct ttm_device;
 struct ttm_resource_manager;
@@ -216,8 +217,7 @@ struct ttm_lru_bulk_move_pos {
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

