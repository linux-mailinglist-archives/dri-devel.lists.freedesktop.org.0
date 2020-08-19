Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E233B24A807
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 22:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF346E81F;
	Wed, 19 Aug 2020 20:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4076E81F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:52:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m22so26880424ljj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sf36Xrs5j4CrikMm+NIIGk8dd1z1QFVXmgGUGWxVzwM=;
 b=l9YnSXe3Uvh2SVmsfNlAqbj3wm2mlTzFnpD9Ws0/bJx8mSrcubzBNaKcPOYx01gxIt
 qQq0CWsVw5Ns9/0eWDvV/GgFqaHKh0h151WAStuuI108f0SXZQaqW4cAnAEXu1z9qxrP
 CxFZDEaBLuny+QKQQLe0+aZp+ic53XynMBUIX13YX0f7gbNfjriqnFWxrwbkadYw3vqD
 2dGdJPvAikoMARCe2nQWOs0vDEoQOR+HvHsgZQBEFGcfGNByaYPzXjTe/ex9wnJaTg3u
 v/HcsV/1IQ9zsem7hHF6QoK4o9Iheiysvivh8V0u9iFqx7yeOaWnPv8e4g5ClbupBv7T
 uO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sf36Xrs5j4CrikMm+NIIGk8dd1z1QFVXmgGUGWxVzwM=;
 b=nr+gOvAr7qjoLpKswD3jvIdRe5FCX65ypLAyrE+nx2XAZLSArbR8XWdtq6wqsnugKH
 Pzfr11nmif6QymL3O4AuZS4wFbK9TIslh/pVR4s8nftRrIG/ePFM00kazCN/50zz8L37
 knUaUY4gCaceD+HO56+dVueSZxvfqePPZfo+pqzpG5TYM7/GT8ePQ3crJ7HEtFerNz6p
 UbEj50uUjJ56Esvzucd7VHcpImGz6e1P5Fh1rVSF/1IpoNbmQ6Akf+4HVDBjxOygkHy4
 3ehh6JhIUffkqmcai6qNk/fpNxY4t6pmc8cKsZxzMwkg97EKAKglHcZU/Mv4JR5iBIl+
 UUXA==
X-Gm-Message-State: AOAM533xIJzLkzbNGAQ9I1br8W0CZsTHYUWWIZZtDvldpWVsIhBYRSIl
 SlkqQyP92++amHphp0UxwZgNpQ==
X-Google-Smtp-Source: ABdhPJwRJadkkfHom8fuY2KagaEXclrxrsZYvh6LtLhtGEytgqhXhhSeBinHaB4vg2qBsAIfBMOcdg==
X-Received: by 2002:a2e:5cc9:: with SMTP id q192mr27317ljb.452.1597870324859; 
 Wed, 19 Aug 2020 13:52:04 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id u10sm8188lfo.39.2020.08.19.13.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 13:52:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3 v3] backlight: Add Kinetic KTD253 backlight driver
Date: Wed, 19 Aug 2020 22:51:50 +0200
Message-Id: <20200819205150.164403-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kinetic KTD253 backlight driver is controlled with a
single GPIO line, but still supports a range of brightness
settings by sending fast pulses on the line.

This is based off the source code release for the Samsung
GT-S7710 mobile phone.

Cc: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collect Daniel's review tag.
ChangeLog v1->v2:
- Expose the 32 actual hardware levels of brightness directly
  instead of using an interpolated "brightness" table.
- Use the new backlight_get_brightness() helper.
- Call backlight_update_status() in probe instead of calling
  local functions to sync brightness.
- Sort includes alphabetically.
- Name the GPIO line "enable" and grab that in accordance
  with the change to the DT bindings.
---
 MAINTAINERS                                |   6 +
 drivers/video/backlight/Kconfig            |   8 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/ktd253-backlight.c | 198 +++++++++++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 drivers/video/backlight/ktd253-backlight.c

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..ef6b4a279d25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9722,6 +9722,12 @@ F:	Documentation/admin-guide/auxdisplay/ks0108.rst
 F:	drivers/auxdisplay/ks0108.c
 F:	include/linux/ks0108.h
 
+KTD253 BACKLIGHT DRIVER
+M:	Linus Walleij <linus.walleij@linaro.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
+F:	drivers/video/backlight/ktd253-backlight.c
+
 L3MDEV
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 87f9fc238d28..d83c87b902c1 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -182,6 +182,14 @@ config BACKLIGHT_IPAQ_MICRO
 	  computers. Say yes if you have one of the h3100/h3600/h3700
 	  machines.
 
