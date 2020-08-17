Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C0247A32
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 00:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9156E0E7;
	Mon, 17 Aug 2020 22:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8A16E145
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 22:11:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597702312; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o/HHFS5XPwIG2gb01giRjmjXFIvadYyI79nCBj4+LA0=;
 b=riRCLMFwwTanTYwvUajQcqMXisqZL1Ctw/QPMkryPIGcoLXQZknQyKeWyZwbBT76Gv5ptl3E
 vtRRIuw0ILyenkISvlPi7KVcvp/sh3K1L5/ZilZZp9l5h7bPcKusKUrE3Cu75m8elfxjvyz3
 SJIfv5XYwPNJkRAk93IxNODxMLY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f3b00a8d48d4625ca538143 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 22:11:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 67E58C433B6; Mon, 17 Aug 2020 22:11:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63283C433C6;
 Mon, 17 Aug 2020 22:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63283C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/msm/dp: wait for audio notification before
 disabling clocks
Date: Mon, 17 Aug 2020 15:11:31 -0700
Message-Id: <20200817221131.16162-6-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200817221131.16162-1-abhinavk@codeaurora.org>
References: <20200817221131.16162-1-abhinavk@codeaurora.org>
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

In the current implementation, there is a very small window for
the audio side to safely signal the hdmi_code_shutdown() before
the clocks are disabled.

Add some synchronization between the DP display and DP audio module
to safely disable the clocks to avoid unclocked access from audio
side.

In addition, audio side can open the sound card even if DP monitor
is not connected. Avoid programming hardware registers in this case
and bail out early.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 32 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 3 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 11fa5ad7a801..a51659be8f82 100644
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
+	 * There could be cases where sound card can be opened even
+	 * before OR even when DP is not connected . This can cause
+	 * unclocked access as the audio subsystem relies on the DP
+	 * driver to maintain the correct state of clocks. To protect
+	 * such cases check for connection status and bail out if not
+	 * connected.
+	 */
+	if (!dp_display->is_connected) {
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
index fcf30d8cc040..1d6210dc62fc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -95,6 +95,9 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
+	/* wait for audio signaling */
+	struct completion audio_comp;
+
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
@@ -166,6 +169,15 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
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
@@ -553,6 +565,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(g_dp_display, false);
+	reinit_completion(&dp->audio_comp);
 
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
@@ -765,9 +778,22 @@ static int dp_display_pre_disable(struct msm_dp *dp_display)
 
 static int dp_display_disable(struct dp_display_private *dp, u32 data)
 {
+	struct msm_dp *dp_display;
+
 	if (!dp->power_on)
 		return -EINVAL;
 
+	dp_display = g_dp_display;
+
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
@@ -1075,6 +1101,8 @@ static int dp_display_probe(struct platform_device *pdev)
 	/* Store DP audio handle inside DP display */
 	g_dp_display->dp_audio = dp->audio;
 
+	init_completion(&dp->audio_comp);
+
 	platform_set_drvdata(pdev, g_dp_display);
 
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5020faf360db..18897a84cbd9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -15,6 +15,7 @@ struct msm_dp {
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	bool is_connected;
+	bool audio_enabled;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
@@ -32,6 +33,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
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
