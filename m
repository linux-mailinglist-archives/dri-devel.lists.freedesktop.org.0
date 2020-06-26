Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C520BA63
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 22:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ECD6E483;
	Fri, 26 Jun 2020 20:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBAB6E483
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 20:37:47 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id t9so5846768lfl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8VvWqiFIWtVup4e72jzSlxxn0GFKf5oqDLPiC59QfuE=;
 b=JG/g+/r4y3iFTx3H+GpkfHiWCPPgdNXjIuEHe+Cgkj7VilW+GYxBJZgSlvP68qpLy6
 kRzxZnOTKqIuqiIxPCc34uulkwvPh5Du+BdFQLGpwJoBJwJJQV62P8Y3SDIkDnMqR5A7
 kx/AyESPeBU2C5jPQY9Uxwq0ls6FDNNkLLctyO1O8B9Wv/SaAUe/3zcXjd5eYOV+rroV
 P8hCaqtWgRFR3EwCQDfHVRdfazah+IVGGs8fqXlfUIfFBTpQWSxngn2Y8wL99nXrPumP
 6CMeT37hUGo/HoZcOw+ddsX/sCmIcDQbGT++pFIlxFkTs9XngDQmI3I36JK9TeKw+GuQ
 kvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8VvWqiFIWtVup4e72jzSlxxn0GFKf5oqDLPiC59QfuE=;
 b=mNcZtZw1m6OERjAfPPtZ9udfICcKcBXoKZN060ufdvpbRuci9RVdT9yw78dMVOagao
 6NwOXqnzDDiVClMjWTthE8Tal+vlVLKJQIiHNkW4CRoPPDiQzLFpNS81EbI52VokXzVV
 d41TBEkXJ95PySF++OGK9UltfwtdOXGBT7mokPxNHsNKuVqjG3uyJUO0BhYZZT4Usm4B
 uU5qtW7P3ZENGLL7aGziN9c5++hjaNEZEYJaqOqzSejo8b/tcrT5PpM+tQdKhIaVkTVd
 LbjcTMMNJd609K1BxBRvHmOKW8qIPF6Mh2jJ4xSMqhn+ySjvsh654qav4bKEDn6QmjAl
 45/A==
X-Gm-Message-State: AOAM532osEvjMoE8ft1CrGULMmrVqKVqrBUVJeSE4yE8AOJOarW50oXI
 7qX147LhegQSdQUOx6KPf4bMuQ==
X-Google-Smtp-Source: ABdhPJxxuQdYNlWESRMTKC2mT+5O0US+3zeR6qQhNXk8R3XtG+u7/FbZcEBHaBGVah85rzWncA97LA==
X-Received: by 2002:ac2:54b9:: with SMTP id w25mr2787980lfk.127.1593203865378; 
 Fri, 26 Jun 2020 13:37:45 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id a21sm475056ljn.2.2020.06.26.13.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:37:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] backlight: sky81452: Convert to GPIO descriptors
Date: Fri, 26 Jun 2020 22:37:41 +0200
Message-Id: <20200626203742.336780-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SKY81452 backlight driver just obtains a GPIO (named "gpios"
in the device tree) drives it high and leaves it high until the
driver is removed.

Switch to use GPIO descriptors for this, simple and
straight-forward.

Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/sky81452-backlight.c   | 18 ++++--------------
 .../linux/platform_data/sky81452-backlight.h   |  6 ++++--
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 2355f00f5773..81d2c8f3ca50 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -8,12 +8,11 @@
 
 #include <linux/backlight.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/platform_data/sky81452-backlight.h>
@@ -182,7 +181,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
 	pdata->ignore_pwm = of_property_read_bool(np, "skyworks,ignore-pwm");
 	pdata->dpwm_mode = of_property_read_bool(np, "skyworks,dpwm-mode");
 	pdata->phase_shift = of_property_read_bool(np, "skyworks,phase-shift");
-	pdata->gpio_enable = of_get_gpio(np, 0);
+	pdata->gpiod_enable = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
 
 	ret = of_property_count_u32_elems(np, "led-sources");
 	if (ret < 0) {
@@ -264,15 +263,6 @@ static int sky81452_bl_probe(struct platform_device *pdev)
 			return PTR_ERR(pdata);
 	}
 
-	if (gpio_is_valid(pdata->gpio_enable)) {
-		ret = devm_gpio_request_one(dev, pdata->gpio_enable,
-					GPIOF_OUT_INIT_HIGH, "sky81452-en");
-		if (ret < 0) {
-			dev_err(dev, "failed to request GPIO. err=%d\n", ret);
-			return ret;
-		}
-	}
-
 	ret = sky81452_bl_init_device(regmap, pdata);
 	if (ret < 0) {
 		dev_err(dev, "failed to initialize. err=%d\n", ret);
@@ -312,8 +302,8 @@ static int sky81452_bl_remove(struct platform_device *pdev)
 	bd->props.brightness = 0;
 	backlight_update_status(bd);
 
-	if (gpio_is_valid(pdata->gpio_enable))
-		gpio_set_value_cansleep(pdata->gpio_enable, 0);
+	if (pdata->gpiod_enable)
+		gpiod_set_value_cansleep(pdata->gpiod_enable, 0);
 
 	return 0;
 }
diff --git a/include/linux/platform_data/sky81452-backlight.h b/include/linux/platform_data/sky81452-backlight.h
index 02653d92d84f..d6f46670d923 100644
--- a/include/linux/platform_data/sky81452-backlight.h
+++ b/include/linux/platform_data/sky81452-backlight.h
@@ -9,11 +9,13 @@
 #ifndef _SKY81452_BACKLIGHT_H
 #define _SKY81452_BACKLIGHT_H
 
+#include <linux/gpio/consumer.h>
+
 /**
  * struct sky81452_platform_data
  * @name:	backlight driver name.
 		If it is not defined, default name is lcd-backlight.
- * @gpio_enable:GPIO number which control EN pin
+ * @gpios_enable:GPIO descriptor which control EN pin
  * @enable:	Enable mask for current sink channel 1, 2, 3, 4, 5 and 6.
  * @ignore_pwm:	true if DPWMI should be ignored.
  * @dpwm_mode:	true is DPWM dimming mode, otherwise Analog dimming mode.
@@ -23,7 +25,7 @@
  */
 struct sky81452_bl_platform_data {
 	const char *name;
-	int gpio_enable;
+	struct gpio_desc *gpiod_enable;
 	unsigned int enable;
 	bool ignore_pwm;
 	bool dpwm_mode;
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
