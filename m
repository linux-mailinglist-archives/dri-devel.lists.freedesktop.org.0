Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195E46FFA8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9056410E348;
	Fri, 10 Dec 2021 11:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEE610E326
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id x7so6651656pjn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqiplFeVk+BY4Qw9hiZLgYutFh3HymB4iR0Knju+k4M=;
 b=hc5MSWMSmWihwCW9f7LVkiPvI2cAZobPX13gbbARWCsv+yFWJb9+byA455H+n0HLEu
 zJCHuzFurAX3JI5eChIJY4GmqkbUfsTnPf5l7jPAwfpHbeoGFAPQgNHFsjIEHQ4wk9R1
 rQEXYZXYddbgHX3NIMH2vzzaAQzZ3NH3uqPYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqiplFeVk+BY4Qw9hiZLgYutFh3HymB4iR0Knju+k4M=;
 b=pM00xRJIP9lMLVvfe7lRxI1ZAhSTOMN/FayLbeuXXuJRxx8PUvYPD9Q50+EoUMYQzo
 QRYfCOqv84AgT3fLxC/iLlzk4P9Lg9YFSRdAdGiczMRNS7xRLvc/TRIKtU54Pts6w20W
 zBscMpgm128xWvENgccHKg+cD2zPwc0p0fCGR4jf83YcCvSjyeMjKRTa7XYt2TSvrSDT
 mm15D1zLZM9XB7V9I66qwP0Rte7WgW5tr4dgPfm5Uwi3LEhwbR0rJM1vdh+P96MMQsgI
 AaU/S9eqfENp/6xJjrCh7b0Uhymf3J2ep7hDX+XUUsZC2ynF0RimiuxfNprk6c76qeZr
 +x1Q==
X-Gm-Message-State: AOAM530l4NXgUxr9B0fQXrFUcbMkWBPUDhC/Gm3c8cX15JssWfaBucrP
 EOXTI1Dgp5/LgRlz29Q7woh6OA==
X-Google-Smtp-Source: ABdhPJxbXk+Y+AkJpt/at6ihAaxF1I+qlvCRxQFcPf0bHCTVmGkPmNLdWe08qUGGXgwj8VMpqUh/TA==
X-Received: by 2002:a17:90b:4ace:: with SMTP id
 mh14mr23232501pjb.164.1639135055791; 
 Fri, 10 Dec 2021 03:17:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:35 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v6 2/6] drm: sun4i: dsi: Add component only once DSI device
 attached
Date: Fri, 10 Dec 2021 16:47:07 +0530
Message-Id: <20211210111711.2072660-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having component_add for running all drm bind callbacks returns
error or unbound due to chain of DSI devices connected across
bridge topology on a display pipeline.

In a typical bridge oriented display pipeline where the host is
connected to the bridge converter and that indeed connected to
a panel.

DRM => SUN6I DSI Host => Chipone ICN6211 => BananaPi Panel

The bridge converter is looking for a panel to probe first and
then attach the host. The host attach is looking for a bridge
converter to probe and preserve bridge pointer, at this movement
the host is trying to bind the all callbacks and one of the bind
callback in the DSI host is trying to find the bridge using the
bridge pointer in sun6i_dsi_attach call.

chipone_probe().start
    drm_of_find_panel_or_bridge
        mipi_dsi_attach
             sun6i_dsi_attach
                 drm_of_find_panel_or_bridge
chipone_probe().done

sun6i_dsi_probe().start
    mipi_dsi_host_register
        component_add
sun6i_dsi_probe().done

However, the movement when panel defers the probe, will make the
bridge converter defer the host attach call which eventually found
a NULL bridge pointer during DSI component bind callback.

So, in order to prevent this scenario of binding invalid bridge,
wait for DSI devices on the pipeline to probe first and start the
binding process by moving component_add in host probe to attach call.

chipone_probe().start
    drm_of_find_panel_or_bridge
        mipi_dsi_attach
             sun6i_dsi_attach
                 drm_of_find_panel_or_bridge
      		      component_add
chipone_probe().done

sun6i_dsi_probe().start
    mipi_dsi_host_register
sun6i_dsi_probe().done

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- none
Changes for v5:
- new patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 120 +++++++++++++------------
 1 file changed, 61 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 4bdcce8f1d84..9cf91dcac3f2 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -959,11 +959,63 @@ static int sun6i_dsi_dcs_read(struct sun6i_dsi *dsi,
 	return 1;
 }
 
