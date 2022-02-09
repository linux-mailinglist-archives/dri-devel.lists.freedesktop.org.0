Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84774AF846
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4905F10E531;
	Wed,  9 Feb 2022 17:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E724810E4C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z19so5494126lfq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e4it4Dp+EReQvwNeipR2oZfMuDMiTpbIWTfqjKwcnGk=;
 b=waWy5DkLOvB2aq3OrMb4jaFGDcoz46CGsznGA8D6m0dNbRNYTampmLk0CjEJIQLOsr
 Ddzdgz3X6uyY/9H+4gxIwAL6eJdl5bGs35Wcvm2ueU9mzNs/v91v/ixFu4z3tofEUxko
 KgABxXBDPb4bSeUKzQfmroWzK9IxLEauO5PbwUyUnKLyS/ik4khch04g9vKIV2LBjl2+
 5Teua2apE/IQcVPLuh0I0I9UmTYDEnXEC3xAbdI/xQKTPy4wTO8NqIqllQGrv/utgEFs
 VhMkasnYXGEkvFaQWqiiaCT5dVRnurUDElvZ2qNrdA4Qfe8/A4nltJjej2970FRuR4wg
 3Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e4it4Dp+EReQvwNeipR2oZfMuDMiTpbIWTfqjKwcnGk=;
 b=rcHATz6N1+XP5L0cBKxOssg7Ju2rmcmrplrTP7vmhysI4sIipB6dnBiWYb8QEVc/tQ
 MsAznhxIZTZEKo09Jb2E0MywSXxrwbYwuiq5j3kKE9GLxEIF7eGrz2WL3Afe79lmuRGP
 Zllpcg4ZcCOEJoZn994buMUZSxbYp76qxqUvwWsBHbkEBn/7FsEoOWJo3dkKxSuOhwJx
 +SHOjoa4gahYZNV98bdL4lEnQiuRVEeWV0M38av5hK+QWA6DzaVOolMysxGFbw2nzwkF
 4c8TOdH6HyyRRjU7l+dbEYdODxMHZnarVZmDiEa11t1mHF6FeT6udqezDnTM83KuNFCD
 9/Yw==
X-Gm-Message-State: AOAM533bZS9JaiwihywDXojD25tQeReSpBkwjvCg2gLVtQPqSlz6lwiA
 d40A0AejpGbsv0aDin3yWF0SHw==
X-Google-Smtp-Source: ABdhPJxVrP71BdLTklEwYOWCa899rAWC961b96RJPbmRebfl6J8aez+gh2P6WJgTOkQPF+TEfzcQgw==
X-Received: by 2002:a05:6512:1504:: with SMTP id
 bq4mr2278234lfb.504.1644427546192; 
 Wed, 09 Feb 2022 09:25:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 23/25] drm/msm/dpu: rework dpu_plane_atomic_check() and
 dpu_plane_sspp_atomic_update()
Date: Wed,  9 Feb 2022 20:25:18 +0300
Message-Id: <20220209172520.3719906-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rewwork plane's atomic_check and atomic_update functions to clearly use
struct dpu_sw_pipe and struct dpu_hw_pipe_cfg. This is the last step towards
adding proper source split support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 283 +++++++++++++---------
 1 file changed, 163 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 74b585f55b73..623f67247c2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -123,20 +123,19 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 
 /**
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
- * @plane: Pointer to drm plane.
+ * @catalog: Points to dpu catalog structure
  * @fmt: Pointer to source buffer format
+ * @mode: Pointer to drm display mode
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
  */
