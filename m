Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A56618EBF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3034C10E6D8;
	Fri,  4 Nov 2022 03:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED02310E6CE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:17:01 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so2194806pjs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrQmz6cJVqY/H9BfK/o+0dkaKbv8JCR1T0NvHoya8JA=;
 b=KMSJDgxFq1tY4jP2/++fZNe/D4/bncEPZSFY1/QeJqIqeDvK8p7XL22NdlHkO8+CEh
 gOezBO3bjIahYJkfRsGJNGoWh51A1HAQxFJHnQsm5m9B5VWGJYTVz5bwzhlt3g59+IoT
 CunmQTZ5fOSGNl6azO9SCS4x5qSW7puoWGiMUrvplVPe/9MbyYPrKmElyXtnUIlYAJyY
 K1BaqxxIOPXKwL3cAtuUc8n9Vonz3qwMOa8WQAf2sr8XmSGXM2flPBypFj6/STW3D4pa
 TP1pyFuhjmDnFZcW94rS7OMf1QJMlV4iqp5Mig15fFhTWOott2M3ZwXAk+ZZWxD5PmIY
 Thzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrQmz6cJVqY/H9BfK/o+0dkaKbv8JCR1T0NvHoya8JA=;
 b=0fEJIrUt/dlbbzqJtGoJq50HwhnOqFUfXzTLEtUiw9uhtDsUDAiuHw1vZf8Cogt0Zd
 TQWXdbtunT82FF0bArTP1EKixgcbZT2GfhsN0iNHrjuzxvVwRL2GlRrf6XItXaRFkxoR
 ZnP5CV3LkXMUFkPnhF6t9KR57LTFY9kLz4FUeWClK7grU8z1mwq3N0eyWDaABnplCuZg
 rN92j+q9WxPNUe5xfwWgN6POVFeSJUKkIJS13WGbqpQsZIBxhCwsBQKc2r5ctavNyw5W
 DMNS9G9rA9hdClAfTzUmjjsH524HO1dvOWEt8C+viZPLm4+9jTI4EzszGGhWFmUSyxzH
 rDPg==
X-Gm-Message-State: ACrzQf1F2Wq0ymvAEPGuTSYR1TOL2auiJlmhJDJIhNpcTJjYJYmVyrDC
 DT7a7ck5fTT2yGW1BamjavE=
X-Google-Smtp-Source: AMsMyM7j+GKismZ1Aj2+yOnap1TmWUP2Ww4Xc3hFpTrs6VKlzeGB4aRksFTNQcUwDzL/dmDGvPX7YA==
X-Received: by 2002:a17:902:7d87:b0:17f:9cd0:2e03 with SMTP id
 a7-20020a1709027d8700b0017f9cd02e03mr33241589plm.164.1667531821303; 
 Thu, 03 Nov 2022 20:17:01 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:17:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 08/13] omapfb: panel-dpi: remove support for platform
 data
Date: Thu,  3 Nov 2022 20:16:37 -0700
Message-Id: <20221103-omapfb-gpiod-v1-8-cba1fae5a77c@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-28747
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no users of panel_dpi_platform_data in the mainline
kernel so support for it can be removed from the panel driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  | 83 ++--------------------
 include/video/omap-panel-data.h                    | 21 ------
 2 files changed, 7 insertions(+), 97 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
