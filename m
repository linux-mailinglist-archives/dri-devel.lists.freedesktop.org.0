Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D7AD1D3B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EB710E25C;
	Mon,  9 Jun 2025 12:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MSeioa89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260A110E25C;
 Mon,  9 Jun 2025 12:23:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599JqmN032199;
 Mon, 9 Jun 2025 12:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 330Kj6Ey2QwmlKBeesP+rEe1nMX3jgVqeOzLB4Byafs=; b=MSeioa89IYQvty/g
 zGr0/vc2qfI5/RqhKEGkfPOa7LXpTFHFuMM6XCJXFGu4Z3nBLviZnRu4bstn3Jta
 rvCPxhatca1arBVVaCwD8Ly7fj6HHjuy4uNKiBX2RS8E7Fo0SY6Hv+VHtkF+jLqI
 nlrqvZN129YvkNSniirZPvZkqZ/1ANHTwss5Ij/Qe50BtaDLrYOjDns2c4Q0DpKd
 SXE5i13mlkG88yrs3cTydTFD1FrDzotDVL65A7XIYLJTihpzL1QnK48OpLpSSg74
 QMXOXfitn0Uc8eGqjJfUDMAh7/ILsQAhEwXBjU7GwE2h6dtUVPDpRGHQGES4rcWV
 3vNzkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75t8a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNVr1016264
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:31 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:28 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:30 +0800
Subject: [PATCH v2 11/38] drm/msm/dp: introduce stream_id for each DP panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-11-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471755; l=12093;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=CI1031XIraeWsNg87hrzjq5n+BFBUpXMKlRXB1jeYW4=;
 b=GyWxdYc4LGfTdhW06xKAI8LJjtyWJoD5Nw+NgrCmkZe8QmZ1tE5/gBfIUAoqA3cKzzmD2qEh5
 +hsd2O3Dk5aD1IEFXPPGWF6g+mreY7uTeVwo06N5oAkoRhkFwwecevI
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qyL_0_ypHLm9e1kL9IS1b1Xk0-LocQ6n
X-Proofpoint-ORIG-GUID: qyL_0_ypHLm9e1kL9IS1b1Xk0-LocQ6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MiBTYWx0ZWRfX3RSbTNEq/mLj
 ThC+iaGcQcrsBAZlMPE5InQYq6gxzq81bRxxDQIBbaExCtYws12ao6f3XgoAY8Mn/NsVI69p1kR
 QAzg37ZtUJao0D5YE91Szf+qe1lap1/5ImPFEt5NXXCoTl2DWz1RqLhDI7uAFb5TI+QJkr2hI0T
 KAnhBg0WGMgkKxC5X/YXD+STo1Xp5zTXftJizYDroA0kjzKXMNbxc0C+1vzFLGeQzXauZTSg5oj
 HjkyVG0K6Pf8LXQinohQgbZELM4hznGOqUvHGQgqEGimJKWlz+1YeGO1izKjtim00KMkliSDbnM
 /JKPWmwB5nx8HdbciEL8AFbMyowpXdn20H4kKeClU6OsggJTfe4CAe9CsgwGs0qs1i5nFNTbmqp
 BDNscKETToAuRJKQzOyTzktJBqSMwkppee7kfbqD/s52SIAEadwi0PktdKuN6a2YupnvvU56
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846d244 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=HkRR9PnJoreUWQWhFGAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090092
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

With MST, each DP controller can handle multiple streams.
There shall be one dp_panel for each stream but the dp_display
object shall be shared among them. To represent this abstraction,
create a stream_id for each DP panel which shall be set by the
MST stream. For SST, default this to stream 0.

Use the stream ID to control the pixel clock of that respective
stream by extending the clock handles and state tracking of the
DP pixel clock to an array of max supported streams. The maximum
streams currently is 4.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 55 ++++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 +--
 drivers/gpu/drm/msm/dp/dp_display.c | 27 ++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 6 files changed, 72 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6678b0ac9a67881244884d59487fa288d33d1be7..f9e7506afcf4f4d932665462ca316f6c66c662a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -31,6 +31,15 @@
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
+/* stream id */
+enum msm_dp_stream_id {
+	DP_STREAM_0,
+	DP_STREAM_1,
+	DP_STREAM_2,
+	DP_STREAM_3,
+	DP_STREAM_MAX,
+};
+
 struct msm_dp_catalog {
 	bool wide_bus_en;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c990a7a835fc9645c2dd7e1ec8604e991baf754a..7db23968c4227557d3cea9bfbf5aa3c3e17a87d8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -87,7 +87,7 @@ struct msm_dp_ctrl_private {
 	unsigned int num_link_clks;
 	struct clk_bulk_data *link_clks;
 
-	struct clk *pixel_clk;
+	struct clk *pixel_clk[DP_STREAM_MAX];
 
 	union phy_configure_opts phy_opts;
 
@@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
 
 	bool core_clks_on;
 	bool link_clks_on;
-	bool pixel_clks_on;
+	bool pixel_clks_on[DP_STREAM_MAX];
 };
 
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
@@ -1737,39 +1737,40 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
-static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
+				    enum msm_dp_stream_id stream_id)
 {
 	int ret;
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
 		return ret;
 	}
 
