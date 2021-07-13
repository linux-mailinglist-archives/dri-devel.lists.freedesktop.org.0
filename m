Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D343C73A6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9452A89E9E;
	Tue, 13 Jul 2021 15:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13AE6E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 15:55:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626191703; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VnsznbsgymeuQQtN710uGxcijFYUeHyIsmdi9XocIQA=;
 b=fTRDEao57ahBJD2g4OCFvF4qmlc3BCnN1xgtFNpbOpIN6nhWe8i0ZSRV70uca2lcjeJaOhuq
 5SLpVf0oaqiI+aczpQ8zqwhPfZ/iOgOQWnNZS//zuVqGNNqvk6tkVj9aVeMD16qNxcWpWott
 hSkVwcn1jkLI+3hmH9YQYZpzvXY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60edb74ec4cc54360284af4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:54:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C5C0C00917; Tue, 13 Jul 2021 15:54:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D6E7DC4323A;
 Tue, 13 Jul 2021 15:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6E7DC4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH v2 6/7] drm/msm/dp: do not end dp link training until video is
 ready
Date: Tue, 13 Jul 2021 08:54:06 -0700
Message-Id: <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
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

Initialize both pre-emphasis and voltage swing level to 0 before
start link training and do not end link training until video is
ready to reduce the period between end of link training and video
start to meet Link Layer CTS requirement.  This fixes Link Layer
CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3 and 4.3.2.4.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 92cf331..6a013b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1484,6 +1484,9 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 
 	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
@@ -1670,6 +1673,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
 		return rc;
@@ -1735,17 +1741,19 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return rc;
 
-	/* stop txing train pattern */
-	dp_ctrl_clear_training_pattern(ctrl);
+	if (rc == 0) {  /* link train successfully */
+		/*
+		 * do not stop train pattern here
+		 * stop link training at on_stream
+		 * to pass compliance test
+		 */
+	} else  {
+		/*
+		 * link training failed
+		 * end txing train pattern here
+		 */
+		dp_ctrl_clear_training_pattern(ctrl);
 
-	/*
-	 * keep transmitting idle pattern until video ready
-	 * to avoid main link from loss of sync
-	 */
-	if (rc == 0)  /* link train successfully */
-		dp_ctrl_push_idle(dp_ctrl);
-	else  {
-		/* link training failed */
 		dp_ctrl_deinitialize_mainlink(ctrl);
 		rc = -ECONNRESET;
 	}
@@ -1755,7 +1763,6 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 {
-	u32 rate = 0;
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
@@ -1765,10 +1772,6 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	rate = ctrl->panel->link_info.rate;
-
-	ctrl->link->link_params.rate = rate;
-	ctrl->link->link_params.num_lanes = ctrl->panel->link_info.num_lanes;
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
@@ -1783,6 +1786,9 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
+	/* stop txing train pattern to end link training */
+	dp_ctrl_clear_training_pattern(ctrl);
+
 	ret = dp_ctrl_enable_stream_clocks(ctrl);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

