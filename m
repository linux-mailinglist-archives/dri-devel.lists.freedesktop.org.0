Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E393E04DE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 17:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA489229;
	Wed,  4 Aug 2021 15:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974C56EAC4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 15:51:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628092308; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rA+vddmtsJ7Rtq3lbQ5qIf/Jl6SUyZWzSinop5veS4Y=;
 b=Sed56dBskagt2G4ZQYza8UecH7QvmBBBrNNAq8LZ7eyGr2ugfEAZTt7SxLJaxZLdU4OHhERd
 VM6YIoS5et454uX8ldAi8A8CPERBgKZc4SCV+hSP4gQpFaUvyF8IPuW2tCjb8rEd9zJz2RsR
 O9anTp17+AifgWiO3QL5mn5zBYI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 610ab7773341038a23828301 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 15:51:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4EA16C433F1; Wed,  4 Aug 2021 15:51:18 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C1C61C433F1;
 Wed,  4 Aug 2021 15:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C1C61C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, khsieh@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/msm/dp: update is_connected status base on sink count
 at dp_pm_resume()
Date: Wed,  4 Aug 2021 08:51:01 -0700
Message-Id: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
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

Currently at dp_pm_resume() is_connected state is decided base on hpd connection
status only. This will put is_connected in wrongly "true" state at the scenario
that dongle attached to DUT but without hmdi cable connecting to it. Fix this
problem by adding read sink count from dongle and decided is_connected state base
on both sink count and hpd connection status.

Changes in v2:
-- remove dp_get_sink_count() cand call drm_dp_read_sink_count()

Changes in v3:
-- delete status local variable from dp_pm_resume()

Changes in v4:
-- delete un necessary comment at dp_pm_resume()

Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 78c5301..25fb4f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1313,7 +1313,7 @@ static int dp_pm_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_dp *dp_display = platform_get_drvdata(pdev);
 	struct dp_display_private *dp;
-	u32 status;
+	int sink_count = 0;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
@@ -1327,14 +1327,25 @@ static int dp_pm_resume(struct device *dev)
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-	status = dp_catalog_link_is_connected(dp->catalog);
+	/*
+	 * set sink to normal operation mode -- D0
+	 * before dpcd read
+	 */
+	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+
+	if (dp_catalog_link_is_connected(dp->catalog)) {
+		sink_count = drm_dp_read_sink_count(dp->aux);
+		if (sink_count < 0)
+			sink_count = 0;
+	}
 
+	dp->link->sink_count = sink_count;
 	/*
 	 * can not declared display is connected unless
 	 * HDMI cable is plugged in and sink_count of
 	 * dongle become 1
 	 */
-	if (status && dp->link->sink_count)
+	if (dp->link->sink_count)
 		dp->dp_display.is_connected = true;
 	else
 		dp->dp_display.is_connected = false;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

