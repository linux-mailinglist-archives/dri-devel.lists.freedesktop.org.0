Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2472D58C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647510E2ED;
	Tue, 13 Jun 2023 00:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA5D10E2FC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f63006b4e3so5954734e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615026; x=1689207026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97XjgwdwmaJkwgryBByTEYhJimjLR8WZ3kp+c6KRDoo=;
 b=gIvahsADMjQPH9avxhAArHmU83b30FfVMcyHjwiTqPixbsmzobDfUv2sY/p319bgKr
 4urTyQXsehmolPqx9XSt9oHWCTLufLyef0+C0LII0JVSd42dQSOurJ3Ao/tMmmM7MvFB
 kcy67X/wU9TJk4E3HnbNhDF3x3SC3P9+V7LtiRH4gXg06qqrGM6uK4Pi3R5bs6fOuQk3
 vbD8ZDSajdgXZIPB19NitDmk1Wp8D4q7iaEOiC9O6SoRokUs6Dbi4Buiv4TmNb8Za+gD
 MorMTGhw6dOsOjjMQx210qdkvFHDg93BKpx5Y6ZMSnJV/MMezVbEozZTtb6bHRoJsNMb
 h87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615026; x=1689207026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97XjgwdwmaJkwgryBByTEYhJimjLR8WZ3kp+c6KRDoo=;
 b=CM8krB1ZnzUIzU5pGk4/RlLB1ugzo3rRatgOapmgbsDlWwSWneSO6uPiXrODNRiiJ2
 WjMOdJNL0umAqrVtNamGo4WcOdVOfyMlxlN8IB7wANXG1f5zkftROWBzYqL5Kpv5DSnj
 6C6ARVKsj5UnjvsMQlU9W3nIAlUIuw0BrUlUpp8pbhD7VXKhMlLw8nLw6hNR7oGGoUNd
 I59aHG8eLSgTblM/PGHquF3hRCz8cA3LJPz4YmkHOqg3CO/EsXODm29CcyoH1uixX/ik
 QLhX6mLtlgbDediOEbVmBJhQUpKsFLQl4FKdpdsyCF2Wvl3CchVm87DPRbMIJ2htJ/xA
 IlHg==
X-Gm-Message-State: AC+VfDxiEYmOfWV238OuLcS55IFSOZelFpS9xoJWhBIVNW+7WebNc7jJ
 ESdmWtlyzAi1b7CDf3DKiMKa4w==
X-Google-Smtp-Source: ACHHUZ4j+MDkatwP5xtGM4OD2+b1S/3fpvFqoH3do4ydNlTGoIfHZXVklPCMusJIzXLjTXaUIV2+2g==
X-Received: by 2002:a19:ab11:0:b0:4f6:20b1:ef81 with SMTP id
 u17-20020a19ab11000000b004f620b1ef81mr4381821lfe.36.1686615025987; 
 Mon, 12 Jun 2023 17:10:25 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 17/22] drm/msm/dpu: inline MERGE_3D_BLK macros
Date: Tue, 13 Jun 2023 03:09:57 +0300
Message-Id: <20230613001004.3426676-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 21 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 21 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 11 ----------
 8 files changed, 99 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5b068521de13..b152fb1e3399 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8150_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index ba5420f334ec..c13c0059936c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -238,9 +238,19 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sc8180x_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 01b61467a700..9213c1f90735 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8250_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8a9bfc4af72a..0added438239 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -237,9 +237,19 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index b676819db42c..0b4915dabe7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -235,9 +235,19 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 568523abc1d0..45cda9162685 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -247,10 +247,23 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x65f00, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 419624948e83..66dd414253f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -261,10 +261,23 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x66700, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ee24402bf253..72634a8109e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -471,17 +471,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_rdptr = _rdptr, \
 	}
 
-/*************************************************************
- * MERGE_3D sub blocks config
- *************************************************************/
-#define MERGE_3D_BLK(_name, _id, _base) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x8, \
-	.features = MERGE_3D_SM8150_MASK, \
-	.sblk = NULL \
-	}
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.39.2

