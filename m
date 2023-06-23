Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9573B945
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265AB10E643;
	Fri, 23 Jun 2023 13:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1E10E636
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso908744e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528731; x=1690120731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqMI5g0eW6Zx9fzRmsKG57SxP+GDA8bNXR2rfwNcitg=;
 b=wRyUtfbIDYIkyW6TtZXXEX2MmCUCOulbO9jfoDxfcpzN3+EnWovV0ZZfqmvSusVjVj
 2X1Mqp2zkJ258xZdqY5RZXiTp963nRr9KdUF2Yn+eTMvN4tZKznlyyNrpkGAwE1wsWPC
 MLb/SbxFhqUykdlRhb7qfWoE+Ah3oElwBeyRrTs8R2pgEdNrfseefRpiA7g0xi7vErnb
 0/+lhjPBsMxevl3UkCJDHQ/74MhV8jt/QAqjG5mjYTpTRks/TESZAs46xCxNaM+fnp4Y
 +c8xH1z7EeKs7oxGLOEj7aZCeU7yolQPcalNeS+OA+Ie0I9sZatepYR/Xy0aucXHLnxR
 cRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528731; x=1690120731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqMI5g0eW6Zx9fzRmsKG57SxP+GDA8bNXR2rfwNcitg=;
 b=CQiREmsc3fdRXmvwXWLtv+M6pFWz8ZMeVjWO80zTh4KIOq76I7iuX6QU5oDr3C1dBF
 RiOCdjfj1p7KKpC6AP0O8BUBhk87dNS7guiFgVq4SqWoxs5B6Xd3HMMp6tdx7qDMRUy4
 Hr5xynFtuOMTgQRDFzMcpMudBXPAFikQTBqpT0AydeVuwPF22WZDmsruQks4whkk96T/
 KC2KQ11rLgaYCmJwl0B4rrTgweYWKn7xBKbx8Kp983DgzhK89qzSkRU7Qn4EHSKzEyrk
 sGxTvEaKudhrZcMzIsSMEwwbv1zAuSaaMumaTzK4Ph4hvQf8c3DkBYE2sgHY0hvCVQQ3
 qBKg==
X-Gm-Message-State: AC+VfDy5BmR310nyj3aVNgWMQCcGDCMsYkICF6i6Oz/aHmDE6XIg5Naa
 5T63Dd6F4g6nqZr9qWRWj5d0/A==
X-Google-Smtp-Source: ACHHUZ6sp+GSCoNCq+gV++epkzw2krDM958VEvpEjzTNwjcVtf7ppS7wl1YNM3SsOoVKTd3bTbHQtw==
X-Received: by 2002:a05:6512:2206:b0:4f9:7330:66ef with SMTP id
 h6-20020a056512220600b004f9733066efmr501701lfu.25.1687528730632; 
 Fri, 23 Jun 2023 06:58:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 5/7] drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
Date: Fri, 23 Jun 2023 16:58:42 +0300
Message-Id: <20230623135844.1113908-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

As we have dropped the variadic parts of SSPP sub-blocks declarations,
deduplicate them now, reducing memory cruft. Do not deduplicate the
VIG sub-blocks for different platforms since this is pending another
cleanup/rework (of scaler version).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +++---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 +++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 52 ++++---------------
 16 files changed, 103 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 7d87dc2d7b1b..d49030449c85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_0,
+		.sblk = &msm8998_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_1,
+		.sblk = &msm8998_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_2,
+		.sblk = &msm8998_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_3,
+		.sblk = &msm8998_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 66e3573eb613..6e15bbebf24f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -105,7 +105,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -113,7 +113,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -121,7 +121,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -129,7 +129,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e6d4a2bfc2be..b4194a65a20a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b4baf6707018..2c0dd4964fda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -105,7 +105,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &sdm845_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -113,7 +113,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -121,7 +121,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -129,7 +129,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -137,7 +137,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 265d88b288b6..3a7bd9b4f1a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 0f59e372cf3e..387361e11631 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -58,7 +58,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &sc7180_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -66,7 +66,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index f01eac27f405..50b92e145eb4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &sm6115_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -54,7 +54,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index df4bf6510123..080e8e5527bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -66,7 +66,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &sc7180_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index cb486bea6628..73770ca4249e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -43,7 +43,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_QCM2290_MASK,
-		.sblk = &qcm2290_vig_sblk_0,
+		.sblk = &qcm2290_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &qcm2290_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 74dc032af7a4..88d713aca347 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &sm6115_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -55,7 +55,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 59a96a4b250c..8e59247d163c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -96,7 +96,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -104,7 +104,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -112,7 +112,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -120,7 +120,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -128,7 +128,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -136,7 +136,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d3a18048972f..317b111af8d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -64,7 +64,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7280_MASK_SDMA,
-		.sblk = &sc7280_vig_sblk_0,
+		.sblk = &sc7280_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -72,7 +72,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 7110caae7251..c251da30aa2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dcafab3e4b1a..934ead198a2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &sm8250_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 7b96f827c2b1..f91ae1525521 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_0,
+		.sblk = &sm8550_vig_sblk,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_1,
+		.sblk = &sm8550_vig_sblk,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_2,
+		.sblk = &sm8550_vig_sblk,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_3,
+		.sblk = &sm8550_vig_sblk,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -139,7 +139,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
@@ -147,7 +147,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_4,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA4,
@@ -155,7 +155,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_5,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 33cc56d3bbfe..0104f741f15b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -288,63 +288,34 @@ static const uint32_t wb2_formats[] = {
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
 	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
 	.rot_format_list = rotation_v2_formats,
 };
 
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks msm8998_vig_sblk =
 				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK;
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK;
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK;
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK;
+static const struct dpu_sspp_sub_blks sdm845_vig_sblk =
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 
-static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks sc7180_vig_sblk =
 				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 
-static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks sc7280_vig_sblk =
 			_VIG_SBLK_ROT(DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
 
-static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks sm6115_vig_sblk =
 				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks sm8250_vig_sblk =
 				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks sm8550_vig_sblk =
 				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK;
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK;
+
+static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK;
 
 #define _VIG_SBLK_NOSCALE \
 	{ \
@@ -356,8 +327,7 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK;
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE;
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK;
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk = _VIG_SBLK_NOSCALE;
 
 /*************************************************************
  * MIXER sub blocks config
-- 
2.39.2

