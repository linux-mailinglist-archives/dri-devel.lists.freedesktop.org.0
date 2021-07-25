Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDA3D4BB1
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB96737FE;
	Sun, 25 Jul 2021 04:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C626F97B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:25 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q6so6872021oiw.7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mzd8UHtqK6B4nMMOJ0K4TjMQTf4XfrHnm9DLV7Ce3NQ=;
 b=pXmTqUzRebdCDYGNG6+TYM2T+HxPVGKaSR5yWGfEdomAVgqzmDFkhEp/tUextNIZNd
 riHfDapWf2PtZcGsJ2rRHIfW2tGT5ljh0WgIXen2dJyimdCh1djcRxQqhzXFJh2tu2X/
 HteEGoX9vEHUR7H2mSA/DEj/nHJucUX97BfiC1KQ3W4aRHfgh+wB/H65UuMwshBNa03s
 2S61Rbw5ZS/+ZmllLlP7OAogGSFzjlmQuTj+LKwJcbtN0U5ssdXmQoHwzxKuaegZWJm3
 bocJAn0BHbHbdiajDtjB8IVb+D+zJfC2PAgW45IllNcusyrwpcPy2zP7+nspcc2SPQYc
 sEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mzd8UHtqK6B4nMMOJ0K4TjMQTf4XfrHnm9DLV7Ce3NQ=;
 b=NyU9YbawhJBpXAlkgp3n4bO/9NeZ9UpayBtGbf5Mx/TvB9UsYdPz8A3ArxpP4J0Vml
 SOQO2vYzqKnHkx4nPky9MJ35bPEzNxSiwfpd+eu6mPXdVhZSw4Mu0vC+UoS/mUdQ0HNN
 4UNBaM8PYmz6OAeV4eoS3ifzSyuXGvEFD12hnkb5RXsxciwcFhf8f0SAwExAgprGoSJB
 q8Qt0cgKhymkpD4/cmbA5eJkAEYacXxTPVFjAb5O/Cg5F5kjI7siDCwwRbA3pfqeoVda
 qQelXoLDUE1UZmGxh29CWmBOghqLN9ODGCQ1Y834W8IVXPYJLnpzitR7tExG6H3gLkDs
 njwA==
X-Gm-Message-State: AOAM531cshDUwi/W2UFuVxG76E9nmmV+lk8E4JC0lGryZQYs8zkL/Euc
 opRJvN0kAE/m1SHwvzyUVHKGNQ==
X-Google-Smtp-Source: ABdhPJy93izcnoxPFj7mvfrdQmnNoSrum/ZrxLplGOJ6FXW99s7JGlwvwa4d8QlMs3lpc5uI7vPLPg==
X-Received: by 2002:aca:3194:: with SMTP id x142mr7095396oix.93.1627187184676; 
 Sat, 24 Jul 2021 21:26:24 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:24 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH 1/5] drm/msm/dp: Remove global g_dp_display variable
Date: Sat, 24 Jul 2021 21:24:31 -0700
Message-Id: <20210725042436.3967173-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the Qualcomm DisplayPort driver only supports a single instance of
the driver the commonly used struct dp_display is kept in a global
variable. As we introduce additional instances this obviously doesn't
work.

Replace this with a combination of existing references to adjacent
objects and drvdata.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 78 ++++++++++++++---------------
 1 file changed, 37 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 70b319a8fe83..8696b36d30e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -27,7 +27,6 @@
 #include "dp_audio.h"
 #include "dp_debug.h"
 
