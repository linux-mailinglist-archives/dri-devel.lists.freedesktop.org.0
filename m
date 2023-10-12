Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82577C65F5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864AA10E41C;
	Thu, 12 Oct 2023 06:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352C110E41B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697093915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbsERzeT3jnb5o5YFZrdLE3LWYsb5XXvHLDGk8NAZlo=;
 b=c9R+jhmsFTP1/oZO3btJGlCcVjG9NU+fxTWgJcLb06+e2i8en/X/+IJ1NN47UtarsATs2m
 n3qBSb4YovJaQ0UIbjtWw6M9jzSHuy5dXYk+Lc+xklQ8TBioCsGyN7DEGjSTONvR65M36R
 zlBXK+GhrC7O42HY2zAo17ZXs44z87o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Moh_pA_vNQKJlmv44a5evg-1; Thu, 12 Oct 2023 02:58:31 -0400
X-MC-Unique: Moh_pA_vNQKJlmv44a5evg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4065ca278b3so4255375e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697093910; x=1697698710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbsERzeT3jnb5o5YFZrdLE3LWYsb5XXvHLDGk8NAZlo=;
 b=eZwwegylqCoivPF4usYQ9fzNvq0OIuvlibf2C5lWAdli2P/YzQrQTmg0E39T1Do7V3
 0IzE4PITA0c7PwhPWO64u7w/0rOvCOeq5IAEioYUVGwekNDWzS8USHeuqI7S0w5BnZ0z
 jyONXRxAWckkaPdV1/YZaXiiYpfjXnRWTkvfth/uJRwz2nNUB/rl9AzNjCl3saubRmJm
 f7pg9EDYLvNRdTGgrF+K9TowsgB4+Jb9s7ZTeJ/wvpdVyRDiY2jOX+Dc1iWX8jMPR9gm
 IS2EychT3t6epcSGcQ8evq7miF9wh6uWLiCvwNjyPENOGfPaUgYlr395ja5sGFG4U6e7
 cBUw==
X-Gm-Message-State: AOJu0YzyOjdo7wU3KV7zwkm1mXAdhxPc/WsOVDTkFkcq82rxDl/5kwMO
 HbC3KV+q4yy5aMcpAdKSk6iEJ0tu+6xWf9u14Ye2HIGhZRL6MVBXhn9ggdKufEUQNXSmqJqiWph
 ZqXO+tgcWTeaELkhhtsIxqjZsLMuA
X-Received: by 2002:a05:600c:2a4e:b0:405:7b92:4558 with SMTP id
 x14-20020a05600c2a4e00b004057b924558mr20487260wme.38.1697093910694; 
 Wed, 11 Oct 2023 23:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgJzbQNEzAB6ZdCvzsNzh6fsLq1aZMB/U2BnI6StTZOdjov24IXGVQE30teq0qC1byjrf3hQ==
X-Received: by 2002:a05:600c:2a4e:b0:405:7b92:4558 with SMTP id
 x14-20020a05600c2a4e00b004057b924558mr20487243wme.38.1697093910332; 
 Wed, 11 Oct 2023 23:58:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b003fe2b081661sm21102290wmm.30.2023.10.11.23.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 23:58:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] drm/ssd130x: Rename commands that are shared across
 chip families
Date: Thu, 12 Oct 2023 08:58:12 +0200
Message-ID: <20231012065822.1007930-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012065822.1007930-1-javierm@redhat.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some commands that are shared between the SSD130x and SSD132x
controller families, define these as a common SSD13XX set of commands.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x-spi.c |  4 +--
 drivers/gpu/drm/solomon/ssd130x.c     | 47 +++++++++++++++------------
 drivers/gpu/drm/solomon/ssd130x.h     |  4 +--
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 257819bccbc8..89989da705d7 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -34,10 +34,10 @@ static int ssd130x_spi_write(void *context, const void *data, size_t count)
 	struct spi_device *spi = t->spi;
 	const u8 *reg = data;
 
-	if (*reg == SSD130X_COMMAND)
+	if (*reg == SSD13XX_COMMAND)
 		gpiod_set_value_cansleep(t->dc, 0);
 
-	if (*reg == SSD130X_DATA)
+	if (*reg == SSD13XX_DATA)
 		gpiod_set_value_cansleep(t->dc, 1);
 
 	/* Remove control byte since is not used in a 4-wire SPI interface */
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 08885c33e1a6..4bdc06d6aed4 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
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
@@ -177,20 +182,20 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 }
 
 /*
- * Helper to write data (SSD130X_DATA) to the device.
+ * Helper to write data (SSD13XX_DATA) to the device.
  */
 static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
 {
-	return regmap_bulk_write(ssd130x->regmap, SSD130X_DATA, values, count);
+	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
 }
 
 /*
- * Helper to write command (SSD130X_COMMAND). The fist variadic argument
+ * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
  * is the command to write and the following are the command options.
  *
- * Note that the ssd130x protocol requires each command and option to be
- * written as a SSD130X_COMMAND device register value. That is why a call
- * to regmap_write(..., SSD130X_COMMAND, ...) is done for each argument.
+ * Note that the ssd13xx protocol requires each command and option to be
+ * written as a SSD13XX_COMMAND device register value. That is why a call
+ * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
  */
 static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 			     /* u8 cmd, u8 option, ... */...)
@@ -203,7 +208,7 @@ static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 
 	do {
 		value = va_arg(ap, int);
-		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, value);
+		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, value);
 		if (ret)
 			goto out_end;
 	} while (--count);
@@ -347,13 +352,13 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 	int ret;
 
 	/* Set initial contrast */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_CONTRAST, ssd130x->contrast);
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_CONTRAST, ssd130x->contrast);
 	if (ret < 0)
 		return ret;
 
 	/* Set segment re-map */
-	seg_remap = (SSD130X_SET_SEG_REMAP |
-		     SSD130X_SET_SEG_REMAP_SET(ssd130x->seg_remap));
+	seg_remap = (SSD13XX_SET_SEG_REMAP |
+		     SSD13XX_SET_SEG_REMAP_SET(ssd130x->seg_remap));
 	ret = ssd130x_write_cmd(ssd130x, 1, seg_remap);
 	if (ret < 0)
 		return ret;
@@ -366,7 +371,7 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 		return ret;
 
 	/* Set multiplex ratio value */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
 	if (ret < 0)
 		return ret;
 
@@ -951,7 +956,7 @@ static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
 
@@ -970,7 +975,7 @@ static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
 
 	backlight_disable(ssd130x->bl_dev);
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_OFF);
 
 	ssd130x_power_off(ssd130x);
 }
@@ -1046,7 +1051,7 @@ static int ssd130x_update_bl(struct backlight_device *bdev)
 
 	ssd130x->contrast = brightness;
 
-	ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_CONTRAST);
+	ret = ssd130x_write_cmd(ssd130x, 1, SSD13XX_CONTRAST);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 5af251676587..b508ab98be2f 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -22,8 +22,8 @@
 #include <linux/regmap.h>
 #include <linux/iosys-map.h>
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
+#define SSD13XX_DATA				0x40
+#define SSD13XX_COMMAND				0x80
 
 enum ssd130x_variants {
 	/* ssd130x family */
-- 
2.41.0

