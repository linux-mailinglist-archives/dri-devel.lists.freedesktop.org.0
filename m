Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09014FFB2D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BA910E68E;
	Wed, 13 Apr 2022 16:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B010E68E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLAWvv3DBB15A0w65Z9x4dMDjed4RBkXVK9BlI/ZARY=;
 b=OfVRCKRgmDIoT4jSfUHkoY65/igWOkjtx2Ej1ZsQGlUmKoo3Li6jmxOhWoAIZ1lxueqjcu
 /X5n+0uPYIlmQb0Hm1/iQKK20veNHN1tRHLJRXnYPRMKdyJblW+DuCRq6AXlHLr6Uj5EGV
 kEefPMz81YsiwAJQNu311DHP3DGFK6w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-cE9i5ZkLOWa-JL1Sx4u8uw-1; Wed, 13 Apr 2022 12:24:25 -0400
X-MC-Unique: cE9i5ZkLOWa-JL1Sx4u8uw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o6-20020a05600c510600b0038ec5f6d217so966828wms.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gLAWvv3DBB15A0w65Z9x4dMDjed4RBkXVK9BlI/ZARY=;
 b=MzUOlpcxQpVSqgkrMoKHYnsdCRtQozjkIAix8qN+Gj0KHLkkXGIi2j6Z1rYQDKs2Zg
 7RGB5u+QaYDQPD9hiB922xJQI5FTEG761/mh3I6kcpq7XfzdiR/zHeNUjf/MizXYhyQr
 oxu7rB/dmQYX9kBl1NfTnqrVs/whXMJUySwhOf9T0h66vp5mQC/eeuxpgnR1CiDVALo7
 MR5Nc3QbjVYea5mW9zSJBt7hRp02UR6Btc9bEBmywO1w4PkLWBl2P/F5AVJMjVwUlbrg
 +hPcir40XFscLOpa6apMZ6ErQEtKXosHTWoqb+5/BsN7MviQ2maFAfZoFURx+MRKJzXG
 gviA==
X-Gm-Message-State: AOAM530sDdQeLqeHa7V16AgXTuYLRmYKS1d/8Y9C4fSIC2sTUgsyME17
 TFxPM5+5Dyu8CmlEV4AKSG3jCzG+HoWp/8nChuiQs+BH8uvHJi0josedoAyh0+zS1lVvB4NTKct
 xw/c8zyQsge+y+NFQzl/dojOv/KVR
X-Received: by 2002:a05:600c:4f10:b0:38c:ae36:d305 with SMTP id
 l16-20020a05600c4f1000b0038cae36d305mr9314830wmq.34.1649867064461; 
 Wed, 13 Apr 2022 09:24:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZDXUz/pNL5Ei0UJZSqLYTOe1kFuMsi4p/6EK1KlLy9h1/uSiECIFiK/i26jAKZfTa0+UjmQ==
X-Received: by 2002:a05:600c:4f10:b0:38c:ae36:d305 with SMTP id
 l16-20020a05600c4f1000b0038cae36d305mr9314797wmq.34.1649867064202; 
 Wed, 13 Apr 2022 09:24:24 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfa2c9000000b002061561d4a7sm25446096wra.96.2022.04.13.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:24:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] drm/solomon: Move device info from ssd130x-i2c to the
 core driver
Date: Wed, 13 Apr 2022 18:23:57 +0200
Message-Id: <20220413162359.325021-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413162359.325021-1-javierm@redhat.com>
References: <20220413162359.325021-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are declared in the ssd130x-i2c transport driver but the information
is not I2C specific, and could be used by other SSD130x transport drivers.

Move them to the ssd130x core driver and just set the OF device entries to
an ID that could be used to lookup the correct device info from an array.

While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
bytes. Since even though they are used by the I2C interface, they could
also be useful for other transport protocols such as SPI.

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v4:
- Export ssd13x_variants array using EXPORT_SYMBOL_NS_GPL() (Andy Shevchenko)
- Use MODULE_IMPORT_NS(DRM_SSD130X) in the ssd130x-i2c driver (Andy Shevchenko)

