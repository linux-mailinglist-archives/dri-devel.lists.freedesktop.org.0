Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17743962B3A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D1D10E578;
	Wed, 28 Aug 2024 15:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mJKCP7HJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32A10E573;
 Wed, 28 Aug 2024 15:07:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 320F9A41597;
 Wed, 28 Aug 2024 15:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4C9C4CEC2;
 Wed, 28 Aug 2024 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857653;
 bh=jILtHjxwjjgjZztGE+ONkoeHJvK1Bqz1u5O/Mgt87zo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mJKCP7HJpC7Xt9GPKaQpMw1iu94/AbDzSgkCeySm3xlDqzNaTfvLLLb6grL1S2oV9
 at7ECEuYsOUBkRRcoAlUuFIquJZKzJ2CRdU8ZXsJA/CdWqYCPqocQbbVpe8HidYqwd
 9X9HvMLQoBjWSoXhGwvyBGNRqpWBZ9lofMNbC6LWSKTTyNQhZ9qCLCwaz9FxN+tCWy
 IbFnZDgP5qtUOpVNRhNisC2clbNrm7z0FVuohwxm1FuekIzujrkK3gH4Q+lHvKcy/k
 UTt5rn2ekStKnWpPdD77cLE1Ylx4xCcKR5RVe6HCD5SgFVlCKRDSER7oWPC/FdAncn
 1LIpeQQ1uhkpw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:59 +0200
Subject: [PATCH v2 6/6] drm/msm/a6xx: Add A621 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-6-1882c6b57432@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=7367;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=RlDVPf4sSmjRNEQBMyj74j3T0Pz3TGytFQVkPF4yXA4=;
 b=4roaOxw8rygadrRbHoROYIC+eX5VJaNHf1BIzIoCP5mTnmb6/0LNZWwbkwkWElancN/KamruP
 O1872/4yPgKCCfOujsUwoQJBl2u4T/RQPSd2DMZxxq8eD1WWsP2RPJv
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

A621 is a clear A662 derivative (same lineage as A650), no explosions
or sick features, other than a NoC bug which can stall the GPU..

Add support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 78 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 18 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 ++
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index deee0b686962..d9d4a3e821f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -129,6 +129,59 @@ static const struct adreno_reglist a615_hwcg[] = {
 	{},
 };
 
+static const struct adreno_reglist a620_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
+};
+
 static const struct adreno_reglist a630_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
@@ -490,7 +543,6 @@ static const u32 a630_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a630_protect, 32);
 
-/* These are for a620 and a650 */
 static const u32 a650_protect_regs[] = {
 	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
 	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
@@ -774,6 +826,30 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 169, 2 },
 			{ 180, 1 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06020100),
+		.family = ADRENO_6XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "a650_sqe.fw",
+			[ADRENO_FW_GMU] = "a621_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a620_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a620_hwcg,
+			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020200,
+			.prim_fifo_threshold = 0x00010000,
+		},
+		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 137, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6f168f1f32d8..37927bdd6fbe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -423,6 +423,20 @@ static int a6xx_gmu_gfx_rail_on(struct a6xx_gmu *gmu)
 	return a6xx_gmu_set_oob(gmu, GMU_OOB_BOOT_SLUMBER);
 }
 
+static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+
+	/*
+	 * GEMNoC can power collapse whilst the GPU is being powered down, resulting
+	 * in the power down sequence not being fully executed. That in turn can
+	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
+	 */
+	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
+		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+}
+
 /* Let the GMU know that we are about to go into slumber */
 static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 {
@@ -456,6 +470,8 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
+	a6xx_gemnoc_workaround(gmu);
+
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 	return ret;
@@ -945,6 +961,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Force off SPTP in case the GMU is managing it */
 	a6xx_sptprac_disable(gmu);
 
+	a6xx_gemnoc_workaround(gmu);
+
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33a319f7d200..f2eca69613af 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -523,6 +523,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;
 
+	if (adreno_is_a621(gpu)) {
+		gpu->ubwc_config.highest_bank_bit = 13;
+		gpu->ubwc_config.amsbc = 1;
+		gpu->ubwc_config.uavflagprd_inv = 2;
+	}
+
 	if (adreno_is_a640_family(gpu))
 		gpu->ubwc_config.amsbc = 1;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 26972b2cc896..ea2c25e007eb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -384,6 +384,11 @@ static inline int adreno_is_a619_holi(const struct adreno_gpu *gpu)
 	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
 }
 
+static inline int adreno_is_a621(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x06020100;
+}
+
 static inline int adreno_is_a630(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 630);

-- 
2.46.0

