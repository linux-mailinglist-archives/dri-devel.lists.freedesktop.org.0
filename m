Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95E7BB8CE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1554C10E4F4;
	Fri,  6 Oct 2023 13:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EE210E4ED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:14:59 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so2615177e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696598097; x=1697202897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbLZbLrOnmLh/4NymFlq193MxI5ZWz7inpVDOjP4Yo4=;
 b=pREmfSY4iRbAOCthN548DHc7/S+US6FAXIQOKsWkCWbvwg8b+VffrcoRehwb4f265d
 lhV/heWbjw/aqpP/9ElYBos9RgrBJX2NeQF3s9jdaEjDVvFK8Icr2segBr5dz8+D8i4B
 vvS5CdJRo41ZZtdLeDzoVhIRSgNJgxhbsRTUuuNxbYUoLlZZTcqNA+ssZ83vd9yFyIHR
 HeBYJWkkcuTZE6PUylhMDnKlyK02hkQK+8N1NMk28hZ9pfsLxDvIyuxoUSnKsmldPslZ
 TnXY4nihGxt2Y3IR/a5asTh0F7pkrlFjnSD9vH+FceSU8tzUBI3Jw2p+W3JM+JhC7wHI
 /dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598097; x=1697202897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbLZbLrOnmLh/4NymFlq193MxI5ZWz7inpVDOjP4Yo4=;
 b=nzRY2M5y+Aha6y1MNhXiSXQvI0F4Xdm1Xv3GnyGZJY7eTaEP1UUjLgZNEtmQODOfJN
 qfCfo621wD3wK1Mqv7pcBsJdf7dZL7tMc08ucd/emjnO04JssjcibKmFeLGJsQSWL1J2
 jb2SfZn5F2LdrgiHka33b3wodyFhwuReaZPKlDDlfn4WhThbU9i53AT5EBJ9Z9vl3OED
 JUq4yaUnekGDHPhpxAkhD4c51jtnRgrVYRR7BnsZlL8MJ0yfupae/lYzvBQkiSBUAOf4
 Z3VQLGq6REimylTy9s410Y79ewfhHXBAXFtu6hoAjiGdKtAZLiK+0R/WuUX6MuYGl/s6
 MWsw==
X-Gm-Message-State: AOJu0YwI3lMFPX+LDs698vDqAAlnPyAehGtxhr8xs8IZ0tUyO5QOIscG
 ytd1rrJ5M1jdMsNA7dLF6MF3pw==
X-Google-Smtp-Source: AGHT+IEq95TjU58oK8K9ebk/mAWsmrBeUAJiygqjdhgEeffgyIRnIMhvah2JvKUB73gY3ldSjOJmtQ==
X-Received: by 2002:a05:6512:716:b0:505:6e21:32e1 with SMTP id
 b22-20020a056512071600b005056e2132e1mr6239633lfs.10.1696598097151; 
 Fri, 06 Oct 2023 06:14:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:14:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 06/10] drm/msm/dpu: deduplicate some (most) of SSPP
 sub-blocks
Date: Fri,  6 Oct 2023 16:14:46 +0300
Message-Id: <20231006131450.2436688-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
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
deduplicate them now, reducing memory cruft.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +--
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 97 +++++--------------
 17 files changed, 120 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index ff83bf694fee..93302f7000fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1ac,
 		.features = VIG_MSM8998_MASK,
-		.sblk = &msm8998_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -109,7 +109,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1ac,
 		.features = DMA_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -117,7 +117,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -125,7 +125,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1ac,
 		.features = DMA_CURSOR_MSM8998_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 05f71f04b8ac..80eaffa16b94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1c8,
 		.features = VIG_SDM845_MASK_SDMA,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1c8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1c8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index cbe4d0ce230b..12a28d121813 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 71207d7222de..9a3a592dcd23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sm8150_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2491eed10039..047dd6d4f5c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SM6125_MASK,
-		.sblk = &sm6125_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 8982ec228f3d..2aa4c792b306 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK_SDMA,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 18e2e48e2b7c..c5687571ea6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -52,7 +52,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -60,7 +60,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -68,7 +68,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index cde131a922fe..f9e4ce9d9f2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 3aba274faeec..46d6eca81eed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sc7180_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 87a03aa16554..e0b493f75fc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_QCM2290_MASK,
-		.sblk = &qcm2290_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_noscale,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &qcm2290_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 8afb8a8072b0..a8a4fab22c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -40,7 +40,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm6115_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -48,7 +48,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 5435e5fdab52..be05b7ed2013 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f8,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index da8b7e46237c..351db9610ac7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -57,7 +57,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
 		.features = VIG_SC7280_MASK_SDMA,
-		.sblk = &sc7280_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0_rot_v2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -65,7 +65,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
 		.features = DMA_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
 		.features = DMA_CURSOR_SDM845_MASK_SDMA,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 29cb4dd90980..ff6cfd612f7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dbb77144364a..04d69182ec64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8450_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x32c,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x32c,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e60427f54b27..860feb9c54e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_0,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_1,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_2,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8550_vig_sblk_3,
+		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
@@ -109,7 +109,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_0,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA0,
@@ -117,7 +117,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_1,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA1,
@@ -125,7 +125,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_2,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA2,
@@ -133,7 +133,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
 		.features = DMA_SDM845_MASK,
-		.sblk = &sdm845_dma_sblk_3,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA3,
@@ -141,7 +141,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_4,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA4,
@@ -149,7 +149,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
 		.features = DMA_CURSOR_SDM845_MASK,
-		.sblk = &sm8550_dma_sblk_5,
+		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,
 		.clk_ctrl = DPU_CLK_CTRL_DMA5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e9773274bdd6..32c396abf877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -285,6 +285,16 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
+#define _VIG_SBLK_NOSCALE() \
+	{ \
+	.maxdwnscale = SSPP_UNITY_SCALE, \
+	.maxupscale = SSPP_UNITY_SCALE, \
+	.format_list = plane_formats_yuv, \
+	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.virt_format_list = plane_formats, \
+	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	}
+
 #define _DMA_SBLK() \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
@@ -295,98 +305,41 @@ static const uint32_t wb2_formats[] = {
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
-
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
 	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
 	.rot_format_list = rotation_v2_formats,
 };
 
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_noscale =
+				_VIG_SBLK_NOSCALE();
+
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_1_2 =
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
+
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_1_3 =
 				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
-static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_1_4 =
 				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_2_4 =
+				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
 
-static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_0 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
-static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_0_rot_v2 =
 			_VIG_SBLK_ROT(SSPP_SCALER_VER(3, 0),
 				      &dpu_rot_sc7280_cfg_v2);
 
-static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-
-static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
-
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
-
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_1 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK();
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK();
-
-#define _VIG_SBLK_NOSCALE() \
-	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
-	}
 
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE();
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 
 /*************************************************************
  * MIXER sub blocks config
-- 
2.39.2

