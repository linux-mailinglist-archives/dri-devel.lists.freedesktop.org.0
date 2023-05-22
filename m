Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751170CC77
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11D110E21C;
	Mon, 22 May 2023 21:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224710E11D;
 Mon, 22 May 2023 21:31:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MKUqTT030747; Mon, 22 May 2023 21:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=OF674zy6O0qYtG2is3bB6wljv5jcRMHbu1KnOl44pjk=;
 b=jwza8Xe/Ux9wS6oYd1uV14eWpTE6wE0MNbyozy0mATcZq7VXhYDQD4EQvwANIgolg9I2
 lJxS5i+9WUCbXDGydfsHVpS2MpVmgq9Q48lsO82HphYyO3XWVGEsoY0BSZxKs/cOS0Tm
 2P+jk6XMm9Wk0+KnxrGooNMguZT/YSZEFESUXw61xMRzoJgUfoimdG+vk85UkDZMtMYv
 l7aY7LMXoeN7qXTg0M5aDp1qz2nf8DMYSYa2LskwTQV+p5oRtJrGQH4DKO8D84f7YBZK
 3B4g3qWJ9AhMqaKbBYLi1IfxXajmHnInHrOMOoIxo6AmIOneF78u77QOPD4zKIBn3uSs Dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrf7783p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:31:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MLVflC028077
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:31:42 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 14:31:41 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
 <marijn.suijten@somainline.org>
Subject: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
Date: Mon, 22 May 2023 14:31:32 -0700
Message-ID: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QDJthpTZUvzEUeqkvM3-jZbHcHnaj6AJ
X-Proofpoint-ORIG-GUID: QDJthpTZUvzEUeqkvM3-jZbHcHnaj6AJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220182
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
case. HDP related interrupts can not be enabled until internal_hpd is set
to true. At current implementation dp_display_config_hpd() will initialize
DP host controller first followed by enabling HDP related interrupts if
internal_hpd was true at that time. Enable HDP related interrupts depends on
internal_hpd status may leave system with DP driver host is in running state
but without HDP related interrupts being enabled. This will prevent external
display from being detected. Eliminated this dependency by moving HDP related
interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
regardless of internal_hpd status.

Changes in V3:
-- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
-- rewording ocmmit text

Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 70 +++++++++++--------------------------
 3 files changed, 37 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7a8cf1c..5142aeb 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -620,7 +620,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 				config & DP_DP_HPD_INT_MASK);
 }
 
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
+void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
@@ -635,6 +635,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
+void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+
+	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
+	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+
+	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
+}
+
 static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
 {
 	/* trigger sdp */
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 82376a2..38786e8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -104,7 +104,8 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 			u32 intr_mask, bool en);
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
 u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3e13acdf..69bbc5f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -615,12 +615,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
-	/* enable HDP irq_hpd/replug interrupt */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
-					   true);
-
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 	mutex_unlock(&dp->event_mutex);
@@ -658,12 +652,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 
-	/* disable irq_hpd/replug interrupts */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
-					   false);
-
 	/* unplugged, no more irq_hpd handle */
 	dp_del_event(dp, EV_IRQ_HPD_INT);
 
@@ -687,10 +675,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	/* disable HPD plug interrupts */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
-
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
@@ -706,10 +690,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(&dp->dp_display, false);
 
-	/* enable HDP plug interrupt to prepare for next plugin */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
-
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 
@@ -1082,26 +1062,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	mutex_unlock(&dp_display->event_mutex);
 }
 
-static void dp_display_config_hpd(struct dp_display_private *dp)
-{
-
-	dp_display_host_init(dp);
-	dp_catalog_ctrl_hpd_config(dp->catalog);
-
-	/* Enable plug and unplug interrupts only if requested */
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK,
-				true);
-
-	/* Enable interrupt first time
-	 * we are leaving dp clocks on during disconnect
-	 * and never disable interrupt
-	 */
-	enable_irq(dp->irq);
-}
-
 void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
 {
 	struct dp_display_private *dp;
@@ -1176,7 +1136,7 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_INIT_SETUP:
-			dp_display_config_hpd(dp_priv);
+			dp_display_host_init(dp_priv);
 			break;
 		case EV_HPD_PLUG_INT:
 			dp_hpd_plug_handle(dp_priv, todo->data);
@@ -1394,13 +1354,8 @@ static int dp_pm_resume(struct device *dev)
 	/* turn on dp ctrl/phy */
 	dp_display_host_init(dp);
 
-	dp_catalog_ctrl_hpd_config(dp->catalog);
-
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK,
-				true);
+	if (dp_display->is_edp)
+		dp_catalog_ctrl_hpd_enable(dp->catalog);
 
 	if (dp_catalog_link_is_connected(dp->catalog)) {
 		/*
@@ -1568,7 +1523,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 
 	if (aux_bus && dp->is_edp) {
 		dp_display_host_init(dp_priv);
-		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
+		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
 		dp_display_host_phy_init(dp_priv);
 		enable_irq(dp_priv->irq);
 
@@ -1801,16 +1756,33 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *dp_display = dp_bridge->dp_display;
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	mutex_lock(&dp->event_mutex);
+	dp_catalog_ctrl_hpd_enable(dp->catalog);
+
+	/* enable HDP interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
+
+	enable_irq(dp->irq);
 
 	dp_display->internal_hpd = true;
+	mutex_unlock(&dp->event_mutex);
 }
 
 void dp_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *dp_display = dp_bridge->dp_display;
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	mutex_lock(&dp->event_mutex);
+	/* disable HDP interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
+	dp_catalog_ctrl_hpd_disable(dp->catalog);
 
 	dp_display->internal_hpd = false;
+	mutex_unlock(&dp->event_mutex);
 }
 
 void dp_bridge_hpd_notify(struct drm_bridge *bridge,
-- 
2.7.4

