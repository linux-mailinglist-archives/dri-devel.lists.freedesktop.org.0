Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A889D41F423
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095C46EEB1;
	Fri,  1 Oct 2021 17:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2B56EEA9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:13 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id e24so12387272oig.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbrY9L8oGXBnlpXMCaFxKXALnanmzcN5gb67Scae2JI=;
 b=tG4AUnHhWbICDpcgAPy8kXFPyz3XtOwtAKO93KC4cz47LVczDoFExu8GRqd1uOiOfh
 vshJs5v8PZNWlzHzglV0ZvKO9wvgsOtcn7G4AtTzrYFqN+yoaRlAuwc383Q4+FAPDd20
 rp2n0m3x29PYVV25cfHjKAAslz8ZNe84PhttDZFfsU8TN7NUjlqYBXCx2tafsbwOtLZa
 cqVHgYN+Ym4Vmk5Kyy3mnXsSnbO9X27axECY65kKb4NsYzEjdMXHROGl864m/Lj87uYp
 xGAhtiTgLLp+Vwee/Rzi3heWwCNS9uVwLlqsnuY9qmPxIAB9eYtXkN3IzZ3V3HmSqU8q
 Qw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbrY9L8oGXBnlpXMCaFxKXALnanmzcN5gb67Scae2JI=;
 b=LwlGVnijXgo58e2guwBzykHuyr0Y7uSPu08aAOEsGReh5e56eVB01QHR/r50unOAKB
 eGCw9SxQ1ro3YEshq170BTD9OOzHFDzJwTnTXWJPkCiXQFgc+u4/0ltwIyKBcVfEBB6c
 82DGqf5kjUXHUoXfrqLW/dUuC/TOr2iuCX2SqAZnuS9JyC1hh9MvrfxVFyIfn+jh9S7I
 8aGmfV86fy9AfeNJG6L9Xwachn9sI9ctgqNApmnzLnYQLapgkUWM5jMbc1HeutpX6+0m
 v4o+wQ5VilLhcCD1r2HA8qvOlrKXXEiObU5598kFqKkYBaMjneUvjPUsRutjlhIpKStA
 7Mcw==
X-Gm-Message-State: AOAM531nuXh8SNGTdQf/dD2fLadlDbrGJDDNf3r8Y01bMqsmoLlnhYQw
 2/efuqK5ApgeTYEwbB5nsLMsfg==
X-Google-Smtp-Source: ABdhPJzgbSGNChzRvIqayzzVfIG1MKWAqPwZzD0B0kpO9/AdakxNePUpiBZLLbDm+grKWIJoQaqVwA==
X-Received: by 2002:a54:408f:: with SMTP id i15mr4781658oii.17.1633111152717; 
 Fri, 01 Oct 2021 10:59:12 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:12 -0700 (PDT)
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
Subject: [PATCH v3 1/5] drm/msm/dp: Remove global g_dp_display variable
Date: Fri,  1 Oct 2021 11:00:54 -0700
Message-Id: <20211001180058.1021913-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_display.c | 80 ++++++++---------------------
 1 file changed, 21 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbe4c2cd52a3..5d3ee5ef07c2 100644
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
 			dp->link->sink_count, dp->dp_display.is_connected,
-- 
2.29.2

