Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD035618EB1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27BB10E06A;
	Fri,  4 Nov 2022 03:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2CC10E05C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:16:53 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id q1so3310646pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJ4K4KM6k2CEMbYDdflp8ef3L5pfloTxSXh3e5bS5/U=;
 b=mMQlwS66ofHJZcvmNsBsP56KBfkZqf7bHVWZj5b3L3LwPXH3euCSEKqDgemjDI3qS5
 XduOuI6an41I1Ag8zzdIcXbKvpf2RtApKU5PUvblvfHX3aTGe/SSkLkeA6ZgpkxfYst2
 809l5GzXUbv7o55qkWSmaYv3GcrGlR7XDDh5vU8pnAhgPdRky6olkW4az16LiKYx2STM
 GOgbyXjP988tOfK7Ln7OTkwtW6wvCKxHphVZ1FN1SinsF0ao2rl60Zbz8Brg3gzkumuk
 3q4jY+FC1EbOO3SYcJ1q/whOJcTSWe3VIKoVKSwt5/5wG/xxjUYneEJSqxgbMpq4TfWR
 7ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJ4K4KM6k2CEMbYDdflp8ef3L5pfloTxSXh3e5bS5/U=;
 b=evOVDdyBru0okDBa9Yjrnk8Iy3vnMA9TaGjAyyicB0/+GMBzoMHoFRmZxUNJfu0xb3
 Nha65kZQcv6TVsiZgu1RykWbXMNnmREVZ/K60DNqfJJN5+FTus0rkrEJPdIsIIQ/+UVH
 wiyBoxeLqR6puTepLBC+pmMPnw8bNAxsmbH6A1AkZcauU4dRPIUrEJel+t7x4CnREvYN
 JY1slauQq1MTJU0XZ6ajpJ1xXXpi10urrrY/4RS6jTwBnxcptKlQlr2CTiSyC5p2EuUu
 2u0qYvAq6xvu8rf2pFrkliS5t/myquCpU5PmDDZ/8vbvmqJjKftasZouVvG4+hB28zo8
 RpMw==
X-Gm-Message-State: ACrzQf3LMtlrO+Lun/4559/c8mMbl95pcQuVeDVuZA/R/+tVGgu/KN7J
 CXeQreJ9eqhlo8mVUN3mT0Q=
X-Google-Smtp-Source: AMsMyM4tchCPdVlZQyBRBeNJnG09oNWvtbTca0XeFQFyyUv2O+/6FdhrdvkLkDekDvUuATI77sSEdQ==
X-Received: by 2002:a63:354e:0:b0:439:837:692f with SMTP id
 c75-20020a63354e000000b004390837692fmr29007595pga.74.1667531812631; 
 Thu, 03 Nov 2022 20:16:52 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:16:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 03/13] omapfb: panel-sony-acx565akm: switch to using
 gpiod API
Date: Thu,  3 Nov 2022 20:16:32 -0700
Message-Id: <20221103-omapfb-gpiod-v1-3-cba1fae5a77c@gmail.com>
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
b4 0.11.0-dev-28747
