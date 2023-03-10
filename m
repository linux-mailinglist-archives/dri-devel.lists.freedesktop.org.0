Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA94B6B334F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81E10E918;
	Fri, 10 Mar 2023 00:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7810E92E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n2so4582469lfb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRxva6kZfpHjtJDFdSH1zBSRKe11/OGRGIRjJGSi8P4=;
 b=In8dJG8Pj/uPnfB2T29ABN/I1hM2ynRs5TLpzQ2k20xDeto6yN54Qynvx774z6Urcv
 DEBLauKyZRVdIidsg4hAJLhp2Tu7z4TR4UFgY2yUr+r9vhYhzRiE29csHH8GwOSF3/AG
 Ciyyg7y0FMh5X1aWsLavVWymN/n+h9g1ufE3FwCEdjyvExeolS7Q10I2Eu5KOX+3bCB6
 l9WEqFytjM2QUNuwYLUAM731UsvGki/2byvHhrxtAwr9u6l/J0Hk6KpXQcsEEuthbfSq
 DbHNTd05EgrbZTUHYgahMhD5uqQIABvpInL2PdUI6kEN/pBlgA80/yi0ab9gO8yJBn1/
 NhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRxva6kZfpHjtJDFdSH1zBSRKe11/OGRGIRjJGSi8P4=;
 b=TVhdHWCbWMsqU2fy7nuyCJu0S4KjWPw/apkABLrrXYkrC6EfJflgd+uQZzP/J8fiAx
 Nu5R3Mhu+ZlccaG3C7FBc3Im1ldgYK2/jr/VIOn6vS9T9ZBueNVkD7JNn1jpnFAlzEXH
 Y3/vUcvZ/eoqHO/QmI7sKnb8lFYS61+Yaw0QRaHXIDVeZvYR66nCBQ/AFCndCZOAHsLR
 Fe5Ynq9wBP0i/UN9RijqUssWYzyN/yOnfNw2SjGZ95Hxbk68yG56b9xJEPKF59wJh/ha
 iuarIXUARItNx8Du5bVKEEmwymr9QA5hh4lZ1yS4TGqmQwg/yqUUe8HWzunlyrGh2UxN
 3PMA==
X-Gm-Message-State: AO0yUKXSHqFQeqsA+8GsPQc2L3Z/oa5VMeogkQWWRaepdB3Ww3NUfBxr
 M/5TXBi9xWvSAYdeh5a4uUsX+Q==
X-Google-Smtp-Source: AK7set/mlJPzBR+3OJrvb/bnX6psKGBvWgRN5ZXDEANZYVkl/qQ/oxS2s4vwyy5v0AuLdRWBpC51JQ==
X-Received: by 2002:a19:5517:0:b0:4dc:823c:8127 with SMTP id
 n23-20020a195517000000b004dc823c8127mr5671737lfe.57.1678409850295; 
 Thu, 09 Mar 2023 16:57:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 27/32] drm/msm/dpu: add support for wide planes
Date: Fri, 10 Mar 2023 02:56:59 +0200
Message-Id: <20230310005704.1332368-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

Typically SSPP can support rectangle with width up to 2560. However it's
possible to use multirect feature and split source to use the SSPP to
output two consecutive rectangles. This commit brings in this capability
to support wider screen resolutions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 129 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
 3 files changed, 135 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e651e4593280..b748c4f17c90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -480,6 +480,15 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   format, fb ? fb->modifier : 0,
 					   &pstate->pipe, 0, stage_cfg);
 
+		if (pstate->r_pipe.sspp) {
+			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			_dpu_crtc_blend_setup_pipe(crtc, plane,
+						   mixer, cstate->num_mixers,
+						   pstate->stage,
+						   format, fb ? fb->modifier : 0,
+						   &pstate->r_pipe, 1, stage_cfg);
+		}
+
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
@@ -1316,10 +1325,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
-		seq_printf(s, "\tsspp:%s\n",
+		seq_printf(s, "\tsspp[0]:%s\n",
 			   pstate->pipe.sspp->cap->name);
-		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
+		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
+		if (pstate->r_pipe.sspp) {
+			seq_printf(s, "\tsspp[1]:%s\n",
+				   pstate->r_pipe.sspp->cap->name);
+			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
+				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+		}
 
 		seq_puts(s, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3d798b939faa..9a03d1cad0ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -701,6 +701,10 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	/* update sspp */
 	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
 				   fill_color, fmt);
+
+	if (pstate->r_pipe.sspp)
+		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
+					   fill_color, fmt);
 }
 
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
@@ -958,9 +962,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
 	unsigned int rotation;
