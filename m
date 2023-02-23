Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C93616A0B4E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66210E4F7;
	Thu, 23 Feb 2023 13:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B46810E4F7;
 Thu, 23 Feb 2023 13:57:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NB4KSM007205; Thu, 23 Feb 2023 13:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=7Cind5gyNxMy1Iej3zlc/j/6yrfUHAadhIOvgUWmRCI=;
 b=VYB0L1ZlutRnBHM/C7DdBlLIEHI3IkxkwG6AKxUufGnBa3bDfBJVgRjc1IbfCHKDqeaz
 ka6ITBRHBsBxpXDnNs7Rsho2uLjA64t3719WnD8Ti98TYIzrtDkGi1SUnpVrbt6gvhM3
 i5dRAQkYUgJYmP3tvnvyq+B1+QgeroEFP6o0aJwCNAHn76qK2NYH5qgZ/i4iKhDhGNH3
 BWGQ0JG49tIeNXmVOWqL3ADa1XHOT6+ayLJ3hDFD4RiS8XzQtjhTU6wykzEODLgahcqR
 PeEyh+gvZdPyvryuUPOKlN1gCkkjz7IqUUztzIIAjJwl63D/q2LJ3AywQzxGYhicQahm GA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwy9a1hk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:57:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NDvJN8006404
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:57:19 GMT
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Feb 2023 05:57:13 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/2] drm/msm/dp: enable pm_runtime support for dp driver
Date: Thu, 23 Feb 2023 19:26:35 +0530
Message-ID: <20230223135635.30659-3-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uYl-q6b2X_QfpoFRZts9uS-iQV8Aeoge
X-Proofpoint-ORIG-GUID: uYl-q6b2X_QfpoFRZts9uS-iQV8Aeoge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230114
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_bjorande@quicinc.com, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current DP driver directly enables or disables the necessary control
resources based on code flow. This could disable a required resource that
is needed in a different usecase. It can also lead to excessive voting of
a resource and may increase power consumption.

