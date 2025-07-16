Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A564B07AA6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BCD10E7E1;
	Wed, 16 Jul 2025 16:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kHvR2IHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAF910E667;
 Wed, 16 Jul 2025 16:06:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45617887276so61355e9.2; 
 Wed, 16 Jul 2025 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681964; x=1753286764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4yWAeyPEBtv9cHiM6+nOppiwyojo/9T+uDKW+fDq5n0=;
 b=kHvR2IHgtaKiZs+OywFqmxSaHHU6FZq58UhUtXr2HVyPvV0xTXhJYn1jahSsVV8pnO
 LJy6L9gASg6MwkDimNvAnUjPIbiZTNQ49tBpV7FoJ9caPqOt+y8cYOCHgtUiRjuOxf4C
 7kFJYlf1TYHxi7XSOBeDnubxhjEJg52E6X0nIkgTvC/VKgXrjFFkPsiCSw/LC5dX7BXG
 tFbuFLKOy/UZ3Jdwuu1cznlWzOHk3p7zYcPEA1ns+wdFUjh9bGtEF0VV5lyFXAgU2Mem
 m0fiaU/ULGOowVsLk9DT5Tq4b+OdIx2JCLrSTrN7jC6nRuzHUdMtG/sqkumLKQPuxEdm
 1W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681964; x=1753286764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yWAeyPEBtv9cHiM6+nOppiwyojo/9T+uDKW+fDq5n0=;
 b=cP0QTgcxQcq3t4ZaEWkZFqkFdB0+eM1jJD8pFfaAIH1TEvMaLvatfqCYc+DN+Alfa6
 OoTGsM6m1y86NWtXvc8v/2+QrEhqt+u1N07aZgI5KMOqce5FaTHHJWYzoEP0ElS4fAgQ
 dA6JYm3iE57YxkTx48cfqo2AJjkR0V0bxP8q4aJxvNc4f7TPieT7YhEsPi2+KRSLXe81
 RNCy5g+rW0qFiDBoy0wQx7SVF9g6WmK0E4yfRM+V09cDkugRct0BSpRnbZu7SdZOtW4d
 WK3OY+cUJKB9ouIkNd9sXTry+GgeZ4ylIzCsE32rpnsRyItMqLs7Ozo5GqkPlRCZUmEM
 X9tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv4q/V+/cUO6hXKFiZZJZxB6yONr352jk3IHd6t31TC+39ddmoKLXohfT0LZmMe1fcfCfbsNdOqL4=@lists.freedesktop.org,
 AJvYcCWgsY4UOzB40g1zgw+5peNpwgM5VDjrOoxnspttrppXAt79p4E6MilmW4gGf+6nUNx7rvfhMCDJYk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmgXmICpEWKXIJw2sLWdFm+WRIU9twLQo1Rp2uhKfUT8QSrdIC
 HktG8r7zqZLFb5PYIo/jo6rfMUrGugtq+zW1aWUdmpKGWvdHNaXXojNtspfkyvjB
X-Gm-Gg: ASbGncsmBdUVNHlnLv+d2pRZeUt5SHVBmz2vtB5TGxhDgPKAk/DD0UOpPIoFq5tacyi
 a8CY+uVwtUYCQvcmpc8zDhDKr6ux2AlY/5Vx2G2RAssb4iB6+KHa4rjWK7oQXwfB80x7djmtLsl
 CBh/XoW+wopoZl++sM4a8+mckzPII6/FQwQE2aib3dgyxu1bsfJd6fXIqqSiySj6cuSEevyzxoM
 PLQduKZkgKwEERaNMZfnmd2EslXiHbyfuUJuQzLp6AGJaRuRhKE7ijZ8v6b5IQapLrcFOt3cHBp
 8iko2fGyh1VHY2MSqzmkEedaJBxkVo/Ltyr6EQi4ORjw+EtKBfeF+U5k0aJjkSZmv+HdwDJeIq+
 143oxBzbbEiMKGJ1Wo01wgBVKcH0Zu7C6Txc=
