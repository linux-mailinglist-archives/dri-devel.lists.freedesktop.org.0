Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F34AEDB6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24E710E657;
	Wed,  9 Feb 2022 09:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E99E10E672
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644397945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVaOePIAiXFw8U75tAHDUKWkv70g1B3730fSEy8H3OQ=;
 b=ArveYx0BjDMPlLdWJOR7DJ+xbvH8lrZt96D8ha83KQFXH7LjAgwu4z7dzuHETRp9rAcBp8
 dS8v9u1O6UQHVnYA5At+n7aHshLvN0zsDfECGj+x/IwhM06BvIsRORclUObO9gzQCkKYNX
 16vDdUy3TyAT4Vwm1w7aTyVcJ9xk1Gs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-PlT-9Kd8NX2pEu18bRK2Lg-1; Wed, 09 Feb 2022 04:12:24 -0500
X-MC-Unique: PlT-9Kd8NX2pEu18bRK2Lg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so223792wmd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 01:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IVaOePIAiXFw8U75tAHDUKWkv70g1B3730fSEy8H3OQ=;
 b=FTvT84fyzrnopK4RXA05ZSU+SPdsW+D5U7OgtQGU9cfpY+LtUgaqOvg+066SBzFB2p
 C4uh4OQmvAuL0ZgoxFkzx9jmFTwJBycru/4sksoi/8YV+ujIQa9K16zcjlLLHIOVYqbg
 xgiSDWErFoAsfNmg75T7Mtjzu3e9E/FXRNGJyJ2wnyG3OpjStRuqRfgsNxOE3MHQ18Ic
 sMjQ96AhvHP8p2nYk0Csf1bmJrfY3ATH/9QyiNC1UzKcPeg5K7dP7NWuuPBDIUwA8OLj
 F5VgGHMRRw0Y/pjPNIBbW1Vp0vpMZRvTC/CHCxCQk0Bk+ZFeeXs2TjVRYIrvLL+gQ9Ym
 XjHw==
X-Gm-Message-State: AOAM533XICDugmsW/K7ek+42RG9mw5pdD778fs1xw7r9yBmaZDYqwSKO
 cUh/QvmVLw/R8rQbaj2hOA6aW1uYG3KJ+sOqZVPgTm6STrn4PWwqz9BVKve0nZ6khlVBTllMrEK
 iRL4TD6GVrr7Cn2a76lTKYAepx2Om
X-Received: by 2002:a05:600c:3b97:: with SMTP id
 n23mr116347wms.116.1644397943072; 
 Wed, 09 Feb 2022 01:12:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmy9te2m+nFf5NChLb1Oyfbsc9hQqFDn/UG2mRdylATQQhkHE0nZ3daEy/SuR9+qJRmFJzGg==
X-Received: by 2002:a05:600c:3b97:: with SMTP id
 n23mr116329wms.116.1644397942870; 
 Wed, 09 Feb 2022 01:12:22 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m30sm4588068wms.34.2022.02.09.01.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:12:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
Date: Wed,  9 Feb 2022 10:12:04 +0100
Message-Id: <20220209091204.2513437-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209090314.2511959-1-javierm@redhat.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ssd130x driver only provides the core support for these devices but it
does not have any bus transport logic. Add a driver to interface over SPI.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Add a separate driver for SSD130X chips SPI support (Andy Shevchenko)

 drivers/gpu/drm/solomon/Kconfig       |   9 ++
 drivers/gpu/drm/solomon/Makefile      |   1 +
 drivers/gpu/drm/solomon/ssd130x-spi.c | 114 ++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
index 47e16bc20e0d..16a2098f438c 100644
--- a/drivers/gpu/drm/solomon/Kconfig
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -19,3 +19,12 @@ config DRM_SSD130X_I2C
 	  Say Y here if the SSD130X OLED display is connected via I2C bus.
 
 	  If M is selected the module will be called ssd130x-i2c.
+
+config DRM_SSD130X_SPI
+	tristate "DRM support for Solomon SSD130X OLED displays (SPI bus)"
+	depends on DRM_SSD130X && SPI
+	select REGMAP_SPI
+	help
+	  Say Y here if the SSD130X OLED display is connected via SPI bus.
+
+	  If M is selected the module will be called ssd130x-spi.
diff --git a/drivers/gpu/drm/solomon/Makefile b/drivers/gpu/drm/solomon/Makefile
index 4bfc5acb0447..b5fc792257d7 100644
--- a/drivers/gpu/drm/solomon/Makefile
+++ b/drivers/gpu/drm/solomon/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DRM_SSD130X)	+= ssd130x.o
 obj-$(CONFIG_DRM_SSD130X_I2C)	+= ssd130x-i2c.o
+obj-$(CONFIG_DRM_SSD130X_SPI)	+= ssd130x-spi.o
diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
new file mode 100644
index 000000000000..ccc56d2f3026
--- /dev/null
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Solomon SSD130X OLED displays (SPI bus)
+ *
+ * Copyright 2022 Red Hat Inc.
+ * Authors: Javier Martinez Canillas <javierm@redhat.com>
+ */
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+
+#include "ssd130x.h"
+
+#define DRIVER_NAME	"ssd130x-spi"
+#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays (SPI)"
+
+static const struct regmap_config ssd130x_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ssd130x_spi_probe(struct spi_device *spi)
+{
+	struct ssd130x_device *ssd130x;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &ssd130x_spi_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ssd130x = ssd130x_probe(&spi->dev, regmap);
+
+	if (IS_ERR(ssd130x))
+		return PTR_ERR(ssd130x);
+
+	spi_set_drvdata(spi, ssd130x);
+
+	return 0;
+}
+
+static int ssd130x_spi_remove(struct spi_device *spi)
+{
+	struct ssd130x_device *ssd130x = spi_get_drvdata(spi);
+
+	return ssd130x_remove(ssd130x);
+}
+
+static void ssd130x_spi_shutdown(struct spi_device *spi)
+{
+	struct ssd130x_device *ssd130x = spi_get_drvdata(spi);
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
+		.compatible = "solomon,ssd1305fb-spi",
+		.data = (void *)&ssd130x_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306fb-spi",
+		.data = (void *)&ssd130x_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307fb-spi",
+		.data = (void *)&ssd130x_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309fb-spi",
+		.data = (void *)&ssd130x_ssd1309_deviceinfo,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ssd130x_of_match);
+
+static struct spi_driver ssd130x_spi_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = ssd130x_of_match,
+	},
+	.probe = ssd130x_spi_probe,
+	.remove = ssd130x_spi_remove,
+	.shutdown = ssd130x_spi_shutdown,
+};
+module_spi_driver(ssd130x_spi_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

