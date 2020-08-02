Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F5235669
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B496E0DA;
	Sun,  2 Aug 2020 11:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED9C6E0DA
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v9so2250163ljk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OEiIRV3pc8UpuqgDES2NNuOp/a7HeTK8TQKtuuWaxLg=;
 b=ed9E+hySXLn/uTk8dulXO1IJx6Es11NNwWrW7V8o9Ir4siVmtLZP1PYzuetvokwbFt
 PRH6xI3F8I8jg1LxsjglezHzx3bTC4dwqXvCT0e+4QyumSET/dm/roUeUcnv1EB40LuL
 OK4i8mp7I7AnpCwwJvahX9RazyA2wvnjZGnHlhy+sQNJEdKdZaPQJaihpcnwPUnWWZOv
 94mDvk7m+8gsoxaug7v3E6mrh6YUsX1qXP5m/yZCQsfkp4ISG0W30Xo5DsRQRdofuVLo
 YfjQS1fH7EqNbgS42EXfA9NnAGnqETw7tB70N3ETEJZk6h48AGsVBZlu3jYW/XAxOANw
 oagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OEiIRV3pc8UpuqgDES2NNuOp/a7HeTK8TQKtuuWaxLg=;
 b=o+t7Yy3cboIAPwsv2gUyxCUVW5j/Ex751o3CdBJWDiOLYWNz1ZpHR4PW1vPjbidlvh
 V6d4Su1GhaGpVGItnc9aKmmlwgqhVD21PND20r1LF04IsL4JIKUueSto3z/iSKQXO76P
 EjU5Anzm7joYtmmjVXgRGi9/P7ypTnb7n3E+ZF2ObjUKGw5OI+3AHhJ68lthzJ7jY9TL
 8kW22KIdV5qBm79uxuVOhKrx1AHeGBfhBfYmowGeLx3EPUfWgBdue3AoeoGRrvwVL4i5
 sGebIqqPbjxJZ4cKUo/u68ICq3ZBK13OBOT4aIyNrN9X9qEHDzx7Kz93B5YsEVGPguYr
 6BKQ==
X-Gm-Message-State: AOAM530Zys2g2xDassGi9GUsxktCNVD+Apqv9hOCGK1gabKz8/pkMjjp
 mrG2B89NeCZBRWdiB+naFbxA10S6TN8=
X-Google-Smtp-Source: ABdhPJwusc/OylRkpDuOruha2Pq6R+Cf+INW1sJOQ5PrYeAj/PQxiJkAv4S7Gmt+asibNktvyym20Q==
X-Received: by 2002:a2e:5811:: with SMTP id m17mr4170587ljb.96.1596366437368; 
 Sun, 02 Aug 2020 04:07:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 04/22] backlight: gpio: Use DECLARE_BACKLIGHT_INIT_RAW and
 get/setters
Date: Sun,  2 Aug 2020 13:06:18 +0200
Message-Id: <20200802110636.1018743-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce use of DECLARE_BACKLIGHT_INIT_RAW when registering the
backlight. This makes the device registration a little simpler.

Use get/set operations for power thus avoid the use of the
rather confusion power states.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6f78d928f054..c94fbfa755c4 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -49,7 +49,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct device_node *of_node = dev->of_node;
-	struct backlight_properties props;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 1, 1);
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
@@ -72,9 +72,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	memset(&props, 0, sizeof(props));
-	props.type = BACKLIGHT_RAW;
-	props.max_brightness = 1;
 	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
 					    &gpio_backlight_ops, &props);
 	if (IS_ERR(bl)) {
@@ -85,15 +82,15 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	/* Set the initial power state */
 	if (!of_node || !of_node->phandle)
 		/* Not booted with device tree or no phandle link to the node */
-		bl->props.power = def_value ? FB_BLANK_UNBLANK
-					    : FB_BLANK_POWERDOWN;
+		if (def_value)
+			backlight_set_power_on(bl);
+		else
+			backlight_set_power_off(bl);
 	else if (gpiod_get_direction(gbl->gpiod) == 0 &&
 		 gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		bl->props.power = FB_BLANK_POWERDOWN;
+		backlight_set_power_off(bl);
 	else
-		bl->props.power = FB_BLANK_UNBLANK;
-
-	bl->props.brightness = 1;
+		backlight_set_power_on(bl);
 
 	init_brightness = backlight_get_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
