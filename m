Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C153AAC9D6
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4A610E6E5;
	Tue,  6 May 2025 15:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FSaGlqy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25DF10E6E5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:48:00 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b0b2ce7cc81so5271223a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546480; x=1747151280; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kxt4igjGW7kIkwK3pM9gIy1N3ytZL+6O3l4DQKM/gJw=;
 b=FSaGlqy74GSRh6fLUKmbnUc+U8QJJ73JdvaoaMyBfdWEVelFAMVpsT/1Zc3Lv8W/iQ
 bRvtv/8NhW6gcCup79dvM8+uB8JsTQO5DYw9z9IegyJEY9BL7xhE2xQgJSZ6ASqLFkhN
 IR6N5cZLlg//kwtpXyRX1FR3oo+9EWgjcwTQLY6THbwFuE92HQqu2IRDoPLt+XPdfMOL
 QIoqMV/UbgGalo12Zslfy+aCIrPsdOqw1YBOPXaiHwEztWwE9J+oJl2hGUfyCM/NMUQM
 gQoaX55l5yhMNSETdSpO1oszL8VF3k/IFazyooUAlHIBU2xuKAkU5BB+wT1cnLnBWSGR
 /KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546480; x=1747151280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxt4igjGW7kIkwK3pM9gIy1N3ytZL+6O3l4DQKM/gJw=;
 b=I6DfLyXtY73U0o/gj/p3Lq6wllemNS/iAAfz+OF1LtmIzAr7a5Z5fTQoBPqMMDSpLq
 lWnl1AeY9nKKwd5PZIMVrUW22zzE93n+BIOup+F4yPD6PCjQmyEu22zxaF6w0mQQ/L6q
 rWrOq/UBS8m7cVHwEZEUaTxenqgQDcvRnD7RlbcUFTwMUMGmTA/4oFEJLX2PuTObY91S
 fjVb8K+6sarrFp1Bkz0XvdPHTTYL44pCOyq4wKJ+V3mKIKCp8D8f4a0M/SwkfWEWlHyH
 X+2wfIU/UpMQIKZNSDTKaml3DF65W8RB1ADFaOv+WfREF9IRe6sluD7WSUz2UbwXNspx
 rA9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMPHy8I1wO7FCs1iVgap6Snc3TloDHrJ584qGD0vG8O5wNODWwUcDdKkftDaCVKy2lhKYh+7msdw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzgrdYfwZgUf7q/8FCTwNItJKDkBMw5vqsqhSahoQ+5rDaqqkx
 C7hqAQmiFq1V4CLr1oiEMfcJ0xuQY0ErWJk/EbOfGXpBifNT/wgP9ZCNUWay9mU=
X-Gm-Gg: ASbGncuDEqO6M6Jyr50pzxBcsB/Z3TG9Fgw19to5RcR20koeqcwtzDWs1HnfncWQEke
 yw68DQXhx2b25wQIE63bxkZPaOfjg9J/loToXQqh+P+iy6UwC7D9nlngAWbvxk269gVmSB+oaLG
 GigvSDy5RlYpe6tkdxZ2JRSPIl/mUagNLuYIlXdIZXyghLiYggjQjWteQYVdcChl4hvOxRy3mFK
 FYgnAmffhlpKiMFjASgPovDqpPt208hcWHUCaZqW16AL3KyFW1xACn3iYYj7Z13R6c+9DpOzDar
 CVuNt8Bh4hvNOPHMgXG6ie4P8ImEw+1XnXeerw==
X-Google-Smtp-Source: AGHT+IGb9+FnWo9267p0fx9BjNEIUzoXBumtQrk1tj78WuYav0rpIxj/FofGZuV9inH/1ziOSB8zHw==
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id
 98e67ed59e1d1-30a6198dbf4mr18334411a91.14.1746546480278; 
 Tue, 06 May 2025 08:48:00 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:47:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:32 +0800
Subject: [PATCH v9 02/14] drm/msm/dpu: check every pipe per capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-2-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=4444;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=p/aL3lRyLhuiXRZaetD8VgLDL3qdvShcJvN5F//fxjo=;
 b=Eu02LrLr8B5tRbqz0tapuLHeVERr3KGsTPNNfTOCcvbI4dFAlxSJJiul1hzEsT4Uk/acHRoPe
 qL/UUJrq7RDBHQEHEyKnsXHUTKXLIq/A+4kVnxZBQHfMoqEBBWwmY9X
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

The capability stored in sblk and pipe_hw_caps is checked only for
SSPP of the first pipe in the pair with current implementation. That
of the 2nd pipe, r_pipe, is not checked and may violate hardware
capability. Move requirement check to dpu_plane_atomic_check_pipe()
for the check of every pipe.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c303eb5212524e877129359b5ca98c..aeb90c287245d6aaa18b9f280d1e628ee6ed74f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct msm_format *fmt,
-		const struct drm_display_mode *mode)
+		const struct drm_display_mode *mode,
+		struct drm_plane_state *new_plane_state)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
+	const struct msm_format *fmt;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
 	int ret = 0;
 
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	/*
-	 * We already have verified scaling against platform limitations.
-	 * Now check if the SSPP supports scaling at all.
-	 */
-	if (!sblk->scaler_blk.len &&
-	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
-	      drm_rect_width(&new_plane_state->dst)) ||
-	     (drm_rect_height(&new_plane_state->src) >> 16 !=
-	      drm_rect_height(&new_plane_state->dst))))
-		return -ERANGE;
-
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
-						   supported_rotations);
-	r_pipe_cfg->rotation = pipe_cfg->rotation;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
-					  &crtc_state->adjusted_mode);
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+					  &crtc_state->adjusted_mode,
+					  new_plane_state);
 	if (ret)
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1

