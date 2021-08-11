Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FCB3E961A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 18:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF9A6E16F;
	Wed, 11 Aug 2021 16:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FAA6E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 16:35:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628699726; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=81HxSiAxmVhbZ2RqbDrOF2B6QAi1XsMv+lVWWnJupJc=;
 b=UvSgzTilxKgMkASqc17R+aYSAk0PIGJsfvfoTN11+ZTSI6ustYLvhYwnjx/Y0YAOMS/Z6hvU
 X0KZ+fynZoFJnrNmz8IkWzlreu6StSU/+FoHduSnfg5HLIwU2yWC4V0/r/tdueEljnpm9oKZ
 B402sfujLSHnSL5dTLaqicyVgAg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6113fb3091487ad5208fd105 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 16:30:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 51B1CC43144; Wed, 11 Aug 2021 16:30:39 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 84617C4338A;
 Wed, 11 Aug 2021 16:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84617C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] drm/msm/dp: reduce link rate if failed at link
 training 1
Date: Wed, 11 Aug 2021 09:30:03 -0700
Message-Id: <1628699407-28358-3-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628699407-28358-1-git-send-email-khsieh@codeaurora.org>
References: <1628699407-28358-1-git-send-email-khsieh@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce link rate and re start link training if link training 1
failed due to loss of clock recovery done to fix Link Layer
CTS case 4.3.1.7.  Also only update voltage and pre-emphasis
swing level after link training started to fix Link Layer CTS
case 4.3.1.6.

Changes in V2:
-- replaced cr_status with link_status[DP_LINK_STATUS_SIZE]
-- replaced dp_ctrl_any_lane_cr_done() with dp_ctrl_colco_recovery_any_ok()
-- replaced dp_ctrl_any_ane_cr_lose() with !drm_dp_clock_recovery_ok()

Changes in V3:
-- return failed if lane_count <= 1

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 79 +++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 27fb0f0..0002805 100644
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
+			int *training_step)
 {
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
@@ -1109,9 +1102,6 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 		if (ret)
 			return ret;
 
-		cr->lane_0_1 = link_status[0];
-		cr->lane_2_3 = link_status[1];
-
 		if (drm_dp_clock_recovery_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
 			return 0;
@@ -1188,7 +1178,7 @@ static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
 }
 
 static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+			int *training_step)
 {
 	int tries = 0, ret = 0;
 	char pattern;
@@ -1204,10 +1194,6 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 	else
 		pattern = DP_TRAINING_PATTERN_2;
 
-	ret = dp_ctrl_update_vx_px(ctrl);
-	if (ret)
-		return ret;
-
 	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
 	if (ret)
 		return ret;
@@ -1220,8 +1206,6 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 		ret = dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
 			return ret;
-		cr->lane_0_1 = link_status[0];
-		cr->lane_2_3 = link_status[1];
 
 		if (drm_dp_channel_eq_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
@@ -1241,7 +1225,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl);
 
 static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+			int *training_step)
 {
 	int ret = 0;
 	u8 encoding = DP_SET_ANSI_8B10B;
@@ -1257,7 +1241,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				&encoding, 1);
 
-	ret = dp_ctrl_link_train_1(ctrl, cr, training_step);
+	ret = dp_ctrl_link_train_1(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
 		goto end;
@@ -1266,7 +1250,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	/* print success info as this is a result of user initiated action */
 	DRM_DEBUG_DP("link training #1 successful\n");
 
-	ret = dp_ctrl_link_train_2(ctrl, cr, training_step);
+	ret = dp_ctrl_link_train_2(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
 		goto end;
@@ -1282,7 +1266,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 }
 
 static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
-		struct dp_cr_status *cr, int *training_step)
+			int *training_step)
 {
 	int ret = 0;
 
@@ -1297,7 +1281,7 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	 * a link training pattern, we have to first do soft reset.
 	 */
 
-	ret = dp_ctrl_link_train(ctrl, cr, training_step);
+	ret = dp_ctrl_link_train(ctrl, training_step);
 
 	return ret;
 }
@@ -1496,14 +1480,13 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct dp_cr_status cr;
 	int training_step = DP_TRAINING_NONE;
 
 	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
+	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
 	if (ret)
 		goto end;
 
@@ -1634,6 +1617,25 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 	}
 }
 
+static bool dp_ctrl_clock_recovery_any_ok(
+			const u8 link_status[DP_LINK_STATUS_SIZE],
+			int lane_count)
+{
+	int reduced_cnt;
+
+	if (lane_count <= 1)
+		return false;
+
+	/*
+	 * only interested in the lane number after reduced
+	 * lane_count = 4, then only interested in 2 lanes
+	 * lane_count = 2, then only interested in 1 lane
+	 */
+	reduced_cnt = lane_count >> 1;
+
+	return drm_dp_clock_recovery_ok(link_status, reduced_cnt);
+}
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
@@ -1641,7 +1643,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	u32 rate = 0;
 	int link_train_max_retries = 5;
 	u32 const phy_cts_pixel_clk_khz = 148500;
-	struct dp_cr_status cr;
+	u8 cr_status[2];
+	u8 link_status[DP_LINK_STATUS_SIZE];
 	unsigned int training_step;
 
 	if (!dp_ctrl)
@@ -1681,19 +1684,21 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		}
 
 		training_step = DP_TRAINING_NONE;
-		rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
+		rc = dp_ctrl_setup_main_link(ctrl, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!dp_catalog_link_is_connected(ctrl->catalog)) {
+			if (!dp_catalog_link_is_connected(ctrl->catalog))
 				break;
-			}
+
+			dp_ctrl_read_link_status(ctrl, link_status);
 
 			rc = dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
-				if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
+				if (dp_ctrl_clock_recovery_any_ok(link_status,
+					ctrl->link->link_params.num_lanes)) {
 					/*
 					 * some lanes are ready,
 					 * reduce lane number
@@ -1709,12 +1714,18 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
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
+			dp_ctrl_read_link_status(ctrl, link_status);
+
+			if (!drm_dp_clock_recovery_ok(link_status,
+					ctrl->link->link_params.num_lanes))
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

