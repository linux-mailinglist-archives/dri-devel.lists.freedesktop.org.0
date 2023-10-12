Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB97C78B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 23:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF69F10E55A;
	Thu, 12 Oct 2023 21:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8510E555
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697146757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkC6CGVt6B2EFDFnQqGwpmVy6jkyZf+xEe/YzfT0L3A=;
 b=IYlT4YaU7cfomRDLKCLvPx9CLA+aqFvx68fTtI88tr7clGMCJfu96PluuWakYZHUC/PsD7
 b3jCLemXjrMyebPEkQv6CowsTX+lkBXFSV11iNNwpPiG5ANSXSeZ7Z8iMIVKOgSFT63rs9
 JxwvffFaD6R3CtNlm/WW1B8gQ42d96A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-VtEx9MjwMx2a9ZOATESXIQ-1; Thu, 12 Oct 2023 17:39:13 -0400
X-MC-Unique: VtEx9MjwMx2a9ZOATESXIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4066e59840eso10033225e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 14:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697146752; x=1697751552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkC6CGVt6B2EFDFnQqGwpmVy6jkyZf+xEe/YzfT0L3A=;
 b=om6AoA31u+CV+OrKe33ZS7dpNUNLrCN2vR2ymziOeQWp5L2Gq7P03mXmivvPOWQ6iu
 2tIVqvIINUZrvUBzA9fb/mJ1bMXjKpCFKVKV/BA2DyGXaq/baORHG/KEcHnHlibT4ycY
 BEbcQiB/vj8LonOoRddDCu+zvognuEeF42MLfMH4L//PEQ0xfxBUEL55o/0f57TIWf4Q
 Jzs9OJ+N12kisyOQ+kGaWctXfAI3z2rBId4q2DsPAS1063nSpvKvrDQUV8mPAw9y28/I
 uTHikl9nGvPEMPhfAK6Eaf8wV29Rn9Wxl7qHbuI9lZMSrtOfpOGPQhwjbGcaEseVnqNK
 Ch2Q==
X-Gm-Message-State: AOJu0YyzSIYJ8FrcGwPPTmPPdlCZlTWI1ZT9UyKvn53rQSd7Q3j8pk23
 mSLAYRerePorVnVBMl6UTgjxDp+aWOHcTlkzGb+fXfxUBZ/1Uq4GJrpH9DvIogQ8P8qq3L+1FFw
 UHYMJP8GzfHnvNG4CBF9WnP1wNSq7
X-Received: by 2002:a1c:6a16:0:b0:406:44fe:7621 with SMTP id
 f22-20020a1c6a16000000b0040644fe7621mr22351275wmc.25.1697146751714; 
 Thu, 12 Oct 2023 14:39:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxDanwadMWlx61NVs9pPQk+H2ABDAJobeabeQHVHY8JKXVhAUmB4fsyiDxy8zz1RQE2xwEDA==
X-Received: by 2002:a1c:6a16:0:b0:406:44fe:7621 with SMTP id
 f22-20020a1c6a16000000b0040644fe7621mr22351257wmc.25.1697146751372; 
 Thu, 12 Oct 2023 14:39:11 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w2-20020a05600c014200b003fc16ee2864sm795942wmm.48.2023.10.12.14.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 14:39:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
Date: Thu, 12 Oct 2023 23:38:34 +0200
Message-ID: <20231012213843.1151060-5-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012213843.1151060-1-javierm@redhat.com>
References: <20231012213843.1151060-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Solomon SSD132x controllers (such as the SSD1322, SSD1325 and SSD1327)
are used by 16 grayscale dot matrix OLED panels, extend the driver to also
support this chip family.

Instead adding an indirection level to allow the same modesetting pipeline
to be used by both controller families, add another pipeline for SSD132x.

This leads to some code duplication but it makes the driver easier to read
and understand. Once other controller families are added (e.g: SSD133x),
some common code can be factored out in driver helpers to be shared by the
different families. But that can be done later once these patterns emerge.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Use different modesetting pipelines for chip families (Thomas Zimmermann).
- Change the i,j variables type to unsigned int (Geert Uytterhoeven).

