Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F43BB4E2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7590589C21;
	Mon,  5 Jul 2021 01:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAC289BE8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:23 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e3so13929544ljo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hWilg6YaSqF46jkkdfsQMZj3MRMuOXV7b9r5SgXMa54=;
 b=EnvfI8V2bPWc9k1MbhMwIbKqEM3HB+QDvlAJlmBpKXxIUUi7VswbQix+Nt+v2Kx0Wv
 00+/1iAdyCaE5hJVX2bIXh6IypT/PeRK/oAq5iwC8Yc+rglDUYkuDtiBEdj/Y7R/xx93
 dWR5I6Mcmv0olQSCvBsFL9dHRwsLuQ5fEqjJzDt/qUNwA0JdwJ2LSdW66Jvzw7ULWice
 R9nEolCErSaXGu20CWG6xMUYcG0omZUVIHCXPylt16xTywVC9YwmE1+RWtjrvYntTQVJ
 CJf8HVMZdc4ca4dYqRT+od85O4lIqRbZ+QfBmZtVnL1C8+Du0U7Tc24Q6KI8bMd2wiWG
 QUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWilg6YaSqF46jkkdfsQMZj3MRMuOXV7b9r5SgXMa54=;
 b=YZWuSWC5dheOnADK5WlhgEAOzevRAsnlJgUAQ+DovVnqCRZR68rn/l2jYc/+i7CwWG
 BNSnTDOP21tu5kO2Za8S+LOdIg4l1lwQxVnOZOwwEMqou4w1Cg773ld4LnQ10MUZ+78X
 m81bqiZy5av7hBhc2Q7yoWvKY+ABc8MK/tnTExKe9/LBdAh8dee/j6ZDXfyPYiIHFuXb
 FsuHMFp8xD+lqSVgd6JMSI6XAZN+vPANnXvQeodTnx1XoexZDFx19oMv2QQIVsBu15UM
 YRBgCSfwM9C7W26WpKatoW7wXATbVsVIamhiHH+CBqNTzjFOQEhfG9hSvjRaSy4+7gRm
 PnXg==
X-Gm-Message-State: AOAM530zfITL+OqDfO/hxW/RrogIw950rT5xP005oNRaIGYzyLQznLQ4
 zzTzKGjoZ+a5iHiD+mLl6mLZBQ==
X-Google-Smtp-Source: ABdhPJxT4/YKSSD6fPQH2Hv+577kMNImd4RX2LKPmWs6ng8qFw75iM8MUkj1SQb+GqrkppZks2Hddw==
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr9196749ljn.272.1625448322416; 
 Sun, 04 Jul 2021 18:25:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 20/22] drm/msm/dpu: fix smart dma support
Date: Mon,  5 Jul 2021 04:21:13 +0300
Message-Id: <20210705012115.4179824-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Make SSPP subdriver check global
smart_dma_rev to decide if setup_multirect should be enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  9 +++++----
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b8e0fece1f0b..d2321648b8d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -185,7 +185,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -203,7 +203,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -217,7 +217,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -235,7 +235,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -251,7 +251,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f3c5aa3f4b3f..66d7b43c0019 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -70,6 +70,18 @@ enum {
 	DPU_HW_UBWC_VER_40 = 0x400,
 };
 
+/**
+ * SmartDMA support
+ * @DPU_SMART_DMA_UNSUPPORTED,   SmartDMA not support
+ * @DPU_SMART_DMA_V1,   SmartDMA 1.0 support
+ * @DPU_SMART_DMA_V2,   SmartDMA 2.0 support
+ */
+enum {
+	DPU_SMART_DMA_UNSUPPORTED,
+	DPU_SMART_DMA_V1,
+	DPU_SMART_DMA_V2,
+};
+
 /**
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
@@ -104,8 +116,6 @@ enum {
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
  * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
- * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
- * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
  * @DPU_SSPP_TS_PREFILL      Supports prefill with traffic shaper
  * @DPU_SSPP_TS_PREFILL_REC1 Supports prefill with traffic shaper multirec
  * @DPU_SSPP_CDP             Supports client driven prefetch
@@ -124,8 +134,6 @@ enum {
 	DPU_SSPP_QOS,
 	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
-	DPU_SSPP_SMART_DMA_V1,
-	DPU_SSPP_SMART_DMA_V2,
 	DPU_SSPP_TS_PREFILL,
 	DPU_SSPP_TS_PREFILL_REC1,
 	DPU_SSPP_CDP,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 2be43d5a235a..f93cdeb08ac7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -648,7 +648,8 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 }
 
 static void _setup_layer_ops(struct dpu_hw_pipe *c,
-		unsigned long features)
+		unsigned long features,
+		int smart_dma_rev)
 {
 	if (test_bit(DPU_SSPP_SRC, &features)) {
 		c->ops.setup_format = dpu_hw_sspp_setup_format;
@@ -669,8 +670,8 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 		test_bit(DPU_SSPP_CSC_10BIT, &features))
 		c->ops.setup_csc = dpu_hw_sspp_setup_csc;
 
-	if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
-		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
+	if (smart_dma_rev == DPU_SMART_DMA_V1 ||
+	    smart_dma_rev == DPU_SMART_DMA_V2)
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
@@ -731,7 +732,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	hw_pipe->mdp = &catalog->mdp[0];
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
-	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
+	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, catalog->caps->smart_dma_rev);
 
 	return hw_pipe;
 }
-- 
2.30.2

