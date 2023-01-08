Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA896619C4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C8310E246;
	Sun,  8 Jan 2023 21:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F62910E246
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:11:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j17so10145821lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 13:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LraFTUnKHODDqjdQOwznpZDt+ooYEfY6V4bp7AEzY/I=;
 b=JcWHQZIkCEwkB5dKLRAFKGna0QwVQhM78uHY9K31m9XqbSxnIziqQLG04iKppEsVDX
 +opYsFKmjFhXe4HCTtmjHcVrJt3t/TxogpwnejvTCtUMsz2BxYY9pWWAV6L2zQXprUnW
 cH0LVLELuS7xcDqv2gTDB9wRL8p+2Fm6QpBe+3OrmH2inQnJ1a6W1pNM+PfNPEdKdeew
 5AbEQ2kQx9Rnc3JAnj3f9CGCHONL/yR19TUvtLe0a26G+S//Q4n+1ELHzK3dKyBgGCHf
 4h80peJ6gkCDgRICfa2yiKKjWpAHtb6e+cFBGDk505RX/UwWYBXls9sPtpr7bFOPvlkG
 0B6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LraFTUnKHODDqjdQOwznpZDt+ooYEfY6V4bp7AEzY/I=;
 b=TJDFnGoNGiMc/EO5Ydlr+O80cIQ0RCnL4EgdYZIPLHRPTN7mxjmktrO2sKbevVpCvA
 OHm/UypLqLLgMyjEMJHKs3bpMr5aRMI2+ERC05n7CxC/31E0ymGOg9tai294tL6NQpFS
 fQyhXkNa+6nfx9gDEIQcYudcxWBcQd0YSN7YJOmMhwZxMWh2kFdcnfYADIl8soqH2Mub
 vNhX9/cKUClKaRJ03DJimuBXmD8J39yBGHcmLF0+pMRIkgWZCeLJy7tGf7WJowreGZnr
 TjFRiefct5RaTEsxkSIvJtym+dteGSVz4Ux7wLyPzRazS3bwRK7e9dWrnRZjMz8Mq1Zl
 hPWg==
X-Gm-Message-State: AFqh2komzj2X6dCo8t/NbTNKIHwBvnFUD0QAyHj59VoUG/2Kaq9nAA+e
 TuAKdfbh2ow6Bi6UY2i6Lzl/yg==
X-Google-Smtp-Source: AMrXdXu4mYD4tyUjhBPhtQ9FB+EH9bWhG/8+GHdkzClVjqdderuKEqX60hkPlXUtgGNFbB12wcIPbA==
X-Received: by 2002:a05:6512:1115:b0:4aa:e120:b431 with SMTP id
 l21-20020a056512111500b004aae120b431mr20842932lfg.38.1673212274055; 
 Sun, 08 Jan 2023 13:11:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c18-20020a196552000000b004b567e1f8e5sm1230765lfj.125.2023.01.08.13.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 13:11:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Date: Sun,  8 Jan 2023 23:11:13 +0200
Message-Id: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Different entries into the catalog were added quite randomly. Enforce
the sorting order of some kind. It is not alphabetic to prevent the
patch from growing uncontrollably. Thus SDM comes before SC and SM
platforms and QCM is kept as the last one. There are no functional
changes in this patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Yes, I hate such mass-moves too. However the entries in this file are
slowly becoming uncontrollable. Let's enforce some order now (while it's
late already, but not _that_ late).

---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 484 +++++++++---------
 1 file changed, 244 insertions(+), 240 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fef33e89678d..6f346a940c61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -3,6 +3,17 @@
  * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+/*
+ * Individual entries are sorted by the SoC type and index.
+ * Please keep the following sorting order:
+ *
+ * - MSM
+ * - SDM
+ * - SC
+ * - SM
+ * - QCM*
+ */
+
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 #include <linux/slab.h>
 #include <linux/of_address.h>
@@ -102,15 +113,6 @@
 			 BIT(MDP_INTF1_7xxx_INTR) | \
 			 BIT(MDP_INTF5_7xxx_INTR))
 
