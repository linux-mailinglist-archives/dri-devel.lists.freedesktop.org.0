Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0ED1C06BA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 21:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFDE6E94B;
	Thu, 30 Apr 2020 19:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AB36E94F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:46:28 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d184so380749pfd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NxGWym6M39FpWdScigAXkwBmrVrNXh+0LWhd39ynj6c=;
 b=XkUJdR8V1C3am+EJyt9UZIe3TO+QKdIR5fwICpZC4ZHIh7XC6dK2m/2frGsFFmVF4+
 XFvFRZDs/uKFuBsrAMBeFg/o5gbGXanTomcJTZ9gpykF5Op/zXbfwstVNm9poKskcXUU
 D4k5+FuOjdrHtSTiIAZzl4puSjm+lATNc65ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxGWym6M39FpWdScigAXkwBmrVrNXh+0LWhd39ynj6c=;
 b=c23kz+gW0G5civloof+CYYTGPrbrf6FvVaRJbHfLNL2G+1+Hmh35BIA7OOuL7tZGDw
 MLXLS63mZ8kIuREDIy/n/dhKf14/ewoxb2cpzPlsq+io5LDrvtMg7gJelQkemjyR+eOy
 KDgepLnHUXlwKoELngojn6AEJn2SvQaX4KvPMjJdjTUnCKgUnmdCEMu1KOjCaY8p0TCV
 vpGDAi+7z06O12D4u7FXL9ppxTUbHWaEqwuR+bCXsL1/3NdHlYI0bw7EWngPwZadiF9k
 Y04k+6gqzoWA+rwRsjuqtew4IFZgHrJ9ks7VzZ995sG5NTw1LSuHUhIXxB6su4Ix3P+i
 zaNQ==
X-Gm-Message-State: AGi0PuZY7LzTzMVbaG7XiOJPSRAVrYb9trm+bLB9zv9XKBA2xAJ01+dv
 yuqBgmXuQO08NnBlMZ47lECORA==
X-Google-Smtp-Source: APiQypI8SL4AfT1E4wyLsRXT6pVJShj3Chcf1e1fcW4Z6r9ohTrqxNdAMX2KVlkj3fEWUtQ5+gqT5Q==
X-Received: by 2002:a62:f247:: with SMTP id y7mr387808pfl.200.1588275987416;
 Thu, 30 Apr 2020 12:46:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:46:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
Date: Thu, 30 Apr 2020 12:46:12 -0700
Message-Id: <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
be used as GPIOs in a system.  Each pin can be configured as input,
output, or a special function for the bridge chip.  These are:
- GPIO1: SUSPEND Input
- GPIO2: DSIA VSYNC
- GPIO3: DSIA HSYNC or VSYNC
- GPIO4: PWM

Let's expose these pins as GPIOs.  A few notes:
- Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
- These pins can't be configured for IRQ.
- There are no programmable pulls or other fancy features.
- Keeping the bridge chip powered might be expensive.  The driver is
  setup such that if all used GPIOs are only inputs we'll power the
  bridge chip on just long enough to read the GPIO and then power it
  off again.  Setting a GPIO as output will keep the bridge powered.
- If someone releases a GPIO we'll implicitly switch it to an input so
  we no longer need to keep the bridge powered for it.

Because of all of the above limitations we just need to implement a
bare-bones GPIO driver.  The device tree bindings already account for
this device being a GPIO controller so we only need the driver changes
for it.

NOTE: Despite the fact that these pins are nominally muxable I don't
believe it makes sense to expose them through the pinctrl interface as
well as the GPIO interface.  The special functions are things that the
bridge chip driver itself would care about and it can just configure
the pins as needed.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v4:
- Don't include gpio.h
- Use gpiochip_get_data() instead of container_of() to get data.
- GPIOF_DIR_XXX => GPIO_LINE_DIRECTION_XXX
- Use Linus W's favorite syntax to read a bit from a bitfield.
- Define and use SN_GPIO_MUX_MASK.
- Add a comment about why we use a bitmap for gchip_output.

Changes in v3:
- Becaue => Because
- Add a kernel-doc to our pdata to clarify double-duty of gchip_output.
- More comments about how powering off affects us (get_dir, dir_input).
- Cleanup tail of ti_sn_setup_gpio_controller() to avoid one "return".
- Use a bitmap rather than rolling my own.

Changes in v2:
- ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 195 ++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..1a125423eb07 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -4,9 +4,11 @@
  * datasheet: http://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -54,6 +56,14 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
+#define SN_GPIO_IO_REG				0x5E
+#define  SN_GPIO_INPUT_SHIFT			4
+#define  SN_GPIO_OUTPUT_SHIFT			0
+#define SN_GPIO_CTRL_REG			0x5F
+#define  SN_GPIO_MUX_INPUT			0
+#define  SN_GPIO_MUX_OUTPUT			1
+#define  SN_GPIO_MUX_SPECIAL			2
+#define  SN_GPIO_MUX_MASK			0x3
 #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
 #define SN_AUX_ADDR_19_16_REG			0x74
 #define SN_AUX_ADDR_15_8_REG			0x75
@@ -88,6 +98,34 @@
 
 #define SN_REGULATOR_SUPPLY_NUM		4
 
