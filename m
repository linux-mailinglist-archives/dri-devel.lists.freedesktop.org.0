Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C4ACC0DC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2D310E68D;
	Tue,  3 Jun 2025 07:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lD05/dnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5510E68D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:11:01 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-742c27df0daso4176898b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934661; x=1749539461; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
 b=lD05/dnI4915E/EtnaNZ4Fm2FffbRmNfaN9YtuWA0lglP+TrcWhxP/ttPaP0+cTTt2
 J94t9qFZx9ycVx8ks/uTCdn3v0FG+dq1BkngNYFFQGSMoWa1D09XxpuBV865xFMq+Nz3
 R6K6goHzMscd+8ogI/A0DyQGWys+XrpI1TyY9CO5SQhKqDUuLlZPV6/NqPw+9GzG6n8b
 Aom+/NdO8LjdRHkOn3CO6mg/NjGfb0ck/FqsRboKLVnwDGPpnAfIdaBwYhNsaqeBID2X
 M8B/FVGD6QL6CbnVCWtrpvU7SL686Kp/0MWiBV6weSFMffazyPnmphtslWx5cd1dbGyd
 eQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934661; x=1749539461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
 b=Xaa+iMYAc/GF6Ix1uM2BOlCIJ4zhTV3PHbw8+7NsgyAbsev0o9ice9KjC+Z1s50Znb
 Kaefz39H4Wf6/pE4+qkuKxfCyxnvIt/O5ws56AjCT4uYKN8yf1mQ4i9kc3MvzikIBO6e
 mPoE7aHyLlQ8u5YBurdAcQerhgkBWK75KVImkOEmGeLZgP2EbjoQW9eit5K7MTyKtPM2
 XohVCSVr6IrjRK9OtM9XKuwk1HkV48lCp/Wmi9ddUDvZNEakUwC8aUeEtpwUBKbxrTwv
 b58qIyzG3jLdKjiLDkNVE57hNQuiBC89m3ko3UAfMD6RwIKvY9dicXyAZtxSPdlAkrP1
 JR4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs5owJeAGsd5zwhU+aYs6zQri8/6MuiyPYIVmUlbZvUDEwCAjY0lbc4vIH5o1KH0PtNmPdt2Kq1qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3f1BOq5+fE2+HevujVVoYixFay39ZupPHkMrhEEG8MDMMSiQE
 4KJq88SsRW8tlwcrX2Xr891+oO2AdWO5PXzT+rWU1NOlGa8zmfWfPioaHXifJfVlsZs=
X-Gm-Gg: ASbGncsgKoChfOODUOe+PeSZRev+8+/ymY7Zp64qdzFXou9IKE5yoca6vPcNhJL9yxy
 Fxl8LgwQKnhKS89U1NrJY0OH5FRs9FYrRjaEjDuXtQzCd+pHVyk+7cWTf8ZS8e1RgWXrjAZrWfd
 5UeIA6jjPyRHzM612+iPtMuZ10AFVOqa3lknHnQCYe1yns03J7rktZjbZoZczr49Tf/Gv+gCv/e
 TsP4wvOForQPTQ0mUu33X4b6r4kDFu+YiEewEpjf6GWU5A0XRjCae/pMzZIMparUP6azpX/3IUY
 FUEef2wfueJtttZdyiQm30X429ZTybDfheR49zeFcznESHKJeQ==
X-Google-Smtp-Source: AGHT+IFjWCARHruptuJVLmM8AfVvbtePqSODkl82sJOlhsf4UkzXWJqbDaCd4kbMemrBH6D23IqzDg==
X-Received: by 2002:a05:6a00:2e12:b0:742:aecc:c47c with SMTP id
 d2e1a72fcca58-747bd970f56mr20943760b3a.7.1748934661240; 
 Tue, 03 Jun 2025 00:11:01 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:11:00 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:04 +0800
Subject: [PATCH v11 05/12] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-5-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
 b=lCfGlNgdftpf9pXQpFuf+RZ4PCJy6x3Jo848+yn3e5YXK0pb/mRGUH2c14Z4J9uMc0sEVgDlH
 WCpCkjTvOWYBUB9AiL/tTqrn88WQn0PQQixCWWYArolB+ivrgzrD8yV
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

