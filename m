Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5D37677B5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5936A10E05D;
	Fri, 28 Jul 2023 21:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AC410E78D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe1344b707so4457968e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580011; x=1691184811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCwNTtsU2HhXal0QoS0aPympsDXkORz1Veugb6v1YRo=;
 b=Pyo5P1NG7+mM9PMdm9ze/UIUv5enO0uwEdYmDB3eHPgW31RwPRLhsIRZo/9Vw7ocLa
 qLjwKT4MC/RO0R/RKsYJgtUGrEUGxA6EwS32HLcdscRDdIH8zb8Dza/UOkYhwLo3UwTw
 NuHALC0WkZNsxvH309mzp4j55gH3EaFIoGjpht9BR1aZKWWS0I5Wg26FmqUAr9SABR5h
 7VXNAdO/nzWFYFMHIv0lT4dVtRfudW4RR21vLlVqy0RHtPAqlX1iKzBnKTkGPqGNhd7k
 gbsnf+X0s9MVx+wQBZInNKlGBYPhdrU5CajvaQlC1PU7dWgN9qC3LD1lOPaLvwr871xA
 E3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580011; x=1691184811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCwNTtsU2HhXal0QoS0aPympsDXkORz1Veugb6v1YRo=;
 b=Wi/LCU/aGYf4GRMB11dV0Y34hjd8m7E5HA9VO1Y0Zqgzu0JX2/c/gJWGRLhmpYbSBX
 Tf+UQStjiX5GeRxGwYKRM9CLGNBlm0nvNKrpQgrgwUAHATV7A5tsStZRcvRmCbXu+G/f
 gJUg1DJnftVzcAItpmfiWAGACep9axE13xn6JxxjdxcnBC6KAgaSeWFukS4PeFdAZUpn
 dJ8hlGYLi3OMFX+cHDvtKndSyG/HtlzVnfTXVk0Z5EIkcqN38mjp8zlpMAh4ujWZrxAA
 y4fGe29yCbUr5iOFvkFGNaYm+6ZeZyWrkd2v94XFZvInRBwMG+kVwr7yelCT0Qlziuwa
 4P8Q==
X-Gm-Message-State: ABy/qLagc+CUpePoWac0QLMK7/D5wcW9lSuFqsXg1PK3Eghxr/aAjDpN
 ZYK5d4Z4XrK2df0R6pR8vTQt3w==
X-Google-Smtp-Source: APBJJlGM4DSiForv29m7O6XNJeKDM7hlfLtfTj+xTj9WRtHWyzoauKt6HWdi0PVBDp4Kr3syyNKcNQ==
X-Received: by 2002:a05:6512:2812:b0:4fe:25bc:71f5 with SMTP id
 cf18-20020a056512281200b004fe25bc71f5mr1254834lfb.11.1690580011347; 
 Fri, 28 Jul 2023 14:33:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 6/7] drm/msm/dpu: drop UBWC configuration
Date: Sat, 29 Jul 2023 00:33:19 +0300
Message-Id: <20230728213320.97309-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
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

As the DPU driver has switched to fetching data from MDSS driver, we can
now drop the UBWC and highest_bank_bit parts of the DPU hw catalog.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 -----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 -----
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 -----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 -----
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 -----
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 ----
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 -----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 ------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 ------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 25 -------------------
 17 files changed, 128 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b5fbac55f127..7bc7fd6d4eb9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -21,11 +21,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
