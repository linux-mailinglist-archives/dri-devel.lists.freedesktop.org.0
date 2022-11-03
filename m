Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C60618BDC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDFB10E67F;
	Thu,  3 Nov 2022 22:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071710E66F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:18 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id j12so3302447plj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=360BA1N82fMOIR4MGY8NpQ3UKE6w+RNZ+cfUPneC8BU=;
 b=ASrot3lv/nM77+VsSVY+NZQ0quYbS12Gh6I2u8OmVJS7XtmilwVNyjBFYVkiupuLc8
 qVTTyNMG7ON+uGwfKsLN6ma8bjjS6YLeBaQvHQqxkU7SWnpd71a1EKE5gTy5wcOeRC04
 SMX39ScFx7GAgjnguz45yiktIj83MAmDE6TQzBmYPqmB8v29aIKe2rGgiZbfoQc3XTyP
 7FjJe8/E/IogGcZstVH+0ufkoQJLTp0oW6MFp0RrHktNhzVSOKqs0b7A4AfDdQne5SvI
 MLvcmFkHaTS58KHZs0iuW4yeQCLfo2u7i3JVGokmJGzLbRsl6G3D2dgj1eUeKNEtrcZh
 2Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=360BA1N82fMOIR4MGY8NpQ3UKE6w+RNZ+cfUPneC8BU=;
 b=fADoOow7b8c3SIq5P4GLsM5E3jv4mNsPigKfAwFKn9GeHXAHG9ZCNz2H7L34TjdtZA
 gUj33eUd3wTSWuGdeAkGL3yp/8csKtsMbYW4aKhVCU0qGpK1rHcuRiaKDxdWi5MbSJ+n
 Sx1SiVJezRpYk0KpuFm2PQiEBzuNOS1UmdSU19z6goJKpZZCh5JlWrAQCtkmTcqdErga
 SBDTR/h82K4zPJ2h05GLNCNHk85xDCB3rX6Ko2Jv9JWkIyUuUd19iy1tUTwGzk6eKE7g
 bxt0c0XSVDxGwNsGindrxq9zRnLgSPh2X61CZYpbA6qzk/qX+6FrqaavUFint9NZhUx/
 bZuQ==
X-Gm-Message-State: ACrzQf2JaCVWgyOWZ+V7wQJkfQ3UIHjavEYRbut1rFOupDx2Tvh2eoYb
 6djzYFg00vJ1tKmykCyV3WQ=
X-Google-Smtp-Source: AMsMyM5NCQUfBI0EA/kHy7qG4MsohP9o8SyxERK26P0fCpNSvmKwFFsH4jMo3ml7rN0r60SiWJI/MA==
X-Received: by 2002:a17:902:d2c9:b0:186:afd7:56d5 with SMTP id
 n9-20020a170902d2c900b00186afd756d5mr31629516plc.2.1667515637913; 
 Thu, 03 Nov 2022 15:47:17 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 04/13] omapfb: encoder-tfp410: switch to using gpiod API
Date: Thu,  3 Nov 2022 15:46:43 -0700
Message-Id: <20221103-omapfb-gpiod-v1-4-c3d53ca7988f@gmail.com>
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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   | 67 +++++++---------------
 1 file changed, 22 insertions(+), 45 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
index 09a59bd93d61..7bac420169a6 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
@@ -6,11 +6,12 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
 
@@ -18,7 +19,8 @@ struct panel_drv_data {
 	struct omap_dss_device dssdev;
 	struct omap_dss_device *in;
 
-	int pd_gpio;
+	struct gpio_desc *pd_gpio;
+
 	int data_lines;
 
 	struct omap_video_timings timings;
@@ -86,8 +88,8 @@ static int tfp410_enable(struct omap_dss_device *dssdev)
 	if (r)
 		return r;
 
-	if (gpio_is_valid(ddata->pd_gpio))
-		gpio_set_value_cansleep(ddata->pd_gpio, 1);
+	if (ddata->pd_gpio)
+		gpiod_set_value_cansleep(ddata->pd_gpio, 0);
 
 	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
@@ -102,8 +104,8 @@ static void tfp410_disable(struct omap_dss_device *dssdev)
 	if (!omapdss_device_is_enabled(dssdev))
 		return;
 
-	if (gpio_is_valid(ddata->pd_gpio))
-		gpio_set_value_cansleep(ddata->pd_gpio, 0);
+	if (ddata->pd_gpio)
+		gpiod_set_value_cansleep(ddata->pd_gpio, 1);
 
 	in->ops.dpi->disable(in);
 
@@ -162,33 +164,6 @@ static const struct omapdss_dvi_ops tfp410_dvi_ops = {
 	.get_timings	= tfp410_get_timings,
 };
 
-static int tfp410_probe_of(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-	struct omap_dss_device *in;
-	int gpio;
-
-	gpio = of_get_named_gpio(node, "powerdown-gpios", 0);
-
-	if (gpio_is_valid(gpio) || gpio == -ENOENT) {
-		ddata->pd_gpio = gpio;
-	} else {
-		dev_err(&pdev->dev, "failed to parse PD gpio\n");
-		return gpio;
-	}
-
-	in = omapdss_of_find_source_for_first_ep(node);
-	if (IS_ERR(in)) {
-		dev_err(&pdev->dev, "failed to find video source\n");
-		return PTR_ERR(in);
-	}
-
-	ddata->in = in;
-
-	return 0;
-}
-
 static int tfp410_probe(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata;
@@ -204,18 +179,21 @@ static int tfp410_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ddata);
 
-	r = tfp410_probe_of(pdev);
-	if (r)
+	ddata->pd_gpio = devm_gpiod_get_optional(&pdev->dev, "powerdown",
+						 GPIOD_OUT_HIGH);
+	r = PTR_ERR_OR_ZERO(ddata->pd_gpio);
+	if (r) {
+		dev_err(&pdev->dev, "Failed to request PD GPIO: %d\n", r);
 		return r;
+	}
+
+	gpiod_set_consumer_name(ddata->pd_gpio, "tfp410 PD");
 
-	if (gpio_is_valid(ddata->pd_gpio)) {
-		r = devm_gpio_request_one(&pdev->dev, ddata->pd_gpio,
-				GPIOF_OUT_INIT_LOW, "tfp410 PD");
-		if (r) {
-			dev_err(&pdev->dev, "Failed to request PD GPIO %d\n",
-					ddata->pd_gpio);
-			goto err_gpio;
-		}
+	ddata->in = omapdss_of_find_source_for_first_ep(pdev->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&pdev->dev, "failed to find video source: %d\n", r);
+		return r;
 	}
 
 	dssdev = &ddata->dssdev;
@@ -235,7 +213,6 @@ static int tfp410_probe(struct platform_device *pdev)
 
 	return 0;
 err_reg:
-err_gpio:
 	omap_dss_put_device(ddata->in);
 	return r;
 }

-- 
b4 0.11.0-dev-5166b
