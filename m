Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0830618BE7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B26410E68A;
	Thu,  3 Nov 2022 22:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F232B10E68A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:34 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so1795078pjs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lICc/rWaMoROTE0u55UzPp1Y14gm+Rp7/jl9zO+qTM=;
 b=PEnqWizL1UDaQbvEqUdMlyG+jz4GT49XSYAlI9eA5K4FoWnoc2Udqu4XgLFIRcpXE8
 CMmoyc7Ra7ZJ1VFKfhuQ/nchBYzwXUohfvlnAo1zGXyxK6CQvf9zhtqH0JxZBKEHCXAq
 lVviZEoaxBCmgigRW52Fk95qADgOowhxZd+IFCzFGLjM943ZzURAZRGPLX3wr6Ew0k0e
 HrEXqKMD6TVMqENxaFyey6oDZaJB0uPgIYGOrb/k6CT4UmDDKaMBXU0CtZSxw5dmKKY9
 ik+WTogYirAuPkeJjthOwfdz4EhFePxqSNI0afE0cJO260TohRYFC2LswVMTp2AzqyNm
 3ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lICc/rWaMoROTE0u55UzPp1Y14gm+Rp7/jl9zO+qTM=;
 b=7z0swQbx3Ir9rxa7nDX/PwMS1dHK9wC+Y0Gju+Uh1NidWiDXvYwxFUjdDoxZhBUIiZ
 PCgSBUIbN+twC3gjsIUmU3Kd5UjquHZS6ri8kDiredlaaeWiuHmHUOxJJDYuxX0RfEiP
 EWjnBOJ7szIsPBpKNG2TCbPkF23rxzt0yXeW8pD/rYlh7H9De5cOnG3WO0ubO05Ebspg
 pypt8HCsw0rOdRiNbzFdtJWwn4l5BAs+Qy/cAW5Of+u0+XFIk4edZsUII5cjoO4Xortx
 F5ZcU2dWEf2V9WsfWaddkjiS3iP2Sca5Xeclv+sPHzgAoDUXB4NAsbdODjJmZPgaXKSp
 s3QA==
X-Gm-Message-State: ACrzQf3WGS+NwgAcPC2QfttCL0rX3FwslyerFFl82SJ7hv88uU33kgVM
 lRcMyOyq5FXq53Q/ZzTKK6E=
X-Google-Smtp-Source: AMsMyM5RkuTbDiCk98t1ic7KEdGQk8QAKwiM3zEw9SQYZlIkk6xW2HynBsbVoXLMUboS7ern19iJNA==
X-Received: by 2002:a17:902:7446:b0:186:a3a1:782d with SMTP id
 e6-20020a170902744600b00186a3a1782dmr32424006plt.76.1667515654556; 
 Thu, 03 Nov 2022 15:47:34 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 08/13] omapfb: panel-dpi: remove support for platform data
Date: Thu,  3 Nov 2022 15:46:51 -0700
Message-Id: <20221103-omapfb-gpiod-v1-8-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
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
b4 0.11.0-dev-5166b
