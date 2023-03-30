Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1166D1129
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFB710F061;
	Thu, 30 Mar 2023 21:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB41D10F050
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:53:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g19so13267068lfr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=it7hDJrwSlt7FPmuVtoUvUe2n4zhxOL1bN+E/kUC/Ak=;
 b=gS846V83uIfYApd+lvxrgDp81Qa4EExMc09iP6MP/6SoBrZ3bvs2ZZUpnIk7lLl9ak
 gCR4TMOWAll97eBPbWLR1L9rStbcdi4Fk/DWcKXt31oWmQ2To5tT4OqBi5UlKvbg5iOG
 SGKcuaUnj9bnk1GWv8oAjojCtCfrg+RoUsVdeI/IgRnqH/UJDaIhykBq8R+pcE0nOV+0
 WktVm3yrlxEr4oQKB9DUczF7lL1e4n+r5oKCkOoVugxOtsEadTpi7SSz/w5KNKFuu4Nr
 WCFAy8IKU6ssnBjUpGcUDzK0FfpzlXnz5ok4JmQkP5p5fZfUvo6mLDRNB2kWAcD8XqUl
 WoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=it7hDJrwSlt7FPmuVtoUvUe2n4zhxOL1bN+E/kUC/Ak=;
 b=jr/5m9gH2X4luv940dv62yi0MU9Ynsly5T4w75RkjkSO8fByX6ZvtxoLT/ayZ5oAM/
 TaKrN7ymVCDx9PHGbC7nJj2ptLUfH9ZNNmo5AhMF8/fGJJ50zEBNv+Cf5v3eB8JzNuZL
 gM6NuGuD7UvNdGuMGlI7L5xTZYeJ8ZigFD7vLgpRVbgtWAUM1WSPhw24ExMz6AnGgxtS
 DJbrZRuu2hrk7EzDZXMrUPhAnPkWblTHj+NjZ9JAFq7wdKIlA1JIm7e6q7PouRlHgPAJ
 DTIWbMIsn4ufdzM6aYrIJMiHYPFNJPiA4S/wRWn4CokX7JuPQqUoDm85rAXyAtdhQel7
 QIyA==
X-Gm-Message-State: AAQBX9eCV9vl84L2kSt0bvagS0qYZiVpJxETtmdWhSsU5Hk4crhTRAFR
 hgyBOTWQkJ5TrvQXEmg62j06Xw==
X-Google-Smtp-Source: AKy350Z1VOIRVLINzePUizifPLof+sjGMAEgwvJbi9KnPrXlzEgxV6cQqELdf1UXsEoaKiqWCxVEkQ==
X-Received: by 2002:ac2:490f:0:b0:4e8:4a9d:2ae1 with SMTP id
 n15-20020ac2490f000000b004e84a9d2ae1mr5978435lfi.32.1680213208199; 
 Thu, 30 Mar 2023 14:53:28 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:53:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 04/38] drm/msm/dpu: move UBWC/memory configuration to
 separate struct
Date: Fri, 31 Mar 2023 00:52:50 +0300
Message-Id: <20230330215324.1853304-5-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UBWC and highest bank settings differ slightly between different DPU
units of the same generation, while the dpu_caps and dpu_mdp_cfg are
much more stable. To ease configuration reuse move ubwc_swizzle and
highest_bank_bit data to separate structure.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 112 +++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  19 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  18 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 4 files changed, 107 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a3fd5dc5f368..b8f41dc1be5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -323,7 +323,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -347,7 +346,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -362,7 +360,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
@@ -373,7 +370,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -384,7 +380,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -399,7 +394,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -414,7 +408,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = 2560,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -427,7 +420,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -440,7 +432,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -453,7 +444,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -466,7 +456,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -479,19 +468,86 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
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
@@ -520,7 +576,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -545,7 +600,6 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -564,7 +618,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -589,8 +642,6 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -603,8 +654,6 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -633,7 +682,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -660,8 +708,6 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -687,8 +733,6 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -705,8 +749,6 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 2,
-	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
@@ -724,8 +766,6 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x4330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -756,7 +796,6 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
-	.highest_bank_bit = 0x2,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -2531,6 +2570,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 
 static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.caps = &msm8998_dpu_caps,
