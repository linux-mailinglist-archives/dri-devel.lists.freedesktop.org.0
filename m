Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF347B0DC4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BD510E5C0;
	Wed, 27 Sep 2023 20:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD610E5B9;
 Wed, 27 Sep 2023 20:54:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RKFTXk012530; Wed, 27 Sep 2023 20:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=9a+/WMRmVoVO3fhRoKc8WHoZzcWwvB2xv3lI6f3C6r8=;
 b=j2XfStHSTEMh4Cjn/HeILLkK7TVzWoko6iXoLEwNWhxuJ9dPTVpVBM3XCN8AUi66OMV4
 Y+zdVim5fXA9RFLaZnUnROdAAklfE7Cd/lXaThpD0ZdNbvQGafJeamBUPjFH3tmeaTzx
 BRHW810lIXNR0llsl6k7r1kwZKkw7+IhknZ47ZXbvJcuGz8xM7Q208azD3hu9DbS49Bs
 /T+NstCRBKHZP4zo/ep2Ivqhv6L1yH70SCwEY/9vVK5KOiIzXsyRlS19SawgNAuSYu23
 dkgIupX9XgYfEqNjmrau6Zb0y0e28uSAO2+LKo4sf59SqBFAuTlecuat5ZBACmTwni5g cA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tct5gr6b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:54:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38RKs9Vd028921
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:54:09 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 27 Sep 2023 13:54:08 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v4 7/8] drm/msm/dp: add pm_runtime_force_suspend()/resume()
Date: Wed, 27 Sep 2023 13:53:47 -0700
Message-ID: <1695848028-18023-8-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 47Ojmjz55pXuYqva2zIkTd-XpY07A5o2
X-Proofpoint-GUID: 47Ojmjz55pXuYqva2zIkTd-XpY07A5o2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_13,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270178
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

After incorporated pm_runtime framework into eDP/DP driver, the
original dp_pm_suspend() to handle power off both DP phy and
controller during suspend and dp_pm_resume() to handle power on
both DP phy and controller during resume are not necessary since
those function are replaced by dp_pm_runtime_suspend() and
dp_pm_runtime_resume() through pm runtime framework.
Therefore add pm framework provides functions,
pm_runtime_force_suspend()/resume() to complete incorporating pm
runtime framework into DP driver.

Changes in v4:
-- drop both dp_pm_prepare() and dp_pm_compete() from this change
-- delete ST_SUSPENDED state
-- rewording commit text to add more details regrading the purpose
   of this change

Changes in v3:
-- replace dp_pm_suspend() with pm_runtime_force_suspend()
-- replace dp_pm_resume() with pm_runtime_force_resume()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 113 ++----------------------------------
 1 file changed, 5 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9158a2c..711d262 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -49,7 +49,6 @@ enum {
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 	ST_DISPLAY_OFF,
-	ST_SUSPENDED,
 };
 
 enum {
@@ -560,7 +559,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
+	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -674,7 +673,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
+	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1321,110 +1320,10 @@ static int dp_pm_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int dp_pm_resume(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
-	struct dp_display_private *dp;
-	int sink_count = 0;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	mutex_lock(&dp->event_mutex);
-
-	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
-	/* start from disconnected state */
-	dp->hpd_state = ST_DISCONNECTED;
-
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
-	mutex_unlock(&dp->event_mutex);
-
-	return 0;
-}
-
-static int dp_pm_suspend(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	mutex_lock(&dp->event_mutex);
-
-	drm_dbg_dp(dp->drm_dev,
-		"Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
-	/* mainlink enabled */
-	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
-		dp_ctrl_off_link_stream(dp->ctrl);
-
-	dp_display_host_phy_exit(dp);
-
-	/* host_init will be called at pm_resume */
-	dp_display_host_deinit(dp);
-
-	dp->hpd_state = ST_SUSPENDED;
-
-	drm_dbg_dp(dp->drm_dev,
-		"After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
-		dp->dp_display.connector_type, dp->core_initialized,
-		dp->phy_initialized, dp_display->power_on);
-
-	mutex_unlock(&dp->event_mutex);
-
-	return 0;
-}
-
 static const struct dev_pm_ops dp_pm_ops = {
 	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
-	.suspend = dp_pm_suspend,
-	.resume =  dp_pm_resume,
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+                                pm_runtime_force_resume)
 };
 
 static struct platform_driver dp_display_driver = {
@@ -1658,9 +1557,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	if (dp->is_edp)
-		dp_hpd_unplug_handle(dp_display, 0);
-
 	mutex_lock(&dp_display->event_mutex);
 
 	state = dp_display->hpd_state;
@@ -1748,6 +1644,7 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	dp_catalog_ctrl_hpd_disable(dp->catalog);
 
 	dp_display->internal_hpd = false;
+	dp->hpd_state = ST_DISCONNECTED;
 
 	pm_runtime_mark_last_busy(&dp->pdev->dev);
 	pm_runtime_put_autosuspend(&dp->pdev->dev);
-- 
2.7.4