@@ -984,8 +991,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1017,19 +1027,58 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	/* check decimated source width */
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
-	}
+		/* struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state); */
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
 
-	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
+		/*
+		 * FIXME: it's not possible to check if sourcesplit is supported,
+		 * LMs is not assigned yet. It happens in dpu_encoder_virt_mode_set
+		 */
+		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+			   drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
+			   (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
+			    !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+			   /* cstate->num_mixers < 2 ||
+			   !test_bit(DPU_MIXER_SOURCESPLIT, &cstate->mixers[0].hw_lm->cap->features) || */
+			   DPU_FORMAT_IS_YUV(fmt)) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+		}
+
+		/* Use multirect for wide plane. We do not support dynamic assignment of SSPPs, so we know the configuration. */
+		pipe->multirect_index = DPU_SSPP_RECT_0;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		r_pipe->sspp = pipe->sspp;
+		r_pipe->multirect_index = DPU_SSPP_RECT_1;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		*r_pipe_cfg = *pipe_cfg;
+		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+	}
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
 
+	if (r_pipe->sspp) {
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
+		if (ret)
+			return ret;
+	}
+
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -1096,8 +1145,10 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else
+	else {
 		dpu_plane_flush_csc(pdpu, &pstate->pipe);
+		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
+	}
 
 	/* flag h/w flush complete */
 	if (plane->state)
@@ -1209,13 +1260,14 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	struct dpu_hw_fmt_layout layout;
@@ -1243,6 +1295,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				   drm_mode_vrefresh(&crtc->mode),
 				   layout_valid ? &layout : NULL);
 
+	if (r_pipe->sspp) {
+		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
+					   drm_mode_vrefresh(&crtc->mode),
+					   layout_valid ? &layout : NULL);
+	}
+
 	if (pstate->needs_qos_remap)
 		pstate->needs_qos_remap = false;
 
@@ -1250,16 +1308,31 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 						    &crtc->mode, pipe_cfg);
 
 	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
+
+	if (r_pipe->sspp) {
+		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+
+		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+	}
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 
 	trace_dpu_plane_disable(DRMID(plane), false,
 				pstate->pipe.multirect_mode);
 
+	if (r_pipe->sspp) {
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		if (r_pipe->sspp->ops.setup_multirect)
+			r_pipe->sspp->ops.setup_multirect(r_pipe);
+	}
+
 	pstate->pending = true;
 }
 
@@ -1292,6 +1365,9 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		pstate = to_dpu_plane_state(plane->state);
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
+		if (pstate->r_pipe.sspp)
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		mutex_destroy(&pdpu->lock);
 
 		/* this will destroy the states as well */
@@ -1372,12 +1448,29 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	const struct dpu_sw_pipe *pipe = &pstate->pipe;
+	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->pipe.multirect_mode));
-	drm_printf(p, "\tmultirect_index=%s\n",
-		   dpu_get_multirect_index(pstate->pipe.multirect_index));
+
+	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
+	drm_printf(p, "\tmultirect_index[0]=%s\n",
+		   dpu_get_multirect_index(pipe->multirect_index));
+	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+
+	if (r_pipe->sspp) {
+		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[1]=%s\n",
+			   dpu_get_multirect_mode(r_pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[1]=%s\n",
+			   dpu_get_multirect_index(r_pipe->multirect_index));
+		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
+	}
 }
 
 static void dpu_plane_reset(struct drm_plane *plane)
@@ -1411,6 +1504,10 @@ static void dpu_plane_reset(struct drm_plane *plane)
 	 * This is the place where the state is allocated, so fill it fully.
 	 */
 	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->r_pipe.sspp = NULL;
 
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
@@ -1427,6 +1524,8 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+	if (pstate->r_pipe.sspp)
+		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 0ca9002015ff..7490ffd94d03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -19,7 +19,9 @@
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
+ * @r_pipe:	software pipe description of the second pipe
  * @pipe_cfg:	software pipe configuration
+ * @r_pipe_cfg:	software pipe configuration for the second pipe
  * @stage:	assigned by crtc blender
  * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
@@ -34,7 +36,9 @@ struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
 	struct dpu_sw_pipe pipe;
+	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
+	struct dpu_sw_pipe_cfg r_pipe_cfg;
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;
-- 
2.39.2