+	.ubwc = &msm8998_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(msm8998_mdp),
 	.mdp = msm8998_mdp,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
@@ -2554,6 +2594,7 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.caps = &sdm845_dpu_caps,
+	.ubwc = &sdm845_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
@@ -2578,6 +2619,7 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.caps = &sc7180_dpu_caps,
+	.ubwc = &sc7180_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7180_mdp),
 	.mdp = sc7180_mdp,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
@@ -2604,6 +2646,7 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.caps = &sm6115_dpu_caps,
+	.ubwc = &sm6115_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
 	.mdp = sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
@@ -2626,6 +2669,7 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
+	.ubwc = &sm8150_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2654,6 +2698,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.caps = &sc8180x_dpu_caps,
+	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
 	.mdp = sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2678,6 +2723,7 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.caps = &sc8280xp_dpu_caps,
+	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
 	.mdp = sc8280xp_mdp,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
@@ -2704,6 +2750,7 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.caps = &sm8250_dpu_caps,
+	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
 	.mdp = sm8250_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
@@ -2734,6 +2781,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.caps = &sm8350_dpu_caps,
+	.ubwc = &sm8350_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8350_mdp),
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
@@ -2760,6 +2808,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.caps = &sm8450_dpu_caps,
+	.ubwc = &sm8450_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8450_mdp),
 	.mdp = sm8450_mdp,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
@@ -2786,6 +2835,7 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.caps = &sm8550_dpu_caps,
+	.ubwc = &sm8550_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8550_mdp),
 	.mdp = sm8550_mdp,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
@@ -2812,6 +2862,7 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 
 static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.caps = &sc7280_dpu_caps,
+	.ubwc = &sc7280_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7280_mdp),
 	.mdp = sc7280_mdp,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
@@ -2834,6 +2885,7 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
+	.ubwc = &qcm2290_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
 	.mdp = qcm2290_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index fe360fb7c77b..00c3c67dd267 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -400,7 +400,6 @@ struct dpu_rotation_cfg {
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @qseed_type         qseed2 or qseed3 support.
- * @ubwc_version       UBWC feature version (0x0 for not supported)
  * @has_src_split      source split feature status
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
@@ -414,7 +413,6 @@ struct dpu_caps {
 	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	u32 qseed_type;
-	u32 ubwc_version;
 	bool has_src_split;
 	bool has_dim_layer;
 	bool has_idle_pc;
@@ -543,15 +541,24 @@ struct dpu_clk_ctrl_reg {
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
@@ -853,6 +860,8 @@ struct dpu_perf_cfg {
 struct dpu_mdss_cfg {
 	const struct dpu_caps *caps;
 
+	const struct dpu_ubwc_cfg *ubwc;
+
 	u32 mdp_count;
 	const struct dpu_mdp_cfg *mdp;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6e5b62f3276f..cf70a9bd1034 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -307,25 +307,25 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
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
@@ -813,7 +813,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 
 	/* Assign ops */
 	hw_pipe->catalog = catalog;
-	hw_pipe->mdp = &catalog->mdp[0];
+	hw_pipe->ubwc = catalog->ubwc;
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index e73d6ac863ad..74b98b6b3bc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -342,7 +342,7 @@ struct dpu_hw_sspp_ops {
  * @base: hardware block base structure
  * @hw: block hardware details
  * @catalog: back pointer to catalog
- * @mdp: pointer to associated mdp portion of the catalog
+ * @ubwc: ubwc configuration data
  * @idx: pipe index
  * @cap: pointer to layer_cfg
  * @ops: pointer to operations possible for this pipe
@@ -351,7 +351,7 @@ struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 	const struct dpu_mdss_cfg *catalog;
-	const struct dpu_mdp_cfg *mdp;
+	const struct dpu_ubwc_cfg *ubwc;
 
 	/* Pipe */
 	enum dpu_sspp idx;
-- 
2.39.2

