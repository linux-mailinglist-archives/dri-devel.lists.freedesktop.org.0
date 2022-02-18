Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE394BB81C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB0D10EC4C;
	Fri, 18 Feb 2022 11:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9337910EC4C;
 Fri, 18 Feb 2022 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645183861; x=1676719861;
 h=from:to:cc:subject:date:message-id;
 bh=psg+WGVjYEtfI96XgW3zTOLv9aveKT017gbE39QzLFQ=;
 b=MUwXO964T21nxhzaGLBg2TZWCgDA2Y8g4ntHjkkkdxua/6cTpVnKwZ+Y
 nO9SZpZvx6Z43u+0DN0aspxAvuTJLEuEoJSizfT8XMxKj2nTZToW1lSWN
 QpSRLsDGzUEXzVcAkbC3hnxkDU6FvuJ64CWu75IqteWIH1jcJkGlTd+Ug 8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Feb 2022 03:31:01 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Feb 2022 03:30:59 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 18 Feb 2022 17:00:46 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 2BC544B49; Fri, 18 Feb 2022 17:00:45 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/disp/dpu1: add inline rotation support for sc7280 target
Date: Fri, 18 Feb 2022 17:00:33 +0530
Message-Id: <1645183833-26657-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Some DPU versions support inline rot90. It is supported only for
limited amount of UBWC formats.
- There are two versions of inline rotators, v1 (present on sm8250 and
sm7250) and v2 (sc7280). These versions differ in the list of supported
formats and in the scaler possibilities.

Changes in RFC:
- Rebase changes to the latest code base.
- Append rotation config variables with v2 and
remove unused variables.(Dmitry)
- Move pixel_ext setup separately from scaler3 config.(Dmitry)
- Add 270 degree rotation to supported rotation list.(Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  44 ++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  15 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 105 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
 4 files changed, 134 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa75991..ae17a61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -25,6 +25,9 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
+#define VIG_SC7280_MASK \
+	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
@@ -102,6 +105,8 @@
 #define MAX_DOWNSCALE_RATIO	4
 #define SSPP_UNITY_SCALE	1
 
+#define INLINE_ROTATOR_V2	2
+
 #define STRCAT(X, Y) (X Y)
 
 static const uint32_t plane_formats[] = {
@@ -177,6 +182,11 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_YVU420,
 };
 
+static const uint32_t rotation_v2_formats[] = {
+	DRM_FORMAT_NV12,
+	/* TODO add formats after validation */
+};
+
 /*************************************************************
  * DPU sub blocks config
  *************************************************************/
@@ -465,7 +475,13 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 
 /* SSPP common configuration */
 
-#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
+static const struct dpu_rotation_cfg dpu_rot_cfg_v2 = {
+	.rot_maxheight = 1088,
+	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
+	.rot_format_list = rotation_v2_formats,
+};
+
+#define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
@@ -482,6 +498,7 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
 	.virt_format_list = plane_formats, \
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	.rotation_cfg = rot_cfg, \
 	}
 
 #define _DMA_SBLK(num, sdma_pri) \
@@ -498,13 +515,13 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	}
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3, NULL);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3, NULL);
 
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
@@ -543,7 +560,10 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, NULL);
+
+static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_cfg_v2);
 
 static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
