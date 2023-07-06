Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443474A5A9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7335010E4E9;
	Thu,  6 Jul 2023 21:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73D910E4E0;
 Thu,  6 Jul 2023 21:11:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b88e5b3834so5424545ad.3; 
 Thu, 06 Jul 2023 14:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677879; x=1691269879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUuWDztebEu2Omk0ucmuFO9Lxf/Yb0Y9YvQjWXnI3n0=;
 b=QRqr2ClJK1BrfgxO36QfF4T0lpMna1JEB4ShJvvqDMO1ka8e7UnPC6EfoKvxazMxaK
 d+YpNE5fu3yHa7OUhv0sYCHXxH84FAsg7ukxjNJ5GuWvuGmcpEfEC4uU5Ce01uAvWAB6
 i0W3Ojz7WLrLp4fTjOtrIWuLHXj2KIM1MQTlpnatfAJToC8xW9qaAg1lXshce7pBQUFV
 s53LFd5RcqhfyhqZe0F3qmg9hK6Wgjl0PXmy02jtnGxJUlSFFbjG4hQvTVb9eBfCmaD6
 Afg4MbVLBRm9NjQPpuovjb4v26C3VtdecCCJCoDMIeondlArZtCBNs7KQKTXQl2fd2C6
 Fgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677879; x=1691269879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUuWDztebEu2Omk0ucmuFO9Lxf/Yb0Y9YvQjWXnI3n0=;
 b=iJGy49CvQHDVh9mji/XJ9kJyhtw5tpkMJ50U8IvkKagqy2tCA2zZW+bpWIUIId/U5e
 PNeam8AcUzS3OA4bx2QSoyqkqHHnNemIioepUU0Js8vLqc2tj/PzMA+4XgWr8moTz8e0
 NxnVVbOP3jYb0YfPGJ8asI1GUUV5JpcGU33iWnDztWnuoUPjxMTmnp7CgUtrq2pg7K8R
 r4Y7pglqLP8NlAtfCNH31uSTlLhGA1tv6irXc+Jox9GDaPf0FnwHjqAeG4zkLLd/FF5H
 /2UHH/pgGOe+AqPIofi+QJ7W3giKNxuQM/lnjDRbF+J8aX2WfnNJuX6UNObPapdYSFsM
 jWpA==
X-Gm-Message-State: ABy/qLZBCbJ54i5OerNXvfpYqKtlu+QAa1T7ydlZad3BOqCsOoHOtGPd
 SECclLAe/V8i75InsFbQ3o2KefMguZI=
X-Google-Smtp-Source: APBJJlHCs0JULry+OlsC9J0C5y8mL5oANef/AFPhtiyh7b6LtnDgWhpswrTIW1ZXZCRsRv/whzX1wA==
X-Received: by 2002:a17:90a:3842:b0:262:e742:f419 with SMTP id
 l2-20020a17090a384200b00262e742f419mr2377393pjf.47.1688677879422; 
 Thu, 06 Jul 2023 14:11:19 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a17090acc0600b00263b4b1255esm200531pju.51.2023.07.06.14.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying GPU
Date: Thu,  6 Jul 2023 14:10:45 -0700
Message-ID: <20230706211045.204925-13-robdclark@gmail.com>
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

Since the revision becomes an opaque identifier with future GPUs, move
away from treating different ranges of bits as having a given meaning.
This means that we need to explicitly list different patch revisions in
the device table.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  11 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c    |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  13 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   9 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 128 ++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  16 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  51 ++++----
 8 files changed, 122 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 715436cb3996..8b4cdf95f445 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -145,7 +145,7 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_HLSQ, 0x00220000);
 	/* Early A430's have a timing issue with SP/TP power collapse;
 	   disabling HW clock gating prevents it. */
-	if (adreno_is_a430(adreno_gpu) && adreno_gpu->rev.patchid < 2)
+	if (adreno_is_a430(adreno_gpu) && adreno_patchid(adreno_gpu) < 2)
 		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0);
 	else
 		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0xAAAAAAAA);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index f0803e94ebe5..70d2b5342cd9 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1744,6 +1744,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1770,7 +1771,15 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	nr_rings = 4;
 
