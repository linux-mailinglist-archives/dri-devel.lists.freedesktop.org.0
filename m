Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63033AD1D4E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B106510E2C3;
	Mon,  9 Jun 2025 12:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MOooemrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E010E2AF;
 Mon,  9 Jun 2025 12:24:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559B57xX020082;
 Mon, 9 Jun 2025 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lw3w+2NDGArncKWNy0HNiZs4hBpviXIcERx0uYekvpQ=; b=MOooemrmG14ZAcLw
 P7DTJRC/jIo7M4VCJxxwMSlcTdLOhrEGeWSO6Kn2aOG1ma90RViMB0C2SE/X+OLD
 QCf2B34d4/eDJhMojF9FhxIShBHEmeu9FOcgbVBebXVDqV0US8uFST5fl2SiS/X/
 p31yNdXV37hEGNI2su7QDsGcGfOajEsfWhjGZ9nXc5kmza1nfbCwOpDyzisM9Sp6
 knRj8nB1EVsbVwlaUEEzAQJO6jiZ5cTN2zK6bVAvaTe1y7+ZDrF9+fiSNGDh3E8S
 hPupI7puHWIYo5qrghgMls3rZVwsjp5AwvAhLwCQhA+Ouhn4pIB5LUwtOI5r4ZIj
 DAlMvA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsd4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNkbp012938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:46 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:43 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:34 +0800
Subject: [PATCH v2 15/38] drm/msm/dp: add support to send ACT packets for MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-15-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471756; l=9922;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=sCZz3rFhh71S/JDShP7howBybKa+X3LN7PxyMOUypiU=;
 b=HMH4henw3Xs4DRoDshfc5h3ftmA80/nR2l0Hel9sXqURNibZz9a80Uxo1XEz9kuvhapWsyKFt
 kEcaTd8KFxYCjCt49yul1ji0fE028jGwL21VWbyzCKiL0NDsGajDIBK
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JtOJfMUfhJFjvU-BOi7pmGafkp0FuCTw
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846d259 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=UpO5wE_0Xyuzwso4dbwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXz1VpIhrfxsXg
 cVpx/5sqAJIuPgNr4cYoEzlOgtA3X5PWq4ltbGGyLmySAtdwdkco7ofXMyRO5nozpW+xpUuONNY
 P6uBFNNqjjw6wcU7VZ57zwl1bKlEJ2v1duNuu3gMKj4YbWIX0TaPYqTr6S4f1+WFutF46tt/MbL
 ytVH//423Q00vBDF/+FthUPjropFkpXXDIfH9GyU04AoVFsFbXp/3MPBjRCaG6K/q3XciVDW+hD
 zQu6gL+F0u3jmahKQzhMetLh/ohY0huf/vstkTELRqIPB+yDxRO4OLc43jgcugJgQN7gpVxsxIi
 fhHf5ptuS75KkOhcwhXpYRaD8ydkzmGItw5BnZVdXVo89kF7ehATwbO5zWl8+/aoyphtNZ6DzTd
 vONC+pYFyzEgZMqz7Dc8GOiac7IYxyf/BBOccC+wZSSKCs6SMobvtTkv/UXdosUVB/pQ8BZ+
X-Proofpoint-ORIG-GUID: JtOJfMUfhJFjvU-BOi7pmGafkp0FuCTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  4 ++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 35 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
 7 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 07d06cd36eea5ea1dd90daf01422b8ecdffb13fe..e6920008356991ad0c023664d5e286433ccf5d0b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1131,6 +1131,27 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog, stream_id);
 }
 
+void msm_dp_catalog_trigger_act(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog;
+
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_link(catalog, REG_DP_MST_ACT, 0x1);
+
+	/* make sure ACT signal is performed */
+	wmb();
+}
+
+bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog;
+
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+
+	return msm_dp_read_link(catalog, REG_DP_MST_ACT);
+}
+
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				     enum msm_dp_stream_id stream_id,
 				     struct drm_display_mode *drm_mode)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index ef0e3fadcd04ae499d6340d05fd74392235bed76..88ef98c9b0cb2d273a0c190ff7b2783b5e254937 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -127,4 +127,8 @@ void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
 void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
 void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
 
+/* DP MST APIs */
+void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
+bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
+
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6c3c27b48b3b13f205ce28b823ae26d5dc7d9a10..0088fefd88e517e01bb66f02661c877173181d8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -98,6 +98,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool pixel_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
@@ -1662,6 +1663,26 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return 0;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	bool act_complete;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	msm_dp_catalog_trigger_act(ctrl->catalog);
+	msleep(20); /* needs 1 frame time */
+
+	act_complete = msm_dp_catalog_read_act_complete_sts(ctrl->catalog);
+
+	if (!act_complete)
+		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete SUCCESS\n");
+	else
+		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");
+
+	return 0;
+}
+
 static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1680,6 +1701,9 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
@@ -1794,7 +1818,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, msm_dp_panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, ctrl->mst_active);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
@@ -1874,7 +1898,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -1893,6 +1917,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
 
+	ctrl->mst_active = mst_active;
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
@@ -2084,6 +2109,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2140,6 +2168,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
+	ctrl->mst_active = false;
+
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
@@ -2300,6 +2330,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
 	ctrl->phy      = phy;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index e20ba90dbd879ae3d6b1f5eb5922f969bc12d079..c74228bd3e4ac9e8498b75d6f5641834f662bfdc 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,7 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -45,5 +45,6 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
 				   struct msm_dp_panel *msm_dp_panel);
 void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 76d07685f5a89109723b68ba9d97c0b0332b18aa..83e73b7cf471ae967866b7d87da3abe2c1bb60d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -385,6 +385,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct msm_dp *dp_display = &dp->msm_dp_display;
 
 	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
@@ -420,7 +421,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, dp_display->mst_active);
 	if (rc) {
 		DRM_ERROR("failed to complete DP link training\n");
 		goto end;
@@ -1620,6 +1621,9 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+
+	if (dp->mst_active)
+		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 09b30596fd3366af55ae246e3a83ee9e88995382..2751bf1c786e190cd7c7b514b23e90a6ed2ca3b9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	bool power_on;
 	bool prepared;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 	bool internal_hpd;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 06b3d570336347e38fba8cd0dfb44d25046e5950..b993487925dbd78e8f78e09fbf52ab38f268b71a 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -139,6 +139,8 @@
 #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
 
+#define REG_DP_MST_ACT				(0x00000500)
+
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP1_SOFTWARE_MVID			(0x00000414)
 #define REG_MST_LINK_SOFTWARE_MVID		(0x00000040)

-- 
2.34.1

