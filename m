Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8334B27F5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 15:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC04010EA73;
	Fri, 11 Feb 2022 14:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6BE10EA90
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644590052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fz2Kno8PPLHlny0kFyGFu1CzpGMejC9s0k6wv2123LE=;
 b=Q6txWiTApfIqE1us73ZcODKLbuhiaK7a9kfhM8nJFdFIzufqB7AO2H86Dg2l/zeAAtzxZR
 kcckNmQXbklmwg5fFUqtnU9MUahJSINCAhNPsyxf1q3XRqAdjD3Rh63V5nT2xJv8f3iiYk
 TrF/psT7G9zkAnY8mWBu7isTLQf+AEw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-aUVCaQ98ObiZZi17GjRWLA-1; Fri, 11 Feb 2022 09:34:11 -0500
X-MC-Unique: aUVCaQ98ObiZZi17GjRWLA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso5989284wma.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 06:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fz2Kno8PPLHlny0kFyGFu1CzpGMejC9s0k6wv2123LE=;
 b=PTEC31m+2UFyFP9z3QLQuXgCcOfJTKIROvwetSc9FaUpoh1+ETANPXxmYRr4CBuJT1
 lSJz1LjtNdY9bJeiIcSJTkf/26+cKCJ4EmXfyvkzD570LvWaLKJV4iYQvU9NiBVBCsT/
 konRFRFZfZM4dH2NprxXgcbbvwL6TLwLSDlDwhdMawyGEneHuQKVn+pLV6m9q8kucAzm
 2piR73Cv/1M6WRlUKQCdj9ivcxt6bB5Jocg3OJfcLQ0DYV/uSfZAhLrCERhOQyU6qu6q
 iUdBj/4uHrCZIy4kzDiDHuST/BQZo4Ak3Mk6bdJrDB710LZKBypgqmzCFFHu3VweIM08
 1OBg==
X-Gm-Message-State: AOAM532JaHTkeiFJ2TDYUcMLJPWnlUFsHuYt5O58u4Pl72mLrHD4XKmN
 Hv6XlA2pueB0DMM1rbxn3pBBaG7MJ7u4sRWh3FGBxZzCQN/a/gjGD38tzSaRPM4gAjCZi3QFNWC
 ZWVFoNq1tMoOVJqgnnLSZt6u/M8MP
X-Received: by 2002:adf:decd:: with SMTP id i13mr1616434wrn.314.1644590049849; 
 Fri, 11 Feb 2022 06:34:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznBtKJaEhhYGX4nEC0I1gBzUDI6glrFk0hX33aohr/ENq8FE0yUVJyhR9x0JuIfNsT+0ZweA==
X-Received: by 2002:adf:decd:: with SMTP id i13mr1616415wrn.314.1644590049605; 
 Fri, 11 Feb 2022 06:34:09 -0800 (PST)
Received: from minerva.redhat.com ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o14sm24616012wry.104.2022.02.11.06.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 06:34:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] drm/solomon: Add SSD130x OLED displays I2C support
Date: Fri, 11 Feb 2022 15:33:56 +0100
Message-Id: <20220211143358.3112958-5-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211143358.3112958-1-javierm@redhat.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ssd130x driver only provides the core support for these devices but it
does not have any bus transport logic. Add a driver to interface over I2C.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Changes in v5:
- Add Andy Shevchenko's Reviewed-by tag to patch #4.

Changes in v4:
- Remove unnecessary casting (Geert Uytterhoeven)
- Remove redundant blank lines (Andy Shevchenko)
- Remove comma after of_device_id table terminator (Andy Shevchenko)

Changes in v3:
- Add a separate driver for SSD130X chips I2C support (Andy Shevchenko)

 drivers/gpu/drm/solomon/Kconfig       |   9 ++
 drivers/gpu/drm/solomon/Makefile      |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c | 116 ++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-i2c.c

diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
index 7720a7039e8d..5861c3ab7c45 100644
--- a/drivers/gpu/drm/solomon/Kconfig
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -10,3 +10,12 @@ config DRM_SSD130X
 	  the appropriate bus transport in your chip also must be selected.
 
 	  If M is selected the module will be called ssd130x.
+
+config DRM_SSD130X_I2C
+	tristate "DRM support for Solomon SSD130x OLED displays (I2C bus)"
+	depends on DRM_SSD130X && I2C
+	select REGMAP_I2C
+	help
+	  Say Y here if the SSD130x OLED display is connected via I2C bus.
+
+	  If M is selected the module will be called ssd130x-i2c.
diff --git a/drivers/gpu/drm/solomon/Makefile b/drivers/gpu/drm/solomon/Makefile
index f685addb19fe..4bfc5acb0447 100644
--- a/drivers/gpu/drm/solomon/Makefile
+++ b/drivers/gpu/drm/solomon/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_SSD130X)	+= ssd130x.o
+obj-$(CONFIG_DRM_SSD130X_I2C)	+= ssd130x-i2c.o
diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
new file mode 100644
index 000000000000..3126aeda4ced
--- /dev/null
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Solomon SSD130x OLED displays (I2C bus)
+ *
+ * Copyright 2022 Red Hat Inc.
+ * Author: Javier Martinez Canillas <javierm@redhat.com>
+ *
+ * Based on drivers/video/fbdev/ssd1307fb.c
+ * Copyright 2012 Free Electrons
+ */
+#include <linux/i2c.h>
+#include <linux/module.h>
+
+#include "ssd130x.h"
+
+#define DRIVER_NAME	"ssd130x-i2c"
+#define DRIVER_DESC	"DRM driver for Solomon SSD130x OLED displays (I2C)"
+
+static const struct regmap_config ssd130x_i2c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ssd130x_i2c_probe(struct i2c_client *client)
+{
+	struct ssd130x_device *ssd130x;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i2c(client, &ssd130x_i2c_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ssd130x = ssd130x_probe(&client->dev, regmap);
+	if (IS_ERR(ssd130x))
+		return PTR_ERR(ssd130x);
+
+	i2c_set_clientdata(client, ssd130x);
+
+	return 0;
+}
+
+static int ssd130x_i2c_remove(struct i2c_client *client)
+{
+	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
+
+	return ssd130x_remove(ssd130x);
+}
+
+static void ssd130x_i2c_shutdown(struct i2c_client *client)
+{
+	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
+
+	ssd130x_shutdown(ssd130x);
+}
+
+static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
+	.default_vcomh = 0x34,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 7,
+};
+
+static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
+	.default_vcomh = 0x20,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 8,
+	.need_chargepump = 1,
+};
+
+static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
+	.default_vcomh = 0x20,
+	.default_dclk_div = 2,
+	.default_dclk_frq = 12,
+	.need_pwm = 1,
+};
+
+static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
+	.default_vcomh = 0x34,
+	.default_dclk_div = 1,
+	.default_dclk_frq = 10,
+};
+
+static const struct of_device_id ssd130x_of_match[] = {
+	{
+		.compatible = "solomon,ssd1305fb-i2c",
+		.data = &ssd130x_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306fb-i2c",
+		.data = &ssd130x_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307fb-i2c",
+		.data = &ssd130x_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309fb-i2c",
+		.data = &ssd130x_ssd1309_deviceinfo,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ssd130x_of_match);
+
+static struct i2c_driver ssd130x_i2c_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = ssd130x_of_match,
+	},
+	.probe_new = ssd130x_i2c_probe,
+	.remove = ssd130x_i2c_remove,
+	.shutdown = ssd130x_i2c_shutdown,
+};
+module_i2c_driver(ssd130x_i2c_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