-	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
+	/*
+	 * Note that we wouldn't have been able to get this far if there is not
+	 * a device table entry for this chip_id
+	 */
+	info = adreno_find_info(config->chip_id);
+	if (WARN_ON(!info))
+		return ERR_PTR(-EINVAL);
+
+	if (info->revn == 510)
 		nr_rings = 1;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 0e63a1429189..7705f8010484 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -179,7 +179,7 @@ static void a540_lm_setup(struct msm_gpu *gpu)
 
 	/* The battery current limiter isn't enabled for A540 */
 	config = AGC_LM_CONFIG_BCL_DISABLED;
-	config |= adreno_gpu->rev.patchid << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
+	config |= adreno_patchid(adreno_gpu) << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
 
 	/* For now disable GPMU side throttling */
 	config |= AGC_LM_CONFIG_THROTTLE_DISABLE;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f1bb20574018..a9ba547a120c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -790,10 +790,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
-	chipid = adreno_gpu->rev.core << 24;
-	chipid |= adreno_gpu->rev.major << 16;
-	chipid |= adreno_gpu->rev.minor << 12;
-	chipid |= adreno_gpu->rev.patchid << 8;
+	/* Note that the GMU has a slightly different layout for
+	 * chip_id, for whatever reason, so a bit of massaging
+	 * is needed.  The upper 16b are the same, but minor and
+	 * patchid are packed in four bits each with the lower
+	 * 8b unused:
+	 */
+	chipid  = adreno_gpu->chip_id & 0xffff0000;
+	chipid |= (adreno_gpu->chip_id << 4) & 0xf000; /* minor */
+	chipid |= (adreno_gpu->chip_id << 8) & 0x0f00; /* patchid */
 
 	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 77b23c004b94..ed075729ca09 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2344,10 +2344,13 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/*
 	 * We need to know the platform type before calling into adreno_gpu_init
 	 * so that the hw_apriv flag can be correctly set. Snoop into the info
-	 * and grab the revision number
+	 * and grab the revision number.
+	 *
+	 * Note that we wouldn't have been able to get this far if there is not
+	 * a device table entry for this chip_id
 	 */
