Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976027A835
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470296E2D7;
	Mon, 28 Sep 2020 07:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA166E075
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 20:35:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601152508; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=GCWwjWEfmmgYW2v0oU/ekR8qqnSHIjTtkkGegbeN01M=;
 b=lyE50G6y+/mRFNpbZfmLzZqUgVh6mJgcGxz3BNZRRu8JdD+aXGoiRcRWI+JdQhQfHOU9aj+7
 aed2XVx3O7m9tHOjjwrF/ZNasSkGzurSsZfM/5Y9yxDZYM3yakE/eMAJ4HVn8kAzfZIjziSJ
 cHHcLMeYDEk73lgHS+XLLa0dPK4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f6fa5faa7eb63c698bf0672 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Sep 2020 20:35:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28099C433CB; Sat, 26 Sep 2020 20:35:05 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 52368C433CA;
 Sat, 26 Sep 2020 20:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52368C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH v2] drm/msm/dp: return correct connection status after suspend
Date: Sat, 26 Sep 2020 13:34:54 -0700
Message-Id: <20200926203454.13643-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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

At dp_pm_resume, reinitialize both dp host controller and hpd block
so that hpd connection can be detected at realtime by reading hpd state
status register. Also hpd plug interrupt can be generated accordingly.

Changes in v2:
-- use container_of to cast correct dp_display_private pointer
   at both dp_pm_suspend and dp_pm_resume.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 13 ++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 67 ++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_reg.h     |  2 +
 4 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b15b4ce4ba35..63c5ada34c21 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -572,6 +572,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
+u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 status = 0;
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
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e175aa3fd3a9..431dff9de797 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -114,8 +114,6 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
-	struct completion resume_comp;
-
 	struct dp_audio *audio;
 };
 
@@ -508,9 +506,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	if (state == ST_SUSPENDED)
-		tout = DP_TIMEOUT_NONE;
-
 	atomic_set(&dp->hpd_state, ST_CONNECT_PENDING);
 
 	hpd->hpd_high = 1;
@@ -798,8 +793,6 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 	if (!rc)
 		dp_display->power_on = true;
 
-	/* complete resume_comp regardless it is armed or not */
-	complete(&dp->resume_comp);
 	return rc;
 }
 
@@ -1151,9 +1144,6 @@ static int dp_display_probe(struct platform_device *pdev)
 	}
 
 	mutex_init(&dp->event_mutex);
-
-	init_completion(&dp->resume_comp);
-
 	g_dp_display = &dp->dp_display;
 
 	/* Store DP audio handle inside DP display */
@@ -1189,18 +1179,40 @@ static int dp_display_remove(struct platform_device *pdev)
 
 static int dp_pm_resume(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct dp_display_private *dp;
+	u32 status;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
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
+
+	if (dp_display->power_on == true)
+		dp_display_disable(dp, 0);
 
 	atomic_set(&dp->hpd_state, ST_SUSPENDED);
 
@@ -1317,19 +1329,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
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
@@ -1359,14 +1358,6 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	}
 
 	state =  atomic_read(&dp_display->hpd_state);
-	if (state == ST_SUSPENDED) {
-		/* start link training */
-		dp_add_event(dp_display, EV_HPD_PLUG_INT, 0, 0);
-		mutex_unlock(&dp_display->event_mutex);
-
-		/* wait until dp interface is up */
-		goto resume_done;
-	}
 
 	dp_display_enable(dp_display, 0);
 
@@ -1388,10 +1379,6 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	mutex_unlock(&dp_display->event_mutex);
 
 	return rc;
-
-resume_done:
-	dp_display_wait4resume_done(dp_display);
-	return rc;
 }
 
 int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
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

base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