-static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
 
 enum {
@@ -122,6 +121,13 @@ static const struct of_device_id dp_dt_match[] = {
 	{}
 };
 
+static struct dp_display_private *dev_to_dp_display_private(struct device *dev)
+{
+	struct msm_dp *dp = dev_get_drvdata(dev);
+
+	return container_of(dp, struct dp_display_private, dp_display);
+}
+
 static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
 						u32 data, u32 delay)
 {
@@ -198,14 +204,16 @@ static int dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
+	struct dp_display_private *dp = dev_to_dp_display_private(dev);
 	struct drm_device *drm;
 	struct msm_drm_private *priv;
 
 	drm = dev_get_drvdata(master);
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	if (!dp) {
+		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
+		return -EINVAL;
+	}
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
@@ -240,12 +248,14 @@ static int dp_display_bind(struct device *dev, struct device *master,
 static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
-	struct dp_display_private *dp;
+	struct dp_display_private *dp = dev_to_dp_display_private(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	if (!dp) {
+		DRM_ERROR("Invalid DP driver data\n");
+		return;
+	}
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
@@ -376,17 +386,14 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 static int dp_display_usbpd_configure_cb(struct device *dev)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
+	struct dp_display_private *dp = dev_to_dp_display_private(dev);
 
-	if (!dev) {
-		DRM_ERROR("invalid dev\n");
-		rc = -EINVAL;
+	if (!dp) {
+		DRM_ERROR("no driver data found\n");
+		rc = -ENODEV;
 		goto end;
 	}
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
-
 	dp_display_host_init(dp, false);
 
 	rc = dp_display_process_hpd_high(dp);
@@ -397,17 +404,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
+	struct dp_display_private *dp = dev_to_dp_display_private(dev);
 
-	if (!dev) {
-		DRM_ERROR("invalid dev\n");
-		rc = -EINVAL;
+	if (!dp) {
+		DRM_ERROR("no driver data found\n");
+		rc = -ENODEV;
 		return rc;
 	}
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
-
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
 	return rc;
@@ -466,15 +470,15 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 {
 	int rc = 0;
 	u32 sink_request;
-	struct dp_display_private *dp;
+	struct dp_display_private *dp = dev_to_dp_display_private(dev);
+	struct dp_usbpd *hpd;
 
-	if (!dev) {
-		DRM_ERROR("invalid dev\n");
-		return -EINVAL;
+	if (!dp) {
+		DRM_ERROR("no driver data found\n");
+		return -ENODEV;
 	}
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	hpd = dp->usbpd;
 
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
@@ -638,7 +642,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
-	dp_display_handle_plugged_change(g_dp_display, false);
+	dp_display_handle_plugged_change(&dp->dp_display, false);
 
 	/* enable HDP plug interrupt to prepare for next plugin */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
@@ -832,9 +836,7 @@ static int dp_display_prepare(struct msm_dp *dp)
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
-	struct msm_dp *dp_display;
-
-	dp_display = g_dp_display;
+	struct msm_dp *dp_display = &dp->dp_display;
 
 	if (dp_display->power_on) {
 		DRM_DEBUG_DP("Link already setup, return\n");
@@ -869,9 +871,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 
 static int dp_display_disable(struct dp_display_private *dp, u32 data)
 {
-	struct msm_dp *dp_display;
-
-	dp_display = g_dp_display;
+	struct msm_dp *dp_display = &dp->dp_display;
 
 	if (!dp_display->power_on)
 		return 0;
@@ -1229,14 +1229,13 @@ static int dp_display_probe(struct platform_device *pdev)
 	}
 
 	mutex_init(&dp->event_mutex);
-	g_dp_display = &dp->dp_display;
 
 	/* Store DP audio handle inside DP display */
-	g_dp_display->dp_audio = dp->audio;
+	dp->dp_display.dp_audio = dp->audio;
 
 	init_completion(&dp->audio_comp);
 
-	platform_set_drvdata(pdev, g_dp_display);
+	platform_set_drvdata(pdev, &dp->dp_display);
 
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
@@ -1249,10 +1248,7 @@ static int dp_display_probe(struct platform_device *pdev)
 
 static int dp_display_remove(struct platform_device *pdev)
 {
-	struct dp_display_private *dp;
-
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	struct dp_display_private *dp = platform_get_drvdata(pdev);
 
 	dp_display_deinit_sub_modules(dp);
 
-- 
2.29.2

