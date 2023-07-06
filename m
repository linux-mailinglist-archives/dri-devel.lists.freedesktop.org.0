Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B574A598
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D783410E4C6;
	Thu,  6 Jul 2023 21:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF4510E4B3;
 Thu,  6 Jul 2023 21:11:06 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-66c729f5618so1003248b3a.1; 
 Thu, 06 Jul 2023 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677865; x=1691269865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/LKr4NvPMbCvi0D9usVxvRWmWQvsOjG4NG+cTraaNs=;
 b=Wbc9yvkyQ4T9wyDXEqUEd2lOpZ0elnplp4ZSoz0sSjycNIlGHY/GasGFw315MZ4Uob
 kTz8PAHsRbxfpCRi8qFIep6qtzDdh+R5UQffTF8diII5o43vFQ/of07xqpH7C98HJsb9
 he6LegwmVnclfSJerS48kj5mOhRad2UUofbguTrM8KKmWwkMBEUBUg6OYkET8RaSnQYh
 +FZPbgImWQ/8yVOcOP1ajzNGrTJyZCx88ekA5/9E1ZaxE3ib/XGgcOhTkfof6dcl1sb0
 WbPt2Qo4sSZGJ5p41EE/0m6GF006J3sPYVzhQ9+oXhS2YGtFKRq+uuNfh8s88GBlP/aN
 IRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677865; x=1691269865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/LKr4NvPMbCvi0D9usVxvRWmWQvsOjG4NG+cTraaNs=;
 b=fiD753Lo6/xj36hZVVXUst53NbV55wuxyB8+AiHbiC8DscBtAA50VF/ogzK1LQgcGL
 lqImkhlQEgxTLpwfFFqKV8ZAZ8l/79ba8zdhlRCHwu6h5UH7vA+QllAFbfV2bAXOK5l6
 9ndfwbjhbDfK93CQQQ/f7GJv+uwHm9YKCpMtyKHKvtLDTLtb1sa1jGeslywlNDJSnCAz
 pCpMF11ldhKaaJHikI4zcMeRTyQ7jwS6H2vToxQlYBnTEN6IcM2enJtK6EmeuUyXySXR
 QZO5ed3K1+n2oXiwSnTZnoDCYXLeLqdIgJQrOKE/jSey2lYe39N7XYmjyXie78ZRUApb
 gbww==
X-Gm-Message-State: ABy/qLY3FUD/DP7agC3VqAnWCSjcglXOI6LL57tSiAF614DPyLtFN0Nh
 mQJczKVQw5vzK/16MHeP9CW8gocnqDs=
X-Google-Smtp-Source: APBJJlGpZrW3c4xwKJ8/TZ3Pdq91mO2tcn3ofYNPz4yM3ODR1I5LR8gFZyAVtXS3akYxEJUDLjrgOw==
X-Received: by 2002:a05:6a20:a11a:b0:11f:c1a1:8c with SMTP id
 q26-20020a056a20a11a00b0011fc1a1008cmr3602428pzk.54.1688677865358; 
 Thu, 06 Jul 2023 14:11:05 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 fe16-20020a056a002f1000b0066ebaeb149dsm1667933pfb.88.2023.07.06.14.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] drm/msm/adreno: Remove redundant revn param
Date: Thu,  6 Jul 2023 14:10:36 -0700
Message-ID: <20230706211045.204925-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This just duplicates what is in adreno_info, and can cause confusion if
used before it is set.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 22 +++++++++-------------
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index edbade75020f..5ba8b5aca502 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2484,8 +2484,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(-EINVAL);
 
 	/* Assign these early so that we can use the is_aXYZ helpers */
-	/* Numeric revision IDs (e.g. 630) */
-	adreno_gpu->revn = info->revn;
 	/* New-style ADRENO_REV()-only */
 	adreno_gpu->rev = info->rev;
 	/* Quirk data */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4f59682f585e..2e62a7ce9f13 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1098,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->revn = adreno_gpu->info->revn;
 	adreno_gpu->rev = *rev;
 
 	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index aaf09c642dc6..d31e2d37c61b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,6 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	struct adreno_rev rev;
 	const struct adreno_info *info;
-	uint32_t revn;  /* numeric revision name */
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
@@ -147,10 +146,9 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
 static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return gpu->revn == revn;
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->revn == revn;
 }
 
 static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
@@ -160,18 +158,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
 
 static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return (gpu->revn < 300);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return (gpu->info->revn < 300);
 }
 
 static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return (gpu->revn < 210);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return (gpu->info->revn < 210);
 }
 
 static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
-- 
2.41.0

