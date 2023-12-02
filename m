Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CD801EDD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C55910E22A;
	Sat,  2 Dec 2023 21:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408FE10E229
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50be24167efso1273323e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553226; x=1702158026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaMpbzZxc+EnLx8JXRcnVmGqp4kOvrE+EuHMsxmar1c=;
 b=RTbFwJmbk5EekVuZjQxp9kzmBbTGB7W4Pl6PMS2gK8uFVQTeXhHf2MTerxHCVksqTN
 tcPWgvI3eJ52UU/ON+NVLLGFhRCPOQjlAIIjzSqyRyABZ7xU6d8jl950bbWJAHaoMr6F
 qq9vRj+NGzFYWXr3F59c61Te2u8AsA81gBQTKGh3Cjc6gXUOIyNkTfv7l27dIM67Vc0R
 Emufoe8rAALH2voynvEV3HvlzY4xkKbHBJjvdblLav+o3pc2B7XvolwCbCWu60tVT8QV
 gcBWBvvgtDGyISnb47C8TKTidM26LWESMDi48usOr6jiNZwl2OyOQDYPPtk5n6cjV4/I
 mUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553226; x=1702158026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaMpbzZxc+EnLx8JXRcnVmGqp4kOvrE+EuHMsxmar1c=;
 b=fS9TroGoqGaGO3Fi4eXxnQ1QjJnHIyoWWASJwMWaEpSeqdzPkLFtjDqYZMP3Arbx2s
 mkYVsEgqDiZY7m8q0P06CKKxS7oVWTFNeq8iPb0EITs4uzcxSHZe9/+SREvbodGvEVZ/
 5h6PJ5fUHt5+UAF6cK+2gpUla3oe3PUWFBhpX1hZrIbBgvsAq2PfIRX9UPyoZQZfum0L
 TS0FtQ5WN+5K9SkJG2RYpJVG0rfgqiEid3uHB0u4RdIgS5Ki3yYQGfeM+JuQjtiNFIAB
 fU6d0UJ6IsHMx//txj0iH5XQjATJAvkZy9GJcmBpqNir4tH64M8YbzKCtPX11ET8mJOi
 QEug==
X-Gm-Message-State: AOJu0YxDTtM0VPXO0yMOtK1RBmdRj+dSC0vENJXcnfwyApj1rMjBpjY/
 Cr+00zg3ctqbaqsQ/u6bgDfLQQ==
X-Google-Smtp-Source: AGHT+IEEuiejQvlsxwA3gvKYXcN1JHS488dGugnCJnvL88LuTaQU/tpwA6b9Efsm6M5DUYzgGDPY4w==
X-Received: by 2002:a19:4f01:0:b0:50b:d944:c022 with SMTP id
 d1-20020a194f01000000b0050bd944c022mr435228lfb.228.1701553225768; 
 Sat, 02 Dec 2023 13:40:25 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 10/12] drm/msm: convert msm_format::alpha_enable to the flag
Date: Sun,  3 Dec 2023 00:40:14 +0300
Message-Id: <20231202214016.1257621-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
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

Instead of having a bool field alpha_enable, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 12 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 24 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  7 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  9 ++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 ++-
 drivers/gpu/drm/msm/disp/mdp_format.c       |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
 11 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9041b0d71b25..201010038660 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -342,7 +342,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
-	    !format->alpha_enable) {
+	    !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
@@ -373,8 +373,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	lm->ops.setup_blend_config(lm, pstate->stage,
 				fg_alpha, bg_alpha, blend_op);
 
-	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
-		  &format->pixel_format, format->alpha_enable, blend_op);
+	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%lu blend_op:0x%x\n",
+		  &format->pixel_format, format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE, blend_op);
 }
 
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
@@ -472,7 +472,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		format = msm_framebuffer_format(pstate->base.fb);
 
-		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
+		if (pstate->stage == DPU_STAGE_BASE &&
+		    format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
 			bg_alpha_enable = true;
 
 		set_bit(pstate->pipe.sspp->idx, fetch_active);
@@ -495,7 +496,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
 
-			if (bg_alpha_enable && !format->alpha_enable)
+			if (bg_alpha_enable &&
+			    !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE))
 				mixer[lm_idx].mixer_op_mode = 0;
 			else
 				mixer[lm_idx].mixer_op_mode |=
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index baf0fd67bf42..de9e93cb42c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -36,7 +36,6 @@ bp, flg, fm, np)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -46,7 +45,9 @@ bp, flg, fm, np)                                                          \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -56,7 +57,6 @@ alpha, bp, flg, fm, np, th)                                               \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -66,7 +66,9 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -77,7 +79,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -87,7 +88,9 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -96,7 +99,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -116,7 +118,6 @@ flg, fm, np, th)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -135,7 +136,6 @@ flg, fm, np, th)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -155,7 +155,6 @@ flg, fm, np, th)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -176,7 +175,6 @@ flg, fm, np)                                                      \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -186,7 +184,9 @@ flg, fm, np)                                                      \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index c1ff70d80bdb..4903dd8d6f36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -253,7 +253,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	if (flags & DPU_SSPP_ROT_90)
 		src_format |= BIT(11); /* ROT90 */
 
-	if (fmt->alpha_enable && fmt->fetch_type == MDP_PLANE_INTERLEAVED)
+	if (fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE &&
+	    fmt->fetch_type == MDP_PLANE_INTERLEAVED)
 		src_format |= BIT(8); /* SRCC3_EN */
 
 	if (flags & DPU_SSPP_SOLID_FILL)
