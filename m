Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDCAB6F28
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8F810E66F;
	Wed, 14 May 2025 15:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IgKZBwls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380610E665;
 Wed, 14 May 2025 15:11:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C91A05C627D;
 Wed, 14 May 2025 15:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401E7C4CEE3;
 Wed, 14 May 2025 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235501;
 bh=vr1ecV4IpmwbIh24JllrRkUYlyWMD7eggegSS0j+1Io=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IgKZBwlsHk3+JLegOdk8Bfdvy0IbHqzPEw6wJ/gop+G63vxSdWltvJMK/g9Mch0ur
 sqTBimykdF7iJqr1a2uZEqRm+AggWvwoSKPvwbjq8ZWbbU1BOVhikqUX9e+sMPfeWt
 kyBAyrqClGQlQrNdiqCTD+fCd4KldBrl/jqL59O13gCrk5dgk9LDTonPhTj65xe36j
 mwlPFbxfDFcs1tImONgUnbrr/z4So7ILKNa35koNCI5Gfbpv+7p8iYrHOtk3WAo/QS
 2O19MLAtGD+y6htW6szzrc9wge+uvlUWxVeCRoxEjxNYHiJNMFi5Vapvs1IM23O4+c
 AiSh7ShOXGz3w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:31 +0200
Subject: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=10116;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9JU2RVFkoLhkak/u8sJDw3gG2svYycgoNusUQ6n/+zU=;
 b=j8oVn2Co1BPO48VApF6/zDGkWkzTBwjM+S27rJdzpkArNUeu4+OKsVA4bR5cwbXjICgGzoL9V
 Iwc0Mfpbug8D7TscyQT2muFYwODnJFLaAnOk2sJmkxl3p2MSHyvJxeY
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
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
 4 files changed, 50 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
+	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
 
 	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
 	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
@@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
 
-	/* Set the highest bank bit */
-	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
-		adreno_gpu->ubwc_config.highest_bank_bit = 15;
-	else
-		adreno_gpu->ubwc_config.highest_bank_bit = 14;
+	/* Inherit the common config and make some necessary fixups */
+	common_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(common_cfg))
+		return ERR_PTR(-EINVAL);
 
-	/* a5xx only supports UBWC 1.0, these are not configurable */
-	adreno_gpu->ubwc_config.macrotile_mode = 0;
-	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
+	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
+	adreno_gpu->_ubwc_config = *common_cfg;
+	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+	const struct qcom_ubwc_cfg_data *common_cfg;
+	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
+
 	/* Inherit the common config and make some necessary fixups */
-	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(gpu->common_ubwc_cfg))
+	common_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(common_cfg))
 		return -EINVAL;
 
-	gpu->ubwc_config.ubwc_swizzle = 0x6;
-	gpu->ubwc_config.macrotile_mode = 0;
-	gpu->ubwc_config.highest_bank_bit = 15;
+	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
+	*cfg = *common_cfg;
+
+	cfg->ubwc_swizzle = 0x6;
+	cfg->highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.ubwc_swizzle = 0x7;
+		cfg->highest_bank_bit = 13;
+		cfg->ubwc_swizzle = 0x7;
 	}
 
 	if (adreno_is_a618(gpu))
-		gpu->ubwc_config.highest_bank_bit = 14;
+		cfg->highest_bank_bit = 14;
 
 	if (adreno_is_a619(gpu))
 		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		gpu->ubwc_config.highest_bank_bit = 13;
+		cfg->highest_bank_bit = 13;
 
 	if (adreno_is_a619_holi(gpu))
-		gpu->ubwc_config.highest_bank_bit = 13;
+		cfg->highest_bank_bit = 13;
 
 	if (adreno_is_a621(gpu))
-		gpu->ubwc_config.highest_bank_bit = 13;
+		cfg->highest_bank_bit = 13;
 
-	if (adreno_is_a623(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.macrotile_mode = 1;
-	}
-
-	if (adreno_is_a680(gpu))
-		gpu->ubwc_config.macrotile_mode = 1;
+	if (adreno_is_a623(gpu))
+		cfg->highest_bank_bit = 16;
 
 	if (adreno_is_a650(gpu) ||
 	    adreno_is_a660(gpu) ||
 	    adreno_is_a690(gpu) ||
 	    adreno_is_a730(gpu) ||
 	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
-		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.macrotile_mode = 1;
+		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
+		cfg->highest_bank_bit = 16;
 	}
 
 	if (adreno_is_a663(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.macrotile_mode = 1;
-		gpu->ubwc_config.ubwc_swizzle = 0x4;
+		cfg->highest_bank_bit = 13;
+		cfg->ubwc_swizzle = 0x4;
 	}
 
-	if (adreno_is_7c3(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 14;
-		gpu->ubwc_config.macrotile_mode = 1;
-	}
+	if (adreno_is_7c3(gpu))
+		cfg->highest_bank_bit = 14;
 
 	if (adreno_is_a702(gpu))
-		gpu->ubwc_config.highest_bank_bit = 14;
+		cfg->highest_bank_bit = 14;
+
+	gpu->ubwc_config = &gpu->_ubwc_config;
 
 	return 0;
 }
@@ -654,14 +652,14 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
 	bool min_acc_len_64b = adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu);
-	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
 	 * as hbb_lo and the one above it as hbb_hi to the hardware.
 	 */
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	BUG_ON(cfg->highest_bank_bit < 13);
+	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
@@ -695,7 +693,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  adreno_gpu->ubwc_config.macrotile_mode);
+		  cfg->macrotile_mode);
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2348ffb35f7eb73a26da47881901d9111dca1ad9..f072c2156e94dfba8273e33e752167d919dc4db5 100644
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 06be95d3efaee94e4107a484ad3132e0a6a9ea46..ebbca9672f25861bbbfa3ff28878c581fae6402c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -207,45 +207,12 @@ struct adreno_gpu {
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
+	/*
+	 * The migration to the central UBWC config db is still in flight - keep
+	 * a copy containing some local fixups until that's done.
+	 */
+	const struct qcom_ubwc_cfg_data *ubwc_config;
+	struct qcom_ubwc_cfg_data _ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.49.0