+static int sun6i_dsi_bind(struct device *dev, struct device *master,
+			 void *data)
+{
+	struct drm_device *drm = data;
+	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
+	int ret;
+
+	drm_encoder_helper_add(&dsi->encoder,
+			       &sun6i_dsi_enc_helper_funcs);
+	ret = drm_simple_encoder_init(drm, &dsi->encoder,
+				      DRM_MODE_ENCODER_DSI);
+	if (ret) {
+		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
+		return ret;
+	}
+	dsi->encoder.possible_crtcs = BIT(0);
+
+	drm_connector_helper_add(&dsi->connector,
+				 &sun6i_dsi_connector_helper_funcs);
+	ret = drm_connector_init(drm, &dsi->connector,
+				 &sun6i_dsi_connector_funcs,
+				 DRM_MODE_CONNECTOR_DSI);
+	if (ret) {
+		dev_err(dsi->dev,
+			"Couldn't initialise the DSI connector\n");
+		goto err_cleanup_connector;
+	}
+
+	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
+
+	return 0;
+
+err_cleanup_connector:
+	drm_encoder_cleanup(&dsi->encoder);
+	return ret;
+}
+
+static void sun6i_dsi_unbind(struct device *dev, struct device *master,
+			    void *data)
+{
+	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
+
+	drm_encoder_cleanup(&dsi->encoder);
+}
+
+static const struct component_ops sun6i_dsi_ops = {
+	.bind	= sun6i_dsi_bind,
+	.unbind	= sun6i_dsi_unbind,
+};
+
 static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
+	struct device *dev = dsi->dev;
+	int ret;
 
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
@@ -973,6 +1025,13 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 
 	dev_info(host->dev, "Attached device %s\n", device->name);
 
+	ret = component_add(dev, &sun6i_dsi_ops);
+	if (ret) {
+		dev_err(dev, "Couldn't register our component\n");
+		mipi_dsi_host_unregister(&dsi->host);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -984,6 +1043,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 	dsi->panel = NULL;
 	dsi->device = NULL;
 
+	component_del(dsi->dev, &sun6i_dsi_ops);
+
 	return 0;
 }
 
@@ -1041,56 +1102,6 @@ static const struct regmap_config sun6i_dsi_regmap_config = {
 	.name		= "mipi-dsi",
 };
 
-static int sun6i_dsi_bind(struct device *dev, struct device *master,
-			 void *data)
-{
-	struct drm_device *drm = data;
-	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
-	int ret;
-
-	drm_encoder_helper_add(&dsi->encoder,
-			       &sun6i_dsi_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
-	if (ret) {
-		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
-		return ret;
-	}
-	dsi->encoder.possible_crtcs = BIT(0);
-
-	drm_connector_helper_add(&dsi->connector,
-				 &sun6i_dsi_connector_helper_funcs);
-	ret = drm_connector_init(drm, &dsi->connector,
-				 &sun6i_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
-	if (ret) {
-		dev_err(dsi->dev,
-			"Couldn't initialise the DSI connector\n");
-		goto err_cleanup_connector;
-	}
-
-	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
-
-	return 0;
-
-err_cleanup_connector:
-	drm_encoder_cleanup(&dsi->encoder);
-	return ret;
-}
-
-static void sun6i_dsi_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&dsi->encoder);
-}
-
-static const struct component_ops sun6i_dsi_ops = {
-	.bind	= sun6i_dsi_bind,
-	.unbind	= sun6i_dsi_unbind,
-};
-
 static int sun6i_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1172,16 +1183,8 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		goto err_unprotect_clk;
 	}
 
-	ret = component_add(&pdev->dev, &sun6i_dsi_ops);
-	if (ret) {
-		dev_err(dev, "Couldn't register our component\n");
-		goto err_remove_dsi_host;
-	}
-
 	return 0;
 
-err_remove_dsi_host:
-	mipi_dsi_host_unregister(&dsi->host);
 err_unprotect_clk:
 	clk_rate_exclusive_put(dsi->mod_clk);
 err_attach_clk:
@@ -1195,7 +1198,6 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 
-	component_del(&pdev->dev, &sun6i_dsi_ops);
 	mipi_dsi_host_unregister(&dsi->host);
 	clk_rate_exclusive_put(dsi->mod_clk);
 
-- 
2.25.1

