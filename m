Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A8A3F883
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADE610EA9D;
	Fri, 21 Feb 2025 15:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EOudpRvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE97B10EAB7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:26 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abb4944fa73so32020566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151525; x=1740756325; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q69oZPCB6rbOMMMtdAc8AoYHq6LgBDpmSS+tha9+ZHM=;
 b=EOudpRvoO8g+S9zdLV/bHI74Zn9mxVL2xIUt4jFBc8iNwYO0HIolzarVX/wqdicXt6
 gl51cLj/gAGnZ0Es4ZIXSrMAfKBMIxup/fvwYM7monymjgkjjciqQHAzcxYBL3hhhAoX
 xWRFnX/3szs2HLlMquC2VR5+WQY7WNQQQIOwJh0vrqW+VQgxpyYyv5X/PUdUPXcCBAY5
 CUp1bd4UWpzyqGjhoSwR90k9HKHeBGyZHp9VSKSnWxrauKYp3ZWrE8htPOZ7HJxmjjCN
 56J3R2Hqld5eEkANbBMXj81UxoRdwSYujAHVhA/NCIpHLOd8dRHZjwF9o/cdB8SazVhP
 Ho5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151525; x=1740756325;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q69oZPCB6rbOMMMtdAc8AoYHq6LgBDpmSS+tha9+ZHM=;
 b=dufARTypxrfznXG+SfLMYzpZhdEEL1NW9B5inNRotxZTlzyDxxDOQhiY10mPm3CeBZ
 NCNrDBO/xUZW3uZKxnti8nwl5l+vzp3BA8ykKtvnpGwNwI7pVZiy+53P051wRLG6EBZV
 K7ZG+seu/hvaKGWKI3sw5SeCxrJ62gYfh3gutV46r0VjUlInLOVU+uzV4FmMvPgxN+de
 zdDRP9Fhg6WMYKDCBMPCYLMolFaIqqH6q/2YOwlA/ioEGP0sfNuX/ROTOquQmQvy0BaB
 NowGYVGy6TZ2baeJNuXlBtZk6UZ5s7VW39GE1snGih/5e/nMY+jR1ATyl2dLy2nNaywd
 staQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeQNwwD8KofJnLbXQ2h1Fxy72n1nvcXE7cFB17m2BPK4DcX0h+J1/YI8DkwhpmUMSSDBbV/VogiJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjHXlR7JsOEuN+WToyCvRy8B4eyDRVJf3QSlmDkAkRthID0WMt
 99CgrrFafDxOD7lvSjyMZ6WWgh3i9ScoFTNQZE0AEAVXkkHdYzgehdqedmlW8C4=
X-Gm-Gg: ASbGncufTAsobkIQhSU+B8K05jasPBx6tvoMyvXhDEbnGbiqFnyRuG1NG3TtNncT8k7
 sdKSxpkkSZqvVVrj/sMIL9MdMyZlVBo81C2ApwQ2Qum8E4JqzomqfeAxrQ6vkGTqlYQxuzOe0/U
 Ma4Il4SBVkWXK2vRuzsKufNdd9iAkk17O4Xw5kqZAdLlBD720ozbhJVuzhP3RtSbRvDmSR66aEJ
 Vcl/aUs6gBHA63J4BQfrxH/iYrBTrKvQvpL7RjiVCRMBd8i0W766JX0/Si0vKOWQTCUkUR3rWKN
 f0RI4UhU+qQ7Rd/lgde/uMpfhTMjj+eBt7GRFQ4ZhHIUYGcQdCCwlKIftJgh6rvNQ7Sxr199ETs
 2
X-Google-Smtp-Source: AGHT+IEfgEUVk5AeL0cR2Kqij5eFm2NE18pv20pVQC7obdk/IDwmD6Jpynuzb8dHNUOgSTskJgW0kw==
X-Received: by 2002:a17:907:9496:b0:a99:a6e0:fa0b with SMTP id
 a640c23a62f3a-abc09a2c929mr151154266b.5.1740151525147; 
 Fri, 21 Feb 2025 07:25:25 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:28 +0100
Subject: [PATCH v3 18/21] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-18-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7483;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i/FODMQhwxbBlhCIaZyHIeOVaGHwHSyiYROFPJEEFYE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq8Cvym97PKIU6g/ay2kUeu659IUl/1AsRQw
 F4MR/4YI/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iavAAKCRDBN2bmhouD
 1zbBD/45+OGbzBG4sDY+nY8bmg0B9dd0wjyyK96MI3PhkMR1yJcLUiI/ukf0E7ZjNgEOnUFbpLG
 +KgL3R/dO9hg7Hnh+A+7l2i2mWBw5LqH0K1pJbVbxHWGZZJCuKu5XcVfZ2xaNyjQqKUYaIWPCK2
 vsBvNcYopWRzdftWOLE9mycZmydWU3EH+JkryBVs+0qD0zULKxdKbQoxZ8xlXKEN7g4hiGx/WvP
 fVhPlWuwnrZDSydlQZko3p4Wm6IVqSlPibL6b2joEYePsWL1ddLjVj3zmrr21FRTHjmSHD9cGE+
 BUcuDafusJPdm4LKb+oc7A+mf6zsy0H9U360M+xaxleglQ3VupH94J1CYFurQq9Ufmt2VL7G2/7
 7bU9IVgcMBfpJWDUU+R0MNe6nZIQmDaxfPcCCKwbFhEgKlnXt8V/s5c3bgu81qXexAYpjEPijc0
 ybkVbfnYP2pVOW+05uCeGRmPqFZUY+KmuCmZIb7PZeLyv4oUmv8a5xu0G6S4kq2vnH2Guh437XE
 nvZ4fCdTyHV9lLBwbnIHQeuctoOi0qi5FudpuIz21N5XZn2keJMvS795gCaQHk3kWgLjFrjNgXR
 LVwz40rEre96opVxxLacSIucHnr5GA53R6VBi676iXinN21vZF+bY7Uy643dP2kd1vegiyeIMIN
 2UAsIEvJ12DUbpg==
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
differences and new implementations of setup_alpha_out,
setup_border_color and so one for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 20 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b9fe3a7343d54f6f8b5aad7982928d5fc728bd61..7a35939ece180c15898b2eaa2f1f451767c741ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -319,15 +319,21 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return true;
 }
 
-static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, const struct msm_format *format)
+static void _dpu_crtc_setup_blend_cfg(const struct dpu_hw_ctl *ctl,
+				      struct dpu_crtc_mixer *mixer,
+				      struct dpu_plane_state *pstate,
+				      const struct msm_format *format)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	uint32_t fg_alpha, bg_alpha, max_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
-	bg_alpha = 0xff - fg_alpha;
+	if (ctl->mdss_ver->core_major_ver < 12)
+		max_alpha = 0xff;
+	else
+		max_alpha = 0x3ff;
+	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
@@ -337,7 +343,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -348,7 +354,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
@@ -482,7 +488,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
+			_dpu_crtc_setup_blend_cfg(ctl, mixer + lm_idx, pstate, format);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..75bf3521b03c8e243ccfe1fc226aa71f23b296df 100644
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
+#define LM_BORDER_COLOR_0_V12		0x1C
+#define LM_BORDER_COLOR_1_V12		0x20
+
+/* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_CONST_ALPHA_V12	0x08
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
2.43.0

