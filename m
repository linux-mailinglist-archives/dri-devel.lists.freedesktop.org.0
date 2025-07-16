Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A872EB07AA8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C0910E7DF;
	Wed, 16 Jul 2025 16:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dv6sypxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637DB10E66B;
 Wed, 16 Jul 2025 16:06:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so6595e9.3; 
 Wed, 16 Jul 2025 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681963; x=1753286763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sMrKLje0DXLQnstLXzFUUW2cOA7SrnAjQLdQCwRTzaA=;
 b=dv6sypxUXND06gVDyYHFY9TDzleG5pPbsw13O5CbPlmZzkGzX+BXXOg6X2UHwuy9wp
 pywh/uDRMqpZcC2fsF+7yK7ARhJHmS1cAth3b4R+GXBYryoNwjyYOEdRbQvopIEA/k/s
 te16iyI/gqJo76f2jzV2WXWhOuupkbhab4KH6Iu1gDatmP50+sUkzMc/EbnBaAG3k3mz
 TyNWbqKXxwQ/PnKJCiEknjKGbTE0g6vbNCs2WMkR52D6j0QEoqvvX80Hw3WBqbspPKgJ
 3ISF2hIIbvd4DdcHOlysoaFMpDzsMDvnFw1tJz4JyjzwmOvW632TeYcQelTs5lEmFeFQ
 r4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681963; x=1753286763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMrKLje0DXLQnstLXzFUUW2cOA7SrnAjQLdQCwRTzaA=;
 b=KC/N10NB6GTtpgD8bQL5B8YciZu6kxtCrweoIf7A8QQKm3pt2jcZkqmvgQVHlTJPoT
 ulhNNM9Ny/oH88V2lC3IbVkP11kGzAbkASB2rID0HRjgCHABNkI0Zz1Vicm30LS3YkJX
 4hL7vqCTypRBjFnrtnZnijJW5t63FQvZy5u+yq2rZh0j2jZKV150WPGNme1Mjn89oL2h
 XQ/o/QaTuea9zpVVrN+g4cOBWjs7+ORFrZTfW9xHZY1L4SIwg5msdEzP1BIQMTq9LJlb
 OmvD6VcVWHpz55fEe+mF+fvpOgU3w/hdHvDQ/fWYDyqJbFLsBU5W0ir74vIQrNEZthnw
 KeVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvUkcO9zx/fCxPVnNE583zDS8AdJYklUX1SLpv+iVaMBpbK/PJiTCqmHXUuz1iJ+XZAnfpAyf5T5k=@lists.freedesktop.org,
 AJvYcCX43sBPnjPS3wEbuOVV7fQp123DdPFXIt430HAd6ZdF0KWdQTUMHQFhRXABw2pS7Pc6PmYIAhue/AM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxphqHan04UyvBe1PQim1rE+3VXPRLOlV6Yxp+/cg/5QuLUPQQr
 brQc0XbUX9ovTVWGlzn9J5SR4/RoyGfxX5HxcaxV8Yjylep5TlFATV4b
X-Gm-Gg: ASbGncv8LERDT0/5OuSfhB7cIj8guwtjP3f6VBm5bnPKBCg73YoV5IIjj4EmgYg4qgF
 FrkgmasgIZm7XmMYp6r3q8NRjmLllwrMG+INLckr9LUyEc/VTom3XRdCyS1qcw+SF7Bys9lKzCa
 YZu+84+ha38JiDGdesgF56bDP8YEnlpQzv0zhPQ6JJIZGm1JaDG++GoMvUl5GntciKcgubgPCJA
 L4SOBo/YpB1daC8GLvV5rJhyhFU9Z9+9Z5m8Ten6ZHiUha9Lr37oRcnbO3uZsi5Dj0jsPjFkt/a
 2eCI8lt4PnRYG/Rxqxdyeio17ashmmvBnG01uRNv0U7h7FXXH58+RTwJPnmCxXWBxdQvsFjdcfQ
 sqf7ZrItakoiIrqDOoY3SVy9mMZ5MyHipodU=
X-Google-Smtp-Source: AGHT+IHtDuNZKhrTXNHz0C4CSz3XTvaFsEq0KULBOcRJ4AQOxVPmNSjEYD22OEt37hVJ/8bo/h+KJA==
X-Received: by 2002:a05:600c:1546:b0:43c:fe5e:f040 with SMTP id
 5b1f17b1804b1-4562e283d99mr27163415e9.23.1752681962375; 
 Wed, 16 Jul 2025 09:06:02 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:06:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/ttm: switch to ttm_bo_lru_for_each_reserved_guarded
 for swapout
