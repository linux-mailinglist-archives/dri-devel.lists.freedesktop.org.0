Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8379523F87
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 23:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981FA10E2CB;
	Wed, 11 May 2022 21:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EBC10E2CB;
 Wed, 11 May 2022 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652305235; x=1683841235;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=vCE9kLCnjN6pdnyaWK2/ezolR/vfYsrQ+uIXZqhnISs=;
 b=R8J5KuvzB1klwMhvPDy+C30uNJgwpFw0Mrze1YBejqVow0aRgTL8lCHl
 6rN4KvW4upDTAyQ6IkADS353pzDYNqiPoreVmGZP5XuQ9jkPxBU/B2hpF
 EeNGYBQbIyAjwvMAqp9zJ7Ct+/eI1KaZQ4W25nEYTfK1b82XJJ7P77eQw 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 May 2022 14:40:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 14:40:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 14:40:33 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 14:40:32 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v4] drm/msm/dp: Always clear mask bits to disable interrupts
 at dp_ctrl_reset_irq_ctrl()
Date: Wed, 11 May 2022 14:40:25 -0700
Message-ID: <1652305225-1048-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_catalog_ctrl_reset() will software reset DP controller. But it will
not reset programmable registers to default value. DP driver still have
to clear mask bits to interrupt status registers to disable interrupts
after software reset of controller. This patch removes the enable flag
condition checking to always clear mask bits of interrupt status
registers to disable interrupts if enable flag is false.

This patch also will fix the potential problem happen at system suspend where
dp_ctrl_reset_irq_ctrl() was called to try to disable HPD related irqs but
the irq is still unmasked unexpectedly and can come in while system are
suspending. This leads to bus hangs if the irq is handled after we power down
the DP hardware because we run the irq handler and access a device register
assuming that no irq could ever come in if we powered down the device. We
don't know when the irq will be handled though, so it's possible the irq is
pending from before we disable the irq in the hardware.

Changes in v2:
-- add more details commit text

Changes in v3:
-- add synchrons_irq()
-- add atomic_t suspended

Changes in v4:
-- correct Fixes's commit ID

Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++--
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index af7a80c..f3e333e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
-	if (enable)
-		dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
+	/*
+	 * all dp controller programmable registers will not
+	 * be reset to default value after DP_SW_RESET
+	 * therefore interrupt mask bits have to be updated
+	 * to enable/disable interrupts
+	 */
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
 }
 
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c388323..c34dbfc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -98,6 +98,8 @@ struct dp_display_private {
 	struct dp_ctrl    *ctrl;
 	struct dp_debug   *debug;
 
+	atomic_t suspended;
+
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
@@ -187,6 +189,11 @@ static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
 	int pndx;
 
 	spin_lock_irqsave(&dp_priv->event_lock, flag);
+	if (atomic_read(&dp_priv->suspended)) {
+		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+		return -EPERM;
+	}
+
 	pndx = dp_priv->event_pndx + 1;
 	pndx %= DP_EVENT_Q_MAX;
 	if (pndx == dp_priv->event_gndx) {
@@ -454,6 +461,13 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
+	if (!dp->core_initialized) {
+		DRM_DEBUG_DP("DP core not initialized\n");
+		return;
+	}
+
+	synchronize_irq(dp->irq);
+
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
 	dp_power_deinit(dp->power);
@@ -1362,6 +1376,8 @@ static int dp_pm_resume(struct device *dev)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
+	atomic_set(&dp->suspended, 0);
+
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
@@ -1431,6 +1447,8 @@ static int dp_pm_suspend(struct device *dev)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
+	atomic_inc(&dp->suspended);
+
 	/* mainlink enabled */
 	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
 		dp_ctrl_off_link_stream(dp->ctrl);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

