Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F03BDC1E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245556E56A;
	Tue,  6 Jul 2021 17:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CA26E56D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:20:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625592059; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tpzVFm7ci8SuepcndghBja1AIJRwuydwgXNQPZ+MCWs=;
 b=QArOvhm1PE7XtxDi1RWAbNLQ6IBPCA8trYRDUcREcXWhmuk4RVW9NOnziKH2gxRoLOmvUszQ
 xQUQRHOR5H/d6Dsq1tA1usKoYIvkXjElgI/E2zNM8tMp9hBGXY252GeM4UtHTqHdBflzyVx+
 4hndktoRG80YFiaHC+7Hmdbu8gA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60e490eac4cc543602574032 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4B93FC43460; Tue,  6 Jul 2021 17:20:42 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29B17C433D3;
 Tue,  6 Jul 2021 17:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29B17C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 2/7] drm/msm/dp: reduce link rate if failed at link training 1
Date: Tue,  6 Jul 2021 10:20:15 -0700
Message-Id: <1625592020-22658-3-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce link rate and re start link training if link training 1
failed due to loss of clock recovery done to fix Link Layer
CTS case 4.3.1.7.  Also only update voltage and pre-emphasis
swing level after link training started to fix Link Layer CTS
case 4.3.1.6.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 86 ++++++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 27fb0f0..6f8443d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -83,13 +83,6 @@ struct dp_ctrl_private {
 	struct completion video_comp;
 };
 
-struct dp_cr_status {
-	u8 lane_0_1;
-	u8 lane_2_3;
-};
-
-#define DP_LANE0_1_CR_DONE	0x11
-
 static int dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
@@ -1080,7 +1073,7 @@ static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
 }
 
 static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+		u8 *cr, int *training_step)
 {
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
@@ -1109,8 +1102,8 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 		if (ret)
 			return ret;
 
-		cr->lane_0_1 = link_status[0];
-		cr->lane_2_3 = link_status[1];
+		cr[0] = link_status[0];
+		cr[1] = link_status[1];
 
 		if (drm_dp_clock_recovery_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
@@ -1188,7 +1181,7 @@ static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
 }
 
 static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+		u8 *cr, int *training_step)
 {
 	int tries = 0, ret = 0;
 	char pattern;
@@ -1204,10 +1197,6 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 	else
 		pattern = DP_TRAINING_PATTERN_2;
 
-	ret = dp_ctrl_update_vx_px(ctrl);
-	if (ret)
-		return ret;
-
 	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
 	if (ret)
 		return ret;
@@ -1220,8 +1209,8 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 		ret = dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
 			return ret;
-		cr->lane_0_1 = link_status[0];
-		cr->lane_2_3 = link_status[1];
+		cr[0] = link_status[0];
+		cr[1] = link_status[1];
 
 		if (drm_dp_channel_eq_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
@@ -1241,7 +1230,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl);
 
 static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+		u8 *cr, int *training_step)
 {
 	int ret = 0;
 	u8 encoding = DP_SET_ANSI_8B10B;
@@ -1282,7 +1271,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 }
 
 static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+		u8 *cr, int *training_step)
 {
 	int ret = 0;
 
@@ -1496,14 +1485,14 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct dp_cr_status cr;
+	u8 cr_status[2];
 	int training_step = DP_TRAINING_NONE;
 
 	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
+	ret = dp_ctrl_setup_main_link(ctrl, cr_status, &training_step);
 	if (ret)
 		goto end;
 
@@ -1634,6 +1623,41 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 	}
 }
 
+static bool dp_ctrl_any_lane_cr_done(struct dp_ctrl_private *ctrl,
+					u8 *cr_status)
+
+{
+	int i;
+	u8 status;
+	int lane = ctrl->link->link_params.num_lanes;
+
+	for (i = 0; i < lane; i++) {
+		status = cr_status[i / 2];
+		status >>= ((i % 2) * 4);
+		if (status & DP_LANE_CR_DONE)
+			return true;
+	}
+
+	return false;
+}
+
+static bool dp_ctrl_any_lane_cr_lose(struct dp_ctrl_private *ctrl,
+					u8 *cr_status)
+{
+	int i;
+	u8 status;
+	int lane = ctrl->link->link_params.num_lanes;
+
+	for (i = 0; i < lane; i++) {
+		status = cr_status[i / 2];
+		status >>= ((i % 2) * 4);
+		if (!(status & DP_LANE_CR_DONE))
+			return true;
+	}
+
+	return false;
+}
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
@@ -1641,7 +1665,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	u32 rate = 0;
 	int link_train_max_retries = 5;
 	u32 const phy_cts_pixel_clk_khz = 148500;
-	struct dp_cr_status cr;
+	u8 cr_status[2];
 	unsigned int training_step;
 
 	if (!dp_ctrl)
@@ -1681,19 +1705,18 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		}
 
 		training_step = DP_TRAINING_NONE;
-		rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
+		rc = dp_ctrl_setup_main_link(ctrl, cr_status, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!dp_catalog_link_is_connected(ctrl->catalog)) {
+			if (!dp_catalog_link_is_connected(ctrl->catalog))
 				break;
-			}
 
 			rc = dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
-				if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
+				if (dp_ctrl_any_lane_cr_done(ctrl, cr_status)) {
 					/*
 					 * some lanes are ready,
 					 * reduce lane number
@@ -1709,12 +1732,15 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 				}
 			}
 		} else if (training_step == DP_TRAINING_2) {
-			/* link train_2 failed, lower lane rate */
-			if (!dp_catalog_link_is_connected(ctrl->catalog)) {
+			/* link train_2 failed */
+			if (!dp_catalog_link_is_connected(ctrl->catalog))
 				break;
-			}
 
-			rc = dp_ctrl_link_lane_down_shift(ctrl);
+			if (dp_ctrl_any_lane_cr_lose(ctrl, cr_status))
+				rc = dp_ctrl_link_rate_down_shift(ctrl);
+			else
+				rc = dp_ctrl_link_lane_down_shift(ctrl);
+
 			if (rc < 0) {
 				/* end with failure */
 				break; /* lane == 1 already */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

