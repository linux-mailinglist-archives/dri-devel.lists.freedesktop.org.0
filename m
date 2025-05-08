Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B0AB0252
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0910E1AE;
	Thu,  8 May 2025 18:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I7EJwodp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6E410E956;
 Thu,  8 May 2025 18:14:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 800E0A4E15A;
 Thu,  8 May 2025 18:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C4CC4CEEB;
 Thu,  8 May 2025 18:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728060;
 bh=3wRg8SWnT3zzRmcOfCUrb+vJkaHBx2o3WHgC2Uh4E3Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I7EJwodpRna64dnKOIDzvAsxNykzrA8cwXIlVTZ4Ev7eVNvDiAbSAAk431D0h/E2/
 A+7p8hjzoKmHCx85LzsUM0j+MWf72Zj84xmht37QFRIRuC8VJTOFGnFpoePPU947HY
 lnMglKI8qGrvsXe+xe41E5+shp3a0ObrM9SR/bD7yVg5fRS3AmWWzkmSdHBOUC5F4I
 Ls94nY57hWZs/tp/i/KrAfrWg8il/09082camtmO8ajr5aWVW7UCCcDoXoIbK5pxMT
 Lx1iF9ZWCS0jUdGIBzH+2lDsTQTETtAhexk3vFOEr+iq3JfUZtl88q8WqVIhccPNtY
 IS9GYQoQjHUhA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:44 +0200
Subject: [PATCH RFT 12/14] drm/msm/adreno: Switch to the common UBWC config
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-12-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=8657;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mcNVgT7yDSwQcYtEu57k00J6uXoah00CaRsAdpcylz8=;
 b=qT0syBFswocBjZiKax6OrcOkrsQy75WrvAfntSInU0Lv0XXb+exzYFEaoKrNFtxuaFC35/Fgc
 fIRoH5z+JYSC/zATuTwv8k08jXAVOcVz6UgjqhQ4FidAYrJz3zDXGaK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Now that Adreno specifics are out of the way, use the common config
(but leave the HBB hardcoding in place until that is wired up on the
other side).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 41 ++++++++++++++++++---------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 40 +-------------------------------
 4 files changed, 34 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 67331a7ee750c0d9eeeead9440e5d08b1a09c878..1344d461c16dfa942b0b65d747eadca507116806 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -833,7 +833,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
-	hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+	hbb = adreno_gpu->ubwc_config->highest_bank_bit;
 
 	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
 	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
@@ -1791,13 +1791,13 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	/* Set the highest bank bit */
 	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
-		adreno_gpu->ubwc_config.highest_bank_bit = 2;
+		adreno_gpu->ubwc_config->highest_bank_bit = 2;
 	else
-		adreno_gpu->ubwc_config.highest_bank_bit = 1;
+		adreno_gpu->ubwc_config->highest_bank_bit = 1;
 
 	/* a5xx only supports UBWC 1.0, these are not configurable */
-	adreno_gpu->ubwc_config.macrotile_mode = 0;
-	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
+	adreno_gpu->ubwc_config->macrotile_mode = 0;
+	adreno_gpu->ubwc_config->ubwc_swizzle = 0x7;
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d297890dfba60c6110fb8571e1f46729390302ed..28ba0cddd7d222b0a287c7c3a111e123a73b1d39 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -587,34 +587,39 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+	const struct qcom_ubwc_cfg_data *common_cfg;
+	struct qcom_ubwc_cfg_data *cfg = gpu->ubwc_config;
+
 	/* Inherit the common config and make some necessary fixups */
-	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(gpu->common_ubwc_cfg))
+	common_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(common_cfg))
 		return -EINVAL;
 
