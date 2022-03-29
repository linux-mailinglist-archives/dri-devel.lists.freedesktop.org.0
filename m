Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED134EABD5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27B510EFF7;
	Tue, 29 Mar 2022 11:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CCD10EFEF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dr20so34298954ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8T2RpYqmq+Q669HqPRke2HrPoVnz7H0SzDcKNjmIkiw=;
 b=MevmEAx/w70QdZKikoDIzoI+ktHpSf/zTQsHMcMQraz5SrWUX8Ga/xhNUvi2PvwDEB
 0npgmLPKeYS0imAegs5IfMyjrIs8pU06R+7ukg+awV8Dq1z2087gJ85fT7bT09C3ZR7O
 oD0C8bpfeNfvYlVSnlmEwUCOe5SGWUugbMBnSiy5mvZwgdaxsW66Amn+asiVttuURMrw
 agJwSDpwPpax/JKepiRluMbvwQaR/MBu8PZDs860x5LY9kPTdepb80ynCcjS7ir5Zz4U
 QAfhXjANr+X/mCUL0FAwY8MYXbCre0jMnqptGZos/hg/VP06ltZTd86wF/WYBAsuUhFb
 gC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8T2RpYqmq+Q669HqPRke2HrPoVnz7H0SzDcKNjmIkiw=;
 b=kAZZ5Ab/VB3Be5uw9ECjBbFwLD/biIuC7OOQU2l8K4ksGQuS++M/FBv+mSINdeY3Em
 rORecpNQmA7sfdfJiscBhtaZTuglSd5hbiuTGdFYMlO4HUo+3mh+g2B3TFfxOto3y3rb
 CPHvSiUAfsmFTTDAxuyCVXKxHznDddjGixNpRtPgEYHpCDFX6g+JArxaX1GyO2c/hdn6
 zFiIE7htydOH+OoEVzYhfoDSdhdU+AmIeZlteY2zSXU8pI6i0GgmF2UjSE08jOYlCq4s
 EjMqldyixnOeHu5aiEw/KUEj4/2ff6jPfow35wfAQkZsqmGVIGkdR5RVOySKMClljERu
 ureA==
X-Gm-Message-State: AOAM5310BkgTDwO0L/WQ/iDQdnHZEo+6V2+vo4ccz3RvHMtMbE7tYXcZ
 Z2swB+7xqaFksU4RL7ODQ6Y=
X-Google-Smtp-Source: ABdhPJyxwbVEW2VSci9YhzDDakVYUVwH29U6mYDnz/Y9rKX+kn0EgOVK0uXl/9E54H6Xn5fGhDPI+w==
X-Received: by 2002:a17:907:9482:b0:6da:a24e:e767 with SMTP id
 dm2-20020a170907948200b006daa24ee767mr33396051ejc.479.1648551769034; 
 Tue, 29 Mar 2022 04:02:49 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
Date: Tue, 29 Mar 2022 13:02:33 +0200
Message-Id: <20220329110243.6335-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new interface instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index b827b87aefe2..7afafbbc4ea0 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -133,9 +133,12 @@ int radeon_bo_create(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     struct radeon_bo **bo_ptr)
 {
-	struct radeon_bo *bo;
-	enum ttm_bo_type type;
 	unsigned long page_align = roundup(byte_align, PAGE_SIZE) >> PAGE_SHIFT;
+
+	/* Kernel allocation are uninterruptible */
+	struct ttm_operation_ctx ctx = { !kernel, false };
+	enum ttm_bo_type type;
+	struct radeon_bo *bo;
 	int r;
 
 	size = ALIGN(size, PAGE_SIZE);
@@ -200,11 +203,13 @@ int radeon_bo_create(struct radeon_device *rdev,
 #endif
 
 	radeon_ttm_placement_from_domain(bo, domain);
-	/* Kernel allocation are uninterruptible */
 	down_read(&rdev->pm.mclk_lock);
-	r = ttm_bo_init(&rdev->mman.bdev, &bo->tbo, size, type,
-			&bo->placement, page_align, !kernel, sg, resv,
-			&radeon_ttm_bo_destroy);
+	r = ttm_bo_init_reserved(&rdev->mman.bdev, &bo->tbo, size, type,
+				 &bo->placement, page_align, &ctx, sg, resv,
+				 &radeon_ttm_bo_destroy);
+        if (!r)
+		ttm_bo_unreserve(&bo->tbo);
+
 	up_read(&rdev->pm.mclk_lock);
 	if (unlikely(r != 0)) {
 		return r;
-- 
2.25.1

