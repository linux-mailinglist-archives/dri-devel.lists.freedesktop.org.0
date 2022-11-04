Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16385618EB4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DAD10E06B;
	Fri,  4 Nov 2022 03:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9CE10E058
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:16:55 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id k22so3399643pfd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vESVsop4ZB+nxJMme9WqcQCG5NESqBZw6q6kC1WMIIw=;
 b=PZKdhoMLbT0Q3wcy5njb/+FOYlfWcqBjMzdoeLUeT8U5lV7KYOXsQiPt9Wj03zExMH
 vtBa9/PDAvfkik0KWRk0NEISIji91MpaRtHCekvMaGIlmVk05bBQr/cu6yb5HPZNCtAo
 y9vmjpRjg6PqjyBXReyMeKa4P6I1jVx397kWHUBrpfXeHPCVBOfnayoqjV9PsO4pKyvV
 nSN1Ey2unqmR25h5BAk2DwUdIWJwK0UpSKScksxLWI/JJUA+gtLONsgY9dh5ug91AgBl
 kUYqPZ4aKoUGvIZw0CJ7Wam9Yv2BgpWicqW0UvaTDXO5yf1+77D1R79HAZtM/lub/zpH
 Dihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vESVsop4ZB+nxJMme9WqcQCG5NESqBZw6q6kC1WMIIw=;
 b=Em9rKxaoEOvue/xdaDF594yaO0DSYvZEFxON8Nu6OdjU32Ga/ifcOyY8242fyJIUcZ
 laTPisnwKyCBm3v8ADptiGytG6N96eolwokbc/lDQkO5FsMwqQci5QATz5PD9GbfxZLQ
 JxAsCfFbMOheFF/uJyWShqMyhlQvKd8aUidXbKMJX+3nL1slF4tvKFKmQJ7sN7NDqMrY
 pu7FEreM1EE6Nboadfxnui6Was0M2rB6abPfd4kMkW2I5OZ5udJrQJwH9WeSjuH7zP9E
 ul0xtlszwGVS8YBASia0Pskf+ULDbCNpBH4UngSpX3eiJL3Q1wL4YZjECIBJ2ZnA7OCk
 x1pg==
X-Gm-Message-State: ACrzQf2/eAQdUVoZDd+5efFgZbSsjrZdpdpsZMZl6FzqVcBIOMu7ePr0
 +yppgizxMUxB1cLwjH0gHNw=
X-Google-Smtp-Source: AMsMyM6WTIZNRWCJ/EFiNOK59q4zh1HTLYptlZ44M+of4zld3TkEXXJt5pFrkW6rUJ77EohOyw+8pg==
X-Received: by 2002:a63:fc0b:0:b0:46f:87a8:97aa with SMTP id
 j11-20020a63fc0b000000b0046f87a897aamr27223139pgi.234.1667531814293; 
 Thu, 03 Nov 2022 20:16:54 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:16:53 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 04/13] omapfb: encoder-tfp410: switch to using gpiod API
Date: Thu,  3 Nov 2022 20:16:33 -0700
Message-Id: <20221103-omapfb-gpiod-v1-4-cba1fae5a77c@gmail.com>
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
b4 0.11.0-dev-28747
