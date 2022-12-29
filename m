Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF9E659125
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A9110E3ED;
	Thu, 29 Dec 2022 19:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2445810E272
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id 1so28744627lfz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LZmu3PsO0HH3GCV1yXoWDeO4k2IVXu2c3QC4gCZ24o=;
 b=bkavPEa/PJ2u6z3gA4Yg2YHRGfhBKSqGV/VkJ0tt79AwZFjSt/cRji4FpOEoxVn2yV
 cVK1FvvFGXOUvtGO9r3rPHsDNFORBNoiWU5cCHRpajk1nLy+aAQmgaeT2zPS0/IJgSaR
 7vpG37OtQPxJK43vCx7GFaogcZWNn5+HwTOEeMI+11A/BMHSnLtZLPDmvX6cjAuMgPKl
 l739Zs+rVBuoeWiiAF2MLqk8sYIcegCcGsWaR4KTM2R2X6V6J8VKhreLYtPBkJLUXI5Y
 7d//UqKrSvMrOvjphnToTKD8tzH1nuXqXFSP970qmqWMnjT1/CxMfYJGEQwCH62q/+Zd
 impw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LZmu3PsO0HH3GCV1yXoWDeO4k2IVXu2c3QC4gCZ24o=;
 b=70u0yEO5diBxr5EFMVS6kThxgv74WHpWtDWnu0fpzrepNcVuKurWzwxeS3JqOzDaVq
 HUSJDS96zMIa8iaipYGW/yPZhe3BROlYQWC/nYytu6zx2wNVHfGlJLqpEFI7r2cBjzfo
 zCoYP+ii9ARlbjhBOnNNJqjjrjbw1Qs/S9gOj8rilyjew5RHPVBdrUFBgqOhqJhQsr+z
 ZO89H7iF259y3k8lWrSX/GM6ryBUPB2yzME/ALfPvLN1hGZcxYsiJ9114VZUEHgWwxn1
 CbHV2XjRPV00nRdVjYB+jjtmwJwWp0xZ8nDBasTIqTe6NiHhalnCfbgZtkOWflNmIHAG
 3r5w==
X-Gm-Message-State: AFqh2kpWcak51tslWenc3ZRJNTzaaMQfdS3f1Uws9vo+S+bjeAHIPMt7
 K5AL4X66V9zo/ZIungfa4rYJPw==
X-Google-Smtp-Source: AMrXdXsEHh63ahL87U8v6cnf6fdqiGS3VBWO8+4uFG/l8FoPVE6JHmfLhpHEKQFhkgoY3/94P/naGw==
X-Received: by 2002:a05:6512:b19:b0:4ca:eebd:3bd2 with SMTP id
 w25-20020a0565120b1900b004caeebd3bd2mr8320321lfu.45.1672341559708; 
 Thu, 29 Dec 2022 11:19:19 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 22/27] drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
Date: Thu, 29 Dec 2022 21:18:51 +0200
Message-Id: <20221229191856.3508092-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
separate function dpu_plane_sspp_update_pipe(). This is one of
preparational steps to add r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 113 ++++++++++++----------
 1 file changed, 63 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3d0c5a36a7dc..b80c5adf91d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -404,12 +404,13 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
  * @pipe:		Pointer to software pipe
- * @crtc:		Pointer to drm crtc
  * @pipe_cfg:		Pointer to pipe configuration
+ * @frame_rate:		CRTC's frame rate
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
-		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		int frame_rate)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -421,7 +422,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
-	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
+	ot_params.frame_rate = frame_rate;
 	ot_params.vbif_idx = VBIF_RT;
 	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
@@ -457,26 +458,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
 }
 
-static void _dpu_plane_set_scanout(struct drm_plane *plane,
-		struct dpu_plane_state *pstate,
-		struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
-	}
-}
-
 static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
@@ -1102,35 +1083,25 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error)
 	pdpu->is_error = error;
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
+				       struct dpu_sw_pipe *pipe,
+				       struct dpu_hw_pipe_cfg *pipe_cfg,
+				       const struct dpu_format *fmt,
+				       int frame_rate,
+				       struct dpu_hw_fmt_layout *layout)
 {
 	uint32_t src_flags;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
-	bool is_rt_pipe;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 
-	_dpu_plane_set_scanout(plane, pstate, fb);
-
-	pstate->pending = true;
-
-	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
-	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
-	pdpu->is_rt_pipe = is_rt_pipe;
+	if (layout && pipe->sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pipe, layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
+	}
 
 	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
-	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
-			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1183,22 +1154,64 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
 
-	if (pstate->needs_qos_remap) {
-		pstate->needs_qos_remap = false;
+	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-	}
+}
+
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct drm_plane_state *state = plane->state;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_framebuffer *fb = state->fb;
+	bool is_rt_pipe;
+	const struct dpu_format *fmt =
+		to_dpu_format(msm_framebuffer_format(fb));
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	struct dpu_hw_fmt_layout layout;
+	bool layout_valid = false;
+	int ret;
+
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
+	if (ret)
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+	else
+		layout_valid = true;
+
+	pstate->pending = true;
+
+	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
+	pdpu->is_rt_pipe = is_rt_pipe;
+
+	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
+			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+			crtc->base.id, DRM_RECT_ARG(&state->dst),
+			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+
+	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
+				   drm_mode_vrefresh(&crtc->mode),
+				   layout_valid ? &layout: NULL);
+
+	if (pstate->needs_qos_remap)
+		pstate->needs_qos_remap = false;
 
-	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pstate->pipe_cfg);
+	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, pipe_cfg);
 
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.39.0