The pm_runtime framework can solve this problem in DP driver by monitoring
the resource enable disable calls. This change will enable support for the
pm_runtime resume and suspend operations for DP driver.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |   6 ++
 drivers/gpu/drm/msm/dp/dp_display.c | 121 ++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_power.c   |   7 --
 3 files changed, 76 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 5da95dfdeede..45026827bf7a 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -338,6 +338,7 @@ static ssize_t dp_aux_transfer_init(struct drm_dp_aux *dp_aux,
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(dp_aux->dev);
 	mutex_lock(&aux->mutex);
 	if (!aux->initted) {
 		ret = -EIO;
@@ -418,6 +419,8 @@ static ssize_t dp_aux_transfer_init(struct drm_dp_aux *dp_aux,
 
 exit:
 	mutex_unlock(&aux->mutex);
+	pm_runtime_mark_last_busy(dp_aux->dev);
+	pm_runtime_put_autosuspend(dp_aux->dev);
 
 	return ret;
 }
@@ -454,6 +457,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(dp_aux->dev);
 	mutex_lock(&aux->mutex);
 	if (!aux->initted) {
 		ret = -EIO;
@@ -527,6 +531,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 
 exit:
 	mutex_unlock(&aux->mutex);
+	pm_runtime_mark_last_busy(dp_aux->dev);
+	pm_runtime_put_autosuspend(dp_aux->dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a5dcef040b74..a23e79e43100 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -307,8 +307,10 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	/* disable all HPD interrupts */
-	if (dp->core_initialized)
+	if (dp->core_initialized) {
 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
+		pm_runtime_put_sync(dev);
+	}
 
 	kthread_stop(dp->ev_tsk);
 
@@ -1083,26 +1085,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
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
 static int hpd_event_thread(void *data)
 {
 	struct dp_display_private *dp_priv;
@@ -1163,9 +1145,6 @@ static int hpd_event_thread(void *data)
 		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
 
 		switch (todo->event_id) {
-		case EV_HPD_INIT_SETUP:
-			dp_display_config_hpd(dp_priv);
-			break;
 		case EV_HPD_PLUG_INT:
 			dp_hpd_plug_handle(dp_priv, todo->data);
 			break;
@@ -1337,16 +1316,12 @@ static int dp_display_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &dp->dp_display);
 
-	if (dp->dp_display.is_edp) {
-		dp_display_host_init(dp);
-		dp_display_host_phy_init(dp);
-		dp_catalog_ctrl_hpd_config(dp->catalog);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
+	pm_runtime_use_autosuspend(&pdev->dev);
 
+	if (dp->dp_display.is_edp) {
 		rc = devm_of_dp_aux_populate_bus(dp->aux, NULL);
-
-		dp_display_host_phy_exit(dp);
-		dp_display_host_deinit(dp);
-
 		if (rc) {
 			DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
 			goto error;
@@ -1367,6 +1342,8 @@ static int dp_display_remove(struct platform_device *pdev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	dp_display_deinit_sub_modules(dp);
 
 	component_del(&pdev->dev, &dp_display_comp_ops);
@@ -1375,6 +1352,42 @@ static int dp_display_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int dp_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp_display_host_phy_exit(dp);
+	dp_display_host_deinit(dp);
+
+	return 0;
+}
+
+static int dp_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dp_display_host_init(dp);
+
+	if (dp->dp_display.is_edp) {
+		dp_display_host_phy_init(dp);
+	} else {
+		dp_catalog_hpd_config_intr(dp->catalog,
+				DP_DP_HPD_PLUG_INT_MASK |
+				DP_DP_HPD_UNPLUG_INT_MASK,
+				true);
+	}
+
+	dp_catalog_ctrl_hpd_config(dp->catalog);
+
+	return 0;
+}
+
 static int dp_pm_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1384,6 +1397,9 @@ static int dp_pm_resume(struct device *dev)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	if (pm_runtime_suspended(dev))
+		return 0;
+
 	mutex_lock(&dp->event_mutex);
 
 	drm_dbg_dp(dp->drm_dev,
@@ -1394,16 +1410,7 @@ static int dp_pm_resume(struct device *dev)
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
-	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp);
-
-	dp_catalog_ctrl_hpd_config(dp->catalog);
-
-	if (dp->dp_display.internal_hpd)
-		dp_catalog_hpd_config_intr(dp->catalog,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK,
-				true);
+	dp_runtime_resume(dev);
 
 	if (dp_catalog_link_is_connected(dp->catalog)) {
 		/*
@@ -1452,27 +1459,29 @@ static int dp_pm_suspend(struct device *dev)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	if (pm_runtime_suspended(dev))
+		return 0;
+
 	mutex_lock(&dp->event_mutex);
 
 	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
+		"Before, type=%d sink=%d conn=%d core_inited=%d  phy_inited=%d power_on=%d\n",
+		dp->dp_display.connector_type, dp->link->sink_count,
+		dp->dp_display.is_connected, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
 	/* mainlink enabled */
 	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
 		dp_ctrl_off_link_stream(dp->ctrl);
 
-	dp_display_host_phy_exit(dp);
-
-	/* host_init will be called at pm_resume */
-	dp_display_host_deinit(dp);
+	dp_runtime_suspend(dev);
 
 	dp->hpd_state = ST_SUSPENDED;
 
 	drm_dbg_dp(dp->drm_dev,
-		"After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
+		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
+		dp->dp_display.connector_type, dp->link->sink_count,
+		dp->dp_display.is_connected, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
 	mutex_unlock(&dp->event_mutex);
@@ -1481,6 +1490,11 @@ static int dp_pm_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops dp_pm_ops = {
+
+	SET_RUNTIME_PM_OPS(dp_runtime_suspend, dp_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+
 	.suspend = dp_pm_suspend,
 	.resume =  dp_pm_resume,
 };
@@ -1521,8 +1535,11 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	/* enable host_init for HPD intr for DP */
 	if (!dp_display->is_edp)
-		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
+		pm_runtime_get_sync(&dp->pdev->dev);
+
+	enable_irq(dp->irq);
 }
 
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
@@ -1645,6 +1662,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
+	pm_runtime_get_sync(&dp_display->pdev->dev);
 	if (dp->is_edp)
 		dp_hpd_plug_handle(dp_display, 0);
 
@@ -1728,6 +1746,7 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 	mutex_unlock(&dp_display->event_mutex);
+	pm_runtime_put_sync(&dp_display->pdev->dev);
 }
 
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c0aaabb03389..a736d1b0f02f 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -172,8 +172,6 @@ int dp_power_client_init(struct dp_power *dp_power)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	pm_runtime_enable(&power->pdev->dev);
-
 	rc = dp_power_clk_init(power);
 	if (rc)
 		DRM_ERROR("failed to init clocks %d\n", rc);
@@ -192,7 +190,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	pm_runtime_disable(&power->pdev->dev);
 }
 
 int dp_power_init(struct dp_power *dp_power, bool flip)
@@ -207,8 +204,6 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	pm_runtime_get_sync(&power->pdev->dev);
-
 	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
 	if (rc) {
 		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
@@ -218,7 +213,6 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
 	return 0;
 
 exit:
-	pm_runtime_put_sync(&power->pdev->dev);
 	return rc;
 }
 
@@ -229,7 +223,6 @@ int dp_power_deinit(struct dp_power *dp_power)
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
-	pm_runtime_put_sync(&power->pdev->dev);
 	return 0;
 }
 
-- 
2.39.0

