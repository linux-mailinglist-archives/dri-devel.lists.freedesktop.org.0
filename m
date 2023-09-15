Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A97A2883
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC1B10E685;
	Fri, 15 Sep 2023 20:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3728C10E67F;
 Fri, 15 Sep 2023 20:48:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FJspku030456; Fri, 15 Sep 2023 20:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=VZb1ha5h3UOsogFmuuapQzRa0Mzd4pCRunMyJKJGIvA=;
 b=ZZH5MNnCRPSoxccsgy/f+FfJR4pQyag1k61XwhfEIQjmVrI2884DyQ9ugaH7K/BRM2uC
 2LiVYswSIHaXDbXo4OvcBfPomEFZ1tjDGOwXeBKgSl3dxD9oLwe/Wmvsk/ta791BUXZb
 g2DmvZCsqlCUi2qG2zfpUA+2UNLw+h4oPgtCL+29b6kJupHQrrPdTXN+bYA/duYAcmEL
 zucOnzbbqYkNb7fS0i6EJe96QsayPb2DTn8zVzEuAojekQa7qAJtEe2rOxwdkGyHkf86
 67D/qq7F3axn6b+hujr3woXFplOJD7dpUMPki5XpElidUMFq+HSquYEwpvDRY0Hye7iy gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g2xj82m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:48:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FKmZHH002257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:48:35 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 13:48:34 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
Date: Fri, 15 Sep 2023 13:48:07 -0700
Message-ID: <1694810888-24461-7-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694810888-24461-1-git-send-email-quic_khsieh@quicinc.com>
References: <1694810888-24461-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SbBs5s1lDUeKc8ja4UNGhcAf7iIm2D_P
X-Proofpoint-ORIG-GUID: SbBs5s1lDUeKc8ja4UNGhcAf7iIm2D_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_17,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150186
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add pm_runtime_force_suspend()/resume() to complete incorporating pm
runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
are added to set hpd_state to correct state. After resume, DP driver will
re training its main link after .hpd_enable() callback enabled HPD
interrupts and bring up display accordingly.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 87 +++++--------------------------------
 1 file changed, 10 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b6992202..b58cb02 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1333,101 +1333,35 @@ static int dp_pm_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int dp_pm_resume(struct device *dev)
+static void dp_pm_complete(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
-	struct dp_display_private *dp;
-	int sink_count = 0;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	mutex_lock(&dp->event_mutex);
 
 	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
+		"type=%d core_inited=%d phy_inited=%d power_on=%d\n",
 		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
+		dp->phy_initialized, dp->dp_display.power_on);
 
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
-	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp);
-
-	if (dp_display->is_edp)
-		dp_catalog_ctrl_hpd_enable(dp->catalog);
-
-	if (dp_catalog_link_is_connected(dp->catalog)) {
-		/*
-		 * set sink to normal operation mode -- D0
-		 * before dpcd read
-		 */
-		dp_display_host_phy_init(dp);
-		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
-		sink_count = drm_dp_read_sink_count(dp->aux);
-		if (sink_count < 0)
-			sink_count = 0;
-
-		dp_display_host_phy_exit(dp);
-	}
-
-	dp->link->sink_count = sink_count;
-	/*
-	 * can not declared display is connected unless
-	 * HDMI cable is plugged in and sink_count of
-	 * dongle become 1
-	 * also only signal audio when disconnected
-	 */
-	if (dp->link->sink_count) {
-		dp->dp_display.link_ready = true;
-	} else {
-		dp->dp_display.link_ready = false;
-		dp_display_handle_plugged_change(dp_display, false);
-	}
-
-	drm_dbg_dp(dp->drm_dev,
-		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
-		dp->dp_display.connector_type, dp->link->sink_count,
-		dp->dp_display.link_ready, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
 	mutex_unlock(&dp->event_mutex);
-
-	return 0;
 }
 
-static int dp_pm_suspend(struct device *dev)
+static int dp_pm_prepare(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	mutex_lock(&dp->event_mutex);
 
-	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
 	/* mainlink enabled */
 	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
 		dp_ctrl_off_link_stream(dp->ctrl);
 
-	dp_display_host_phy_exit(dp);
-
-	/* host_init will be called at pm_resume */
-	dp_display_host_deinit(dp);
-
 	dp->hpd_state = ST_SUSPENDED;
 
-	drm_dbg_dp(dp->drm_dev,
-		"After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1435,8 +1369,10 @@ static int dp_pm_suspend(struct device *dev)
 
 static const struct dev_pm_ops dp_pm_ops = {
 	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
-	.suspend = dp_pm_suspend,
-	.resume =  dp_pm_resume,
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+                                pm_runtime_force_resume)
+	.prepare = dp_pm_prepare,
+	.complete = dp_pm_complete,
 };
 
 static struct platform_driver dp_display_driver = {
@@ -1670,9 +1606,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	if (dp->is_edp)
-		dp_hpd_unplug_handle(dp_display, 0);
-
 	mutex_lock(&dp_display->event_mutex);
 
 	state = dp_display->hpd_state;
-- 
2.7.4

