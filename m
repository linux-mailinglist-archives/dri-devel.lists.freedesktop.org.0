Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BEB6B99BC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6742010EABF;
	Tue, 14 Mar 2023 15:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B5B10EA86
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:36:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id y14so16443471ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HasERhvqMHIxKihMAH1T2YH/E5fqGxHKVXpkZjLBT7k=;
 b=eFTP3E94vr0kQv2yyidcwEy0IUXtlQdVXH/b7Yl3qVSJQkLxQrz/lmTCwZdtg3QH1W
 yd60w8GPuTlzYj4aAZhwyjFTVmG5WyrG2+3EScFqnEXM2mqmLrj9sHNSmHoFLCh8LPQQ
 jA747zCtEa1gPooWTtNaZt9YEq6qMkXP0bOcYW1m/VOcJfV9CLTKcU3XjEqDTbemQulW
 LHgxDD9hvsACn4Cvslv1JqeLGvX6nr7cYH24NWjBnIKLMCT0ILnR4RHHz4gqFt7WL99p
 veAWR0EqUVtPJ7TpBCtmYK/otgVNt3h02V7hY6j4eCUMCRL3CJHRbqF+WIdENAdA4Ur7
 T+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HasERhvqMHIxKihMAH1T2YH/E5fqGxHKVXpkZjLBT7k=;
 b=7yS/xAuSUbppuMrWPmNBIpjqlHJS/U001FHspCaL82r91WZBrPqKPnTbZpz7QRuOTd
 jbLL6/M9SLe8LZwJZipn+JNJJZpbi5G5G+0Os2/tnukotFJDP+olz0weAZ9LSvKu7QFS
 xvESu2NRxcDaLBSoTNm1IBtqYjPCsgtJbTgNvikSIGinPg0ahzVWhitujjpu+mQ6XIFg
 YNEsSvPaidGOrNkzHrGFIMeSK95mbDODNjbIvwZSDCCDWM3PuyRuKROA4loMuVrjiDIc
 7SmszeaoB8XSGvY6HeWXi+cLzGCLDxQu8BItzOjAGqCuUTp0fEy7t2CPlw7hKgLrGTEw
 jjxQ==
X-Gm-Message-State: AO0yUKWmaLmjtzmK/12QF/Iii1a09DcsshDWEtYq4rdIsqzlj195kVvF
 6vUBJQXKtp4eUUbEHBJyfNY8bg==
X-Google-Smtp-Source: AK7set/vcwEWok3eEY/XO4SA//53HVztKnixbq6Lo/CF3kGBHC6+15RyByN2+yx4Lbw0C0YMXYtL6g==
X-Received: by 2002:a2e:a98c:0:b0:298:39e6:cc1a with SMTP id
 x12-20020a2ea98c000000b0029839e6cc1amr14326582ljq.9.1678808164893; 
 Tue, 14 Mar 2023 08:36:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:36:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 26/32] drm/msm/dpu: split pipe handling from
 _dpu_crtc_blend_setup_mixer
Date: Tue, 14 Mar 2023 18:35:39 +0300
Message-Id: <20230314153545.3442879-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 79 +++++++++++++++---------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 89d2c4735001..217a8112f1a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -401,6 +401,46 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 	}
 }
 
+static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
+				       struct drm_plane *plane,
+				       struct dpu_crtc_mixer *mixer,
+				       u32 num_mixers,
+				       enum dpu_stage stage,
+				       struct dpu_format *format,
+				       uint64_t modifier,
+				       struct dpu_sw_pipe *pipe,
+				       unsigned int stage_idx,
+				       struct dpu_hw_stage_cfg *stage_cfg
+				      )
+{
+	uint32_t lm_idx;
+	enum dpu_sspp sspp_idx;
+	struct drm_plane_state *state;
+
+	sspp_idx = pipe->sspp->idx;
+
+	state = plane->state;
+
+	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
+				   state, to_dpu_plane_state(state), stage_idx,
+				   format->base.pixel_format,
+				   modifier);
+
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+			 crtc->base.id,
+			 stage,
+			 plane->base.id,
+			 sspp_idx - SSPP_NONE,
+			 state->fb ? state->fb->base.id : -1);
+
+	stage_cfg->stage[stage][stage_idx] = sspp_idx;
+	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
+
+	/* blend config update */
+	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
+}
+
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
 	struct dpu_hw_stage_cfg *stage_cfg)
@@ -413,15 +453,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
@@ -432,39 +469,21 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
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
-		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
-					   state, pstate, stage_idx,
-					   format->base.pixel_format,
-					   fb ? fb->modifier : 0);
+		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		_dpu_crtc_blend_setup_pipe(crtc, plane,
+					   mixer, cstate->num_mixers,
+					   pstate->stage,
+					   format, fb ? fb->modifier : 0,
+					   &pstate->pipe, 0, stage_cfg);
 
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
@@ -1322,6 +1341,8 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
+		seq_printf(s, "\tsspp:%s\n",
+			   pstate->pipe.sspp->cap->name);
 		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
 			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
 
-- 
2.30.2