-	gpu->ubwc_config.ubwc_swizzle = 0x6;
-	gpu->ubwc_config.highest_bank_bit = 2;
+	*cfg = *common_cfg;
+
+	cfg->ubwc_swizzle = 0x6;
+	cfg->highest_bank_bit = 2;
 
 	if (adreno_is_a610(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.ubwc_swizzle = 0x7;
+		cfg->highest_bank_bit = 0;
+		cfg->ubwc_swizzle = 0x7;
 	}
 
 	if (adreno_is_a618(gpu))
-		gpu->ubwc_config.highest_bank_bit = 1;
+		cfg->highest_bank_bit = 1;
 
 	if (adreno_is_a619(gpu))
 		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		gpu->ubwc_config.highest_bank_bit = 0;
+		cfg->highest_bank_bit = 0;
 
 	if (adreno_is_a619_holi(gpu))
-		gpu->ubwc_config.highest_bank_bit = 0;
+		cfg->highest_bank_bit = 0;
 
 	if (adreno_is_a621(gpu))
-		gpu->ubwc_config.highest_bank_bit = 0;
+		cfg->highest_bank_bit = 0;
 
 	if (adreno_is_a623(gpu))
-		gpu->ubwc_config.highest_bank_bit = 3;
+		cfg->highest_bank_bit = 3;
 
 	if (adreno_is_a650(gpu) ||
 	    adreno_is_a660(gpu) ||
@@ -622,19 +627,19 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a730(gpu) ||
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
-		gpu->ubwc_config.highest_bank_bit = 3;
+		cfg->highest_bank_bit = 3;
 	}
 
 	if (adreno_is_a663(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.ubwc_swizzle = 0x4;
+		cfg->highest_bank_bit = 0;
+		cfg->ubwc_swizzle = 0x4;
 	}
 
 	if (adreno_is_7c3(gpu))
-		gpu->ubwc_config.highest_bank_bit = 1;
+		cfg->highest_bank_bit = 1;
 
 	if (adreno_is_a702(gpu))
-		gpu->ubwc_config.highest_bank_bit = 1;
+		cfg->highest_bank_bit = 1;
 
 	return 0;
 }
@@ -644,12 +649,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
 	bool min_acc_len_64b = adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu);
-	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
-	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit;
 	bool ubwc_mode = cfg->ubwc_enc_version == UBWC_1_0;
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	u32 hbb = cfg->highest_bank_bit;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b7f7eb8dcb272394dce8ed1e68310a394c1734a9..77f1e29df47e1413e35c688f24503cb4d457e304 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -388,16 +388,16 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = ctx->aspace->va_size;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
-		*value = adreno_gpu->ubwc_config.highest_bank_bit;
+		*value = adreno_gpu->ubwc_config->highest_bank_bit;
 		return 0;
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config.ubwc_swizzle;
+		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
-		*value = adreno_gpu->ubwc_config.macrotile_mode;
+		*value = adreno_gpu->ubwc_config->macrotile_mode;
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;
@@ -1149,10 +1149,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		speedbin = 0xffff;
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
 
-	adreno_gpu->common_ubwc_cfg = devm_kzalloc(dev,
-						   sizeof(*adreno_gpu->common_ubwc_cfg),
-						   GFP_KERNEL);
-	if (!adreno_gpu->common_ubwc_cfg)
+	adreno_gpu->ubwc_config = devm_kzalloc(dev, sizeof(*adreno_gpu->ubwc_config), GFP_KERNEL);
+	if (!adreno_gpu->ubwc_config)
 		return -ENOMEM;
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 06be95d3efaee94e4107a484ad3132e0a6a9ea46..5d27666c46e29da5177d6fc900effc209c2a5507 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -207,45 +207,7 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
-	struct {
-		/**
-		 * @rgb565_predicator: Unknown, introduced with A650 family,
-		 * related to UBWC mode/ver 4
-		 */
-		u32 rgb565_predicator;
-		/** @uavflagprd_inv: Unknown, introduced with A650 family */
-		u32 uavflagprd_inv;
-		/** @min_acc_len: Whether the minimum access length is 64 bits */
-		u32 min_acc_len;
-		/**
-		 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
-		 *
-		 * UBWC 1.0 always enables all three levels.
-		 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
-		 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
-		 *
-		 * This is a bitmask where BIT(0) enables level 1, BIT(1)
-		 * controls level 2, and BIT(2) enables level 3.
-		 */
-		u32 ubwc_swizzle;
-		/**
-		 * @highest_bank_bit: Highest Bank Bit
-		 *
-		 * The Highest Bank Bit value represents the bit of the highest
-		 * DDR bank.  This should ideally use DRAM type detection.
-		 */
-		u32 highest_bank_bit;
-		u32 amsbc;
-		/**
-		 * @macrotile_mode: Macrotile Mode
-		 *
-		 * Whether to use 4-channel macrotiling mode or the newer
-		 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
-		 * 4-channel and 1 is 8-channel.
-		 */
-		u32 macrotile_mode;
-	} ubwc_config;
-	const struct qcom_ubwc_cfg_data *common_ubwc_cfg;
+	struct qcom_ubwc_cfg_data *ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.49.0

