Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E49E6596
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B135110E5FF;
	Fri,  6 Dec 2024 04:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FVggL0XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89910E5FA;
 Fri,  6 Dec 2024 04:33:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaSmo004131;
 Fri, 6 Dec 2024 04:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iTXeuevm0+lBaiNSX2nWJ//LBTyRFJxVze0l6PBzmuQ=; b=FVggL0XGO+Ix0mWs
 oTcFhrXsETcwTCoICbngCnIKg8A4oKGEst8lDkakqIBL/aaF57Gz/M+hjaB4FS/m
 9O2Uk1xFhzK8NDmH8LXHLgaMbNDXhiIW7RVSIXQaAQdjsqKL/D7TIroMyezkTLfQ
 CViIC7qor1MC6AFOugfM6M9cf65QbFMABg8s3Lhm1T8tsAdf7IPQGMJt8DQbi4nS
 ZPjnggfGnwrQTn6dsEgL3NPgrQvCcYLKCe8h8JOymwwRWJHwZZgu3StQqsSOE8m2
 QeQxmQYx+icEp84rQCylugwSA+X2AQRw5bMjbWoy4ubYWzQAxPLlyTj9fVvcvcME
 dMkWJg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm29em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wd4K017228
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:39 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:38 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:57 -0800
Subject: [PATCH 26/45] drm/msm/dp: replace power_on with active_stream_cnt
 for dp_display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=6026;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=ea7pXCJCaxJM3OQDMM3mp6NdayC2RUsXCAx1d74tTbM=;
 b=T20YAZ7zHIvMEd3yNwhKlP0SgT4r1rnPzv8nhhIR/pUdnEQ9N9m4i/scP1srqVqlAg+cTmdn1
 1ydVZFOJWeZA6pd2NThMyeGB+TA8W3eOCRI/h099q7Z5Grb9hNgtd8e
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: teOGzCDAak4upWn69XygMAeGkU7EHNsr
X-Proofpoint-ORIG-GUID: teOGzCDAak4upWn69XygMAeGkU7EHNsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060029
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

For DP MST, the link clock and power domain resources stay on until
both streams have been disabled OR we receive hotplug. Introduce an
active_stream_cnt to track the number of active streams and necessary
state handling. Replace the power_on variable with active_stream_cnt
as power_on boolean works only for a single stream.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195d5e0e04250663886f1116f25711..3aad4c6f90382bd5c7cad7bcab38335ef81fc869 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -441,7 +441,7 @@ int msm_dp_audio_hw_params(struct device *dev,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display_get_active_stream_cnt(msm_dp_display)) {
 		rc = -EINVAL;
 		goto end;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d5b8fd1d4d736ffa7929b9798601dcef0dea5211..e69cdfbbe10484e47475ef189849f8ff6628bd7a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -111,6 +111,8 @@ struct msm_dp_display_private {
 
 	bool wide_bus_supported;
 
+	u32 active_stream_cnt;
+
 	struct msm_dp_audio *audio;
 };
 
@@ -187,6 +189,15 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{}
 };
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp)
+{
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_display->active_stream_cnt;
+}
+
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
@@ -662,7 +673,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (!dp->msm_dp_display.power_on) {
+	if (!dp->active_stream_cnt) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;
@@ -856,7 +867,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
-	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
+	if (dp->hpd_state == ST_CONNECTED && !dp->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
 	}
@@ -872,17 +883,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
-	if (!rc)
-		msm_dp_display->power_on = true;
 
 	return rc;
 }
@@ -929,16 +933,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 				  struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-
-	if (!msm_dp_display->power_on)
+	if (!dp->active_stream_cnt)
 		return 0;
 
 	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_stream_clk_off(dp->ctrl, msm_dp_panel);
 
-	msm_dp_display->power_on = false;
+	dp->active_stream_cnt--;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
@@ -1096,7 +1098,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 */
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	if (!dp->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
@@ -1621,6 +1623,8 @@ void msm_dp_display_enable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp
 		}
 	}
 
+	msm_dp_display->active_stream_cnt++;
+
 	/* completed connection */
 	msm_dp_display->hpd_state = ST_CONNECTED;
 
@@ -1645,6 +1649,11 @@ void msm_dp_display_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_d
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "no active streams\n");
+		return;
+	}
+
 	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT)
 		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_panel);
 	else
@@ -1676,6 +1685,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp)
 		return;
 	}
 
+	if (msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(msm_dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (msm_dp_display->link->sink_count == 0)
 		msm_dp_ctrl_psm_config(msm_dp_display->ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 82eb1c6ed1467b21742bda8eaae9c51d3207e997..f1142b7b96c372b49e8e45dd0378eb507b081915 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,7 +20,6 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	bool link_ready;
 	bool audio_enabled;
-	bool power_on;
 	bool prepared;
 	bool mst_active;
 	unsigned int connector_type;
@@ -67,4 +66,6 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
 
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