@@ -557,13 +577,13 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE, NULL);
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
@@ -585,8 +605,8 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
+		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 31af04a..ea55f3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -109,6 +109,7 @@ enum {
  * @DPU_SSPP_TS_PREFILL      Supports prefill with traffic shaper
  * @DPU_SSPP_TS_PREFILL_REC1 Supports prefill with traffic shaper multirec
  * @DPU_SSPP_CDP             Supports client driven prefetch
+ * @DPU_SSPP_INLINE_ROTATION Support inline rotation
  * @DPU_SSPP_MAX             maximum value
  */
 enum {
@@ -129,6 +130,7 @@ enum {
 	DPU_SSPP_TS_PREFILL,
 	DPU_SSPP_TS_PREFILL_REC1,
 	DPU_SSPP_CDP,
+	DPU_SSPP_INLINE_ROTATION,
 	DPU_SSPP_MAX
 };
 
@@ -312,6 +314,18 @@ struct dpu_qos_lut_tbl {
 };
 
 /**
+ * struct dpu_rotation_cfg - define inline rotation config
+ * @rot_maxheight: max pre rotated height allowed for rotation
+ * @rot_num_formats: count of the formats
+ * @rot_format_list: list of supported rotator formats
+ */
+struct dpu_rotation_cfg {
+	u32 rot_maxheight;
+	u32 rot_num_formats;
+	const u32 *rot_format_list;
+};
+
+/**
  * struct dpu_caps - define DPU capabilities
  * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
@@ -387,6 +401,7 @@ struct dpu_sspp_sub_blks {
 	u32 num_formats;
 	const u32 *virt_format_list;
 	u32 virt_num_formats;
+	const struct dpu_rotation_cfg *rotation_cfg;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ca75089..39d934f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -528,11 +528,19 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
-		struct dpu_hw_pixel_ext *pixel_ext,
 		const struct dpu_format *fmt,
 		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
 {
 	uint32_t i;
+	bool inline_rotation = (pstate->rotation & DRM_MODE_ROTATE_90);
+
+	/*
+	 * For inline rotation cases, scaler config is post-rotation,
+	 * so swap the dimensions here. However, pixel extension will
+	 * need pre-rotation settings.
+	 */
+	if (inline_rotation)
+		swap(src_w, src_h);
 
 	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
 		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
@@ -571,11 +579,6 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
 		}
-
-		pixel_ext->num_ext_pxls_top[i] =
-			scale_cfg->src_height[i];
-		pixel_ext->num_ext_pxls_left[i] =
-			scale_cfg->src_width[i];
 	}
 	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
 		&& (src_w == dst_w))
@@ -591,6 +594,24 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 	scale_cfg->enable = 1;
 }
 
+static void _dpu_plane_setup_pixel_ext(struct dpu_plane_state *pstate,
+				struct dpu_hw_scaler3_cfg *scale_cfg,
+				struct dpu_hw_pixel_ext *pixel_ext)
+{
+	int i = 0;
+	bool inline_rotation = (pstate->rotation & DRM_MODE_ROTATE_90);
+
+	if (!scale_cfg && !scale_cfg->enable)
+		return;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++) {
+		pixel_ext->num_ext_pxls_top[i] = inline_rotation ?
+				scale_cfg->src_width[i] : scale_cfg->src_height[i];
+		pixel_ext->num_ext_pxls_left[i] = inline_rotation ?
+				scale_cfg->src_height[i] : scale_cfg->src_width[i];
+	}
+}
+
 static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
 	{
 		/* S15.16 format */
@@ -665,9 +686,12 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg->src_rect),
 			drm_rect_width(&pipe_cfg->dst_rect),
 			drm_rect_height(&pipe_cfg->dst_rect),
-			&scaler3_cfg, &pixel_ext, fmt,
+			&scaler3_cfg, fmt,
 			info->hsub, info->vsub);
 
+	/* configure pixel extension based on scalar config */
+	_dpu_plane_setup_pixel_ext(pstate, &scaler3_cfg, &pixel_ext);
+
 	if (pdpu->pipe_hw->ops.setup_pe)
 		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
 				&pixel_ext);