-#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR) | \
-			 BIT(MDP_INTF2_INTR) | \
-			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_INTF4_INTR))
-
 #define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
 			  BIT(MDP_SSPP_TOP0_INTR2) | \
 			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
@@ -123,6 +125,15 @@
 			  BIT(MDP_AD4_0_INTR) | \
 			  BIT(MDP_AD4_1_INTR))
 
+#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF0_INTR) | \
+			 BIT(MDP_INTF1_INTR) | \
+			 BIT(MDP_INTF2_INTR) | \
+			 BIT(MDP_INTF3_INTR) | \
+			 BIT(MDP_INTF4_INTR))
+
 #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
@@ -320,19 +331,19 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sm6115_dpu_caps = {
+static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x4,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.max_mixer_blendstages = 0x7,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
-	.max_linewidth = 2160,
+	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sm8150_dpu_caps = {
+static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
@@ -348,7 +359,19 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps sc8180x_dpu_caps = {
+static const struct dpu_caps sm6115_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
@@ -378,18 +401,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = 2400,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -461,6 +472,22 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sc7280_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x2014,
+	.highest_bank_bit = 0x1,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+		.reg_off = 0x2ac, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+		.reg_off = 0x2ac, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+		.reg_off = 0x2b4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+		.reg_off = 0x2c4, .bit_off = 8},
+	},
+};
+
 static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -528,22 +555,6 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sc7280_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x2014,
-	.highest_bank_bit = 0x1,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
-		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
-		.reg_off = 0x2C4, .bit_off = 8},
-	},
-};
-
 static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -647,6 +658,33 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sc7280_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+};
+
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -686,33 +724,6 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg sc7280_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-};
-
 static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -767,6 +778,19 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
+#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
+	{ \
+	.maxdwnscale = SSPP_UNITY_SCALE, \
+	.maxupscale = SSPP_UNITY_SCALE, \
+	.smart_dma_priority = sdma_pri, \
+	.src_blk = {.name = STRCAT("sspp_src_", num), \
+		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
+	.format_list = plane_formats_yuv, \
+	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.virt_format_list = plane_formats, \
+	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	}
+
 #define _DMA_SBLK(num, sdma_pri) \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
@@ -809,6 +833,15 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
 
+static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
+
+static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
+
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
+static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
+
 #define SSPP_BLK(_name, _id, _base, _features, \
 		_sblk, _xinid, _type, _clkctrl) \
 	{ \
@@ -859,12 +892,6 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
-static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
-
-static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
-
 static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
 		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -876,6 +903,17 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_cfg sc7280_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
+		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+};
+
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
 				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED3LITE);
 
@@ -914,34 +952,6 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
-static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
-		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
-};
-
-
-#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
-	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
-	.smart_dma_priority = sdma_pri, \
-	.src_blk = {.name = STRCAT("sspp_src_", num), \
-		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
-	}
-
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
-
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -1016,8 +1026,6 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -1033,7 +1041,14 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
 };
 
-/* SM8150 */
+static const struct dpu_lm_cfg sc7280_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
+};
 
 static const struct dpu_lm_cfg sm8150_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
@@ -1050,17 +1065,6 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
-static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
-		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
-		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
-};
-
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
@@ -1191,6 +1195,13 @@ static struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1212,13 +1223,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 static struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1293,13 +1297,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 };
 
-static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-};
-
 static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -1316,6 +1313,13 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
 };
 
+static const struct dpu_intf_cfg sm8150_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
 static const struct dpu_intf_cfg qcm2290_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -1470,31 +1474,31 @@ static const struct dpu_qos_lut_entry sdm845_qos_linear[] = {
 	{.fl = 0, .lut = 0x11222222223357}
 };
 
