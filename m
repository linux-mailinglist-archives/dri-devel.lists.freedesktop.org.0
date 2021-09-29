Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBD41C9F3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 18:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7434D6E1D7;
	Wed, 29 Sep 2021 16:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CB56E1D7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 16:17:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632932234; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NZF3/95G8ydfWP4E8Tlviqhl539BTdjyutBy9YAK7qA=;
 b=IxzJN2kFHxJdntTH2SdwMkGglDSoifNZnKqu1QaRRoC+X0LcMUvde04/Jv5Z09MnfYrzj/Uq
 G2PUEZkXIO87kmCkiXKWs1I56C5PrHohihrs+HdA/bLjrsvOgufvh7JgGvnkOIuJunXPeqkG
 M4wYYKtHwRf9ChJZT8c2t+kctHo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6154918963b1f18658d7f595 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Sep 2021 16:17:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 79309C4361C; Wed, 29 Sep 2021 16:17:12 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 98D13C4338F;
 Wed, 29 Sep 2021 16:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 98D13C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, khsieh@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: only signal audio when disconnected detected
 at dp_pm_resume
Date: Wed, 29 Sep 2021 09:17:04 -0700
Message-Id: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently there is audio not working problem after system resume from suspend
if hdmi monitor stay plugged in at DUT. However this problem does not happen
at normal operation but at a particular test case. The root cause is DP driver
signal audio with connected state at resume which trigger audio trying to setup
audio data path through DP main link but failed due to display port is not setup
and enabled by upper layer framework yet. This patch only have DP driver signal
audio only when DP is in disconnected state so that audio option shows correct
state after system resume. DP driver will not signal audio with connected state
until display enabled executed by upper layer framework where display port is
setup completed and main link is running.

Changes in V2:
-- add details commit text

Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_resume")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e543a03..6f13008 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1356,14 +1356,14 @@ static int dp_pm_resume(struct device *dev)
 	 * can not declared display is connected unless
 	 * HDMI cable is plugged in and sink_count of
 	 * dongle become 1
+	 * also only signal audio when disconnected
 	 */
-	if (dp->link->sink_count)
+	if (dp->link->sink_count) {
 		dp->dp_display.is_connected = true;
-	else
+	} else {
 		dp->dp_display.is_connected = false;
-
-	dp_display_handle_plugged_change(g_dp_display,
-				dp->dp_display.is_connected);
+		dp_display_handle_plugged_change(g_dp_display, false);
+	}
 
 	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d power_on=%d\n",
 			dp->link->sink_count, dp->dp_display.is_connected,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

