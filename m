Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C917F7219E1
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0DD10E176;
	Sun,  4 Jun 2023 20:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B1610E10F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f62722d661so555314e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910940; x=1688502940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oi0A3YInqP/Udr0vAqHt7GIoXRmwye26YtDI4/EcniM=;
 b=P8/I4vXwc4EppHVMSOgEYmdmQ4JK6E2QJJ6ydt2WOzA8OTi0Lzi7ySxZnGC6De9ayT
 ASvFy3uigi6YlHF7uo+jR7HgnSRiuJIednvNGb0OU2K0hm8aLKwM/Mh3/Nz+OnK2S7gU
 JnBTEMyZfoWh4DVl+nhgDHrt6SHS5fc9dqCFhZCp4AQPR6zH1HB1TcTUGaeTDX2yEHw+
 ATYpDA1Tw3kvHHJgzNv4J9UX+DMRWtACnKpG3q0WpgisvpZTPIYxgCWi/plLuB+Ym3+s
 J1SqBme1B8b7QdfXowuXq/E2n3tVqiS2sZaUxNxik3P1qrSS3FT7fjRVZqnh+jenA4mk
 /7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910940; x=1688502940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oi0A3YInqP/Udr0vAqHt7GIoXRmwye26YtDI4/EcniM=;
 b=a7tM0MxYsme7cYrO92lGGmz6HwQ1W4DtdPrjUrzNMKGJynSgUVahxhgzFSNGfECx8T
 smG5aU/XfYFQGMwheFRS2MK8e9vGtOLwi9yPP7B7yY1gT6zonTxkG8kKp4DJDhuJv3WJ
 4lGI2y72BNN/P7329u99vb0EmS4ekc6WFwAjGiHW55CfZeamqZuKuikQ1i5w+eWfunIP
 3VdWahBVTtmjkj4Xmee2SkUOqkxGeMA8Chs+/s3wv15vcxuu42TXvuW8PLEkmtR5Am1O
 sIEQL7nvsx0H8XmP5V5Lo8I69GZwKKmzQeg8nTujQabqHgO77fVtVFAQ4Q1nOaziuzaO
 N56w==
X-Gm-Message-State: AC+VfDyeeODdjlMaLRPn8DQnsJcP95oJYh69rAnM7yD4W/1OCcLfcFkL
 A/4mu6GsK7MFwevuumB0DtjyKA==
X-Google-Smtp-Source: ACHHUZ4ht//P1/7fe7CJwiFyRS5cCx6oACvI7DLYfu6Iz3oby60h3uJbNSzgjUDaTQbeL01HjIK73w==
X-Received: by 2002:a19:f00b:0:b0:4f6:21e3:c83f with SMTP id
 p11-20020a19f00b000000b004f621e3c83fmr841401lfc.4.1685910940595; 
 Sun, 04 Jun 2023 13:35:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 06/22] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Date: Sun,  4 Jun 2023 23:35:16 +0300
Message-Id: <20230604203532.1094249-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

There is always a single MDP TOP block. Drop the mdp_count field and
stop declaring dpu_mdp_cfg instances as arrays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 ++---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 ++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 28 ++-----------------
 15 files changed, 28 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 70a795f56fc9..8632e06ebdc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -26,8 +26,7 @@ static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg msm8998_mdp[] = {
-	{
+static const struct dpu_mdp_cfg msm8998_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x458,
 	.features = BIT(DPU_MDP_VSYNC_SEL),
@@ -41,7 +40,6 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 12 },
 	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
 	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 16 },
