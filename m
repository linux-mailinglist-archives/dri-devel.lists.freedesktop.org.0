Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BB06F2ADC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6FD10E0AA;
	Sun, 30 Apr 2023 20:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603E210E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:20 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so19642533e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888238; x=1685480238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3S0mBFXgQeb+45KEUrQBsgApSVoR4gMq1gusKliQtrU=;
 b=EngVTkbPDXWWjYu3UiOW5zmeJsXbV4VBA8QS0KF11dkRjp/p8M0zOpQtSx1gDwyQgv
 KqbJR4e3als7gwHllTvLqCegFv+s2gltMv1Ta/dQSF+FboIjXZcASIBQsMk4Uz4WkDHq
 4r0Z13uUO6z8WYK+qCxqQ4CnzaetjfZrwsRv/JGoJVEL5SuqF558dH9Tcf/mVlBshuSl
 15Z0kTJQv2hkpQa/7aCxMHn7aao0/Mq9/OQ+YJizDdvrAyVR/8VmTg095VXw7t5IDpIe
 aCSDrPk1F/q523KER64i0NCN/lEpj0+mf+uSBB7egwS9/rMSZoKv100krlJVqTuPYVtR
 zWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888238; x=1685480238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3S0mBFXgQeb+45KEUrQBsgApSVoR4gMq1gusKliQtrU=;
 b=RfyOK8RVhozGD3yNxXYsVUUOrRgYQzqLYkn4t8nYMSqcq19rNDasJZJLLNIuNGuSxB
 EZQLZJ6QH8GEWmZpHrNszNp8qEJ8qgekdirgwNETBm/9JEQMzm7WJZJg6A/Q0KKDPjnU
 rcyUopP2qJ6D8aK8rOYz+2ipvi2Lievqjwq7c2mqVUiAmC+g7zwCMkE7ppTgDN6e8+PS
 r4ck0x9UvTD0Km+weYXGzlvk0eu2cUfUY0N/FDxETuyRd6O9AIXeon/WkIBDEhA80f6u
 sPfM8irZvZemiYO2xZH+6oQZUJBr+PyVzS8GCsMn1VBzMeW1k1VLFQGK3jy0Mwc43qk6
 q1Ww==
X-Gm-Message-State: AC+VfDylSn5SxoDSheuubBhogCMD6kP7QZltJvJv+x7pwKwusrHUypKF
 qtQ2fiXjW99IejnM83LDJ2T48g==
X-Google-Smtp-Source: ACHHUZ7jqvftkEYu6K/U8TUXr1Jpd6PbgHPo5b4Cm1P66YT3gq2jsSXdeS+ksjRGGFgMwwMvJzkMjA==
X-Received: by 2002:a05:6512:39c8:b0:4eb:1599:f3b7 with SMTP id
 k8-20020a05651239c800b004eb1599f3b7mr4557039lfu.13.1682888238526; 
 Sun, 30 Apr 2023 13:57:18 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 9/9] drm/msm/dpu: use common helper for WB and SSPP QoS setup
Date: Sun, 30 Apr 2023 23:57:10 +0300
Message-Id: <20230430205710.3188230-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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

Rework SSPP and WB code to use common helper for programming QoS
settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 31 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 19 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 31 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 21 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 29 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 16 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 84 +++++++------------
 8 files changed, 100 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 120141f1e5c5..f879d006de21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -102,7 +102,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
-	struct dpu_hw_wb_qos_cfg qos_cfg;
+	struct dpu_hw_qos_cfg qos_cfg;
 	const struct dpu_mdss_cfg *catalog;
 	const struct dpu_qos_lut_tbl *qos_lut_tb;
 
@@ -115,7 +115,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 
 	hw_wb = phys_enc->hw_wb;
 
-	memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
+	memset(&qos_cfg, 0, sizeof(struct dpu_hw_qos_cfg));
 	qos_cfg.danger_safe_en = true;
 	qos_cfg.danger_lut =
 		catalog->perf->danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 2533c4629021..c35e9faf2460 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -541,30 +541,15 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 				color);
 }
 
