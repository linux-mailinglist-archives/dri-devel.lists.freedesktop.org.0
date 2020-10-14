Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8C28ED6A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A21E6EC1D;
	Thu, 15 Oct 2020 07:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9A6EB09
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 17:11:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602695492; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QZJT98bSS0CNUibsQD6bEPyQItvZSmjw3Aa7k8V/78A=;
 b=jzISFpguhySIbVIdDJ3+wLHND1t84y4JM95or9CiPIo2rIeDNY740jD8i8yYrtmwooJLoHk3
 6G+v6yESfXz4L17Zq4b9lXszb2xrz6GBIoDoLvoNsu0Fxw/im3qyb5RE5bgtRsuj+3cvvud6
 FbxktxzlVBo6KiWFWJ1QqRGuW1I=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f873131588858a3041a92c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 17:11:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B44C4C433FF; Wed, 14 Oct 2020 17:11:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FABBC433C9;
 Wed, 14 Oct 2020 17:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6FABBC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH v5] drm/msm/dp: return correct connection status after suspend
Date: Wed, 14 Oct 2020 10:11:03 -0700
Message-Id: <20201014171103.30098-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During suspend, dp host controller and hpd block are disabled due to
both ahb and aux clock are disabled. Therefore hpd plug/unplug interrupts
will not be generated. At dp_pm_resume(), reinitialize both dp host
controller and hpd block so that hpd plug/unplug interrupts will be
generated and handled by driver so that hpd connection state is updated
correctly. This patch will fix link training flaky issues.

Changes in v2:
-- use container_of to cast correct dp_display_private pointer
   at both dp_pm_suspend() and dp_pm_resume().

Changes in v3:
-- replace hpd_state atomic_t  with u32

Changes in v4
-- call dp_display_host_deinit() at dp_pm_suspend()
-- call dp_display_host_init() at msm_dp_display_enable()
-- fix phy->init_count unbalance which causes link training failed

Changes in v4
--  add Fixes tag

Fixes:  8ede2ecc3e5e (drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  13 +++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   5 +
 drivers/gpu/drm/msm/dp/dp_display.c | 144 +++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +
 5 files changed, 97 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b15b4ce4ba35..4963bfe6a472 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -572,6 +572,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
+u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 status;
+
+	status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
+	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
+
+	return status;
+}
+
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 4b7666f1fe6f..6d257dbebf29 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -97,6 +97,7 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 			u32 intr_mask, bool en);
 void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2e3e1917351f..6bdaec778c4c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1400,6 +1400,8 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
 
 	if (!dp_ctrl) {
 		DRM_ERROR("Invalid input data\n");
@@ -1407,8 +1409,11 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 	}
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
 
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+	phy_exit(phy);
 
 	DRM_DEBUG_DP("Host deinitialized successfully\n");
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e175aa3fd3a9..cb92d0c61a2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,14 +108,12 @@ struct dp_display_private {
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
-	atomic_t hpd_state;
+	u32 hpd_state;
 	u32 event_pndx;
 	u32 event_gndx;
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
-	struct completion resume_comp;
-
 	struct dp_audio *audio;
 };
 
@@ -366,6 +364,20 @@ static void dp_display_host_init(struct dp_display_private *dp)
 	dp->core_initialized = true;
 }
 
