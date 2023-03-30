Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC36D112A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E7210F064;
	Thu, 30 Mar 2023 21:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34E510F050
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:53:30 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id c9so15959559lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsfWQtNlXA1V8diipQ6nVuvFyWt+6J5VwPBY9mXdEzw=;
 b=EJd9TlxvpKBMLo2f9qq0r9jzZPeUuLMqNmQ7v3vPJFRVbfAA5o2D08y37APKMMj4fr
 oSIiUShZ8DOrzrfAVJmIZRkMzKdqV0n15dg8F+WSm2pRLzZPi8Y33tcrearNgC9gAjqL
 40N03WkXOiYwq23lyJQeYl647WTtSQDh0/54WJYr9Ac/EOGcooVLZVuQLFuH7Fl6wvC9
 R4MGkK4jWovsUk9TuE3zEI6UAQHKa7asWpCq6W1SilI6FN1Ghzmq5Sogphavfo4lFbxF
 mkKjCshVRFibZDCEwCxeEU+U+RA7/B1imDolKyv6rjzvwq4K6W1IuroztxlBVIdK8EVm
 q9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsfWQtNlXA1V8diipQ6nVuvFyWt+6J5VwPBY9mXdEzw=;
 b=Atc5rY5+eh18Zoay9RoPuLwRClTfIOyb5Qls3J0SAJmiKnY1GSoZM45hSSLuMzVl1W
 2+0BJY3tFL9biXsnnM2SwuB6jl8AUnp23JjhxkteoBThmMkeIvTsmPc1y36nYswS8/66
 PkCT8R9TrwAmxCgcc/1jHOwIjLXrHX4QCjGuIiNiJxkCGYaduPl0+IxNhnw4o6BlH8R3
 uB5dS4dmMjUqqv7pmKyWP9lVsidiYSuRZC6gJkOfWN1l0HqpHUBP4cZh5FsxizsrZQWb
 cs0JwyKy2l/7WEUCG6XkZV+Hiwp+AVOaSIX4kz2KxCF/5oRqybi06hzHsAUWVxFXeMdy
 xNRA==
X-Gm-Message-State: AAQBX9fIZNMjDzgkTkJ+vgiCLk7SwMnZ41hV3txMVYfmoChMGWKAUP+T
 vf8J5ZjEU7k5aQnLnn4gbauxAg==
X-Google-Smtp-Source: AKy350a4K7o1YBpHoJRMmEdRdEwFzSU/Wk5drm08T2f3IcKQezI2Sn0pQEjaI7lxtsMGTae4Xp8msw==
X-Received: by 2002:ac2:4434:0:b0:4eb:dd2:f3d2 with SMTP id
 w20-20020ac24434000000b004eb0dd2f3d2mr4923396lfl.43.1680213208912; 
 Thu, 30 Mar 2023 14:53:28 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:53:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 05/38] drm/msm/dpu: split SM8550 catalog entry to the
 separate file
Date: Fri, 31 Mar 2023 00:52:51 +0300
Message-Id: <20230330215324.1853304-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad DYbcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 177 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 180 +-----------------
 2 files changed, 179 insertions(+), 178 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
