Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8967756D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D836910E1DD;
	Mon, 23 Jan 2023 07:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F5A10E306
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:13:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w11so13104712lfu.11
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 23:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPu3Eg4yZnc5t0QFtG+RskC/jNWvteARJ4kbN9bnBUs=;
 b=AC6/lzLVng0e1BGY8new889v6J/z71+GnxBCnnnbYuE4QoXnI5DBCCsQUmrDNy2eeH
 q7KXbz7+WO3GS1S4TMNpEofJ2kCWAJs8PiGtk1vVspdGHZthEYQRUTZXPE33x1mNAcMk
 8L+4LQYDaYguD0l7ew8uc450G/KB61SoNHW1ZJ99lcHkQqFruSUT/50PiyFFi2g/tS7B
 bX6cQeGftHaHTu74Fqaepnb+J0MWaJXQtGo6mgeIfcZuzkGQQjZ350eUyEW7edqxazmz
 SHnaUbV/Yx+YY7eLmH+CtvSUx0/0MUVJE7LiNdSBRZ/NJI4khxytBhl9yv15zpbpy/5p
 vBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPu3Eg4yZnc5t0QFtG+RskC/jNWvteARJ4kbN9bnBUs=;
 b=F8XHKiNnu66rb4EvP7+w7kFjzMYgrh/gR33K185HLkloNff3e2eMSvwtne6ZuUtKLc
 Wca+eMT19VhJySQTYN7axwgwEm70EDigRiF01ayioz66yaRN1FEV2+wo65pEJBMbVzkU
 X2iE0d3xS3apk1JXT13A7dJtPTQEEg/uXYvFV2MNSOgwBBBTQA9Tz5Is9qPBebDqyH68
 3xq6YjAyCL8uBFVIYh+OKleCPaexgDsv4cRE7gLhFFBwNzzr339gpypDBZ5PA7mDYUuE
 4W3sGKi6UoUM46h/dYZE3wnnDk2DJ/CZs0VkzUWQX6gU1s6llAWQ8RbKk1dppQ38ryCX
 HLTQ==
X-Gm-Message-State: AFqh2kr3O1+fZx3jSA+iyiR3fj84Gw0aEXUeFt69HJRNkEwYppUq1DZE
 bJzZCrGtAhfkZ/j5xdzn6s9A4A==
X-Google-Smtp-Source: AMrXdXs7FjUw+oE3UwUK/SAHxOrSdqX4fnQuiED/nGJT8/FsT8/eMLNBGE2u3iUk3/QjNoL8ukcVQQ==
X-Received: by 2002:a05:6512:e9c:b0:4d5:99e4:7fcc with SMTP id
 bi28-20020a0565120e9c00b004d599e47fccmr3999105lfb.13.1674457985618; 
 Sun, 22 Jan 2023 23:13:05 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056512358500b004cb35b31b96sm6448558lfr.257.2023.01.22.23.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 23:13:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH] drm/msm/dpu: move UBWC/memory configuration to separate
 struct
Date: Mon, 23 Jan 2023 09:13:04 +0200
Message-Id: <20230123071304.3056896-1-dmitry.baryshkov@linaro.org>
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
index 174272e3a148..63a0fa3b0a17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -310,7 +310,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
-	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -335,7 +334,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -351,7 +349,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
@@ -363,7 +360,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -375,7 +371,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -391,7 +386,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -407,7 +401,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -421,7 +414,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -435,7 +427,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -449,7 +440,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -463,7 +453,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -477,19 +466,86 @@ static const struct dpu_caps sc7280_dpu_caps = {
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
@@ -518,7 +574,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -543,7 +598,6 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -562,7 +616,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -587,8 +640,6 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -601,8 +652,6 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -631,7 +680,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -658,8 +706,6 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -685,8 +731,6 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -703,8 +747,6 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 2,
-	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
@@ -722,8 +764,6 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x4330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -754,7 +794,6 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -2528,6 +2567,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 
 static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.caps = &msm8998_dpu_caps,
+	.ubwc = &msm8998_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(msm8998_mdp),
 	.mdp = msm8998_mdp,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
@@ -2551,6 +2591,7 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.caps = &sdm845_dpu_caps,
+	.ubwc = &sdm845_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
@@ -2575,6 +2616,7 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.caps = &sc7180_dpu_caps,
+	.ubwc = &sc7180_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7180_mdp),
 	.mdp = sc7180_mdp,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
@@ -2601,6 +2643,7 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.caps = &sm6115_dpu_caps,
+	.ubwc = &sm6115_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
 	.mdp = sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
@@ -2623,6 +2666,7 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
+	.ubwc = &sm8150_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2651,6 +2695,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.caps = &sc8180x_dpu_caps,
+	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
 	.mdp = sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2675,6 +2720,7 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.caps = &sc8280xp_dpu_caps,
+	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
 	.mdp = sc8280xp_mdp,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
@@ -2701,6 +2747,7 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.caps = &sm8250_dpu_caps,
+	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
 	.mdp = sm8250_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2731,6 +2778,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.caps = &sm8350_dpu_caps,
+	.ubwc = &sm8350_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8350_mdp),
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
@@ -2757,6 +2805,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.caps = &sm8450_dpu_caps,
+	.ubwc = &sm8450_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8450_mdp),
 	.mdp = sm8450_mdp,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
@@ -2783,6 +2832,7 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.caps = &sm8550_dpu_caps,
+	.ubwc = &sm8550_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8550_mdp),
 	.mdp = sm8550_mdp,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
@@ -2809,6 +2859,7 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.caps = &sc7280_dpu_caps,
+	.ubwc = &sc7280_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7280_mdp),
 	.mdp = sc7280_mdp,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
@@ -2831,6 +2882,7 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 
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
2.39.0

