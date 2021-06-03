Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8C39AEE2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 01:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635B86F542;
	Thu,  3 Jun 2021 23:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D746F542
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:49:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622764185; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o1I/qHRsZyVY+hH5gJnA9ezwSvhf5J73xu0kbc1BX7o=;
 b=QSvjte6WbER3wVog117p8c0UUeORYfmgqOR7HWBM3zCc2tr0RwnTfzDnPdekY2tuLKM/hO22
 3UE7rTP0QQQ35rPL/ywlfZOxWUBR79RV+4wk+TKOXOU+ybkbWTLswpWhsY7OJ0n51yncLtWN
 cU88gcnEI5k4+M2A9bEue4NeVVE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b96a972eaeb98b5e7ff8a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 23:49:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6A353C433F1; Thu,  3 Jun 2021 23:49:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF34BC433D3;
 Thu,  3 Jun 2021 23:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF34BC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v5] drm/msm/dp: power off DP phy at suspend
Date: Thu,  3 Jun 2021 16:49:34 -0700
Message-Id: <1622764174-10309-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Normal DP suspend operation contains two steps, display off followed
by dp suspend, to complete system wide suspending cycle if display is
up at that time. In this case, DP phy will be powered off at display
off. However there is an exception case that depending on the timing
of dongle plug in during system wide suspending, sometimes display off
procedure may be skipped and dp suspend was called directly. In this
case, dp phy is stay at powered on (phy->power_count = 1) so that at
next resume dp driver crash at main link clock enable due to phy is
not physically powered on. This patch will call dp_ctrl_off_link_stream()
to tear down main link and power off phy at dp_pm_suspend() if main link
had been brought up.

Changes in V2:
-- stashed changes into dp_ctrl.c
-- add is_phy_on to monitor phy state

Changes in V3:
-- delete is_phy_on
-- call dp_ctrl_off_link_stream() from dp_pm_suspend()

Changes in V4:
-- delete changes made at dp_power.c
-- move main link status checking to dp_pm_suspend

Changes in V5:
-- correct commit id at Fixes tag

Fixes: 8dbde399044b ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++----
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dbd8943..caf71fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1827,10 +1827,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
-		return ret;
+	if (dp_power_clk_status(ctrl->power, DP_STREAM_PM)) {
+		ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+		if (ret) {
+			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cdec0a3..9c59def 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1327,8 +1327,13 @@ static int dp_pm_suspend(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
-	if (dp->core_initialized == true)
+	if (dp->core_initialized == true) {
+		/* mainlink enabled */
+		if (dp_power_clk_status(dp->power, DP_CTRL_PM))
+			dp_ctrl_off_link_stream(dp->ctrl);
+
 		dp_display_host_deinit(dp);
+	}
 
 	dp->hpd_state = ST_SUSPENDED;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

