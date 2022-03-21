Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA71B4E2776
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4EE10E2B3;
	Mon, 21 Mar 2022 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9054710E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:26:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q8so9326922wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cCPmpy5nYkGImtD9oZAnpAmz4KTpjAOUUu3dJEQfWmo=;
 b=XSt+UtdgsD+Hv/dxKnsSTVlsdfDFq1PDZn1cTm6fWDd/lcKmCqNP9dLGfbSIAWhCfY
 GiDYdYNpeK8FwIvc5T+j+hObKr1DKvhqTgmFqIDZ4MQXdyi+tLbdpctnq+tEjm1321PU
 eRnS0BgD8k1V+v7/ZYQeWabRi7Y4nHLH1dnC2XAuLDzK7/42RuJamYxj780/J3pMFpZD
 5xAJ75TAAKol8d7kGYlf4iUvPYr0HuMeIOkblPxT+W28Duh+4EqhYng7se2v0DACHnW3
 jrVNKhRPe/O7K63WW+FifzjQbw4Z7cCSDlfcJPS4LtTi/grpTXh5iMgVQCtdkAvklNXD
 y8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCPmpy5nYkGImtD9oZAnpAmz4KTpjAOUUu3dJEQfWmo=;
 b=o0jJJbJL2E+5rr1mfHfk/6Z2i0GW2BY3J02wO6J0yaXZi+qhm4YdYdD3fsdOJGJ96Q
 W1VXQZ9hVsR6OJTGL+va6RJ0ErZG6+EBLbmFMDk09tvtZC32u7EVAgCWu4J2JeKhXqU/
 oiwoupjsrKxfrrOfu4zeZBOz9oV+sgtPPAMB18kW/WioFKqpdwCGfxvFgK4Q4/OMAizJ
 CCj7OzpPzxrut09R1mfsATulmlM2QmkC0mL/AoOj1mau9eK1VEAl9RJLmeL/ycMOQa01
 fgdTD/2Svhezw6/p7TGBwkMoQNfko72Ke8B8czEkcsVDCq9vZovaLgXOeNm4GK8iHIjB
 GGcw==
X-Gm-Message-State: AOAM533ZJ+Iz0PzfZ9jXiUTgccgiahZyilqPq3ICeo3eFE03b7051Ey0
 67WLh+zU8GuLNB4muIyDjW4=
X-Google-Smtp-Source: ABdhPJxspchaHKiHWokeOTO/+VYi6S8xDem7DrDRUeqm0bCVYMfuLjHv6QvB0oexuiVYYlWPLauqzw==
X-Received: by 2002:a5d:498b:0:b0:203:e5d5:622c with SMTP id
 r11-20020a5d498b000000b00203e5d5622cmr18562874wrq.153.1647869166109; 
 Mon, 21 Mar 2022 06:26:06 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm13714494wma.21.2022.03.21.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:26:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, felix.kuehling@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/ttm: allow bulk moves for all domains
Date: Mon, 21 Mar 2022 14:25:58 +0100
Message-Id: <20220321132601.2161-3-christian.koenig@amd.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
index 81676c3dbeee..25b0a23ba04b 100644
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

