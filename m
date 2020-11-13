Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3102B3B0A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D065F6E9EB;
	Mon, 16 Nov 2020 01:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F52A6E876
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 22:27:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605306422; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=MxIz1PS/QYcvKUyybnMX0F8kTF31tCq+qC/fv7RjJlc=;
 b=EdjNbsMqdHSeV+RbP6pAfB9KIXhqf+cB0SMurroxMIzZiDBKuM1wNn7lFWqOIeiFCkxe+omP
 4OEYDVdTj2B6GEhmZoHdzjkHyDYOGrx5c1w28XVGeWO+W0FikJi3GPYMXlMjeY9GtxBl0Rgn
 IxQKbUCgKHPnbBtijwPgLSkbb5Q=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5faf082ad3e05bb6dbb41503 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 22:26:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D417CC433FE; Fri, 13 Nov 2020 22:26:50 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DB71EC433C9;
 Fri, 13 Nov 2020 22:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB71EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH] drm/msm/dp: fix connect/disconnect handled at ir_hdp
Date: Fri, 13 Nov 2020 14:26:39 -0800
Message-Id: <20201113222639.18786-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

Some usb type-c dongle use irq_hpd request to perform device
connect and disconnect. This patch add handling of both connection
and disconnection are based on hpd_state and sink_count.

Fixes: 6c6e8b2e04d5 ("drm/msm/dp: promote irq_hpd handle to handle link training correctly")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 78 +++++++++++++++++------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 27e7e27b8b90..4e84f500b721 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -279,13 +279,25 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 	drm_helper_hpd_irq_event(connector->dev);
 }
 
-static int dp_display_send_hpd_notification(struct dp_display_private *dp,
-					    bool hpd)
+
+static void dp_display_set_encoder_mode(struct dp_display_private *dp)
 {
-	static bool encoder_mode_set;
 	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
 	struct msm_kms *kms = priv->kms;
+	static bool encoder_mode_set;
+
+	if (!encoder_mode_set && dp->dp_display.encoder &&
+				kms->funcs->set_encoder_mode) {
+		kms->funcs->set_encoder_mode(kms,
+				dp->dp_display.encoder, false);
 
+		encoder_mode_set = true;
+	}
+}
+
+static int dp_display_send_hpd_notification(struct dp_display_private *dp,
+					    bool hpd)
+{
 	if ((hpd && dp->dp_display.is_connected) ||
 			(!hpd && !dp->dp_display.is_connected)) {
 		DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
@@ -298,15 +310,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	dp->dp_display.is_connected = hpd;
 
-	if (dp->dp_display.is_connected && dp->dp_display.encoder
-				&& !encoder_mode_set
-				&& kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-		DRM_DEBUG_DP("set_encoder_mode() Completed\n");
-		encoder_mode_set = true;
-	}
-
 	dp_display_send_hpd_event(&dp->dp_display);
 
 	return 0;
@@ -359,6 +362,8 @@ static void dp_display_host_init(struct dp_display_private *dp)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
+	dp_display_set_encoder_mode(dp);
+
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip);
 	dp_aux_init(dp->aux);
@@ -448,15 +453,6 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 
 	sink_request = dp->link->sink_request;
 
-	if (sink_request & DS_PORT_STATUS_CHANGED) {
-		if (dp_display_is_sink_count_zero(dp)) {
-			DRM_DEBUG_DP("sink count is zero, nothing to do\n");
-			return -ENOTCONN;
-		}
-
-		return dp_display_process_hpd_high(dp);
-	}
-
 	dp_ctrl_handle_sink_request(dp->ctrl);
 
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN)
@@ -491,17 +487,29 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	if (!rc) {
 		sink_request = dp->link->sink_request;
 		if (sink_request & DS_PORT_STATUS_CHANGED) {
-			/* same as unplugged */
-			hpd->hpd_high = 0;
-			dp->hpd_state = ST_DISCONNECT_PENDING;
-			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
-		}
-
-		rc = dp_display_handle_irq_hpd(dp);
-
-		if (!rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
-			hpd->hpd_high = 1;
-			dp->hpd_state = ST_CONNECT_PENDING;
+			if (dp_display_is_sink_count_zero(dp)) {
+				DRM_DEBUG_DP("sink count is zero, nothing to do\n");
+				if (dp->hpd_state != ST_DISCONNECTED) {
+					hpd->hpd_high = 0;
+					dp->hpd_state = ST_DISCONNECT_PENDING;
+					dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+				}
+				rc = -ENOTCONN;
+			} else {
+				if (dp->hpd_state == ST_DISCONNECTED) {
+					hpd->hpd_high = 1;
+					dp->hpd_state = ST_CONNECT_PENDING;
+
+					rc = dp_display_process_hpd_high(dp);
+					if (rc) {
+						hpd->hpd_high = 0;
+						dp->hpd_state = ST_DISCONNECTED;
+					}
+				}
+			}
+		} else {
+			if (!dp_display_is_ds_bridge(dp->panel))
+				rc = dp_display_handle_irq_hpd(dp);
 		}
 	}
 
@@ -661,6 +669,7 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 {
 	u32 state;
+	int ret;
 
 	mutex_lock(&dp->event_mutex);
 
@@ -671,7 +680,10 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	if (ret == -ECONNRESET) { /* cable unplugged */
+		dp->core_initialized = false;
+	}
 
 	mutex_unlock(&dp->event_mutex);
 

base-commit: 6c6e8b2e04d537f42b5ebb8b8b0b31a39b44ccf4
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
