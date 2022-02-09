Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722014AECD1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3150610E58A;
	Wed,  9 Feb 2022 08:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB5F10E572;
 Wed,  9 Feb 2022 08:41:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id d10so5071494eje.10;
 Wed, 09 Feb 2022 00:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KRLs9RSyL2PaHnvYpVK6+sFtrctcwY28ykp6KexoGtE=;
 b=E0bPT5g6HEr08QCZwDSEBSabEUZ2Y0bbXqaV3oU6s97qXMuurnCaSiQ/vb/KQXvO8h
 tDKuMDCIo7iilvb3IuciHYqYWW+hht9sPDZ0NbiDCpEe8Iu42+XyWFRXCA1a0rtXgmo4
 0Iv1v3IcuNTDPc1G5N345Fjsl9jgPUv3Iv/mZc1ugX6VX6ifvH74VxsywH5pP8ETxLmq
 3Yizp/QYJu+yKWGC7SdfTygzP+erbkOOKybVxQm5NE1XHp8YWYvBYctd/ZHZv/41x+cd
 NdjyuX8z2cOy4+1wjb8arOmGSXq+7/wL/mOtuTwhcNyE21iC35WsMLfa31wBpsNJSVMf
 inQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KRLs9RSyL2PaHnvYpVK6+sFtrctcwY28ykp6KexoGtE=;
 b=reWSiSgz2XMdfvuDm6JvMhmgouRVJ9VaX5fvWiMtRjxLzP97VYeZ8tVDrj/0oEpZBc
 WvfLnMgfUEaKBep4tOiaWvy4trN4SoXpiksm2PMxQWhQdPv5yNJnhnA4TZ6MTFyao5dj
 MLu1LyCfP5AtKEmI5jqn+mdixmo5WXmckW/xFjepbNCCKAI05LemRZSxNphzQjmfl1Sb
 zuQwMyywOxaET8eSAJroRhZQf0PzfNtrKJTR1WutFcowbNMX9x9UAAam3w7jamLZ6YzD
 fFViuldJZAFznTZX/+Ayclm81N7FFct0hilbyLMc4rp+OPa0ATvKVs5UDcDOvRa0XlK1
 7wAQ==
X-Gm-Message-State: AOAM532oxbrKwxKr70oQx3Cn4ASkZsxY4q6SD4Py3EtCNwErXBbqN8iG
 d2crxvaGNT4A1ti0MMRDthaMVSnHR4E=
X-Google-Smtp-Source: ABdhPJyenptI6dYYcfoLF5F8sQ+qRSZbvfX4bJh8sz10T/r62AZDT8uxuYXLla0/UuNP0rj3rdP0Zg==
X-Received: by 2002:a17:906:40d0:: with SMTP id
 a16mr979348ejk.267.1644396069036; 
 Wed, 09 Feb 2022 00:41:09 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u6sm3807958eje.101.2022.02.09.00.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 00:41:08 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 8/9] drm/ttm: allow bulk moves for all domains
Date: Wed,  9 Feb 2022 09:40:58 +0100
Message-Id: <20220209084059.1042345-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209084059.1042345-1-christian.koenig@amd.com>
References: <20220209084059.1042345-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

