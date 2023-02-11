Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339756934F6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9178B10E3E8;
	Sat, 11 Feb 2023 23:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740EA10E3CD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id rp23so23927938ejb.7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YA6a7IDkD7LVi+CtFfF8B4tU+80ifEwERM5LUrAlgjQ=;
 b=iV7aKlIvKAFFyukA5kV0Q/C8N5Zc/AqAW9Nhvzs8mPlI5KxMaY504pnvD1VTMDuxFB
 18GJwCfSJtP5PxvD3saV34tcvQYITeu/+nWINqXe0L1SQ9lvQN7k7FYZg1LPwEHS03hL
 1G06T59dGXMCLD9Bub0JkX4ms674ocJ+5LCPrMhVmSv183J0+2z2K/h9HCQer9jWPSuS
 QV0xrAQfUztm7VuIIPJrWxa09ieTpi4G/4s6PB9CyeC1GBL2kRqPEq8EoX4izVVLlaKD
 Us+IeTI9yYdlwwyz1uhowiD6Wr0vb9hHoc9yXWCDcAwS/BHaAY3lJ7qhz4Tsa56MD+S5
 YW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YA6a7IDkD7LVi+CtFfF8B4tU+80ifEwERM5LUrAlgjQ=;
 b=ONceUJ/CFm6WHsgMaTdqdFkso1kvSZIEks4r7le1xdckO6WL/Yb7tuEdWDPGrK1gXQ
 vDlBk1diagttMnkHEY+/+RBnoZ0GnTzk8JTSMiAsyDOiATETz+AlBkKTyZrxlr8Cg7lW
 zSq4w0t/0WvE4NNjbq9/nG4jmuuFj9K4OiQa1eASWUQo78+2Vnn9LRsmNikMmddmKB+7
 vFbynOEcXIkGtiTeqXwzjE08o7sWq4ZPLE3AYQpwcQZoQZKdKXXkVJwgxLpje4qNHGem
 ed7KbHxOgdSq1Yrj7XBtrgByQnGVuNhB9VBIqniezVq8kbS+r+09/eKW31xzrDbltL63
 PEFA==
X-Gm-Message-State: AO0yUKW4BKDHEMPDFOsWMYfK/W+FZI9uRoZt6i3OYedczehs+ddywDDJ
 BRF0OIwyFoS20yAbVeP8IVbsKfdGr9P3CJYI
X-Google-Smtp-Source: AK7set+kx2IUUPIgYmIu2g1GxyajIUsRjzbAUHeTSEEsymur2GLDOJSHo442Vcr4AIPRyI9s2qKlbw==
X-Received: by 2002:a17:906:81c2:b0:84d:4e9b:ace5 with SMTP id
 e2-20020a17090681c200b0084d4e9bace5mr19607262ejx.67.1676157202021; 
 Sat, 11 Feb 2023 15:13:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 17/50] drm/msm/dpu: move UBWC/memory configuration to
 separate struct
Date: Sun, 12 Feb 2023 01:12:26 +0200
Message-Id: <20230211231259.1308718-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

UBWC and highest bank settings differ slightly between different DPU
units of the same generation, while the dpu_caps and dpu_mdp_cfg are
much more stable. To ease configuration reuse move ubwc_swizzle and
highest_bank_bit data to separate structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 112 +++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  19 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  18 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 4 files changed, 107 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c983413cc3c2..bd213b2913f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -303,7 +303,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
-	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -329,7 +328,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -345,7 +343,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
@@ -357,7 +354,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -369,7 +365,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -385,7 +380,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -401,7 +395,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -415,7 +408,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -429,7 +421,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -443,7 +434,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -457,7 +447,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -471,19 +460,86 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_10,
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.highest_bank_bit = 0x3,
+};
+
+static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_10,
+	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
+};
+
+static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.highest_bank_bit = 0x3,
+};
+
+static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 2,
+	.ubwc_swizzle = 6,
+};
+
+static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
+};
+
+static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+};
+
+static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
+};
+
+static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+};
+
+static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x6,
+};
+
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x458,
 	.features = 0,
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -512,7 +568,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -537,7 +592,6 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -556,7 +610,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -581,8 +634,6 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -595,8 +646,6 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -625,7 +674,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -652,8 +700,6 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -679,8 +725,6 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -697,8 +741,6 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 2,
-	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
@@ -716,8 +758,6 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x4330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -748,7 +788,6 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -2523,6 +2562,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 
 static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.caps = &msm8998_dpu_caps,
+	.ubwc = &msm8998_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(msm8998_mdp),
 	.mdp = msm8998_mdp,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
@@ -2546,6 +2586,7 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.caps = &sdm845_dpu_caps,
+	.ubwc = &sdm845_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
@@ -2570,6 +2611,7 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.caps = &sc7180_dpu_caps,
+	.ubwc = &sc7180_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7180_mdp),
 	.mdp = sc7180_mdp,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
@@ -2596,6 +2638,7 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.caps = &sm6115_dpu_caps,
+	.ubwc = &sm6115_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
 	.mdp = sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