+#define SN_NUM_GPIOS			4
+
+/**
+ * struct ti_sn_bridge - Platform data for ti-sn65dsi86 driver.
+ * @dev:          Pointer to our device.
+ * @regmap:       Regmap for accessing i2c.
+ * @aux:          Our aux channel.
+ * @bridge:       Our bridge.
+ * @connector:    Our connector.
+ * @debugfs:      Used for managing our debugfs.
+ * @host_node:    Remote DSI node.
+ * @dsi:          Our MIPI DSI source.
+ * @refclk:       Our reference clock.
+ * @panel:        Our panel.
+ * @enable_gpio:  The GPIO we toggle to enable the bridge.
+ * @supplies:     Data for bulk enabling/disabling our regulators.
+ * @dp_lanes:     Count of dp_lanes we're using.
+ *
+ * @gchip:        If we expose our GPIOs, this is used.
+ * @gchip_output: A cache of whether we've set GPIOs to output.  This
+ *                serves double-duty of keeping track of the direction and
+ *                also keeping track of whether we've incremented the
+ *                pm_runtime reference count for this pin, which we do
+ *                whenever a pin is configured as an output.  This is a
+ *                bitmap so we can do atomic ops on it without an extra
+ *                lock so concurrent users of our 4 GPIOs don't stomp on
+ *                each other's read-modify-write.
+ */
 struct ti_sn_bridge {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -102,6 +140,9 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+
+	struct gpio_chip		gchip;
+	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -874,6 +915,154 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
 	return 0;
 }
 
+static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
+					   unsigned int offset)
+{
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+
+	/*
+	 * We already have to keep track of the direction because we use
+	 * that to figure out whether we've powered the device.  We can
+	 * just return that rather than (maybe) powering up the device
+	 * to ask its direction.
+	 */
+	return test_bit(offset, pdata->gchip_output) ?
+		GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	/*
+	 * When the pin is an input we don't forcibly keep the bridge
+	 * powered--we just power it on to read the pin.  NOTE: part of
+	 * the reason this works is that the bridge defaults (when
+	 * powered back on) to all 4 GPIOs being configured as GPIO input.
+	 * Also note that if something else is keeping the chip powered the
+	 * pm_runtime functions are lightweight increments of a refcount.
+	 */
+	pm_runtime_get_sync(pdata->dev);
+	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
+	pm_runtime_put(pdata->dev);
+
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));
+}
+
+static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				  int val)
+{
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	int ret;
+
+	if (!test_bit(offset, pdata->gchip_output)) {
+		dev_err(pdata->dev, "Ignoring GPIO set while input\n");
+		return;
+	}
+
+	val &= 1;
+	ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
+				 BIT(SN_GPIO_OUTPUT_SHIFT + offset),
+				 val << (SN_GPIO_OUTPUT_SHIFT + offset));
+}
+
+static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
+					     unsigned int offset)
+{
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	int shift = offset * 2;
+	int ret;
+
+	if (!test_and_clear_bit(offset, pdata->gchip_output))
+		return 0;
+
+	ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+				 SN_GPIO_MUX_MASK << shift,
+				 SN_GPIO_MUX_INPUT << shift);
+	if (ret) {
+		set_bit(offset, pdata->gchip_output);
+		return ret;
+	}
+
+	/*
+	 * NOTE: if nobody else is powering the device this may fully power
+	 * it off and when it comes back it will have lost all state, but
+	 * that's OK because the default is input and we're now an input.
+	 */
+	pm_runtime_put(pdata->dev);
+
+	return 0;
+}
+
+static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
+					      unsigned int offset, int val)
+{
+	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
+	int shift = offset * 2;
+	int ret;
+
+	if (test_and_set_bit(offset, pdata->gchip_output))
+		return 0;
+
+	pm_runtime_get_sync(pdata->dev);
+
+	/* Set value first to avoid glitching */
+	ti_sn_bridge_gpio_set(chip, offset, val);
+
+	/* Set direction */
+	ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+				 SN_GPIO_MUX_MASK << shift,
+				 SN_GPIO_MUX_OUTPUT << shift);
+	if (ret) {
+		clear_bit(offset, pdata->gchip_output);
+		pm_runtime_put(pdata->dev);
+	}
+
+	return ret;
+}
+
+static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	/* We won't keep pm_runtime if we're input, so switch there on free */
+	ti_sn_bridge_gpio_direction_input(chip, offset);
+}
+
+static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
+	"GPIO1", "GPIO2", "GPIO3", "GPIO4"
+};
+
+static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
+{
+	int ret;
+
+	/* Only init if someone is going to use us as a GPIO controller */
+	if (!of_property_read_bool(pdata->dev->of_node, "gpio-controller"))
+		return 0;
+
+	pdata->gchip.label = dev_name(pdata->dev);
+	pdata->gchip.parent = pdata->dev;
+	pdata->gchip.owner = THIS_MODULE;
+	pdata->gchip.free = ti_sn_bridge_gpio_free;
+	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
+	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
+	pdata->gchip.direction_output = ti_sn_bridge_gpio_direction_output;
+	pdata->gchip.get = ti_sn_bridge_gpio_get;
+	pdata->gchip.set = ti_sn_bridge_gpio_set;
+	pdata->gchip.can_sleep = true;
+	pdata->gchip.names = ti_sn_bridge_gpio_names;
+	pdata->gchip.ngpio = SN_NUM_GPIOS;
+	ret = devm_gpiochip_add_data(pdata->dev, &pdata->gchip, pdata);
+	if (ret)
+		dev_err(pdata->dev, "can't add gpio chip\n");
+
+	return ret;
+}
+
 static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -937,6 +1126,12 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	pm_runtime_enable(pdata->dev);
 
+	ret = ti_sn_setup_gpio_controller(pdata);
+	if (ret) {
+		pm_runtime_disable(pdata->dev);
+		return ret;
+	}
+
 	i2c_set_clientdata(client, pdata);
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
-- 
2.26.2.526.g744177e7f7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
