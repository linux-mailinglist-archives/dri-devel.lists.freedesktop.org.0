Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945B76590E3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4456510E21A;
	Thu, 29 Dec 2022 19:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9248810E201
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:00 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b3so28761751lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTAInIvOAbbQQEzaGtCCnYtXybYWotRzUFBIe3E5mu8=;
 b=Wl0gHR0h2njFhaXvf3T8NiQ2duN1rXjFAZ+XDwJCPQ/D9l7wUvbutzvT79eIhwIhjD
 A3nVKQPubuBQzQvuTmQIi9s+a0cmfDNj6EORvMH4stTYPhj4lQMOmm4PkQl11xojrpDz
 LZkTSnZ/lvZmf3L6+jyemoj2EHY92ectOG3WlcZiI0o5azkhBmwnIVJZJpr2wBXksC4/
 u9SFzPemM6gEElFLy4g58Pl6wI799nZ7xukyCBdyCqg3tyrNlzL4Hq2+q50zLZ52zePG
 woL7TNjKdGvTbofs1GOGcpV8GW43r+v6Po+gFRPCz7neKE9zEQTwMm+ZIkwHJFlfxHgw
 OouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTAInIvOAbbQQEzaGtCCnYtXybYWotRzUFBIe3E5mu8=;
 b=xVEgPcOnWAfR/3zoBV7QdzMiTiDn4fSp2HbLz0wTgBXHW0JLV66GsBeWLLvXXF9V6Z
 wxsdN2b2jVr68jGFxqoGUlMkWLNOUDYXL5Utt6dUc/DRoSLcssydiVXuiYlinSWgvlx3
 XLwCf7bwwl8enypPxh10SpEEHI2OgxX/MIWRauAiCeRFI837ZPRpFD7/T/kx+lBnOjQn
 BS0XFIl5DTfq/w0yb0jWflCvL6/PeVOhImVjAqiNcvRGgZFERpU+kv3OEbo1jmilwtim
 yyFy84YaCSZqVyNVRuV/r/c0XpRD0jfFdIHSRKsDZ12qlDQWffqw3w0Ce0wYWxf0ErRa
 TyMg==
X-Gm-Message-State: AFqh2kprM+9qmVLfzXOcfpDCVp6XN8xxFBaXjS+u9CUh+dp9p7MjFs4I
 KOmHZylhK6NBw2ol7DkVrJSSBA==
X-Google-Smtp-Source: AMrXdXukD56Y3nlQtZstb6C4KzzVKe69hpDGwHFyItiyS5e5cNXjS1wLq1ijanFAxMMxeGuv5vFmmA==
X-Received: by 2002:a05:6512:708:b0:4ca:f992:6a1d with SMTP id
 b8-20020a056512070800b004caf9926a1dmr8979025lfs.69.1672341538984; 
 Thu, 29 Dec 2022 11:18:58 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:18:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 01/27] drm/msm/dpu: set pdpu->is_rt_pipe early in
 dpu_plane_sspp_atomic_update()
Date: Thu, 29 Dec 2022 21:18:30 +0200
Message-Id: <20221229191856.3508092-2-dmitry.baryshkov@linaro.org>
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

The function dpu_plane_sspp_atomic_update() updates pdpu->is_rt_pipe
flag, but after the commit 854f6f1c653b ("drm/msm/dpu: update the qos
remap only if the client type changes") it sets the flag late, after all
the qos functions have updated QoS programming. Move the flag update
back to the place where it happended before the mentioned commit to let
the pipe be programmed according to its current RT/non-RT state.

Fixes: 854f6f1c653b ("drm/msm/dpu: update the qos remap only if the client type changes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 86719020afe2..bfd5be89e8b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1126,7 +1126,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
-	bool is_rt_pipe, update_qos_remap;
+	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg pipe_cfg;
@@ -1138,6 +1138,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->pending = true;
 
 	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
+	pdpu->is_rt_pipe = is_rt_pipe;
+
 	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
@@ -1219,14 +1222,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
 	}
 
-	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
-			pstate->needs_qos_remap;
-
-	if (update_qos_remap) {
-		if (is_rt_pipe != pdpu->is_rt_pipe)
-			pdpu->is_rt_pipe = is_rt_pipe;
-		else if (pstate->needs_qos_remap)
-			pstate->needs_qos_remap = false;
+	if (pstate->needs_qos_remap) {
+		pstate->needs_qos_remap = false;
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-- 
2.39.0

