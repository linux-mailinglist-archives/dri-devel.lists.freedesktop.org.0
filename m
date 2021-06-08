Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B539EFED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054AA6EB11;
	Tue,  8 Jun 2021 07:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB8A6EB11
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 07:50:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so1190585wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeGIBfFarynnkUrwR/ZlznxEuLwTkYXnZcQv2CRKZ0Q=;
 b=JmQMhAId07QO9t6xVhT0JD/f79OZnxyT7d+w55tzLPcW+v+QIwfu+Ib50g+VbuiI2w
 7fMwwBE+qebSys89Kh2fKZHnEMu3KyAR0JDe5acYhjxfosmN1Qm1uTwiJvO+WUeniNoQ
 68fptMmVdGpknOsmODikOS51aLdMCgW3lowt8mvMMHjKZOG+3b2zrpmF6Rrf+K09oX/x
 x2vUzwPyQMTtuXX31EXYOaasFzK0kSjBBAz6+tfABkMZKDH7AG3tiKaFpFJJbT3pN2ax
 e14Mchfg18Yl7HnP6HDwfBDzYNHMm0cdxbnCstvWRBF97IR1tND3Dhkv/HwtZtZxFqNK
 TAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeGIBfFarynnkUrwR/ZlznxEuLwTkYXnZcQv2CRKZ0Q=;
 b=Lf99YYVKg9M7a9QZWwnK7qQ9HJVKEYBoZKbEGJz9mH0TjfjyBq7Kc0roXMEcvZi0bg
 pNjXhValvFO6F6mr+gv0Sm8YdzkICbbZRLgyLAneJq3+Un5Y2nLBMJtZaQbJl+F925c9
 w5urS/4aF1j1Fjt21NEtREOxe6A5oAZLoLsdGs2AZQqcbrekE0ZLa3XAioXytRywUqNu
 EApRtzvJRwBvcuZj2fgvCbM7xlUzRmK8pTpSFtYOm8CO4PQLpUnPHAx8QO4w8NJ5fwgW
 AYvGVG7fRa0rj8ouK1iA/x6iOkvNKlqxsb+bEICjVLmvL8mcmBo2bQ5PP319zTD5dQ1p
 seig==
X-Gm-Message-State: AOAM531DtJNGf+yACjySW0xGEWp9zJroR813TS9Ss/8PnMNDBAqwIDol
 zEW27fF/wtpMnG6L5+PKQUcjckcPHBU=
X-Google-Smtp-Source: ABdhPJzd6g2kBQhHpqt++e9fwtJjxKrwni52Qq25AWyZpsHWn7UcEre++uw9xrLBnACUZ+bSAomKlw==
X-Received: by 2002:a7b:c853:: with SMTP id c19mr2853575wml.30.1623138622548; 
 Tue, 08 Jun 2021 00:50:22 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:86d3:bbc0:375f:c2ad])
 by smtp.gmail.com with ESMTPSA id o18sm1872698wmq.23.2021.06.08.00.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 00:50:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix pipelined gutting
Date: Tue,  8 Jun 2021 09:50:21 +0200
Message-Id: <20210608075021.3058-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to make sure to allocate the sys_mem resource before the point
of no return.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 9be6a10a5873..eccf2ad8f335 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -582,6 +582,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
 	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
+	struct ttm_resource *sys_res;
 	struct ttm_tt *ttm;
 	int ret;
 
@@ -602,6 +603,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 		return ttm_resource_alloc(bo, &sys_mem, &bo->resource);
 	}
 
+
+	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
+
 	/*
 	 * We need an unpopulated ttm_tt after giving our current one,
 	 * if any, to the ghost object. And we can't afford to fail
@@ -615,13 +619,11 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		return ret;
+		goto error_free_sys_mem;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
-	if (ret) {
-		ttm_tt_destroy(bo->bdev, ttm);
-		return ret;
-	}
+	if (ret)
+		goto error_destroy_tt;
 
 	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
 	/* Last resort, wait for the BO to be idle when we are OOM */
@@ -631,6 +633,14 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
+	bo->resource = NULL;
+	ttm_bo_assign_mem(bo, sys_mem);
+	return 0;
 
-	return ttm_resource_alloc(bo, &sys_mem, &bo->resource);
+error_destroy_tt:
+	ttm_tt_destroy(bo->bdev, ttm);
+
+error_free_sys_mem:
+	ttm_resource_free(bo, &sys_mem);
+	return ret;
 }
-- 
2.25.1

