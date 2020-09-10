Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E2264E94
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 21:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C446E196;
	Thu, 10 Sep 2020 19:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 746 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 19:20:08 UTC
Received: from a27-18.smtp-out.us-west-2.amazonses.com
 (a27-18.smtp-out.us-west-2.amazonses.com [54.240.27.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69D06E196
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764861;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=Kl0MyMuaBn8Zn3M6+9JvouSYL3DlAU/dUBvxQFf7xBY=;
 b=guvWw0MER0otHVxTdqpDjdH8/ob0cfVg6ndFyi9eR6qVXGIORs+CLI1c+fjNtUzv
 e05YC2TMWmCpCzN0Fp5mLRIABMJnoAr3+MVs67NeT0nfaFegSLj+Fr871XLosfwMg9+
 7OoXS6G5RIfn8lcFMFP0KECgTKoUrkG7/rQfjYg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764861;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=Kl0MyMuaBn8Zn3M6+9JvouSYL3DlAU/dUBvxQFf7xBY=;
 b=BT+44cLwetOoQnasiZouaTjzNmdN7e8l8KtJoAAW6qXRkHBp0oUWbccPPtcDwo2H
 ZUS1wwL5PhYR5w/bhFE7nxMx+aAU8ZOIBESP84TEysXEWnFmhHDNR2hpiiqhIGuN0ZT
 ntetWgI90HS8odbw1RTBGcd1qnBXUQ8e8wWjszGo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4822C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/5] drm/msm/dp: wait for audio notification before
 disabling clocks
Date: Thu, 10 Sep 2020 19:07:41 +0000
Message-ID: <01010174796a92a7-5cf20d31-9b75-47dd-8663-83eff873aac0-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200910190718.13929-1-abhinavk@codeaurora.org>
References: <20200910190718.13929-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.10-54.240.27.18
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

In the current implementation, there is a very small window for
the audio side to safely signal the hdmi_code_shutdown() before
the clocks are disabled.

Add some synchronization between the DP display and DP audio module
to safely disable the clocks to avoid unclocked access from audio
side.

In addition, audio side can open the sound card even if DP monitor
is not connected. Avoid programming hardware registers in this case
and bail out early.

Changes in v4:
- removed some leftover prints

Changes in v5:
- fix crash when user tries to play audio in suspended
  state

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 32 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h |  3 +++
 3 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 11fa5ad7a801..82a8673ab8da 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -497,8 +497,23 @@ int dp_audio_hw_params(struct device *dev,
 	int rc = 0;
 	struct dp_audio_private *audio;
 	struct platform_device *pdev;
+	struct msm_dp *dp_display;
 
 	pdev = to_platform_device(dev);
+	dp_display = platform_get_drvdata(pdev);
+
+	/*
+	 * there could be cases where sound card can be opened even
+	 * before OR even when DP is not connected . This can cause
+	 * unclocked access as the audio subsystem relies on the DP
+	 * driver to maintain the correct state of clocks. To protect
+	 * such cases check for connection status and bail out if not
+	 * connected.
+	 */
+	if (!dp_display->power_on) {
+		rc = -EINVAL;
+		goto end;
+	}
 
 	audio = dp_audio_get_data(pdev);
 	if (IS_ERR(audio)) {
@@ -512,6 +527,8 @@ int dp_audio_hw_params(struct device *dev,
 	dp_audio_setup_acr(audio);
 	dp_audio_safe_to_exit_level(audio);
 	dp_audio_enable(audio, true);
+	dp_display->audio_enabled = true;
+
 end:
 	return rc;
 }
@@ -520,15 +537,30 @@ static void dp_audio_shutdown(struct device *dev, void *data)
 {
 	struct dp_audio_private *audio;
 	struct platform_device *pdev;
+	struct msm_dp *dp_display;
 
 	pdev = to_platform_device(dev);
+	dp_display = platform_get_drvdata(pdev);
 	audio = dp_audio_get_data(pdev);
 	if (IS_ERR(audio)) {
 		DRM_ERROR("failed to get audio data\n");
 		return;
 	}
 
+	/*
+	 * if audio was not enabled there is no need
+	 * to execute the shutdown and we can bail out early.
+	 * This also makes sure that we dont cause an unclocked
+	 * access when audio subsystem calls this without DP being
+	 * connected. is_connected cannot be used here as its set
+	 * to false earlier than this call
+	 */
+	if (!dp_display->audio_enabled)
+		return;
+
 	dp_audio_enable(audio, false);
+	/* signal the dp display to safely shutdown clocks */
+	dp_display_signal_audio_complete(dp_display);
 }
 
 static const struct hdmi_codec_ops dp_audio_codec_ops = {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 59ffdb8a1636..22578ad4b9e2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -80,7 +80,6 @@ struct dp_display_private {
 
 	/* state variables */
 	bool core_initialized;
-	bool power_on;
 	bool hpd_irq_on;
 	bool audio_supported;
 
@@ -102,6 +101,9 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
+	/* wait for audio signaling */
+	struct completion audio_comp;
+
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
@@ -173,6 +175,15 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
 	return 0;
 }
 
+void dp_display_signal_audio_complete(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	complete_all(&dp->audio_comp);
+}
+
 static int dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -595,6 +606,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(g_dp_display, false);
+	reinit_completion(&dp->audio_comp);
 
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
@@ -789,15 +801,18 @@ static int dp_display_prepare(struct msm_dp *dp)
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
+	struct msm_dp *dp_display;
 
-	if (dp->power_on) {
+	dp_display = g_dp_display;
+
+	if (dp_display->power_on) {
 		DRM_DEBUG_DP("Link already setup, return\n");
 		return 0;
 	}
 
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
-		dp->power_on = true;
+		dp_display->power_on = true;
 
 	return rc;
 }
@@ -823,14 +838,27 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 
 static int dp_display_disable(struct dp_display_private *dp, u32 data)
 {
-	if (!dp->power_on)
+	struct msm_dp *dp_display;
+
+	dp_display = g_dp_display;
+
+	if (!dp_display->power_on)
 		return -EINVAL;
 
+	/* wait only if audio was enabled */
+	if (dp_display->audio_enabled) {
+		if (!wait_for_completion_timeout(&dp->audio_comp,
+				HZ * 5))
+			DRM_ERROR("audio comp timeout\n");
+	}
+
+	dp_display->audio_enabled = false;
+
 	dp_ctrl_off(dp->ctrl);
 
 	dp->core_initialized = false;
 
-	dp->power_on = false;
+	dp_display->power_on = false;
 
 	return 0;
 }
@@ -1144,6 +1172,8 @@ static int dp_display_probe(struct platform_device *pdev)
 	/* Store DP audio handle inside DP display */
 	g_dp_display->dp_audio = dp->audio;
 
+	init_completion(&dp->audio_comp);
+
 	platform_set_drvdata(pdev, g_dp_display);
 
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5020faf360db..8b78b40bbd6c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -15,6 +15,8 @@ struct msm_dp {
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	bool is_connected;
+	bool audio_enabled;
+	bool power_on;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
@@ -32,6 +34,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
+void dp_display_signal_audio_complete(struct msm_dp *dp_display);
 
 void __init msm_dp_pll_driver_register(void);
 void __exit msm_dp_pll_driver_unregister(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
