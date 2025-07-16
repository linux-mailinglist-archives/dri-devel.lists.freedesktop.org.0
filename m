Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAF7B07AA9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3948010E7E4;
	Wed, 16 Jul 2025 16:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nhh47N+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB710E7D5;
 Wed, 16 Jul 2025 16:06:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so3895e9.3; 
 Wed, 16 Jul 2025 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681963; x=1753286763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o8pLUPzWJ8Q68hff2aNSMwPyYfjcQZ6dVE1UDm3vE+c=;
 b=Nhh47N+DIkV6Th63M5CvIIzNLDkc2J4krZYT+AyH5bpzx7HnCgc8/C2Y2c+2xCs21Z
 V5IPGoamPTiE2npOZ35xgcBizbqwJ+gp95/y/iqb2bScvcPTVroCgB4xqp3a1ErwIOJZ
 373R8IV9xUuXIjRhjqXUSZavcajOfmleXf5wiwpvxl8axW0vkAAQMhCRwU6BOte4eTek
 y6AT+KQuwjQB0UTK087Fhrcp8jT2q3VjHOLtbNfeePly4zXrhdmt1QjsyNO2HSowc/wK
 TwRdPGdot+meuANgzhaCJiRERYMKi4pOv1Ngo3WFTWuHnL8/VX7Gd9WIEDgkb5WDAi/j
 BKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681963; x=1753286763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8pLUPzWJ8Q68hff2aNSMwPyYfjcQZ6dVE1UDm3vE+c=;
 b=N/vUdqhdDcW597siboSq9qGBhDLhQAC//+SeuT8sBXV2/yyF65ASBf4BELjdIsbasj
 0kMB2RDln12MYj6U0aFVYORjWMfcz4qWtH13iUQiSnuxdHhVhtOZeoUmXgEmLyUcGzlv
 rUUo0/82NHaEzocmmtDRC+r48aMX4Xt5Yvv37oIpiwgCsaG0VqlcYYR5LtUTjRj11Sui
 fS6DDaDR9g3T12ogRQTwtOC+H2n+xP8SVtvq7/jdKw1UHruSrkBaedWLEYuvJ7v3qLZI
 XUz2Gxdrh/Y83qSILV5p+zYf1XMgGSq+XXUoeefAQjLDC4p/lP76M6jfeWLulZYYvyVW
 xfnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMY9A8FUVikhfTdxVmCRjp5vMx0/Kfhxf9GtxalpuFvjDd0sN2uKIGl43A680/8Jdp2GE4mihKXw=@lists.freedesktop.org,
 AJvYcCXuNmXe/XHMZURtu/3Cz1cA6YwLum/ItGU5pbBGS6NBifHxnuNtHG2U43RgxuRXyQYY/mcS5TniUyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy48xJKaudMusCUNKx4XZijc6Q/hQuGlmXC7jKdcj7iDaAxLq+6
 Uwbiy/GbFPGm2XLJ2mh5ib3LJxiMowKdRMKHPB/9Q9978p0GpDWX67ir
X-Gm-Gg: ASbGncuSdy9xsYIazs6UCPGy9DaG7+yWOsUqJL4CXUbd5tJV3+divY/mxHi3KeuA7LD
 HQ0HP31PNFqsdpU6fGHU9m5fksKEz12b8KQzAdtYibV48TzjTGzJqR7GOSvbt4yGXyjIECX/0fz
 MpGdIlcDL4965/tySZ6TD6tG2FUvy8N6EVvsbrg78NuTQ+KgLtl8lDM70wDfR/TGNQXfj08q6K5
 Ps9qpChF39lhiXbZ7P/Q0YkyUTYtc8ldD++KJ2zDI/Q/mar/eKD0pII3iNrtRtRBTbkXU/4xVYC
 gJvMRPV5wySingIE6O+HyMvhlKqNShIG7xEW/Vy4la1myB22SPWUpOkz+8wkC4Xze6irjBrwUCL
 eoR5kmDhwep07EyKMqwk5WOw9eKSdmMh5AZg=
X-Google-Smtp-Source: AGHT+IEJH6OTPT+OJwER4E34jV9ordafmGLAsEw6c33nfgMokfplr4fMJueOZY9iNee3H+qfX8VpUQ==
X-Received: by 2002:a05:600c:674a:b0:456:2b4d:d752 with SMTP id
 5b1f17b1804b1-4562e373e16mr30664455e9.20.1752681963015; 
 Wed, 16 Jul 2025 09:06:03 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:06:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 5/7] drm/ttm: move zombie handling into ttm_bo_evict
Date: Wed, 16 Jul 2025 18:04:24 +0200
Message-ID: <20250716160555.20217-6-christian.koenig@amd.com>
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

Both callers do the same thing, so we can trivially unify that.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2a4b98bfde57..87e81e36bbd4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -368,6 +368,13 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	struct ttm_place hop;
 	int ret = 0;
 
+	if (ttm_bo_is_zombie(bo)) {
+		ret = ttm_bo_wait_ctx(bo, ctx);
+		if (!ret)
+			ttm_bo_cleanup_memtype_use(bo);
+		return ret;
+	}
+
 	memset(&hop, 0, sizeof(hop));
 
 	dma_resv_assert_held(bo->base.resv);
@@ -475,13 +482,7 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	if (!bo->resource || bo->resource->mem_type != mem_type)
 		goto out_bo_moved;
 
-	if (ttm_bo_is_zombie(bo)) {
-		ret = ttm_bo_wait_ctx(bo, ctx);
-		if (!ret)
-			ttm_bo_cleanup_memtype_use(bo);
-	} else {
-		ret = ttm_bo_evict(bo, ctx);
-	}
+	ret = ttm_bo_evict(bo, ctx);
 out_bo_moved:
 	dma_resv_unlock(bo->base.resv);
 out_no_lock:
@@ -529,14 +530,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
 		return 0;
 
-	if (ttm_bo_is_zombie(bo)) {
-		lret = ttm_bo_wait_ctx(bo, walk->arg.ctx);
-		if (!lret)
-			ttm_bo_cleanup_memtype_use(bo);
-	} else {
-		lret = ttm_bo_evict(bo, walk->arg.ctx);
-	}
-
+	lret = ttm_bo_evict(bo, walk->arg.ctx);
 	if (lret)
 		goto out;
 
-- 
2.43.0