Changes in v2:
- Align the rectangle to the segment width (Geert Uytterhoeven).

 drivers/gpu/drm/solomon/Kconfig       |  12 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c |  17 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c |  21 +-
 drivers/gpu/drm/solomon/ssd130x.c     | 418 +++++++++++++++++++++++++-
 drivers/gpu/drm/solomon/ssd130x.h     |   7 +-
 5 files changed, 448 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
index e170716d976b..c3ee956c2bb9 100644
--- a/drivers/gpu/drm/solomon/Kconfig
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -1,31 +1,31 @@
 config DRM_SSD130X
-	tristate "DRM support for Solomon SSD130x OLED displays"
+	tristate "DRM support for Solomon SSD13xx OLED displays"
 	depends on DRM && MMU
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
-	  DRM driver for the SSD130x Solomon and SINO WEALTH SH110x OLED
+	  DRM driver for the SSD13xx Solomon and SINO WEALTH SH110x OLED
 	  controllers. This is only for the core driver, a driver for the
 	  appropriate bus transport in your chip also must be selected.
 
 	  If M is selected the module will be called ssd130x.
 
 config DRM_SSD130X_I2C
-	tristate "DRM support for Solomon SSD130x OLED displays (I2C bus)"
+	tristate "DRM support for Solomon SSD13xx OLED displays (I2C bus)"
 	depends on DRM_SSD130X && I2C
 	select REGMAP_I2C
 	help
-	  Say Y here if the SSD130x or SH110x OLED display is connected via
+	  Say Y here if the SSD13xx or SH110x OLED display is connected via
 	  I2C bus.
 
 	  If M is selected the module will be called ssd130x-i2c.
 
 config DRM_SSD130X_SPI
-	tristate "DRM support for Solomon SSD130X OLED displays (SPI bus)"
+	tristate "DRM support for Solomon SSD13xx OLED displays (SPI bus)"
 	depends on DRM_SSD130X && SPI
 	select REGMAP
 	help
-	  Say Y here if the SSD130x OLED display is connected via SPI bus.
+	  Say Y here if the SSD13xx OLED display is connected via SPI bus.
 
 	  If M is selected the module will be called ssd130x-spi.
diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index 8f89b89d553f..f2ccab9c06d9 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * DRM driver for Solomon SSD130x OLED displays (I2C bus)
+ * DRM driver for Solomon SSD13xx OLED displays (I2C bus)
  *
  * Copyright 2022 Red Hat Inc.
  * Author: Javier Martinez Canillas <javierm@redhat.com>
@@ -14,7 +14,7 @@
 #include "ssd130x.h"
 
 #define DRIVER_NAME	"ssd130x-i2c"