-	if (ctrl->pixel_clks_on) {
+	if (ctrl->pixel_clks_on[stream_id]) {
 		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
 	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
+		ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
 		if (ret) {
 			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
 			return ret;
 		}
-		ctrl->pixel_clks_on = true;
+		ctrl->pixel_clks_on[stream_id] = true;
 	}
 
 	return ret;
 }
 
-void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->pixel_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->pixel_clks_on = false;
+	if (ctrl->pixel_clks_on[stream_id]) {
+		clk_disable_unprepare(ctrl->pixel_clk[stream_id]);
+		ctrl->pixel_clks_on[stream_id] = false;
 	}
 }
 
@@ -1790,7 +1791,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, msm_dp_panel->stream_id);
 	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
@@ -1800,7 +1801,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, msm_dp_panel->stream_id);
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
@@ -2020,8 +2021,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 		   ctrl->link->link_params.num_lanes);
 
 	drm_dbg_dp(ctrl->drm_dev,
-		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
-		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
+		   "core_clk_on=%d link_clk_on=%d\n",
+		   ctrl->core_clks_on, ctrl->link_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
@@ -2060,7 +2061,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
 
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate, msm_dp_panel->stream_id);
 	if (ret) {
 		DRM_ERROR("failed to enable pixel clk\n");
 		return ret;
@@ -2205,10 +2206,11 @@ static const char *ctrl_clks[] = {
 	"ctrl_link_iface",
 };
 
-static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
+static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl, int max_stream)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct device *dev;
+	char stream_id_str[15];
 	int i, rc;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
@@ -2238,17 +2240,26 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	if (rc)
 		return rc;
 
-	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
-	if (IS_ERR(ctrl->pixel_clk))
-		return PTR_ERR(ctrl->pixel_clk);
+	ctrl->pixel_clk[DP_STREAM_0] = devm_clk_get(dev, "stream_pixel");
+	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_0]))
+		return PTR_ERR(ctrl->pixel_clk[DP_STREAM_0]);
 
+	for (i = DP_STREAM_1; i < max_stream; i++) {
+		sprintf(stream_id_str, "stream_%d_pixel", i);
+		ctrl->pixel_clk[i] = devm_clk_get(dev, stream_id_str);
+
+		if (IS_ERR(ctrl->pixel_clk[i])) {
+			DRM_DEBUG_DP("failed to get stream %d pixel clock", i);
+			break;
+		}
+	}
 	return 0;
 }
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
 			struct msm_dp_catalog *catalog,
-			struct phy *phy)
+			struct phy *phy, int max_stream)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
@@ -2289,7 +2300,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->dev      = dev;
 	ctrl->phy      = phy;
 
-	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
 		dev_err(dev, "failed to init clocks\n");
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f14778c5dfaad7e9cb697697d873977d109e6cfc..e20ba90dbd879ae3d6b1f5eb5922f969bc12d079 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -21,14 +21,14 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
 			struct msm_dp_catalog *catalog,
-			struct phy *phy);
+			struct phy *phy, int max_stream);
 
 void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4e0213cae4aafb468681db27b3c3fef28d44b2c0..a13e4007858701787562eded7b6fc8f7171e167b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -784,7 +784,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
 			       dp->catalog,
-			       phy);
+			       phy, dp->max_stream);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -934,12 +934,12 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		msm_dp_ctrl_psm_config(dp->ctrl);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
 		msm_dp_ctrl_off_link(dp->ctrl);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
 		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 	}
@@ -950,6 +950,25 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
+int msm_dp_display_set_stream_id(struct msm_dp *dp,
+				 struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id)
+{
+	int rc = 0;
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!msm_dp_display) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	if (panel)
+		panel->stream_id = stream_id;
+
+	return rc;
+}
+
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @dp: Pointer to dp display structure
@@ -1574,6 +1593,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp)
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
+	msm_dp_display_set_stream_id(dp, msm_dp_display->panel, 0);
+
 	if (dp->prepared) {
 		rc = msm_dp_display_enable(msm_dp_display);
 		if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4e3540f2eb21afb14583b0d521dd9817fefd2f70..09b30596fd3366af55ae246e3a83ee9e88995382 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -45,5 +45,7 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
+int msm_dp_display_set_stream_id(struct msm_dp *dp,
+				 struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 7f139478e1012d5b8f1f745f0de5fc3943745428..170f819644b473b454f88cd4e8762959f4513613 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -38,6 +38,8 @@ struct msm_dp_panel {
 	bool video_test;
 	bool vsc_sdp_supported;
 
+	enum msm_dp_stream_id stream_id;
+
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 

-- 
2.34.1