Date: Wed, 16 Jul 2025 18:04:23 +0200
Message-ID: <20250716160555.20217-5-christian.koenig@amd.com>
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

Instead of the walker wrapper use the underlying foreach. Saves us quite
a bunch of complexity and loc.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 57 ++++++--------------------------
 drivers/gpu/drm/ttm/ttm_device.c | 19 ++++++++---
 include/drm/ttm/ttm_bo.h         |  5 ++-
 3 files changed, 27 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ea963dc43b62..2a4b98bfde57 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1087,25 +1087,18 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
 EXPORT_SYMBOL(ttm_bo_wait_ctx);
 
 /**
- * struct ttm_bo_swapout_walk - Parameters for the swapout walk
+ * ttm_bo_swapout() - Swap out buffer objects on the LRU list to shmem.
+ * @bo: The buffer to swap out.
+ * @ctx: The ttm_operation_ctx governing the swapout operation.
+ * @gfp_flags: The gfp flags used for shmem page allocations.
+ *
+ * Return: The number of bytes actually swapped out, or negative error code
+ * on error.
  */
-struct ttm_bo_swapout_walk {
-	/** @walk: The walk base parameters. */
-	struct ttm_lru_walk walk;
-	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
-	gfp_t gfp_flags;
-	/** @hit_low: Whether we should attempt to swap BO's with low watermark threshold */
-	/** @evict_low: If we cannot swap a bo when @try_low is false (first pass) */
-	bool hit_low, evict_low;
-};
-
-static s64
-ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
+s64 ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
+		   gfp_t gfp_flags)
 {
 	struct ttm_place place = {.mem_type = bo->resource->mem_type};
-	struct ttm_bo_swapout_walk *swapout_walk =
-		container_of(walk, typeof(*swapout_walk), walk);
-	struct ttm_operation_ctx *ctx = walk->arg.ctx;
 	s64 ret;
 
 	/*
@@ -1176,7 +1169,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 		ttm_resource_del_bulk_move(bo->resource, bo);
 		spin_unlock(&bo->bdev->lru_lock);
 
-		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
+		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
 
 		spin_lock(&bo->bdev->lru_lock);
 		if (ret)
@@ -1193,36 +1186,6 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	return ret;
 }
 
-/**
- * ttm_bo_swapout() - Swap out buffer objects on the LRU list to shmem.
- * @bdev: The ttm device.
- * @ctx: The ttm_operation_ctx governing the swapout operation.
- * @man: The resource manager whose resources / buffer objects are
- * goint to be swapped out.
- * @gfp_flags: The gfp flags used for shmem page allocations.
- * @target: The desired number of bytes to swap out.
- *
- * Return: The number of bytes actually swapped out, or negative error code
- * on error.
- */
-s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
-		   struct ttm_resource_manager *man, gfp_t gfp_flags,
-		   s64 target)
-{
-	struct ttm_bo_swapout_walk swapout_walk = {
-		.walk = {
-			.process_bo = ttm_bo_swapout_cb,
-			.arg = {
-				.ctx = ctx,
-				.trylock_only = true,
-			},
-		},
-		.gfp_flags = gfp_flags,
-	};
-
-	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev, man, target);
-}
-
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 {
 	if (bo->ttm == NULL)
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index c3e2fcbdd2cc..7ba18e782131 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -173,6 +173,12 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
 {
 	struct ttm_resource_manager *man;
+	struct ttm_bo_lru_cursor cursor;
+	struct ttm_buffer_object *bo;
+	struct ttm_lru_walk_arg arg = {
+		.ctx = ctx,
+		.trylock_only = true
+	};
 	unsigned i;
 	s64 lret;
 
@@ -181,10 +187,15 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		if (!man || !man->use_tt)
 			continue;
 
-		lret = ttm_bo_swapout(bdev, ctx, man, gfp_flags, 1);
-		/* Can be both positive (num_pages) and negative (error) */
-		if (lret)
-			return lret;
+		ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &arg, bo) {
+			lret = ttm_bo_swapout(bo, ctx, gfp_flags);
+				continue;
+			/* Can be both positive (num_pages) and negative (error) */
+			if (lret && lret != -EBUSY && lret != -EALREADY)
+				return lret;
+		}
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
 	}
 	return 0;
 }
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 63331a4b37f9..6e85f9e207ad 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -398,9 +398,8 @@ void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long pag
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-s64 ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
-		   struct ttm_resource_manager *man, gfp_t gfp_flags,
-		   s64 target);
+s64 ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
+		   gfp_t gfp_flags);
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_bo_evict_first(struct ttm_device *bdev,
-- 
2.43.0

