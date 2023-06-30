Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B77431B3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3565210E42C;
	Fri, 30 Jun 2023 00:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3949C10E412;
 Fri, 30 Jun 2023 00:25:57 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35TNdDNk029656; Fri, 30 Jun 2023 00:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=VdyE04PMuyWySXPu+KLrccTmmSzPdYZCdQoG9su95G0=;
 b=H0LvHQaCcZm9zT4YMUiVLqDNXaJz7DTvtpwf/XLkI4WzRnFjb4TO65XbOb4bq4opB5mQ
 JBr++KpgYluM5ZkIz+pyCqxe5wwXubAWjE5IdZIW/DyFOdO2N6UsFBBnzN1hT/VM/xrA
 PIlrUqDGi+HVqRAUe9x+JZsgJeFQRNCL8pPWxhY0EuwTuB1RFxLprfbcyJuBXe28wcf4
 exPzNMKMcmv5pgvaLYfSSePp9/oVD7I+/lTgwObpojVhvannM8IWb1sfaVe9sgBpq2pE
 Q7Ub95/4h0DA5ey9c6Kty8vT3yL2ZVNVJGs7o8cPLEQaz4WB6s9j/dvXlN6tr9vEgTK3 7Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh7s2snsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:38 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U0PcgW011879
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:38 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 29 Jun 2023 17:25:37 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Jun 2023 17:25:06 -0700
Subject: [PATCH RFC v4 7/7] drm/msm/dpu: Use DRM solid_fill property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688084735; l=2628;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Q6YT7JmnABMfvQNkdhBy2arK3XommClX1EdAKqfP+QM=;
 b=/qZT2Rvn2W773gQK+NQti5mQEg81KawDk6EQmR4vFrr0vMLQigyNupmLnCPfuD5SDESWuO1EM
 8gquU1xJ7nACem9k06QOwZnQr7f9PhvsqqFJZJNH2vgTmyqD3Doq9ej
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YjYD-qZFVh6nj_7yRLKaNzJB21Syhyul
X-Proofpoint-ORIG-GUID: YjYD-qZFVh6nj_7yRLKaNzJB21Syhyul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300002
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

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4476722f03bb..11d4fb771a1f 100644
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
@@ -606,6 +604,17 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
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
@@ -977,9 +986,9 @@ void dpu_plane_flush(struct drm_plane *plane)
 	if (pdpu->is_error)
 		/* force white frame with 100% alpha pipe output on error */
 		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
-	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
-		/* force 100% alpha */
-		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
+	else if (drm_plane_solid_fill_enabled(plane->state))
+		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
+				plane->state->alpha);
 	else {
 		dpu_plane_flush_csc(pdpu, &pstate->pipe);
 		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
@@ -1024,7 +1033,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	}
 
 	/* override for color fill */
-	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+	if (drm_plane_solid_fill_enabled(plane->state)) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, false);
 
 		/* skip remaining processing on color fill */

-- 
2.41.0