-#define DRIVER_DESC	"DRM driver for Solomon SSD130x OLED displays (I2C)"
+#define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays (I2C)"
 
 static const struct regmap_config ssd130x_i2c_regmap_config = {
 	.reg_bits = 8,
@@ -92,6 +92,19 @@ static const struct of_device_id ssd130x_of_match[] = {
 		.compatible = "solomon,ssd1309fb-i2c",
 		.data = &ssd130x_variants[SSD1309_ID],
 	},
+	/* ssd132x family */
+	{
+		.compatible = "solomon,ssd1322",
+		.data = &ssd130x_variants[SSD1322_ID],
+	},
+	{
+		.compatible = "solomon,ssd1325",
+		.data = &ssd130x_variants[SSD1325_ID],
+	},
+	{
+		.compatible = "solomon,ssd1327",
+		.data = &ssd130x_variants[SSD1327_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 89989da705d7..84e035a7ab3f 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * DRM driver for Solomon SSD130X OLED displays (SPI bus)
+ * DRM driver for Solomon SSD13xx OLED displays (SPI bus)
  *
  * Copyright 2022 Red Hat Inc.
  * Authors: Javier Martinez Canillas <javierm@redhat.com>
@@ -11,7 +11,7 @@
 #include "ssd130x.h"
 
 #define DRIVER_NAME	"ssd130x-spi"
-#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays (SPI)"
+#define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays (SPI)"
 
 struct ssd130x_spi_transport {
 	struct spi_device *spi;
@@ -129,6 +129,19 @@ static const struct of_device_id ssd130x_of_match[] = {
 		.compatible = "solomon,ssd1309",
 		.data = &ssd130x_variants[SSD1309_ID],
 	},
+	/* ssd132x family */
+	{
+		.compatible = "solomon,ssd1322",
+		.data = &ssd130x_variants[SSD1322_ID],
+	},
+	{
+		.compatible = "solomon,ssd1325",
+		.data = &ssd130x_variants[SSD1325_ID],
+	},
+	{
+		.compatible = "solomon,ssd1327",
+		.data = &ssd130x_variants[SSD1327_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
@@ -149,6 +162,10 @@ static const struct spi_device_id ssd130x_spi_table[] = {
 	{ "ssd1306", SSD1306_ID },
 	{ "ssd1307", SSD1307_ID },
 	{ "ssd1309", SSD1309_ID },
+	/* ssd132x family */
+	{ "ssd1322", SSD1322_ID },
+	{ "ssd1325", SSD1325_ID },
+	{ "ssd1327", SSD1327_ID },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b63c28f0e86e..b5c0602099ad 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * DRM driver for Solomon SSD130x OLED displays
+ * DRM driver for Solomon SSD13xx OLED displays
  *
  * Copyright 2022 Red Hat Inc.
  * Author: Javier Martinez Canillas <javierm@redhat.com>
@@ -37,13 +37,15 @@
 #include "ssd130x.h"
 
 #define DRIVER_NAME	"ssd130x"
-#define DRIVER_DESC	"DRM driver for Solomon SSD130x OLED displays"
+#define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays"
 #define DRIVER_DATE	"20220131"
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
 #define SSD130X_PAGE_HEIGHT 8
 
+#define SSD132X_SEGMENT_WIDTH 2
+
 /* ssd13xx commands */
 #define SSD13XX_CONTRAST			0x81
 #define SSD13XX_SET_SEG_REMAP			0xa0
@@ -99,6 +101,24 @@
 #define SSD130X_SET_AREA_COLOR_MODE_ENABLE	0x1e
 #define SSD130X_SET_AREA_COLOR_MODE_LOW_POWER	0x05
 
+/* ssd132x commands */
+#define SSD132X_SET_COL_RANGE			0x15
+#define SSD132X_SET_DEACTIVATE_SCROLL		0x2e
+#define SSD132X_SET_ROW_RANGE			0x75
+#define SSD132X_SET_DISPLAY_START		0xa1
+#define SSD132X_SET_DISPLAY_OFFSET		0xa2
+#define SSD132X_SET_DISPLAY_NORMAL		0xa4
+#define SSD132X_SET_FUNCTION_SELECT_A		0xab
+#define SSD132X_SET_PHASE_LENGTH		0xb1
+#define SSD132X_SET_CLOCK_FREQ			0xb3
+#define SSD132X_SET_GPIO			0xb5
+#define SSD132X_SET_PRECHARGE_PERIOD		0xb6
+#define SSD132X_SET_GRAY_SCALE_TABLE		0xb8
+#define SSD132X_SELECT_DEFAULT_TABLE		0xb9
+#define SSD132X_SET_PRECHARGE_VOLTAGE		0xbc
+#define SSD130X_SET_VCOMH_VOLTAGE		0xbe
+#define SSD132X_SET_FUNCTION_SELECT_B		0xd5
+
 #define MAX_CONTRAST 255
 
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
@@ -144,6 +164,22 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_width = 128,
 		.default_height = 64,
 		.family_id = SSD130X_FAMILY,
+	},
+	/* ssd132x family */
+	[SSD1322_ID] = {
+		.default_width = 480,
+		.default_height = 128,
+		.family_id = SSD132X_FAMILY,
+	},
+	[SSD1325_ID] = {
+		.default_width = 128,
+		.default_height = 80,
+		.family_id = SSD132X_FAMILY,
+	},
+	[SSD1327_ID] = {
+		.default_width = 128,
+		.default_height = 128,
+		.family_id = SSD132X_FAMILY,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
@@ -463,6 +499,96 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
+static int ssd132x_init(struct ssd130x_device *ssd130x)
+{
+	int ret;
+
+	/* Set initial contrast */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_CONTRAST, 0x80);
+	if (ret < 0)
+		return ret;
+
+	/* Set column start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_COL_RANGE, 0x00,
+				ssd130x->width / SSD132X_SEGMENT_WIDTH - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set row start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_ROW_RANGE, 0x00, ssd130x->height - 1);
+	if (ret < 0)
+		return ret;
+	/*
+	 * Horizontal Address Increment
+	 * Re-map for Column Address, Nibble and COM
+	 * COM Split Odd Even
+	 */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_SEG_REMAP, 0x53);
+	if (ret < 0)
+		return ret;
+
+	/* Set display start and offset */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_DISPLAY_START, 0x00);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_DISPLAY_OFFSET, 0x00);
+	if (ret < 0)
+		return ret;
+
+	/* Set display mode normal */
+	ret = ssd130x_write_cmd(ssd130x, 1, SSD132X_SET_DISPLAY_NORMAL);
+	if (ret < 0)
+		return ret;
+
+	/* Set multiplex ratio value */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set phase length */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PHASE_LENGTH, 0x55);
+	if (ret < 0)
+		return ret;
+
+	/* Select default linear gray scale table */
+	ret = ssd130x_write_cmd(ssd130x, 1, SSD132X_SELECT_DEFAULT_TABLE);
+	if (ret < 0)
+		return ret;
+
+	/* Set clock frequency */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_CLOCK_FREQ, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* Enable internal VDD regulator */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_FUNCTION_SELECT_A, 0x1);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge period */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_PERIOD, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge voltage */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_VOLTAGE, 0x08);
+	if (ret < 0)
+		return ret;
+
+	/* Set VCOMH voltage */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_VCOMH_VOLTAGE, 0x07);
+	if (ret < 0)
+		return ret;
+
+	/* Enable second pre-charge and internal VSL */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_FUNCTION_SELECT_B, 0x62);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
@@ -569,6 +695,64 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	return ret;
 }
 
