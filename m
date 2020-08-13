Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6364243247
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 03:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E626E969;
	Thu, 13 Aug 2020 01:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625116E969
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 01:55:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597283711; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Rhkk8eunrihHd8pV4roEkHcXijF9QoLlK6Dbc6fdia8=;
 b=rJA2Frd9q/xmanKdr/ff1RblxyiUHThbwKbVnYCBID0Zuf81l+19AmLPv/3WpBv7vz0XNK8s
 0gmLTzSpn7x2bbs6FDz+qkxP+NwVQeQ7HuyErVVIlEQgCuxspM0g0vUTQvuqBWtla7dVut0m
 ovDIO+jJPhPahdp2hbpNcTgDZqU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f349d792f4952907d6ba68b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 01:55:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2B66C433A0; Thu, 13 Aug 2020 01:55:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D79DC433CA;
 Thu, 13 Aug 2020 01:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8D79DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/dp: signal the hotplug disconnect in the event
 handler
Date: Wed, 12 Aug 2020 18:54:39 -0700
Message-Id: <20200813015439.4174-5-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813015439.4174-1-abhinavk@codeaurora.org>
References: <20200813015439.4174-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
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
Cc: vsujithk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 rohitkr@codeaurora.org, aravindh@codeaurora.org, cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signal the hotplug disconnect event to the audio side in the
event handler so that they are notified earlier and have more
time to process the disconnect event.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 302cf7ea65d7..11960be33fdb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -504,6 +504,13 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
+static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
+		bool plugged)
+{
+	if (dp_display->plugged_cb && dp_display->codec_dev)
+		dp_display->plugged_cb(dp_display->codec_dev, plugged);
+}
+
 static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 {
 	struct dp_usbpd *hpd = dp->usbpd;
@@ -544,6 +551,9 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 */
 	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
 
+	/* signal the disconnect event early to ensure proper teardown */
+	dp_display_handle_plugged_change(g_dp_display, false);
+
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
 
@@ -711,13 +721,6 @@ static int dp_display_prepare(struct msm_dp *dp)
 	return 0;
 }
 
-static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
-		bool plugged)
-{
-	if (dp_display->plugged_cb && dp_display->codec_dev)
-		dp_display->plugged_cb(dp_display->codec_dev, plugged);
-}
-
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -759,9 +762,6 @@ static int dp_display_pre_disable(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	/* signal the disconnect event early to ensure proper teardown */
-	dp_display_handle_plugged_change(dp_display, false);
-
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
