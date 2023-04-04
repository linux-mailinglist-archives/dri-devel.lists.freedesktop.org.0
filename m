Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AD6D6212
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC46810E695;
	Tue,  4 Apr 2023 13:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3010E67F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:08:53 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q14so33756519ljm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I7SuJPsa+BYy3gutMl9cEORInyj1lZiBFEGvby0yXQ8=;
 b=GQ6YClSJAxiUFB8Gp+fQIojvGxmt5pE3Zhg52/W0YUrgAy9PeoKOOt7jLJB2LTKPVR
 HPZ8bsCC3A1fZOyGfjnWSjL81cekucoI6VZ0QyM4Y4hkbAAOjidqxWeXTUKDJ/JpVajm
 9Qz2RYLM3ohN8O7UnoqvBI+wKYUolFppgYonG9P+5tqhEE/mA5zLi4knGhovgeUM2sX2
 cBbTSyUzhm2/J0BD2iGijmwykAJMbUzjtw95kTy4LKKOZLWJbiUAdDOenxZn2szzby0Z
 GF0G75Nw2wet/eECuQe/wxIKt+Uwt4Q/QEiA15J+LPsJrdL0EUQfg8ginU7MAFSSmDD8
 tEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I7SuJPsa+BYy3gutMl9cEORInyj1lZiBFEGvby0yXQ8=;
 b=ZSmEUT1Jix2ZNBkREbSz9HlAdPPekuUWDmgDhlXv/pZgx6rHmPxVUvMcMmTGnmoVkW
 5/Fu3g4wQoyBFXeSHEiRJbEIXOP/lI56oaeDTAnY0m2dKGyoul1SBuRbgDHpE2smJTCz
 3XZr8levLyQBr8z6SFOSli8h2zsehBmYbDWeAAcw+rx+gX7QWZcwhpS8y+rr461Tkt+j
 uIsJHjR/y8LQjkWpUZEzR+kel7SbobHYdmJwbrh01PdbJtWlauh8b+ELG+6DCFbiCL0N
 8e/OEptKYosxtITovfoHvQtd1iWFAAVcrGL6TLpqZfm5Su8UE0gd0vqQluz3AtcAZsLY
 TYTg==
X-Gm-Message-State: AAQBX9dXXQFKpvog7nkKzRKMT8u1RsM0N2AcB9zN1qGj0CA6XopWKIrX
 2XYrD27zCAp8lhrz8uwuS7DvUQ==
X-Google-Smtp-Source: AKy350Z+eOHuZ2wRvdIvMbwBzwHFH14ILjSTR7XfxP4QnZ4KMyvxeWp4RzPRYJAlqxQS5BtFDic9bw==
X-Received: by 2002:a2e:86d2:0:b0:298:ac88:8d51 with SMTP id
 n18-20020a2e86d2000000b00298ac888d51mr867574ljj.42.1680613731313; 
 Tue, 04 Apr 2023 06:08:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:08:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 14/42] drm/msm/dpu: split SC7180 catalog entry to the
 separate file
Date: Tue,  4 Apr 2023 16:05:54 +0300
Message-Id: <20230404130622.509628-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 147 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 143 +----------------
 2 files changed, 148 insertions(+), 142 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
