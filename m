Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603C7962B2F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F0310E569;
	Wed, 28 Aug 2024 15:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U+53UR4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51DB10E568;
 Wed, 28 Aug 2024 15:07:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E11AEA41625;
 Wed, 28 Aug 2024 15:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC83C4CEC2;
 Wed, 28 Aug 2024 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857637;
 bh=a9ZZUDjjT3S7cBGB5enSwbmy4on96cF59kyuYni0rwM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U+53UR4E/X43N2EuGOEH657iEwjPxdUd7hvxN6K9KCO+7egsPEva1ET08ZQPpBr6a
 XElnkC/nTrxcuS04S0oMrO0OuIegp+Ejz2vcXi33pB64CH92ZjBdUoQ1X71s8Mck4W
 SHwhpesNQbF8g4VvUHnniL2cHmTRs7ioxyBtO1mV8CTsWhY0hHBETrsXScb5QMaKf7
 qgJ2Fom6xLe7b4IWvNO7+fed8h+lw5hEW8MEK5wgo61g1g+sz1/mf7tpED0/V4LlL9
 Hp3fhwJcc2V12yVm88ajUJcYZ7b2DvfgABR+tDXN3ssYoYAY0miUcOeUYwntMZNWGt
 DRUralWznl4xg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:55 +0200
Subject: [PATCH v2 2/6] drm/msm/a6xx: Store primFifoThreshold in struct
 a6xx_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-2-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=6473;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=XmQJ6okLMLENeM9s7/dxGjGy/oGH2zJbA3KXVAvm660=;
 b=s9OtFZY+HhV8Xv3UFw/s3Tj/EecycJCeI4I/XK41giBBQUTzl3kefqx2qEhecfHYc14ldaL+9
 xh/68lf1Ne+DYgg6+YddtOHquD739aGRv51RemgRf4adF+Ul06EGSEq
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

The if-else monster is so unmaintainable that one case is repeated
twice. Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 24 +++++-------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..1ea535960f32 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -636,6 +636,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00080000,
 		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
@@ -667,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -689,6 +691,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -711,6 +714,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -733,6 +737,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -755,6 +760,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -782,6 +788,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
@@ -799,6 +806,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -821,6 +829,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -846,6 +855,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -864,6 +874,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.prim_fifo_threshold = 0x00200200,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -888,6 +899,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00200200,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
@@ -905,6 +917,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.prim_fifo_threshold = 0x00800200,
 		},
 		.address_space_size = SZ_16G,
 	}
@@ -1165,6 +1178,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.prim_fifo_threshold = 0x0000c000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..aaeb1161f90d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -976,25 +976,11 @@ static int hw_init(struct msm_gpu *gpu)
 	} else if (!adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
-	/* Setting the primFifo thresholds default values,
-	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
-	*/
-	if (adreno_is_a702(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x0000c000);
-	else if (adreno_is_a690(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
-	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
-	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a619(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
-	else if (adreno_is_a610(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
-	else if (!adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
+
+	/* Set the default primFifo threshold values */
+	if (adreno_gpu->info->a6xx->prim_fifo_threshold)
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL,
+			  adreno_gpu->info->a6xx->prim_fifo_threshold);
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e3e5c53ae8af..bc37bd8c7f65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	u32 gmu_chipid;
+	u32 prim_fifo_threshold;
 };
 
 struct a6xx_gpu {

-- 
2.46.0