@@ -275,14 +276,14 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 			ctx->ubwc->highest_bank_bit << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			fast_clear = fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_2_0:
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			fast_clear = fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 602fc5345573..08c530f9b1cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -370,7 +370,8 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	if (format && !MSM_FORMAT_IS_DX(format))
 		op_mode |= BIT(14);
 
-	if (format && format->alpha_enable) {
+	if (format &&
+	    format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) {
 		op_mode |= BIT(10);
 		if (scaler_version == 0x1002)
 			op_mode |= (scaler3_cfg->alpha_filter_cfg & 0x1) << 30;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 1eadaabc8b25..97967fc623fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -80,9 +80,9 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->bpc_b_cb << 2) |
 		(fmt->bpc_g_y << 0);
 
-	if (fmt->bpc_a || fmt->alpha_enable) {
+	if (fmt->bpc_a || fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) {
 		dst_format |= BIT(8); /* DSTC3_EN */
-		if (!fmt->alpha_enable ||
+		if (!(fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) ||
 			!(ctx->caps->features & BIT(DPU_WB_PIPE_ALPHA)))
 			dst_format |= BIT(14); /* DST_ALPHA_X */
 	}
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index f7bec46c386d..2663c8793ec0 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -184,7 +184,7 @@ static void blend_setup(struct drm_crtc *crtc)
 		if (idx > 0) {
 			const struct msm_format *format =
 					msm_framebuffer_format(plane->state->fb);
-			alpha[idx-1] = format->alpha_enable;
+			alpha[idx-1] = format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE;
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index ef7e525c3bd2..67c22e02f402 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -319,7 +319,8 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 			MDP4_PIPE_SRC_FORMAT_R_BPC(format->bpc_r_cr) |
 			MDP4_PIPE_SRC_FORMAT_G_BPC(format->bpc_g_y) |
 			MDP4_PIPE_SRC_FORMAT_B_BPC(format->bpc_b_cb) |
-			COND(format->alpha_enable, MDP4_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
+			COND(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE,
+			     MDP4_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
 			MDP4_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP4_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
 			MDP4_PIPE_SRC_FORMAT_FETCH_PLANES(format->fetch_type) |
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0f653e62b4a0..0332e66ed3cf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -276,7 +276,7 @@ static void blend_setup(struct drm_crtc *crtc)
 	} else if (plane_cnt) {
 		format = msm_framebuffer_format(pstates[STAGE_BASE]->base.fb);
 
-		if (format->alpha_enable)
+		if (format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
 			bg_alpha_enabled = true;
 	}
 
@@ -292,14 +292,15 @@ static void blend_setup(struct drm_crtc *crtc)
 		fg_alpha = pstates[i]->base.alpha >> 8;
 		bg_alpha = 0xFF - fg_alpha;
 
-		if (!format->alpha_enable && bg_alpha_enabled)
+		if (!(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) &&
+		    bg_alpha_enabled)
 			mixer_op_mode = 0;
 		else
 			mixer_op_mode |= mdp5_lm_use_fg_alpha_mask(i);
 
 		DBG("Stage %d fg_alpha %x bg_alpha %x", i, fg_alpha, bg_alpha);
 
-		if (format->alpha_enable &&
+		if (format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE &&
 		    pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
@@ -311,7 +312,7 @@ static void blend_setup(struct drm_crtc *crtc)
 			} else {
 				blend_op |= MDP5_LM_BLEND_OP_MODE_BG_INV_ALPHA;
 			}
-		} else if (format->alpha_enable &&
+		} else if (format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE &&
 			   pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_PIXEL) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index cc0dc451dc2e..01797f3e6d8f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -798,7 +798,8 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 			MDP5_PIPE_SRC_FORMAT_R_BPC(format->bpc_r_cr) |
 			MDP5_PIPE_SRC_FORMAT_G_BPC(format->bpc_g_y) |
 			MDP5_PIPE_SRC_FORMAT_B_BPC(format->bpc_b_cb) |
-			COND(format->alpha_enable, MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
+			COND(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE,
+			     MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
 			MDP5_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP5_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
 			COND(format->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT,
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index b9f0b13d25d5..fa2a76a35106 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -71,10 +71,10 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 		.element = { e0, e1, e2, e3 },                   \
 		.fetch_type = fp,                                \
 		.chroma_sample = cs,                             \
-		.alpha_enable = alpha,                           \
 		.unpack_count = cnt,                             \
 		.bpp = c,                                        \
 		.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |          \
+			(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0), \
 			(yuv ? MSM_FORMAT_FLAG_YUV : 0),         \
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7ea24d776a50..dea6d47854fe 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -257,6 +257,7 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
 	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
 	MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT,
+	MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
@@ -264,6 +265,7 @@ enum msm_format_flags {
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
+#define MSM_FORMAT_FLAG_ALPHA_ENABLE	BIT(MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -271,7 +273,6 @@ enum msm_format_flags {
  * @element: element color ordering
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
- * @alpha_enable: whether the format has an alpha channel
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
  * @flags: usage bit flags
@@ -286,7 +287,6 @@ struct msm_format {
 	u8 element[4];
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
-	bool alpha_enable;
 	u8 unpack_count;
 	u8 bpp;
 	unsigned long flags;
-- 
2.39.2

