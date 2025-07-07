Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F0FAFAB9D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCCE10E410;
	Mon,  7 Jul 2025 06:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OXnW3Cr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5F510E410
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:39 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso3326199b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869119; x=1752473919; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=OXnW3Cr4D2RZPXJgYcCRCEIhpnC8+HfP3+hKGpULhLXCYPshkenY3GtXi3hMoX9GRq
 aFK5IPGMIROSof6L7aPGNOxTNGv9mYFtdgNDm5p5HDa9qB2WDc8Dr5uwHUHxrCp27Cuv
 oto/AmHD9YtfmOzA2H2NWiLa/yJzdVgVge+Meiho874jnwsSm36Zvcy3NVnotSu3eueu
 65JtnRSsI7exYl8mzVUsyxQv0ASpULeDnY0Ztz8q8MwHrAG77/MwtbWqa8VQHEsINkfK
 BWw7UbBawoTT0PsF7vahdCjRwK/o6/9jPdA3mbYGXU9KX3OsLuQzainIUwDzaH4swt0l
 uO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869119; x=1752473919;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=w7a+M9Oej36nvUskuzO1sW/qeef3c2qp4Rszz9vBCRLntltH6Q13O/SVkyUeB43ptc
 2eQMxOAB7jJjr6qk48LWebMhOU5TYomdoeD/V8/MPbC0eKxX292zUNgwqb/F6Rs/tKHw
 B4WTJgnnff+MXGGtKHpt5o40Oo8V1+Ao3GkglZH9xVBZCojSiDlnzZ9u2iupZwkTnUTx
 U3eMFLRBjm/tK4uQuuydTAvzlnPv3yL58qzxPAlDy3eKdx3nE5Vja9/lc9XTQ55xsVqE
 pM+KIWLGCRXYxX44PsrZS+1N2dF9/+4oKV2V3meWRQj+O0zqCiZBmCXxjO7P4IRTDkqz
 92Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK2RfJuNnwVC2XfD5QUi7VEjbFFAEC2BJUxU12tkT0pWY8EN7cjw7q/lil/Ww8PMdxDXge7PIbS8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeOiBBvNok0QV8yZOnLxIhP/GcCXB1hw2TaaSu2HVB7wu8mDJ5
 K4Ty4JLW7VDl286IIxjISRXUIg5E+9x59SYcz0M1B3csXZ8Nu7lAkXB29dkA+qPbeIY=
X-Gm-Gg: ASbGncspzmrGnvXTIHSnsFquLytCXyle1VXBSxU1VZkdaUL4o3okrPUBSCSSu0Ge6rN
 cN9Mzn94UwHpFRoNaCpJ0pEk4FL4aTh6/trhL3Ta++7SbnH2jG8XU+J7my2ySUMRF+GcNXGvoD5
 mX0CPNk3H8/ZqpBNuXSgXG58rANZT7PC/8QWLiokKpapEDQ0Zxwl7+a2LdqibYjd8LaZ032ZUp3
 1tpFANnJsLnvx9KUrU8QWmUunyB0l0qCbmsv4Xbe+LQgkzNCyLheYz4MWXFIcMKZyq6YUmh8V8R
 iXiEpScTRUStZzU0KWcbFgoj8hhWlQLG91g8YoEifvP73ggbED6JanoaEyc=
X-Google-Smtp-Source: AGHT+IHpu+7N095Dkvfv/xXCbcaHF/m5rGZUrD4vjHs5Fv7m1f25d05bGH5t9VgB3jR6lHG9xDeaXQ==
X-Received: by 2002:a05:6a21:339b:b0:215:cf53:c35 with SMTP id
 adf61e73a8af0-225ba537030mr18417131637.31.1751869119377; 
 Sun, 06 Jul 2025 23:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:00 +0800
Subject: [PATCH v12 05/12] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-5-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=ZP/NQiBXA71l6lBIz06Tal8NsSeCQ9sxKtlwYnwimsk+bkLSNgzf6+x324sO23baWtdXeQVH3
 a5uYD4cLF8LAbzVyjHaQqjivAn3k4gAxzESl5hHfuqkzoUfhg5MWUMI
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
index 9a40492e5aa961f7180ba4ac6c86e06fcccef8c2..cd0ec3edfe2fa8132e114bc1544c389141d1c1ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -419,7 +419,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
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