+static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
+			       struct drm_rect *rect, u8 *buf,
+			       u8 *data_array)
+{
+	unsigned int x = rect->x1;
+	unsigned int y = rect->y1;
+	unsigned int segment_width = SSD132X_SEGMENT_WIDTH;
+	unsigned int width = drm_rect_width(rect);
+	unsigned int height = drm_rect_height(rect);
+	unsigned int columns = DIV_ROUND_UP(width, segment_width);
+	unsigned int rows = height;
+	struct drm_device *drm = &ssd130x->drm;
+	u32 array_idx = 0;
+	unsigned int i, j;
+	int ret;
+
+	drm_WARN_ONCE(drm, x % segment_width != 0, "x must be aligned to screen segment\n");
+
+	/*
+	 * The screen is divided in Segment and Common outputs, where
+	 * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
+	 * the columns.
+	 *
+	 * Each Segment has a 4-bit pixel and each Common output has a
+	 * row of pixels. When using the (default) horizontal address
+	 * increment mode, each byte of data sent to the controller has
+	 * two Segments (e.g: SEG0 and SEG1) that are stored in the lower
+	 * and higher nibbles of a single byte representing one column.
+	 * That is, the first byte are SEG0 (D0[3:0]) and SEG1 (D0[7:4]),
+	 * the second byte are SEG2 (D1[3:0]) and SEG3 (D1[7:4]) and so on.
+	 */
+
+	/* Set column start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_COL_RANGE, x / segment_width, columns - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set row start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_ROW_RANGE, y, rows - 1);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < height; i++) {
+		/* Process pair of pixels and combine them into a single byte */
+		for (j = 0; j < width; j += segment_width) {
+			u8 n1 = buf[i * width + j];
+			u8 n2 = buf[i * width + j + 1];
+
+			data_array[array_idx++] = (n2 << 4) | n1;
+		}
+	}
+
+	/* Write out update in one go since horizontal addressing mode is used */
+	ret = ssd130x_write_data(ssd130x, data_array, columns * rows);
+
+	return ret;
+}
+
 static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
 	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
@@ -610,6 +794,17 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 	}
 }
 
