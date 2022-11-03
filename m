Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D9618BE0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C84E10E684;
	Thu,  3 Nov 2022 22:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1915810E669
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:14 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id b5so2917989pgb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GH+pjbZ+K47TbxTkjimUdbIKv2aREB2uwOZaTAR3O+0=;
 b=AtVU1Q7XkkXlsOl7/3TUJpvrwdhzBbHZGlidGgXR+JETpLaXjQhGxh5DSO8UeeRx1z
 lmzyrT3HrBTsEj6lHVW8Qeds+rlbKxj7sZFySA0LmnpinBy3IF/vmXqRawchvMe8MMOm
 fucTXo2y7vi7A+YVlco+lplUvFYlweyycpXgeAmNkBxhWLoA/BNmrASlUILt8VP076fr
 TisYu335o0vAfOJ9Oe+5hnF4tu2he+bFCBNWEHhpTj75WtPltpDVkx/but16KZrREanV
 o+3ec2Bue8IGKD9Q2T09mEtf3z/OsCQiOWNr1yaWRAo41ylTSyenME1ztxpmSoNsUPag
 CzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GH+pjbZ+K47TbxTkjimUdbIKv2aREB2uwOZaTAR3O+0=;
 b=FQ4C9xc2+pS9vlD8iynu7HK01O4rz1PT0yM01rED4AiocKsMXCKCGlQHf3EjbTBqyJ
 jL8Ng5A5LJAS4SRx2TWTt/XmJc0wMwDY19Lok5/Csc9mbOpcZHSaC6AmKSH3dFPscCxk
 YVaMu0dCLHY5pOmzUXHwXfBsB/n0YXkP6xRlpPTmuMK8zjRvYcBQr8G00xmYQdG05UgX
 HhDoJpIZiWmHnIVKePlvJfg+Q612gDsbeEEQYf4B/sD4QqGT8q6XJf0iDwIif6wx4yq2
 cCQmBfz7ye1lgRk7wtkpIJYyh3U7rSilFz7ENXz629w3Mnf4XAh3c0khMF5gkLGxb407
 HEPQ==
X-Gm-Message-State: ACrzQf0cqr/qUfzYlhZGzqbGFVdwuzk0PcRKh8i9a7p4JTbxJs0yIWqp
 rUz4mnGRLDLB07cck0lvFPmXKT5rCBM=
X-Google-Smtp-Source: AMsMyM4imwZCA7FoQ4w/A6ci9hVvC0eJbMM4L5cUh8wQGUJGFbRR7b+l9DZqZD34j+rU+8ruyM8SZw==
X-Received: by 2002:a05:6a02:282:b0:439:7a97:ccd with SMTP id
 bk2-20020a056a02028200b004397a970ccdmr28521129pgb.297.1667515633557; 
 Thu, 03 Nov 2022 15:47:13 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 03/13] omapfb: panel-sony-acx565akm: switch to using gpiod API
Date: Thu,  3 Nov 2022 15:46:41 -0700
Message-Id: <20221103-omapfb-gpiod-v1-3-c3d53ca7988f@gmail.com>
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

Switch the driver from legacy gpio API that is deprecated to the newer
gpiod API that respects line polarities described in ACPI/DT.

Note that because existing DTSes specify incorrect polarity of reset
lines (active high) and GPU drivers have adopted to this, we follow
the suit and use inverted values when controlling reset lines.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 66 ++++++++++------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 0c81d3ff4197..685c63aa4e03 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -18,9 +18,8 @@
 #include <linux/sched.h>
 #include <linux/backlight.h>
 #include <linux/fb.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
 
