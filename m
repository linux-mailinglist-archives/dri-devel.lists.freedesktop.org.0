Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186BE659126
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F7010E23E;
	Thu, 29 Dec 2022 19:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8710E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:23 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j17so19248180lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+fXcbMmUes3LWvp6J7wG2UsgUYPoLHlB/D0nRdkLxs=;
 b=SFbqgEtHWp38XuZbBu9E9JTU6XZ1RaOeX+0Ky2eUmgNwc9RmPuICqUL9enOk0LGB9s
 zk+2WIdDKjbrQg4hYNuMfT0BPrJe8RoFKVPjiZ8ng2/2Ns0SwZL3jQgcoz8NyQWyZqgz
 CiMfZ6MkAnmcwiLyBUoju3+vQG5QME35gVOMBEnhlPe/1NQuOsMPZl6cZ+4vUxNhyYeb
 S7ESGc2mNvLDhX3/rR6u/YU3YIgZeJy1KPtFIQyWdXVYeXsYoZsaZB57MD09gVJ4S9w6
 gXuyFJ9FHxnQTlOjAAKUN5jmfjjqw/NCdmSp42pC+P9OXLINxgfi0hE/x4YOYrW/2IyO
 wMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+fXcbMmUes3LWvp6J7wG2UsgUYPoLHlB/D0nRdkLxs=;
 b=jy2zjHATsHIqBrkVmcI2Idm000vm3Dwj61MxoMaKNFc+4P5WkOW4U4GPrYQ6ripKWQ
 J0c8s9jHrOeQzo8UBJ5rYDLorioCzYU51tP1CwMKPL2oAb3INl04Mh25aDoB3sPlZ/I9
 94+6/GczLSxUGXYeqhKhEfVXxrdMLnaTThoeWseCtpneCwnndQ8GoKSXnZzw631oTBR7
 Yr2CvSLZPi9UhCbRN5ucb8oMz4Rd+mYirj4/7iNBAH4cql1qbVU5QKadwM1ZtkCiG7aA
 CuJBwMByCvL7vkajUlYEd4xlNI2hZaikZGkGZkksou3RmVSxxVSS97jCjU8ZOF/F5QI/
 PAtQ==
X-Gm-Message-State: AFqh2kr2d4SSj77rR6sxCEacmCIfNxEuO1+UHjmMbtHrE8hrOjs4ZgFZ
 bQA59qSXm0yHGN0KROyxhCJFwK92/+jPhyqc
X-Google-Smtp-Source: AMrXdXsWcMczZKXz9uqjCljiHrS7OX3zuVOhkYkq57W128V9aGoXv/xcVJZVLniU0jhUwBjlsDwDkQ==
X-Received: by 2002:a05:6512:6d6:b0:4b4:9068:2c0b with SMTP id
 u22-20020a05651206d600b004b490682c0bmr13393469lff.2.1672341563393; 
 Thu, 29 Dec 2022 11:19:23 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 26/27] drm/msm/dpu: split pipe handling from
 _dpu_crtc_blend_setup_mixer
Date: Thu, 29 Dec 2022 21:18:55 +0200
Message-Id: <20221229191856.3508092-27-dmitry.baryshkov@linaro.org>
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

Rework _dpu_crtc_blend_setup_mixer() to split away pipe handling to a
separate functon. This is a preparation for the r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 86 ++++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 ++-
 2 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 78981271b28a..d0d1cb355062 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -400,6 +400,47 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 	}
 }
 
+static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
+				       struct drm_plane *plane,
+				       struct dpu_crtc_mixer *mixer,
+				       u32 num_mixers,
+				       struct dpu_hw_stage_cfg *stage_cfg,
+				       enum dpu_stage stage,
+				       unsigned int stage_idx,
+				       unsigned long *fetch_active,
+				       struct dpu_sw_pipe *pipe
+				      )
+{
+	uint32_t lm_idx;
+	enum dpu_sspp sspp_idx;
+	struct drm_plane_state *state;
+
+	if (pipe->sspp)
+		return;
+
+	sspp_idx = pipe->sspp->idx;
+
+	state = plane->state;
+
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+			 crtc->base.id,
+			 stage,
+			 plane->base.id,
+			 sspp_idx - SSPP_NONE,
+			 state->fb ? state->fb->base.id : -1);
+
+	set_bit(sspp_idx, fetch_active);
+
+	stage_cfg->stage[stage][stage_idx] = sspp_idx;
+	stage_cfg->multirect_index[stage][stage_idx] =
+				pipe->multirect_index;
+
+	/* blend config update */
+	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
+								    sspp_idx);
+}
+
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
 	struct dpu_hw_stage_cfg *stage_cfg)