index ff3d1e8e1e7b..9790053c5877 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
@@ -6,15 +6,13 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
-#include <video/omap-panel-data.h>
 #include <video/of_display_timing.h>
 
 struct panel_drv_data {
@@ -25,9 +23,6 @@ struct panel_drv_data {
 
 	struct omap_video_timings videomode;
 
-	/* used for non-DT boot, to be removed */
-	int backlight_gpio;
-
 	struct gpio_desc *enable_gpio;
 };
 
@@ -77,9 +72,6 @@ static int panel_dpi_enable(struct omap_dss_device *dssdev)
 
 	gpiod_set_value_cansleep(ddata->enable_gpio, 1);
 
-	if (gpio_is_valid(ddata->backlight_gpio))
-		gpio_set_value_cansleep(ddata->backlight_gpio, 1);
-
 	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 	return 0;
@@ -93,9 +85,6 @@ static void panel_dpi_disable(struct omap_dss_device *dssdev)
 	if (!omapdss_device_is_enabled(dssdev))
 		return;
 
-	if (gpio_is_valid(ddata->backlight_gpio))
-		gpio_set_value_cansleep(ddata->backlight_gpio, 0);
-
 	gpiod_set_value_cansleep(ddata->enable_gpio, 0);
 
 	in->ops.dpi->disable(in);
@@ -146,49 +135,6 @@ static struct omap_dss_driver panel_dpi_ops = {
 	.get_resolution	= omapdss_default_get_resolution,
 };
 
-static int panel_dpi_probe_pdata(struct platform_device *pdev)
-{
-	const struct panel_dpi_platform_data *pdata;
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct omap_dss_device *dssdev, *in;
-	struct videomode vm;
-	int r;
-
-	pdata = dev_get_platdata(&pdev->dev);
-
-	in = omap_dss_find_output(pdata->source);
-	if (in == NULL) {
-		dev_err(&pdev->dev, "failed to find video source '%s'\n",
-				pdata->source);
-		return -EPROBE_DEFER;
-	}
-
-	ddata->in = in;
-
-	ddata->data_lines = pdata->data_lines;
-
-	videomode_from_timing(pdata->display_timing, &vm);
-	videomode_to_omap_video_timings(&vm, &ddata->videomode);
-
-	dssdev = &ddata->dssdev;
-	dssdev->name = pdata->name;
-
-	r = devm_gpio_request_one(&pdev->dev, pdata->enable_gpio,
-					GPIOF_OUT_INIT_LOW, "panel enable");
-	if (r)
-		goto err_gpio;
-
-	ddata->enable_gpio = gpio_to_desc(pdata->enable_gpio);
-
-	ddata->backlight_gpio = pdata->backlight_gpio;
-
-	return 0;
-
-err_gpio:
-	omap_dss_put_device(ddata->in);
-	return r;
-}
-
 static int panel_dpi_probe_of(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
@@ -205,8 +151,6 @@ static int panel_dpi_probe_of(struct platform_device *pdev)
 
 	ddata->enable_gpio = gpio;
 
-	ddata->backlight_gpio = -ENOENT;
-
 	r = of_get_display_timing(node, "panel-timing", &timing);
 	if (r) {
 		dev_err(&pdev->dev, "failed to get video timing\n");
@@ -233,30 +177,18 @@ static int panel_dpi_probe(struct platform_device *pdev)
 	struct omap_dss_device *dssdev;
 	int r;
 
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (ddata == NULL)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, ddata);
 
-	if (dev_get_platdata(&pdev->dev)) {
-		r = panel_dpi_probe_pdata(pdev);
-		if (r)
-			return r;
-	} else if (pdev->dev.of_node) {
-		r = panel_dpi_probe_of(pdev);
-		if (r)
-			return r;
-	} else {
-		return -ENODEV;
-	}
-
-	if (gpio_is_valid(ddata->backlight_gpio)) {
-		r = devm_gpio_request_one(&pdev->dev, ddata->backlight_gpio,
-				GPIOF_OUT_INIT_LOW, "panel backlight");
-		if (r)
-			goto err_gpio;
-	}
+	r = panel_dpi_probe_of(pdev);
+	if (r)
+		return r;
 
 	dssdev = &ddata->dssdev;
 	dssdev->dev = &pdev->dev;
@@ -275,7 +207,6 @@ static int panel_dpi_probe(struct platform_device *pdev)
 	return 0;
 
 err_reg:
-err_gpio:
 	omap_dss_put_device(ddata->in);
 	return r;
 }
diff --git a/include/video/omap-panel-data.h b/include/video/omap-panel-data.h
index b7733150b55c..18172d7b97d0 100644
--- a/include/video/omap-panel-data.h
+++ b/include/video/omap-panel-data.h
@@ -31,25 +31,4 @@ struct connector_atv_platform_data {
 	bool invert_polarity;
 };
 
-/**
- * panel_dpi platform data
- * @name: name for this display entity
- * @source: name of the display entity used as a video source
- * @data_lines: number of DPI datalines
- * @display_timing: timings for this panel
- * @backlight_gpio: gpio to enable/disable the backlight (or -1)
- * @enable_gpio: gpio to enable/disable the panel (or -1)
- */
-struct panel_dpi_platform_data {
-	const char *name;
-	const char *source;
-
-	int data_lines;
-
-	const struct display_timing *display_timing;
-
-	int backlight_gpio;
-	int enable_gpio;
-};
-
 #endif /* __OMAP_PANEL_DATA_H */

-- 
b4 0.11.0-dev-28747
