Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAAE34466F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F26189DBD;
	Mon, 22 Mar 2021 14:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C107889DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:02:26 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id v2so8676285pgk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tNbrx86DmSZYrQGPtYW/NrYWvp0JiJ6t7g8UyTa2yps=;
 b=Idm1TRUwyS7zoyZ0x5Jvarukc5YvesuKKpp07dpHvp2f6ETWIWw1+hJgNs8cqOkYVN
 MTQHCYi83l/IIH2ga0WYbDvz+orKOal6INF2WsCpg1YiA9/HixP5tg2gWFUPQuoqEfwG
 14G5gC0WAkIz7nZeQsvBsWWUpzlDe54IsKw40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tNbrx86DmSZYrQGPtYW/NrYWvp0JiJ6t7g8UyTa2yps=;
 b=m1JbNQXS+qzp41HPj784IKQwsjU4Ph754c56R+lRVfxATHVpt2DeW49ssgxAbn7log
 ky5zKF9rsS0IyglHHfPwopr4Sscu7o+Y/+bw6aFbAtgG7FdTV0c/6lljrgqlbJMVuELE
 wvK5ewTJfhtsLX59egEbw3Z7xcI63AnKReetno6IDHCkZ6RQRtIY3aeLEdsoAUt4gMtr
 xB2hGAGgH39Ns1QshnGKalUtlRMgirgrP2OhMtsBAM5KDVE8k5vkK/2tqyGc1eHkVZG5
 HYq3dJYXWpIkVkhms2JnqZ8BCCL0kmGSAegFl9OzvTP1fHel8cD6CNqb8g9RZPCecngx
 a18g==
X-Gm-Message-State: AOAM531h3+9CQJ9orE6gXTJ6X9onBWzXerpQ0NOl9xa972Q1bq9OrtJ1
 3ZoClDQS5Z/D8vsVrgPlH+0U4Q==
X-Google-Smtp-Source: ABdhPJymBCVrrkdCj22Ow4zPjS5VbcwN1e3vMrGoJ7v1KJtcbO5PMqdgf77gob6DFaR3v/wQx6YRaw==
X-Received: by 2002:a63:5044:: with SMTP id q4mr22407823pgl.178.1616421746216; 
 Mon, 22 Mar 2021 07:02:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:15c1:9a30:414f:d84b])
 by smtp.gmail.com with ESMTPSA id gg22sm14112997pjb.20.2021.03.22.07.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:02:25 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 2/4] drm: sun4i: dsi: Add bridge support
Date: Mon, 22 Mar 2021 19:31:50 +0530
Message-Id: <20210322140152.101709-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322140152.101709-1-jagan@amarulasolutions.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
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

Changes for v4:
- none
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
