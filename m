Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE739F0AE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B56EB2E;
	Tue,  8 Jun 2021 08:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC90A6EB2E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:19:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m18so20549654wrv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/XW3yuW4Rwegyj6kJSlqdjN9Hxd4kL/tiEoBu2KFNHc=;
 b=TPr/SV33wY+OQny1lNs5Zs2LM6Fc6CeM79MYqW1pPXWmtN8hFHHB+Bl9AmUsiMlaUt
 pm+iYEi3q6Kesg8IIlAhof3+vEaVANfJbAAkDpBoKJFZvEuG8xiwIR5VwqCn2GEbFdBB
 ZQdYfUzS6SW3HlvZop8UO2AUm5R++chhAvJ/h4/l92XNlCzdYZZbFbVHRttBXPHRBS8x
 847Xw5V74MjHFDsJ+a8vxVFZtX6lZGkTZbbtAGWtn4TSBpkVY4qyFM1EfY5mWvUy3gJf
 ObgyFzjQ7KZ3/0/UT/v1sKr+unuwK/714P/wPl4fGwM2iZXSndqG8HbMDUiVQCm8mLjn
 OucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/XW3yuW4Rwegyj6kJSlqdjN9Hxd4kL/tiEoBu2KFNHc=;
 b=fBJMEv94GP8Qx5aA+3ko+QCrlSWO3BFNH2s6JMTdoWo43DYBNGhqv+0C3aH/1pmtR4
 3ZZWAWsWMU5s+MpF47GHHbXZT+dInhVJTt9CyOdPVA72aupA2CTRbP8DSorfysPJFtAK
 t1j6ejfhm1spbZWVgR5Euqazy51KKHn3pzKGo3x/XjyHNXKpz+zbawM4xl3KLVJ6ff71
 1N0eTvFavYLjhyPOiQWdQPQdS4wNZmpMyEV/8GVFYMhxB1ZcgDSb5lzabMsaM6XTN5HW
 4QCRL0JUc6LNYkRkaUBBWvAT/S6L/2Y3ztvKr9w7OseIzTx4GCMXPTsjS5Jrq8icZTBY
 E8lA==
X-Gm-Message-State: AOAM533e+ZwNi1ZWT9MQA0Iu3GA/INfnuawulwdCl4R4fOzqOkdU3ulA
 PI+ne42i5LpbWV2XgpqjlzKLrKQEViU=
X-Google-Smtp-Source: ABdhPJwqVTUKEv+WKny4V1GGg939c3a6a9nXn4vdrFOzf3SH+x2CjYjKvzGKuaVk5vX1j3Pa+FaWHg==
X-Received: by 2002:adf:9c93:: with SMTP id d19mr21022864wre.17.1623140372455; 
 Tue, 08 Jun 2021 01:19:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:86d3:bbc0:375f:c2ad])
 by smtp.gmail.com with ESMTPSA id v7sm18612342wru.66.2021.06.08.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 01:19:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix pipelined gutting v2
Date: Tue,  8 Jun 2021 10:19:31 +0200
Message-Id: <20210608081931.11339-1-christian.koenig@amd.com>
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

v2: add missing return value checking, also handle idle case

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 9be6a10a5873..2f57f824e6db 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -582,9 +582,14 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
 	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
+	struct ttm_resource *sys_res;
 	struct ttm_tt *ttm;
 	int ret;
 
+	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
+	if (ret)
+		return ret;
+
 	/* If already idle, no need for ghost object dance. */
 	ret = ttm_bo_wait(bo, false, true);
 	if (ret != -EBUSY) {
@@ -592,14 +597,15 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 			/* See comment below about clearing. */
 			ret = ttm_tt_create(bo, true);
 			if (ret)
-				return ret;
+				goto error_free_sys_mem;
 		} else {
 			ttm_tt_unpopulate(bo->bdev, bo->ttm);
 			if (bo->type == ttm_bo_type_device)
 				ttm_tt_mark_for_clear(bo->ttm);
 		}
 		ttm_resource_free(bo, &bo->resource);
-		return ttm_resource_alloc(bo, &sys_mem, &bo->resource);
+		ttm_bo_assign_mem(bo, sys_res);
+		return 0;
 	}
 
 	/*
@@ -615,13 +621,11 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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
@@ -631,6 +635,14 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
+	bo->resource = NULL;
+	ttm_bo_assign_mem(bo, sys_res);
+	return 0;
+
+error_destroy_tt:
+	ttm_tt_destroy(bo->bdev, ttm);
 
-	return ttm_resource_alloc(bo, &sys_mem, &bo->resource);
+error_free_sys_mem:
+	ttm_resource_free(bo, &sys_res);
+	return ret;
 }
-- 
2.25.1

