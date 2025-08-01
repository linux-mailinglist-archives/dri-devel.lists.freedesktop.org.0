Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA13B18486
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338F110E8AF;
	Fri,  1 Aug 2025 15:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zZ2iQWK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6117310E8BB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:25 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2401b855980so17938115ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060905; x=1754665705; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=zZ2iQWK6vZSdLZ/4FS1TwmXQNyh4PoyAvq7O5e9kzEZffHlIZwxzu1exnOi8KtxJ0s
 Yp5O0fXkexX1va4dTqXD2ry1yl3gVgHu0zRxPx49FwbWoCWnbJEI/YNnksp+lYka/v3v
 EFSxpjCd6NabvhV2H/kYsM6QLJ2NW+GkyCq5BI8CLk+pCQNkFVzC9ck4DqMYch7FA7/l
 UlwpBztqUVvZIFkI8z86RCNdUK07U0t3nLW1aLzmHhJnCnq2HezzmMRAyMKfXH/uCt8t
 8SYJ4s3gKBwg6Yy304MyntiKKABC9o3XkUiSZzpGu3fiiqMCSR+ISBqP64G6VwCJ7DJq
 UoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060905; x=1754665705;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=lfAC7eHpgZf4cqMYgsBeE6ZJimAVDKBExBgv40xweH7KnS8UoNgVHv/fYs3Ei6l5Mr
 lzR6bF4Jkdr0n55+VQ2ISBeBYrtG56bitJG4mL0oCEAZOI4XJjWuijw3IPEq9bFJoe0W
 1+848/2uxyywHsg9/qjJoeiTHQEXN7wMZZucP/BLfG1GC4IR+EYm5ObZemYPT1CcptJ8
 mz4DWKxkYTTqCm2L+PdKsQc/dWeUQ/d/2F2C4IsfzPgNzfh1xoKwCz3yQG6UoFgLR5q+
 LBxSrBAGlQDJkow6eDtoOPLvWJlNIMKfKnOadhvPw7vKDemm2w7JMpk7rD+rhE59Dcpw
 HMnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY+FnSshRVhLz5wGBffUZGqq4DuhqZ3opBUf0aXyZ4DRf764NBM80BKiKJKuRLfgA756NkWsKLd6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaXFqGW1HDPSG8pucPMeIkbUWEoIADn9BsfRluTd9gRFDxsHM1
 M1tkifvXWnzGgaT7redqQ1E9wpg2RsNZbCTZBGtBk5gtFXVanbvMvzD8XOtDbE47ESs=
X-Gm-Gg: ASbGncuGBLRojhTnQemYUQH2xOVhc/NMvpGqFtrRpsqMHcQ9rrup6oXNbahDRKFO+4z
 nC/Etg5ezrBOXn0AbI3Uce/SIJaPM5BIDHuAFd/byvHexD5mumFmDwXcxcXDGiH0KJKBeu2Zf0o
 Mw4wUwTRyxqQdR0kQEXzVX6fW0w/eLry3zp/pJ0J2B7sP8ZYFVUzC8AM/ONDaaY91aK6PIizX8T
 bCcQ4Ja0CzbC79rxgPhCAka+hbz1+jkQV4WC1bLd2ZMAZqXlycyKPP2LGs+t6z4yqSXx04nGfDJ
 pfNu3jCrQIu0+5jhTAHi5g0bs/wZt/fS8ALEDGe3SpskPLVavHQQTh5egnBRJYxTZmeYAH8v8eP
 OJPeNL8QTqHxJxMbWjw==
X-Google-Smtp-Source: AGHT+IH3rFRxJbNEGoIdlXfKI3ngk9xo4zAbircoTLi1exmZLBTo2nsmpqb/YUonhRbOCVX2aImZLw==
X-Received: by 2002:a17:902:8604:b0:240:7fb:cb05 with SMTP id
 d9443c01a7336-24096a4735emr123884225ad.10.1754060904805; 
 Fri, 01 Aug 2025 08:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:30 +0800
Subject: [PATCH v14 06/13] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-6-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=PumtsqWG7lAhrbJemwLfsU2Y/RTvVTcmMraC19wGoL0TORM9byUPT7MayzR9kpGKNZg9iVH2X
 PxhaWYom6+sAVwBecB/T1mVg7v9mGANR84aZ/A4gNhLkC6vykj8nEdQ
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

