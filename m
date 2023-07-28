Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E47672CB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6710E748;
	Fri, 28 Jul 2023 17:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380210E72D;
 Fri, 28 Jul 2023 17:03:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SFFPTC019690; Fri, 28 Jul 2023 17:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=hJNADWSnb8QpOtbLXd4223ova8BIKtB/kc5vzGW+xtA=;
 b=WQLsguP1n20c4mfWAYngsHVGF1FbgNOs5XiYR7VcotbvEvOR7JO7hxFM8vUxWTB6Ktzv
 I5MjxzA+zm651O0VW2L2PUORKTkNO5NEeet43X0HWSrkzsbr98x1YTN5DgNs6qh6hztv
 yRZ9lvm6wlKnT+igrr6OhNWe47Q2SLSgoWANjnsebXR7NwOBNhquWL1D1ps6Psp8Xeho
 f6/7u7gE9V9RcLyC0PtoX4PzcULm6mQExe1Zy9hlgjUPIFuF9BqYWmmYYVTzAV8gyYgu
 DoyMcwAbaGn+ptrrqYJ1oe43OPCGe1K772BDnpkqf5XHNWn6s6JiLwLOWVmNePYqAd+G GQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s469hhhgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:56 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SH2tqG024430
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:55 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 10:02:55 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 28 Jul 2023 10:02:18 -0700
Subject: [PATCH RFC v5 09/10] drm/msm/dpu: Use DRM solid_fill property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230728-solid-fill-v5-9-053dbefa909c@quicinc.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690563772; l=2736;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=mCOIAV7DV91a2p7k0jB8pDYlNQo+wL3EiDjmPUIw/l8=;
 b=6u3q9ZyoFxhB7hKivm4e0+YoziR5whEKqNwU9zC1rEVvhj5RuDQPFtBCtk9m8hDiDcZtRMaiv
 Ts+QEV9zUHrAu1P8GP6u8jpUz/ZPtstMi+KDaOF+cgwT+YyYPaGRlh0
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MdNbo0db1hA_n6azO-Qz8M6R5rDlnsmP
X-Proofpoint-GUID: MdNbo0db1hA_n6azO-Qz8M6R5rDlnsmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307280154
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 114c803ff99b..95fc0394d13e 100644
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
@@ -606,6 +604,20 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
 }
 
+static uint32_t _dpu_plane_get_bgr_fill_color(struct drm_solid_fill solid_fill)
+{
+	uint32_t ret = 0;
+	uint8_t b = solid_fill.b >> 24;
+	uint8_t g = solid_fill.g >> 24;
+	uint8_t r = solid_fill.r >> 24;
+
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
@@ -977,9 +989,9 @@ void dpu_plane_flush(struct drm_plane *plane)
 	if (pdpu->is_error)
 		/* force white frame with 100% alpha pipe output on error */
 		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
-	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
-		/* force 100% alpha */
-		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
+	else if (drm_plane_solid_fill_enabled(plane->state))
+		_dpu_plane_color_fill(pdpu, _dpu_plane_get_bgr_fill_color(plane->state->solid_fill),
+				plane->state->alpha);
 	else {
 		dpu_plane_flush_csc(pdpu, &pstate->pipe);
 		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
@@ -1024,7 +1036,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	}
 
 	/* override for color fill */
-	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+	if (drm_plane_solid_fill_enabled(plane->state)) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, false);
 
 		/* skip remaining processing on color fill */

-- 
2.41.0

