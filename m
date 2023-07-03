Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02074534C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BF110E171;
	Mon,  3 Jul 2023 00:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12CB10E064
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:50 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b69f1570b2so63658911fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344669; x=1690936669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UrmNUNbSa3tDlWvkXNUA3OnvsgDhFRqEs/bq/9Jm/+4=;
 b=WBxS5eJ3ZvSEaauUqyNx8qp2HWjRTd3p8EVWjk47ieV9CwHpbes/akHX5/4Qr4Srpj
 8eoqwnduFEhfq/SgayMjuuoC/zJe69UZojA6z0IWpGZI5ZtZnKglOsn74tPUU/J1HjR0
 o9dTsPn8ckGNzXw8EE0Vxevc5y5o9EaLmgSb5qC8XhMWDesK1fiFA3RQakivQVvoD4Yy
 j4MMgHumhoKS8dHqNbKtMZYxgdmFcK541p9Qwu4mdUN+zIgihyITER61QrsKIv6w3jRm
 deXEydCzhc6kDyphzrVbmfxDKa6M8sC2zLnOSklbYrGRphShtrPyn/jpr9HY89ILyzQ3
 Gg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344669; x=1690936669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UrmNUNbSa3tDlWvkXNUA3OnvsgDhFRqEs/bq/9Jm/+4=;
 b=aW33k9reRjafzIgYhw9lo3BiZiSlW2VZtECH/xF57MYkF57IShyXA5RmrS2CnY6mB+
 24Y78nAmWjXn6EVlTZXkvQrfdTWmKIvZHzdwpSf9UiP+P/UOiSGbA9zqfzCE0dV4zHew
 Vud5INzr3DqZ6qOIFzL5eq+DMePyPweJcFu8lvTnLjJe/xkuG2Qt5ZS6s9ne7T/IqEg+
 XJKDwJLd069H/V3de2eQp9jOIBsT+/bpO5hR3fBlEtvAkpngpYPGh5Axu2A1jkpzVJyY
 i11ZFL4b2u0RN9slMmFPjfbPhSI8dM9C99qa2R3F9z4GuoLoXCKCypYJGCvyIF0rR8ig
 3BHA==
X-Gm-Message-State: ABy/qLZ0f8A4aAO/Ob/6hXm2qMeSngkZzRHAIDBdcpo0roCxbZhfwkF4
 PMLsGo9dDP5dZz6JKHIa9Hkvog==
X-Google-Smtp-Source: APBJJlFYrkYpqeVgh/Gk84cRXdVKifXhjx3onZhdOFDZwlYuOA7HKrtL4bBILqXT9595tHr9NvCBKQ==
X-Received: by 2002:a2e:91ce:0:b0:2ac:82c1:5a3d with SMTP id
 u14-20020a2e91ce000000b002ac82c15a3dmr6708918ljg.23.1688344669156; 
 Sun, 02 Jul 2023 17:37:49 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 03/13] drm/msm/dp: move pdev from struct dp_display_private to
 struct msm_dp
Date: Mon,  3 Jul 2023 03:37:35 +0300
Message-Id: <20230703003745.34239-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dp_drm needs accessing the DP's platform device. Move pdev to the
public structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 76f13954015b..1267e3dbcb1a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -88,7 +88,6 @@ struct dp_display_private {
 	bool audio_supported;
 
 	struct drm_device *drm_dev;
-	struct platform_device *pdev;
 	struct dentry *root;
 
 	struct dp_parser  *parser;
@@ -603,7 +602,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_configure_cb(&dp->dp_display.pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
@@ -651,7 +650,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		if (dp->link->sink_count == 0) {
 			dp_display_host_phy_exit(dp);
 		}
-		dp_display_notify_disconnect(&dp->pdev->dev);
+		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_DISCONNECT_PENDING) {
@@ -661,7 +660,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		dp_ctrl_off_link(dp->ctrl);
 		dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
-		dp_display_notify_disconnect(&dp->pdev->dev);
+		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -670,7 +669,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	dp_display_notify_disconnect(&dp->pdev->dev);
+	dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 
 	if (state == ST_DISPLAY_OFF) {
 		dp->hpd_state = ST_DISCONNECTED;
@@ -712,7 +711,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	dp_display_usbpd_attention_cb(&dp->dp_display.pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -733,12 +732,12 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 static int dp_init_sub_modules(struct dp_display_private *dp)
 {
 	int rc = 0;
-	struct device *dev = &dp->pdev->dev;
+	struct device *dev = &dp->dp_display.pdev->dev;
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
 
-	dp->parser = dp_parser_get(dp->pdev);
+	dp->parser = dp_parser_get(dp->dp_display.pdev);
 	if (IS_ERR(dp->parser)) {
 		rc = PTR_ERR(dp->parser);
 		DRM_ERROR("failed to initialize parser, rc = %d\n", rc);
@@ -799,7 +798,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = dp_audio_get(dp->pdev, dp->panel, dp->catalog);
+	dp->audio = dp_audio_get(dp->dp_display.pdev, dp->panel, dp->catalog);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
@@ -1205,7 +1204,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
+	dp->irq = irq_of_parse_and_map(dp->dp_display.pdev->dev.of_node, 0);
 	if (!dp->irq) {
 		DRM_ERROR("failed to get irq\n");
 		return -EINVAL;
@@ -1261,7 +1260,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	dp->pdev = pdev;
+	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
@@ -1469,7 +1468,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	int rc;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
-	dev = &dp->pdev->dev;
+	dev = &dp->dp_display.pdev->dev;
 
 	dp->debug = dp_debug_get(dev, dp->panel,
 					dp->link, dp->dp_display.connector,
@@ -1489,7 +1488,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	struct device *dev;
 
 	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-	dev = &dp_priv->pdev->dev;
+	dev = &dp_priv->dp_display.pdev->dev;
 	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
 
 	if (aux_bus && dp->is_edp) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 1e9415ab15d8..f66cdbc35785 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -12,6 +12,7 @@
 
 struct msm_dp {
 	struct drm_device *drm_dev;
+	struct platform_device *pdev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
-- 
2.39.2

