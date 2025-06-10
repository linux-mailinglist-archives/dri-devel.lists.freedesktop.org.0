Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC8AD3A64
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1964910E58B;
	Tue, 10 Jun 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wxJGV1Hj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B4D10E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-450ddb35583so3185155e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564399; x=1750169199; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n82J7xKXmpUjRKj7zBCcVyEW4JwAUsZ8BkHyrQ3/GMg=;
 b=wxJGV1HjJab38U7bnAeBHEG7RWJPHCHJeYnR1Af0aQXMdJ117pTfFKPpwLeeJtMXP1
 V+84Vw7a1HnaeK3gRD/9gyzPNyk4jtwo4K/g/wTpE/ZXoFneUkDaOuiCUWrfc+zVG378
 RwS4b0kCmoTw6eqwZotvK6fXAPV+HzBI8HcpUbv2Is6XtpcA1eHKw+nnobyG46bK2uXY
 3/3NIxnAE0ALdz/Lsghut9IieoClwW1X71EF5by1Vg4N2r2Qvo6pG2Akv/aMlUfBEP8x
 Db+bYYJDlU/V6UvK5zJKd2jHy/XFSckq5b5lz0kbD5VBwN3LDxwfgx0fLxuCOPXkvgPQ
 HvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564399; x=1750169199;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n82J7xKXmpUjRKj7zBCcVyEW4JwAUsZ8BkHyrQ3/GMg=;
 b=gXx2y0Ah4VKII3Xkos2ZIp00zsFYcdHmw+VPExxh4+hF8ydPOOIfu/dk7e1MnFd6pl
 u82SSR4JBNvWqcIL7HnfFv5VFjeK1yAbMjcfkLU5dJJWyBqaUKSdMEVoFnVBMvS+xOXo
 +7wo1RAxdPZYF/VLPxLKsyRkc1JZ7XAB9cYIcWS1Dk6ryZBPSq6uCq/fvm4VwC1Et/I2
 lV/gjsdUoknzbpM7nvoqmuah9849Z2QmwPDKxaNRhiSbWgO2SL4ijroMKwM1/Ssk7a0X
 HTmAcmcMrPBQr4t/4tFk0RPDt44Okxyld32SZs5tkua0vPf+TsBhAXN5Es9kjRDmqkKA
 ilnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWusMoEtnW/LKIOxVC8Dqgd+2T21/r/IZd76fnEbqk2JkgVbOkHh9XOcdnNV4DkWqBgOTkrFPcQyKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe7IKA7ifROsgi/RPpwTxKBbAx0iPFe8rf0W0Ew6ci49r/E1kJ
 uurUMt4K+And8pndEl2FPNkh8lyELaU+fv1OjdSY/yel8S1figsTh7y6LbvYMP6+udU=
X-Gm-Gg: ASbGnctyQpEgzbOyTpOQWd7PoQxY0Fb/YiIcO0HzpA91EUbxawbALZQnwfG9IBKhuFX
 GatN6fD3fp7tLgxKvrKRF3H7RNcCojh2i2l03ck71/3Ir28eeLNnDLKJto0bG0+uPbnwrGY74R2
 EBi0WyegHGYe6mRgN3N0Q3Uu/glddBL1xVRNYmwUKdoujJyc6uGHi7sfCfAekIn2zJhhcLs415M
 1yqjjz1OAzhLue+FvxZXY4qV9GSth/2umK0cXxHekRXhbrdzQrAjOYsNc87DBvCtS39oAWqQ2HR
 SCkIJoStk1aD6yLNCfANtwvVRSrB9tylGflKEQBR8SZCWWW43FgI6YoWT+L+Zfz6Y8/8Hqf531p
 9Afx5Wg==
X-Google-Smtp-Source: AGHT+IG/dBTylLygyD2mPbuxdE/ELraLT0KX1851OeZv3cweWndw3S/3EbupdYYae7LTZf5icINklg==
X-Received: by 2002:a05:600c:1e02:b0:439:88bb:d00b with SMTP id
 5b1f17b1804b1-4529abc31c1mr59950945e9.5.1749564399005; 
 Tue, 10 Jun 2025 07:06:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:52 +0200
