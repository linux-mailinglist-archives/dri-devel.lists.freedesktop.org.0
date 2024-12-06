Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886049E6599
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3010E609;
	Fri,  6 Dec 2024 04:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="leqZ9Xsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE33210E5E8;
 Fri,  6 Dec 2024 04:33:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaHJq017292;
 Fri, 6 Dec 2024 04:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LRiwtNxhkP8Tc61SBScl0UVwLEaU3DjKcJB+ib9al+U=; b=leqZ9Xsx2iCIxCVh
 rJqCO8pHbVpHok8tHkxYhsphEqmN1LtzY3+2oEVH5BhqsF2/XkIaumkY+ji43qQ3
 /Lh1gzU3j5I+o5TJeX9/wvFzw8LsGiOUhdMBnSx5u8aM6QxubXSrThzMFk9dZHiR
 f7IPtlEEBgh7aAD3r2FULJtF5RJDIIWOyUqAmVElFefYXQ0KCGesEjx72gp8NwIa
 rovKHccRtiok3pZ2n5qgTPozC7lh/fBiMQvV+2fEfF0YQ5sqzO/LtYdfPUWU1IYz
 FUWuZlLUzWVbzFyaVa9ptG82fKRJb+iHK/+V5L9HSd4bXOQRLTKTmcCrjKq+1QIx
 jTjdLA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2a2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WX3P017205
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:33 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:32 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:46 -0800
Subject: [PATCH 15/45] drm/msm/dp: convert dp_display_set_mode() to use
 dp_panel argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-15-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3693;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=Jul4Jdkb+DXryAs9WXg5+gotTSFuspiha6BKZxBEuBM=;
 b=0NHCbQnuUNd9v2tPa4SG4xqDfSmu2L1Rg1okMr06L9BC8U2Y9dhhbk+zU8tE5T81XbjZeBgAD
 x042+AWLfOqBBPEC0KhOzUZwXeFHrOchvupLo6sgVHFs+Gy/3QV5uRd
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Nx2CatD7sHdBugV5U1QoSDLXaKwJzxir
X-Proofpoint-ORIG-GUID: Nx2CatD7sHdBugV5U1QoSDLXaKwJzxir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060029
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

Convert dp_display_set_mode() to use the dp_panel passed to it
as an argument rather than the cached one in dp_display_private.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b506159191184a2a2c83d0735260ac040a33be98..5fa6c003cf6c51eae77573549a555a00dc33f476 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -798,16 +798,38 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 }
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
-			       struct msm_dp_display_mode *mode)
+				   const struct drm_display_mode *adjusted_mode,
+				   struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_display_private *dp;
+	struct msm_dp_display_mode msm_dp_mode;
 
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
+
+	if (msm_dp_display_check_video_test(msm_dp_display))
+		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	else /* Default num_components per pixel = 3 */
+		msm_dp_mode.bpp = msm_dp_panel->connector->display_info.bpc * 3;
+
+	if (!msm_dp_mode.bpp)
+		msm_dp_mode.bpp = 24; /* Default bpp */
+
+	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
+
+	msm_dp_mode.v_active_low =
+		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
+
+	msm_dp_mode.h_active_low =
+		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
+
+	msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_display->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, &msm_dp_mode.drm_mode);
+	msm_dp_panel->msm_dp_mode.bpp = msm_dp_mode.bpp;
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 = msm_dp_mode.out_fmt_is_yuv_420;
+	msm_dp_panel_init_panel_info(msm_dp_panel);
 
-	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
-	dp->panel->msm_dp_mode.bpp = mode->bpp;
-	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
-	msm_dp_panel_init_panel_info(dp->panel);
 	return 0;
 }
 
@@ -1662,34 +1684,12 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
 {
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_panel *msm_dp_panel;
-	struct msm_dp_display_mode msm_dp_mode;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	msm_dp_panel = msm_dp_display->panel;
 
-	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
-
-	if (msm_dp_display_check_video_test(dp))
-		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
-	else /* Default num_components per pixel = 3 */
-		msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
-
-	if (!msm_dp_mode.bpp)
-		msm_dp_mode.bpp = 24; /* Default bpp */
-
-	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
-
-	msm_dp_mode.v_active_low =
-		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
-
-	msm_dp_mode.h_active_low =
-		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
-
-	msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
 
-	msm_dp_display_set_mode(dp, &msm_dp_mode);
+	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
 
 	/* populate wide_bus_support to different layers */
 	msm_dp_display->ctrl->wide_bus_en =

-- 
2.34.1