new file mode 100644
index 000000000000..2326be2900ea
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_2_SC7180_H
+#define _DPU_6_2_SC7180_H
+
+static const struct dpu_caps sc7180_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x9,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.highest_bank_bit = 0x3,
+};
+
+static const struct dpu_mdp_cfg sc7180_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+	},
+};
+
+static const struct dpu_ctl_cfg sc7180_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+};
+
+static const struct dpu_sspp_cfg sc7180_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+		sc7180_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+};
+
+static const struct dpu_lm_cfg sc7180_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
+};
+
+static const struct dpu_dspp_cfg sc7180_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
+};
+
+static const struct dpu_intf_cfg sc7180_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
+static const struct dpu_perf_cfg sc7180_perf_data = {
+	.max_bw_low = 6800000,
+	.max_bw_high = 6800000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
+	.caps = &sc7180_dpu_caps,
+	.ubwc = &sc7180_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sc7180_mdp),
+	.mdp = sc7180_mdp,
+	.ctl_count = ARRAY_SIZE(sc7180_ctl),
+	.ctl = sc7180_ctl,
+	.sspp_count = ARRAY_SIZE(sc7180_sspp),
+	.sspp = sc7180_sspp,
+	.mixer_count = ARRAY_SIZE(sc7180_lm),
+	.mixer = sc7180_lm,
+	.dspp_count = ARRAY_SIZE(sc7180_dspp),
+	.dspp = sc7180_dspp,
+	.pingpong_count = ARRAY_SIZE(sc7180_pp),
+	.pingpong = sc7180_pp,
+	.intf_count = ARRAY_SIZE(sc7180_intf),
+	.intf = sc7180_intf,
+	.wb_count = ARRAY_SIZE(sm8250_wb),
+	.wb = sm8250_wb,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sdm845_regdma,
+	.perf = &sc7180_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d2b8292155df..c61986ce1cf9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -347,16 +347,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps sc7180_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x9,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -407,11 +397,6 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.highest_bank_bit = 0x2,
@@ -480,24 +465,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sc7180_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-		.reg_off = 0x2C4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
-		.reg_off = 0x3B8, .bit_off = 24},
-	},
-};
-
 static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -619,27 +586,6 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg sc7180_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-};
-
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -822,17 +768,6 @@ static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
 			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
 
-static const struct dpu_sspp_cfg sc7180_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
-		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-};
-
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
 				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
 
@@ -986,13 +921,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-static const struct dpu_lm_cfg sc7180_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
-};
-
 /* SM8150 */
 
 static const struct dpu_lm_cfg sm8150_lm[] = {
@@ -1055,11 +983,6 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 		 &msm8998_dspp_sblk),
 };
 
-static const struct dpu_dspp_cfg sc7180_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sc7180_dspp_sblk),
-};
-
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
 		 &sm8150_dspp_sblk),
@@ -1137,11 +1060,6 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
-};
-
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1233,11 +1151,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-};
-
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -1554,34 +1467,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc7180_perf_data = {
-	.max_bw_low = 6800000,
-	.max_bw_high = 6800000,
-	.min_core_ib = 2400000,
-	.min_llcc_ib = 800000,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
-		.entries = sc7180_qos_linear
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
-		.entries = sc7180_qos_nrt
-		},
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
-
 static const struct dpu_perf_cfg sm8150_perf_data = {
 	.max_bw_low = 12800000,
 	.max_bw_high = 12800000,
@@ -1720,33 +1605,6 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.mdss_irqs = IRQ_SDM845_MASK,
 };
 
-static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
-	.caps = &sc7180_dpu_caps,
-	.ubwc = &sc7180_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc7180_mdp),
-	.mdp = sc7180_mdp,
-	.ctl_count = ARRAY_SIZE(sc7180_ctl),
-	.ctl = sc7180_ctl,
-	.sspp_count = ARRAY_SIZE(sc7180_sspp),
-	.sspp = sc7180_sspp,
-	.mixer_count = ARRAY_SIZE(sc7180_lm),
-	.mixer = sc7180_lm,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
-	.pingpong_count = ARRAY_SIZE(sc7180_pp),
-	.pingpong = sc7180_pp,
-	.intf_count = ARRAY_SIZE(sc7180_intf),
-	.intf = sc7180_intf,
-	.wb_count = ARRAY_SIZE(sm8250_wb),
-	.wb = sm8250_wb,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
-	.perf = &sc7180_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
-};
-
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
@@ -1832,6 +1690,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8250_MASK,
 };
 
+#include "catalog/dpu_6_2_sc7180.h"
 #include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
 
-- 
2.39.2

