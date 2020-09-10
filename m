Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B0264EBE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 21:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435806E986;
	Thu, 10 Sep 2020 19:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1023 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 19:24:41 UTC
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314F86E986
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 19:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764858;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=RkoZ/oXuRtlmzNNOC8LEKn94zfPSofAXL0dmWY+VaUE=;
 b=V0uXuzloDcL1Dkl+WBRff2L4uGT17YnSi3tydmpovRmhvkR6VouJvEsIjOZXa0QX
 Mln/trPa8O2ha2ObMOcLWjBIP8TVSj7L7a7Z8z1rkr1O1jfEAm4n8QQsMyQ/Ak0yBCj
 JkegtSdKaDMYMN2VmfwGLzHV5CdO9JLrlrumFDk0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764858;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=RkoZ/oXuRtlmzNNOC8LEKn94zfPSofAXL0dmWY+VaUE=;
 b=mXsQb5fPQY+Bdzo857nzr8Hy/FsXysiOsS4pAGLqX0V8IDZ+wxSbsOg7FjPRlENp
 vB1ufKKPI/nbPj7B/cdjSVX1C1tERROr1pd2mDoK4NQfLq+V/uwqonc7kspgT/Qspc0
 jAoQQAcp/mOSGEUbjbpd7dnroHgPP+W1vNvbwudU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1F53C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/5] drm/msm/dp: signal the hotplug disconnect in the event
 handler
Date: Thu, 10 Sep 2020 19:07:38 +0000
Message-ID: <01010174796a853d-c8749e3c-2fca-434a-884c-f1f821e9649a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200910190718.13929-1-abhinavk@codeaurora.org>
References: <20200910190718.13929-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.10-54.240.27.186
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

Signal the hotplug disconnect event to the audio side in the
event handler so that they are notified earlier and have more
time to process the disconnect event.

Changes in v2: none
Changes in v3: none
Changes in v4: rebase on top of latest patchset of dependency
Changes in v5: rebase on top of latest patchset of dependency

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 43e5240a87ad..59ffdb8a1636 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -541,6 +541,13 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
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
@@ -586,6 +593,9 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sanity checking */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
+	/* signal the disconnect event early to ensure proper teardown */
+	dp_display_handle_plugged_change(g_dp_display, false);
+
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
 
@@ -776,13 +786,6 @@ static int dp_display_prepare(struct msm_dp *dp)
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
@@ -1344,8 +1347,6 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	dp_ctrl_push_idle(dp_display->ctrl);
 
-	dp_display_handle_plugged_change(dp, false);
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
