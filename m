Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D499E65C3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9D10F021;
	Fri,  6 Dec 2024 04:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hc+Ra4ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2F310F01D;
 Fri,  6 Dec 2024 04:33:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaedF018663;
 Fri, 6 Dec 2024 04:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U2jP0Fl8BCgqKNtmwBtWJDe5OTlHlTAlviwTOafZhL0=; b=hc+Ra4oxK/3AFZPS
 wCLfVmEV6BN5I0xwR8IO5Xvhyr3wTZwbLAKUSeExzZvChXQM5v1CoZGNiaaB3q1X
 quHwEKadNPjwSFkDWfOA3JE73jfsfL95uk7Kw6W5TIUUdYNw/U7FVcwIoVhvsoXA
 zoCMSmUwm8MGFnbgTppNxAZ2OQ2+2iNcozf82y1J2Q5BFYJXf4qiNcTsnTIOGHkL
 /+WVEyqCVNX45NIyommqNO5xIceiMdvknHO9u3edDDis9eqQy3LzdwDDqWKgF4P6
 PRxr0HzMXBT12S8A20TTb81/WA5lNDaHZrOeES4SRsFBiXdQTNSf+p0tS+xYPBqC
 qr2BlA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2a3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WkQl017265
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:46 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:45 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:09 -0800
Subject: [PATCH 38/45] drm/msm: initialize DRM MST encoders for DP controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-38-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=6792;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=PPz9QD2/ycfALN6uvgpjoIYGljoQ0Mww3wN59qe1e5A=;
 b=itvWis+aWsm/LJVhKf/+whqyjlsJb/6GRMPy8W9RnaHJa9hvfAMgBUCW5gf+u3WfaRxUo916U
 ZqM6KsA3LmTDIrJq1wv0jcYs/TA7M07pmzX6MXLchscpfugBeDL9Gcf
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gd8qzLHltlCkEcy7x8myrR3PPzjvQTjN
X-Proofpoint-ORIG-GUID: gd8qzLHltlCkEcy7x8myrR3PPzjvQTjN
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

Initiliaze a DPMST encoder for each  MST capable DP controller
and the number of encoders it supports depends on the number
of streams it supports. Replace the opencoded instances of max_stream
with the newly introduced API to centralize the usage.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c         | 26 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h               | 14 ++++++++++++++
 4 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 92b5ee390788d16e85e195a664417896a2bf1cae..618a5b6f8222882ed8c972a78a26f8c25ca389a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8b251f87a0520da0807b9b7aed17493990e41627..359de04abf4bbead3daa5e8b357a3c34216e3e65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -636,7 +636,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_id;
+	int stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
 		if (!priv->dp[i])
@@ -659,6 +660,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
+
+		if (stream_cnt > 1) {
+			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				info.stream_id = stream_id;
+				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+				if (IS_ERR(encoder)) {
+					DPU_ERROR("encoder init failed for dp mst display\n");
+					return PTR_ERR(encoder);
+				}
+
+				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
+				if (rc) {
+					DPU_ERROR("dp mst bridge %d init failed, %d\n",
+						  stream_id, rc);
+					continue;
+				}
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 80df79a7c2077d49184cdeb7b801bf0699ff4ece..eafec9ab4f83cb44e861687e7550748b4d9b7ece 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -432,7 +432,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
+	if (msm_dp_get_mst_max_stream(dp_display) <= DEFAULT_STREAM_COUNT ||
+	    !msm_dp_panel_read_mst_cap(dp->panel)) {
 		rc = msm_dp_panel_read_edid(dp->panel, connector);
 		if (rc)
 			goto end;
@@ -457,7 +458,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
-	if (dp->max_stream > DEFAULT_STREAM_COUNT && msm_dp_panel_read_mst_cap(dp->panel))
+	if (msm_dp_get_mst_max_stream(dp_display) > DEFAULT_STREAM_COUNT &&
+	    msm_dp_panel_read_mst_cap(dp->panel))
 		msm_dp_display_mst_init(dp);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
@@ -977,7 +979,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_get_mst_max_stream(&dp->msm_dp_display));
 
 	return rc;
 }
@@ -1444,6 +1446,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
 	return connector_type;
 }
 
+int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display)
+{
+	struct msm_dp_display_private *dp_priv;
+
+	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp_priv->max_stream;
+}
+
+int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	return msm_dp_mst_drm_bridge_init(dp_display, encoder);
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1745,12 +1761,12 @@ void msm_dp_display_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_d
 		return;
 	}
 
-	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT)
+	if (msm_dp_get_mst_max_stream(dp) > DEFAULT_STREAM_COUNT)
 		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_panel);
 	else
 		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 
-	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT) {
+	if (msm_dp_get_mst_max_stream(dp) > DEFAULT_STREAM_COUNT) {
 		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
 							  msm_dp_display->max_stream);
 		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1616a4682795f6b9b30cc0bef2baf448ccc62bc0..12b50a797772f574122481cd8a1c7c88aacb8250 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -372,6 +372,10 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
+int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display);
+
+int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -388,6 +392,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.34.1

