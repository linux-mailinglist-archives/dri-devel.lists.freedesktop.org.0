Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EFAC3CC2
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0810E131;
	Mon, 26 May 2025 09:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j4jRTEHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995AD10E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:29:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-742c73f82dfso1395879b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251750; x=1748856550; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
 b=j4jRTEHDOpexI2QX5t73hA0DKIyc5dbUk63ja28YQ474weQ2a/j6KNJNwrXgjCONRu
 52uokE1VPW1X3p907lQoc2XIHjsMMGqlu+wmZKypCU9XxBb/5a3NOBjKyb2Mdf+W7X3N
 /GspbrnBecHz/CU5Lyy7JVZMlEcbxVt3IPdOnIklDUA3JYjvWJN2p8ZHV3BVS8FRHOLF
 Nd86u1Q1NUF715p8Kx1pfnnL6rs5i+lVhUi9FP4Aumu0QW+bj2PiTDkFe/LGxMjBwHt3
 2njRAkfTDl3u7oBDv7oxpaz8oxEENtOYx40FYEihcpEL3juARMyust2boxIY6cOQCVnm
 MkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251750; x=1748856550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
 b=TudFnaGbtWgX2eHbaAgeJ7B9HXQ4c3v6uHl719N0OVVO8kGY7kPLharm3l9SdchB/S
 kx4Zkc1xvd90VNicIuXr+eO7KuH5jBK/ihj7hx6UAIcmb4yqxgyQgbIPoqGbAOJmbS71
 LyjdYcJIlvPUuMILus99fnv6AjWJp4DVo8Ynnbrhxzc/j/T5E6Y90AAT41CPFPYUcq9r
 Nlklrj7cJqOVIJlc+5qVRDlAqQr9L2D502aLNytXjEAkmYSGUGYO2r5qCScUwBcTcMHI
 BdTwb2Vcj3CyFhvpXSCfCcBnbaQqORBLRZUu/eMSvc7z6IodHG83Np/zcVb2LxlkJDFK
 iSuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9KGVxSmcl1uzpipF9Vn3r0vq6UTzENase0uB2td6lGaHpuOS8j/u9zghQDRiqdxJW6nBJofJ6ObI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLI/lyCYZGQX2CYXSRBP2vczA93Q3AM7IYV4d+sjUOYjUnoMwl
 ndVYUMweuwzgmpJJ+lDIksA4pHL1/ihxV0YwkxfgokkoNsVR6/A9rGHcB+5OMYxJLxk=
X-Gm-Gg: ASbGncs56fS0rcuXKGOiPUILJ8hWZ6o1lQKNh8L6oy1Rs3MDLehrrWhFCj4Zi9A3Jyt
 A2H0K1GkVArVoG3d/6BMuIKrDyftIuzbSeYyNPogPttQz8OkB3Mz9Q6gEIdFWYJ+uK3sTwmHHuI
 KFnzlVUWoafp99ITO+s0m/C07tfe+nEwGZlnP7dvnIJYMifkhWFy7TMpehlGEvbt0e3gQdn/Geq
 7I9EatfdD5J58zKLjQMsksgvTq+6gJllGtZIOwm13R+OCQnESvRfldLxmnBY8Wf/oJqEO0MDkQN
 4rJtMdYMxiIq/OxmTm5VK1nR7lBbLDR20BWLS7sIxFZma81B8A==
X-Google-Smtp-Source: AGHT+IEfpaV5RMzOqtdfCNJc96vkUVwkfQfweeWxe8pOUvEMvoqIQ+2/dZVO44+go5U/uqEDw2lwKQ==
X-Received: by 2002:a05:6a20:7d9a:b0:203:bb3b:5f03 with SMTP id
 adf61e73a8af0-2188c20e04emr13542802637.6.1748251745296; 
 Mon, 26 May 2025 02:29:05 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:29:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:23 +0800
Subject: [PATCH v10 05/12] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-5-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
 b=usJtqEGDndm7ZVeIqseoGaTQlRsnJgcsJnE8Nc6A/ggxAaKwUmry4U4M0Qz9ydHPVAiMrtzK8
 V7EmjEpVEZhDBlUc+srM/VkGazsUR/SmWgJ+Tfq8Rz06SDFwMI1g6je
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 90941ff4104f620d1f4f18ec260418ee59dc16b2..3a7e030e1241a5115460a1e9d552341f8dff7d85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->pixel_format,
+				   format->pixel_format, pipe,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 5307cbc2007c5044c5b897c53b44a8e356f1ad0f..cb24ad2a6d8d386bbc97b173854c410220725a0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
 		 uint32_t stage_idx, uint32_t pixel_format,
-		 uint64_t modifier),
+		 struct dpu_sw_pipe *pipe, uint64_t modifier),
 	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
-		pixel_format, modifier),
+		pixel_format, pipe, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
 		__field(	uint32_t,		plane_id	)
@@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = pstate->pipe.sspp->idx;
-		__entry->multirect_idx = pstate->pipe.multirect_index;
-		__entry->multirect_mode = pstate->pipe.multirect_mode;
+		__entry->sspp = pipe->sspp->idx;
+		__entry->multirect_idx = pipe->multirect_index;
+		__entry->multirect_mode = pipe->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),

-- 
2.34.1

