Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C66D6219
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799FF10E697;
	Tue,  4 Apr 2023 13:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2015010E2D4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:08:54 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q14so33756596ljm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4daX+ftuwj9Mt/t07VeaBMI9NN1bxOdQUw4Y1h0/DY=;
 b=gQRogPwQqMVLkSmtFBy6Nbza7XLwL6G/ZRWs3ictEYpky/E8fto4zPTEPQNUVFmGQ+
 aPO7fA09AMGzsWXYkYLtBwpAILlTJtsEYbUDOIO6ag5GmUL8ZfR7x64i8uguhEj1WbHa
 gmxWwic+6I+lp1ImB46/0dlBJwuDUhiLuuf2MR8YSnAYToz/jNIS0kZZBnWKqoQWiOfJ
 TLns/KdID3mN2USRhdejeYsqKjI2XajjjhouY1c5JOjOSer96WYtVBJZ3r0oSQqVNgXx
 5mwWlZ9hP2IN143Z2WYbghXfxyTglPVQvZqELCud4Gemm4tj50OZRgoKlRMO3R0KRBbz
 eTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4daX+ftuwj9Mt/t07VeaBMI9NN1bxOdQUw4Y1h0/DY=;
 b=orPG1kok1w+/+COIe6G/xypZFoEF+yqa81Xez4mZ6f782kX1UPqJ08/nVY7VMJYB2W
 uoIhJn/6mAPA8EEthg4Ccdn4nz4lB8taw/koa47W5+aTNV2+osH31wI9x2M1IPG7tFmO
 CWQI1az4gpeQcQY8i4qOgC2/IXkzFupUxQdkJCAk418ckUKj/KmNRAILXSKp/3t9KCrx
 PHkdptgjz8NtUDq39bMWNU9dGR8NdVtKi0RKqxSBI9P/PpuYCqOxSkv8kxYuEYWv7XjJ
 bSkSHSZhWxiTPZx3ZzQSHvhfZOXaSGhADwjbSI1xV/SH8KQj/3GrxI3hggjR+yYoL7yx
 WjOw==
X-Gm-Message-State: AAQBX9efURnAnDDP2gh8643DLpqgZm++Q4lzm2e+4Nf2SQSzZZSIm/ff
 tnNYZDptcq9NeQyR+xI8cM6iBg==
X-Google-Smtp-Source: AKy350YOH9Xkm6HFsv+85vd5Ux1zyi7OR0wtGuHK+/xyhgGqQV/OdUI/0OI6btg72NxnqMwwh9rYXA==
X-Received: by 2002:a2e:a3d0:0:b0:2a0:7a74:b0d3 with SMTP id
 w16-20020a2ea3d0000000b002a07a74b0d3mr837235lje.19.1680613732370; 
 Tue, 04 Apr 2023 06:08:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:08:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 15/42] drm/msm/dpu: split SM8250 catalog entry to the
 separate file
Date: Tue,  4 Apr 2023 16:05:55 +0300
Message-Id: <20230404130622.509628-16-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 130 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 131 +-----------------
 2 files changed, 131 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
new file mode 100644
index 000000000000..92a4b21c4493
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_0_SM8250_H
+#define _DPU_6_0_SM8250_H
+
+static const struct dpu_caps sm8250_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 4096,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
+};
+
+static const struct dpu_mdp_cfg sm8250_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+	},
+};
+
+static const struct dpu_sspp_cfg sm8250_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK_SDMA,
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK_SDMA,
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK_SDMA,
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
+static const struct dpu_wb_cfg sm8250_wb[] = {
+	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
+			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+};
+
+static const struct dpu_perf_cfg sm8250_perf_data = {
+	.max_bw_low = 13700000,
+	.max_bw_high = 16600000,
+	.min_core_ib = 4800000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
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
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
+	.caps = &sm8250_dpu_caps,
+	.ubwc = &sm8250_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sm8250_mdp),
+	.mdp = sm8250_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sm8250_sspp),
+	.sspp = sm8250_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
+	.dsc_count = ARRAY_SIZE(sm8150_dsc),
+	.dsc = sm8150_dsc,
+	.pingpong_count = ARRAY_SIZE(sm8150_pp),
+	.pingpong = sm8150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+	.merge_3d = sm8150_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8150_intf),
+	.intf = sm8150_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.wb_count = ARRAY_SIZE(sm8250_wb),
+	.wb = sm8250_wb,
+	.reg_dma_count = 1,
+	.dma_cfg = &sm8250_regdma,
+	.perf = &sm8250_perf_data,
+	.mdss_irqs = IRQ_SM8250_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c61986ce1cf9..08741f84151f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -375,18 +375,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps sm8250_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 4096,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.highest_bank_bit = 0x2,
@@ -407,12 +395,6 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
 	.highest_bank_bit = 0x3,
 };
 
-static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -489,34 +471,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sm8250_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-			.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-			.reg_off = 0x2B4, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
-			.reg_off = 0x2BC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
-			.reg_off = 0x2C4, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-			.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
-			.reg_off = 0x2C4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
-			.reg_off = 0x2BC, .bit_off = 20},
-	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
-			.reg_off = 0x3B8, .bit_off = 24},
-	},
-};
-
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -780,25 +734,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
-static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
-		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK_SDMA,
-		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK_SDMA,
-		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK_SDMA,
-		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-};
-
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
@@ -1186,11 +1121,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
 	}
 
-static const struct dpu_wb_cfg sm8250_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
-};
-
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
@@ -1523,35 +1453,6 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sm8250_perf_data = {
-	.max_bw_low = 13700000,
-	.max_bw_high = 16600000,
-	.min_core_ib = 4800000,
-	.min_llcc_ib = 0,
-	.min_dram_ib = 800000,
-	.min_prefill_lines = 35,
-	.danger_lut_tbl = {0xf, 0xffff, 0x0},
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
-		/* TODO: macrotile-qseed is different from macrotile */
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
-
 /*************************************************************
  * Hardware catalog
  *************************************************************/
@@ -1659,37 +1560,7 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.mdss_irqs = IRQ_SC8180X_MASK,
 };
 
-static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
-	.caps = &sm8250_dpu_caps,
-	.ubwc = &sm8250_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8250_mdp),
-	.mdp = sm8250_mdp,
-	.ctl_count = ARRAY_SIZE(sm8150_ctl),
-	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sm8250_sspp),
-	.sspp = sm8250_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
-	.dsc_count = ARRAY_SIZE(sm8150_dsc),
-	.dsc = sm8150_dsc,
-	.pingpong_count = ARRAY_SIZE(sm8150_pp),
-	.pingpong = sm8150_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-	.merge_3d = sm8150_merge_3d,
-	.intf_count = ARRAY_SIZE(sm8150_intf),
-	.intf = sm8150_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.wb_count = ARRAY_SIZE(sm8250_wb),
-	.wb = sm8250_wb,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
-	.perf = &sm8250_perf_data,
-	.mdss_irqs = IRQ_SM8250_MASK,
-};
-
+#include "catalog/dpu_6_0_sm8250.h"
 #include "catalog/dpu_6_2_sc7180.h"
 #include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
-- 
2.39.2