@@ -2618,6 +2661,7 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
+	.ubwc = &sm8150_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2646,6 +2690,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.caps = &sc8180x_dpu_caps,
+	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
 	.mdp = sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2670,6 +2715,7 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.caps = &sc8280xp_dpu_caps,
+	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
 	.mdp = sc8280xp_mdp,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
@@ -2696,6 +2742,7 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.caps = &sm8250_dpu_caps,
+	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
 	.mdp = sm8250_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2726,6 +2773,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.caps = &sm8350_dpu_caps,
+	.ubwc = &sm8350_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8350_mdp),
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
@@ -2752,6 +2800,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.caps = &sm8450_dpu_caps,
+	.ubwc = &sm8450_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8450_mdp),
 	.mdp = sm8450_mdp,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
@@ -2778,6 +2827,7 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.caps = &sm8550_dpu_caps,
+	.ubwc = &sm8550_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8550_mdp),
 	.mdp = sm8550_mdp,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
@@ -2804,6 +2854,7 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.caps = &sc7280_dpu_caps,
+	.ubwc = &sc7280_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7280_mdp),
 	.mdp = sc7280_mdp,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
@@ -2826,6 +2877,7 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
+	.ubwc = &qcm2290_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
 	.mdp = qcm2290_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a56581b34ddf..5355a6c5aaac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -394,7 +394,6 @@ struct dpu_rotation_cfg {
  *                       supported z order
  * @qseed_type         qseed2 or qseed3 support.
  * @smart_dma_rev      Supported version of SmartDMA feature.
- * @ubwc_version       UBWC feature version (0x0 for not supported)
  * @has_src_split      source split feature status
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
@@ -409,7 +408,6 @@ struct dpu_caps {
 	u32 max_mixer_blendstages;
 	u32 qseed_type;
 	u32 smart_dma_rev;
-	u32 ubwc_version;
 	bool has_src_split;
 	bool has_dim_layer;
 	bool has_idle_pc;
@@ -538,15 +536,24 @@ struct dpu_clk_ctrl_reg {
  * @id:                index identifying this block
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
- * @highest_bank_bit:  UBWC parameter
- * @ubwc_swizzle:      ubwc default swizzle setting
  * @clk_ctrls          clock control register definition
  */
 struct dpu_mdp_cfg {
 	DPU_HW_BLK_INFO;
+	struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
+};
+
+/**
+ * struct dpu_ubwc_cfg - UBWC and memory configuration
+ *
+ * @ubwc_version       UBWC feature version (0x0 for not supported)
+ * @highest_bank_bit:  UBWC parameter
+ * @ubwc_swizzle:      ubwc default swizzle setting
+ */
+struct dpu_ubwc_cfg {
+	u32 ubwc_version;
 	u32 highest_bank_bit;
 	u32 ubwc_swizzle;
-	struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
 };
 
 /* struct dpu_ctl_cfg : MDP CTL instance info
@@ -848,6 +855,8 @@ struct dpu_perf_cfg {
 struct dpu_mdss_cfg {
 	const struct dpu_caps *caps;
 
+	const struct dpu_ubwc_cfg *ubwc;
+
 	u32 mdp_count;
 	const struct dpu_mdp_cfg *mdp;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 4246ab0b3bee..a82113b7d632 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -307,25 +307,25 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->mdp->highest_bank_bit << 18);
-		switch (ctx->catalog->caps->ubwc_version) {
+			ctx->ubwc->highest_bank_bit << 18);
+		switch (ctx->ubwc->ubwc_version) {
 		case DPU_HW_UBWC_VER_10:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					fast_clear | (ctx->mdp->ubwc_swizzle & 0x1) |
+					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->mdp->highest_bank_bit << 4));
+					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case DPU_HW_UBWC_VER_20:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					fast_clear | (ctx->mdp->ubwc_swizzle) |
-					(ctx->mdp->highest_bank_bit << 4));
+					fast_clear | (ctx->ubwc->ubwc_swizzle) |
+					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case DPU_HW_UBWC_VER_30:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
-					BIT(30) | (ctx->mdp->ubwc_swizzle) |
-					(ctx->mdp->highest_bank_bit << 4));
+					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
+					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case DPU_HW_UBWC_VER_40:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
@@ -804,7 +804,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 
 	/* Assign ops */
 	hw_pipe->catalog = catalog;
-	hw_pipe->mdp = &catalog->mdp[0];
+	hw_pipe->ubwc = catalog->ubwc;
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 0c95b7e64f6c..cc435fa58f38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -351,7 +351,7 @@ struct dpu_hw_sspp_ops {
  * @base: hardware block base structure
  * @hw: block hardware details
  * @catalog: back pointer to catalog
- * @mdp: pointer to associated mdp portion of the catalog
+ * @ubwc: ubwc configuration data
  * @idx: pipe index
  * @cap: pointer to layer_cfg
  * @ops: pointer to operations possible for this pipe
@@ -360,7 +360,7 @@ struct dpu_hw_pipe {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 	const struct dpu_mdss_cfg *catalog;
-	const struct dpu_mdp_cfg *mdp;
+	const struct dpu_ubwc_cfg *ubwc;
 
 	/* Pipe */
 	enum dpu_sspp idx;
-- 
2.39.1

