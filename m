Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD34F8845
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E35210EEA6;
	Thu,  7 Apr 2022 20:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762F10EEA2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649361785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TE4gPpLf7WhkN5ezB0vCrjVorkv1sMpiSBwQ7irjd6Q=;
 b=Sh7MRsYivxlkv+vI85/72hk6iqMjljRRIqWBoTQK0Sf26J30p462FWEOnCPkVwG+Uk4EQq
 bwA3pxbNWafLn2vgKwEVzItHkMJnChghYTgUeYXlXjJbZwdUiLn+BzCMahYur76muEhRfY
 LRK7NHLbQ8R6fQZhCvMP1roJ5c3UrAg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-C8FsF8kmOXihjk3tx3QBZA-1; Thu, 07 Apr 2022 16:03:04 -0400
X-MC-Unique: C8FsF8kmOXihjk3tx3QBZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso1768967wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 13:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TE4gPpLf7WhkN5ezB0vCrjVorkv1sMpiSBwQ7irjd6Q=;
 b=AKiSTBJdbtWcNMFXSuX3ntr01V3vMS1YHNTRfgOK2IpSiLhySL6L+TWx3ejFBc4Ed/
 1pTevoXT03k1LKraA/AsD3jezeVRTp26JIzrO4erExyCHAG9NsmpPGE4Uki1wskwU8g5
 bd7469+n8gcH6QVsQAXlTSioPP8E9gT/tlYwKWuNKXdFlHsQCE8cjM7Aitn0pAcU7JzD
 fCL8Ac6hknNhJ3UzXkcUQSY4wKfdP/kXmrwbWCH/C55925qE4vmpml1mItHym4acyOGM
 dKy9oFTwmFrssqgzY3P1FccCNHSloVi6pOyjivTpx1Di3O9UGM3Jxc8PmraYCXfZUDZQ
 Ir/A==
X-Gm-Message-State: AOAM530XBByuvi+b8riyHOZUI2UBPd1r6hjV9egrDqRYlXxgQjXCUB4b
 ZAKzn4JALimesWcPYua54H63OEdPoeNpxk4I6QzjjbO85nlwfSMCtQiP5D1dXA5mSFakxpy6oVg
 3DnodXDABOdlEplu71UHXdB5NKH+r
X-Received: by 2002:adf:9dd2:0:b0:206:14f9:6432 with SMTP id
 q18-20020adf9dd2000000b0020614f96432mr11931358wre.129.1649361783396; 
 Thu, 07 Apr 2022 13:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqOZMuv7vlTxaNOa9uzsUAtJoY+v170aoJd1/4gM8Ev8wfF6xaGJEgCSZ0qspOkfmmAC/8pw==
X-Received: by 2002:adf:9dd2:0:b0:206:14f9:6432 with SMTP id
 q18-20020adf9dd2000000b0020614f96432mr11931343wre.129.1649361783111; 
 Thu, 07 Apr 2022 13:03:03 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b002078f74ccd2sm1048712wry.36.2022.04.07.13.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:03:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/solomon: Move device info from ssd130x-i2c to the
 core driver
Date: Thu,  7 Apr 2022 22:02:03 +0200
Message-Id: <20220407200205.28838-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407200205.28838-1-javierm@redhat.com>
References: <20220407200205.28838-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are declared in the ssd130x-i2c transport driver but the information
is not I2C specific and could be used by other SSD130x transport drivers.

Move them to the ssd130x core driver and just set the OF device entries to
an ID that could be used to lookup the correct device into from an array.

While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
bytes. Since even though are used by the I2C interface, it could also be
useful for other transport protocols such as SPI.

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 51 ++++-------------------
 drivers/gpu/drm/solomon/ssd130x.c     | 60 +++++++++++++++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h     | 13 ++++++
 3 files changed, 78 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index a469679548f8..aa6cc2cb54f9 100644
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
 		.compatible = "sinowealth,sh1106-i2c",
-		.data = &ssd130x_sh1106_deviceinfo,
+		.data = SH1106_ID,
 	},
 	{
 		.compatible = "solomon,ssd1305-i2c",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = (void *)SSD1305_ID,
 	},
 	{
 		.compatible = "solomon,ssd1306-i2c",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = (void *)SSD1306_ID,
 	},
 	{
 		.compatible = "solomon,ssd1307-i2c",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = (void *)SSD1307_ID,
 	},
 	{
 		.compatible = "solomon,ssd1309-i2c",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = (void *)SSD1309_ID,
 	},
 	/* Deprecated but remain for backward compatibility */
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = (void *)SSD1305_ID,
 	},
 	{
 		.compatible = "solomon,ssd1306fb-i2c",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = (void *)SSD1306_ID,
 	},
 	{
 		.compatible = "solomon,ssd1307fb-i2c",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = (void *)SSD1307_ID,
 	},
 	{
 		.compatible = "solomon,ssd1309fb-i2c",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = (void *)SSD1309_ID,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a7e784518c69..1f00fd3c0023 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -39,11 +39,9 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
-
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
+
 #define SSD130X_SET_ADDRESS_MODE		0x20
 #define SSD130X_SET_COL_RANGE			0x21
 #define SSD130X_SET_PAGE_RANGE			0x22
@@ -94,6 +92,55 @@
 
 #define MAX_CONTRAST 255
 
+static struct ssd130x_deviceinfo ssd130x_variants[] =  {
+	{
+		.default_vcomh = 0x40,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 5,
+		.page_mode_only = 1,
+	},
+	{
+		.variant = SSD1305_ID,
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 7,
+	},
+	{
+		.variant = SSD1306_ID,
+		.default_vcomh = 0x20,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 8,
+		.need_chargepump = 1,
+	},
+	{
+		.variant = SSD1307_ID,
+		.default_vcomh = 0x20,
+		.default_dclk_div = 2,
+		.default_dclk_frq = 12,
+		.need_pwm = 1,
+	},
+	{
+		.variant = SSD1309_ID,
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 10,
+	}
+};
+
+static const struct ssd130x_deviceinfo *ssd13x_variant_to_info(enum ssd130x_variants variant)
+{
+	int i;
+	const struct ssd130x_deviceinfo *info;
+
+	for (i = 0; i < ARRAY_SIZE(ssd130x_variants); i++) {
+		info = &ssd130x_variants[i];
+		if (info->variant == variant)
+			return info;
+	}
+
+	return NULL;
+}
+
 static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 {
 	return container_of(drm, struct ssd130x_device, drm);
@@ -846,6 +893,7 @@ static int ssd130x_get_resources(struct ssd130x_device *ssd130x)
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 {
 	struct ssd130x_device *ssd130x;
+	enum ssd130x_variants variant;
 	struct backlight_device *bl;
 	struct drm_device *drm;
 	int ret;
@@ -860,7 +908,11 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 
 	ssd130x->dev = dev;
 	ssd130x->regmap = regmap;
-	ssd130x->device_info = device_get_match_data(dev);
+
+	variant = (enum ssd130x_variants)device_get_match_data(dev);
+	ssd130x->device_info = ssd13x_variant_to_info(variant);
+	if (!ssd130x->device_info)
+		return ERR_PTR(-EINVAL);
 
 	if (ssd130x->device_info->page_mode_only)
 		ssd130x->page_address_mode = 1;
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index f5b062576fdf..4e0b62a41aa3 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -18,7 +18,20 @@
 
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
+	enum ssd130x_variants variant;
 	u32 default_vcomh;
 	u32 default_dclk_div;
 	u32 default_dclk_frq;
-- 
2.35.1

