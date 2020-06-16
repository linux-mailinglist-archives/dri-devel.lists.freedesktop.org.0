Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094E1FC758
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4776EAC7;
	Wed, 17 Jun 2020 07:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079AB6E9AF;
 Tue, 16 Jun 2020 22:44:12 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id D54A061634;
 Tue, 16 Jun 2020 22:44:10 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v5 2/2] mfd: ene-kb3930: Add driver for ENE KB3930 Embedded
 Controller
Date: Wed, 17 Jun 2020 00:44:04 +0200
Message-Id: <20200616224404.994285-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616224404.994285-1-lkundrak@v3.sk>
References: <20200616224404.994285-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: Russell King <linux+etnaviv@arlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver provides access to the EC RAM of said embedded controller
attached to the I2C bus as well as optionally supporting its slightly weird
power-off/restart protocol.

A particular implementation of the EC firmware can be identified by a
model byte. If this driver identifies the Dell Ariel platform, it
registers the appropriate cells.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v3:
- Clarify that the power-off function is provided by this driver while
  LEDS_ARIEL is necessary to drive the leds in Kconfig help text
- s/kb3930_power_off/kb3930_pm_power_off/, s/global_kb3930/kb3930_power_off/
- Don't fail with -EEXIST with more than one instance
- s/ret < 0/ret/ for devm_mfd_add_devices() return value
- Drop a \n between struct i2c_driver and module_i2c_driver()

Changes since v2:
- Sort the includes
- s/EC_MODEL_ID/EC_MODEL/
- Add a couple of clarifying comments
- Use #defines for values used in poweroff routine
- Remove priority from a restart notifier block
- s/priv/ddata/
- s/ec_ram/ram_regmap/ for the regmap name
- Fix the error handling when getting off gpios was not successful
- Remove a useless dev_info at the end of probe()
- Use i2c probe_new() callback, drop i2c_device_id
- Modify the logic in checking the model ID

 drivers/mfd/Kconfig      |  11 ++
 drivers/mfd/Makefile     |   1 +
 drivers/mfd/ene-kb3930.c | 211 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/mfd/ene-kb3930.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a37d7d1713820..7569f1d1703e3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -398,6 +398,17 @@ config MFD_DLN2
 	  etc. must be enabled in order to use the functionality of
 	  the device.
 
+config MFD_ENE_KB3930
+	tristate "ENE KB3930 Embedded Controller support"
+	depends on I2C
+	depends on MACH_MMP3_DT || COMPILE_TEST
+	select MFD_CORE
+	help
+	  This adds support for the power-off functionality and access to
+	  the registers that control LEDS and USB port power on ENE KB3930
+	  Embedded Controller. To use the LED functionality LEDS_ARIEL must
+	  be enabled.
+
 config MFD_EXYNOS_LPASS
 	tristate "Samsung Exynos SoC Low Power Audio Subsystem"
 	depends on ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9367a92f795a6..11085a6968398 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
 obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
 obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
 obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
+obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
 
diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
new file mode 100644
index 0000000000000..75eced148ce53
--- /dev/null
+++ b/drivers/mfd/ene-kb3930.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
+/*
+ * ENE KB3930 Embedded Controller Driver
+ *
+ * Copyright (C) 2020 Lubomir Rintel
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+
+/* I2C registers that are multiplexing access to the EC RAM. */
+enum {
+	EC_DATA_IN	= 0x00,
+	EC_RAM_OUT	= 0x80,
+	EC_RAM_IN	= 0x81,
+};
+
+/* EC RAM registers. */
+enum {
+	EC_MODEL	= 0x30,
+	EC_VERSION_MAJ	= 0x31,
+	EC_VERSION_MIN	= 0x32,
+};
+
+struct kb3930 {
+	struct i2c_client *client;
+	struct regmap *ram_regmap;
+	struct gpio_descs *off_gpios;
+};
+
+struct kb3930 *kb3930_power_off;
+
+#define EC_GPIO_WAVE		0
+#define EC_GPIO_OFF_MODE	1
+
+#define EC_OFF_MODE_REBOOT	0
+#define EC_OFF_MODE_POWER	1
+
+static void kb3930_off(struct kb3930 *ddata, int off_mode)
+{
+	gpiod_direction_output(ddata->off_gpios->desc[EC_GPIO_OFF_MODE],
+			       off_mode);
+
+	/*
+	 * The EC initiates a shutdown when it detects a 10 MHz wave, inspecting the
+	 * other GPIO pin to decide whether it's supposed to turn the power off or
+	 * reset the board.
+	 */
+	while (1) {
+		mdelay(50);
+		gpiod_direction_output(ddata->off_gpios->desc[EC_GPIO_WAVE], 0);
+		mdelay(50);
+		gpiod_direction_output(ddata->off_gpios->desc[EC_GPIO_WAVE], 1);
+	}
+}
+
+static int kb3930_restart(struct notifier_block *this,
+			  unsigned long mode, void *cmd)
+{
+	kb3930_off(kb3930_power_off, EC_OFF_MODE_REBOOT);
+	return NOTIFY_DONE;
+}
+
+static void kb3930_pm_power_off(void)
+{
+	kb3930_off(kb3930_power_off, EC_OFF_MODE_POWER);
+}
+
+static struct notifier_block kb3930_restart_nb = {
+	.notifier_call = kb3930_restart,
+};
+
+static const struct mfd_cell ariel_ec_cells[] = {
+	{ .name = "dell-wyse-ariel-led", },
+	{ .name = "dell-wyse-ariel-power", },
+};
+
+static int kb3930_ec_ram_reg_write(void *context, unsigned int reg,
+				   unsigned int val)
+{
+	struct kb3930 *ddata = context;
+
+	return i2c_smbus_write_word_data(ddata->client, EC_RAM_OUT,
+					 (val << 8) | reg);
+}
+
+static int kb3930_ec_ram_reg_read(void *context, unsigned int reg,
+				  unsigned int *val)
+{
+	struct kb3930 *ddata = context;
+	int ret;
+
+	ret = i2c_smbus_write_word_data(ddata->client, EC_RAM_IN, reg);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(ddata->client, EC_DATA_IN);
+	if (ret < 0)
+		return ret;
+
+	*val = ret >> 8;
+	return 0;
+}
+
+static const struct regmap_config kb3930_ram_regmap_config = {
+	.name = "ec_ram",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+	.max_register = 0xff,
+	.reg_write = kb3930_ec_ram_reg_write,
+	.reg_read = kb3930_ec_ram_reg_read,
+	.fast_io = false,
+};
+
+static int kb3930_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np = dev->of_node;
+	struct kb3930 *ddata;
+	unsigned int model;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	kb3930_power_off = ddata;
+	ddata->client = client;
+	i2c_set_clientdata(client, ddata);
+
+	ddata->ram_regmap = devm_regmap_init(dev, NULL, ddata,
+					     &kb3930_ram_regmap_config);
+	if (IS_ERR(ddata->ram_regmap))
+		return PTR_ERR(ddata->ram_regmap);
+
+	ret = regmap_read(ddata->ram_regmap, EC_MODEL, &model);
+	if (ret < 0)
+		return ret;
+
+	/* Currently we only support the cells present on Dell Ariel model. */
+	if (model != 'J') {
+		dev_err(dev, "unknown board model: %02x\n", model);
+		return -ENODEV;
+	}
+
+	/* These are the cells valid for model == 'J' only. */
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   ariel_ec_cells,
+				   ARRAY_SIZE(ariel_ec_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	if (of_property_read_bool(np, "system-power-controller")) {
+		ddata->off_gpios =
+			devm_gpiod_get_array_optional(dev, "off", GPIOD_IN);
+		if (IS_ERR(ddata->off_gpios))
+			return PTR_ERR(ddata->off_gpios);
+		if (ddata->off_gpios->ndescs < 2) {
+			dev_err(dev, "invalid off-gpios property\n");
+			return -EINVAL;
+		}
+	}
+	if (ddata->off_gpios) {
+		register_restart_handler(&kb3930_restart_nb);
+		if (pm_power_off == NULL)
+			pm_power_off = kb3930_pm_power_off;
+	}
+
+	return 0;
+}
+
+static int kb3930_remove(struct i2c_client *client)
+{
+	struct kb3930 *ddata = i2c_get_clientdata(client);
+
+	if (ddata->off_gpios) {
+		if (pm_power_off == kb3930_pm_power_off)
+			pm_power_off = NULL;
+		unregister_restart_handler(&kb3930_restart_nb);
+	}
+	kb3930_power_off = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id kb3930_dt_ids[] = {
+	{ .compatible = "ene,kb3930" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, kb3930_dt_ids);
+
+static struct i2c_driver kb3930_driver = {
+	.probe_new = kb3930_probe,
+	.remove = kb3930_remove,
+	.driver = {
+		.name = "ene-kb3930",
+		.of_match_table = of_match_ptr(kb3930_dt_ids),
+	},
+};
+module_i2c_driver(kb3930_driver);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("ENE KB3930 Embedded Controller Driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
