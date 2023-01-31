Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966196839C2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 23:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0A910E39E;
	Tue, 31 Jan 2023 22:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193A10E39F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 22:57:15 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id z1so9116879plg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 14:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q69dgLqN6kO5gAwOLys8/HsP5kHBTFUQsrWWIDgTKOA=;
 b=WlyQM2M1BRD/grSwpqjxowafQRbiTF3h/qMkf/UVUkLbjBuEdMjv/YbDWF3nXuur7J
 JCEAelUYFgODW5vL5AuDv6QOf0M3DbsAD/JGdQPzHgmeE7ntQ5+7RGUhF/4zRQ90Wicq
 n4jHkleJL3sHGKF/VrjyrrxqRNpKig2VyaDskDKO5fLtRJYZadqIYNMS0GHYQA+dRicp
 LPV2tCE3RYgEdwlxXKY4TucbW1z0acQjT0v9qi9MmWqjZY0XwdhXjjErQCugoCq9+jHa
 WGk7K3pdwkd0bkwOntpa0dCzo5qCLmdpYm03D8NPTFlk6NF8jwS67G0IcfsSt6bajPOJ
 5NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q69dgLqN6kO5gAwOLys8/HsP5kHBTFUQsrWWIDgTKOA=;
 b=MDHB3UCTTG85vhiWc8P0k/sxNT8xC7IvnPlZKBf3Cu/irfmBjXEOApRFnnBhPkH32W
 FCBUvvC64ryRnJU6Pb+FCPuHlL7m7zcv9wBRbtymHEa7C0opxh+CGDu5IOXqS2zLbNH3
 FxVPN1L8BwqHPJN5t5L7Oo2ZMem7OiIPshlH6fMiCWdh6PXI2GUXXUo9RwFE4+/7GE6w
 Akb+JcKC4o7Jo0excJPGMQHfCbHSQn24diFJ34hOw4Pe/HeyRx6Lih5dZUFJw9zJzGDo
 v5Ip2TYsJ/nDkmYPxN29CR1z6KlY2wTxYFz0gyn7JKItmx7k78EIzUDiCBbFIQIzA5Gj
 M2Sg==
X-Gm-Message-State: AO0yUKU+RSjdbIlL7/zLsz3vlOV2YY09TIQDzyvsMU3/qzr2vAWe5Xjr
 tx9CgNrA1AmLe9zKW8kcDSE=
X-Google-Smtp-Source: AK7set9PKo7V/pKdXXqVAGSTAu7KzGfvjB03OhbiIWYP7LFi7RALAmjSfrliCkYrGmvTRSQ1DeTDpw==
X-Received: by 2002:a17:903:2053:b0:194:3cef:31 with SMTP id
 q19-20020a170903205300b001943cef0031mr487814pla.49.1675205835275; 
 Tue, 31 Jan 2023 14:57:15 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:effb:a74f:225a:28ef])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170902b20300b001963bc7bdb8sm10229945plr.274.2023.01.31.14.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 14:57:13 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 2/2] backlight: hx8357: stop using of-specific APIs
Date: Tue, 31 Jan 2023 14:57:07 -0800
Message-Id: <20230131225707.3599889-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
References: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
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
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need for this driver to be OF-specific, so switch it to
use device_get_match_data() and stop including various of-related
headers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/video/backlight/hx8357.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index a93e14adb846..2e162a70c1ce 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -10,8 +10,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/spi/spi.h>
 
 #define HX8357_NUM_IM_PINS	3
@@ -581,11 +581,15 @@ MODULE_DEVICE_TABLE(of, hx8357_dt_ids);
 
 static int hx8357_probe(struct spi_device *spi)
 {
+	int (*lcd_init_fn)(struct lcd_device *);
 	struct lcd_device *lcdev;
 	struct hx8357_data *lcd;
-	const struct of_device_id *match;
 	int i, ret;
 
+	lcd_init_fn = device_get_match_data(&spi->dev);
+	if (!lcd_init_fn)
+		return -EINVAL;
+
 	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
 	if (!lcd)
 		return -ENOMEM;
@@ -598,10 +602,6 @@ static int hx8357_probe(struct spi_device *spi)
 
 	lcd->spi = spi;
 
-	match = of_match_device(hx8357_dt_ids, &spi->dev);
-	if (!match || !match->data)
-		return -EINVAL;
-
 	lcd->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
 	ret = PTR_ERR_OR_ZERO(lcd->reset);
 	if (ret) {
@@ -647,7 +647,7 @@ static int hx8357_probe(struct spi_device *spi)
 
 	hx8357_lcd_reset(lcdev);
 
-	ret = ((int (*)(struct lcd_device *))match->data)(lcdev);
+	ret = lcd_init_fn(lcdev);
 	if (ret) {
 		dev_err(&spi->dev, "Couldn't initialize panel\n");
 		return ret;
-- 
2.39.1.456.gfc5497dd1b-goog