-	info = adreno_info(config->rev);
-	if (!info)
+	info = adreno_find_info(config->chip_id);
+	if (WARN_ON(!info))
 		return ERR_PTR(-EINVAL);
 
 	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fd2e183bce60..4a718ff33635 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -22,7 +22,7 @@ module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
 static const struct adreno_info gpulist[] = {
 	{
-		.rev   = ADRENO_REV(2, 0, 0, 0),
+		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
 		.family = ADRENO_2XX_GEN1,
 		.revn  = 200,
 		.fw = {
@@ -33,7 +33,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
 	}, { /* a200 on i.mx51 has only 128kib gmem */
-		.rev   = ADRENO_REV(2, 0, 0, 1),
+		.chip_ids = ADRENO_CHIP_IDS(0x02000001),
 		.family = ADRENO_2XX_GEN1,
 		.revn  = 201,
 		.fw = {
@@ -44,7 +44,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(2, 2, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x02020000),
 		.family = ADRENO_2XX_GEN2,
 		.revn  = 220,
 		.fw = {
@@ -55,7 +55,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(3, 0, 5, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x03000500),
 		.family = ADRENO_3XX,
 		.revn  = 305,
 		.fw = {
@@ -66,7 +66,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(3, 0, 6, 0),
+		.chip_ids = ADRENO_CHIP_IDS(0x03000600),
 		.family = ADRENO_3XX,
 		.revn  = 307,        /* because a305c is revn==306 */
 		.fw = {
@@ -77,7 +77,11 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(3, 2, ANY_ID, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(
+			0x03020000,
+			0x03020001,
+			0x03020002
+		),
 		.family = ADRENO_3XX,
 		.revn  = 320,
 		.fw = {
@@ -88,7 +92,11 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(3, 3, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(
+			0x03030000,
+			0x03030001,
+			0x03030002
+		),
 		.family = ADRENO_3XX,
 		.revn  = 330,
 		.fw = {
@@ -99,7 +107,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(4, 0, 5, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
 		.family = ADRENO_4XX,
 		.revn  = 405,
 		.fw = {
@@ -110,7 +118,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(4, 2, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x04020000),
 		.family = ADRENO_4XX,
 		.revn  = 420,
 		.fw = {
@@ -121,7 +129,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(4, 3, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x04030000),
 		.family = ADRENO_4XX,
 		.revn  = 430,
 		.fw = {
@@ -132,7 +140,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(5, 0, 6, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
 		.fw = {
@@ -150,7 +158,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a506_zap.mdt",
 	}, {
-		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x05000800),
 		.family = ADRENO_5XX,
 		.revn = 508,
 		.fw = {
@@ -167,7 +175,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a508_zap.mdt",
 	}, {
-		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x05000900),
 		.family = ADRENO_5XX,
 		.revn = 509,
 		.fw = {
@@ -185,7 +193,7 @@ static const struct adreno_info gpulist[] = {
 		/* Adreno 509 uses the same ZAP as 512 */
 		.zapfw = "a512_zap.mdt",
 	}, {
-		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x05010000),
 		.family = ADRENO_5XX,
 		.revn = 510,
 		.fw = {
@@ -200,7 +208,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = 250,
 		.init = a5xx_gpu_init,
 	}, {
-		.rev   = ADRENO_REV(5, 1, 2, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x05010200),
 		.family = ADRENO_5XX,
 		.revn = 512,
 		.fw = {
@@ -217,7 +225,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a512_zap.mdt",
 	}, {
-		.rev = ADRENO_REV(5, 3, 0, 2),
+		.chip_ids = ADRENO_CHIP_IDS(0x05030002),
 		.family = ADRENO_5XX,
 		.revn = 530,
 		.fw = {
@@ -236,7 +244,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
 	}, {
-		.rev = ADRENO_REV(5, 4, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
 		.family = ADRENO_5XX,
 		.revn = 540,
 		.fw = {
@@ -254,7 +262,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
 	}, {
-		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
 		.fw = {
@@ -280,7 +288,7 @@ static const struct adreno_info gpulist[] = {
 			127, 4
 		),
 	}, {
-		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 618,
 		.fw = {
@@ -298,7 +306,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.machine = "qcom,sm4350",
-		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {
@@ -317,7 +325,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.machine = "qcom,sm6375",
-		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {
@@ -335,7 +343,7 @@ static const struct adreno_info gpulist[] = {
 			177, 2
 		),
 	}, {
-		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {
@@ -356,7 +364,7 @@ static const struct adreno_info gpulist[] = {
 			180, 1
 		),
 	}, {
-		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06030002),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 630,
 		.fw = {
@@ -370,7 +378,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a630_zap.mdt",
 		.hwcg = a630_hwcg,
 	}, {
-		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
 		.family = ADRENO_6XX_GEN2,
 		.revn = 640,
 		.fw = {
@@ -388,7 +396,7 @@ static const struct adreno_info gpulist[] = {
 			1, 1
 		),
 	}, {
-		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06050002),
 		.family = ADRENO_6XX_GEN3,
 		.revn = 650,
 		.fw = {
@@ -410,7 +418,7 @@ static const struct adreno_info gpulist[] = {
 			3, 2
 		),
 	}, {
-		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06060001),
 		.family = ADRENO_6XX_GEN4,
 		.revn = 660,
 		.fw = {
@@ -426,7 +434,7 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
 	}, {
-		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
@@ -445,7 +453,7 @@ static const struct adreno_info gpulist[] = {
 			190, 1
 		),
 	}, {
-		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06080000),
 		.family = ADRENO_6XX_GEN2,
 		.revn = 680,
 		.fw = {
@@ -459,7 +467,7 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
 	}, {
-		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
+		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
 		.family = ADRENO_6XX_GEN4,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
@@ -494,31 +502,16 @@ MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_zap.mbn");
 
-static inline bool _rev_match(uint8_t entry, uint8_t id)
-{
-	return (entry == ANY_ID) || (entry == id);
-}
-
-bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
-{
-
-	return _rev_match(rev1.core, rev2.core) &&
-		_rev_match(rev1.major, rev2.major) &&
-		_rev_match(rev1.minor, rev2.minor) &&
-		_rev_match(rev1.patchid, rev2.patchid);
-}
-
-const struct adreno_info *adreno_info(struct adreno_rev rev)
+const struct adreno_info *adreno_find_info(uint32_t chip_id)
 {
-	int i;
-
 	/* identify gpu: */
-	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
+	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
 		const struct adreno_info *info = &gpulist[i];
 		if (info->machine && !of_machine_is_compatible(info->machine))
 			continue;
-		if (adreno_cmp_rev(info->rev, rev))
-			return info;
+		for (int j = 0; info->chip_ids[j]; j++)
+			if (info->chip_ids[j] == chip_id)
+				return info;
 	}
 
 	return NULL;
@@ -598,12 +591,11 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return NULL;
 }
 
-static int find_chipid(struct device *dev, struct adreno_rev *rev)
+static int find_chipid(struct device *dev, uint32_t *chipid)
 {
 	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
-	u32 chipid;
 
 	/* first search the compat strings for qcom,adreno-XYZ.W: */
 	ret = of_property_read_string_index(node, "compatible", 0, &compat);
@@ -612,32 +604,34 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
 
 		if (sscanf(compat, "qcom,adreno-%u.%u", &r, &patch) == 2 ||
 		    sscanf(compat, "amd,imageon-%u.%u", &r, &patch) == 2) {
-			rev->core = r / 100;
+			uint32_t core, major, minor;
+
+			core = r / 100;
 			r %= 100;
-			rev->major = r / 10;
+			major = r / 10;
 			r %= 10;
-			rev->minor = r;
-			rev->patchid = patch;
+			minor = r;
+
+			*chipid = (core << 24) |
+				(major << 16) |
+				(minor << 8) |
+				patch;
 
 			return 0;
 		}
+
+		if (sscanf(compat, "qcom,adreno-%08x", chipid) == 1)
+			return 0;
 	}
 
 	/* and if that fails, fall back to legacy "qcom,chipid" property: */
-	ret = of_property_read_u32(node, "qcom,chipid", &chipid);
+	ret = of_property_read_u32(node, "qcom,chipid", chipid);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
 		return ret;
 	}
 
-	rev->core = (chipid >> 24) & 0xff;
-	rev->major = (chipid >> 16) & 0xff;
-	rev->minor = (chipid >> 8) & 0xff;
-	rev->patchid = (chipid & 0xff);
-
 	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
-	dev_warn(dev, "Use compatible qcom,adreno-%u%u%u.%u instead.\n",
-		rev->core, rev->major, rev->minor, rev->patchid);
 
 	return 0;
 }
@@ -651,22 +645,22 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	struct msm_gpu *gpu;
 	int ret;
 
-	ret = find_chipid(dev, &config.rev);
+	ret = find_chipid(dev, &config.chip_id);
 	if (ret)
 		return ret;
 
 	dev->platform_data = &config;
 	priv->gpu_pdev = to_platform_device(dev);
 
-	info = adreno_info(config.rev);
+	info = adreno_find_info(config.chip_id);
 
 	if (!info) {
 		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
-			ADRENO_CHIPID_ARGS(config.rev));
+			ADRENO_CHIPID_ARGS(config.chip_id));
 		return -ENXIO;
 	}
 
-	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
+	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.chip_id));
 
 	priv->is_a2xx = info->family < ADRENO_3XX;
 	priv->has_cached_coherent =
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1a982a926f21..1274609a74b1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -326,10 +326,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
 		return 0;
 	case MSM_PARAM_CHIP_ID:
-		*value =  (uint64_t)adreno_gpu->rev.patchid |
-			 ((uint64_t)adreno_gpu->rev.minor << 8) |
-			 ((uint64_t)adreno_gpu->rev.major << 16) |
-			 ((uint64_t)adreno_gpu->rev.core  << 24);
+		*value = adreno_gpu->chip_id;
 		if (!adreno_gpu->info->revn)
 			*value |= ((uint64_t) adreno_gpu->speedbin) << 32;
 		return 0;
@@ -849,7 +846,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
 			adreno_gpu->info->revn,
-			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
+			ADRENO_CHIPID_ARGS(adreno_gpu->chip_id));
 	/*
 	 * If this is state collected due to iova fault, so fault related info
 	 *
@@ -922,7 +919,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
 
 	printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
 			adreno_gpu->info->revn,
-			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
+			ADRENO_CHIPID_ARGS(adreno_gpu->chip_id));
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -1072,14 +1069,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	struct adreno_rev *rev = &config->rev;
 	const char *gpu_name;
 	u32 speedbin;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
-	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->rev = *rev;
+	adreno_gpu->info = adreno_find_info(config->chip_id);
+	adreno_gpu->chip_id = config->chip_id;
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
@@ -1104,7 +1100,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
-			ADRENO_CHIPID_ARGS(config->rev));
+			ADRENO_CHIPID_ARGS(config->chip_id));
 	if (!gpu_name)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 73e7155f164c..18f53c7ab589 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -54,23 +54,15 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 
-struct adreno_rev {
-	uint8_t  core;
-	uint8_t  major;
-	uint8_t  minor;
-	uint8_t  patchid;
-};
-
-#define ANY_ID 0xff
-
-#define ADRENO_REV(core, major, minor, patchid) \
-	((struct adreno_rev){ core, major, minor, patchid })
-
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
  */
 #define ADRENO_CHIPID_FMT "u.%u.%u.%u"
-#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
+#define ADRENO_CHIPID_ARGS(_c) \
+	(((_c) >> 24) & 0xff), \
+	(((_c) >> 16) & 0xff), \
+	(((_c) >> 8)  & 0xff), \
+	((_c) & 0xff)
 
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
@@ -87,7 +79,12 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 
 struct adreno_info {
 	const char *machine;
-	struct adreno_rev rev;
+	/**
+	 * @chipids: Table of matching chip-ids
+	 *
+	 * Terminated with 0 sentinal
+	 */
+	uint32_t *chip_ids;
 	enum adreno_family family;
 	uint32_t revn;
 	const char *fw[ADRENO_FW_MAX];
@@ -107,6 +104,8 @@ struct adreno_info {
 	uint32_t *speedbins;
 };
 
+#define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
+
 /*
  * Helper to build a speedbin table, ie. the table:
  *      fuse | speedbin
@@ -125,12 +124,12 @@ struct adreno_info {
  */
 #define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
 
-const struct adreno_info *adreno_info(struct adreno_rev rev);
+const struct adreno_info *adreno_find_info(uint32_t chip_id);
 
 struct adreno_gpu {
 	struct msm_gpu base;
-	struct adreno_rev rev;
 	const struct adreno_info *info;
+	uint32_t chip_id;
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
@@ -179,7 +178,7 @@ struct adreno_ocmem {
 
 /* platform config data (ie. from DT, or pdata) */
 struct adreno_platform_config {
-	struct adreno_rev rev;
+	uint32_t chip_id;
 };
 
 #define ADRENO_IDLE_TIMEOUT msecs_to_jiffies(1000)
@@ -196,7 +195,15 @@ struct adreno_platform_config {
 	__ret;                                             \
 })
 
-bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
+static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
+{
+	/* It is probably ok to assume legacy "adreno_rev" format
+	 * for all a6xx devices, but probably best to limit this
+	 * to older things.
+	 */
+	WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
+	return gpu->chip_id & 0xff;
+}
 
 static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 {
@@ -252,7 +259,7 @@ static inline bool adreno_is_a330(const struct adreno_gpu *gpu)
 
 static inline bool adreno_is_a330v2(const struct adreno_gpu *gpu)
 {
-	return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
+	return adreno_is_a330(gpu) && (adreno_patchid(gpu) > 0);
 }
 
 static inline int adreno_is_a405(const struct adreno_gpu *gpu)
@@ -342,8 +349,7 @@ static inline int adreno_is_a650(const struct adreno_gpu *gpu)
 
 static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
 {
-	/* The order of args is important here to handle ANY_ID correctly */
-	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
+	return gpu->info->chip_ids[0] == 0x06030500;
 }
 
 static inline int adreno_is_a660(const struct adreno_gpu *gpu)
@@ -358,8 +364,7 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
-	/* The order of args is important here to handle ANY_ID correctly */
-	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
+	return gpu->info->chip_ids[0] == 0x06090000;
 };
 /* check for a615, a616, a618, a619 or any a630 derivatives */
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
-- 
2.41.0

