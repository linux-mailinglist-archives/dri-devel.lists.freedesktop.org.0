Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC46B99B1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6110EAB7;
	Tue, 14 Mar 2023 15:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7C10EA85
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:36:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h3so16423878lja.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8EB9V2/nugBz4PNqz/KJnYFP9kIxTNFEEQ+Jgwdgds=;
 b=VIuyNcua7zKmnoev7Cp7s1yhp/fZ1aROY7Ws1JV0/rYsvfheFhks/bXs9rLuioarYE
 W5B/t/idVMeLT1TYvdyVggzWc/d9oo6JfvX8kZLZa7PX8EA4PdsegD9H8JZ0NYSR0/Bb
 pe2OQkIgFfv1GLtETFFAm1DCEoR3bI1qLlhaJyGtl0rYWUB3K4QqM3kE7n4Vi1iCEV0V
 IzbYo02PjybO5r3RGzNaVNuiP815l2valazhImxnRod0LPKxql8Wk5USoK5eWDq4fOK7
 SdIzYF1pcewhRqx/q5UalRyRwIbE4xlh3mCiazL9S+9PjeXqfstpsYsqBFsf6fwiTRjf
 Y9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x8EB9V2/nugBz4PNqz/KJnYFP9kIxTNFEEQ+Jgwdgds=;
 b=tXROxoY4iXvHmYFp4LPfMvPl+b6XJLyIcXQgUvH8qfrMVu2m1KnzjjnQRV0ilKhzcE
 jLnHFv44GwOWgUmoz+P3DY+NwZo588Vjb3s3T5sTWYQpFJfix41SVqgJhlZ78mzDFPsa
 2yC3I7y65eF7YuWAEg08e4mi1IQCOnbMlDLBjrb3iTV345AsCVFbi/Pt+7wpV4LzNpnZ
 +zwmTMHr7Qlt9NqN37Av8dX/nGxWdfHvcCNUo78Q9dPTnQ/dAAKX8r4M82+jWTfWAezN
 O1laB2InE1XSZyHVCyVwxRlwRSTi+5+fL+sN09X27Obtq+VcTJYRDJCfqQgb/oZkqHGZ
 yH4Q==
X-Gm-Message-State: AO0yUKWL5I9BV4md+cS4U3e21uLqHDgeqRe8T1gE80XsBzxj1GZN3BFn
 hUOD7zNLaSnMVNSm8WIqbiKSIg==
X-Google-Smtp-Source: AK7set/wa4Kvwi8HukkGM9xaLqaolkfS2S7Lo2BD9M4CkJH7orgNJkqM6O686tqO0YZe4TLxYRZfGQ==
X-Received: by 2002:a2e:9790:0:b0:295:b432:2062 with SMTP id
 y16-20020a2e9790000000b00295b4322062mr11936947lji.36.1678808162771; 
 Tue, 14 Mar 2023 08:36:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:36:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 23/32] drm/msm/dpu: rework dpu_plane_atomic_check()
Date: Tue, 14 Mar 2023 18:35:36 +0300
Message-Id: <20230314153545.3442879-24-dmitry.baryshkov@linaro.org>
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

Split pipe-dependent code from dpu_plane_atomic_check() into the
separate function dpu_plane_atomic_check_pipe(). This is one of
preparational steps to add r_pipe support.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 91 ++++++++++++++---------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f97ea39423a2..61994d1fff36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -903,6 +903,53 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 	return 0;
 }
 
+static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
+		struct dpu_sw_pipe *pipe,
+		struct dpu_sw_pipe_cfg *pipe_cfg,
+		const struct dpu_format *fmt)
+{
+	uint32_t min_src_size;
+
+	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
+
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+	    (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
+	     !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+		DPU_DEBUG_PLANE(pdpu,
+				"plane doesn't have scaler/csc for yuv\n");
+		return -EINVAL;
+	}
+
+	/* check src bounds */
+	if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+	    drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
+		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -E2BIG;
+	}
+
+	/* valid yuv image */
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+	    (pipe_cfg->src_rect.x1 & 0x1 ||
+	     pipe_cfg->src_rect.y1 & 0x1 ||
+	     drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+	     drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -EINVAL;
+	}
+
+	/* min dst support */
+	if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 ||
+	    drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
+		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -915,7 +962,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t min_src_size, max_linewidth;
+	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
@@ -970,47 +1017,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
-
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
-	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 ||
-		   drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
-		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->dst_rect));
-		return -EINVAL;
-
 	/* check decimated source width */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
 		return -E2BIG;
 	}
 
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
+	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
+	if (ret)
+		return ret;
+
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-- 
2.30.2

