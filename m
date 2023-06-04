Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918D7219F4
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915D10E170;
	Sun,  4 Jun 2023 20:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FF410E170
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f50470d77cso4972672e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910949; x=1688502949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajvInlxsmeRjRmph7xfPhjW8W2WaXPrVwK/IjK9i1uw=;
 b=tCcwTE/IVq+cs8SoWEyvGvnF1cOwr9yZXIdbuzxT3pbq6qgX6JB5+8rOxBRZgwq5Er
 PboKUIu2bitTeYUsIPtGVDvZtLWhSg1XHk92jdURdf7IUNsdEmzDIJky3hJXI5zNLDpu
 q3yZzxjVbiP410E+EvTdFbxwXI8OIOcSEydvI+jBkc2QrjeDRG8R47Iud530rLmpU5Dl
 www/iBXWm2lCFsjnyv+7oKQvUy2Q2XqYkq78tb+dNEpEOvLsDmD53ibiT51qMg1IituU
 wA3ZJFHl7JPRwnDyX6bOpqKmcfHki6Tw/ajqEDYzT4vPdZTEOTxOHieEBdxLISBbbmPk
 iUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910949; x=1688502949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ajvInlxsmeRjRmph7xfPhjW8W2WaXPrVwK/IjK9i1uw=;
 b=IfrMYOVdzi8l/ZQcG9Lff75X0weMc/FN5RuPRf6R+lyb9/dWCGSb1UKwxNa+ylruXz
 CMPbBQY4wolBnseoMgGYCfkSzRhm737Hjjqrd5b+JKhZqt7OQpzBfmzj89xoU84ovrJ4
 ljNJ7a1D4Xck9GNFBdwv4klsdg3XGWrM/fn1TT6db+753t4sAwsRW9sQIgh8AqLhLvD2
 1e+yXc5b2XQlTwpd3DytXzuNJbRoIO4Zi+MIJzg4sqq8CQjvNdtECUE8BW9H8tpZfzNA
 rpqm4uV0wrGwrhdC+TakwDs14Hppx+uyzGdn81UqF5wRA6qHtI0hvn3K2C2Au0YMbgtB
 3iZw==
X-Gm-Message-State: AC+VfDyKyxfwLAubZDlKG515h619O2yZXZMMOzG5yDu8eN4+emqcqZhH
 VPzjxLRvtY+BV1cVDZ1G5a5Ndg==
X-Google-Smtp-Source: ACHHUZ7ebINyqk/keeoddcX4KxdLheohTPCBFHKViSqIhLfDzxmaA2biJ+WV94sKZMrgKXYT7ZQp6w==
X-Received: by 2002:ac2:55a5:0:b0:4f3:a99f:1e91 with SMTP id
 y5-20020ac255a5000000b004f3a99f1e91mr3901906lfg.52.1685910948681; 
 Sun, 04 Jun 2023 13:35:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 14/22] drm/msm/dpu: inline LM_BLK macros
Date: Sun,  4 Jun 2023 23:35:24 +0300
Message-Id: <20230604203532.1094249-15-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 60 +++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 58 +++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 62 ++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 62 ++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 62 ++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 21 ++++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 10 ++-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 10 ++-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 62 ++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 30 +++++++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 58 +++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 64 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 62 ++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 11 ----
 14 files changed, 505 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a51c1af0d7b1..3130d0ec74a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -150,18 +150,54 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 };
 
 static const struct dpu_lm_cfg msm8998_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_2, LM_5, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_3, LM_2, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.pingpong = PINGPONG_NONE,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.pingpong = PINGPONG_NONE,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
 };
 
 static const struct dpu_pingpong_cfg msm8998_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ebb811969171..c289fbd76080 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -148,18 +148,52 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sdm845_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
-	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x0, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.pingpong = PINGPONG_NONE,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x0, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.pingpong = PINGPONG_NONE,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
 };
 
 static const struct dpu_pingpong_cfg sdm845_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 9f101e462a4b..b26a7d4b0ce7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -158,18 +158,56 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8150_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a31767a3d7f6..4259de1dbfc2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -157,18 +157,56 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc8180x_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sc8180x_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 28f8469a48ca..b268466b2b7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -158,18 +158,56 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8250_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sm8250_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index db2b95e7429e..9fc51811b82c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -95,10 +95,23 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc7180_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sc7180_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sc7180_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+	},
 };
 
 static const struct dpu_dspp_cfg sc7180_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 7724277059c9..fbffe4ddbbe6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -63,8 +63,14 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm6115_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
-		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_QCM2290_MASK,
+		.sblk = &qcm2290_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
 };
 
 static const struct dpu_dspp_cfg sm6115_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 0195645f9f6c..25b1dd15d014 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -60,8 +60,14 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 };
 
 static const struct dpu_lm_cfg qcm2290_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
-		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_QCM2290_MASK,
+		.sblk = &qcm2290_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
 };
 
 static const struct dpu_dspp_cfg qcm2290_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ecc6c377a72b..1c215f04669c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -156,18 +156,56 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8350_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sm8350_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index cc726794f054..a4c436e5b1a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -102,12 +102,30 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sc7180_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sc7180_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sc7180_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
 };
 
 static const struct dpu_dspp_cfg sc7280_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 8f43de4cb2e7..8a3f946f5622 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -158,12 +158,58 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc8280xp_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 91fb41db5fc7..7e305a686055 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -158,18 +158,58 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8450_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sm8450_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e5b06ab13403..9c8f3b1331ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -177,18 +177,56 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8550_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+	{
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	},
+	{
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	},
+	{
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+	{
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	},
+	{
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
 };
 
 static const struct dpu_dspp_cfg sm8550_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a8e5e429e4b..67cc22210c4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -375,17 +375,6 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
  * MIXER sub blocks config
  *************************************************************/
 
-#define LM_BLK(_name, _id, _base, _fmask, _sblk, _pp, _lmpair, _dspp) \
-	{ \
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x320, \
-	.features = _fmask, \
-	.sblk = _sblk, \
-	.pingpong = _pp, \
-	.lm_pair = _lmpair, \
-	.dspp = _dspp \
-	}
-
 /* MSM8998 */
 
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
-- 
2.39.2