-static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
-			u32 danger_lut,
-			u32 safe_lut)
+static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
+				      struct dpu_hw_qos_cfg *cfg)
 {
-	if (!ctx)
-		return;
-
-	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT, danger_lut);
-	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT, safe_lut);
-}
-
-static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
-			u64 creq_lut)
-{
-	if (!ctx)
+	if (!ctx || !cfg)
 		return;
 
-	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0, creq_lut);
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1,
-				creq_lut >> 32);
-	} else {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT, creq_lut);
-	}
+	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
+			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      cfg);
 }
 
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
@@ -606,9 +591,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
 
 	if (test_bit(DPU_SSPP_QOS, &features)) {
-		c->ops.setup_danger_safe_lut =
-			dpu_hw_sspp_setup_danger_safe_lut;
-		c->ops.setup_creq_lut = dpu_hw_sspp_setup_creq_lut;
+		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
 		c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4278c421b6ac..085f34bc6b88 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -254,25 +254,14 @@ struct dpu_hw_sspp_ops {
 	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_sharp_cfg *cfg);
 
-	/**
-	 * setup_danger_safe_lut - setup danger safe LUTs
-	 * @ctx: Pointer to pipe context
-	 * @danger_lut: LUT for generate danger level based on fill level
-	 * @safe_lut: LUT for generate safe level based on fill level
-	 *
-	 */
-	void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
-			u32 danger_lut,
-			u32 safe_lut);
 
 	/**
-	 * setup_creq_lut - setup CREQ LUT
+	 * setup_qos_lut - setup QoS LUTs
 	 * @ctx: Pointer to pipe context
-	 * @creq_lut: LUT for generate creq level based on fill level
-	 *
+	 * @cfg: LUT configuration
 	 */
-	void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
-			u64 creq_lut);
+	void (*setup_qos_lut)(struct dpu_hw_sspp *ctx,
+			struct dpu_hw_qos_cfg *cfg);
 
 	/**
 	 * setup_qos_ctrl - setup QoS control
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 95d20b9a3f2f..9d2273fd2fed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -73,6 +73,19 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
 #define QSEED3LITE_SEP_LUT_SIZE \
 	        (QSEED3LITE_LUT_SIZE * QSEED3LITE_SEPARABLE_LUTS * sizeof(u32))
 
+/* QOS_LUT */
+#define QOS_DANGER_LUT                    0x00
+#define QOS_SAFE_LUT                      0x04
+#define QOS_CREQ_LUT                      0x08
+#define QOS_QOS_CTRL                      0x0C
+#define QOS_CREQ_LUT_0                    0x14
+#define QOS_CREQ_LUT_1                    0x18
+
+/* QOS_QOS_CTRL */
+#define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
+#define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
+#define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
+#define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
 
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
 		u32 reg_off,
@@ -450,6 +463,24 @@ u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 	return 0;
 }
 
+void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
+			   bool qos_8lvl,
+			   const struct dpu_hw_qos_cfg *cfg)
+{
+	DPU_REG_WRITE(c, offset + QOS_DANGER_LUT, cfg->danger_lut);
+	DPU_REG_WRITE(c, offset + QOS_SAFE_LUT, cfg->safe_lut);
+
+	if (qos_8lvl) {
+		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT_0, cfg->creq_lut);
+		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT_1, cfg->creq_lut >> 32);
+	} else {
+		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT, cfg->creq_lut);
+	}
+
+	DPU_REG_WRITE(c, offset + QOS_QOS_CTRL,
+		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,
 		bool enable, u32 frame_count)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index dc6e3b795aef..1f6079f47071 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -305,6 +305,23 @@ struct dpu_drm_scaler_v2 {
 	struct dpu_drm_de_v1 de;
 };
 
+/**
+ * struct dpu_hw_qos_cfg: pipe QoS configuration
+ * @danger_lut: LUT for generate danger level based on fill level
+ * @safe_lut: LUT for generate safe level based on fill level
+ * @creq_lut: LUT for generate creq level based on fill level
+ * @creq_vblank: creq value generated to vbif during vertical blanking
+ * @danger_vblank: danger value generated during vertical blanking
+ * @vblank_en: enable creq_vblank and danger_vblank during vblank
+ * @danger_safe_en: enable danger safe generation
+ */
+struct dpu_hw_qos_cfg {
+	u32 danger_lut;
+	u32 safe_lut;
+	u64 creq_lut;
+	bool danger_safe_en;
+};
+
 u32 *dpu_hw_util_get_log_mask_ptr(void);
 
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
@@ -336,6 +353,10 @@ void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
 
