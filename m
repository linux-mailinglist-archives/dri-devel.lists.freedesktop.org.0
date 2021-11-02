Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D969442B53
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 11:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CE36E934;
	Tue,  2 Nov 2021 10:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61B36E934
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 10:05:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d13so32378128wrf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iYLMuf3bD3yM/Xi9gc5DeQ7+ailWv3pCd20wKELPV+A=;
 b=cFnX21AjnJbHSPGd7EX5s7DI/2ObKunmpv40Y5AFsmpaHGoFigC1QQ5pzC3z5MD9mO
 hhFxZjOzFlZI54gPqvWGGlaYUi8wM32FpZkMDlA2coqGWnXH952IqqzxbmgccWT/ePwP
 afkf2peXtkXxbN48yhUYMpXUaLzrKSfeR5poiM2IPKp5IKWPxbMnLgRwfg2R7Kn1884P
 DHIFl8YIKWuOIQkoh+8ytDq2FG3fu2qoW78xcFJO+PPinwf+2OElqeJzCHZbahZbMJk5
 FENz9Zk5DDaZY3eloL50ChE0DGLz2gZwLIDTcgC9FynWWKbbD6pVvYyweWcAJgRiXcTs
 0ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iYLMuf3bD3yM/Xi9gc5DeQ7+ailWv3pCd20wKELPV+A=;
 b=A/QSinaeUJEULAK+vSae+Sh20AibTAYl1OquD2MtpFLPepCFH0CcZ9ru1lw9VQiQio
 k+ta37s9bg7esBDreVbjJIyU5ujdPNgVXfHw8ZptcRnYIwRoYXUJkWV8d5iv30UjJ4qd
 HEHIfiBkOVatMNJ0K479+71XmUDyqiBBI2lKquVfsamDdue7hrFqexu7TZ2cJQPfks4o
 ltyTgwcYanmL5Yvqa2zt5z0aHnseFxeD7yiyZk9bBSsmM5YSzMAnUQuMxj8C4ASL74dJ
 URGdiZjeA1Qq5tv+f8Yv7XbKk0G/KpaYf5KcnFyKyTj0qjxSrQcmFiFZ/sqFY5fMd/Gz
 GK7A==
X-Gm-Message-State: AOAM531q6uM5h1M9+a4noqvRHhjvztpkcfcneB7iITsAaTMxaVmtvPBT
 LAZhqEgkT52ut7OugPN2eyCbtQ==
X-Google-Smtp-Source: ABdhPJxt3bN1oRHkd5fsk2sQswWJgq8yAvVNc4ziZAfnf50krWHiOnJpCEsjC4BOSZeaqYq2/ywl3w==
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr34185086wrx.155.1635847532426; 
 Tue, 02 Nov 2021 03:05:32 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p13sm2315273wmi.0.2021.11.02.03.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:05:32 -0700 (PDT)
From: Corentin LABBE <clabbe@baylibre.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com
Subject: [PATCH] backlight: led_bl: Add support for an "enable" GPIO
Date: Tue,  2 Nov 2021 10:04:55 +0000
Message-Id: <20211102100455.2016610-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Corentin LABBE <clabbe@baylibre.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jean-Jacques Hiblot <jjhiblot@ti.com>

This patch adds support for an "enable GPIO".

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
---
 drivers/video/backlight/led_bl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index f54d256e2d54..ebd7acc32980 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -8,6 +8,7 @@
 
 #include <linux/backlight.h>
 #include <linux/leds.h>
+#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
@@ -15,6 +16,7 @@ struct led_bl_data {
 	struct device		*dev;
 	struct backlight_device	*bl_dev;
 	struct led_classdev	**leds;
+	struct gpio_desc        *enable_gpio;
 	bool			enabled;
 	int			nb_leds;
 	unsigned int		*levels;
@@ -35,6 +37,9 @@ static void led_bl_set_brightness(struct led_bl_data *priv, int level)
 	for (i = 0; i < priv->nb_leds; i++)
 		led_set_brightness(priv->leds[i], bkl_brightness);
 
+	if (!priv->enabled)
+		gpiod_set_value_cansleep(priv->enable_gpio, 1);
+
 	priv->enabled = true;
 }
 
@@ -48,6 +53,9 @@ static void led_bl_power_off(struct led_bl_data *priv)
 	for (i = 0; i < priv->nb_leds; i++)
 		led_set_brightness(priv->leds[i], LED_OFF);
 
+	if (priv->enabled)
+		gpiod_set_value_cansleep(priv->enable_gpio, 0);
+
 	priv->enabled = false;
 }
 
@@ -209,6 +217,11 @@ static int led_bl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->bl_dev);
 	}
 
+	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(priv->enable_gpio))
+		return PTR_ERR(priv->enable_gpio);
+
 	for (i = 0; i < priv->nb_leds; i++)
 		led_sysfs_disable(priv->leds[i]);
 
-- 
2.25.1