+static void dp_display_host_deinit(struct dp_display_private *dp)
+{
+	if (!dp->core_initialized) {
+		DRM_DEBUG_DP("DP core not initialized\n");
+		return;
+	}
+
+	dp_ctrl_host_deinit(dp->ctrl);
+	dp_aux_deinit(dp->aux);
+	dp_power_deinit(dp->power);
+
+	dp->core_initialized = false;
+}
+
 static int dp_display_usbpd_configure_cb(struct device *dev)
 {
 	int rc = 0;
@@ -490,7 +502,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  atomic_read(&dp->hpd_state);
+	state =  dp->hpd_state;
 	if (state == ST_SUSPEND_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -508,17 +520,14 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	if (state == ST_SUSPENDED)
-		tout = DP_TIMEOUT_NONE;
-
-	atomic_set(&dp->hpd_state, ST_CONNECT_PENDING);
+	dp->hpd_state = ST_CONNECT_PENDING;
 
 	hpd->hpd_high = 1;
 
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
 	if (ret) {	/* failed */
 		hpd->hpd_high = 0;
-		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+		dp->hpd_state = ST_DISCONNECTED;
 	}
 
 	/* start sanity checking */
@@ -539,10 +548,10 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  atomic_read(&dp->hpd_state);
+	state = dp->hpd_state;
 	if (state == ST_CONNECT_PENDING) {
 		dp_display_enable(dp, 0);
-		atomic_set(&dp->hpd_state, ST_CONNECTED);
+		dp->hpd_state = ST_CONNECTED;
 	}
 
 	mutex_unlock(&dp->event_mutex);
@@ -567,7 +576,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state = atomic_read(&dp->hpd_state);
+	state = dp->hpd_state;
 	if (state == ST_SUSPEND_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -585,7 +594,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	atomic_set(&dp->hpd_state, ST_DISCONNECT_PENDING);
+	dp->hpd_state = ST_DISCONNECT_PENDING;
 
 	/* disable HPD plug interrupt until disconnect is done */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK
@@ -620,10 +629,10 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  atomic_read(&dp->hpd_state);
+	state =  dp->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		dp_display_disable(dp, 0);
-		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+		dp->hpd_state = ST_DISCONNECTED;
 	}
 
 	mutex_unlock(&dp->event_mutex);
@@ -638,7 +647,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  atomic_read(&dp->hpd_state);
+	state =  dp->hpd_state;
 	if (state == ST_SUSPEND_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -789,17 +798,10 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
-	if (dp_display->power_on) {
-		DRM_DEBUG_DP("Link already setup, return\n");
-		return 0;
-	}
-
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp_display->power_on = true;
 
-	/* complete resume_comp regardless it is armed or not */
-	complete(&dp->resume_comp);
 	return rc;
 }
 
@@ -828,9 +830,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
-	if (!dp_display->power_on)
-		return -EINVAL;
-
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		if (!wait_for_completion_timeout(&dp->audio_comp,
@@ -1151,9 +1150,6 @@ static int dp_display_probe(struct platform_device *pdev)
 	}
 
 	mutex_init(&dp->event_mutex);
-
-	init_completion(&dp->resume_comp);
-
 	g_dp_display = &dp->dp_display;
 
 	/* Store DP audio handle inside DP display */
@@ -1189,20 +1185,54 @@ static int dp_display_remove(struct platform_device *pdev)
 
 static int dp_pm_resume(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct dp_display_private *dp;
+	u32 status;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	mutex_lock(&dp->event_mutex);
+
+	/* start from disconnected state */
+	dp->hpd_state = ST_DISCONNECTED;
+
+	/* turn on dp ctrl/phy */
+	dp_display_host_init(dp);
+
+	dp_catalog_ctrl_hpd_config(dp->catalog);
+
+	status = dp_catalog_hpd_get_state_status(dp->catalog);
+
+	if (status) {
+		dp->dp_display.is_connected = true;
+	} else {
+		dp->dp_display.is_connected = false;
+		/* make sure next resume host_init be called */
+		dp->core_initialized = false;
+	}
+
+	mutex_unlock(&dp->event_mutex);
+
 	return 0;
 }
 
 static int dp_pm_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dp_display_private *dp = platform_get_drvdata(pdev);
+	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct dp_display_private *dp;
 
-	if (!dp) {
-		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
-		return -EINVAL;
-	}
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	atomic_set(&dp->hpd_state, ST_SUSPENDED);
+	mutex_lock(&dp->event_mutex);
+
+	if (dp->core_initialized == true)
+		dp_display_host_deinit(dp);
+
+	dp->hpd_state = ST_SUSPENDED;
+
+	mutex_unlock(&dp->event_mutex);
 
 	return 0;
 }
@@ -1317,19 +1347,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-static int dp_display_wait4resume_done(struct dp_display_private *dp)
-{
-	int ret = 0;
-
-	reinit_completion(&dp->resume_comp);
-	if (!wait_for_completion_timeout(&dp->resume_comp,
-				WAIT_FOR_RESUME_TIMEOUT_JIFFIES)) {
-		DRM_ERROR("wait4resume_done timedout\n");
-		ret = -ETIMEDOUT;
-	}
-	return ret;
-}
-
 int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 {
 	int rc = 0;
@@ -1344,6 +1361,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
+
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
@@ -1358,15 +1377,10 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		return rc;
 	}
 
-	state =  atomic_read(&dp_display->hpd_state);
-	if (state == ST_SUSPENDED) {
-		/* start link training */
-		dp_add_event(dp_display, EV_HPD_PLUG_INT, 0, 0);
-		mutex_unlock(&dp_display->event_mutex);
+	state =  dp_display->hpd_state;
 
-		/* wait until dp interface is up */
-		goto resume_done;
-	}
+	if (state == ST_SUSPEND_PENDING)
+		dp_display_host_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
 
@@ -1377,21 +1391,15 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		dp_display_unprepare(dp);
 	}
 
-	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
-
 	if (state == ST_SUSPEND_PENDING)
 		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
 
 	/* completed connection */
-	atomic_set(&dp_display->hpd_state, ST_CONNECTED);
+	dp_display->hpd_state = ST_CONNECTED;
 
 	mutex_unlock(&dp_display->event_mutex);
 
 	return rc;
-
-resume_done:
-	dp_display_wait4resume_done(dp_display);
-	return rc;
 }
 
 int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
@@ -1415,20 +1423,20 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
+
 	dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
 		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
 
-	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
-
-	state =  atomic_read(&dp_display->hpd_state);
+	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-		atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
+		dp_display->hpd_state = ST_DISCONNECTED;
 	} else {
-		atomic_set(&dp_display->hpd_state, ST_SUSPEND_PENDING);
+		dp_display->hpd_state = ST_SUSPEND_PENDING;
 	}
 
 	mutex_unlock(&dp_display->event_mutex);
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 43042ff90a19..268602803d9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -32,6 +32,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

base-commit: d1ea914925856d397b0b3241428f20b945e31434
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
