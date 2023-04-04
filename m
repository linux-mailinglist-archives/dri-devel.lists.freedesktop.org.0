Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616AE6D625A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BE710E683;
	Tue,  4 Apr 2023 13:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA010E6B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:40 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b6so13714549ljr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsUu4O4Fl4t9XxMRV5BfDRn2no5aRVeiHtxV9xfdwCw=;
 b=NjFz7Q0YZUfoiL3KPd4qEN5ms+fQ3n+bZy+alpy8blSjJHoySWirxTjoxOU6deLWp+
 WcsUKRfMo4WtDJ8vMmMSpPTwv09rwFvbM+wK10wWU8Ckzn8FxK6u3DEUl4Mqrth2iD/F
 /t+A+MCslUKs2VWYPoSOb1jPJF+Xvx2FA1B28kGOB51n3YO+GmqJh4Oe3ZD2yUWod64C
 0IGFwfJ5yJaKLU4weK+D1M2n0yvWyZW5H/aY2e6EGtzDR2jSKpMNS/UPEFvVI5L+HX6k
 4s0A+DqGEtedaRHqXZSIOupUK7r4zgQdKhMspbwZHXjGPL7Gh2ei6UVwQtcdEEupaVzW
 //7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsUu4O4Fl4t9XxMRV5BfDRn2no5aRVeiHtxV9xfdwCw=;
 b=IGHf43aZHKlPp7vCeF35uw5iIaec1mRIfHIFBMY5pwt9nfFGFRCBIUjehAvtvgYBN8
 fzQzBqYaSQAHsRKRRa1C/NNHU9LpgSQyVu7avbWqXNwmQXrLOdAVLgdovTkLSBOv1mbb
 yC9+jI0Gy3lj5exElIEBamIYHPf3LVt594zS+WOuvL+NMmD+wj8Yzv1I0llZY4TgcctG
 /K78E7wn/ZKHcNeUvlhoIDpdfAk5+B2/F+ge542D3OK1D6XdAmFFsZWqoBO7m4/hi5Rk
 mi69ULwiAX1PgM4+EZ3NjIjokVadiwccRPdofnjcMh2fjK407CWZexIXEYygr9HT1ULy
 AliA==
X-Gm-Message-State: AAQBX9fHGT/NL5TDvyEoU3qlUcf05avRNjlXbUSHhPP67pTfq2WBKtC4
 gTbnsGE/7Ny8mLEuo2DEvw6fyQ==
X-Google-Smtp-Source: AKy350YZya7+qMlirUF16mEaHCMu8pHl+RUPuKBsK5/yP+ZLUFc6EKQT2Tb58F6VZb7qNJ9VxiodPQ==
X-Received: by 2002:a2e:82ce:0:b0:29b:6fcf:d2e8 with SMTP id
 n14-20020a2e82ce000000b0029b6fcfd2e8mr1012020ljh.53.1680613778249; 
 Tue, 04 Apr 2023 06:09:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 41/42] drm/msm/dpu: fetch DPU configuration from match data