@@ -56,7 +55,8 @@ struct panel_drv_data {
 	struct omap_dss_device	dssdev;
 	struct omap_dss_device *in;
 
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
+
 	int datapairs;
 
 	struct omap_video_timings videomode;
@@ -545,8 +545,13 @@ static int acx565akm_panel_power_on(struct omap_dss_device *dssdev)
 	/*FIXME tweak me */
 	msleep(50);
 
-	if (gpio_is_valid(ddata->reset_gpio))
-		gpio_set_value(ddata->reset_gpio, 1);
+	/*
+	 * Note that we appear to activate the reset line here. However
+	 * existing DTSes specified incorrect polarity for it (active high),
+	 * so in fact this deasserts the reset line.
+	 */
+	if (ddata->reset_gpio)
+		gpiod_set_value_cansleep(ddata->reset_gpio, 1);
 
 	if (ddata->enabled) {
 		dev_dbg(&ddata->spi->dev, "panel already enabled\n");
@@ -595,8 +600,9 @@ static void acx565akm_panel_power_off(struct omap_dss_device *dssdev)
 	 */
 	msleep(50);
 
-	if (gpio_is_valid(ddata->reset_gpio))
-		gpio_set_value(ddata->reset_gpio, 0);
+	/* see comment in acx565akm_panel_power_on() */
+	if (ddata->reset_gpio)
+		gpiod_set_value_cansleep(ddata->reset_gpio, 0);
 
 	/* FIXME need to tweak this delay */
 	msleep(100);
@@ -687,22 +693,6 @@ static struct omap_dss_driver acx565akm_ops = {
 	.get_resolution	= omapdss_default_get_resolution,
 };
 
-static int acx565akm_probe_of(struct spi_device *spi)
-{
-	struct panel_drv_data *ddata = dev_get_drvdata(&spi->dev);
-	struct device_node *np = spi->dev.of_node;
-
-	ddata->reset_gpio = of_get_named_gpio(np, "reset-gpios", 0);
-
-	ddata->in = omapdss_of_find_source_for_first_ep(np);
-	if (IS_ERR(ddata->in)) {
-		dev_err(&spi->dev, "failed to find video source\n");
-		return PTR_ERR(ddata->in);
-	}
-
-	return 0;
-}
-
 static int acx565akm_probe(struct spi_device *spi)
 {
 	struct panel_drv_data *ddata;
@@ -729,19 +719,25 @@ static int acx565akm_probe(struct spi_device *spi)
 
 	mutex_init(&ddata->mutex);
 
-	r = acx565akm_probe_of(spi);
-	if (r)
+	ddata->in = omapdss_of_find_source_for_first_ep(spi->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&spi->dev, "failed to find video source\n");
 		return r;
-
-	if (gpio_is_valid(ddata->reset_gpio)) {
-		r = devm_gpio_request_one(&spi->dev, ddata->reset_gpio,
-				GPIOF_OUT_INIT_LOW, "lcd reset");
-		if (r)
-			goto err_gpio;
 	}
 
-	if (gpio_is_valid(ddata->reset_gpio))
-		gpio_set_value(ddata->reset_gpio, 1);
+	ddata->reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset",
+						    GPIOD_OUT_LOW);
+	r = PTR_ERR_OR_ZERO(ddata->reset_gpio);
+	if (r)
+		goto err_gpio;
+
+	if (ddata->reset_gpio) {
+		gpiod_set_consumer_name(ddata->reset_gpio, "lcd reset");
+
+		/* release the reset line */
+		gpiod_set_value_cansleep(ddata->reset_gpio, 1);
+	}
 
 	/*
 	 * After reset we have to wait 5 msec before the first
@@ -753,8 +749,8 @@ static int acx565akm_probe(struct spi_device *spi)
 
 	r = panel_detect(ddata);
 
-	if (!ddata->enabled && gpio_is_valid(ddata->reset_gpio))
-		gpio_set_value(ddata->reset_gpio, 0);
+	if (!ddata->enabled && ddata->reset_gpio)
+		gpiod_set_value_cansleep(ddata->reset_gpio, 0);
 
 	if (r) {
 		dev_err(&spi->dev, "%s panel detect error\n", __func__);

-- 
b4 0.11.0-dev-5166b
