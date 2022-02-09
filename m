Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BD4AF851
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1158110E40E;
	Wed,  9 Feb 2022 17:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74A10E4E8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:49 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o17so4486781ljp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lw58U4vD/8+NxNvEp4u6pOgeLB3B0AxQcZjFEY7cvM4=;
 b=DkcRRfXm/+75AQ7cgqwcL8JuJdKRXlkcUZIS1KVoIE5NPwnJP94TUau/tVKYciHV4c
 HbL3jVVCb3xHbNtKAsGq8oaOs5GaAre5r1QoxDKn2yWVIw6cxvtVa/QAYJC1mjkT1GgK
 Ll66hA9HZlPh/5S7uls206I46l/7G4kUSktJREhzwXzDa5jarcDJCnLwpKE+1J73h6QU
 28J0arq6mrtYPhvRE+yKszlGTnxaQVn7ETCRBQAYgXwsoNHa39QfouG/VZ+H6pTg8UmJ
 aa9yf9OaMgqxaaYZ7hargcyDhXgytWvDb171vMuEiG4vhxyyMZgsK7WLWjoiRKmKVXTL
 uKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lw58U4vD/8+NxNvEp4u6pOgeLB3B0AxQcZjFEY7cvM4=;
 b=M1XAcsizDLdSBF53++/ql6+n6MNB0pRylMmaEQrDQE9pMMuvRX3RNxR9xKzJUlzU/r
 0PDRWVs4izNaG4w/wtSCcuJL9tv8I+We/j/WObnPCKe5bWFX+uITg4OyHtdNClJEPWf+
 IfTENlrNOfBPyYgawz5ODLPW6kVcZsL+jcsPwbW5+3k2y/03v5UeBPhCC6bwhUNy7Z6F
 wx1LXX/8We36HEfWZUteKTVhUR1vOC7GD7qamoKdRT9hwVZ+pETdhafLsn/+auxgwktd
 yGDkfNYduxsoBy8PmjhpDaUB/ZljHFogM0dPnlhidze+VJlWzog6rDzSrV92FMh6EmIQ
 AcEQ==
X-Gm-Message-State: AOAM5327798EpdrP6r+T2ilmO3AECtXEbPoQU2OTKiqAJfxjM/p+erLT
 UnFrWnpqlpQyGwMkC+os+NRBiQ==
X-Google-Smtp-Source: ABdhPJwQwfDUXQbNbO4U5lSOEeStIVnAKdxU8HlQXuu57lAxolsx3/05xJ6yCHL/i7a2vKKBFcxCKg==
X-Received: by 2002:a2e:9e01:: with SMTP id e1mr2106917ljk.31.1644427547975;
 Wed, 09 Feb 2022 09:25:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 25/25] drm/msm/dpu: add support for wide planes
Date: Wed,  9 Feb 2022 20:25:20 +0300
Message-Id: <20220209172520.3719906-26-dmitry.baryshkov@linaro.org>
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

Typically SSPP can support rectangle with width up to 2560. However it's
possible to use multirect feature and split source to use the SSPP to
output two consecutive rectangles. This commit brings in this capability
to support wider screen resolutions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 194 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   2 +
 3 files changed, 192 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index fa279f0358d6..20ebac3028ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -418,7 +418,6 @@ static void _dpu_crtc_blend_setup_ctl(struct drm_crtc *crtc)
 	struct dpu_plane_state *pstate = NULL;
 
 	uint32_t stage_idx, lm_idx;
-	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -434,6 +433,7 @@ static void _dpu_crtc_blend_setup_ctl(struct drm_crtc *crtc)
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		enum dpu_sspp sspp_idx;
+		struct dpu_sw_pipe *pipe;
 
 		state = plane->state;
 		if (!state)
@@ -441,18 +441,37 @@ static void _dpu_crtc_blend_setup_ctl(struct drm_crtc *crtc)
 
 		pstate = to_dpu_plane_state(state);
 
-		sspp_idx = pstate->pipe.sspp->idx;
+		pipe = &pstate->pipe;
+		stage_idx = 0;
+
+		sspp_idx = pipe->sspp->idx;
 		set_bit(sspp_idx, fetch_active);
 