-	},
 };
 
 static const struct dpu_ctl_cfg msm8998_ctl[] = {
@@ -187,8 +185,7 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
 const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.caps = &msm8998_dpu_caps,
 	.ubwc = &msm8998_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(msm8998_mdp),
-	.mdp = msm8998_mdp,
+	.mdp = &msm8998_mdp,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
 	.ctl = msm8998_ctl,
 	.sspp_count = ARRAY_SIZE(msm8998_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 1d377f717a08..3c2ef8b10439 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -26,8 +26,7 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg sdm845_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
@@ -39,7 +38,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	},
 };
 
 static const struct dpu_ctl_cfg sdm845_ctl[] = {
@@ -185,8 +183,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.caps = &sdm845_dpu_caps,
 	.ubwc = &sdm845_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sdm845_mdp),
-	.mdp = sdm845_mdp,
+	.mdp = &sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm845_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index db9fc5fadca8..8cfc3cc2b86e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -26,8 +26,7 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg sm8150_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
@@ -39,7 +38,6 @@ static const struct dpu_mdp_cfg sm8150_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	},
 };
 
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
@@ -204,8 +202,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8150_mdp),
-	.mdp = sm8150_mdp,
+	.mdp = &sm8150_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
 	.sspp_count = ARRAY_SIZE(sm8150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 85d42b7d21ed..03b75e4d9247 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -26,8 +26,7 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
 	.highest_bank_bit = 0x3,
 };
 
-static const struct dpu_mdp_cfg sc8180x_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
@@ -39,7 +38,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	},
 };
 
 static const struct dpu_ctl_cfg sc8180x_ctl[] = {
@@ -210,8 +208,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.caps = &sc8180x_dpu_caps,
 	.ubwc = &sc8180x_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
-	.mdp = sc8180x_mdp,
+	.mdp = &sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sc8180x_ctl),
 	.ctl = sc8180x_ctl,
 	.sspp_count = ARRAY_SIZE(sc8180x_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 8bdbd24fe0ba..11c150fc1e90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -25,8 +25,7 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
 	.ubwc_swizzle = 0x6,
 };
 
-static const struct dpu_mdp_cfg sm8250_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm8250_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
@@ -40,7 +39,6 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
-	},
 };
 
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
@@ -210,8 +208,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.caps = &sm8250_dpu_caps,
 	.ubwc = &sm8250_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8250_mdp),
-	.mdp = sm8250_mdp,
+	.mdp = &sm8250_mdp,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
 	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 4ec6929aeca5..9a6d333e498e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -22,8 +22,7 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
 	.highest_bank_bit = 0x3,
 };
 
-static const struct dpu_mdp_cfg sc7180_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sc7180_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
@@ -32,7 +31,6 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
-	},
 };
 
 static const struct dpu_ctl_cfg sc7180_ctl[] = {
@@ -132,8 +130,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.caps = &sc7180_dpu_caps,
 	.ubwc = &sc7180_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc7180_mdp),
-	.mdp = sc7180_mdp,
+	.mdp = &sc7180_mdp,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
 	.ctl = sc7180_ctl,
 	.sspp_count = ARRAY_SIZE(sc7180_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 102b6fa9dbed..b54d0634b231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -23,14 +23,12 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 	.ubwc_swizzle = 0x7,
 };
 
-static const struct dpu_mdp_cfg sm6115_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm6115_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
 };
 
 static const struct dpu_ctl_cfg sm6115_ctl[] = {
@@ -103,8 +101,7 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.caps = &sm6115_dpu_caps,
 	.ubwc = &sm6115_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6115_mdp),
-	.mdp = sm6115_mdp,
+	.mdp = &sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(sm6115_ctl),
 	.ctl = sm6115_ctl,
 	.sspp_count = ARRAY_SIZE(sm6115_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index e476b8d51018..5ce6aa95f39b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -20,14 +20,12 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg qcm2290_mdp[] = {
-	{
+static const struct dpu_mdp_cfg qcm2290_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
 };
 
 static const struct dpu_ctl_cfg qcm2290_ctl[] = {
@@ -93,8 +91,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-	.mdp = qcm2290_mdp,
+	.mdp = &qcm2290_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
 	.ctl = qcm2290_ctl,
 	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 01baa927a6cd..6ae9d4c19a21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -24,8 +24,7 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 };
 
-static const struct dpu_mdp_cfg sm8350_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm8350_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
@@ -38,7 +37,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
 };
 
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
@@ -197,8 +195,7 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
 const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.caps = &sm8350_dpu_caps,
 	.ubwc = &sm8350_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8350_mdp),
