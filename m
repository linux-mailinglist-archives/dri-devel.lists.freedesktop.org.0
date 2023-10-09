Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003987BE999
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5A610E2BB;
	Mon,  9 Oct 2023 18:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FDA10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmdLaoW0F30jKaDHNrK6iK6jvqeSrkXDxHFhLB7O+XU=;
 b=P8ycxarBzFOoqTAp0L7JrNkPCBYgXpPfai/7Tn92jkPWx1HatHm8xLHJ4u8Mq/1jSICsH7
 9edLJwHnSCByG2FawIAI3R/S6TPBUyhJRT7h3QmEVvWG2DqMcDrkeAqATremBq9YI5/2qJ
 ifh/9RBrDcQ5wvDqIE6QPY+l4A4BHrM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-f0BObbASNz-NZg6ERElh-w-1; Mon, 09 Oct 2023 14:36:08 -0400
X-MC-Unique: f0BObbASNz-NZg6ERElh-w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-324810f3bfcso2512666f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876567; x=1697481367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmdLaoW0F30jKaDHNrK6iK6jvqeSrkXDxHFhLB7O+XU=;
 b=JC5iqtvPbPP0aDXCYsJlyRaUT3nQGECPcrXsTvXo91fcZk44alIoP8edHIhAtqgfOl
 0bHOqoMw2CJqIdPxLU7/FNlGIirRK3WJ64ARZWarXMJA3SOf4Zw3o2NCuhwyWOEPaIij
 Vxtykvqxug5iirqaWNmkhTVdM34trOBCDKTFvRu8NfachlBM8S9RxcohHVuh+15LTmy0
 dUT2I+QEPUkhY6s8sTrtV1WQNKW1bmUZCYCY53lVKfEvhtWOKMSCLt9/NV9Uyc5gme4f
 X1QcWaZrrIZmmlYvCUIwdET6CIDurldivtpgBHO7GMj1V8JMiKNpIyjT/t7U+6AOpUrR
 aGWQ==
X-Gm-Message-State: AOJu0Yw+hCthUjlh3iXODOb8bZ1TmOTGUvma1iE4e75LNiF1YUJ6J0+g
 a9qwkLGWLjBSsb1rgXreZZ1fR2n6hFhLZAIKDNGcvYLSHS9p8hc4KPe5O1yyw303mEc5+T2EvZo
 /7PngK1z1pcCFjCTE3srPb+MIm1j8
X-Received: by 2002:a05:600c:4f51:b0:403:aced:f7f4 with SMTP id
 m17-20020a05600c4f5100b00403acedf7f4mr11347604wmq.12.1696876567021; 
 Mon, 09 Oct 2023 11:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPiQQ2IHRmlkRAdSD3xtyc6wwq0bdpnugNy/1WSPvCyhAo3jLFf0Py7gaFUOe0tOZxAO9qMw==
X-Received: by 2002:a05:600c:4f51:b0:403:aced:f7f4 with SMTP id
 m17-20020a05600c4f5100b00403acedf7f4mr11347585wmq.12.1696876566650; 
 Mon, 09 Oct 2023 11:36:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c230100b0040644e699a0sm14171296wmo.45.2023.10.09.11.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] drm/ssd13xx: Rename commands that are shared across chip
 families
Date: Mon,  9 Oct 2023 20:34:20 +0200
Message-ID: <20231009183522.543918-7-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183522.543918-1-javierm@redhat.com>
References: <20231009183522.543918-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some commands that are shared between the SSD130x and SSD132x
controller families, define these as a common SSD13XX set of commands.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd13xx-spi.c |  4 +--
 drivers/gpu/drm/solomon/ssd13xx.c     | 45 +++++++++++++++------------
 drivers/gpu/drm/solomon/ssd13xx.h     |  4 +--
 3 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd13xx-spi.c b/drivers/gpu/drm/solomon/ssd13xx-spi.c
index a5ebe5475a49..2416756686cc 100644
--- a/drivers/gpu/drm/solomon/ssd13xx-spi.c
+++ b/drivers/gpu/drm/solomon/ssd13xx-spi.c
@@ -34,10 +34,10 @@ static int ssd13xx_spi_write(void *context, const void *data, size_t count)
 	struct spi_device *spi = t->spi;
 	const u8 *reg = data;
 
