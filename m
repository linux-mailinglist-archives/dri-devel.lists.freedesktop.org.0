Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40547DA36B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 00:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124C10EA5F;
	Fri, 27 Oct 2023 22:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886DF10EA5C;
 Fri, 27 Oct 2023 22:33:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RLok1d006260; Fri, 27 Oct 2023 22:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=4+b9nPJYwirO1OpynkFqM0DnTVQ0cHLWrtHPtICcTB4=;
 b=eCCwPwDSrojcNX9SpHb1WCmFWnWbTe+aEr1veXin3evwLUmti9fz4cFVRXq3xkwg8b0d
 ry6ZUY7FL6m3j2ObAK4+TxZV7Q7/53fl9t0Ewc4/kZK/yLkzHUGw8F3VDyEFzw83KsRK
 elDc8tsG58GRdzM5yVsA4zzQ5CimwMLPlpA4tEHpmSbXfXwech6QcEuBrffcrW8hEgP2
 QwST3V8WT6tw39Ug6cWlT/TCqENagM8rWlLeLQ/edK9ylttdcH/w2SarpZYkW9qhaB3N
 MOe9StuLKmYPHkXZo4gzuIBzTY7F4WGNnKy8zO9OUDiovp2XQSxQI3IKpZFRickweWpF RQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyx3ub6ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RMXSSJ024548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 15:33:28 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 27 Oct 2023 15:32:58 -0700
Subject: [PATCH RFC v7 08/10] drm/msm/dpu: Allow NULL FBs in atomic commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231027-solid-fill-v7-8-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698446005; l=4533;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=P2H4V6BlU3Bj8tpM4bZeTr6OTyat/hRxSqDoNGqg1hY=;
 b=YyWkl8/ZxlWdURzEMzL8VDbtWnwVJ3FxpozDI7aOhrhdGRmqiVNy1GFbkxbW2hQL4Ik3mOCaQ
 WS7HqSZOn9rDBtts8I1jNFgvyyNcqVFQf2i84gV8cdSmI2VYfk+IeDt
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ee0BeFedGPULqPRriAEAeIRI7jFCSQEs
X-Proofpoint-GUID: ee0BeFedGPULqPRriAEAeIRI7jFCSQEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_21,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270193
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since solid fill planes allow for a NULL framebuffer in a valid commit,
add NULL framebuffer checks to atomic commit calls within DPU.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 35 ++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3c475f8042b0..3b9648c679ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -451,6 +451,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct drm_plane_state *state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
+	const struct msm_format *fmt;
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
@@ -470,7 +471,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
+		if (drm_plane_solid_fill_enabled(state))
+			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
+					DRM_FORMAT_ABGR8888, 0);
+		else
+			fmt = msm_framebuffer_format(pstate->base.fb);
+
+		format = to_dpu_format(fmt);
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3eef5e025e12..9615653db787 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -55,6 +55,8 @@
 
 #define DEFAULT_REFRESH_RATE	60
 
+#define DPU_SOLID_FILL_FORMAT	DRM_FORMAT_ABGR8888
+
 static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_ARGB8888,
@@ -658,7 +660,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * select fill format to match user property expectation,
 	 * h/w only supports RGB variants
 	 */
-	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
+	fmt = dpu_get_dpu_format(DPU_SOLID_FILL_FORMAT);
 	/* should not happen ever */
 	if (!fmt)
 		return;
@@ -877,18 +879,23 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 
-	fb_rect.x2 = new_plane_state->fb->width;
-	fb_rect.y2 = new_plane_state->fb->height;
+	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
+		fb_rect.x2 = new_plane_state->fb->width;
+		fb_rect.y2 = new_plane_state->fb->height;
 
-	/* Ensure fb size is supported */
-	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
-		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&fb_rect));
-		return -E2BIG;
+		/* Ensure fb size is supported */
+		if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
+		    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+			DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
+					DRM_RECT_ARG(&fb_rect));
+			return -E2BIG;
+		}
 	}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+	if (drm_plane_solid_fill_enabled(new_plane_state))
+		fmt = dpu_get_dpu_format(DPU_SOLID_FILL_FORMAT);
+	else
+		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
@@ -1123,8 +1130,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
+	const struct dpu_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
@@ -1133,6 +1139,11 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool layout_valid = false;
 	int ret;
 
+	if (drm_plane_solid_fill_enabled(state))
+		return;
+
+	fmt = to_dpu_format(msm_framebuffer_format(fb));
+
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);

-- 
2.42.0

