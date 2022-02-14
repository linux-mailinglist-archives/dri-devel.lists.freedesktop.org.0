Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619EF4B51C7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7C810E59A;
	Mon, 14 Feb 2022 13:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD4510E59D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62OmRN0+ZmJkqLoaFDxhy0eO6yAnFd+9Iv9L0ky9wLc=;
 b=K2QR4j+/XoP5AfLCPwTIu955bvhFjIUId2N2uk4X/T2IeSej9U/YojXpTdpbbhfzHEBY2u
 8PT4G0Bx46Cu2xv/QnIHedvaNiy9YMfE3zcCGuUbsbT5LL4lAnTMAHuR4UN6ev/y/qCmCr
 arVNQwBwEmGMWNjH3ccZCX7IQ36nmmk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-S_yDUpaKM46w0-doF9qZKQ-1; Mon, 14 Feb 2022 08:37:40 -0500
X-MC-Unique: S_yDUpaKM46w0-doF9qZKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so6944614wrd.22
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 05:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62OmRN0+ZmJkqLoaFDxhy0eO6yAnFd+9Iv9L0ky9wLc=;
 b=bCfpuFjKTXHuaks/yspn8i+hT95DRPCHn3KcHaTngxZsFsXCx65dx2ag6eAde2x4PO
 kX9y+lZVyTxTpwsXJFcJ5uR03BHka1qUvhwh8fDooqsI3Mj8I9CIvNrIJeecMduCE8S/
 MBMFuIOq6UR2D6Tf2xo60jEAKOluKEmjxglVUEMwbsTSAjvWUsXXUxqzUIIVPm6ucYvs
 goachCYc6G/1huKBKUAjCzXPKp2dUlTcPbHjXgIZZCjW9uCr+SS8Usj3u6Sm0iFR+d5K
 X8+ditYNMphh2xLjKksSEqsGmwjLdbOFs4iPLf8L4N0zUZrPQ0baBqBariIrQhGfYNBm
 B8dA==
X-Gm-Message-State: AOAM531ZYv1nv9DOap3Qc7IwHb9oLk0CoRUh0rx9PIlK3DGucrW4JtxA
 BHEQ+mzHSbmx3Pa7NNd9tS8bMU8sx9LWiGN19/pso7xWBch+5Pdpw1IcukvS1jNSjET4B4PI3nx
 CRilutKW37dfEs2sEIZ7XqZuY45NQ
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr11632468wrs.521.1644845858008; 
 Mon, 14 Feb 2022 05:37:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8VZXr0lt8TjYW2cqobZdRW50wOeVp8oV02mur3StsZ5D0CpVhMx2bj567oRG+kIrVHV4Xmw==
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr11632442wrs.521.1644845857767; 
 Mon, 14 Feb 2022 05:37:37 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y6sm3568918wrd.30.2022.02.14.05.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:37:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] drm/solomon: Add SSD130x OLED displays I2C support
Date: Mon, 14 Feb 2022 14:37:08 +0100
Message-Id: <20220214133710.3278506-5-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214133710.3278506-1-javierm@redhat.com>
References: <20220214133710.3278506-1-javierm@redhat.com>
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

(no changes since v5)

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

