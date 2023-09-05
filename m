Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A58791FF1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 03:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207310E414;
	Tue,  5 Sep 2023 01:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7510E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 01:25:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5007c8308c3so3096840e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 18:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693877134; x=1694481934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQN1Ap/4XKz/5aS/uJ7pfsyxpBDq8/WGhMf2e10wfUM=;
 b=cquvylxmM1R7W7ETvfF4RoJwYTqQUk4arvIO1fXTOn/cdVegNX1csaYh8Xq20ljpyB
 NKYha8m6TPPI9LHAZZKiDJuY7Gkv50h4UNF1hIBKqqVVdpmoDsKq46B+opbQZZjW9Jz3
 a1Wpo8zN6uxECqmgZZriVYl/7VQlRM8B+W45ppcsEbpoBiXki7/MHODQkpPAV5yHA6vj
 NxLvPaZoDgEOVH6MyYpaYrstNExqky6XOxyI7uZ4Rf6mlVMOmuTEiafRuTYvLAB8c6Y9
 yQkxjELolt+g3y3e13VvBbYMDqry5L17pGNtrDn3yeUVvRHji4G4QstjZ0jnV6Bjov6e
 HvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693877134; x=1694481934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQN1Ap/4XKz/5aS/uJ7pfsyxpBDq8/WGhMf2e10wfUM=;
 b=K+pNqkcuboNaswDczxm2bvkVslTGbdCp05egwRuPYjdp0ony3qm0lix2f06gUr4b+V
 b0/i5AmqnEyn4h0/D870MiMEgCwSX2rn3B7n5EhcjLcNHi/kRwkEXfdWU6p0fLfSU3g4
 N6RmjvWTJR6lXGFJgZIbF9U3j4Pdh4p/uzZHbhqT11zYAsz1+EdmGNVO5rDqE5x3pVNr
 YhW3O8MOiEoT9P15VJeKMxdGd0cjKepFG0eH5vKvrYu6+9i1ZU2zbg+ySpsGWKGbQtX+
 f0IZvoiBLT+gLWAAXeyn7H+o6gHJEYDvpUhcE2FHt9/J+zVRSG2+PQwAY9wqZ/sld9gU
 T2XQ==
X-Gm-Message-State: AOJu0Yw8smZdV08yDsKcWW1fLE9U5k2YZ2ub8cm4uH3WMEXUaFp5Oi2/
 nNn3207JNHiC5jRxsM5tgBTYpg==
X-Google-Smtp-Source: AGHT+IFgZpzdyYlSNWhGAlu/VvmDMtFOE5/yU1q9JCDPkK5ohNNOiI9l6k6Oh63CaMCW9FyqOUQEKg==
X-Received: by 2002:ac2:4d84:0:b0:4fb:7559:aea3 with SMTP id
 g4-20020ac24d84000000b004fb7559aea3mr6253582lfe.39.1693877133998; 
 Mon, 04 Sep 2023 18:25:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 18:25:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 8/8] drm/msm/gpu: drop duplicating VIG feature masks
Date: Tue,  5 Sep 2023 04:25:26 +0300
Message-Id: <20230905012526.3010798-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
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

After folding QSEED3LITE and QSEED4 feature bits into QSEED3 several
VIG feature masks became equal. Drop these duplicates.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c        | 11 +----------
 11 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index c5c44e15a8ea..e196f9e7fd82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SM6125_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index e1a06e609cc1..c9576a7b8bef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 206e5a64e5e4..7e1156f1ef54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 1122a62acddf..49d360d2b73b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -38,7 +38,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 8aea53d5c86f..ce54e0c695d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -58,7 +58,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 73756ee7bba7..b03f23a0359f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index fcefb7a66bec..928d62caf8c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 332097f8799f..6e3a05666be6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 90977084958a..09c589207d74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_1,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 23f4d8d8e22b..e1f872efb5b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 67d66319a825..337d4f612f9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -30,15 +30,6 @@
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
-
-#define VIG_SM6125_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
-
-#define VIG_SC7180_MASK_SDMA \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
@@ -47,7 +38,7 @@
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SC7280_MASK \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+	(VIG_SDM845_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
 
 #define VIG_SC7280_MASK_SDMA \
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-- 
2.39.2

