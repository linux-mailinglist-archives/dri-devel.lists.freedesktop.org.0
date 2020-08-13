Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DA243E2F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 19:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42746EA79;
	Thu, 13 Aug 2020 17:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6F16EA79
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:22:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597339332; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5SbLp1E1pCjxWLDr+Vc3SO6LDj/0pKeMe/+UI/IoofU=;
 b=CJP+nK6ZMO5d/nfXzlLm7wHwNfq4FR/jl1RVO5n7+99XZHwHN5NBZzfIpqMZKG6/qvLsVWIv
 cdfpLL7au+4K1HoZyFsMOdGwDbpUTSikoJtWFZWg8tgyWO3tNPs5aIuXwljp+Dxw1xzq2SVk
 K38L1Ava7/0UIFC7I3usHvChG0c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f3576c1ba4c2cd367653207 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 17:22:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 81421C433A0; Thu, 13 Aug 2020 17:22:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 46F99C43395;
 Thu, 13 Aug 2020 17:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46F99C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM
 DP driver
Date: Thu, 13 Aug 2020 10:21:53 -0700
Message-Id: <20200813172154.24565-4-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813172154.24565-1-abhinavk@codeaurora.org>
References: <20200813172154.24565-1-abhinavk@codeaurora.org>
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

Add the hook_plugged_cb op for the MSM DP driver to signal connect
and disconnect events to the hdmi-codec driver which in-turn shall
notify the audio subsystem to start a new or teardown an existing
session.

Changes in v2: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 75556eea1059..11fa5ad7a801 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -10,7 +10,6 @@
 
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
-#include <sound/hdmi-codec.h>
 
 #include "dp_catalog.h"
 #include "dp_audio.h"
@@ -442,6 +441,29 @@ static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
 	return container_of(dp_audio, struct dp_audio_private, dp_audio);
 }
 
+static int dp_audio_hook_plugged_cb(struct device *dev, void *data,
+		hdmi_codec_plugged_cb fn,
+		struct device *codec_dev)
+{
+
+	struct platform_device *pdev;
+	struct msm_dp *dp_display;
+
+	pdev = to_platform_device(dev);
+	if (!pdev) {
+		pr_err("invalid input\n");
+		return -ENODEV;
+	}
+
+	dp_display = platform_get_drvdata(pdev);
+	if (!dp_display) {
+		pr_err("invalid input\n");
+		return -ENODEV;
+	}
+
+	return dp_display_set_plugged_cb(dp_display, fn, codec_dev);
+}
+
 static int dp_audio_get_eld(struct device *dev,
 	void *data, uint8_t *buf, size_t len)
 {
@@ -513,6 +535,7 @@ static const struct hdmi_codec_ops dp_audio_codec_ops = {
 	.hw_params = dp_audio_hw_params,
 	.audio_shutdown = dp_audio_shutdown,
 	.get_eld = dp_audio_get_eld,
+	.hook_plugged_cb = dp_audio_hook_plugged_cb,
 };
 
 static struct hdmi_codec_pdata codec_data = {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3120e172adc2..5b4dcd5621d8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -709,6 +709,13 @@ static int dp_display_prepare(struct msm_dp *dp)
 	return 0;
 }
 
+static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
+		bool plugged)
+{
+	if (dp_display->plugged_cb && dp_display->codec_dev)
+		dp_display->plugged_cb(dp_display->codec_dev, plugged);
+}
+
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -739,6 +746,8 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 		dp->audio->lane_count = dp->link->link_params.num_lanes;
 	}
 
+	/* signal the connect event late to synchronize video and display */
+	dp_display_handle_plugged_change(dp_display, true);
 	return 0;
 }
 
@@ -748,6 +757,9 @@ static int dp_display_pre_disable(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	/* signal the disconnect event early to ensure proper teardown */
+	dp_display_handle_plugged_change(dp_display, false);
+
 	return 0;
 }
 
@@ -770,6 +782,19 @@ static int dp_display_unprepare(struct msm_dp *dp)
 	return 0;
 }
 
+int dp_display_set_plugged_cb(struct msm_dp *dp_display,
+		hdmi_codec_plugged_cb fn, struct device *codec_dev)
+{
+	bool plugged;
+
+	dp_display->plugged_cb = fn;
+	dp_display->codec_dev = codec_dev;
+	plugged = dp_display->is_connected;
+	dp_display_handle_plugged_change(dp_display, plugged);
+
+	return 0;
+}
+
 int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
 {
 	const u32 num_components = 3, default_bpp = 24;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 1e0d2b9d9a2a..5020faf360db 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,18 +7,25 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
+#include <sound/hdmi-codec.h>
 
 struct msm_dp {
 	struct drm_device *drm_dev;
+	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	bool is_connected;
+
+	hdmi_codec_plugged_cb plugged_cb;
+
 	u32 max_pclk_khz;
 
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 };
 
+int dp_display_set_plugged_cb(struct msm_dp *dp_display,
+		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
 int dp_display_get_modes(struct msm_dp *dp_display,
 		struct dp_display_mode *dp_mode);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
