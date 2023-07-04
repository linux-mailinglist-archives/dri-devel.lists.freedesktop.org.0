Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00474676F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DEC10E272;
	Tue,  4 Jul 2023 02:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB5510E25F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 02:21:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b5c2433134so64004271fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688437300; x=1691029300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kHOnZk6vryl7/VLA8Jqguzj3CzxrQXKQpWBxiQUDKs=;
 b=pGqH2PuDzix2jdGK3J4YoaX4DK9/lKoQFw3Wyf22s1uPAsdjQ1yLX9NA20IDEnD5Jx
 FKH71EcKXWA6XPBnAEqa9peOSHH4sw9UblPnL9lZczBNYVDEX5MJkaytDV6B/uB6FGfB
 cFlZBzCrjsDqpLx8AlxYGVLzRURkw6Ix4bo2p95Mi2Zbr5CujKOIPgRCWALCu6JCmSp+
 aGmDaeh2F1pZmBn3Hyb4owZi5DyUPlUSbbrkSlZnW0say0VA0O6WKYic3jy4d0uzBvxc
 rYXRjbSPluh7FClmRf3+5xQTC790Yxo7XiFr0bv28XaXPgpqDSLxPtY4inzC5Bz3Ib9s
 y7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688437300; x=1691029300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kHOnZk6vryl7/VLA8Jqguzj3CzxrQXKQpWBxiQUDKs=;
 b=hIxy9XjK7hebLsy+0Tu1BrHHAzX6HaRbimGQpbypnhgAkWYBEmrqpZFK/TaJTDI1lX
 BNU+kYWQmYZl8+vXrTv5OCBZXzZhVhp+cmfjK5wLZ8NEFhbg2jJ+zPV47lBEatrLSiX3
 3Q1KS7TAN6vYmJyd/dwYrBa+KxhBzs58Pi5dPfXWBlmMjZ86mUS7v8dOj7hnfs18tohE
 ih7TdR/EDM3Eslddc6kJSb9qEUHHqxTCgCEZrgwiHltplB/kgssVhCXT11m6/fxWxthf
 8c1nlhYo2jMUl2C9kK6gLLOeA//I05hhqfIv7Z70El0aWpPTJJ+Ddv9UNUmYdUVuA2t8
 72Tw==
X-Gm-Message-State: ABy/qLYF8sfdqxqluA5aGyxaLGFDOOJcmugWMfYjJoXMcHQt03pwHHQp
 +2Rnrw679uylrylguonaVbY3jw==
X-Google-Smtp-Source: APBJJlE+iFGMbyfT4cQdUvq/0pUAR/zK8aIvWnI14KwPB7vGxqYWXVzQ7c9cEB9tBgQB5X6AJFb6ZA==
X-Received: by 2002:a2e:9181:0:b0:2b6:b849:c893 with SMTP id
 f1-20020a2e9181000000b002b6b849c893mr3982483ljg.26.1688437300443; 
 Mon, 03 Jul 2023 19:21:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 19:21:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Date: Tue,  4 Jul 2023 05:21:21 +0300
Message-Id: <20230704022136.130522-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 ++--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  7 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 35 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  3 +-
 19 files changed, 40 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index be0514bf27ec..e0d2ee48d733 100644
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
@@ -192,8 +190,7 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
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
index b33472625fcb..72295d5a10dc 100644
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
@@ -196,8 +194,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
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
index 64ed10da1b73..418312b164b8 100644
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
@@ -210,8 +208,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
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
index 6ae1f6f67ec8..ffacf29926b3 100644
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
@@ -216,8 +214,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
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
index 48c97e9f8a45..86dfc5745630 100644
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
@@ -216,8 +214,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
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
index 00366f7fe969..f42f27707453 100644
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
@@ -134,8 +132,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
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
index 8688f09dd560..1d21c33542a7 100644
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
@@ -104,8 +102,7 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.caps = &sm6115_dpu_caps,
 	.ubwc = &sm6115_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6115_mdp),
