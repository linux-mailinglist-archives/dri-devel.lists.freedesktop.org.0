Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209B264E71
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 21:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C3A6E175;
	Thu, 10 Sep 2020 19:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 19:14:23 UTC
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5387A6E175
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 19:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764850;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=UWgIUcq3pr5g6nnpM0Ln5Llv+UUTx/Cg3C3luapMnL8=;
 b=Qn0qkWNzw9iYfrtXFMUWlPwKSnD6pnKr+wP7Xe4KxPBqUjB91ey7Of8TvGEE0vNe
 WsWzbtRYNaWVDj9Fh7+kckTa1PUsyCtp7fJKmfdwmEHd+/LHGx6axxROMl4hEBYcRTY
 V/InQ3Sf8+PVyHD2zUDswY6oN6nfPphfH2WDVVQs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764850;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=UWgIUcq3pr5g6nnpM0Ln5Llv+UUTx/Cg3C3luapMnL8=;
 b=MxMxubRrNFumB0YMvoy1xYAM0WHnrljHLbVf59IKW+r9/j82vXs0rN9NocZt2VtO
 velWwIMebQOkWvtPsgwbkXAGmWE9aYgJlarUQHqwewtTHKZFFY0/VOLhhUpTTxyDDL2
 V5sHE3U48ak+VGCsVYpvzvk+AXhvjBPoAjw8H5GU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 772D5C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/5] drm/msm/dp: store dp_display in the driver data
Date: Thu, 10 Sep 2020 19:07:30 +0000
Message-ID: <01010174796a67e8-0f2901a4-fd94-4003-a868-fa7765b0f8a9-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200910190718.13929-1-abhinavk@codeaurora.org>
References: <20200910190718.13929-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.10-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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

Store the dp_display in the platform driver data instead of the
dp_display_private.

This is required to allow other sub-modules to reuse the platform
driver data.

Changes in v3: none
Changes in v4: none
Changes in v5: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f7e28dd8c39b..b1bfe2b55921 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -177,11 +177,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	struct dp_display_private *dp;
 	struct drm_device *drm;
 	struct msm_drm_private *priv;
-	struct platform_device *pdev = to_platform_device(dev);
 
 	drm = dev_get_drvdata(master);
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
 		return -EINVAL;
@@ -216,11 +216,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
 	struct dp_display_private *dp;
-	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("Invalid DP driver data\n");
 		return;
@@ -355,7 +355,8 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 		goto end;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		rc = -ENODEV;
@@ -379,7 +380,8 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 	int rc = 0;
 	struct dp_display_private *dp;
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -431,7 +433,8 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -EINVAL;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		return -ENODEV;
@@ -1064,11 +1067,12 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	platform_set_drvdata(pdev, dp);
-
 	mutex_init(&dp->event_mutex);
+
 	g_dp_display = &dp->dp_display;
 
+	platform_set_drvdata(pdev, g_dp_display);
+
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
 		DRM_ERROR("component add failed, rc=%d\n", rc);
@@ -1082,7 +1086,8 @@ static int dp_display_remove(struct platform_device *pdev)
 {
 	struct dp_display_private *dp;
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_display_deinit_sub_modules(dp);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
