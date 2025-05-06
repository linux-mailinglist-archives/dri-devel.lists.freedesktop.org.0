Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B8AAC9E8
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062B610E6D2;
	Tue,  6 May 2025 15:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cHc27Sur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52502897FD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:48:42 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-30a8c9906e5so1139567a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546522; x=1747151322; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zxbvSQZyP7zd+OjKdls9ttnVESv8uUgxFxtkpvZdxt0=;
 b=cHc27SurF2QcSjvO/PnXJiDpBvJaw4QOS0DrCoTE+M2RGdgeEDTGas5q6cPItG1LWN
 9nWG2a61UqnYlOLhhPAo9z3YUoegxnz24x10I9UB3DRBsaN7PV+DYh/HZAR6VE8A3mjH
 rAoiJVxSW9h1rMF6RPTp7pHZz6L0UkkcvAiuVOgW6rgq7sn69PwAiYTlR98AJb8CLvbD
 K8kqA0Yj9mqUstGKwUP8wfvDkuvlqKSemRlzkS/YH8+NaS7RULEkhZlrGVjnw1vgSP/R
 PJRhgwDYIar+35L73uNZ1qunZcVwhczxIW0C2GcVKQHDjlJnpvxpW2ozvgf4cqQKCYbD
 sISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546522; x=1747151322;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxbvSQZyP7zd+OjKdls9ttnVESv8uUgxFxtkpvZdxt0=;
 b=kpI9bBK33y/yrDxvhMfwSxWDt5oWbWegT+A05vC+AKMTKNBx1TQbRGL9yndt3iZ9Hb
 Uc2xOyqT4PWnpmtZzfpcYlivlVayMVE+6OD/vs4d/QWsKkKBGyBuss1G4nP51NidsnsX
 gc6Q1LSGNvyfwx+AYdSKOgmjBumv7mqpF8OrZTuy0WmdYnMU4NoIp2oUPMUqxo0tlJ6P
 wgMP+pF2SaMdAgpKnesmlg0Z/clbmwM2/133epeFpW0vvZkWK9MKBdaJmGvyAmL8pRY4
 fj4oDdenLkFvRjcbvJSSzFm1fhar1oZU1N+9kunII4r1ryVdRuxJ8aJMbvCQPukEMqy7
 e12g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Vb5FOmzEm+BOd3VeuJBTlp7fzHayBl+q1Q730xPZvuVSNgSINN5sAZx87GRqMk12decJBxq1Lbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYsPmHvW0fZ+dFyNDCio4IhOEx7fb57IB4zgwmj8hhZJmF/i9h
 MsgMaiqGJhdpRLNAhJ112q22UIVAPO6hZytZMw/BFh6KIZBxn6+cdw0kWlxe0ds=
X-Gm-Gg: ASbGncuims0dHgoosWnMksCHud1UVj4f6+zi5Tg28tCqGXwQsa6T6D3NeQNSX7jkzHn
 n3lRp3vJ3UwS2kv6Gz4o2fOclwyp3A4iQtbJ8nz+2y2RQil60pxYxjzW5S6NaJ6QKCcBG/zASUX
 aRCgmPRQZYr9fXzbrpL0nrZotL3Qw55EdzkVWSCKgiHLe6C1U/tCvBhfjednW6lvK+IgvyGc3a9
 xDWAQDZlz0NMEMqF57RK5cqBO/nlGOWIu5qZG+sofgDQ+JqH+Lan9MdK1RM+kOGto6XP5aV2mLT
 gOoaYO2E9xVJekmns70uJ8fuRE7xnwMAPwMcOQ==
X-Google-Smtp-Source: AGHT+IHZeHCrOeq3H2L0fpBwZ7urndRGJ7zRpySXR+v3K7pTWa7b25ypy5G7H4CUfrtFq9IkZEngMg==
X-Received: by 2002:a17:90b:1f82:b0:2ff:693a:7590 with SMTP id
 98e67ed59e1d1-30a61a700b9mr19620258a91.33.1746546521786; 
 Tue, 06 May 2025 08:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:48:41 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:37 +0800
Subject: [PATCH v9 07/14] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-7-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=dkXtXCEO5Q6Tv9ZAERidu+cw1iHRZ7TImSor0/VGmi4=;
 b=8ncQSdz+52Re3aTAnYi/3vBqAnu4RWjDskM6ZCECqqjaeCZnnsYHX+Ty4mCnhabGRwiRUktHE
 c5AvJsbIS1bC/cLbKchKTaZRRJMCSSvoRYz56sLLIKzxYscyo+Ucduw
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
index b0ee89ed7053f940d01bb55a8ea8de8ec5bc3462..095497d80e8a4168ed6b7b0a1b0f535bb9099d7d 100644
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