new file mode 100644
index 000000000000..8db73d03b194
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_9_0_SM8550_H
+#define _DPU_9_0_SM8550_H
+
+static const struct dpu_caps sm8550_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+};
+
+static const struct dpu_mdp_cfg sm8550_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x6330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x8330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0xa330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x24330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x26330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x28330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2a330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA4] = { .reg_off = 0x2c330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA5] = { .reg_off = 0x2e330, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg sm8550_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x290,
+	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x290,
+	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x290,
+	.features = CTL_SM8550_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x290,
+	.features = CTL_SM8550_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x19000, .len = 0x290,
+	.features = CTL_SM8550_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a000, .len = 0x290,
+	.features = CTL_SM8550_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg sm8550_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
+		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
+		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
+		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
+		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_CURSOR_SDM845_MASK,
+		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
+	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_CURSOR_SDM845_MASK,
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
+};
+
+static const struct dpu_pingpong_cfg sm8550_pp[] = {
+	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
+	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			-1),
+	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			-1),
+	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			-1),
+	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+			-1),
+	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
+			-1,
+			-1),
+	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
+			-1,
+			-1),
+};
+
+static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
+};
+
+static const struct dpu_intf_cfg sm8550_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x300, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	/* TODO TE sub-blocks for intf1 & intf2 */
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x37000, 0x300, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
+static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
+	.caps = &sm8550_dpu_caps,
+	.ubwc = &sm8550_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sm8550_mdp),
+	.mdp = sm8550_mdp,
+	.ctl_count = ARRAY_SIZE(sm8550_ctl),
+	.ctl = sm8550_ctl,
+	.sspp_count = ARRAY_SIZE(sm8550_sspp),
+	.sspp = sm8550_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm8550_pp),
+	.pingpong = sm8550_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
+	.merge_3d = sm8550_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8550_intf),
+	.intf = sm8550_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sm8450_regdma,
+	.perf = &sm8450_perf_data,
+	.mdss_irqs = IRQ_SM8450_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b8f41dc1be5b..c72d71e0d117 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -452,18 +452,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sm8550_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 5120,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
@@ -532,11 +520,6 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 	.ubwc_swizzle = 0x6,
 };
 
-static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-};
-
 static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.highest_bank_bit = 0x1,
@@ -761,36 +744,6 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sm8550_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-			.reg_off = 0x4330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-			.reg_off = 0x6330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
-			.reg_off = 0x8330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
-			.reg_off = 0xa330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-			.reg_off = 0x24330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-			.reg_off = 0x26330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-			.reg_off = 0x28330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
-			.reg_off = 0x2a330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA4] = {
-			.reg_off = 0x2c330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA5] = {
-			.reg_off = 0x2e330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
-			.reg_off = 0x2bc, .bit_off = 20},
-	},
-};
-
 static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -1049,45 +1002,6 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg sm8550_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x290,
-	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x290,
-	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
-	},
-};
-
 static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -1355,29 +1269,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-static const struct dpu_sspp_cfg sm8550_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
-		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
-		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
-		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
-		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
-	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
-};
-
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK_SDMA,
 		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -1802,33 +1693,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 			-1),
 };
 
-static const struct dpu_pingpong_cfg sm8550_pp[] = {
-	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-			-1),
-	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-			-1),
-	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-			-1),
-	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-			-1),
-	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-			-1),
-	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
-			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-			-1),
-	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
-			-1,
-			-1),
-	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
-			-1,
-			-1),
-};
-
 /*************************************************************
  * MERGE_3D sub blocks config
  *************************************************************/
@@ -1859,13 +1723,6 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
 };
 
-static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
-};
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
@@ -1979,14 +1836,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sm8550_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x300, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	/* TODO TE sub-blocks for intf1 & intf2 */
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x300, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-};
-
 /*************************************************************
  * Writeback blocks config
  *************************************************************/
@@ -2833,33 +2682,6 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8450_MASK,
 };
 
-static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
-	.caps = &sm8550_dpu_caps,
-	.ubwc = &sm8550_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8550_mdp),
-	.mdp = sm8550_mdp,
-	.ctl_count = ARRAY_SIZE(sm8550_ctl),
-	.ctl = sm8550_ctl,
-	.sspp_count = ARRAY_SIZE(sm8550_sspp),
-	.sspp = sm8550_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
-	.pingpong_count = ARRAY_SIZE(sm8550_pp),
-	.pingpong = sm8550_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
-	.merge_3d = sm8550_merge_3d,
-	.intf_count = ARRAY_SIZE(sm8550_intf),
-	.intf = sm8550_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
-	.perf = &sm8450_perf_data,
-	.mdss_irqs = IRQ_SM8450_MASK,
-};
-
 static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.caps = &sc7280_dpu_caps,
 	.ubwc = &sc7280_ubwc_cfg,
@@ -2906,6 +2728,8 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+#include "catalog/dpu_9_0_sm8550.h"
+
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_300, .dpu_cfg = &msm8998_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_301, .dpu_cfg = &msm8998_dpu_cfg},
-- 
2.39.2

