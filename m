Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F8500CF7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 14:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4473510F291;
	Thu, 14 Apr 2022 12:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D94E10FBC2;
 Thu, 14 Apr 2022 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649938806; x=1681474806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GfFRRmZLIH2eBD0zE/OqScQ8MQk9H2UA/VOcqc54mKA=;
 b=KKcR4aId70Rywpi4MdQcbGLpOGZllfSOkLw4HynRgT04nQfjZ++amjX6
 eyckD4G+2iSH/73zcQ6F71PCnzujcQj00WsVlccG3oRPSUs9ZKCMw1U5E
 McE67ZTonE2GST3e1q/lKZvbPVvWClB6Sfzdrqq3lPxObEZL23V1ePkbi s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Apr 2022 05:20:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 05:20:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 05:20:04 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 05:19:58 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v7 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts
 for eDP
Date: Thu, 14 Apr 2022 17:49:24 +0530
Message-ID: <1649938766-6768-3-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 dianders@chromium.org, bjorn.andersson@linaro.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel-edp enables the eDP panel power during probe, get_modes
and enable. The eDP connect and disconnect interrupts for the eDP/DP
controller are directly dependent on panel power. As eDP display can be
assumed as always connected, the controller driver can skip the eDP
connect and disconnect interrupts. Any disruption in the link status
will be indicated via the IRQ_HPD interrupts.

So, the eDP controller driver can just enable the IRQ_HPD and replug
interrupts. The DP controller driver still needs to enable all the
interrupts.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v7:
  - reordered the patch in the series
  - modified the return statement for isr
  - connector check modified to just check for eDP

 drivers/gpu/drm/msm/dp/dp_catalog.c |  9 +++------
 drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index fac815f..07f2389 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -569,10 +569,6 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 
 	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
 
-	/* enable HPD plug and unplug interrupts */
-	dp_catalog_hpd_config_intr(dp_catalog,
-		DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, true);
-
 	/* Configure REFTIMER and enable it */
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
 	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
@@ -599,13 +595,14 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
-	int isr = 0;
+	int isr, mask;
 
 	isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
 	dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
 				 (isr & DP_DP_HPD_INT_MASK));
+	mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
 
-	return isr;
+	return isr & (mask | ~DP_DP_HPD_INT_MASK);
 }
 
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 43c59cb..1339c45 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -683,7 +683,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_display_handle_plugged_change(&dp->dp_display, false);
 
 	/* enable HDP plug interrupt to prepare for next plugin */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
 
 	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -1096,6 +1097,13 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
 	dp_display_host_init(dp);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
+	/* Enable plug and unplug interrupts only for external DisplayPort */
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+				DP_DP_HPD_PLUG_INT_MASK |
+				DP_DP_HPD_UNPLUG_INT_MASK,
+				true);
+
 	/* Enable interrupt first time
 	 * we are leaving dp clocks on during disconnect
 	 * and never disable interrupt
@@ -1381,6 +1389,12 @@ static int dp_pm_resume(struct device *dev)
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
 
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+				DP_DP_HPD_PLUG_INT_MASK |
+				DP_DP_HPD_UNPLUG_INT_MASK,
+				true);
+
 	if (dp_catalog_link_is_connected(dp->catalog)) {
 		/*
 		 * set sink to normal operation mode -- D0
@@ -1654,6 +1668,9 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
+	if (dp->is_edp)
+		dp_hpd_plug_handle(dp_display, 0);
+
 	mutex_lock(&dp_display->event_mutex);
 
 	/* stop sentinel checking */
@@ -1718,6 +1735,9 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
+	if (dp->is_edp)
+		dp_hpd_unplug_handle(dp_display, 0);
+
 	mutex_lock(&dp_display->event_mutex);
 
 	/* stop sentinel checking */
-- 
2.7.4