-	if (*reg == SSD130X_COMMAND)
+	if (*reg == SSD13XX_COMMAND)
 		gpiod_set_value_cansleep(t->dc, 0);
 
-	if (*reg == SSD130X_DATA)
+	if (*reg == SSD13XX_DATA)
 		gpiod_set_value_cansleep(t->dc, 1);
 
 	/* Remove control byte since is not used in a 4-wire SPI interface */
diff --git a/drivers/gpu/drm/solomon/ssd13xx.c b/drivers/gpu/drm/solomon/ssd13xx.c
index 5a426ac10c58..b30224856518 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.c
+++ b/drivers/gpu/drm/solomon/ssd13xx.c
@@ -44,18 +44,24 @@
 
 #define SSD130X_PAGE_HEIGHT 8
 
+/* ssd13xx commands */
+#define SSD13XX_CONTRAST			0x81
+#define SSD13XX_SET_SEG_REMAP			0xa0
+#define SSD13XX_SET_MULTIPLEX_RATIO		0xa8
+#define SSD13XX_DISPLAY_OFF			0xae
+#define SSD13XX_DISPLAY_ON			0xaf
+
+#define SSD13XX_SET_SEG_REMAP_MASK		GENMASK(0, 0)
+#define SSD13XX_SET_SEG_REMAP_SET(val)		FIELD_PREP(SSD13XX_SET_SEG_REMAP_MASK, (val))
+
+/* ssd130x commands */
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
 #define SSD130X_SET_COL_RANGE			0x21
 #define SSD130X_SET_PAGE_RANGE			0x22
-#define SSD130X_CONTRAST			0x81
 #define SSD130X_SET_LOOKUP_TABLE		0x91
 #define SSD130X_CHARGE_PUMP			0x8d
-#define SSD130X_SET_SEG_REMAP			0xa0
-#define SSD130X_DISPLAY_OFF			0xae
-#define SSD130X_SET_MULTIPLEX_RATIO		0xa8
-#define SSD130X_DISPLAY_ON			0xaf
 #define SSD130X_START_PAGE_ADDRESS		0xb0
 #define SSD130X_SET_COM_SCAN_DIR		0xc0
 #define SSD130X_SET_DISPLAY_OFFSET		0xd3
@@ -65,13 +71,12 @@
 #define SSD130X_SET_COM_PINS_CONFIG		0xda
 #define SSD130X_SET_VCOMH			0xdb
 
+/* ssd130x commands accessors */
 #define SSD130X_PAGE_COL_START_MASK		GENMASK(3, 0)
 #define SSD130X_PAGE_COL_START_HIGH_SET(val)	FIELD_PREP(SSD130X_PAGE_COL_START_MASK, (val) >> 4)
 #define SSD130X_PAGE_COL_START_LOW_SET(val)	FIELD_PREP(SSD130X_PAGE_COL_START_MASK, (val))
 #define SSD130X_START_PAGE_ADDRESS_MASK		GENMASK(2, 0)
 #define SSD130X_START_PAGE_ADDRESS_SET(val)	FIELD_PREP(SSD130X_START_PAGE_ADDRESS_MASK, (val))
-#define SSD130X_SET_SEG_REMAP_MASK		GENMASK(0, 0)
-#define SSD130X_SET_SEG_REMAP_SET(val)		FIELD_PREP(SSD130X_SET_SEG_REMAP_MASK, (val))
 #define SSD130X_SET_COM_SCAN_DIR_MASK		GENMASK(3, 3)
 #define SSD130X_SET_COM_SCAN_DIR_SET(val)	FIELD_PREP(SSD130X_SET_COM_SCAN_DIR_MASK, (val))
 #define SSD130X_SET_CLOCK_DIV_MASK		GENMASK(3, 0)