-		stage_idx = zpos_cnt[pstate->stage]++;
 		stage_cfg.stage[pstate->stage][stage_idx] =
 					sspp_idx;
 		stage_cfg.multirect_index[pstate->stage][stage_idx] =
-					pstate->pipe.multirect_index;
+					pipe->multirect_index;
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++)
 			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+
+		if (pstate->r_pipe.sspp) {
+			pipe = &pstate->r_pipe;
+			stage_idx = 1;
+
+			sspp_idx = pipe->sspp->idx;
+			set_bit(sspp_idx, fetch_active);
+
+			stage_cfg.stage[pstate->stage][stage_idx] =
+						sspp_idx;
+			stage_cfg.multirect_index[pstate->stage][stage_idx] =
+						pipe->multirect_index;
+
+			/* blend config update */
+			for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++)
+				mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+		}
 	}
 
 	ctl = mixer->lm_ctl;
@@ -1202,8 +1221,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
+		seq_printf(s, "\tsspp: %d\n",
+			pstate->pipe.sspp->idx);
 		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
+		if (pstate->r_pipe.sspp) {
+			seq_printf(s, "\tsspp: %d\n",
+				pstate->r_pipe.sspp->idx);
+			seq_printf(s, "\tmultirect: mode: %d index: %d\n",
+				pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+		}
 
 		seq_puts(s, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 623f67247c2d..2f88405ead80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -575,9 +575,8 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
 };
 
-static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
+static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe, const struct dpu_format *fmt)
 {
-	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
 	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
@@ -588,7 +587,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -639,6 +638,27 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 				fmt);
 }
 
+static void _dpu_plane_color_fill_pipe(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		const struct dpu_format *fmt,
+		u32 color)
+{
+	if (!pipe->sspp->ops.setup_solidfill)
+		return;
+
+	pipe->sspp->ops.setup_solidfill(pipe, color);
+
+	if (pipe->sspp->ops.setup_format)
+		pipe->sspp->ops.setup_format(pipe,
+				fmt, DPU_SSPP_SOLID_FILL);
+
+	if (pipe->sspp->ops.setup_rects)
+		pipe->sspp->ops.setup_rects(pipe,
+				pipe_cfg);
+
+	_dpu_plane_setup_scaler(pipe, fmt, true, pipe_cfg);
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
@@ -661,31 +681,39 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * h/w only supports RGB variants
 	 */
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
+	if (!fmt)
+		return 0;
 
-	/* update sspp */
-	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
-		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
-				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
+	pipe_cfg.dst_rect = pstate->base.dst;
 
-		/* override scaler/decimation if solid fill */
-		pipe_cfg.dst_rect = pstate->base.dst;
+	pipe_cfg.src_rect.x1 = 0;
+	pipe_cfg.src_rect.y1 = 0;
+	pipe_cfg.src_rect.x2 =
+		drm_rect_width(&pipe_cfg.dst_rect);
+	pipe_cfg.src_rect.y2 =
+		drm_rect_height(&pipe_cfg.dst_rect);
 
-		pipe_cfg.src_rect.x1 = 0;
-		pipe_cfg.src_rect.y1 = 0;
+	/* update sspp */
+	if (pstate->r_pipe.sspp) {
+		/* split source */
+		pipe_cfg.dst_rect.x2 = (pipe_cfg.dst_rect.x1 + pipe_cfg.dst_rect.x2) >> 1;
 		pipe_cfg.src_rect.x2 =
 			drm_rect_width(&pipe_cfg.dst_rect);
-		pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pipe_cfg.dst_rect);
 
-		if (pstate->pipe.sspp->ops.setup_format)
-			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
-					fmt, DPU_SSPP_SOLID_FILL);
+		_dpu_plane_color_fill_pipe(&pstate->pipe, &pipe_cfg, fmt,
+				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
 
-		if (pstate->pipe.sspp->ops.setup_rects)
-			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
-					&pipe_cfg);
+		pipe_cfg.dst_rect.x1 = pipe_cfg.dst_rect.x2;
+		pipe_cfg.dst_rect.x2 = pstate->base.dst.x2;
+
+		pipe_cfg.src_rect.x2 =
+			drm_rect_width(&pipe_cfg.dst_rect);
 