+void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
+			   bool qos_8lvl,
+			   const struct dpu_hw_qos_cfg *cfg);
+
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,
 		bool enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index a6de4b82a188..dcffd6cc47fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -49,9 +49,6 @@
 #define WB_OUT_IMAGE_SIZE                     0x2C0
 #define WB_OUT_XY                             0x2C4
 
-/* WB_QOS_CTRL */
-#define WB_QOS_CTRL_DANGER_SAFE_EN            BIT(0)
-
 static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
 		struct dpu_hw_wb_cfg *data)
 {
@@ -135,32 +132,14 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
 }
 
 static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
-		struct dpu_hw_wb_qos_cfg *cfg)
+		struct dpu_hw_qos_cfg *cfg)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 qos_ctrl = 0;
-
 	if (!ctx || !cfg)
 		return;
 
-	DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
-	DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
-
-	/*
-	 * for chipsets not using DPU_WB_QOS_8LVL but still using DPU
-	 * driver such as msm8998, the reset value of WB_CREQ_LUT is
-	 * sufficient for writeback to work. SW doesn't need to explicitly
-	 * program a value.
-	 */
-	if (ctx->caps && test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features)) {
-		DPU_REG_WRITE(c, WB_CREQ_LUT_0, cfg->creq_lut);
-		DPU_REG_WRITE(c, WB_CREQ_LUT_1, cfg->creq_lut >> 32);
-	}
-
-	if (cfg->danger_safe_en)
-		qos_ctrl |= WB_QOS_CTRL_DANGER_SAFE_EN;
-
-	DPU_REG_WRITE(c, WB_QOS_CTRL, qos_ctrl);
+	_dpu_hw_setup_qos_lut(&ctx->hw, WB_DANGER_LUT,
+			      test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features),
+			      cfg);
 }
 
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index ab3541856258..c7f792eeb55c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -21,20 +21,6 @@ struct dpu_hw_wb_cfg {
 	struct drm_rect crop;
 };
 
-/**
- * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
- * @danger_lut: LUT for generate danger level based on fill level
- * @safe_lut: LUT for generate safe level based on fill level
- * @creq_lut: LUT for generate creq level based on fill level
- * @danger_safe_en: enable danger safe generation
- */
-struct dpu_hw_wb_qos_cfg {
-	u32 danger_lut;
-	u32 safe_lut;
-	u64 creq_lut;
-	bool danger_safe_en;
-};
-
 /**
  *
  * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
@@ -56,7 +42,7 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_cfg *wb);
 
 	void (*setup_qos_lut)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_wb_qos_cfg *cfg);
+			struct dpu_hw_qos_cfg *cfg);
 
 	void (*setup_cdp)(struct dpu_hw_wb *ctx,
 			  const struct dpu_format *fmt,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 75fb2d2796b5..f91b433d5be6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -190,12 +190,14 @@ static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
  * _dpu_plane_calc_fill_level - calculate fill level of the given source format
  * @plane:		Pointer to drm plane
  * @pipe:		Pointer to software pipe
+ * @lut_usage		LUT usecase
  * @fmt:		Pointer to source buffer format
  * @src_width:		width of source buffer
  * Return: fill level corresponding to the source buffer/format or 0 if error
  */
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
+		enum dpu_qos_lut_usage lut_usage,
 		const struct dpu_format *fmt, u32 src_width)
 {
 	struct dpu_plane *pdpu;
@@ -207,6 +209,9 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		return 0;
 	}
 
+	if (lut_usage == DPU_QOS_LUT_USAGE_NRT)
+		return 0;
+
 	pdpu = to_dpu_plane(plane);
 	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
@@ -252,83 +257,58 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		const struct dpu_format *fmt, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	u64 qos_lut;
-	u32 total_fl = 0, lut_usage;
+	struct dpu_hw_qos_cfg cfg;
+	u32 total_fl, lut_usage;
 
 	if (!pdpu->is_rt_pipe) {
 		lut_usage = DPU_QOS_LUT_USAGE_NRT;
 	} else {
-		total_fl = _dpu_plane_calc_fill_level(plane, pipe, fmt,
-				drm_rect_width(&pipe_cfg->src_rect));
-
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
 		else
 			lut_usage = DPU_QOS_LUT_USAGE_MACROTILE;
 	}
 