+static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
+{
+	unsigned int columns = DIV_ROUND_UP(ssd130x->height, SSD132X_SEGMENT_WIDTH);
+	unsigned int height = ssd130x->height;
+
+	memset(data_array, 0, columns * height);
+
+	/* Write out update in one go since horizontal addressing mode is used */
+	ssd130x_write_data(ssd130x, data_array, columns * height);
+}
+
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
 				struct drm_rect *rect,
@@ -640,6 +835,35 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 	return ret;
 }
 
+static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
+				const struct iosys_map *vmap,
+				struct drm_rect *rect, u8 *buf,
+				u8 *data_array)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	unsigned int dst_pitch = drm_rect_width(rect);
+	struct iosys_map dst;
+	int ret = 0;
+
+	/* Align x to display segment boundaries */
+	rect->x1 = round_down(rect->x1, SSD132X_SEGMENT_WIDTH);
+	rect->x2 = min_t(unsigned int, round_up(rect->x2, SSD132X_SEGMENT_WIDTH),
+			 ssd130x->width);
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	iosys_map_set_vaddr(&dst, buf);
+	drm_fb_xrgb8888_to_gray8(&dst, &dst_pitch, vmap, fb, rect);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+	ssd132x_update_rect(ssd130x, rect, buf, data_array);
+
+	return ret;
+}
+
 static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
@@ -677,6 +901,43 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_format_info *fi;
+	unsigned int pitch;
+	int ret;
+
+	if (!crtc)
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	ret = drm_plane_helper_atomic_check(plane, state);
+	if (ret)
+		return ret;
+
+	fi = drm_format_info(DRM_FORMAT_R8);
+	if (!fi)
+		return -EINVAL;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
+	if (!ssd130x_state->buffer)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 						struct drm_atomic_state *state)
 {
@@ -711,6 +972,40 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 	drm_dev_exit(idx);
 }
 
+static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct ssd130x_crtc_state *ssd130x_crtc_state =  to_ssd130x_crtc_state(crtc_state);
+	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_device *drm = plane->dev;
+	struct drm_rect dst_clip;
+	struct drm_rect damage;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		dst_clip = plane_state->dst;
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
+
+		ssd132x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
+				     ssd130x_plane_state->buffer,
+				     ssd130x_crtc_state->data_array);
+	}
+
+	drm_dev_exit(idx);
+}
+
 static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
@@ -735,6 +1030,30 @@ static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
 	drm_dev_exit(idx);
 }
 
+static void ssd132x_primary_plane_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	struct ssd130x_crtc_state *ssd130x_crtc_state;
+	int idx;
+
+	if (!plane_state->crtc)
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	ssd130x_crtc_state = to_ssd130x_crtc_state(crtc_state);
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	ssd132x_clear_screen(ssd130x, ssd130x_crtc_state->data_array);
+
+	drm_dev_exit(idx);
+}
+
 /* Called during init to allocate the plane's atomic state. */
 static void ssd130x_primary_plane_reset(struct drm_plane *plane)
 {
@@ -785,11 +1104,19 @@ static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
 	kfree(ssd130x_state);
 }
 
-static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = ssd130x_primary_plane_atomic_check,
-	.atomic_update = ssd130x_primary_plane_atomic_update,
-	.atomic_disable = ssd130x_primary_plane_atomic_disable,
+static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[] = {
+	[SSD130X_FAMILY] = {
+		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+		.atomic_check = ssd130x_primary_plane_atomic_check,
+		.atomic_update = ssd130x_primary_plane_atomic_update,
+		.atomic_disable = ssd130x_primary_plane_atomic_disable,
+	},
+	[SSD132X_FAMILY] = {
+		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+		.atomic_check = ssd132x_primary_plane_atomic_check,
+		.atomic_update = ssd132x_primary_plane_atomic_update,
+		.atomic_disable = ssd132x_primary_plane_atomic_disable,
+	}
 };
 
 static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