-static void _dpu_plane_calc_bw(struct drm_plane *plane,
+static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
 	const struct dpu_format *fmt,
+	const struct drm_display_mode *mode,
 	struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	int src_width, src_height, dst_height, fps;
 	u64 plane_prefill_bw;
 	u64 plane_bw;
@@ -144,9 +143,6 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	u64 scale_factor;
 	int vbp, vpw, vfp;
 
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
-
 	src_width = drm_rect_width(&pipe_cfg->src_rect);
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
@@ -154,7 +150,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
 	vfp = mode->vsync_start - mode->vdisplay;
-	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
+	hw_latency_lines =  catalog->perf.min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
 
@@ -174,37 +170,36 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 		do_div(plane_prefill_bw, hw_latency_lines);
 
 
-	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
+	return max(plane_bw, plane_prefill_bw);
 }
 
 /**
  * _dpu_plane_calc_clk - calculate clock required for a plane
- * @plane: Pointer to drm plane.
+ * @mode: Pointer to drm display mode
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg *pipe_cfg)
+static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
+		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
 	int dst_width, src_height, dst_height, fps;
-
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
+	u64 plane_clk;
 
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 
-	pstate->plane_clk =
+	plane_clk =
 		dst_width * mode->vtotal * fps;
 
 	if (src_height > dst_height) {
-		pstate->plane_clk *= src_height;
-		do_div(pstate->plane_clk, dst_height);
+		plane_clk *= src_height;
+		do_div(plane_clk, dst_height);
 	}
+
+	return plane_clk;
 }
 
 /**
@@ -429,13 +424,14 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 /**
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
+ * @mode:		Pointer to drm display mode
  * @pipe:		Pointer to software pipe
- * @crtc:		Pointer to drm crtc
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
-		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		const struct drm_display_mode *mode)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -447,7 +443,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
-	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
+	ot_params.frame_rate = drm_mode_vrefresh(mode);
 	ot_params.vbif_idx = VBIF_RT;
 	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
@@ -867,6 +863,55 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 	msm_framebuffer_cleanup(old_state->fb, old_pstate->aspace);
 }
 
+static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
+		struct dpu_sw_pipe *pipe,
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		uint32_t max_linewidth,
+		const struct dpu_format *fmt)
+{
+	uint32_t min_src_size;
+
+	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
+
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+		(!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
+		 !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+		DPU_DEBUG_PLANE(pdpu,
+				"plane doesn't have scaler/csc for yuv\n");
+		return -EINVAL;
+
+	/* check src bounds */
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
+		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -E2BIG;
+
+	/* valid yuv image */
+	} else if (DPU_FORMAT_IS_YUV(fmt) &&
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -EINVAL;
+
+	/* min dst support */
+	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
+		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		return -EINVAL;
+
+	/* check decimated source width */
+	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+		return -E2BIG;
+	}
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -880,7 +925,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t min_src_size, max_linewidth;
+	uint32_t max_linewidth;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -898,8 +943,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -933,43 +978,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
-	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
-
-	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
-		 !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
-		DPU_DEBUG_PLANE(pdpu,
-				"plane doesn't have scaler/csc for yuv\n");
-		return -EINVAL;
-
-	/* check src bounds */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
-		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
-		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -E2BIG;
-
-	/* valid yuv image */
-	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
-		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
-		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
-		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -EINVAL;
-
-	/* min dst support */
-	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
-		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->dst_rect));
-		return -EINVAL;
-
-	/* check decimated source width */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
-	}
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, max_linewidth, fmt);
+	if (ret)
+		return ret;
 
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
@@ -1028,51 +1039,18 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error)
 	pdpu->is_error = error;
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_atomic_update_pipe(
+		struct dpu_sw_pipe *pipe,
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		unsigned int plane_rotation,
+		struct dpu_hw_fmt_layout *layout,
+		const struct dpu_format *fmt,
+		const struct dpu_mdss_cfg *catalog)
 {
-	uint32_t src_flags;
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct drm_plane_state *state = plane->state;
-	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe;
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
-	bool is_rt_pipe, update_qos_remap;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
-	struct dpu_hw_fmt_layout layout;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	bool update_src_addr = true;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-		update_src_addr = false;
-	}
-
-	if (update_src_addr &&
+	if (layout &&
 	    pipe->sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pipe, &layout);
-		pipe->sspp->ops.setup_sourceaddress(pipe, &layout);
-	}
-
-	pstate->pending = true;
-
-	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
-	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
-
-	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
-			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
-
-	/* override for color fill */
-	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
-		/* skip remaining processing on color fill */
-		return;
+		trace_dpu_plane_set_scanout(pipe, layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
 	}
 
 	if (pipe->sspp->ops.setup_rects) {
@@ -1088,10 +1066,11 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pipe->sspp->ops.setup_format) {
 		unsigned int rotation;
+		uint32_t src_flags;
 
 		src_flags = 0x0;
 
-		rotation = drm_rotation_simplify(state->rotation,
+		rotation = drm_rotation_simplify(plane_rotation,
 						 DRM_MODE_ROTATE_0 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
@@ -1110,7 +1089,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
 
-			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
+			cdp_cfg.enable = catalog->perf.cdp_cfg
 					[DPU_PERF_CDP_USAGE_RT].rd_enable;
 			cdp_cfg.ubwc_meta_enable =
 					DPU_FORMAT_IS_UBWC(fmt);
@@ -1122,29 +1101,93 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
 		}
 	}
+}
+
+static void dpu_plane_atomic_update_qos(
+		struct drm_plane *plane,
+		struct dpu_plane_state *pstate,
+		struct dpu_sw_pipe *pipe,
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		const struct dpu_format *fmt,
+		const struct drm_display_mode *mode,
+		bool is_rt_pipe
+		)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	bool update_qos_remap;
+
+	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
+			pstate->needs_qos_remap;
+
+	if (is_rt_pipe != pdpu->is_rt_pipe)
+		pdpu->is_rt_pipe = is_rt_pipe;
+	if (pstate->needs_qos_remap)
+		pstate->needs_qos_remap = false;
 
-	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, mode);
 	}
 
-	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
-			pstate->needs_qos_remap;
-
-	if (update_qos_remap) {
-		if (is_rt_pipe != pdpu->is_rt_pipe)
-			pdpu->is_rt_pipe = is_rt_pipe;
-		else if (pstate->needs_qos_remap)
-			pstate->needs_qos_remap = false;
+	if (update_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
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
+	struct dpu_hw_fmt_layout layout;
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	bool update_src_addr = true;
+	int ret;
+
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		update_src_addr = false;
 	}
 
-	_dpu_plane_calc_bw(plane, fmt, &pstate->pipe_cfg);
+	pstate->pending = true;
+
+	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
+	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
+			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+			crtc->base.id, DRM_RECT_ARG(&state->dst),
+			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+
+	/* override for color fill */
+	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+		/* skip remaining processing on color fill */
+		return;
+	}
+
+	dpu_plane_atomic_update_pipe(pipe, pipe_cfg,
+			state->rotation,
+			update_src_addr ? &layout : NULL,
+			fmt, pdpu->catalog);
+
+	dpu_plane_atomic_update_qos(plane, pstate,
+			pipe, pipe_cfg,
+			fmt, &crtc->mode, is_rt_pipe);
+
+	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, pipe_cfg);
 
-	_dpu_plane_calc_clk(plane, &pstate->pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.34.1

