Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15D347B67
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23486EC6C;
	Wed, 24 Mar 2021 15:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6C26EC6E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b14so19185385lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K+oEmbTI+ZjniTkaGXPzbMX+/sehusvnH9bTTAOnwik=;
 b=h3TsOptXkBV6pylgZf1iYu94H3nrLg1EwnaNNEn9LlAolu9IzdqonaCKrZyL11Gn4N
 oHvLrS4PHorXoD4nkVdZhJGWSVAOnFT/SLBFpdjUxWz6DSgsj9QXiByoje7C/1ulCkUM
 lN4o0qCZyrEky1Qfe/p+65IVZV79m5NOv25qPIdsJzXejeSQeX8YlHK8D+WaL6VykIeC
 PLSlhFrBN6nbEgbCFF8RrG93yw8wg53Y6UZqhD8T3qdJX99/HfHp68gtARw9ce3+mgxZ
 4SixgYMilY+/VyQ/Eod/obkuI5dMCvhOyonvrfnvgFHve1ZgttAdeykzA/S4bajScUK2
 N6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K+oEmbTI+ZjniTkaGXPzbMX+/sehusvnH9bTTAOnwik=;
 b=UGzSQ7G8e9WfQrp/SPpq4CntBpgz2CEyN1faSYZdQEZpraDF8GS6FHwjsk8iAVVOcH
 mCWYXCZU0P6MWLoZgFhWuD+prMr6KW4OLU2WpFHM4Jd4lt6SL3VMhIX8LuXrStJWIVIr
 Htm4uTY9M4+Rmw79pMC5PueEJOk6cv02rvrgAWN22qmDEdvM4rTbRym9IvTZCw+655FQ
 UczulD+PU+qGLeOfghDqOoPz3LeI5N6tBNfiv7/mTZRkrjbVH5IqGek41hi8p16u7QjA
 DlRhemgpZuDfZOnRg5GPRNatoCdTbqhSXm+skdyGRjbsYW2NXkqta44xK/ufCq0Dc1tP
 94bw==
X-Gm-Message-State: AOAM5334y7EK8VwfdSJCbiOpQL2MXi17K55YOXwa64XkZmF+oEq8iHBy
 /tR8XlEK4paO12LSKhsDytSN3A==
X-Google-Smtp-Source: ABdhPJyHdvvAdtwxnzTedyfBeteO6j/xvWanyBm7xmdbrtMm3eiFqf7AGt26qzEdoqSXtqCjQLSkng==
X-Received: by 2002:a19:b81:: with SMTP id 123mr2193932lfl.553.1616598055149; 
 Wed, 24 Mar 2021 08:00:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 20/21] drm/msm/dpu: fix smart dma support
Date: Wed, 24 Mar 2021 18:00:23 +0300
Message-Id: <20210324150024.2768215-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Make SSPP subdriver check global
smart_dma_rev to decide if setup_multirect should be enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  9 +++++----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f21f630af476..5552f45f818c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -145,7 +145,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -161,7 +161,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -173,7 +173,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -189,7 +189,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 08864f0addc4..1202a82918eb 100644
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
index 8734a47040aa..4165ff2d7a3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -647,7 +647,8 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 }
 
 static void _setup_layer_ops(struct dpu_hw_pipe *c,
-		unsigned long features)
+		unsigned long features,
+		int smart_dma_rev)
 {
 	if (test_bit(DPU_SSPP_SRC, &features)) {
 		c->ops.setup_format = dpu_hw_sspp_setup_format;
@@ -668,8 +669,8 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
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
 
 	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