-		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg);
+		_dpu_plane_color_fill_pipe(&pstate->r_pipe, &pipe_cfg, fmt,
+				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
+	} else {
+		_dpu_plane_color_fill_pipe(&pstate->pipe, &pipe_cfg, fmt,
+				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
 	}
 
 	return 0;
@@ -866,7 +894,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_hw_pipe_cfg *pipe_cfg,
-		uint32_t max_linewidth,
 		const struct dpu_format *fmt)
 {
 	uint32_t min_src_size;
@@ -901,12 +928,6 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->dst_rect));
 		return -EINVAL;
-
-	/* check decimated source width */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
 	}
 
 	return 0;
@@ -921,9 +942,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
 	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_hw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
 	uint32_t max_linewidth;
 
@@ -945,6 +968,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -978,15 +1004,71 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, max_linewidth, fmt);
+	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+		/* struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state); */
+
+		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+			return -E2BIG;
+			/*
+			 * FIXME: it's not possible to check if sourcesplit is supported,
+			 * LMs is not assigned yet. It happens in dpu_encoder_virt_mode_set
+			 */
+		} else if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
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
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
 }
 
+static void dpu_plane_setup_csc(struct dpu_plane *pdpu,
+		struct dpu_sw_pipe *pipe,
+		const struct dpu_format *fmt)
+{
+	if (pipe->sspp && pipe->sspp->ops.setup_csc) {
+		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, pipe, fmt);
+
+		if (csc_ptr)
+			pipe->sspp->ops.setup_csc(pipe->sspp, csc_ptr);
+	}
+}
+
 void dpu_plane_flush(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
@@ -1010,12 +1092,11 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
+	else {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
-		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
 
-		if (csc_ptr)
-			pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
+		dpu_plane_setup_csc(pdpu, &pstate->pipe, fmt);
+		dpu_plane_setup_csc(pdpu, &pstate->r_pipe, fmt);
 	}
 
 	/* flag h/w flush complete */
@@ -1142,12 +1223,14 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_hw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
@@ -1164,6 +1247,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
 	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+	if (r_pipe->sspp)
+		_dpu_plane_set_qos_ctrl(plane, r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
@@ -1188,6 +1273,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, pipe_cfg);
 
 	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
+
+	if (r_pipe->sspp) {
+		dpu_plane_atomic_update_pipe(r_pipe, r_pipe_cfg,
+				state->rotation,
+				update_src_addr ? &layout : NULL,
+				fmt, pdpu->catalog);
+
+		dpu_plane_atomic_update_qos(plane, pstate,
+				r_pipe, r_pipe_cfg,
+				fmt, &crtc->mode, is_rt_pipe);
+
+		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+
+		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+	}
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
@@ -1230,6 +1330,9 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		pstate = to_dpu_plane_state(plane->state);
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
 
+		if (pstate->r_pipe.sspp)
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		mutex_destroy(&pdpu->lock);
 
 		/* this will destroy the states as well */
@@ -1310,11 +1413,26 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
 	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	const struct dpu_sw_pipe *pipe = &pstate->pipe;
+	const struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
-	drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->pipe.multirect_mode));
-	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->pipe.multirect_index));
+
+	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
+	drm_printf(p, "\tmultirect_index[0]=%s\n", dpu_get_multirect_index(pipe->multirect_index));
+	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+
+	pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->r_pipe_cfg;
+	if (pipe->sspp) {
+		drm_printf(p, "\tsspp[1]=%s\n", pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[1]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[1]=%s\n", dpu_get_multirect_index(pipe->multirect_index));
+		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	}
 }
 
 static void dpu_plane_reset(struct drm_plane *plane)
@@ -1344,6 +1462,10 @@ static void dpu_plane_reset(struct drm_plane *plane)
 	}
 
 	pstate->pipe.sspp = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
+	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
+	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	pstate->r_pipe.sspp = NULL;
 
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
@@ -1360,6 +1482,8 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+	if (pstate->r_pipe.sspp)
+		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 69920c32cb9a..2dd1986f69bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -34,7 +34,9 @@ struct dpu_plane_state {
 	bool pending;
 
 	struct dpu_sw_pipe pipe;
+	struct dpu_sw_pipe r_pipe;
 	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_pipe_cfg r_pipe_cfg;
 
 	u64 plane_fetch_bw;
 	u64 plane_clk;
-- 
2.34.1

