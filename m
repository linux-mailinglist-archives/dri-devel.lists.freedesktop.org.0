Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144214A71E4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31A410E6D3;
	Wed,  2 Feb 2022 13:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6E710E643
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:47:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e2so38534878wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 05:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tPqoGifhKFdw+HF4Re75pZoHAM7pUrdzAXkrWh6ujig=;
 b=mzSy+bYmHu5QQ5ho0QYj3r/W7BYuXmF6Wgh0cTqa0B81tHQP3zxe+Ws/HdX32Mi5RI
 0r+qzwDAH7a8kWwqFkmaTN5giOswUESMCZU5LkF/8cLSHy14KcOB1nIvlG+DceLEavc7
 CHzLFdX+kENbNYOdyOWwfqdg6PJ99TRRo1gijt3FoQLhkakUsnb8ithDDPtLYzxMBdU0
 3tmgtE9alphe6ruRtPImAgjtkuoxstRPZ3Zk9RX/LNfcQZS7wSt7/3ELridOMLKK6ui+
 hiLxWpdcFfjCmtqmmnsXewq7E0L4rv2O4fEBMC16gecbTs0Eeou/Hjposk2GC+EahD39
 3+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPqoGifhKFdw+HF4Re75pZoHAM7pUrdzAXkrWh6ujig=;
 b=4mlMlxzbts2eBdHYl+Uw3c4efAe/HEdQ0iIl0ix5TqYvxlhU49ZnsflTy/52BCyfqY
 bmuFZPO0Kv5DEJmOHMqisFEijghdXd9XHA0ztW0tkV+/6cTMVKbfMM7Liv7xUx5qooxM
 8VK8p1ElR/4NU0S/LcmdW7RM6q4S6EjbSA8CAMc4h+oWGAJTXPObNcmeQcNemPEJgvAn
 DljCuGFSCfstso6ScBh80PVFbJk1ACap3ba0ToVOHnRhCVL0EppgXg033ja5+PbemVDI
 EYCS/KL/0EwIkI2Q5SHxxJBQugNc0qNLrP+MPjf6USzfQQbHe2kS5bPn2pqf64o6guAe
 BqFg==
X-Gm-Message-State: AOAM531stXtiIOAq2h/WBt4yvTbDMUS7URnYVMsNZFCW8DBcfpMA1cjY
 6xeFknwG5trb6qasomi84swQUuDECSg=
X-Google-Smtp-Source: ABdhPJyDdkGaNMQKSKW9o3jYz8h4rfFcnLPhgRbxqYBUU9zkvjwAEWsAqZWpejRQpnCdamv1qc6F3w==
X-Received: by 2002:adf:d1e7:: with SMTP id g7mr26748797wrd.396.1643809618974; 
 Wed, 02 Feb 2022 05:46:58 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id c13sm17471876wrv.24.2022.02.02.05.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:46:58 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH 8/9] drm/ttm: allow bulk moves for all domains
Date: Wed,  2 Feb 2022 14:46:50 +0100
Message-Id: <20220202134651.296584-8-christian.koenig@amd.com>
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

Not just TT and VRAM.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 52 +++++++++---------------------
 include/drm/ttm/ttm_device.h       |  2 --
 include/drm/ttm/ttm_resource.h     |  4 +--
 3 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e3301f6277ba..5e732a509b4b 100644
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
index cc452a7aa016..5f93a16acfd6 100644
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