@@ -171,20 +176,20 @@ static inline struct ssd13xx_device *drm_to_ssd13xx(struct drm_device *drm)
 }
 
 /*
- * Helper to write data (SSD130X_DATA) to the device.
+ * Helper to write data (SSD13XX_DATA) to the device.
  */
 static int ssd13xx_write_data(struct ssd13xx_device *ssd13xx, u8 *values, int count)
 {
-	return regmap_bulk_write(ssd13xx->regmap, SSD130X_DATA, values, count);
+	return regmap_bulk_write(ssd13xx->regmap, SSD13XX_DATA, values, count);
 }
 
 /*
- * Helper to write command (SSD130X_COMMAND). The fist variadic argument
+ * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
  * is the command to write and the following are the command options.
  *
  * Note that the ssd13xx protocol requires each command and option to be
- * written as a SSD130X_COMMAND device register value. That is why a call
- * to regmap_write(..., SSD130X_COMMAND, ...) is done for each argument.
+ * written as a SSD13XX_COMMAND device register value. That is why a call
+ * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
  */
 static int ssd13xx_write_cmd(struct ssd13xx_device *ssd13xx, int count,
 			     /* u8 cmd, u8 option, ... */...)
@@ -197,7 +202,7 @@ static int ssd13xx_write_cmd(struct ssd13xx_device *ssd13xx, int count,
 
 	do {
 		value = va_arg(ap, int);
-		ret = regmap_write(ssd13xx->regmap, SSD130X_COMMAND, value);
+		ret = regmap_write(ssd13xx->regmap, SSD13XX_COMMAND, value);
 		if (ret)
 			goto out_end;
 	} while (--count);
@@ -341,13 +346,13 @@ static int ssd130x_init(struct ssd13xx_device *ssd13xx)
 	int ret;
 
 	/* Set initial contrast */
-	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_CONTRAST, ssd13xx->contrast);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD13XX_CONTRAST, ssd13xx->contrast);
 	if (ret < 0)
 		return ret;
 
 	/* Set segment re-map */
-	seg_remap = (SSD130X_SET_SEG_REMAP |
-		     SSD130X_SET_SEG_REMAP_SET(ssd13xx->seg_remap));
+	seg_remap = (SSD13XX_SET_SEG_REMAP |
+		     SSD13XX_SET_SEG_REMAP_SET(ssd13xx->seg_remap));
 	ret = ssd13xx_write_cmd(ssd13xx, 1, seg_remap);
 	if (ret < 0)
 		return ret;
@@ -360,7 +365,7 @@ static int ssd130x_init(struct ssd13xx_device *ssd13xx)
 		return ret;
 
 	/* Set multiplex ratio value */
-	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd13xx->height - 1);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd13xx->height - 1);
 	if (ret < 0)
 		return ret;
 
@@ -918,7 +923,7 @@ static void ssd13xx_encoder_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	ssd13xx_write_cmd(ssd13xx, 1, SSD130X_DISPLAY_ON);
+	ssd13xx_write_cmd(ssd13xx, 1, SSD13XX_DISPLAY_ON);
 
 	backlight_enable(ssd13xx->bl_dev);
 
@@ -937,7 +942,7 @@ static void ssd13xx_encoder_atomic_disable(struct drm_encoder *encoder,
 
 	backlight_disable(ssd13xx->bl_dev);
 
-	ssd13xx_write_cmd(ssd13xx, 1, SSD130X_DISPLAY_OFF);
+	ssd13xx_write_cmd(ssd13xx, 1, SSD13XX_DISPLAY_OFF);
 
 	ssd13xx_power_off(ssd13xx);
 }
@@ -1013,7 +1018,7 @@ static int ssd13xx_update_bl(struct backlight_device *bdev)
 
 	ssd13xx->contrast = brightness;
 
-	ret = ssd13xx_write_cmd(ssd13xx, 1, SSD130X_CONTRAST);
+	ret = ssd13xx_write_cmd(ssd13xx, 1, SSD13XX_CONTRAST);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/solomon/ssd13xx.h b/drivers/gpu/drm/solomon/ssd13xx.h
index e78d5ab87474..399b0c8b5680 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.h
+++ b/drivers/gpu/drm/solomon/ssd13xx.h
@@ -22,8 +22,8 @@
 #include <linux/regmap.h>
 #include <linux/iosys-map.h>
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
+#define SSD13XX_DATA				0x40
+#define SSD13XX_COMMAND				0x80
 
 enum ssd13xx_family_ids {
 	SSD130X_FAMILY,
-- 
2.41.0

