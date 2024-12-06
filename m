Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B79E656A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42AF10E18D;
	Fri,  6 Dec 2024 04:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aOpIqzVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287810E1E1;
 Fri,  6 Dec 2024 04:33:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNZT004670;
 Fri, 6 Dec 2024 04:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7uG1T42e0Wh0kxwKcl0xI39bv2pD4wyRUaE8P7ZNeN8=; b=aOpIqzVXk8NEhJwf
 HwixhGWCqwdnGntMG6BCHY97wmDR07sEV2tcQ10JlLtnG/LJR4MnWTHjEcGhXkbV
 8SldkjgIHKxbDocErrtDDDU0Z9J+ya76VCp8LdWATl4C0M5lHNCepf8orbQDCzFf
 nCdRRyy1GmzrlUbDKp/vB8zIraG6RMtnoMxZ1k7E7yFK9v3ktW4udX5wG7IleLhQ
 YqmSWDbyXkBsSiDQR57huaP/JEpV+SpoIrCwRuUZvT9+YakQv5gY2HOAYNUroRsK
 4F36BiXsRkZdxOE8KJHt33T5PRHAejXRhtxK5ASV7bROsMhW2BQpMG80hKoQ/pKI
 RJitQg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142k7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WSZR006039
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:28 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:27 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:38 -0800
Subject: [PATCH 07/45] drm/msm/dp: break up dp_display_enable into two
 parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-7-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=10649;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=3tIkGtFTktQpebXzWbrvZ9iUmAjFiZ2F/3REU1VyUtU=;
 b=nZM/ymjri2KTNmJWhnT+h83KiS9jnFsNYqNo42x/JgeikHWH5TX/d/XgSwq4meKx/JT7T9ULz
 qy1FHh0+UAuAmATgyuj0QXS8hNH6p/1gLswE5GJpJjpu4gQovWEAi+d
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IwbWJLqEO5b3okwcL2gY4aOA4XpdFq0w
X-Proofpoint-ORIG-GUID: IwbWJLqEO5b3okwcL2gY4aOA4XpdFq0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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

dp_display_enable() currently re-trains the link if needed
and then enables the pixel clock, programs the controller to
start sending the pixel stream. Break up these two parts into
separate APIs to distinguish these two parts better.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 ++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 97 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 4 files changed, 112 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fae916661fef1c7e225f55c1026478..763bd58c24d29d49caafb76eab32b493e1618e7b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1941,40 +1941,61 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
 	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
-	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
-	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
-
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		pixel_rate >>= 1;
-
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
-		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
+		   ctrl->link->link_params.rate,
+		   ctrl->link->link_params.num_lanes);
 
 	drm_dbg_dp(ctrl->drm_dev,
-		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
-		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
+		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
+		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
-			goto end;
+			return ret;
 		}
 	}
 
+	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
+		msm_dp_ctrl_link_retrain(ctrl);
+
+	/* stop txing train pattern to end link training */
+	msm_dp_ctrl_clear_training_pattern(ctrl);
+
+	return ret;
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	int ret = 0;
+	bool mainlink_ready = false;
+	struct msm_dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
+	unsigned long pixel_rate_orig;
+
+	if (!msm_dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+
+	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+		pixel_rate >>= 1;
+
+	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
+
 	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
@@ -1992,12 +2013,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		ctrl->stream_clks_on = true;
 	}
 
-	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
-		msm_dp_ctrl_link_retrain(ctrl);
-
-	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl);
-
 	/*
 	 * Set up transfer unit values and set controller state to send
 	 * video.
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..42745c912adbad7221c78f5cecefa730bfda1e75 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4bd85ae754429333aa423c985368344cd03c7752..434380b442ec84c12c240dab6538ccdf31963cea 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -811,7 +811,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
+static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
+{
+	int rc = 0;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+	if (msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return 0;
+	}
+
+	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
+	if (rc) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		return rc;
+	}
+
+	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
+		msm_dp_display_host_phy_init(dp);
+		force_link_train = true;
+	}
+
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	if (!rc)
+		msm_dp_display->prepared = true;
+
+	return rc;
+}
+
+static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -822,7 +852,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -852,13 +882,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	return 0;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	/* wait only if audio was enabled */
 	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
@@ -869,6 +896,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp_display->audio_enabled = false;
+}
+
+static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	if (!msm_dp_display->power_on)
+		return 0;
 
 	if (dp->link->sink_count == 0) {
 		/*
@@ -1498,9 +1533,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
+
 	struct msm_dp_display_private *msm_dp_display;
-	u32 state;
-	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
@@ -1508,25 +1542,23 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_hpd_plug_handle(msm_dp_display, 0);
 
 	mutex_lock(&msm_dp_display->event_mutex);
-	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
+
+	rc = msm_dp_display_prepare(msm_dp_display);
+	if (rc) {
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
 
-	state =  msm_dp_display->hpd_state;
-
-	if (state == ST_CONNECTED && !dp->power_on) {
-		msm_dp_display_host_phy_init(msm_dp_display);
-		force_link_train = true;
-	}
-
-	msm_dp_display_enable(msm_dp_display, force_link_train);
-
-	rc = msm_dp_display_post_enable(dp);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(msm_dp_display);
+	if (dp->prepared) {
+		rc = msm_dp_display_enable(msm_dp_display);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+		rc = msm_dp_display_post_enable(dp);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(msm_dp_display);
+		}
 	}
 
 	/* completed connection */
@@ -1548,6 +1580,20 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
+static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	if (!msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->prepared = false;
+}
+
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *old_bridge_state)
 {
@@ -1568,6 +1614,8 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
 			   dp->connector_type, state);
 
+	msm_dp_display_audio_notify_disable(msm_dp_display);
+
 	msm_dp_display_disable(msm_dp_display);
 
 	state =  msm_dp_display->hpd_state;
@@ -1576,9 +1624,10 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
 	}
 
+	msm_dp_display_unprepare(msm_dp_display);
+
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
-	pm_runtime_put_sync(&dp->pdev->dev);
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index ecbc2d92f546a346ee53adcf1b060933e4f54317..0165a80863e65b6eea6d2d8d1c5c08cd51fed101 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -21,6 +21,7 @@ struct msm_dp {
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
+	bool prepared;
 	unsigned int connector_type;
 	bool is_edp;
 	bool internal_hpd;

-- 
2.34.1

