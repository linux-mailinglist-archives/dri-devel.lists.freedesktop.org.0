Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6165483F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD4B10E597;
	Thu, 22 Dec 2022 22:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9910E593;
 Thu, 22 Dec 2022 22:15:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMLcPdv000826; Thu, 22 Dec 2022 22:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rLCLAkCOSO5a6DBivav4Cuv7JOvOGIwCLvYQv7LH0UU=;
 b=huahQ98nijjOxn38fWMIoHBJKW2J0m+cFkgT0oyHHniMpl77LumW9jSmvv36A5N419+I
 1nJG02VGH9LpXEEqEarr/GR+VffaivOA9BW5d2ntbDt0pzwcZh55wZeAhsm/pKwSBi4Q
 VjzsLSu78MwHXu4bL3fDzhTpkl9xL5PEka6YxzFznRqHEQcohNtwK4iPtofuC/tzLKMV
 KgSZxrAqUAZL0atbrN39Yxiak5QUO5WQWVTo6WaGGJjVK9h22b503A/KNZctVk19YCf2
 bCD2bXz74dNmnIhTL7RKkQw3MGMT8j9Tyn9dtuZZRHzSjH8/d9c6Mixh8BlqKnPHs8+v 0Q== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm6hmk522-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 22:15:11 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com
 [10.53.140.1])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMMFBLA023241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 22:15:11 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 14:15:09 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v2 3/3] drm/msm/dpu: Use color_fill property for DPU planes
Date: Thu, 22 Dec 2022 14:14:41 -0800
Message-ID: <20221222221441.6980-4-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ft67M6jBMHA24ekBF3S8gPoHQK7u7yz1
X-Proofpoint-ORIG-GUID: Ft67M6jBMHA24ekBF3S8gPoHQK7u7yz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_10,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=968 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220188
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize and use the color_fill properties for planes in DPU driver. In
addition, relax framebuffer requirements within atomic commit path and
add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
as it's unused.

Changes since V2:
- Fixed dropped 'const' warning
- Dropped use of solid_fill_format
- Switched to using drm_plane_solid_fill_enabled helper method
- Added helper to convert color fill to BGR888 (Rob)
- Added support for solid fill on planes of varying sizes
- Removed DPU_PLANE_COLOR_FILL_FLAG

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
 2 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..0695b70ea1b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct drm_plane_state *state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
+	const struct msm_format *fmt;
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
@@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 				sspp_idx - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
-		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
+		if (pstate->base.fb)
+			fmt = msm_framebuffer_format(pstate->base.fb);
+		else
+			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
+					DRM_FORMAT_ABGR8888, 0);
+
+		format = to_dpu_format(fmt);
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 86719020afe2..51a7507373f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -44,7 +44,6 @@
 
 #define DPU_NAME_SIZE  12
 
-#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
 #define DPU_ZPOS_MAX 255
 
 /* multirect rect index */
@@ -105,7 +104,6 @@ struct dpu_plane {
 	enum dpu_sspp pipe;
 
 	struct dpu_hw_pipe *pipe_hw;
-	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
 	const struct dpu_mdss_cfg *catalog;
@@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 				&scaler3_cfg);
 }
 
+static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fill)
+{
+	uint32_t ret = 0;
+
+	ret |= ((uint8_t) solid_fill.b) << 16;
+	ret |= ((uint8_t) solid_fill.g) << 8;
+	ret |= ((uint8_t) solid_fill.r);
+
+	return ret;
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
@@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	dst = drm_plane_state_dest(new_plane_state);
 
-	fb_rect.x2 = new_plane_state->fb->width;
-	fb_rect.y2 = new_plane_state->fb->height;
+	if (new_plane_state->fb) {
+		fb_rect.x2 = new_plane_state->fb->width;
+		fb_rect.y2 = new_plane_state->fb->height;
+	}
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+	if (new_plane_state->fb)
+		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+	else
+		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
+	} else if (new_plane_state->fb && !dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&src));
 		return -E2BIG;
@@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
 	if (pdpu->is_error)
 		/* force white frame with 100% alpha pipe output on error */
 		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
-	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
+	else if (!(plane->state->fb) && drm_plane_solid_fill_enabled(plane->state))
 		/* force 100% alpha */
-		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
+		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
+				0xFF);
 	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
 		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
@@ -1127,23 +1142,30 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe, update_qos_remap;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
+	const struct dpu_format *fmt;
 	struct dpu_hw_pipe_cfg pipe_cfg;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
-
-	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
-
 	pstate->pending = true;
 
 	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
 	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
 
-	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
-			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+	/* override for color fill */
+	if (!fb && drm_plane_solid_fill_enabled(plane->state)) {
+		/* skip remaining processing on color fill */
+		return;
+	}
+
+	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
+
+	fmt = to_dpu_format(msm_framebuffer_format(fb));
+	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
+
+	if (fb)
+		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
+				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+				crtc->base.id, DRM_RECT_ARG(&state->dst),
+				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
 	pipe_cfg.src_rect = state->src;
 
@@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pipe_cfg.dst_rect = state->dst;
 
-	/* override for color fill */
-	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
-		/* skip remaining processing on color fill */
-		return;
-	}
-
 	if (pdpu->pipe_hw->ops.setup_rects) {
 		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
 				&pipe_cfg,
@@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
 	drm_plane_create_alpha_property(plane);
+	drm_plane_create_solid_fill_property(plane);
 	drm_plane_create_blend_mode_property(plane,
 			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 			BIT(DRM_MODE_BLEND_PREMULTI) |
-- 
2.38.1

