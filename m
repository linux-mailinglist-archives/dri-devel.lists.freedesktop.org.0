Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNhlC9asb2ncEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFAC477C2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E463810E5E0;
	Tue, 20 Jan 2026 12:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EhmJHSDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EE510E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:50:57 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so34059375ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768913457; x=1769518257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LroXmq9J3VVORG7m8L/kGtxBgy95TWF72WU3KxUKLtI=;
 b=EhmJHSDg3S/PJrtmDxEH7SsWu+WjqJK431XWYvIZYB7/jtMFK/YScP9l1y1t7dCnLO
 LnLYTOIrQk4K4SDXvmSnycD4EgDp8wFY8k+qVi6IWAw0knxX9ByL0w0bNtT9s0csvdSr
 m8ZZXzvZh27i7fvHgCUUWR4Hop1OrQ1GIFFHmMVOuo0qVNRF6mJo3NMdJhUur9eRS1ha
 mDRIMM7+VH81lNIoL7F0bYKVQQMlngwv0a1TveDeVOcmkaAIXqTqk22r8wXW+lcgfkXt
 K2FUKYG87yMmF+W/rTuN18I5G9mPpnQfkF5Wr8wlnPXl2ojdv65yujra+fBA+DSoZitB
 4PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768913457; x=1769518257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LroXmq9J3VVORG7m8L/kGtxBgy95TWF72WU3KxUKLtI=;
 b=e2kNMQ/Tv0DZ+eaIbeVrSo2O6Or1f8Bmu8jX/4wnzQRi0GJDpwMNbnV7KR17CHGP7x
 ttg8qv3kmn1A4jw7GdVTc0s79jkYn6/frFX2PQqJzxBaO3tSZ/hX1bibzL4Ba10Jql0o
 OY+I9tJuIviLPDumWgrO4ngWdXbLITZSvQ0G/mDfNAHrK3ryhUi9uTJRCJ4Jm2X4kJ7O
 B+Jk+ZEo5E8/QlNCAHJFzfmjHuKea+/hr8TfFRovkopkLaz0uS67or2YLJGZ7YVAaCxK
 AWe49tZrhBmEPj9H7lQcVeLLn+IdbztOoFUnyg2WdpxM57+b+iNXwVAApAhG3OZI9LO3
 4z6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUybNvzlfIO0sYfhNTN3da/w3ef3pKX8Q/lKa2ncZdwdbMGnUyOL+7FM5qMaYqWY0XB4hQlKsetoqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwViDKPv/Trz1ESn0rig8BDoAuGxo8YceFXdoOLdSL2Q8LiMarf
 I5g7ajzRimkMHg0RXNAXPbKJKeb1ziTyfQ7MArE/JZrdShzRqHG9w2HA
X-Gm-Gg: AZuq6aKW1G43qUX80MmSFQ7rmHj+RUzAtzudkGYQrEZfP2p4cpToc/FufmLxD/UYpzg
 dx5l7I5TWmj8LHkLT4PZvHE6IKJOAsHdhh98/hvPgI58y65glcslvIxrF5qKbHsweN5LSwN7LpK
 4la79fFLGvG9zXEXPJygBAFxGQ5XaPEAwm0os+w4shZEhdItR8bdX7cMzJcmga7gmvRNAl3W6vL
 N8Y65L0XewMdPiMxCRCtw7DUU/7UwmYGdCpTcxskmbVUfgCJaCJ2ejLAtXtdN9v+76O2d3FcfbD
 AhGlKXUO9B+FdzFbxBYyIIMQPl3n14YdS6iM8cPwGLrL0p7uT4p5w/vgLjlskwvCU41oacY6WyF
 wpLvNHBdb+Ly2lcBVofEtXbPeJDccTjU+yGGmntmMTBRtMPmWamgHrt468+AQVi8nhO9+ovrLCf
 qztbXz30CERn3/UUfXS3dGVjImoQHFj5M6iQkQ