Changes in v3:
- s/it/they in the commit description (Geert Uytterhoeven)
- Drop unnecessary blank line (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)

Changes in v2:
- Drop ssd13x_variant_to_info() and just use the array index (Neil Armstrong).

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 53 ++++++---------------------
 drivers/gpu/drm/solomon/ssd130x.c     | 35 ++++++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h     | 14 +++++++
 3 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index 45867ef2bc8b..b0dd218da13c 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -53,76 +53,43 @@ static void ssd130x_i2c_shutdown(struct i2c_client *client)
 	ssd130x_shutdown(ssd130x);
 }
 
-static struct ssd130x_deviceinfo ssd130x_sh1106_deviceinfo = {
-	.default_vcomh = 0x40,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 5,
-	.page_mode_only = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
-	.default_vcomh = 0x34,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 7,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
-	.default_vcomh = 0x20,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 8,
-	.need_chargepump = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
-	.default_vcomh = 0x20,
-	.default_dclk_div = 2,
-	.default_dclk_frq = 12,
-	.need_pwm = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
-	.default_vcomh = 0x34,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 10,
-};
-
 static const struct of_device_id ssd130x_of_match[] = {
 	{
 		.compatible = "sinowealth,sh1106",
-		.data = &ssd130x_sh1106_deviceinfo,
+		.data = &ssd130x_variants[SH1106_ID],
 	},
 	{
 		.compatible = "solomon,ssd1305",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = &ssd130x_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = &ssd130x_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = &ssd130x_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = &ssd130x_variants[SSD1309_ID],
 	},
 	/* Deprecated but kept for backward compatibility */
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = &ssd130x_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306fb-i2c",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = &ssd130x_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307fb-i2c",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = &ssd130x_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309fb-i2c",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = &ssd130x_variants[SSD1309_ID],
 	},
 	{ /* sentinel */ }
 };
@@ -139,6 +106,8 @@ static struct i2c_driver ssd130x_i2c_driver = {
 };
 module_i2c_driver(ssd130x_i2c_driver);
 
+
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(DRM_SSD130X);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a7e784518c69..ba2de93d00f0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -39,9 +39,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
-
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
@@ -94,6 +91,38 @@
 
 #define MAX_CONTRAST 255
 
+const struct ssd130x_deviceinfo ssd130x_variants[] = {
+	[SH1106_ID] = {
+		.default_vcomh = 0x40,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 5,
+		.page_mode_only = 1,
+	},
+	[SSD1305_ID] = {
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 7,
+	},
+	[SSD1306_ID] = {
+		.default_vcomh = 0x20,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 8,
+		.need_chargepump = 1,
+	},
+	[SSD1307_ID] = {
+		.default_vcomh = 0x20,
+		.default_dclk_div = 2,
+		.default_dclk_frq = 12,
+		.need_pwm = 1,
+	},
+	[SSD1309_ID] = {
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 10,
+	}
+};
+EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
+
 static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 {
 	return container_of(drm, struct ssd130x_device, drm);
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index f5b062576fdf..d14f78c2eb07 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -18,6 +18,18 @@
 
 #include <linux/regmap.h>
 
+#define SSD130X_DATA				0x40
+#define SSD130X_COMMAND				0x80
+
+enum ssd130x_variants {
+	SH1106_ID,
+	SSD1305_ID,
+	SSD1306_ID,
+	SSD1307_ID,
+	SSD1309_ID,
+	NR_SSD130X_VARIANTS
+};
+
 struct ssd130x_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
@@ -71,6 +83,8 @@ struct ssd130x_device {
 	u8 page_end;
 };
 
+extern const struct ssd130x_deviceinfo ssd130x_variants[];
+
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
 int ssd130x_remove(struct ssd130x_device *ssd130x);
 void ssd130x_shutdown(struct ssd130x_device *ssd130x);
-- 
2.35.1

