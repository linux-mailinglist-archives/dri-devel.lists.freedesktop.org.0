Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AE65911C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A50610E3F2;
	Thu, 29 Dec 2022 19:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF15C10E279
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b3so28763307lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EanTkNYkXoezMbWbebubDgyE19FVW667E9iSlrU1b8=;
 b=dxb7Liif2AYBkqqeE+UU7DqeVKTdy5WjhaCjoHresQAzvLPYF4lJH8ma2QevoCGYQL
 O+VMXqWR5LdKNjMsZ/L0u75JYJweKIM74D/pZz5whL55MR+zreNVA5HO0tMA9OerXN+b
 4OBizhHji6oR/0FOoVuIwpFJ2geE9t4KCXcag6z3ewHd1qugrz2nLOKjrKdlS8RBKZPJ
 rpAOXPN6TWy/3xY7Wf1EyLCWcwRAGwG4pmjqnU0nLALIN4yEmg0bkp8gAJjE9Ljefn6l
 eBHoF+zIfiYcJ/Ai1WYWybpEvSEenJHeeV/wsASeJNjV7XPcZ4+CME4yZaI4fMtpnC50
 8gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0EanTkNYkXoezMbWbebubDgyE19FVW667E9iSlrU1b8=;
 b=jWVbaqcfPFqL/AbXaNI9x74jrRwopLSbizL3OAlGM8JBgmrAwm2JyVwPro7qBaVAAR
 Uoe0jbDwClgc1AMspBBxvtyiCYuKvpJtdFaviDAFm2Drf1z4KVhUecyakZ5MFISuZnS/
 pqcRgwt7R1v2zVs+0angdRVd7iGdZ9EyZfJa52KbwHuJbb5eKv63WCinbaqZiqs6xvkH
 3a52PF6UqSmnsV9FJjNRUy4FgeW+7DiWYszP5fSHuej+U0f7ghsvu4zeFCPvEyBkujdZ
 HuCRVC1eJSfB8PV5vioke8X0NOCOl7bU8vErH9jEr9GuO7+d+jhbUpsoyRyaxeOf8w5O
 lPfw==
X-Gm-Message-State: AFqh2ko8jm6rDDElvoUUf+VoUiD6t6Z3aFMD6Bwd9Mn/8vtBUMt4BmOr
 lz7NLaqJ3uBJLj8h24NaF4mKqA==
X-Google-Smtp-Source: AMrXdXvF2Hi1So1MmL93Gc7wqXam+VhpJwPgv24G0V2NOT4Sxiw/nUavCvLxafHQ6aj50mEcvHKLFw==
X-Received: by 2002:a05:6512:3d93:b0:4b5:a207:8d70 with SMTP id
 k19-20020a0565123d9300b004b5a2078d70mr9830390lfv.5.1672341560469; 
 Thu, 29 Dec 2022 11:19:20 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 23/27] drm/msm/dpu: rework dpu_plane_atomic_check()
Date: Thu, 29 Dec 2022 21:18:52 +0200
Message-Id: <20221229191856.3508092-24-dmitry.baryshkov@linaro.org>
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

Split pipe-dependent code from dpu_plane_atomic_check() into the
separate function dpu_plane_atomic_check_pipe(). This is one of
preparational steps to add r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 91 +++++++++++++----------
 1 file changed, 53 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b80c5adf91d2..c20e0d9fe0ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -903,6 +903,55 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 	return 0;
 }
 
+static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
+		struct dpu_sw_pipe *pipe,
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		uint32_t max_linewidth,
+		const struct dpu_format *fmt)
+{
+	uint32_t min_src_size;
+
+	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
+
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+		(!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
+		 !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+		DPU_DEBUG_PLANE(pdpu,
+				"plane doesn't have scaler/csc for yuv\n");
+		return -EINVAL;
+
+	/* check src bounds */
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
+		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -E2BIG;
+
+	/* valid yuv image */
+	} else if (DPU_FORMAT_IS_YUV(fmt) &&
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -EINVAL;
+
+	/* min dst support */
+	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
+		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		return -EINVAL;
+
+	/* check decimated source width */
+	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+		return -E2BIG;
+	}
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -915,7 +964,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t min_src_size, max_linewidth;
+	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
@@ -972,43 +1021,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
-	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
-
-	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
-		 !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
-		DPU_DEBUG_PLANE(pdpu,
-				"plane doesn't have scaler/csc for yuv\n");
-		return -EINVAL;
-
-	/* check src bounds */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
-		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
-		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -E2BIG;
-
-	/* valid yuv image */
-	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
-		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
-		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
-		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -EINVAL;
-
-	/* min dst support */
-	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
-		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->dst_rect));
-		return -EINVAL;
-
-	/* check decimated source width */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
-	}
+	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, max_linewidth, fmt);
+	if (ret)
+		return ret;
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
-- 
2.39.0

