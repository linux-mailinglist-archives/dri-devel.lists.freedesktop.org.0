Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA1AE83F6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D3810E721;
	Wed, 25 Jun 2025 13:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W4anO5DM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D73B10E721;
 Wed, 25 Jun 2025 13:11:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0225E445F9;
 Wed, 25 Jun 2025 13:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6F3C4CEEF;
 Wed, 25 Jun 2025 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857084;
 bh=TmIM0p72O2FZNkhlwbmPcq/u359hmkpIqewYPntpNE4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W4anO5DMRsPgGzlrkfZGBzwB9qGZ/FKeRBHzw41gXFbEzp2gyozY7IjCXFw5jezjU
 d/GxPLDWF36sV+zHDI5hY9KnN+kZ2GXrXgmcEtB2ZnaUyGcnZga0l9mmIh2zIwef+O
 LSLNODVJ+U9KV2XseHn45dTCEstOuCFv5yjxtyJFo13lSnBo3cqzU4/hE5dbkG3w0A
 AtKYKpP3Zqzy79YXXe6UuD2lJCrQso8MgKykPjR0+ig806mfQzjMljItdUhuksmkbN
 RdKoB6cPrhYxRaQrcDORVR3bW2pvwRJJX9PBvpPpNW+rS06G7gXVLQOo4lG4GJH/Yy
 leMFvX1Ab0D3A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:22 +0200
Subject: [PATCH v5 14/14] drm/msm/adreno: Switch to the common UBWC config
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-14-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=10610;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=potIy8Dkkz/1yoAE7J/I600HrUDXJJWdkOC8tivmHWU=;
 b=5ZklbqY90MPGggp+8npt0zOBciPmOeioMn+oIxJDyOu0O3QbcnO8ivK3ZvkhgOLwBLGZ77dGD
 wUCLVWtOaKmA2famVTNUSK4fIgVhOavro6q9fmkd3TUnZ9fRV+r/0ih
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 76 ++++++++++++++++++---------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 +++----------------
 4 files changed, 60 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 60aef079623606bb1ae44ba59ac45e391595b0ba..6a77d130446218e81ea44330eea284a4abe98d3a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -835,8 +835,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
+	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
 
 	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
 	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
@@ -1756,6 +1756,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1792,15 +1793,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
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
+		return ERR_CAST(common_cfg);
 
-	/* a5xx only supports UBWC 1.0, these are not configurable */
-	adreno_gpu->ubwc_config.macrotile_mode = 0;
-	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
+	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
+	adreno_gpu->_ubwc_config = *common_cfg;
+	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6612030621b1b16c8662d39453b609c9c9ff982f..c618cebc5682fbfb21f328ca5756fa0ac34831d9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -605,64 +605,70 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
-	/* Inherit the common config and make some necessary fixups */
-	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(gpu->common_ubwc_cfg))
-		return PTR_ERR(gpu->common_ubwc_cfg);
+	const struct qcom_ubwc_cfg_data *common_cfg;
+	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
 
-	gpu->ubwc_config.ubwc_swizzle = 0x6;
-	gpu->ubwc_config.macrotile_mode = 0;
-	gpu->ubwc_config.highest_bank_bit = 15;
+	/* Inherit the common config and make some necessary fixups */
+	common_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(common_cfg))
+		return PTR_ERR(common_cfg);
+
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
+	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
+		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
+			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
+
+	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
+		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
+			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
+
+	gpu->ubwc_config = &gpu->_ubwc_config;
 
 	return 0;
 }
@@ -670,14 +676,14 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
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
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
@@ -719,7 +725,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  adreno_gpu->ubwc_config.macrotile_mode);
+		  cfg->macrotile_mode);
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 86bff915c3e793583c81a6414ee89c1f59365c58..1251ff1b4895287340c9f3809d46441aded64cfd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -420,16 +420,16 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
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
index a2a211cac147cb5bc5befdcab07559b778adc2bb..e56a39df815f100caca945576de7cb55664980bc 100644
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
2.50.0

