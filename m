Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527283F7F14
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 01:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F486E444;
	Wed, 25 Aug 2021 23:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D918882C2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 23:41:23 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id p2so2112140oif.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lZrU8U8P0CV677Vco2xQXxNWbS5uRSsKifcZEcankpE=;
 b=ao5ckATzqUpbA0sw5SPgi0ZBcaV8pPxbpc6QSyXBEiDJiT5S3xLybVTBnAHeLRW+ZO
 P8TtNkFJqIx88hybf+wqW0FVRAtUH7U+0Tn4+VtNOPRx788eRYnP8Zos4oQewzbFn3zG
 v9z5Q0gpdEATHb0n6rjboqgXfkIq3WjFkrv+35pSgKUBD8i6S0BVtRvdOwoGYNbknEIG
 Q+cyNnD1dPmuqnmQR1adXsou0o/ho93b2PEzgV+uZ/hIPdW4xxYxDegIRWLA5H/Ihw4x
 UM+UEUpaWYLNvigGLxY1whNbiie50MkIOtXnko+rrgFQQ/BIhM2o424BSPi9p47dL4rO
 /Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lZrU8U8P0CV677Vco2xQXxNWbS5uRSsKifcZEcankpE=;
 b=LhJmYmhaKxfk5j8lTZAWpBpDrihCjGe+fk2Qiv68reJaLXwPn1illjpEi+dbXhsU3B
 DCOW/BQUw6CyzK+LW4qD26odMNdFVgI+JER12O6NNb2KynkFZThJW2ute3EiuuZUldX3
 CbjlllOyrDLGhHh/ohBcm844Oszeh7B1iEYiY9k66fF7cVNo8GqyRHlsinMnp652BwVb
 C1/2GJGLjh4w0896RAPhP5tE9wvuQ3zfLzafIJ7lckdezMunac90lTe7nXvoMI8w3fDd
 q2oy9bBonD2YrCwIr0kjjv6k4VI+ritHne1dfoCib1tk4Be/iJjUKWpShf8d3AnN8mvC
 9PbA==
X-Gm-Message-State: AOAM532iVgGRHMWYJvw8nPGzxRcjMQ3v6rcUWH6Yc14ThCywEh975wjx
 sDSso0+L1UAA0wR9ntcdFzJpdeqSrHJNiw==
X-Google-Smtp-Source: ABdhPJyKdbbe7VaMBMdbJr7Yb/iWNXWqpQJtjZ5wb+TDUXD50agVECfj7gfpssB/KAxhxrhOoebcwQ==
X-Received: by 2002:aca:d06:: with SMTP id 6mr381891oin.105.1629934881947;
 Wed, 25 Aug 2021 16:41:21 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:41:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm/msm/dp: Remove global g_dp_display variable
Date: Wed, 25 Aug 2021 16:42:29 -0700
Message-Id: <20210825234233.1721068-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
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

Changes since v1:
- Renamed dev_get_dp_display_private()
- Drop incorrect checks for !container_of()
- Dropped the checks for !NULL checks of dev in the USB api
- Use right accessor in dp_display_remove()

 drivers/gpu/drm/msm/dp/dp_display.c | 80 ++++++++---------------------
 1 file changed, 21 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 13a3cf692562..2c7de43f655a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -27,7 +27,6 @@
 #include "dp_audio.h"
 #include "dp_debug.h"
 
-static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
 
 enum {
@@ -121,6 +120,13 @@ static const struct of_device_id dp_dt_match[] = {
 	{}
 };
 
+static struct dp_display_private *dev_get_dp_display_private(struct device *dev)
+{
+	struct msm_dp *dp = dev_get_drvdata(dev);
+
+	return container_of(dp, struct dp_display_private, dp_display);
+}
+
 static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
 						u32 data, u32 delay)
 {
@@ -197,15 +203,12 @@ static int dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
-	struct drm_device *drm;
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct msm_drm_private *priv;
+	struct drm_device *drm;
 
 	drm = dev_get_drvdata(master);
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
-
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
 	priv->dp = &(dp->dp_display);
@@ -240,13 +243,10 @@ static int dp_display_bind(struct device *dev, struct device *master,
 static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
-	struct dp_display_private *dp;
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
-
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
 	priv->dp = NULL;
@@ -379,38 +379,17 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 static int dp_display_usbpd_configure_cb(struct device *dev)
 {
-	int rc = 0;
-	struct dp_display_private *dp;
-
-	if (!dev) {
-		DRM_ERROR("invalid dev\n");
-		rc = -EINVAL;
-		goto end;
-	}
-
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	dp_display_host_init(dp, false);
 
-	rc = dp_display_process_hpd_high(dp);
-end:
-	return rc;
+	return dp_display_process_hpd_high(dp);
 }
 
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
-
-	if (!dev) {
-		DRM_ERROR("invalid dev\n");
-		rc = -EINVAL;
-		return rc;
-	}
-
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -472,15 +451,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 {
 	int rc = 0;
 	u32 sink_request;
-	struct dp_display_private *dp;
-
-	if (!dev) {
-		DRM_ERROR("invalid dev\n");
-		return -EINVAL;
-	}
-
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
@@ -647,7 +618,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	DRM_DEBUG_DP("hpd_state=%d\n", state);
 	/* signal the disconnect event early to ensure proper teardown */
-	dp_display_handle_plugged_change(g_dp_display, false);
+	dp_display_handle_plugged_change(&dp->dp_display, false);
 
 	/* enable HDP plug interrupt to prepare for next plugin */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
@@ -842,9 +813,7 @@ static int dp_display_prepare(struct msm_dp *dp)
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
-	struct msm_dp *dp_display;
-
-	dp_display = g_dp_display;
+	struct msm_dp *dp_display = &dp->dp_display;
 
 	DRM_DEBUG_DP("sink_count=%d\n", dp->link->sink_count);
 	if (dp_display->power_on) {
@@ -880,9 +849,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 
 static int dp_display_disable(struct dp_display_private *dp, u32 data)
 {
-	struct msm_dp *dp_display;
-
-	dp_display = g_dp_display;
+	struct msm_dp *dp_display = &dp->dp_display;
 
 	if (!dp_display->power_on)
 		return 0;
@@ -1237,14 +1204,13 @@ static int dp_display_probe(struct platform_device *pdev)
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
@@ -1257,10 +1223,7 @@ static int dp_display_probe(struct platform_device *pdev)
 
 static int dp_display_remove(struct platform_device *pdev)
 {
-	struct dp_display_private *dp;
-
-	dp = container_of(g_dp_display,
-			struct dp_display_private, dp_display);
+	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
 	dp_display_deinit_sub_modules(dp);
 
@@ -1315,8 +1278,7 @@ static int dp_pm_resume(struct device *dev)
 	else
 		dp->dp_display.is_connected = false;
 
-	dp_display_handle_plugged_change(g_dp_display,
-				dp->dp_display.is_connected);
+	dp_display_handle_plugged_change(dp_display, dp->dp_display.is_connected);
 
 
 	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d power_on=%d\n",
-- 
2.29.2

