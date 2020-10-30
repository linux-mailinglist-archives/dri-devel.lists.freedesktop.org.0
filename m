Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560692A206C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3646EB2B;
	Sun,  1 Nov 2020 17:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46336EEAD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 23:23:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604100203; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=BLdO/YyUeVr9H8mVh5lP1ZN3Iw/7BuwJ8Kl9rrPhSww=;
 b=YbhmWzXa6sjUZB5GMcAbyk4PsTlVQK1HusUeylWvTcOBecpJVYxcrRtdm/KvDTc4tVLQwnMX
 PwzVL+1Bqags9SI2GuA0mW3x5bDQPOiF/9udTqm/feg35GyXnC0FlFI4zp/njfLF6dyqVhBp
 /UKDtVRBaYWVA4AAxultzqsMcy8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f9ca0551df7f5f83ce22212 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 23:23:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DABEDC433FF; Fri, 30 Oct 2020 23:23:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DACFC433C8;
 Fri, 30 Oct 2020 23:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DACFC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH] drm/msm/dp: deinitialize mainlink if link training failedo
Date: Fri, 30 Oct 2020 16:22:53 -0700
Message-Id: <20201030232253.11049-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP compo phy have to be enable to start link training. When
link training failed phy need to be disabled so that next
link trainng can be proceed smoothly at next plug in. This
patch de initialize mainlink to disable phy if link training
failed. This prevent system crash due to
disp_cc_mdss_dp_link_intf_clk stuck at "off" state.  This patch
also perform checking power_on flag at dp_display_enable() and
dp_display_disable() to avoid crashing when unplug cable while
display is off.

Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by failure of link train

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cee161c8ecc6..904698dfc7f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1468,6 +1468,29 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
+{
+	struct dp_io *dp_io;
+	struct phy *phy;
+	int ret = 0;
+
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret)
+		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
+
+	phy_power_off(phy);
+	phy_exit(phy);
+
+	return -ECONNRESET;
+}
+
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1648,8 +1671,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	if (rc)
 		return rc;
 
-	while (--link_train_max_retries &&
-		!atomic_read(&ctrl->dp_ctrl.aborted)) {
+	while (--link_train_max_retries) {
 		rc = dp_ctrl_reinitialize_mainlink(ctrl);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
@@ -1664,6 +1686,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
+			if (!dp_catalog_hpd_get_state_status(ctrl->catalog))
+				break;		/* link cable unplugged */
+
 			rc = dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
 				if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
@@ -1683,6 +1708,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed, lower lane rate */
+			if (!dp_catalog_hpd_get_state_status(ctrl->catalog))
+				break;		/* link cable unplugged */
+
 			rc = dp_ctrl_link_lane_down_shift(ctrl);
 			if (rc < 0) {
 				/* end with failure */
@@ -1703,6 +1731,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	 */
 	if (rc == 0)  /* link train successfully */
 		dp_ctrl_push_idle(dp_ctrl);
+	else
+		rc = dp_ctrl_deinitialize_mainlink(ctrl);
 
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3eb0d428abf7..13b66266cd69 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,11 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	if (ret) {	/* link train failed */
 		hpd->hpd_high = 0;
 		dp->hpd_state = ST_DISCONNECTED;
+
+		if (ret == -ECONNRESET) { /* cable unplugged */
+			dp->core_initialized = false;
+		}
+
 	} else {
 		/* start sentinel checking in case of missing uevent */
 		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
@@ -794,6 +799,11 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
+	if (dp_display->power_on) {
+		DRM_DEBUG_DP("Link already setup, return\n");
+		return 0;
+	}
+
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp_display->power_on = true;
@@ -826,6 +836,9 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
+	if (!dp_display->power_on)
+		return -EINVAL;
+
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		if (!wait_for_completion_timeout(&dp->audio_comp,

base-commit: fd4a29bed29b3d8f15942fdf77e7a0a52796d836
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
