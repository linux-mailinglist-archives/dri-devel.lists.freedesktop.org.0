Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A637BE8F0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B95F10E2A3;
	Mon,  9 Oct 2023 18:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DA410E29B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:46 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-505748580ceso6029733e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875044; x=1697479844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zhzV+U7efpSn+723yIcdjzHoi8KO2DqRUVlFbifyeE=;
 b=JZK+qH3x6l2gvq+EQtc6bZ7haoQvk8H9/mz9mf5eeRXbA5fBU23aHJIBgInZDZ7N2z
 RrDzD+39cSy5PYNNmaE9WC0nyRHQpy0Z7R/D40y/err0/lxNRZXWJAQKZpwaL3faVQu6
 kMgR301lPTy/zRkzEAizeI6akh0iPv4D0buLFlPSnw5DJSqHs89kcY9chKw1XTJ/DIOS
 qBSu1MBa5fILhwIvPaAqs3lcevMyUYGHulBRi/HotOPPkjy1z2+ou/RHjrrQarh6ZRlE
 dke1/F9QUIrOOk8fyBsHp/BeRrfzucspWHU/APvxM135VnDtHm+wBYOQAOQ94iSygHNC
 yVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875044; x=1697479844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zhzV+U7efpSn+723yIcdjzHoi8KO2DqRUVlFbifyeE=;
 b=FUAmveGQMAJaUqL7yUsyrkhx7/mh/+e92vDDBF0hkboBJw62nY7otQGHWWJ4mGK9AZ
 bPXUe4NM4v3Q5cGi+85rxvjNAgm2uDw9wYPRLLhMCJ1eZY80UEBafCp5lWKoLQgkfEZ1
 XoLFhXNkqbfbu1hmdbyyZ0JSbV5fWpBghN3VrnXyY/I3trMUqFcxRi3tOBS0X46+mBBJ
 8Hfo+VhH6/uj9ejPXK28kx+Hrp3y3jTiKGJwPvI6iSNEHMRxQuzN1eKPrS+OACyeaAt5
 /x8KTZ7fTmzWkzLtwfPFpIVftDW9rp997jDsRAOdtqxbqiY4iPZpbJXlXgBLdW29xwca
 z/TA==
X-Gm-Message-State: AOJu0YxBGGVXQqiFChnhlWBClxDVgG/sxec5O22GICDPXhgE/H3H0qpj
 6y0QWehRCsbcYHX5YQ7xKhcDIg==
X-Google-Smtp-Source: AGHT+IFmAdS1VzsJrY2RA16X9ZJRDThy7A/HeUgUe2JXph2AZoOw6bfFNxw2VxE5AJ+5etFYOBTxSg==
X-Received: by 2002:ac2:4c4b:0:b0:503:cca:e52f with SMTP id
 o11-20020ac24c4b000000b005030ccae52fmr17520979lfk.51.1696875044264; 
 Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 03/13] drm/msm/dp: move pdev from struct dp_display_private
 to struct msm_dp
Date: Mon,  9 Oct 2023 21:10:30 +0300
Message-Id: <20231009181040.2743847-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e1afff491af..172daa5ad004 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -88,7 +88,6 @@ struct dp_display_private {
 	bool audio_supported;
 
 	struct drm_device *drm_dev;
-	struct platform_device *pdev;
 	struct dentry *root;
 
 	struct dp_parser  *parser;
@@ -595,7 +594,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_configure_cb(&dp->dp_display.pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
@@ -643,7 +642,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		if (dp->link->sink_count == 0) {
 			dp_display_host_phy_exit(dp);
 		}
-		dp_display_notify_disconnect(&dp->pdev->dev);
+		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_DISCONNECT_PENDING) {
@@ -653,7 +652,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		dp_ctrl_off_link(dp->ctrl);
 		dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
-		dp_display_notify_disconnect(&dp->pdev->dev);
+		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -662,7 +661,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	dp_display_notify_disconnect(&dp->pdev->dev);
+	dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 
 	if (state == ST_DISPLAY_OFF) {
 		dp->hpd_state = ST_DISCONNECTED;
@@ -704,7 +703,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	dp_display_usbpd_attention_cb(&dp->dp_display.pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -725,12 +724,12 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
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
@@ -791,7 +790,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = dp_audio_get(dp->pdev, dp->panel, dp->catalog);
+	dp->audio = dp_audio_get(dp->dp_display.pdev, dp->panel, dp->catalog);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
@@ -1197,7 +1196,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
+	dp->irq = irq_of_parse_and_map(dp->dp_display.pdev->dev.of_node, 0);
 	if (!dp->irq) {
 		DRM_ERROR("failed to get irq\n");
 		return -EINVAL;
@@ -1253,7 +1252,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	dp->pdev = pdev;
+	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
@@ -1459,7 +1458,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	int rc;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
-	dev = &dp->pdev->dev;
+	dev = &dp->dp_display.pdev->dev;
 
 	dp->debug = dp_debug_get(dev, dp->panel,
 					dp->link, dp->dp_display.connector,
@@ -1479,7 +1478,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
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

