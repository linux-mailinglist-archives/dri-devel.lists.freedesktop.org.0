Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F421F31B242
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3646E094;
	Sun, 14 Feb 2021 19:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2206E094
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:27 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id z9so2613886pjl.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WZPMnqVXps+lPno6HH29XofDRK8cGk3vtrNY/1y3YY=;
 b=kFSNtSVX/9Qv2bIkNFV++AVP0nkqI+cc9EHdDg0PlhQmMwSTZ1BhpkglzpmTgYz/zH
 NlxRFdynr7OBoW6qqiI+YLRnhjRW4zshCErSGK1wtcf/sdGXNIoHeROQ6c66i8RftGQD
 jEsGYR+v9T52a11C+iTNg/l6jYzuNL/RwPlPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WZPMnqVXps+lPno6HH29XofDRK8cGk3vtrNY/1y3YY=;
 b=HLyaEe5tKxTLaTGRVw2p8VtzZTfQSfkmPS00LS2t4bkVJng5J87rmVRTdGvmYd/BE5
 ZeeeD/kKUHZjQ3bJWBt+BV2oIBibKPFohmh+VFrAzOtWRHkvsE3V6S7f7ykVfqfp1/QX
 qRKKH+IJ2iNy/KHdFBhg0rhi6/ukZFbuvMXid3bSIgaNbskoGqF5Fc+7hKXgk0hx9ZBv
 FNbcVh8AQMY6p6Sul0pqZlXcAnYMPWhI9Xa3hXVtWTJzNeB1vIvCOs3TLIxuP/4jquZF
 wYQn+b71ruwtS5Ya0qmpPWpW010nLE3vKkExDaUNi+5X11uK4DrFM/L00/+eiy4rEuxh
 uHew==
X-Gm-Message-State: AOAM533EswG3m0QslmKMd1kOX/dmjuT1JHr2AUCMRUgwj7JahMdqT0cK
 oG0Uu41t8G+NFPUA/eA4EgYToA==
X-Google-Smtp-Source: ABdhPJy1dx9CAbEewuwblQXsakhtnMJqea774EloTB5iaaa2mRAoGLCbBSR3NnhDVFg+Jn8I6uin6g==
X-Received: by 2002:a17:90a:fe09:: with SMTP id
 ck9mr12857176pjb.67.1613331687102; 
 Sun, 14 Feb 2021 11:41:27 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:26 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/7] drm: sun4i: dsi: Add bridge support
Date: Mon, 15 Feb 2021 01:10:57 +0530
Message-Id: <20210214194102.126146-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some display panels would come up with a non-DSI output which
can have an option to connect DSI interface by means of bridge
converter.

This DSI to non-DSI bridge converter would require a bridge
driver that would communicate the DSI controller for bridge
functionalities.

So, add support for bridge functionalities in Allwinner DSI
controller.

Cc: Samuel Holland <samuel@sholland.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note: 
Samuel Holland, The existing kms hotplug dropped in order to 
attach the bridge properly. 

However, I did try several ways to support hotplug with the 
bridge but it's resulting in a deadlock where bind never attach 
bridge until bridge pointer found and bridge pointer cannot 
found until bind finishes. Any inputs on this would be appreciated.

Changes for v3:
- updated with new API's 

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 34 +++++++++++++++++---------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 +-
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 2e9e7b2d4145..39321299dc27 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -773,6 +773,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (dsi->panel)
 		drm_panel_prepare(dsi->panel);
 
+	if (dsi->panel_bridge)
+		dsi->panel_bridge->funcs->pre_enable(dsi->panel_bridge);
+
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
 	 *
@@ -788,6 +791,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (dsi->panel)
 		drm_panel_enable(dsi->panel);
 
+	if (dsi->panel_bridge)
+		dsi->panel_bridge->funcs->enable(dsi->panel_bridge);
+
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
 	udelay(1000);
@@ -804,6 +810,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
 	if (dsi->panel) {
 		drm_panel_disable(dsi->panel);
 		drm_panel_unprepare(dsi->panel);
+	} else if (dsi->panel_bridge) {
+		dsi->panel_bridge->funcs->disable(dsi->panel_bridge);
+		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
 	}
 
 	phy_power_off(dsi->dphy);
@@ -964,23 +973,17 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
-	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
-					  &panel, NULL);
+					  &dsi->panel, &dsi->panel_bridge);
 	if (ret)
 		return ret;
 
-	if (!dsi->drm || !dsi->drm->registered)
-		return -EPROBE_DEFER;
-
-	dsi->panel = panel;
 	dsi->device = device;
 
-	drm_kms_helper_hotplug_event(dsi->drm);
-
-	dev_info(host->dev, "Attached device %s\n", device->name);
+	dev_info(host->dev, "Attached %s %s\n",
+		 device->name, dsi->panel ? "panel" : "bridge");
 
 	return 0;
 }
@@ -991,9 +994,10 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
 	dsi->panel = NULL;
+	dsi->panel_bridge = NULL;
 	dsi->device = NULL;
 
-	drm_kms_helper_hotplug_event(dsi->drm);
+	drm_of_panel_bridge_remove(dsi->dev->of_node, 0, 0);
 
 	return 0;
 }
@@ -1082,7 +1086,13 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
 
-	dsi->drm = drm;
+	if (dsi->panel_bridge) {
+		ret = drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL, 0);
+		if (ret) {
+			dev_err(dsi->dev, "Couldn't attach drm bridge\n");
+			goto err_cleanup_connector;
+		}
+	}
 
 	return 0;
 
@@ -1096,7 +1106,7 @@ static void sun6i_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 
-	dsi->drm = NULL;
+	drm_encoder_cleanup(&dsi->encoder);
 }
 
 static const struct component_ops sun6i_dsi_ops = {
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index c863900ae3b4..370ecb356a63 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -29,8 +29,8 @@ struct sun6i_dsi {
 
 	struct device		*dev;
 	struct mipi_dsi_device	*device;
-	struct drm_device	*drm;
 	struct drm_panel	*panel;
+	struct drm_bridge	*panel_bridge;
 };
 
 static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