@@ -838,6 +1165,27 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
+	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
+	int ret;
+
+	ret = drm_crtc_helper_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	if (!ssd130x_state->data_array)
+		return -ENOMEM;
+
+	return 0;
+}
+
 /* Called during init to allocate the CRTC's atomic state. */
 static void ssd130x_crtc_reset(struct drm_crtc *crtc)
 {
@@ -890,9 +1238,15 @@ static void ssd130x_crtc_destroy_state(struct drm_crtc *crtc,
  * the primary plane's atomic_update function. Disabling clears
  * the screen in the primary plane's atomic_disable function.
  */
-static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
-	.mode_valid = ssd130x_crtc_mode_valid,
-	.atomic_check = ssd130x_crtc_atomic_check,
+static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs[] = {
+	[SSD130X_FAMILY] = {
+		.mode_valid = ssd130x_crtc_mode_valid,
+		.atomic_check = ssd130x_crtc_atomic_check,
+	},
+	[SSD132X_FAMILY] = {
+		.mode_valid = ssd130x_crtc_mode_valid,
+		.atomic_check = ssd132x_crtc_atomic_check,
+	},
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
@@ -930,6 +1284,31 @@ static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
 	return;
 }
 
+static void ssd132x_encoder_atomic_enable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	int ret;
+
+	ret = ssd130x_power_on(ssd130x);
+	if (ret)
+		return;
+
+	ret = ssd132x_init(ssd130x);
+	if (ret)
+		goto power_off;
+
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
+
+	backlight_enable(ssd130x->bl_dev);
+
+	return;
+
+power_off:
+	ssd130x_power_off(ssd130x);
+}
+
 static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
 					   struct drm_atomic_state *state)
 {
@@ -943,9 +1322,15 @@ static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
 	ssd130x_power_off(ssd130x);
 }
 
-static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs = {
-	.atomic_enable = ssd130x_encoder_atomic_enable,
-	.atomic_disable = ssd130x_encoder_atomic_disable,
+static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {
+	[SSD130X_FAMILY] = {
+		.atomic_enable = ssd130x_encoder_atomic_enable,
+		.atomic_disable = ssd130x_encoder_atomic_disable,
+	},
+	[SSD132X_FAMILY] = {
+		.atomic_enable = ssd132x_encoder_atomic_enable,
+		.atomic_disable = ssd130x_encoder_atomic_disable,
+	}
 };
 
 static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
@@ -1079,6 +1464,7 @@ static void ssd130x_parse_properties(struct ssd130x_device *ssd130x)
 
 static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 {
+	enum ssd130x_family_ids family_id = ssd130x->device_info->family_id;
 	struct drm_display_mode *mode = &ssd130x->mode;
 	struct device *dev = ssd130x->dev;
 	struct drm_device *drm = &ssd130x->drm;
@@ -1129,7 +1515,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 		return ret;
 	}
 
-	drm_plane_helper_add(primary_plane, &ssd130x_primary_plane_helper_funcs);
+	drm_plane_helper_add(primary_plane, &ssd130x_primary_plane_helper_funcs[family_id]);
 
 	drm_plane_enable_fb_damage_clips(primary_plane);
 
@@ -1143,7 +1529,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 		return ret;
 	}
 
-	drm_crtc_helper_add(crtc, &ssd130x_crtc_helper_funcs);
+	drm_crtc_helper_add(crtc, &ssd130x_crtc_helper_funcs[family_id]);
 
 	/* Encoder */
 
@@ -1155,7 +1541,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 		return ret;
 	}
 
-	drm_encoder_helper_add(encoder, &ssd130x_encoder_helper_funcs);
+	drm_encoder_helper_add(encoder, &ssd130x_encoder_helper_funcs[family_id]);
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index a5a25e054d2f..acf7cedf0c1a 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -25,7 +25,8 @@
 #define SSD13XX_COMMAND				0x80
 
 enum ssd130x_family_ids {
-	SSD130X_FAMILY
+	SSD130X_FAMILY,
+	SSD132X_FAMILY
 };
 
 enum ssd130x_variants {
@@ -35,6 +36,10 @@ enum ssd130x_variants {
 	SSD1306_ID,
 	SSD1307_ID,
 	SSD1309_ID,
+	/* ssd132x family */
+	SSD1322_ID,
+	SSD1325_ID,
+	SSD1327_ID,
 	NR_SSD130X_VARIANTS
 };
 
-- 
2.41.0