@@ -323,7 +318,6 @@ static const struct dpu_mdss_version msm8998_mdss_ver = {
 const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.mdss_ver = &msm8998_mdss_ver,
 	.caps = &msm8998_dpu_caps,
-	.ubwc = &msm8998_ubwc_cfg,
 	.mdp = &msm8998_mdp,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
 	.ctl = msm8998_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 8000b870d3a7..d679770c16f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -21,11 +21,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
@@ -340,7 +335,6 @@ static const struct dpu_mdss_version sdm845_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.mdss_ver = &sdm845_mdss_ver,
 	.caps = &sdm845_dpu_caps,
-	.ubwc = &sdm845_ubwc_cfg,
 	.mdp = &sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 7ce2d69d28f6..a2041ec843ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -21,11 +21,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
@@ -383,7 +378,6 @@ static const struct dpu_mdss_version sm8150_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.mdss_ver = &sm8150_mdss_ver,
 	.caps = &sm8150_dpu_caps,
-	.ubwc = &sm8150_ubwc_cfg,
 	.mdp = &sm8150_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index cea005382456..3e1b68ca83cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -21,11 +21,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
@@ -410,7 +405,6 @@ static const struct dpu_mdss_version sc8180x_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.mdss_ver = &sc8180x_mdss_ver,
 	.caps = &sc8180x_dpu_caps,
-	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp = &sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sc8180x_ctl),
 	.ctl = sc8180x_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 5fddfcce6288..a93a62843c25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sm6125_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sm6125_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x1,
-};
-
 static const struct dpu_mdp_cfg sm6125_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
@@ -208,7 +202,6 @@ static const struct dpu_mdss_version sm6125_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.mdss_ver = &sm6125_mdss_ver,
 	.caps = &sm6125_dpu_caps,
-	.ubwc = &sm6125_ubwc_cfg,
 	.mdp = &sm6125_mdp,
 	.ctl_count = ARRAY_SIZE(sm6125_ctl),
 	.ctl = sm6125_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 893d1271fb71..b180352a1221 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg sm8250_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -398,7 +392,6 @@ static const struct dpu_mdss_version sm8250_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.mdss_ver = &sm8250_mdss_ver,
 	.caps = &sm8250_dpu_caps,
-	.ubwc = &sm8250_ubwc_cfg,
 	.mdp = &sm8250_mdp,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
 	.ctl = sm8250_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 61118f648cbc..224d0e64e5f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -17,11 +17,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_mdp_cfg sc7180_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -212,7 +207,6 @@ static const struct dpu_mdss_version sc7180_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.mdss_ver = &sc7180_mdss_ver,
 	.caps = &sc7180_dpu_caps,
-	.ubwc = &sc7180_ubwc_cfg,
 	.mdp = &sc7180_mdp,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
 	.ctl = sc7180_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index c0d7bb930e8a..48eb9245f29d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -17,12 +17,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x7,
-};
-
 static const struct dpu_mdp_cfg sm6115_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -144,7 +138,6 @@ static const struct dpu_mdss_version sm6115_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.mdss_ver = &sm6115_mdss_ver,
 	.caps = &sm6115_dpu_caps,
-	.ubwc = &sm6115_ubwc_cfg,
 	.mdp = &sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(sm6115_ctl),
 	.ctl = sm6115_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 11c50aa5034b..9e888b305f8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sm6350_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.ubwc_swizzle = 6,
-	.highest_bank_bit = 1,
-};
-
 static const struct dpu_mdp_cfg sm6350_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -215,7 +209,6 @@ static const struct dpu_mdss_version sm6350_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.mdss_ver = &sm6350_mdss_ver,
 	.caps = &sm6350_dpu_caps,
-	.ubwc = &sm6350_ubwc_cfg,
 	.mdp = &sm6350_mdp,
 	.ctl_count = ARRAY_SIZE(sm6350_ctl),
 	.ctl = sm6350_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 2182939bc026..9933cd189a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -16,10 +16,6 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg qcm2290_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -134,7 +130,6 @@ static const struct dpu_mdss_version qcm2290_mdss_ver = {
 const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.mdss_ver = &qcm2290_mdss_ver,
 	.caps = &qcm2290_dpu_caps,
-	.ubwc = &qcm2290_ubwc_cfg,
 	.mdp = &qcm2290_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
 	.ctl = qcm2290_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index f0c0aa90f82e..de2eb899764f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -18,12 +18,6 @@ static const struct dpu_caps sm6375_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.ubwc_swizzle = 6,
-	.highest_bank_bit = 1,
-};
-
 static const struct dpu_mdp_cfg sm6375_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -154,7 +148,6 @@ static const struct dpu_mdss_version sm6375_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm6375_cfg = {
 	.mdss_ver = &sm6375_mdss_ver,
 	.caps = &sm6375_dpu_caps,
-	.ubwc = &sm6375_ubwc_cfg,
 	.mdp = &sm6375_mdp,
 	.ctl_count = ARRAY_SIZE(sm6375_ctl),
 	.ctl = sm6375_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 2460ced03610..584d432964c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -19,11 +19,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-};