-static const struct dpu_qos_lut_entry msm8998_qos_macrotile[] = {
-	{.fl = 10, .lut = 0x1aaff},
-	{.fl = 11, .lut = 0x5aaff},
-	{.fl = 12, .lut = 0x15aaff},
-	{.fl = 13, .lut = 0x55aaff},
-	{.fl = 1,  .lut = 0x1aaff},
-	{.fl = 0,  .lut = 0},
-};
-
 static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
 	{.fl = 0, .lut = 0x0011222222335777},
 };
 
-static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
-	{.fl = 0, .lut = 0x0011222222223357 },
-};
-
 static const struct dpu_qos_lut_entry sc8180x_qos_linear[] = {
 	{.fl = 4, .lut = 0x0000000000000357 },
 };
 
+static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
+	{.fl = 0, .lut = 0x0011222222223357 },
+};
+
 static const struct dpu_qos_lut_entry qcm2290_qos_linear[] = {
 	{.fl = 0, .lut = 0x0011222222335777},
 };
 
+static const struct dpu_qos_lut_entry msm8998_qos_macrotile[] = {
+	{.fl = 10, .lut = 0x1aaff},
+	{.fl = 11, .lut = 0x5aaff},
+	{.fl = 12, .lut = 0x15aaff},
+	{.fl = 13, .lut = 0x55aaff},
+	{.fl = 1,  .lut = 0x1aaff},
+	{.fl = 0,  .lut = 0},
+};
+
 static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
 	{.fl = 10, .lut = 0x344556677},
 	{.fl = 11, .lut = 0x3344556677},
@@ -1624,18 +1628,18 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sm6115_perf_data = {
-	.max_bw_low = 3100000,
-	.max_bw_high = 4000000,
-	.min_core_ib = 2400000,
-	.min_llcc_ib = 800000,
-	.min_dram_ib = 800000,
+static const struct dpu_perf_cfg sc7280_perf_data = {
+	.max_bw_low = 4700000,
+	.max_bw_high = 8800000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
 	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
+	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
 	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
-		.entries = sc7180_qos_linear
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
 		},
 		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
 		.entries = sc7180_qos_macrotile
@@ -1643,7 +1647,6 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
 		.entries = sc7180_qos_nrt
 		},
