Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931B779F9E0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1782010E505;
	Thu, 14 Sep 2023 05:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002AF10E4FD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:13 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bfb1167277so7845051fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668032; x=1695272832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAJOYbkCwi6igXorCw7AL5xujbFojr8I27YXVJp7tDQ=;
 b=awQowzm+6zJY2YgiOlnMHRn2p7lst54cwFOnOxf4o6pXyfXYNzm9UJLc79M5EZiMUk
 rBM7pi8T7DSRpo5ZjjVlDh0MDlrOK+lF8e++xK+HTVwIwxCNOTVi1PwuhW1f3l49yXcT
 TxQlVug5oIK50Y0XWXTqKYQPtJQryJsnApMeI7m2x1fhDyXssgbm3kGOvanfxA6KrjWQ
 LK/zGjXaxdg+WXYAJu+3QrlX/kImxUMO/cEt+daFlFmlrxyvHsi1Qw7bhEaetlNKQY07
 zj8EkMi+yCdIZu3dw3IjMtyK9roR3qB/ndi6dakeIWWnQ4witBq8YqS7eZJPpBPhHsan
 K50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668032; x=1695272832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAJOYbkCwi6igXorCw7AL5xujbFojr8I27YXVJp7tDQ=;
 b=K43ZTuEl2i/8c+HcR5HtKcQvureDSGMujHSSVlf00Oir83+glpXi2uL1FQOC7tdwHA
 jZMdiUgIDaqjK7FJ/OI+YvceSpjX/YMZD+EVDu8XI1gjkZCAloHlpe7fijSwQOPsO05l
 VoD0vJLgbdNFxH9UNxHOsT4lvn5Pk07TFhrg9P2Iq8PwbiV2JH7liz3/3f/hA2BltTKd
 sq9f5wk3yspXQT+4VFVOiJ2kV7+ba65jAQYSv3L1PsLiodjNF9a81ZO0FL4V0u0meYhH
 QNFPs39M8ksvBu19YIJhMK9U25Ad/yGrsTJ9jUqUuV9ZG1r68i8vYwaypL8PSFEq0m8x
 k2Cw==
X-Gm-Message-State: AOJu0Yzd3+WSRqGVEFVTnuwvOsqri7tUZWity2A9v1JKMXO55iliDSMg
 IhNIt9yqfwzv41fXQft842+vyA==
X-Google-Smtp-Source: AGHT+IGz5aVaT6PloYyby22j6mw84AN51ePTCrlaMkUGulLfiTf40LDUKkyueI3vPK/CKNOUy4Lyhw==
X-Received: by 2002:a2e:948a:0:b0:2b9:b4eb:c39c with SMTP id
 c10-20020a2e948a000000b002b9b4ebc39cmr3419546ljh.8.1694668032197; 
 Wed, 13 Sep 2023 22:07:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 06/12] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_pipe()
Date: Thu, 14 Sep 2023 08:07:00 +0300
Message-Id: <20230914050706.1058620-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

Move a call to dpu_plane_check_inline_rotation() to the
dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
are checked for both pipes. Also move rotation field from struct
dpu_plane_state to struct dpu_sw_pipe_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 -
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..21b0c5a13ba8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -157,10 +157,12 @@ struct dpu_hw_pixel_ext {
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
+ * @rotation: simplified drm rotation hint
  */
 struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
+	unsigned int rotation;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4b1fbe9dbb3f..4cf69f93b44f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -527,8 +527,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
 
 static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_sw_pipe_cfg *pipe_cfg,
-		unsigned int rotation)
+		struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
@@ -551,7 +550,7 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 			dst_height,
 			&scaler3_cfg, fmt,
 			info->hsub, info->vsub,
-			rotation);
+			pipe_cfg->rotation);
 
 	/* configure pixel extension based on scalar config */
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
@@ -603,7 +602,7 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 	if (pipe->sspp->ops.setup_rects)
 		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
 
-	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg);
 }
 
 /**
@@ -703,12 +702,17 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
-						const struct dpu_sspp_sub_blks *sblk,
-						struct drm_rect src, const struct dpu_format *fmt)
+					   struct dpu_sw_pipe *pipe,
+					   struct drm_rect src,
+					   const struct dpu_format *fmt)
 {
+	const struct dpu_sspp_sub_blks *sblk = pipe->sspp->cap->sblk;
 	size_t num_formats;
 	const u32 *supported_formats;
 
+	if (!test_bit(DPU_SSPP_INLINE_ROTATION, &pipe->sspp->cap->features))
+		return -EINVAL;
+
 	if (!sblk->rotation_cfg) {
 		DPU_ERROR("invalid rotation cfg\n");
 		return -EINVAL;
@@ -736,6 +740,7 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		const struct dpu_format *fmt)
 {
 	uint32_t min_src_size;
+	int ret;
 
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -774,6 +779,12 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		return -EINVAL;
 	}
 
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90) {
+		ret = dpu_plane_check_inline_rotation(pdpu, pipe, pipe_cfg->src_rect, fmt);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -870,7 +881,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	uint32_t max_linewidth;
-	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -894,6 +904,15 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
+	r_pipe_cfg->rotation = pipe_cfg->rotation;
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
@@ -915,6 +934,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
 		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
 		    DPU_FORMAT_IS_YUV(fmt)) {
 			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
 					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
@@ -937,23 +957,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 			return ret;
 	}
 
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	rotation = drm_rotation_simplify(new_plane_state->rotation,
-					supported_rotations);
-
-	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
-		(rotation & DRM_MODE_ROTATE_90)) {
-		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
-		if (ret)
-			return ret;
-	}
-
-	pstate->rotation = rotation;
-
 	return 0;
 }
 
@@ -1093,14 +1096,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
 				pipe);
 
 	if (pipe->sspp->ops.setup_format) {
-		unsigned int rotation = pstate->rotation;
+		unsigned int rotation = pipe_cfg->rotation;
 
 		src_flags = 0x0;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..a3ae45dc95d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -30,7 +30,6 @@
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
- * @rotation: simplified drm rotation hint
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -47,7 +46,6 @@ struct dpu_plane_state {
 	u64 plane_clk;
 
 	bool needs_dirtyfb;
-	unsigned int rotation;
 };
 
 #define to_dpu_plane_state(x) \
-- 
2.39.2