Subject: [PATCH v6 14/17] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-14-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7947;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=B37GRMruOX+ZSyC96p19lfWnZVPySg5VUvTqpflIprM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvL7xck0GNYEedf7be2lVr7C90maScpLeaRp
 XR4GjkJK1yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7ywAKCRDBN2bmhouD
 12gEEACEHHrURLT7ce5ukBw9rVKVSFrrkZt53yHh19ZSi1KTTidp07cRCb6eeHzUR+vH6PXhuRf
 jeMRljCTZxREf0yuBAsE015l/M/HmvCG8HyWVqnuZ5HN6aMpjBc/XXW+tIvquI3uuz9wvCiCHED
 2jkG2XFu5pkRzADKBgOzF82FoV9AbaTFh1tCcv3tgKx9qoJyavtkhwI1rdwR7Iu70SdJpmK0n13
 H+w4potU8b1pGuvfHTFGbcQvfZZpQeKNMvVanVCUPJWDNVfQk4mK+LENGVYMGcp7j1d+Juxil+w
 477KkhIq8Xv9KSE7Hlaf4IbW5t3hCRWlqXrH6dQjLt2Sjr7yH4a+M7bLieN06lj/9uh+LzCnl0h
 9DACq86Aw1Cm4/vU/7rJ3F6Mr/npccB+utjxzhKjpGENjebIInqLCOLRXaWun4pQ7XF9pxqsXnb
 1F8N7eU9oOX3XxF3ALtjH2cRvu+LiQC5cAjI0Cd7e8tmW5HrkttMhmNBxj7EF4DpKbc7pgfZWqs
 yeCkuJunafQzktagMr9+0iNFbEDxZPMQch8pF0g0rUxkFRaMCsuz2Oyb0GTr2lb5GBB2aMRdLjl
 zDU9wL6t9G4Au0j9bslgnhYvKzDiWNtPj6I7k9VG/AeJ5vKjd+rHTUyFytCkFrGCpfZu/R6DDip
 P4L1S9YifI2YAqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
differences and new implementations of setup_alpha_out(),
setup_border_color() and setup_blend_config().

Notable changes in v6:
Correct fg_alpha shift on new DPU, pointed out by Abel Vesas.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
1. Checkpatch: CHECK: Prefer kernel type 'u32' over 'uint32_t'
2. Fix for fg_alpha shift (Abel Vesa).

Changes in v4:
1. Lowercase hex, use spaces for define indentation
2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 23 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
 2 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 92f6c39eee3dc090bd957239e58793e5b0437548..5e986640c8ce5b49d0ce2f91cc47f677a2e3f061 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -320,14 +320,22 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 }
 
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, const struct msm_format *format)
+				      struct dpu_plane_state *pstate,
+				      const struct msm_format *format,
+				      const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	u32 blend_op;
-	u32 fg_alpha, bg_alpha;
+	u32 fg_alpha, bg_alpha, max_alpha;
 
-	fg_alpha = pstate->base.alpha >> 8;
-	bg_alpha = 0xff - fg_alpha;
+	if (mdss_ver->core_major_ver < 12) {
+		max_alpha = 0xff;
+		fg_alpha = pstate->base.alpha >> 8;
+	} else {
+		max_alpha = 0x3ff;
+		fg_alpha = pstate->base.alpha >> 6;
+	}
+	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
@@ -337,7 +345,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -348,7 +356,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
@@ -481,7 +489,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format,
+						  ctl->mdss_ver);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..f220a68e138cb9e7c88194e53e47391de7ed04f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -19,12 +19,20 @@
 
 /* These register are offset to mixer base + stage base */
 #define LM_BLEND0_OP                     0x00
+
+/* <v12 DPU with offset to mixer base + stage base */
 #define LM_BLEND0_CONST_ALPHA            0x04
 #define LM_FG_COLOR_FILL_COLOR_0         0x08
 #define LM_FG_COLOR_FILL_COLOR_1         0x0C
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
+/* >= v12 DPU */
+#define LM_BORDER_COLOR_0_V12            0x1c
+#define LM_BORDER_COLOR_1_V12            0x20
+
+/* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_CONST_ALPHA_V12        0x08
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
@@ -83,6 +91,22 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static void dpu_hw_lm_setup_border_color_v12(struct dpu_hw_mixer *ctx,
+					     struct dpu_mdss_color *color,
+					     u8 border_en)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+
+	if (border_en) {
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_0_V12,
+			      (color->color_0 & 0x3ff) |
+			      ((color->color_1 & 0x3ff) << 16));
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_1_V12,
+			      (color->color_2 & 0x3ff) |
+			      ((color->color_3 & 0x3ff) << 16));
+	}
+}
+
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
 	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
@@ -112,6 +136,27 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
+static void
+dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
+						u32 stage, u32 fg_alpha,
+						u32 bg_alpha, u32 blend_op)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int stage_off;
+	u32 const_alpha;
+
+	if (stage == DPU_STAGE_BASE)
+		return;
+
+	stage_off = _stage_offset(ctx, stage);
+	if (WARN_ON(stage_off < 0))
+		return;
+
+	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
+}
+
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
@@ -144,6 +189,32 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
+static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
+				       uint32_t mixer_op_mode)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int op_mode, stages, stage_off, i;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return;
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (WARN_ON(stage_off < 0))
+			return;
+
+		/* set color_out3 bit in blend0_op when enabled in mixer_op_mode */
+		op_mode = DPU_REG_READ(c, LM_BLEND0_OP + stage_off);
+		if (mixer_op_mode & BIT(i))
+			op_mode |= BIT(30);
+		else
+			op_mode &= ~BIT(30);
+
+		DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, op_mode);
+	}
+}
+
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (mdss_ver->core_major_ver >= 4)
+	if (mdss_ver->core_major_ver >= 12)
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
+	else if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
-	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
-	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	} else {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
+	}
 	c->ops.setup_misr = dpu_hw_lm_setup_misr;
 	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 

-- 
2.45.2