@@ -967,6 +991,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct drm_rect src, dst, fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
+	unsigned int rotation;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1035,6 +1060,48 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	rotation = drm_rotation_simplify(new_plane_state->rotation,
+			    DRM_MODE_ROTATE_0 |
+			    DRM_MODE_ROTATE_90 |
+			    DRM_MODE_REFLECT_X |
+			    DRM_MODE_REFLECT_Y);
+
+	if (rotation & DRM_MODE_ROTATE_90) {
+		const struct msm_format *msm_fmt;
+		const struct dpu_format *fmt;
+		bool found = false;
+		u32 i, num_formats;
+		const u32 *supported_formats;
+
+		if ((pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
+			pdpu->pipe_hw->cap->sblk->rotation_cfg &&
+			(drm_rect_width(&src) >
+				pdpu->pipe_hw->cap->sblk->rotation_cfg->rot_maxheight)) {
+			DPU_DEBUG_PLANE(pdpu,
+			"invalid height for inline rot:%d max:%d\n",
+			src.y2, pdpu->pipe_hw->cap->sblk->rotation_cfg->rot_maxheight);
+			return -EINVAL;
+		}
+
+		msm_fmt = msm_framebuffer_format(new_plane_state->fb);
+		fmt = to_dpu_format(msm_fmt);
+		supported_formats = pdpu->pipe_hw->cap->sblk->rotation_cfg->rot_format_list;
+		num_formats = pdpu->pipe_hw->cap->sblk->rotation_cfg->rot_num_formats;
+
+		for (i = 0; i < num_formats; i++) {
+			/* check for valid formats supported by inline rotation */
+			if (fmt->base.pixel_format == supported_formats[i] &&
+				DPU_FORMAT_IS_UBWC(fmt))
+				found = true;
+		}
+
+		if (!found || !num_formats) {
+			DPU_DEBUG_PLANE(pdpu,
+			"supported_format not found num:%d\n", num_formats);
+			return -EINVAL;
+		}
+	}
+	pstate->rotation = rotation;
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 
 	return 0;
@@ -1150,21 +1217,18 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_mode);
 
 	if (pdpu->pipe_hw->ops.setup_format) {
-		unsigned int rotation;
 
 		src_flags = 0x0;
 
-		rotation = drm_rotation_simplify(state->rotation,
-						 DRM_MODE_ROTATE_0 |
-						 DRM_MODE_REFLECT_X |
-						 DRM_MODE_REFLECT_Y);
-
-		if (rotation & DRM_MODE_REFLECT_X)
+		if (pstate->rotation & DRM_MODE_REFLECT_X)
 			src_flags |= DPU_SSPP_FLIP_LR;
 
-		if (rotation & DRM_MODE_REFLECT_Y)
+		if (pstate->rotation & DRM_MODE_REFLECT_Y)
 			src_flags |= DPU_SSPP_FLIP_UD;
 
+		if (pstate->rotation & DRM_MODE_ROTATE_90)
+			src_flags |= DPU_SSPP_ROT_90;
+
 		/* update format */
 		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
 				pstate->multirect_index);
@@ -1462,6 +1526,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
+	unsigned int supported_rotations = DRM_MODE_ROTATE_0 |
+			DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 
 	/* create and zero local structure */
 	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
@@ -1529,12 +1595,11 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 			BIT(DRM_MODE_BLEND_PREMULTI) |
 			BIT(DRM_MODE_BLEND_COVERAGE));
 
+	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270;
+
 	drm_plane_create_rotation_property(plane,
-			DRM_MODE_ROTATE_0,
-			DRM_MODE_ROTATE_0 |
-			DRM_MODE_ROTATE_180 |
-			DRM_MODE_REFLECT_X |
-			DRM_MODE_REFLECT_Y);
+		    DRM_MODE_ROTATE_0, supported_rotations);
 
 	drm_plane_enable_fb_damage_clips(plane);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 9d51dad..e72da02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -25,6 +25,7 @@
  * @pending:	whether the current update is still pending
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
+ * @rotation: simplified drm rotation hint
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -37,6 +38,7 @@ struct dpu_plane_state {
 
 	u64 plane_fetch_bw;
 	u64 plane_clk;
+	unsigned int rotation;
 };
 
 /**
-- 
2.7.4