X-Received: by 2002:a17:903:2ec5:b0:2a0:8859:3722 with SMTP id
 d9443c01a7336-2a769ae664fmr16859025ad.25.1768913457332; 
 Tue, 20 Jan 2026 04:50:57 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dd582sm124973815ad.52.2026.01.20.04.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 04:50:56 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v2 2/2] backlight: gpio: add support for multiple GPIOs for
 backlight control
Date: Tue, 20 Jan 2026 18:20:36 +0530
Message-Id: <20260120125036.2203995-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120125036.2203995-1-tessolveupstream@gmail.com>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tessolveupstream@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 8BFAC477C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio-backlight driver currently supports only a single GPIO to
enable or disable a backlight device. Some panels require multiple
enable GPIOs to be asserted together.

Extend the driver to support an array of GPIOs for a single backlight
instance. All configured GPIOs are toggled together based on the
backlight state.

Existing single-GPIO Device Tree users remain unaffected.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 66 ++++++++++++++++--------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 728a546904b0..11d21de82cf5 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -14,17 +14,29 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/bitmap.h>
 
 struct gpio_backlight {
 	struct device *dev;
-	struct gpio_desc *gpiod;
+	struct gpio_descs *gpiods;
+	unsigned long *bitmap;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
+	unsigned int n = gbl->gpiods->ndescs;
+	int br = backlight_get_brightness(bl);
 
-	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
+	if (br)
+		bitmap_fill(gbl->bitmap, n);
+	else
+		bitmap_zero(gbl->bitmap, n);
+
+	gpiod_set_array_value_cansleep(n,
+				       gbl->gpiods->desc,
+				       gbl->gpiods->info,
+				       gbl->bitmap);
 
 	return 0;
 }
@@ -48,26 +60,43 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct device_node *of_node = dev->of_node;
-	struct backlight_properties props;
+	struct backlight_properties props = { };
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	int ret, init_brightness, def_value;
+	bool def_value;
+	enum gpiod_flags flags;
+	unsigned int n;
+	int words;
 
-	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
-	if (gbl == NULL)
+	gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
+	if (!gbl)
 		return -ENOMEM;
 
 	if (pdata)
 		gbl->dev = pdata->dev;
 
 	def_value = device_property_read_bool(dev, "default-on");
+	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+	gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
+	if (IS_ERR(gbl->gpiods)) {
+		if (PTR_ERR(gbl->gpiods) == -ENODEV)
+			return dev_err_probe(dev, -EINVAL,
+			"The gpios parameter is missing or invalid\n");
+		return PTR_ERR(gbl->gpiods);
+	}
 
-	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod))
-		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
-				     "The gpios parameter is missing or invalid\n");
+	n = gbl->gpiods->ndescs;
+	if (!n)
+		return dev_err_probe(dev, -EINVAL,
+			"No GPIOs provided\n");
+
+	words = BITS_TO_LONGS(n);
+	gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
+				   GFP_KERNEL);
+	if (!gbl->bitmap)
+		return -ENOMEM;
 
-	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = 1;
 	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
@@ -81,21 +110,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	if (!of_node || !of_node->phandle)
 		/* Not booted with device tree or no phandle link to the node */
 		bl->props.power = def_value ? BACKLIGHT_POWER_ON
-					    : BACKLIGHT_POWER_OFF;
-	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
+						    : BACKLIGHT_POWER_OFF;
+	else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
 		bl->props.power = BACKLIGHT_POWER_OFF;
 	else
 		bl->props.power = BACKLIGHT_POWER_ON;
 
-	bl->props.brightness = 1;
-
-	init_brightness = backlight_get_brightness(bl);
-	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-	if (ret) {
-		dev_err(dev, "failed to set initial brightness\n");
-		return ret;
-	}
+	bl->props.brightness = def_value ? 1 : 0;
 
+	gpio_backlight_update_status(bl);
+
 	platform_set_drvdata(pdev, bl);
 	return 0;
 }
-- 
2.34.1

