Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C838017F3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A77310E9A2;
	Fri,  1 Dec 2023 23:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A5389F08
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:42:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50bc501081fso4002291e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 15:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474165; x=1702078965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pxkCcoVS1CvJvZu/i/sFpkhl3gEmb4SQu/qFyoCyOY=;
 b=GhLrQ+wt8BjTfZBocDVqx8GU+aU0JUGUh17t++SzSKXZgYs/xvILaVDVYiy7X91vtV
 nTvBSK6Vg87D2YEnBnl6sNibSR4LgURuygZ6PKX9JmS0oj68Eq2ePBGTpMipgM8nFTYL
 /PGgC85F2oifMVFL5Qwy8r3N0PHjaJ8ddIiP/ZK7CojCDluHToxJckQ43XeThXIgqPMm
 ckTYC52uCE2K4qOgQVTRIVlTJyiqk46y5C2v3PAp9r4bRovUgCgNb+Yobxabg9wBLHAf
 O7FRK0IvU5hg/dXCrLgFid77MbO2zrTvGifJOBQ/RzL1OJSjlbwBDwTD5sy61WOUOGG4
 G4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474165; x=1702078965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pxkCcoVS1CvJvZu/i/sFpkhl3gEmb4SQu/qFyoCyOY=;
 b=Umk4KcndIevOHwtBZ1v/Ttd3wvHxAumY4RgM9wKx7nNCICABKBLGVoiNEZkeAzT8o0
 3G1x1K6Dnsz9Glb/NQMH7bFg9zbRFgrX8s0+xi1My83A7qB4A2amFSRQSIjbBn3agYxA
 vbJ15661BhQQduHD18xxHxU1KfU29B0hJucNkzyZjxvJkT5MWSb7zRaRnTmJ5LOTMoMd
 ottbrzNqR1ueQMA7UFaKbue2gwrh0dsCvxuTvNXVN47qKiOfLQLwi74NSfLCIEefqSI/
 yqyY5DkRsrodEKd+ijfh9lB1WshwvceorA4k/P1M3PXc7sf9UAx+/teX9x78UdBU3/ht
 NrBQ==
X-Gm-Message-State: AOJu0Yx6LjrVLUJ3uSBQRBrKZfCe9XbeubE9tuFGCNzzLWGzkEVj9JBz
 U41S1k5xL2KDN+aU94DYk8MRYg==
X-Google-Smtp-Source: AGHT+IEXB6G+VOGL2ABU1YJ+4MnOSOsqLKElBKR2yLZdjqmYGDKk4jWzP5Qqwqs2QwmuSU9W3ajTGw==
X-Received: by 2002:a19:6d17:0:b0:50b:c995:3245 with SMTP id
 i23-20020a196d17000000b0050bc9953245mr1245694lfc.28.1701474165289; 
 Fri, 01 Dec 2023 15:42:45 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:42:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 10/10] drm/msm/gpu: drop duplicating VIG feature masks
Date: Sat,  2 Dec 2023 01:40:34 +0200
Message-ID: <20231201234234.2065610-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
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

After folding QSEED3LITE and QSEED4 feature bits into QSEED3_COMPATIBLE
several VIG feature masks became equal. Drop these duplicates.

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
index 3969f2925d89..76b2ec0d2489 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SM6125_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index f751d63845d1..9acf07108899 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK_SDMA,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 7627f16c5b2d..783269c6ead1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 7aefdb7eb494..43f64a005f5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -38,7 +38,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 99df9816f171..e17a30be7525 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -58,7 +58,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 2de304d97c9b..a06c8634d2d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 002acaeeb3c7..fe6bbb6b3061 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index c2f1acd43524..8b5c5031e2d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3fd253a149c3..3000f7804867 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f393d42317af..bf56265967c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -66,28 +66,28 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SDM845_MASK,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c24817b0e4e5..ec10f68cf0b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -30,15 +30,6 @@
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
-
-#define VIG_SM6125_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
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
2.42.0

