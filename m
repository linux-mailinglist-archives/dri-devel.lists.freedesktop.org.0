Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E278BBDF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 02:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC5010E379;
	Tue, 29 Aug 2023 00:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55010E386;
 Tue, 29 Aug 2023 00:06:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SNlNg3022171; Tue, 29 Aug 2023 00:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=76TqzWziDkwzswT+NMTqQ0vqCKEeeVv3QShtmeSxopU=;
 b=AiD6xQAE4xUrtvYfbipbN/Ure6vzUUjmRbFfe597hXxwHsuAdOY3oSGPC64IVC+hnT7+
 bfi6Qpf6e0cdDDRx3DfyeKzk87/Dq/rb1wznwhe1Y75ZkwohjT1dTJJHijk9AEWcOl85
 vuteMQHUEEs1Mk+4jLnmC3Ex+VNEAD1nXDldyGi62gPFzVKZBv8Z/4BzzZzYjZASKjEs
 eYOYBDa34ZgRikTzkh6R1TjDm9D+KBbvH4We9iIaZ3aptKNfwthJ0jzkbDNsP9WIYFHA
 SGlAnCL81ClTa9T8T4HZBD9DE0in8aqpgLavH2g/JWpPVDjZvcYVGt2btxzAvVHgX299 QA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss2xb88yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 00:05:46 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37T05kss017407
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 00:05:46 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 28 Aug 2023 17:05:45 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 28 Aug 2023 17:05:15 -0700
Subject: [PATCH RFC v6 09/10] drm/msm/dpu: Use DRM solid_fill property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230828-solid-fill-v6-9-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
In-Reply-To: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693267543; l=3916;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=eKIojloKXfuapdHjYH76c/hz9iq8bF7GrAGK39D1Q+E=;
 b=4TCM/7HI1LrqVYIQ/jd4U8XlBs6lZ/0JFgSpu+sUaXnlhAo3XtPGlySGhq/AQOj34Zdr3RJ3s
 vZ/uI2g0Ab1ChAdRrWRcDqdXD6R31HKBtD1/eD5g0Lo4LeRYcsUR/qw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jcwxXUq1vj0YLl6yiont_AX-jKQzWH1n
X-Proofpoint-GUID: jcwxXUq1vj0YLl6yiont_AX-jKQzWH1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_19,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308280207
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

Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
determine if the plane is solid fill. In addition drop the DPU plane
color_fill field as we can now use drm_plane_state.solid_fill instead,
and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
allow userspace to configure the alpha value for the solid fill color.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 114c803ff99b..639ecbeeacf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -42,7 +42,6 @@
 #define SHARP_SMOOTH_THR_DEFAULT	8
 #define SHARP_NOISE_THR_DEFAULT	2
 
-#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
 #define DPU_ZPOS_MAX 255
 
 /*
@@ -82,7 +81,6 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
 	const struct dpu_mdss_cfg *catalog;
@@ -606,19 +604,35 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
 }
 
+static uint32_t _dpu_plane_get_abgr_fill_color(struct drm_plane_state *state)
+{
+	struct drm_solid_fill solid_fill = state->solid_fill;
+
+	uint32_t ret = 0;
+	uint8_t a = state->alpha & 0xFF;
+	uint8_t b = solid_fill.b >> 24;
+	uint8_t g = solid_fill.g >> 24;
+	uint8_t r = solid_fill.r >> 24;
+
+	ret |= a << 24;
+	ret |= b << 16;
+	ret |= g << 8;
+	ret |= r;
+
+	return ret;
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
  * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
  * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
  */
-static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
-		uint32_t color, uint32_t alpha)
+static void _dpu_plane_color_fill(struct dpu_plane *pdpu, uint32_t color)
 {
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -633,11 +647,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 
 	/* update sspp */
 	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
-				   fill_color, fmt);
+				   color, fmt);
 
 	if (pstate->r_pipe.sspp)
 		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
-					   fill_color, fmt);
+					   color, fmt);
 }
 
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
@@ -976,10 +990,9 @@ void dpu_plane_flush(struct drm_plane *plane)
 	 */
 	if (pdpu->is_error)
 		/* force white frame with 100% alpha pipe output on error */
-		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
-	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
-		/* force 100% alpha */
-		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
+		_dpu_plane_color_fill(pdpu, 0xFFFFFFFF);
+	else if (drm_plane_solid_fill_enabled(plane->state))
+		_dpu_plane_color_fill(pdpu, _dpu_plane_get_abgr_fill_color(plane->state));
 	else {
 		dpu_plane_flush_csc(pdpu, &pstate->pipe);
 		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
@@ -1024,7 +1037,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	}
 
 	/* override for color fill */
-	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+	if (drm_plane_solid_fill_enabled(plane->state)) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, false);
 
 		/* skip remaining processing on color fill */

-- 
2.42.0