Date: Tue,  4 Apr 2023 16:06:21 +0300
Message-Id: <20230404130622.509628-42-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In email discussion it was noted that there can be different SoC device
having slightly different SoC features, but sharing the same DPU hw
revision. Stop fetching catalog data using core_rev and use platform's
match data instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  2 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  2 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 +-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 34 ---------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 26 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 42 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 17 files changed, 46 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a34e9506e6d4..dc04289c4622 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -176,7 +176,7 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.caps = &msm8998_dpu_caps,
 	.ubwc = &msm8998_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(msm8998_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index d247f8d0c0be..1ca7635755b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -174,7 +174,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.caps = &sdm845_dpu_caps,
 	.ubwc = &sdm845_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 15277f9627ae..c5cc7b54824d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -197,7 +197,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8150_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a1483d5f7448..2954b38fae59 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -197,7 +197,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.caps = &sc8180x_dpu_caps,
 	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index fc3f2b180821..37aaa5804ee7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -203,7 +203,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.caps = &sm8250_dpu_caps,
 	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 8383ba982cb0..06cf9104daa9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -122,7 +122,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.caps = &sc7180_dpu_caps,
 	.ubwc = &sc7180_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7180_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index db0eb5d074c7..aa26f72ce3d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -101,7 +101,7 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.caps = &sm6115_dpu_caps,
 	.ubwc = &sm6115_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index b88ba5a996bb..25bef98133fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -92,7 +92,7 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index be2baa7ddaf6..a8c1d555aadf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -190,7 +190,7 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.caps = &sm8350_dpu_caps,
 	.ubwc = &sm8350_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8350_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 67b1ce7d6e28..809f2c74619d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -127,7 +127,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.caps = &sc7280_dpu_caps,
 	.ubwc = &sc7280_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7280_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index b9ec7d636b16..3a7fc6aa66e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -182,7 +182,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.caps = &sc8280xp_dpu_caps,
 	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 671b4d5bfd1b..76d8cb29bcdf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -198,7 +198,7 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.caps = &sm8450_dpu_caps,
 	.ubwc = &sm8450_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8450_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 6129fd86713b..711cb08db92f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -203,7 +203,7 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
+const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.caps = &sm8550_dpu_caps,
 	.ubwc = &sm8550_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8550_mdp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d74029f163c8..171b1a2fe4e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -803,37 +803,3 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_8_1_sm8450.h"
 
 #include "catalog/dpu_9_0_sm8550.h"
-
-static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
-	{ .hw_rev = DPU_HW_VER_300, .dpu_cfg = &msm8998_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_301, .dpu_cfg = &msm8998_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_400, .dpu_cfg = &sdm845_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_401, .dpu_cfg = &sdm845_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_500, .dpu_cfg = &sm8150_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_501, .dpu_cfg = &sm8150_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_800, .dpu_cfg = &sc8280xp_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_810, .dpu_cfg = &sm8450_dpu_cfg},
-	{ .hw_rev = DPU_HW_VER_900, .dpu_cfg = &sm8550_dpu_cfg},
-};
-
-const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
-		if (cfg_handler[i].hw_rev == hw_rev)
-			return cfg_handler[i].dpu_cfg;
-	}
-
-	DPU_ERROR("unsupported chipset id:%X\n", hw_rev);
-
-	return ERR_PTR(-ENODEV);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 00c3c67dd267..7c2331d8070a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -910,18 +910,18 @@ struct dpu_mdss_cfg {
 	unsigned long mdss_irqs;
 };
 
-struct dpu_mdss_hw_cfg_handler {
-	u32 hw_rev;
-	const struct dpu_mdss_cfg *dpu_cfg;
-};
-
-/**
- * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
- * hardcoded target specific catalog information in config structure
- * @hw_rev:       caller needs provide the hardware revision.
- *
- * Return: dpu config structure
- */
-const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev);
+extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
+extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
+extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
+extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
+extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
+extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
+extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
+extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
 
 #endif /* _DPU_HW_CATALOG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7b24b21ef1b..0e7a68714e9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -995,6 +995,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	struct dpu_kms *dpu_kms;
 	struct drm_device *dev;
 	int i, rc = -EINVAL;
+	u32 core_rev;
 
 	if (!kms) {
 		DPU_ERROR("invalid kms\n");
@@ -1044,17 +1045,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	if (rc < 0)
 		goto error;
 
-	dpu_kms->core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
+	core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
 
-	pr_info("dpu hardware revision:0x%x\n", dpu_kms->core_rev);
+	pr_info("dpu hardware revision:0x%x\n", core_rev);
 
-	dpu_kms->catalog = dpu_hw_catalog_init(dpu_kms->core_rev);
-	if (IS_ERR_OR_NULL(dpu_kms->catalog)) {
-		rc = PTR_ERR(dpu_kms->catalog);
-		if (!dpu_kms->catalog)
-			rc = -EINVAL;
-		DPU_ERROR("catalog init failed: %d\n", rc);
-		dpu_kms->catalog = NULL;
+	dpu_kms->catalog = of_device_get_match_data(dev->dev);
+	if (!dpu_kms->catalog) {
+		DPU_ERROR("device config not known!\n");
+		rc = -EINVAL;
 		goto power_error;
 	}
 
@@ -1280,19 +1278,19 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
-	{ .compatible = "qcom,msm8998-dpu", },
-	{ .compatible = "qcom,qcm2290-dpu", },
-	{ .compatible = "qcom,sdm845-dpu", },
-	{ .compatible = "qcom,sc7180-dpu", },
-	{ .compatible = "qcom,sc7280-dpu", },
-	{ .compatible = "qcom,sc8180x-dpu", },
-	{ .compatible = "qcom,sc8280xp-dpu", },
-	{ .compatible = "qcom,sm6115-dpu", },
-	{ .compatible = "qcom,sm8150-dpu", },
-	{ .compatible = "qcom,sm8250-dpu", },
-	{ .compatible = "qcom,sm8350-dpu", },
-	{ .compatible = "qcom,sm8450-dpu", },
-	{ .compatible = "qcom,sm8550-dpu", },
+	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
+	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
+	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
+	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
+	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
+	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
+	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
+	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
+	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
+	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
+	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
+	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
+	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index ed80ed6784ee..aca39a4689f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -68,7 +68,6 @@
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
-	int core_rev;
 	const struct dpu_mdss_cfg *catalog;
 
 	/* io/register spaces: */
-- 
2.39.2