-	.mdp = sm8350_mdp,
+	.mdp = &sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
 	.sspp_count = ARRAY_SIZE(sm8350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 6be5cce5ac7c..2d54604a7927 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -23,8 +23,7 @@ static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
 	.ubwc_swizzle = 0x6,
 };
 
-static const struct dpu_mdp_cfg sc7280_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sc7280_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
@@ -32,7 +31,6 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
-	},
 };
 
 static const struct dpu_ctl_cfg sc7280_ctl[] = {
@@ -147,8 +145,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.caps = &sc7280_dpu_caps,
 	.ubwc = &sc7280_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc7280_mdp),
-	.mdp = sc7280_mdp,
+	.mdp = &sc7280_mdp,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9dc7d7a221f5..0c58073cf6c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -25,8 +25,7 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 	.ubwc_swizzle = 6,
 };
 
-static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
@@ -39,7 +38,6 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
 };
 
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
@@ -205,8 +203,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.caps = &sc8280xp_dpu_caps,
 	.ubwc = &sc8280xp_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
-	.mdp = sc8280xp_mdp,
+	.mdp = &sc8280xp_mdp,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
 	.ctl = sc8280xp_ctl,
 	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 6735deddbbf5..efbfeb0a22d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -25,8 +25,7 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 	.ubwc_swizzle = 0x6,
 };
 
-static const struct dpu_mdp_cfg sm8450_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
@@ -39,7 +38,6 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
 };
 
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
@@ -203,8 +201,7 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
 const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.caps = &sm8450_dpu_caps,
 	.ubwc = &sm8450_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8450_mdp),
-	.mdp = sm8450_mdp,
+	.mdp = &sm8450_mdp,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
 	.ctl = sm8450_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 46cd8bb6d17e..1b4bf5a81dd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -24,8 +24,7 @@ static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 };
 
-static const struct dpu_mdp_cfg sm8550_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
@@ -40,7 +39,6 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA4] = { .reg_off = 0x2c330, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA5] = { .reg_off = 0x2e330, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
 };
 
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
@@ -207,8 +205,7 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
 const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.caps = &sm8550_dpu_caps,
 	.ubwc = &sm8550_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8550_mdp),
-	.mdp = sm8550_mdp,
+	.mdp = &sm8550_mdp,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
 	.ctl = sm8550_ctl,
 	.sspp_count = ARRAY_SIZE(sm8550_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3cb554ca00ed..09a6ac1f0833 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -780,7 +780,6 @@ struct dpu_mdss_cfg {
 
 	const struct dpu_ubwc_cfg *ubwc;
 
-	u32 mdp_count;
 	const struct dpu_mdp_cfg *mdp;
 
 	u32 ctl_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 963bdb5e0252..8e2f02731143 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -268,27 +268,6 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
-static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	if (!m || !addr || !b)
-		return ERR_PTR(-EINVAL);
-
-	for (i = 0; i < m->mdp_count; i++) {
-		if (mdp == m->mdp[i].id) {
-			b->blk_addr = addr + m->mdp[i].base;
-			b->log_mask = DPU_DBG_MASK_TOP;
-			return &m->mdp[i];
-		}
-	}
-
-	return ERR_PTR(-EINVAL);
-}
-
 struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -303,11 +282,8 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 	if (!mdp)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _top_offset(idx, m, addr, &mdp->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(mdp);
-		return ERR_PTR(-EINVAL);
-	}
+	mdp->hw.blk_addr = addr + m->mdp->base;
+	mdp->hw.log_mask = DPU_DBG_MASK_TOP;
 
 	/*
 	 * Assign ops
-- 
2.39.2

