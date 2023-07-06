Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8540674A59C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDBB10E4C7;
	Thu,  6 Jul 2023 21:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D802110E4C7;
 Thu,  6 Jul 2023 21:11:09 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666e5f0d60bso769090b3a.3; 
 Thu, 06 Jul 2023 14:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677869; x=1691269869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6G94goSdCbJeE7DE/SqiiBM7xxMv8B0WdoqZyh7EZs=;
 b=M9AQ2C+vrh8Zxr/kYTY0YTeLfNM/3INMZRqZ5hVUIgk/zLzXPKtlUJkWDy5RYJ3WvU
 Z/4tVCyaIvH4yXrDiQYCsQDJeoxrZXoOu4W03otwsDzu3wpRLh/WzW9MxvrtOu+RkdXN
 w1/NrRJCEOq+pk4BJOsWwQhTsTFyBy1bKxb5REtrrfkU3qmocNJZWvfPb0MzoLPq/faK
 +KV3a0KbadAEf1huYdqS79VpyjcH7Y9EI2czGmNi86zp+LFfzCSUjDgLgVUY/+rQo9Ou
 IfbW0xiYmO+xPwCc8AYtrhXaUWVRBTZDWvV/PXIiILwC1kzOdvueawEQvvqV9nHJw/6+
 0ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677869; x=1691269869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6G94goSdCbJeE7DE/SqiiBM7xxMv8B0WdoqZyh7EZs=;
 b=J8bDkfMARsOx6KxJfiOjgw+iHi/RArqIXFjXZhXW4zgbN152oyBCEgC3qN0PvKvOUz
 LiXLK0tnnYYB+3xNuIVQLtkZD2OqhXc86TO8rCvKeA82r4TzqRgcEcYJBgKYPFp5chLP
 KpUowoZrnqTZwFLN3xVr90HFaYkf0Ij2Ckjm9O0+X81RndaiAH/IB4WpG1eUXiCHXgQ7
 zBfotquJ3mqZnu3uehVfrOPP2vEN0GYUOAdkVLTaprjXxnUoZmaeZncjYCZTkfrFUA+D
 D6AQY0UsG/VT6mUi2SFZU3bYDwHsTu1wS1AFTELCwjlZyv9H3CoHaeWdyhBHFxqf/VTe
 Jo+A==
X-Gm-Message-State: ABy/qLahyyCno3AT68R1v/FktK3G6ffOuM0HB+KVEmn6FNGGLno+VxfC
 ZXvyVL+8C9O95vV7sZN6WR/V3MIrLcQ=
X-Google-Smtp-Source: APBJJlFau+uT/88HmIfL50F8f0ZG1ImhsODwEp/vLS6EzIvdt/J6VOMiW8qi9ZfCWopxsin6MPoIFw==
X-Received: by 2002:a05:6a00:a1e:b0:66f:578c:59fb with SMTP id
 p30-20020a056a000a1e00b0066f578c59fbmr3078576pfh.10.1688677868621; 
 Thu, 06 Jul 2023 14:11:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa7820c000000b00666e2dac482sm1669797pfi.124.2023.07.06.14.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] drm/msm/adreno: Use quirk to identify cached-coherent
 support
Date: Thu,  6 Jul 2023 14:10:38 -0700
Message-ID: <20230706211045.204925-6-robdclark@gmail.com>
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

It is better to explicitly list it.  With the move to opaque chip-id's
for future devices, we should avoid trying to infer things like
generation from the numerical value.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f469f951a907..3c531da417b9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
@@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
@@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
 		.hwcg = a630_hwcg,
@@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
@@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
@@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
@@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
@@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_2M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
@@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
@@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	if (config.rev.core >= 6)
-		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
-			priv->has_cached_coherent = true;
+	priv->has_cached_coherent =
+		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
+		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a7c4a2c536e3..e08d41337169 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -33,6 +33,7 @@ enum {
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
+#define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 
 struct adreno_rev {
 	uint8_t  core;
-- 
2.41.0