+config BACKLIGHT_KTD253
+	tristate "Backlight Driver for Kinetic KTD253"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say y to enabled the backlight driver for the Kinetic KTD253
+	  which is a 1-wire GPIO-controlled backlight found in some mobile
+	  phones.
+
 config BACKLIGHT_LM3533
 	tristate "Backlight Driver for LM3533"
 	depends on MFD_LM3533
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 13463b99f1f9..685f3f1ca4df 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
+obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
new file mode 100644
index 000000000000..e3fee3f1f582
--- /dev/null
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for the Kinetic KTD253
+ * Based on code and know-how from the Samsung GT-S7710
+ * Gareth Phillips <gareth.phillips@samsung.com>
+ */
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/fb.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+/* Current ratio is n/32 from 1/32 to 32/32 */
+#define KTD253_MIN_RATIO 1
+#define KTD253_MAX_RATIO 32
+#define KTD253_DEFAULT_RATIO 13
+
+#define KTD253_T_LOW_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_HIGH_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_OFF_MS 3
+
+struct ktd253_backlight {
+	struct device *dev;
+	struct backlight_device *bl;
+	struct gpio_desc *gpiod;
+	u16 ratio;
+};
+
+static int ktd253_backlight_update_status(struct backlight_device *bl)
+{
+	struct ktd253_backlight *ktd253 = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+	u16 target_ratio;
+	u16 current_ratio = ktd253->ratio;
+	unsigned long flags;
+
+	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
+
+	target_ratio = brightness;
+
+	if (target_ratio == current_ratio)
+		/* This is already right */
+		return 0;
+
+	if (target_ratio == 0) {
+		gpiod_set_value_cansleep(ktd253->gpiod, 0);
+		/*
+		 * We need to keep the GPIO low for at least this long
+		 * to actually switch the KTD253 off.
+		 */
+		msleep(KTD253_T_OFF_MS);
+		ktd253->ratio = 0;
+		return 0;
+	}
+
+	if (current_ratio == 0) {
+		gpiod_set_value_cansleep(ktd253->gpiod, 1);
+		ndelay(KTD253_T_HIGH_NS);
+		/* We always fall back to this when we power on */
+		current_ratio = KTD253_MAX_RATIO;
+	}
+
+	/*
+	 * WARNING:
+	 * The loop to set the correct current level is performed
+	 * with interrupts disabled as it is timing critical.
+	 * The maximum number of cycles of the loop is 32
+	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
+	 */
+	local_irq_save(flags);
+	while (current_ratio != target_ratio) {
+		/*
+		 * These GPIO operations absolutely can NOT sleep so no
+		 * _cansleep suffixes, and no using GPIO expanders on
+		 * slow buses for this!
+		 */
+		gpiod_set_value(ktd253->gpiod, 0);
+		ndelay(KTD253_T_LOW_NS);
+		gpiod_set_value(ktd253->gpiod, 1);
+		ndelay(KTD253_T_HIGH_NS);
+		/* After 1/32 we loop back to 32/32 */
+		if (current_ratio == KTD253_MIN_RATIO)
+			current_ratio = KTD253_MAX_RATIO;
+		else
+			current_ratio--;
+	}
+	local_irq_restore(flags);
+	ktd253->ratio = current_ratio;
+
+	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
+
+	return 0;
+}
+
+static const struct backlight_ops ktd253_backlight_ops = {
+	.options	= BL_CORE_SUSPENDRESUME,
+	.update_status	= ktd253_backlight_update_status,
+};
+
+static int ktd253_backlight_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct backlight_device *bl;
+	struct ktd253_backlight *ktd253;
+	u32 max_brightness;
+	u32 brightness;
+	int ret;
+
+	ktd253 = devm_kzalloc(dev, sizeof(*ktd253), GFP_KERNEL);
+	if (!ktd253)
+		return -ENOMEM;
+	ktd253->dev = dev;
+
+	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
+	if (ret)
+		max_brightness = KTD253_MAX_RATIO;
+	if (max_brightness > KTD253_MAX_RATIO) {
+		/* Clamp brightness to hardware max */
+		dev_err(dev, "illegal max brightness specified\n");
+		max_brightness = KTD253_MAX_RATIO;
+	}
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = KTD253_DEFAULT_RATIO;
+	if (brightness > max_brightness) {
+		/* Clamp default brightness to max brightness */
+		dev_err(dev, "default brightness exceeds max brightness\n");
+		brightness = max_brightness;
+	}
+
+	if (brightness)
+		/* This will be the default ratio when the KTD253 is enabled */
+		ktd253->ratio = KTD253_MAX_RATIO;
+	else
+		ktd253->ratio = 0;
+
+	ktd253->gpiod = devm_gpiod_get(dev, "enable",
+				       brightness ? GPIOD_OUT_HIGH :
+				       GPIOD_OUT_LOW);
+	if (IS_ERR(ktd253->gpiod)) {
+		ret = PTR_ERR(ktd253->gpiod);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "gpio line missing or invalid.\n");
+		return ret;
+	}
+	gpiod_set_consumer_name(ktd253->gpiod, dev_name(dev));
+
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ktd253,
+					    &ktd253_backlight_ops, NULL);
+	if (IS_ERR(bl)) {
+		dev_err(dev, "failed to register backlight\n");
+		return PTR_ERR(bl);
+	}
+	bl->props.max_brightness = max_brightness;
+	/* When we just enable the GPIO line we set max brightness */
+	if (brightness) {
+		bl->props.brightness = brightness;
+		bl->props.power = FB_BLANK_UNBLANK;
+	} else {
+		bl->props.brightness = 0;
+		bl->props.power = FB_BLANK_POWERDOWN;
+	}
+
+	ktd253->bl = bl;
+	platform_set_drvdata(pdev, bl);
+	backlight_update_status(bl);
+
+	return 0;
+}
+
+static const struct of_device_id ktd253_backlight_of_match[] = {
+	{ .compatible = "kinetic,ktd253" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ktd253_backlight_of_match);
+
+static struct platform_driver ktd253_backlight_driver = {
+	.driver = {
+		.name = "ktd253-backlight",
+		.of_match_table = ktd253_backlight_of_match,
+	},
+	.probe		= ktd253_backlight_probe,
+};
+module_platform_driver(ktd253_backlight_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Kinetic KTD253 Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ktd253-backlight");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
