Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2FCF2870
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 09:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3548C10E3A6;
	Mon,  5 Jan 2026 08:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RHRrUKZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC7D10E37A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 08:51:44 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34c3259da34so14542967a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 00:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767603104; x=1768207904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFt+oA/6TnGUcf1mQLhvyTPCz7K2SXMiNJhoCpH+0PQ=;
 b=RHRrUKZeIRydoWEaazpVXwqD952RlvQntQI7Gt+PrIwPDk1B9hzKITsmoqp4Tdb9H2
 biMOvQWcGr9oVZSxEkKTOjvI571AGKf4Q93+kWSw+CrQqYLL4ZZ7LmJfz5mQn+GANN0b
 /gc1gi2s4XuPX0lgzIKLAP2MleVjzRpOt26JdZgfeXihSw2Znerpg1m48bUAqR6cpyxn
 eR8r82FZc2zTfUjQnViwv73qtu/M0P+oiiJ+V5GrWYakjKn/x9+IXd3RIfXg+PKUMVC3
 460KGk/ZEpnvzOewp1+nigA93/umlo3/AYRje+1EzAF5u1S4+cYLlGCzIoUk+8Wv8AYI
 +HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767603104; x=1768207904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bFt+oA/6TnGUcf1mQLhvyTPCz7K2SXMiNJhoCpH+0PQ=;
 b=Erul6U4aaRXl6G5vwFdYMTO1h2lAHIqQuU0TXZdU07O2Ok6xMIPL4yRCbzD3wolQvC
 dsZyjueNNAeXaMxuba1ptDzgvmCtJ9uOyWskxUkYKSBC/kY00spdC908fUSynf9nSKCb
 z+eWT4FwQnus0f11qCul8Biuexa58dBwzRDDPB67o5bAshMSeTOkyAeEyfQ1CWHtGCxF
 /84UtQsnG350kSOuVbi8zNN3r05fKuOcrn8n5cUrkKzRfY7WfBYwZMHJS2P1P0o6JQRE
 1NWMl8KvVKB1Sex96SG6HQqyrpfZtuJ1JAH0QuPVodfd0F5uGCYuQE3P7JewTQNj1H6l
 m0uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs6Ynaum5cqjtw7wQoY1CBN+66CeGcq30Yz9n9f3Ve/2SJN6mQDAaxKk6KqrsFcvJLVCsf03ADOHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqAZflgqrQQjRrkRwf05K95VVPBWEF/6lmhMA/a0tpsa7DSEFL
 CEKJDW3dJMIb9iZ8x58zOvXgi6WZzWS+ffQLAwlc8vlLp/G+MVllvnms
X-Gm-Gg: AY/fxX5geJ9r5b/lUzHJxHIfddbdEVKTQk4qQ/+v75IboIvh4OsUDLksvZ882ilQxka
 RtyDg1GktgwUkKtJfGdR6M5RIpQAiyni5S/w9AjQyZG/j99SyxCLoLFlkKUl2mHMXLkORiyj1Dz
 t9c6IcM6BFoC3tEku92pwCU5lJ5hZydHoFqKq0dDGuRE4GNPgTT6ZP4J9Yw5CXoiMxDH0DSXgMf
 fBUdfjwu1/i8OLfn50HhmgGF7QL1bDegcNDWkDlcEmNWaxRWt6jFDQIqPOVQZQJvD/EXmVPhRbL
 cLoewl9rMjaQxSvWN7/jFz50/YdlvAz6F2PDaGXFnrkCeRbm808y6zBuY/5We2moyT15KZDqtUV
 l+isQueab0G2jyncYZkZ73gk7BBxPapImpv2oKJ+NMtRKRkcoq1GFMZHCqJrbPlJWNkytDizTZn
 hbHCpMzHapVM335W5syHtZnClAFKgTVIwoybk6
X-Google-Smtp-Source: AGHT+IE9h/a5pga/RcO3GaC9CZMJm/hBktjxAoM256+iS35FTfAipE1WuhDdgjBTuxYdSkDNtweQhg==
X-Received: by 2002:a17:90a:d60c:b0:34c:4c6d:ad0f with SMTP id
 98e67ed59e1d1-34e921f0e35mr38658346a91.37.1767603103621; 
 Mon, 05 Jan 2026 00:51:43 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f476fab12sm5631951a91.5.2026.01.05.00.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 00:51:43 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs for
 backlight control
Date: Mon,  5 Jan 2026 14:21:20 +0530
Message-Id: <20260105085120.230862-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105085120.230862-1-tessolveupstream@gmail.com>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the gpio-backlight driver to handle multiple GPIOs instead of a
single one. This allows panels that require driving several enable pins
to be controlled by the backlight framework.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 728a546904b0..037e1c111e48 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,14 +17,18 @@
 
 struct gpio_backlight {
 	struct device *dev;
-	struct gpio_desc *gpiod;
+	struct gpio_desc **gpiods;
+	unsigned int num_gpios;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
+	unsigned int i;
+	int br = backlight_get_brightness(bl);
 
-	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
+	for (i = 0; i < gbl->num_gpios; i++)
+		gpiod_set_value_cansleep(gbl->gpiods[i], br);
 
 	return 0;
 }
@@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
+	unsigned int i;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	def_value = device_property_read_bool(dev, "default-on");
 
-	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod))
-		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
-				     "The gpios parameter is missing or invalid\n");
+	gbl->num_gpios = gpiod_count(dev, NULL);
+	if (gbl->num_gpios == 0)
+		return dev_err_probe(dev, -EINVAL,
+			"The gpios parameter is missing or invalid\n");
+	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
+				   GFP_KERNEL);
+	if (!gbl->gpiods)
+		return -ENOMEM;
+
+	for (i = 0; i < gbl->num_gpios; i++) {
+		gbl->gpiods[i] =
+			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
+		if (IS_ERR(gbl->gpiods[i]))
+			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
+					"Failed to get GPIO at index %u\n", i);
+	}
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
@@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	}
 
 	/* Set the initial power state */
-	if (!of_node || !of_node->phandle)
+	if (!of_node || !of_node->phandle) {
 		/* Not booted with device tree or no phandle link to the node */
 		bl->props.power = def_value ? BACKLIGHT_POWER_ON
-					    : BACKLIGHT_POWER_OFF;
-	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		bl->props.power = BACKLIGHT_POWER_OFF;
-	else
-		bl->props.power = BACKLIGHT_POWER_ON;
+						    : BACKLIGHT_POWER_OFF;
+	} else {
+		bool all_high = true;
+
+		for (i = 0; i < gbl->num_gpios; i++) {
+			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
+				all_high = false;
+				break;
+			}
+		}
+
+		bl->props.power =
+			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
+	}
 
 	bl->props.brightness = 1;
 
 	init_brightness = backlight_get_brightness(bl);
-	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-	if (ret) {
-		dev_err(dev, "failed to set initial brightness\n");
-		return ret;
+
+	for (i = 0; i < gbl->num_gpios; i++) {
+		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					"failed to set gpio %u direction\n",
+					i);
 	}
 
 	platform_set_drvdata(pdev, bl);
-- 
2.34.1