-	qos_lut = _dpu_hw_get_qos_lut(
-			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
+	total_fl = _dpu_plane_calc_fill_level(plane, pipe, lut_usage, fmt,
+				drm_rect_width(&pipe_cfg->src_rect));
+
+	cfg.creq_lut = _dpu_hw_get_qos_lut(&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
+	cfg.danger_lut = pdpu->catalog->perf->danger_lut_tbl[lut_usage];
+	cfg.safe_lut = pdpu->catalog->perf->safe_lut_tbl[lut_usage];
+
+	if (pipe->sspp->idx != SSPP_CURSOR0 &&
+	    pipe->sspp->idx != SSPP_CURSOR1 &&
+	    !pdpu->is_rt_pipe)
+		cfg.danger_safe_en = true;
+
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
+		pdpu->pipe - SSPP_VIG0,
+		cfg.danger_safe_en,
+		pdpu->is_rt_pipe);
 
 	trace_dpu_perf_set_qos_luts(pipe->sspp->idx - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
-			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
+			pdpu->is_rt_pipe, total_fl, cfg.creq_lut, lut_usage);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
 			pdpu->pipe - SSPP_VIG0,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
-			pdpu->is_rt_pipe, total_fl, qos_lut);
-
-	pipe->sspp->ops.setup_creq_lut(pipe->sspp, qos_lut);
-}
-
-/**
- * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
- * @plane:		Pointer to drm plane
- * @pipe:		Pointer to software pipe
- * @fmt:		Pointer to source buffer format
- */
-static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
-		struct dpu_sw_pipe *pipe,
-		const struct dpu_format *fmt)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	u32 danger_lut, safe_lut;
-
-	if (!pdpu->is_rt_pipe) {
-		danger_lut = pdpu->catalog->perf->danger_lut_tbl
-				[DPU_QOS_LUT_USAGE_NRT];
-		safe_lut = pdpu->catalog->perf->safe_lut_tbl
-				[DPU_QOS_LUT_USAGE_NRT];
-	} else {
-		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
-			danger_lut = pdpu->catalog->perf->danger_lut_tbl
-					[DPU_QOS_LUT_USAGE_LINEAR];
-			safe_lut = pdpu->catalog->perf->safe_lut_tbl
-					[DPU_QOS_LUT_USAGE_LINEAR];
-		} else {
-			danger_lut = pdpu->catalog->perf->danger_lut_tbl
-					[DPU_QOS_LUT_USAGE_MACROTILE];
-			safe_lut = pdpu->catalog->perf->safe_lut_tbl
-					[DPU_QOS_LUT_USAGE_MACROTILE];
-		}
-	}
+			pdpu->is_rt_pipe, total_fl, cfg.creq_lut);
 
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			(fmt) ? fmt->fetch_mode : 0,
-			danger_lut,
-			safe_lut);
+			cfg.danger_lut,
+			cfg.safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
 		pdpu->pipe - SSPP_VIG0,
 		fmt ? (char *)&fmt->base.pixel_format : NULL,
 		fmt ? fmt->fetch_mode : -1,
-		danger_lut,
-		safe_lut);
+		cfg.danger_lut,
+		cfg.safe_lut);
 
-	pipe->sspp->ops.setup_danger_safe_lut(pipe->sspp,
-			danger_lut, safe_lut);
+	pipe->sspp->ops.setup_qos_lut(pipe->sspp, &cfg);
 }
 
 /**
@@ -1084,10 +1064,6 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	}
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
-	_dpu_plane_set_danger_lut(plane, pipe, fmt);
-	_dpu_plane_set_qos_ctrl(plane, pipe,
-				pipe->sspp->idx != SSPP_CURSOR0 &&
-				pipe->sspp->idx != SSPP_CURSOR1);
 
 	if (pipe->sspp->idx == SSPP_CURSOR0 ||
 	    pipe->sspp->idx == SSPP_CURSOR1)
-- 
2.39.2

