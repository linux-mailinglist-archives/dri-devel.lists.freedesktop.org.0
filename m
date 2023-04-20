Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D804E6E9CDA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D667010E86E;
	Thu, 20 Apr 2023 20:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8310E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 20:07:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8ad872ea5so8178061fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682021263; x=1684613263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1uTE4+i8r9VPgRfBJUaK3oV/eLYdWsWpSI3+m7py0II=;
 b=mSUQcVHBuOHNL1LVhsUBKGXDwkPeVKnvyMvY0SxHhmZDosS46yGE67zawM4IxFv7QS
 8Es+lFOTsQ9TGSNV64s5DyB3/oRyZfPOYiBl4ZeK3j8gvdG8ctWmBCGJa3LJPxKNdxWj
 T4hVPwO7KQoOqtN1rWLHyYHWAzsGm13J99GNpSfTvS4q447Jo53Q5YmK6M2xeXWgxZ7M
 QIdy+Wax0Csqd+L+YlqsUMtxTFtdHjSIYske3sFny4IoyriTqE9bg3VACnsOPATrMOiK
 Ed4vijoNpxf/TviqFl41aQP/r9XER63mDzLi9lHOHk5ZZGAWpz0gm5s3WHKgP4Q/N0Vo
 El/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682021263; x=1684613263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uTE4+i8r9VPgRfBJUaK3oV/eLYdWsWpSI3+m7py0II=;
 b=Cevh+22izDVZaPLMabgBFtVLiHSTKfbibRRJ9T01b+38aTNIqqtjj+hTgUM5MST+ZA
 zjdN0wnVF1cLTzTNYnr8aTbcILjq3yR5wIFylbG3gMlZ/ifeODbZ7DjTPXaarMlrMZE0
 Ab2/rV93TjLTtLj6Uj3V3UUQGEfS7utHTnbFaPLGempFRevXQ44Zmy3+m48WuPOnExxa
 n4aKbc/Q3TsrexMr2soX5TNu0erUpUEglw05VvR9ZFTbgVXXEIwruEHDY+uPDWDrnll9
 lvmf9vaOAFHj/6DUfHGnTaXyTqHhiJ0IjZc2URcWv9Zz2Y1MAQD0rgFOqK89h3TX/kHX
 fkFw==
X-Gm-Message-State: AAQBX9d20ot6Rbne3XyK9ZgKwbXCd5sYwGy7YnJxvedgDnYOa8X19vv9
 JZOoqjaJcTwZOXD7zMbq6LPAQw==
X-Google-Smtp-Source: AKy350Z3B1sqRoFAm0yh5zYH5FXChdn3OYPHE2BNv3IfGVJEui4aWHgAHqFoFCfR3GDNSMDaM0zE8g==
X-Received: by 2002:a2e:998f:0:b0:2a7:6f82:4a87 with SMTP id
 w15-20020a2e998f000000b002a76f824a87mr24974lji.35.1682021263160; 
 Thu, 20 Apr 2023 13:07:43 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q13-20020ac25a0d000000b004ec4f3810dcsm314551lfn.109.2023.04.20.13.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:07:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: drop the regdma configuration
Date: Thu, 20 Apr 2023 23:07:42 +0300
Message-Id: <20230420200742.1200531-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The regdma is currently not used by the current driver. We have no way
to practically verify that the regdma is described correctly. Drop it
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  2 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 -
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 -
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 40 -------------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 ---------
 12 files changed, 78 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 2b3ae84057df..aa923fb2ebcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -195,8 +195,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.intf = msm8998_intf,
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
 	.vbif = msm8998_vbif,
-	.reg_dma_count = 0,
-	.perf = &msm8998_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
 		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ceca741e93c9..63009435e258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -193,8 +193,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &sdm845_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 282d410269ff..e17398f98734 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -220,8 +220,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
 	.perf = &sm8150_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c57400265f28..d32f939e9c00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -198,8 +198,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
 	.perf = &sc8180x_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2c40229ea515..f49fc1690b71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -228,8 +228,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.vbif = sdm845_vbif,
 	.wb_count = ARRAY_SIZE(sm8250_wb),
 	.wb = sm8250_wb,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
 	.perf = &sm8250_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 8799ed757119..0a273ba8cf4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -143,8 +143,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.wb = sc7180_wb,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &sc7180_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ca107ca8de46..865dc51d0fe5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -211,8 +211,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.intf = sm8350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44..1ac7ad2ba0da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -202,8 +202,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02a259b6b426..41c326fc3792 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -219,8 +219,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 9e403034093f..e60ebb6242e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -224,8 +224,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.intf = sm8550_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8550_perf_data,
 	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
 		     BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 03f162af1a50..57b3c495aeb5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -650,46 +650,6 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	},
 };
 
-static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sdm845_regdma = {
-	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
-};
-
-static const struct dpu_reg_dma_cfg sm8150_regdma = {
-	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
-};
-
-static const struct dpu_reg_dma_cfg sm8250_regdma = {
-	.base = 0x0,
-	.version = 0x00010002,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sm8350_regdma = {
-	.base = 0x400,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
-static const struct dpu_reg_dma_cfg sm8450_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
 /*************************************************************
  * PERF data config
  *************************************************************/
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..8d62c21b051a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -720,21 +720,6 @@ struct dpu_vbif_cfg {
 	u32 memtype_count;
 	u32 memtype[MAX_XIN_COUNT];
 };
-/**
- * struct dpu_reg_dma_cfg - information of lut dma blocks
- * @id                 enum identifying this block
- * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- * @version            version of lutdma hw block
- * @trigger_sel_off    offset to trigger select registers of lutdma
- */
-struct dpu_reg_dma_cfg {
-	DPU_HW_BLK_INFO;
-	u32 version;
-	u32 trigger_sel_off;
-	u32 xin_id;
-	enum dpu_clk_ctrl_type clk_ctrl;
-};
 
 /**
  * Define CDP use cases
@@ -850,9 +835,6 @@ struct dpu_mdss_cfg {
 	u32 wb_count;
 	const struct dpu_wb_cfg *wb;
 
-	u32 reg_dma_count;
-	const struct dpu_reg_dma_cfg *dma_cfg;
-
 	u32 ad_count;
 
 	u32 dspp_count;
-- 
2.39.2

