Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94E4AF843
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8F810E500;
	Wed,  9 Feb 2022 17:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8EF10E4E8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:45 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id c15so4380145ljf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEqJegOZve/rFBiuAFRH78CRQiT81dVXTl201sF0/D8=;
 b=oeyySZ3tbCoJUKu+CAHAtBFBl9K5o0b69JJRTR+vclxoImhV5x7xNy4/21Rg35bKnv
 8JyJsU0Z5yATQN2aWS3nYLP6MAk76U1LXvhYo4Ylrlt1siy8NLl0HkDNcm46uyMHm+As
 W/6V9s6xO+J0fItVjJDgflOgIYmUy+RJE14hOLf4TR29qqhZ+8yEO/UAyucx8MkaGWi3
 dBM6z3Z64pRrEaP7cZaa25BNY2Fss8WWeGiWxGKIfmtpX7+mwTJXRupaLHdYTQWf2AGR
 ODi1S1Un8v2OyeW3YUhojqOhlPaofKKv7JSKWjK1KRl3jjRilTU1i1drRngn9hSBq/bm
 Y0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PEqJegOZve/rFBiuAFRH78CRQiT81dVXTl201sF0/D8=;
 b=BQAfwMUuKnMLbnwC3zUb+oO/5EeI7SH3kNQ6bMZ+CpOgrRxFeVrNqdKmWfGYAAl/D6
 Mns+BXvWKKP52RXlOXZLkUteYgakrJKxWVWdMZS/+LTZQWWtMOrPGdE2KihQH6j39H4o
 L+rmuETMiqSqRKU5eeop8hmO/2yFBFRFlJtnJCAfYnbOLR0JUvJ7g/NgJBBMl0dKwskR
 7bclQ8phoKtbUItOprUIhh9Nj39WuxPnfcHtqraC+UPKIv9XmloaO59WEk5cFW4/9cYF
 yCOOcwNQEG9PVEJs5MUuTUWnKXPPsC7SXTKEf5+lzXZdEmT7J/X3eEK7gL706kgWECDo
 CBVQ==
X-Gm-Message-State: AOAM532Vh+fI/TTZoc/qBXN1hxYmnpuUG0t3D0Xpy24b5o5ebTb46VH0
 zZZJ/N0Ts1W6RpUD8N/MNRdgDw==
X-Google-Smtp-Source: ABdhPJy6LV8Rg1pvk+ijuzqbfE1vbTCus8/P/U44vwy9AXErh7BnOH12I61Ekp4HlWWILPl/6q0AMg==
X-Received: by 2002:a2e:8790:: with SMTP id n16mr2122397lji.273.1644427543359; 
 Wed, 09 Feb 2022 09:25:43 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 20/25] drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
Date: Wed,  9 Feb 2022 20:25:15 +0300
Message-Id: <20220209172520.3719906-21-dmitry.baryshkov@linaro.org>
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

Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
chance to disagree about src/dst rectangles (currently
dpu_plane_atomic_check() uses unclipped rectangles, while
dpu_plane_atomic_update() uses clipped rectangles calculated by
drm_atomic_helper_check_plane_state()).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 62 ++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  1 +
 2 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 952ff11162c0..863aedcda66e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -904,7 +904,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
-	struct drm_rect src, dst, fb_rect = { 0 };
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct drm_rect fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
 
 	if (new_plane_state->crtc)
@@ -933,12 +934,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	src.x1 = new_plane_state->src_x >> 16;
-	src.y1 = new_plane_state->src_y >> 16;
-	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
-	src.y2 = src.y1 + (new_plane_state->src_h >> 16);
+	pipe_cfg->src_rect = new_plane_state->src;
 
-	dst = drm_plane_state_dest(new_plane_state);
+	/* state->src is 16.16, src_rect is not */
+	pipe_cfg->src_rect.x1 >>= 16;
+	pipe_cfg->src_rect.x2 >>= 16;
+	pipe_cfg->src_rect.y1 >>= 16;
+	pipe_cfg->src_rect.y2 >>= 16;
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -957,30 +961,30 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
+	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&src));
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
 
 	/* valid yuv image */
 	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (src.x1 & 0x1 || src.y1 & 0x1 ||
-		    drm_rect_width(&src) & 0x1 ||
-		    drm_rect_height(&src) & 0x1)) {
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&src));
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -EINVAL;
 
 	/* min dst support */
-	} else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) < 0x1) {
+	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
 		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&dst));
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
 		return -EINVAL;
 
 	/* check decimated source width */
-	} else if (drm_rect_width(&src) > max_linewidth) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&src), max_linewidth);
+				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
 		return -E2BIG;
 	}
 
@@ -1053,15 +1057,13 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe, update_qos_remap;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	bool update_src_addr = true;
 	int ret;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
-
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
@@ -1084,16 +1086,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
-	pipe_cfg.src_rect = state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg.src_rect.x1 >>= 16;
-	pipe_cfg.src_rect.x2 >>= 16;
-	pipe_cfg.src_rect.y1 >>= 16;
-	pipe_cfg.src_rect.y2 >>= 16;
-
-	pipe_cfg.dst_rect = state->dst;
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1102,10 +1094,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pipe->sspp->ops.setup_rects) {
 		pipe->sspp->ops.setup_rects(pipe,
-				&pipe_cfg);
+				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
@@ -1148,12 +1140,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, fb, &pstate->pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, fb);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, crtc, &pstate->pipe_cfg);
 	}
 
 	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
@@ -1167,9 +1159,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
+	_dpu_plane_calc_bw(plane, fb, &pstate->pipe_cfg);
 
-	_dpu_plane_calc_clk(plane, &pipe_cfg);
+	_dpu_plane_calc_clk(plane, &pstate->pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index e61c57b045ea..69920c32cb9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -34,6 +34,7 @@ struct dpu_plane_state {
 	bool pending;
 
 	struct dpu_sw_pipe pipe;
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
 	u64 plane_fetch_bw;
 	u64 plane_clk;
-- 
2.34.1