-
 static const struct dpu_mdp_cfg sm8350_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -391,7 +386,6 @@ static const struct dpu_mdss_version sm8350_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.mdss_ver = &sm8350_mdss_ver,
 	.caps = &sm8350_dpu_caps,
-	.ubwc = &sm8350_ubwc_cfg,
 	.mdp = &sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index a8dea8f27c41..ef590514147b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -17,12 +17,6 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg sc7280_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x2014,
@@ -260,7 +254,6 @@ static const struct dpu_mdss_version sc7280_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mdss_ver = &sc7280_mdss_ver,
 	.caps = &sc7280_dpu_caps,
-	.ubwc = &sc7280_ubwc_cfg,
 	.mdp = &sc7280_mdp,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
 	.ctl = sc7280_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 397fe01125dd..938c7a92c095 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 2,
-	.ubwc_swizzle = 6,
-};
-
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -453,7 +447,6 @@ static const struct dpu_mdss_version sc8280xp_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.mdss_ver = &sc8280xp_mdss_ver,
 	.caps = &sc8280xp_dpu_caps,
-	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp = &sc8280xp_mdp,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
 	.ctl = sc8280xp_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 90a8461911c8..7efc60afd04c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
@@ -414,7 +408,6 @@ static const struct dpu_mdss_version sm8450_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.mdss_ver = &sm8450_mdss_ver,
 	.caps = &sm8450_dpu_caps,
-	.ubwc = &sm8450_ubwc_cfg,
 	.mdp = &sm8450_mdp,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
 	.ctl = sm8450_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index c9252528136d..293a971df959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -19,11 +19,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-};
-
 static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
@@ -428,7 +423,6 @@ static const struct dpu_mdss_version sm8550_mdss_ver = {
 const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.mdss_ver = &sm8550_mdss_ver,
 	.caps = &sm8550_dpu_caps,
-	.ubwc = &sm8550_ubwc_cfg,
 	.mdp = &sm8550_mdp,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
 	.ctl = sm8550_ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index acfe43f4918c..5c21782b2231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,16 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * Supported UBWC feature versions
- */
-enum {
-	DPU_HW_UBWC_VER_10 = 0x100,
-	DPU_HW_UBWC_VER_20 = 0x200,
-	DPU_HW_UBWC_VER_30 = 0x300,
-	DPU_HW_UBWC_VER_40 = 0x400,
-};
-
 /**
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
@@ -503,19 +493,6 @@ struct dpu_mdp_cfg {
 	struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
 };
 
-/**
- * struct dpu_ubwc_cfg - UBWC and memory configuration
- *
- * @ubwc_version       UBWC feature version (0x0 for not supported)
- * @highest_bank_bit:  UBWC parameter
- * @ubwc_swizzle:      ubwc default swizzle setting
- */
-struct dpu_ubwc_cfg {
-	u32 ubwc_version;
-	u32 highest_bank_bit;
-	u32 ubwc_swizzle;
-};
-
 /* struct dpu_ctl_cfg : MDP CTL instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
@@ -818,8 +795,6 @@ struct dpu_mdss_cfg {
 
 	const struct dpu_caps *caps;
 
-	const struct dpu_ubwc_cfg *ubwc;
-
 	const struct dpu_mdp_cfg *mdp;
 
 	u32 ctl_count;
-- 
2.39.2

