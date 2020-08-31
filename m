Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC022580FA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 20:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8616E3B0;
	Mon, 31 Aug 2020 18:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0416E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 18:23:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598898195; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9RQSd5qOkJjZXPOKBMP70JvGUqr9k759r7EqgVljKn8=;
 b=S+klPO9ubOYZO7V70J9kwrKHufIO/YxnsA7aomYy/euW3Y6l198QUjU65Iyjb+05mCUAIjg3
 KyJddPJ84lDCaRbKgzvnq/airrClTFB8osrfmXwC+ZUtmaiXBsNcxY7VBvs0jwRJwPpNz5yQ
 pSbCZzTXaclxchuqcTYjJu5+X5c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f4d400f9f3347551f7d8914 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Aug 2020 18:23:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4088EC4339C; Mon, 31 Aug 2020 18:23:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1971DC43391;
 Mon, 31 Aug 2020 18:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1971DC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/5] drm/msm/dp: store dp_display in the driver data
Date: Mon, 31 Aug 2020 11:22:54 -0700
Message-Id: <20200831182258.16632-2-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200831182258.16632-1-abhinavk@codeaurora.org>
References: <20200831182258.16632-1-abhinavk@codeaurora.org>
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

Store the dp_display in the platform driver data instead of the
dp_display_private.

This is required to allow other sub-modules to reuse the platform
driver data.

Changes in v3: none
Changes in v4: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d584d415ad6e..5e779e29c3da 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -173,11 +173,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
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
@@ -212,11 +212,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
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
@@ -351,7 +351,8 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 		goto end;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		rc = -ENODEV;
@@ -375,7 +376,8 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 	int rc = 0;
 	struct dp_display_private *dp;
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -427,7 +429,8 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -EINVAL;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		return -ENODEV;
@@ -1053,11 +1056,12 @@ static int dp_display_probe(struct platform_device *pdev)
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
@@ -1071,7 +1075,8 @@ static int dp_display_remove(struct platform_device *pdev)
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