-	.mdp = sm6115_mdp,
+	.mdp = &sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(sm6115_ctl),
 	.ctl = sm6115_ctl,
 	.sspp_count = ARRAY_SIZE(sm6115_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 2bb2346d27a0..6ad68764e13f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -25,8 +25,7 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
 	.highest_bank_bit = 1,
 };
 
-static const struct dpu_mdp_cfg sm6350_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm6350_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
@@ -35,7 +34,6 @@ static const struct dpu_mdp_cfg sm6350_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
 };
 
 static const struct dpu_ctl_cfg sm6350_ctl[] = {
@@ -143,8 +141,7 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
 const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.caps = &sm6350_dpu_caps,
 	.ubwc = &sm6350_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6350_mdp),
-	.mdp = sm6350_mdp,
+	.mdp = &sm6350_mdp,
 	.ctl_count = ARRAY_SIZE(sm6350_ctl),
 	.ctl = sm6350_ctl,
 	.sspp_count = ARRAY_SIZE(sm6350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index d106ff28372d..80670e7cfc57 100644
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
@@ -94,8 +92,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-	.mdp = qcm2290_mdp,
+	.mdp = &qcm2290_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
 	.ctl = qcm2290_ctl,
 	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 842ea5bcbe16..8e7dcb2e8762 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -24,14 +24,12 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
 	.highest_bank_bit = 1,
 };
 
-static const struct dpu_mdp_cfg sm6375_mdp[] = {
-	{
+static const struct dpu_mdp_cfg sm6375_mdp = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
 };
 
 static const struct dpu_ctl_cfg sm6375_ctl[] = {
@@ -109,8 +107,7 @@ static const struct dpu_perf_cfg sm6375_perf_data = {
 const struct dpu_mdss_cfg dpu_sm6375_cfg = {
 	.caps = &sm6375_dpu_caps,
 	.ubwc = &sm6375_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6375_mdp),
-	.mdp = sm6375_mdp,
+	.mdp = &sm6375_mdp,
 	.ctl_count = ARRAY_SIZE(sm6375_ctl),
 	.ctl = sm6375_ctl,
 	.sspp_count = ARRAY_SIZE(sm6375_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8fa9d83a539d..83dafd3f2a41 100644
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
@@ -215,8 +213,7 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
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
index 2862c64bbc3e..a7695f05beab 100644
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
@@ -156,8 +154,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
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
index 520b210e8c0c..54543dc3985a 100644
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
@@ -219,8 +217,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
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
index b782603642f4..0f8bf4465372 100644
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
@@ -223,8 +221,7 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
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
index 025a149bab97..851aa078a4bd 100644
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
@@ -227,8 +225,7 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
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
index b07caa4b867e..3b816e36d12d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -809,7 +809,6 @@ struct dpu_mdss_cfg {
 
 	const struct dpu_ubwc_cfg *ubwc;
 
-	u32 mdp_count;
 	const struct dpu_mdp_cfg *mdp;
 
 	u32 ctl_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 963bdb5e0252..2bfc471805c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -268,51 +268,26 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
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
-struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
+struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_mdp *mdp;
-	const struct dpu_mdp_cfg *cfg;
 
-	if (!addr || !m)
+	if (!addr)
 		return ERR_PTR(-EINVAL);
 
 	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
 	if (!mdp)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _top_offset(idx, m, addr, &mdp->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(mdp);
-		return ERR_PTR(-EINVAL);
-	}
+	mdp->hw.blk_addr = addr + cfg->base;
+	mdp->hw.log_mask = DPU_DBG_MASK_TOP;
 
 	/*
 	 * Assign ops
 	 */
-	mdp->idx = idx;
+	mdp->idx = cfg->id;
 	mdp->caps = cfg;
 	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index a1a9e44bed36..bf4235d68924 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -145,12 +145,12 @@ struct dpu_hw_mdp {
 };
 
 /**
- * dpu_hw_mdptop_init - initializes the top driver for the passed idx
- * @idx:  Interface index for which driver object is required
+ * dpu_hw_mdptop_init - initializes the top driver for the passed config
+ * @cfg:  MDP TOP configuration from catalog
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
+struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..419fe9d6b636 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1092,7 +1092,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
-	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
+	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
+					     dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
-- 
2.39.2