-		/* TODO: macrotile-qseed is different from macrotile */
 	},
 	.cdp_cfg = {
 		{.rd_enable = 1, .wr_enable = 1},
@@ -1653,21 +1656,19 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sm8150_perf_data = {
-	.max_bw_low = 12800000,
-	.max_bw_high = 12800000,
+static const struct dpu_perf_cfg sc8180x_perf_data = {
+	.max_bw_low = 9600000,
+	.max_bw_high = 9600000,
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
-	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
 	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
-		.entries = sm8150_qos_linear
+		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
+		.entries = sc8180x_qos_linear
 		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
+		{.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
+		.entries = sc8180x_qos_macrotile
 		},
 		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
 		.entries = sc7180_qos_nrt
@@ -1682,19 +1683,21 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc8180x_perf_data = {
-	.max_bw_low = 9600000,
-	.max_bw_high = 9600000,
+static const struct dpu_perf_cfg sm6115_perf_data = {
+	.max_bw_low = 3100000,
+	.max_bw_high = 4000000,
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
-	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
 	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
-		.entries = sc8180x_qos_linear
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
 		},
-		{.nentry = ARRAY_SIZE(sc8180x_qos_macrotile),
-		.entries = sc8180x_qos_macrotile
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
 		},
 		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
 		.entries = sc7180_qos_nrt
@@ -1709,18 +1712,18 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sm8250_perf_data = {
-	.max_bw_low = 13700000,
-	.max_bw_high = 16600000,
-	.min_core_ib = 4800000,
-	.min_llcc_ib = 0,
+static const struct dpu_perf_cfg sm8150_perf_data = {
+	.max_bw_low = 12800000,
+	.max_bw_high = 12800000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
-	.min_prefill_lines = 35,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
+	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
 	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
-		.entries = sc7180_qos_linear
+		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
+		.entries = sm8150_qos_linear
 		},
 		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
 		.entries = sc7180_qos_macrotile
@@ -1738,18 +1741,18 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc7280_perf_data = {
-	.max_bw_low = 4700000,
-	.max_bw_high = 8800000,
-	.min_core_ib = 2500000,
+static const struct dpu_perf_cfg sm8250_perf_data = {
+	.max_bw_low = 13700000,
+	.max_bw_high = 16600000,
+	.min_core_ib = 4800000,
 	.min_llcc_ib = 0,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
 	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
 		},
 		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
 		.entries = sc7180_qos_macrotile
@@ -1757,6 +1760,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
 		.entries = sc7180_qos_nrt
 		},
+		/* TODO: macrotile-qseed is different from macrotile */
 	},
 	.cdp_cfg = {
 		{.rd_enable = 1, .wr_enable = 1},
@@ -1864,6 +1868,52 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
+	.caps = &sc7280_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sc7280_mdp),
+	.mdp = sc7280_mdp,
+	.ctl_count = ARRAY_SIZE(sc7280_ctl),
+	.ctl = sc7280_ctl,
+	.sspp_count = ARRAY_SIZE(sc7280_sspp),
+	.sspp = sc7280_sspp,
+	.dspp_count = ARRAY_SIZE(sc7180_dspp),
+	.dspp = sc7180_dspp,
+	.mixer_count = ARRAY_SIZE(sc7280_lm),
+	.mixer = sc7280_lm,
+	.pingpong_count = ARRAY_SIZE(sc7280_pp),
+	.pingpong = sc7280_pp,
+	.intf_count = ARRAY_SIZE(sc7280_intf),
+	.intf = sc7280_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sc7280_perf_data,
+	.mdss_irqs = IRQ_SC7280_MASK,
+};
+
+static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
+	.caps = &sc8180x_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
+	.mdp = sc8180x_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sdm845_sspp),
+	.sspp = sdm845_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.pingpong_count = ARRAY_SIZE(sm8150_pp),
+	.pingpong = sm8150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+	.merge_3d = sm8150_merge_3d,
+	.intf_count = ARRAY_SIZE(sc8180x_intf),
+	.intf = sc8180x_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sm8150_regdma,
+	.perf = &sc8180x_perf_data,
+	.mdss_irqs = IRQ_SC8180X_MASK,
+};
+
 static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.caps = &sm6115_dpu_caps,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
@@ -1912,30 +1962,6 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.mdss_irqs = IRQ_SDM845_MASK,
 };
 
-static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
-	.caps = &sc8180x_dpu_caps,
-	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
-	.mdp = sc8180x_mdp,
-	.ctl_count = ARRAY_SIZE(sm8150_ctl),
-	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.pingpong_count = ARRAY_SIZE(sm8150_pp),
-	.pingpong = sm8150_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-	.merge_3d = sm8150_merge_3d,
-	.intf_count = ARRAY_SIZE(sc8180x_intf),
-	.intf = sc8180x_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
-	.perf = &sc8180x_perf_data,
-	.mdss_irqs = IRQ_SC8180X_MASK,
-};
-
 static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.caps = &sm8250_dpu_caps,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
@@ -1964,28 +1990,6 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8250_MASK,
 };
 
-static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
-	.caps = &sc7280_dpu_caps,
-	.mdp_count = ARRAY_SIZE(sc7280_mdp),
-	.mdp = sc7280_mdp,
-	.ctl_count = ARRAY_SIZE(sc7280_ctl),
-	.ctl = sc7280_ctl,
-	.sspp_count = ARRAY_SIZE(sc7280_sspp),
-	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
-	.mixer_count = ARRAY_SIZE(sc7280_lm),
-	.mixer = sc7280_lm,
-	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-	.pingpong = sc7280_pp,
-	.intf_count = ARRAY_SIZE(sc7280_intf),
-	.intf = sc7280_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.perf = &sc7280_perf_data,
-	.mdss_irqs = IRQ_SC7280_MASK,
-};
-
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-- 
2.39.0

