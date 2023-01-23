Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A642567756B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF9510E1D8;
	Mon, 23 Jan 2023 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B3710E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:11:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b3so16819812lfv.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 23:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zdDcVMGBf+GaYAMBWQXE0P0rt8VchreBUViGzmJaf6Q=;
 b=hG412Ck8TI+idA6lTByW9mV8N7DwyaHwVIrrMjlDJe7MOBMLFitEEzqnAoEduq8wsC
 gZyE45V42IftcCI3GqxsK7l5AFwxcBH6XXo3BVm80yHPfHK1aX13xccVIZY26cSxQHVM
 G7uiu6jLeHsfMaACqmE1O9bvdOeKU8vjPOWH5G/FbgaHteBc3DuGm9aM4YuNavZo3BQO
 l9cA4ISDkMvJbaP/GH29KxsSuE8xThE4pwvd/SuiQpqXGVXaJGwwfbg7o3ldDoOtPPxV
 46Yl7Lae6O2rKOvRf22pV/spFKrd9skAz2Jjg7Rcb4XsbV4M9NrH2QYUiV8IR8VbSWA1
 xsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zdDcVMGBf+GaYAMBWQXE0P0rt8VchreBUViGzmJaf6Q=;
 b=u6dZa2SXn2uZi1h/Md4VPmgCPmB+cp76/2JlmG6eqKztAWPUvMfme37UNtrynhGUZ7
 XeGvyq5CCeCd6g5MHPaeBL1kKHlnRzJrIsi2pAC+oXNRdE0YzguRFWWYUSqaue6hzDT2
 C0bOHr82j135rpCDiYXLZZyGnR9Vse/EE3I24D5xpKTDKpLpcOHiJxkCv/nJf7HCwOIE
 vlc3LopIbcqCQ7X1tyGDacHOLzjPoHDo6jU3wNyO4LXFuiZ5WWTVA6smEeOPN50cbJAn
 0RzqOwpn1pTYvZopzIVVxYezqpkaf9Z/4t0z1M6h2KEByRpcLUTOX62R7V7jbsLJkvo5
 4zOA==
X-Gm-Message-State: AFqh2krK1iXPZuuyb2n0nWfRDOBhP7Sxi9cQ8JmA7LCm7jXjmfR4fwiO
 N2cTzJjvOJR2WUnpmN/Z/SuX2jdyNXCdmP8e
X-Google-Smtp-Source: AMrXdXvMchY+FEk1+BTw8FxKmxmmkq6e16qQj9j6qFs1BdP2Wnl9tLw1hL2PCxJqcx5Stk9Bv5ZHmw==
X-Received: by 2002:ac2:5087:0:b0:4b5:8d45:7f32 with SMTP id
 f7-20020ac25087000000b004b58d457f32mr6214430lfm.56.1674457906979; 
 Sun, 22 Jan 2023 23:11:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v16-20020a056512049000b004b564e1a4e0sm1814236lfq.76.2023.01.22.23.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 23:11:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: disable features unsupported by QCM2290
Date: Mon, 23 Jan 2023 09:11:45 +0200
Message-Id: <20230123071145.3056242-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QCM2290 doesn't seem to support reg-dma, smart-dma, UBWC, CDP, exclusion
rectangles and CSC. Drop corresponding features being incorrectly
enabled for qcm2290.

Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 289fb11f99d1..1c3ffa922794 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -12,10 +12,14 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_kms.h"
 
-#define VIG_MASK \
+#define VIG_BASE_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
+	BIT(DPU_SSPP_TS_PREFILL))
+
+#define VIG_MASK \
+	(VIG_BASE_MASK | \
 	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
-	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
+	BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
@@ -29,7 +33,7 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
-#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
@@ -50,6 +54,10 @@
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
+#define DMA_QCM2290_MASK \
+	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1))
+
 #define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
@@ -316,8 +324,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -1384,7 +1390,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_QCM2290_MASK,
 		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
@@ -2836,8 +2842,6 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.intf = qcm2290_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &qcm2290_perf_data,
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
-- 
2.39.0

