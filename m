Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D9618BE6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B031010E683;
	Thu,  3 Nov 2022 22:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2F10E683
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:31 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so1794981pjs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aztYLEZ2Ar+xCBwvpIo1FkOJs0pWaPxddbEF+G4P4bY=;
 b=OHHfZ1gqCkW70fTqI7HRH2PKv+wu+5+kqGndytCXq65svH6oCfTodtEOu3YX8S4StZ
 aK9L89hkOctjlg+KWZycTSiONd3ZCyVebcg5jfwS/058fPsu6tu9tGVyuir+4spbNla+
 eB1YTMyDV1FmT2PR9cDufooow7ZdaII4why2HKU13EZN5IP0zRbYS04kHNns/aeLVWlD
 Ei3VY0V5w1XkWz4r3sGxf4cNVGJ79KjsX7CPu72kF9hFjdX927wP557mlVpaIty17Bep
 AUAE9kDuinsm6FvxjqHeSpdGpQFNczr5qsTZrNdJ/1fHwuNLrC+mrZzkWQIVBEWPEKzY
 lXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aztYLEZ2Ar+xCBwvpIo1FkOJs0pWaPxddbEF+G4P4bY=;
 b=oildlXZ+5f3CKer8rTT9vPjh3h3sSt+xZ1VY5sQcnUZLnLX2mXE0gr/e+mTI8nZicf
 qhE3O7n9hA2PYbT3bf/tmOmqq4OHPEhfarwBvrk+3XUCKfsTIMF+E0vaB5GBI/3/Nv/h
 X2CZ6qS4g1UIkqaZwWlPXLk/OejnLvvtz8SMEU9pWFuMp00SVM1qeMd7LGyK42meMYAr
 e0Bny3zqF6+zeik/kTPIGK1mhT3D1j380F4+e56YSgJa52f2DGhcJvAKnSG7ehFUv150
 KYAwCLBxLQnPrKufq8AYP5jWRJ6RtB3nBq8Xrshm1oJlEglR/OvmYhuV70l8xGB0R9ys
 Kfng==
X-Gm-Message-State: ACrzQf3txMbCwtY8F2kegwRWofKXkCK4nY8BV8VcUBWavEleRJhooWxX
 LS9YwotJsPso5v/yYyp3yc+He9OgdYw=
X-Google-Smtp-Source: AMsMyM6y7+39z4Ua1xvM3p2AOaYkmsDJ8g18Kn5uYYWgNHsOqRea+ABqsz2UaHFuDlWwgEa4ld3ojg==
X-Received: by 2002:a17:903:22c7:b0:187:190d:da89 with SMTP id
 y7-20020a17090322c700b00187190dda89mr26176716plg.68.1667515650865; 
 Thu, 03 Nov 2022 15:47:30 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:29 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 07/13] omapfb: panel-nec-nl8048hl11: switch to using gpiod API
Date: Thu,  3 Nov 2022 15:46:49 -0700
Message-Id: <20221103-omapfb-gpiod-v1-7-c3d53ca7988f@gmail.com>
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
 .../omap2/omapfb/displays/panel-nec-nl8048hl11.c   | 72 ++++++----------------
 1 file changed, 20 insertions(+), 52 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c
index b407173e27b1..33563953b2ff 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.c
@@ -7,12 +7,12 @@
  * Converted to new DSS device model: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-#include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/spi/spi.h>
+#include <linux/err.h>
 #include <linux/fb.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
 
 #include <video/omapfb_dss.h>
 
@@ -24,8 +24,7 @@ struct panel_drv_data {
 
 	int data_lines;
 
-	int res_gpio;
-	int qvga_gpio;
+	struct gpio_desc *res_gpio;
 
 	struct spi_device *spi;
 };
@@ -155,8 +154,8 @@ static int nec_8048_enable(struct omap_dss_device *dssdev)
 	if (r)
 		return r;
 
-	if (gpio_is_valid(ddata->res_gpio))
-		gpio_set_value_cansleep(ddata->res_gpio, 1);
+	/* Apparently existing DTSes use incorrect polarity (active high) */
+	gpiod_set_value_cansleep(ddata->res_gpio, 1);
 
 	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
@@ -171,8 +170,8 @@ static void nec_8048_disable(struct omap_dss_device *dssdev)
 	if (!omapdss_device_is_enabled(dssdev))
 		return;
 
-	if (gpio_is_valid(ddata->res_gpio))
-		gpio_set_value_cansleep(ddata->res_gpio, 0);
+	/* Apparently existing DTSes use incorrect polarity (active high) */
+	gpiod_set_value_cansleep(ddata->res_gpio, 0);
 
 	in->ops.dpi->disable(in);
 
@@ -222,35 +221,6 @@ static struct omap_dss_driver nec_8048_ops = {
 	.get_resolution	= omapdss_default_get_resolution,
 };
 
-
-static int nec_8048_probe_of(struct spi_device *spi)
-{
-	struct device_node *node = spi->dev.of_node;
-	struct panel_drv_data *ddata = dev_get_drvdata(&spi->dev);
-	struct omap_dss_device *in;
-	int gpio;
-
-	gpio = of_get_named_gpio(node, "reset-gpios", 0);
-	if (!gpio_is_valid(gpio)) {
-		dev_err(&spi->dev, "failed to parse enable gpio\n");
-		return gpio;
-	}
-	ddata->res_gpio = gpio;
-
-	/* XXX the panel spec doesn't mention any QVGA pin?? */
-	ddata->qvga_gpio = -ENOENT;
-
-	in = omapdss_of_find_source_for_first_ep(node);
-	if (IS_ERR(in)) {
-		dev_err(&spi->dev, "failed to find video source\n");
-		return PTR_ERR(in);
-	}
-
-	ddata->in = in;
-
-	return 0;
-}
-
 static int nec_8048_probe(struct spi_device *spi)
 {
 	struct panel_drv_data *ddata;
@@ -281,24 +251,22 @@ static int nec_8048_probe(struct spi_device *spi)
 
 	ddata->spi = spi;
 
-	r = nec_8048_probe_of(spi);
-	if (r)
+	ddata->in = omapdss_of_find_source_for_first_ep(spi->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&spi->dev, "failed to find video source: %d\n", r);
 		return r;
-
-	if (gpio_is_valid(ddata->qvga_gpio)) {
-		r = devm_gpio_request_one(&spi->dev, ddata->qvga_gpio,
-				GPIOF_OUT_INIT_HIGH, "lcd QVGA");
-		if (r)
-			goto err_gpio;
 	}
 
-	if (gpio_is_valid(ddata->res_gpio)) {
-		r = devm_gpio_request_one(&spi->dev, ddata->res_gpio,
-				GPIOF_OUT_INIT_LOW, "lcd RES");
-		if (r)
-			goto err_gpio;
+	ddata->res_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	r = PTR_ERR_OR_ZERO(ddata->res_gpio);
+	if (r) {
+		dev_err(&spi->dev, "failed to request reset gpio: %d\n", r);
+		goto err_gpio;
 	}
 
+	gpiod_set_consumer_name(ddata->res_gpio, "lcd RES");
+
 	ddata->videomode = nec_8048_panel_timings;
 
 	dssdev = &ddata->dssdev;

-- 
b4 0.11.0-dev-5166b
