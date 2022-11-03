Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF0618BE2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BF610E66F;
	Thu,  3 Nov 2022 22:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA0310E66F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:25 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id io19so3292004plb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3X26rknx/0lmJfmFIFsGeakVjwS4PgAaf3ahk4arl/w=;
 b=ilB526eKd/8ilrwsSPLckfywAou4hodKS50T45woYDzwYbHHxHLDfVcpcf+cpFnUmU
 KI18gsRBZPVocj1QAyOt7zGP+TX6dD61vLTVVv+Ke6Mn3nxeYlpKCL6yqxAcaTgwaaYL
 T5NoSU2vMGWlu3QPxPmrbDYZzmXw2cJ2tdn2VGadOy0LQVjZVW2wpxRYsofemPIrZE3X
 J627uMC4StcVgXpdeY0/TZz1CGsh2wl3zR10pnZ5ekAxHFKy9DYBq/70vKpdKPAASjVl
 o5ihnTIGo2yqoAOdizkiVs1MJFx2Uwly9txneCdEysBNjNdBaNW56b7ZRrQSdhoBk4NE
 vvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3X26rknx/0lmJfmFIFsGeakVjwS4PgAaf3ahk4arl/w=;
 b=SXyxnxckLauP8BAMKWZCwGmhBrzJFP/aq6qZAO/1bUCi2q3xB+QSvGlHxQ61pmHMeA
 PssSlMpEcKWFnULYwy/VnyOQhynAnJZ6mGAnr13EZvNG/oKv4Nop0b1o2XE4jatbokY6
 BvJIx2bUlIM2Z/YXJG67YRH0khZJkwWIEgU8O2F2YRbo2YsZvUNqVLGWys/5F1IhblJK
 Fxfe3oCjJnGoUmFLTRjEO7H7pv9w94TotFnn6uqVzRCa823LD8o+Iaxp74bQKzsY61Or
 H9u9Hr9rCgBJtW8b7jAwzi5V0IKgFzzVL5SIokPaoS3+HIX/LczaRAYj5LDytnXPyJRM
 K6rA==
X-Gm-Message-State: ACrzQf1GcDobCDsR7CfkxznOmj0vbv1VsGZfEUTvPZDBlLtGj/b/Q+H4
 JWP9GlC52HtMb4vk3J1gLrE=
X-Google-Smtp-Source: AMsMyM4IK3WWfZjxdVGCdvLQJUqFVt5Ge+7F+td9f7w7jnXE/NGyg/cSHud+HpRmlrEzKuoWVdrfOw==
X-Received: by 2002:a17:90a:eb0c:b0:213:8ff3:a46a with SMTP id
 j12-20020a17090aeb0c00b002138ff3a46amr38528966pjz.158.1667515645445; 
 Thu, 03 Nov 2022 15:47:25 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 06/13] omapfb: panel-tpo-td043mtea1: switch to using gpiod API
Date: Thu,  3 Nov 2022 15:46:47 -0700
Message-Id: <20221103-omapfb-gpiod-v1-6-c3d53ca7988f@gmail.com>
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
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   | 59 ++++++----------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
index c0e4e0315b6b..1eaa35c27835 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
@@ -10,10 +10,9 @@
 #include <linux/delay.h>
 #include <linux/spi/spi.h>
 #include <linux/regulator/consumer.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/err.h>
 #include <linux/slab.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
 
@@ -58,7 +57,7 @@ struct panel_drv_data {
 
 	struct spi_device *spi;
 	struct regulator *vcc_reg;
-	int nreset_gpio;
+	struct gpio_desc *reset_gpio;
 	u16 gamma[12];
 	u32 mode;
 	u32 hmirror:1;
@@ -296,8 +295,7 @@ static int tpo_td043_power_on(struct panel_drv_data *ddata)
 	/* wait for panel to stabilize */
 	msleep(160);
 
-	if (gpio_is_valid(ddata->nreset_gpio))
-		gpio_set_value(ddata->nreset_gpio, 1);
+	gpiod_set_value_cansleep(ddata->reset_gpio, 0);
 
 	tpo_td043_write(ddata->spi, 2,
 			TPO_R02_MODE(ddata->mode) | TPO_R02_NCLK_RISING);
@@ -320,8 +318,7 @@ static void tpo_td043_power_off(struct panel_drv_data *ddata)
 	tpo_td043_write(ddata->spi, 3,
 			TPO_R03_VAL_STANDBY | TPO_R03_EN_PWM);
 
-	if (gpio_is_valid(ddata->nreset_gpio))
-		gpio_set_value(ddata->nreset_gpio, 0);
+	gpiod_set_value_cansleep(ddata->reset_gpio, 1);
 
 	/* wait for at least 2 vsyncs before cutting off power */
 	msleep(50);
@@ -454,32 +451,6 @@ static struct omap_dss_driver tpo_td043_ops = {
 	.get_resolution	= omapdss_default_get_resolution,
 };
 
-
-static int tpo_td043_probe_of(struct spi_device *spi)
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
-	ddata->nreset_gpio = gpio;
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
 static int tpo_td043_probe(struct spi_device *spi)
 {
 	struct panel_drv_data *ddata;
@@ -508,9 +479,12 @@ static int tpo_td043_probe(struct spi_device *spi)
 
 	ddata->spi = spi;
 
-	r = tpo_td043_probe_of(spi);
-	if (r)
+	ddata->in = omapdss_of_find_source_for_first_ep(spi->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&spi->dev, "failed to find video source: %d\n", r);
 		return r;
+	}
 
 	ddata->mode = TPO_R02_MODE_800x480;
 	memcpy(ddata->gamma, tpo_td043_def_gamma, sizeof(ddata->gamma));
@@ -521,16 +495,15 @@ static int tpo_td043_probe(struct spi_device *spi)
 		goto err_regulator;
 	}
 
-	if (gpio_is_valid(ddata->nreset_gpio)) {
-		r = devm_gpio_request_one(&spi->dev,
-				ddata->nreset_gpio, GPIOF_OUT_INIT_LOW,
-				"lcd reset");
-		if (r < 0) {
-			dev_err(&spi->dev, "couldn't request reset GPIO\n");
-			goto err_gpio_req;
-		}
+	ddata->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
+	r = PTR_ERR_OR_ZERO(ddata->reset_gpio);
+	if (r) {
+		dev_err(&spi->dev, "couldn't request reset GPIO\n");
+		goto err_gpio_req;
 	}
 
+	gpiod_set_consumer_name(ddata->reset_gpio, "lcd reset");
+
 	r = sysfs_create_group(&spi->dev.kobj, &tpo_td043_attr_group);
 	if (r) {
 		dev_err(&spi->dev, "failed to create sysfs files\n");

-- 
b4 0.11.0-dev-5166b
