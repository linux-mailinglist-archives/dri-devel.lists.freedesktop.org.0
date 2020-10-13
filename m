Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FF28DA24
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FA86E9F6;
	Wed, 14 Oct 2020 07:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82C6E9AC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 23:36:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602632219; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=F3wUV8sxcb68wXz6pIw3+7SfF9kUhLTJbbvVbjtfHDI=;
 b=dmz1nPjKoLCZuyi/P4ZXxHN3nuIfLKX5TAnTqQc+Dd36ra95RSYxhahVq6gHAyvDkBWkizUZ
 2s/8wpwldRPS2dQP23hk3qOq04faoECw3d15KdqdWTenEzfwyRHRKXknwRMtGb+KXQHW1A8H
 IZ9sHO8mg8biQeEEwvp7nlwgR9o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f8639e5e9e942744ccd4a38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 23:36:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 394CBC43382; Tue, 13 Oct 2020 23:36:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 92A06C433C9;
 Tue, 13 Oct 2020 23:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92A06C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH v3] drm/msm/dp: fixes wrong connection state caused by failure
 of link train
Date: Tue, 13 Oct 2020 16:35:44 -0700
Message-Id: <20201013233544.5324-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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

Connection state is not set correctly happen when either failure of link
train due to cable unplugged in the middle of aux channel reading or
cable plugged in while in suspended state. This patch fixes these problems.
This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.

Changes in V2:
-- Add more information to commit message.

Changes in V3:
-- change base

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  5 ++++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d9164ff6515d..c0665a0a4c78 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,7 @@ enum {
 	ST_CONNECT_PENDING,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_SUSPEND_PENDING,
+	ST_DISPLAY_OFF,
 	ST_SUSPENDED,
 };
 
@@ -503,7 +503,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -525,14 +525,14 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	hpd->hpd_high = 1;
 
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
-	if (ret) {	/* failed */
+	if (ret) {	/* link train failed */
 		hpd->hpd_high = 0;
 		dp->hpd_state = ST_DISCONNECTED;
+	} else {
+		/* start sentinel checking in case of missing uevent */
+		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
 	}
 
-	/* start sanity checking */
-	dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
-
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -577,11 +577,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_DISCONNECT_PENDING || state == ST_DISCONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -608,7 +603,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 */
 	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
 
-	/* start sanity checking */
+	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
@@ -648,7 +643,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1073,7 +1068,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* delete connect pending event first */
+			/* stop sentinel connect pending checking */
 			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
@@ -1204,13 +1199,10 @@ static int dp_pm_resume(struct device *dev)
 
 	status = dp_catalog_hpd_get_state_status(dp->catalog);
 
-	if (status) {
+	if (status)
 		dp->dp_display.is_connected = true;
-	} else {
+	else
 		dp->dp_display.is_connected = false;
-		/* make sure next resume host_init be called */
-		dp->core_initialized = false;
-	}
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -1232,6 +1224,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	dp->hpd_state = ST_SUSPENDED;
 
+	/* host_init will be called at pm_resume */
+	dp->core_initialized = false;
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1361,6 +1356,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
 
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
@@ -1391,7 +1387,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		dp_display_unprepare(dp);
 	}
 
-	if (state == ST_SUSPEND_PENDING)
+	/* manual kick off plug event to train link */
+	if (state == ST_DISPLAY_OFF)
 		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
 
 	/* completed connection */
@@ -1423,6 +1420,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
 	dp_display_disable(dp_display, 0);
@@ -1436,7 +1434,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 		/* completed disconnection */
 		dp_display->hpd_state = ST_DISCONNECTED;
 	} else {
-		dp_display->hpd_state = ST_SUSPEND_PENDING;
+		dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	mutex_unlock(&dp_display->event_mutex);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 18cec4fc5e0b..1b7a20dc2d8e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -196,6 +196,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 					      &panel->aux->ddc);
 	if (!dp_panel->edid) {
 		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!dp_catalog_hpd_get_state_status(panel->catalog)) {
+			rc = -ETIMEDOUT;
+			goto end;
+		}
 
 		/* fail safe edid */
 		mutex_lock(&connector->dev->mode_config.mutex);

base-commit: aa2d34d0676cd6ee3327023405e5afdc5cc0b91d
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
