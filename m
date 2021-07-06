Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75B3BDC2E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38E86E563;
	Tue,  6 Jul 2021 17:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37256E563
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:21:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625592077; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ue8F0l6NTI/MSm1XwJCUi99T1LTBtuJ1aOY2Gnu2ym8=;
 b=Fl9LP4kugCstLVVVPRjRlg5rnGvWddhHf6dgQHwSn4p1QTYzyE7TwRuYFdpPIdtgfuVR1pXw
 wLNDRDtX5wj8wulSqiMkxBdaZAsQetXU8hYIhp/4GH351TBo70yyQANYyWEr7l13nYo6JGRv
 kc8AxH/Itu+nnJdr5JaI0SX0tHM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60e490f54ca9face3430c232 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F569C4323A; Tue,  6 Jul 2021 17:20:52 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 28148C43460;
 Tue,  6 Jul 2021 17:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28148C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 7/7] drm/msm/dp: retrain link when loss of symbol lock detected
Date: Tue,  6 Jul 2021 10:20:20 -0700
Message-Id: <1625592020-22658-8-git-send-email-khsieh@codeaurora.org>
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

Main link symbol locked is achieved at end of link training 2. Some
dongle main link symbol may become unlocked again if host did not end
link training soon enough after completion of link training 2. Host
have to re train main link if loss of symbol lock detected before
end link training so that the coming video stream can be transmitted
to sink properly.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 0cb01a9..e616ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1661,6 +1661,25 @@ static bool dp_ctrl_any_lane_cr_lose(struct dp_ctrl_private *ctrl,
 	return false;
 }
 
+static bool dp_ctrl_loss_symbol_lock(struct dp_ctrl_private *ctrl)
+{
+	u8 link_status[6];
+	u8 status;
+	int i;
+	int lane = ctrl->link->link_params.num_lanes;
+
+	dp_ctrl_read_link_status(ctrl, link_status);
+
+	for (i = 0; i < lane; i++) {
+		status = link_status[i / 2];
+		status >>= ((i % 2) * 4);
+		if (!(status & DP_LANE_SYMBOL_LOCKED))
+			return true;
+	}
+
+	return false;
+}
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
@@ -1777,6 +1796,17 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	return rc;
 }
 
+static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+	u8 cr_status[2];
+	int training_step = DP_TRAINING_NONE;
+
+	ret = dp_ctrl_setup_main_link(ctrl, cr_status, &training_step);
+
+	return ret;
+}
+
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 {
 	int ret = 0;
@@ -1802,6 +1832,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
+	/* if loss symbol lock happen, then retaining the link */
+	if (dp_ctrl_loss_symbol_lock(ctrl))
+		dp_ctrl_link_retrain(ctrl);
+
 	/* stop txing train pattern to end link training */
 	dp_ctrl_clear_training_pattern(ctrl);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

