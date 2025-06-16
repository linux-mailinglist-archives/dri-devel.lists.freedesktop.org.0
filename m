Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5AADB123
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236FA10E38F;
	Mon, 16 Jun 2025 13:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kCQjveV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884110E386;
 Mon, 16 Jun 2025 13:07:31 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad89c32a7b5so688127166b.2; 
 Mon, 16 Jun 2025 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750079250; x=1750684050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6HsEnJf6J6CxVp5EEQQGWh3uQy/4Uu182VhO2tmXgsc=;
 b=kCQjveV4zSwmeEyAkVAoM3W+YSQsDUzLGDH1skaJ8EKHwVCc+MjnJgK5CbiwWvA612
 P2HbVbVwrq38JG4f7Rvx7QryASUYWJpdADx/b9kADTfP0Od4cM1N5l0CdxqQH4AzR0hZ
 ak9IxM6iHjvsNY1mV3DwaZPJjLlKDUcfN+VCihoCWDrWY9Zy8SZcx+hUKK263h+u/AnS
 bV0ULx0OWshHuw6At6s32uPyvXsYN2ZxZ7al8B3TdpvUGXmBtppaCR2RZke1kQVBoPu0
 /Zaa+3yNGYV9IL8yOPdIWZtETgqdKB4PNXIm87Oxjtej1D4E1LGtFx49ISQezqF5/KKJ
 lEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750079250; x=1750684050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6HsEnJf6J6CxVp5EEQQGWh3uQy/4Uu182VhO2tmXgsc=;
 b=hJTJRots7mAeL+VjaxuylJqn61Tx59PazZV+WgBPtXEl9N0CvShoX/EzOhuNYEgrtE
 RzZIVhSum4B10uE4T1oEet20BBx286G0jaVKqOX2EHuA9JAuZTaQ5kHZIBKYRarhIvU9
 +ODZpLtrxMSPtVCcwZxwuI01hbM/9n5/bStEkXKyOjhDP5GdJbrTJEo7lDQYtPgF29zY
 Fyay33wYEsjQB0jK094hTWE8rJbmKvEXvEcmNylqH4eqOpyJUhJLFTDwrcT0EubqVRNo
 xSqHYDqzgVqqfwbGzmPFB6pF70ComoJFcdGZpVzCt4DaXMP4dpfZLQOffy+ouZxv3+yR
 pqdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUodTiAK6qmsc5Ud1csU8k8po8UauReXIFLb1KtJ8uiVtWNPIeToceSZu5+9H95P1ea3g72epYUrOs=@lists.freedesktop.org,
 AJvYcCW738wBvLQhyULly6X5sCNNBbiDQHWq+3JvYPIU3fiJUaetEQLXF0U9QZ5FIi3acCST9AIYblnnPfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5w2IZRYZEomw7NKATKdMao28ukyij+perpCZuNca6IaeP7ZiK
 CnKfTLsVpcsV16FRSpwEf5+hpHkiMDV71yUvZth1CDojBBAzGRatpyyx
X-Gm-Gg: ASbGncvEseZ0757NEm1hLqIeS/C+pZ0Q5VpVuiQv3elQa2KkNrl0qpT8jtzY3G45I6n
 Kf4/bdcLP0IUBI0+ZdZZNQeSjNmBfrgchZAUrbNTAImjZYyOkk8eJBSgQtzhwX8TqqzSAzBlkL6
 JrCp7E3Z+uITVPYKlJso3Boc9wYrPsu1vk7QD4UprYG6DKSypLWw8BFNhchc5L7KxnarxtJj1HO
 obsYdRryMbwb9X2kFUAYJ/pJdAc5FYAcrA8qtcyMg5qyfVcmJESJqlkebyRxACJBaBzK2iVd8G7
 hX1sC8n5eJjHIpTUVvhOmTkVtxLMgb3gyF/rI2WyJ4Y+SnGryGrisvntm3QfbbXdAAMaCWm9jLz
 N
X-Google-Smtp-Source: AGHT+IGD2j+R7DTeQ9XuPlOQmumKnJoAnTJ1SzewI6cp+vRoxJOvC0uTaEYJVwJ/IjECKCGzTdVTFQ==
X-Received: by 2002:a17:907:3e1e:b0:ad2:1cd6:aacf with SMTP id
 a640c23a62f3a-adfad487be3mr787422866b.47.1750079249777; 
 Mon, 16 Jun 2025 06:07:29 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1535:2600:63e1:a803:ebae:a9dd])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf93630a33sm520717766b.29.2025.06.16.06.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:07:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 3/6] drm/ttm: fix error handling in ttm_buffer_object_transfer
Date: Mon, 16 Jun 2025 15:07:23 +0200
Message-Id: <20250616130726.22863-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616130726.22863-1-christian.koenig@amd.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
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

Unlocking the resv object was missing in the error path, additionally to
that we should move over the resource only after the fence slot was
reserved.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b78365dc1fed..56f3152f34f5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -256,6 +256,13 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
+	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
+	if (ret) {
+		dma_resv_unlock(&fbo->base.base._resv);
+		kfree(fbo);
+		return ret;
+	}
+
 	if (fbo->base.resource) {
 		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
 		bo->resource = NULL;
@@ -264,12 +271,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 		fbo->base.bulk_move = NULL;
 	}
 
-	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
-	if (ret) {
-		kfree(fbo);
-		return ret;
-	}
-
 	ttm_bo_get(bo);
 	fbo->bo = bo;
 
-- 
2.34.1