X-Google-Smtp-Source: AGHT+IHeDncJjFyFJ77JBBeIdnBGnvrQ6INAwf0kRrPgziIpKcOoduPZEeDc2FNLLaz7Y/S31q+avw==
X-Received: by 2002:a05:600c:45cd:b0:43e:bdf7:7975 with SMTP id
 5b1f17b1804b1-4562e39b723mr32633895e9.32.1752681963709; 
 Wed, 16 Jul 2025 09:06:03 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:06:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/ttm: use ttm_bo_lru_for_each_reserved_guarded in
 evict_all
Date: Wed, 16 Jul 2025 18:04:25 +0200
Message-ID: <20250716160555.20217-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716160555.20217-1-christian.koenig@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
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

Use the for_each loop to evict all BOs of an resource manager as well.

Greately simplifying the handling and finally allows us to
remove ttm_bo_evict_first().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       | 51 +-----------------------------
 drivers/gpu/drm/ttm/ttm_resource.c | 17 ++++++----
 include/drm/ttm/ttm_bo.h           |  1 +
 3 files changed, 13 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 87e81e36bbd4..5d5fffcf16c0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -359,8 +359,7 @@ static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-static int ttm_bo_evict(struct ttm_buffer_object *bo,
-			struct ttm_operation_ctx *ctx)
+int ttm_bo_evict(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
 {
 	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource *evict_mem;
@@ -446,54 +445,6 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
-/**
- * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
- * @bdev: The ttm device.
- * @man: The manager whose bo to evict.
- * @ctx: The TTM operation ctx governing the eviction.
- *
- * Return: 0 if successful or the resource disappeared. Negative error code on error.
- */
-int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
-		       struct ttm_operation_ctx *ctx)
-{
-	struct ttm_resource_cursor cursor;
-	struct ttm_buffer_object *bo;
-	struct ttm_resource *res;
-	unsigned int mem_type;
-	int ret = 0;
-
-	spin_lock(&bdev->lru_lock);
-	ttm_resource_cursor_init(&cursor, man);
-	res = ttm_resource_manager_first(&cursor);
-	ttm_resource_cursor_fini(&cursor);
-	if (!res) {
-		ret = -ENOENT;
-		goto out_no_ref;
-	}
-	bo = res->bo;
-	if (!ttm_bo_get_unless_zero(bo))
-		goto out_no_ref;
-	mem_type = res->mem_type;
-	spin_unlock(&bdev->lru_lock);
-	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
-	if (ret)
-		goto out_no_lock;
-	if (!bo->resource || bo->resource->mem_type != mem_type)
-		goto out_bo_moved;
-
-	ret = ttm_bo_evict(bo, ctx);
-out_bo_moved:
-	dma_resv_unlock(bo->base.resv);
-out_no_lock:
-	ttm_bo_put(bo);
-	return ret;
-
-out_no_ref:
-	spin_unlock(&bdev->lru_lock);
-	return ret;
-}
-
 /**
  * struct ttm_bo_evict_walk - Parameters for the evict walk.
  */
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e2c82ad07eb4..9ee5a9f444f0 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -546,20 +546,25 @@ EXPORT_SYMBOL(ttm_resource_manager_init);
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 				   struct ttm_resource_manager *man)
 {
+	struct ttm_bo_lru_cursor cursor;
+	struct ttm_buffer_object *bo;
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = false,
 	};
+	struct ttm_lru_walk_arg arg = {
+		.ctx = &ctx,
+		.trylock_only = true
+	};
 	struct dma_fence *fence;
 	int ret;
 
-	do {
-		ret = ttm_bo_evict_first(bdev, man, &ctx);
+	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &arg, bo) {
+		ret = ttm_bo_evict(bo, &ctx);
+		if (ret)
+			return ret;
 		cond_resched();
-	} while (!ret);
-
-	if (ret && ret != -ENOENT)
-		return ret;
+	}
 
 	spin_lock(&man->move_lock);
 	fence = dma_fence_get(man->move);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6e85f9e207ad..2eaed0780d21 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -379,6 +379,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 void ttm_bo_fini(struct ttm_buffer_object *bo);
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 			  struct ttm_lru_bulk_move *bulk);
+int ttm_bo_evict(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place);
 int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-- 
2.43.0