@@ -412,15 +453,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t stage_idx, lm_idx;
-	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
+	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
 	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		enum dpu_sspp sspp_idx;
-
 		state = plane->state;
 		if (!state)
 			continue;
@@ -431,39 +469,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = pstate->pipe.sspp->idx;
-		set_bit(sspp_idx, fetch_active);
-
-		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
-				crtc->base.id,
-				pstate->stage,
-				plane->base.id,
-				sspp_idx - SSPP_VIG0,
-				state->fb ? state->fb->base.id : -1);
-
 		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		stage_idx = zpos_cnt[pstate->stage]++;
-		stage_cfg->stage[pstate->stage][stage_idx] =
-					sspp_idx;
-		stage_cfg->multirect_index[pstate->stage][stage_idx] =
-					pstate->pipe.multirect_index;
-
 		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
-					   state, pstate, stage_idx,
+					   state, pstate,
 					   format->base.pixel_format,
 					   fb ? fb->modifier : 0);
 
+		_dpu_crtc_blend_setup_pipe(crtc, plane,
+					   mixer, cstate->num_mixers,
+					   stage_cfg, pstate->stage, 0,
+					   fetch_active,
+					   &pstate->pipe);
+
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
-						pstate, format);
-
-			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
-									    sspp_idx);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
@@ -1294,8 +1318,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
-		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
+		seq_printf(s, "\tsspp[0]:%d\n",
+			   pstate->pipe.sspp->idx - SSPP_NONE);
+		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
+		if (pstate->r_pipe.sspp) {
+			seq_printf(s, "\tsspp[1]:%d\n",
+				   pstate->r_pipe.sspp->idx - SSPP_NONE);
+			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
+				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
+		}
 
 		seq_puts(s, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 0ad148cc2fb8..5ec4f89e8814 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -633,9 +633,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
 TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
-		 uint32_t stage_idx, uint32_t pixel_format,
+		 uint32_t pixel_format,
 		 uint64_t modifier),
-	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
+	TP_ARGS(crtc_id, plane_id, state, pstate,
 		pixel_format, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
@@ -643,7 +643,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__field(	uint32_t,		fb_id		)
 		__field_struct(	struct drm_rect,	src_rect	)
 		__field_struct(	struct drm_rect,	dst_rect	)
-		__field(	uint32_t,		stage_idx	)
 		__field(	enum dpu_stage,		stage		)
 		__field(	enum dpu_sspp,		sspp		)
 		__field(	uint32_t,		multirect_idx	)
@@ -657,7 +656,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->fb_id = state ? state->fb->base.id : 0;
 		__entry->src_rect = drm_plane_state_src(state);
 		__entry->dst_rect = drm_plane_state_dest(state);
-		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
 		__entry->sspp = pstate->pipe.sspp->idx;
 		__entry->multirect_idx = pstate->pipe.multirect_index;
@@ -666,13 +664,13 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->modifier = modifier;
 	),
 	TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
-		  " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
+		  " dst:" DRM_RECT_FMT " stage:%d, sspp:%d "
 		  "multirect_index:%d multirect_mode:%u pix_format:%u "
 		  "modifier:%llu",
 		  __entry->crtc_id, __entry->plane_id, __entry->fb_id,
 		  DRM_RECT_FP_ARG(&__entry->src_rect),
 		  DRM_RECT_ARG(&__entry->dst_rect),
-		  __entry->stage_idx, __entry->stage, __entry->sspp,
+		  __entry->stage, __entry->sspp,
 		  __entry->multirect_idx, __entry->multirect_mode,
 		  __entry->pixel_format, __entry->modifier)
 );
-- 
2.39.0

