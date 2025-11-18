Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE0C6AB13
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 17:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E6F10E1B6;
	Tue, 18 Nov 2025 16:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NT29gvpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBF310E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8838960B51;
 Tue, 18 Nov 2025 16:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA37EC4CEF5;
 Tue, 18 Nov 2025 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763484212;
 bh=m8XjLzAXzOc37XC791aYHU9g3Jt73This5J26oyrmjQ=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=NT29gvpR84lN2dfHTso3YkTS9UNEQtMlXwrXxVLtmN5jSZJpfIWFJkQaafV/qMZk6
 ouFAFjbor6euAQnh3CE4Q9Cg1kDaPHy9OMaI8Ric1K/nPuc5aHy0/BfhBSyf3hQqjB
 VuJ9eB6MXqOYmatZ9HwJcLvn/iBEgDS/uivuX/jOZB3yrVpqtmRdfEnWMEDv3iOevc
 4G4dhBBEmuFrqGUARtkYNUVx6IAid+zGsr4mU0FSabQE7bkm5DD5PISepVWJ/6gEeT
 DuNk13l0NX2QgxlTWg7vV0WMIuadgPKxhBgYbFK2+bpDZwRfJMi2fYO2hAEUaFG0Uz
 M+VgdnXYRTLIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AA999CEDDA4;
 Tue, 18 Nov 2025 16:43:31 +0000 (UTC)
From: Petri Karhula via B4 Relay <devnull+petri.karhula.novatron.fi@kernel.org>
Date: Tue, 18 Nov 2025 16:43:02 +0000
Subject: [PATCH] backlight: Add Congatec Board Controller (CGBC) backlight
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi>
X-B4-Tracking: v=1; b=H4sIABWiHGkC/x3MQQqAIBBA0avIrBMcI6iuEi10mmwoLDQiiO6et
 HyL/x/InIQz9OqBxJdk2WMBVgpocTGwlqkYrLENIraagiftHa2bhOXUdUOIppu88S2U6Eg8y/0
 Ph/F9P8JnXcRgAAAA
X-Change-ID: 20251118-cgbc-backlight-35c1109db0b8
To: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Petri Karhula <petri.karhula@novatron.fi>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763484210; l=11033;
 i=petri.karhula@novatron.fi; s=20251118; h=from:subject:message-id;
 bh=4to+YvDeDBwc/AJTuZbkdhJA1zoGvBQP4eFOsodVlrc=;
 b=UKWw31Gnad+Ub8I3v28fhyvq7IfbTxNZ+v76htnhpjA/JzBNDRVljK29lCvv/hAXpT1fO+gx0
 IcJNhrCxdXECeUtymY8995pap5b9LoHlbBiCGIGcD/lB224/ZGcN0qc
X-Developer-Key: i=petri.karhula@novatron.fi; a=ed25519;
 pk=LRYJ99jPPsHJwdJEPkqlmzAMqo6oyw7I421aHEfDp7o=
X-Endpoint-Received: by B4 Relay for petri.karhula@novatron.fi/20251118
 with auth_id=567
X-Original-From: Petri Karhula <petri.karhula@novatron.fi>
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
Reply-To: petri.karhula@novatron.fi
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petri Karhula <petri.karhula@novatron.fi>

This driver provides backlight brightness control through the Linux
backlight subsystem. It communicates with the board controller to
adjust LCD backlight using PWM signals. Communication is done
through Congatec Board Controller core driver.

Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>
---
Backlight driver to control backlight behind Congatec Board Controller.
This driver provides backlight brightness control through the Linux
backlight subsystem. It communicates with the board controller to
adjust LCD backlight using PWM signals. Communication is done
through Congatec Board Controller core driver.
    
---
 drivers/mfd/cgbc-core.c           |   1 +
 drivers/video/backlight/Kconfig   |  11 ++
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/cgbc_bl.c | 281 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 294 insertions(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 4782ff1114a9..10bb4b414c34 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -237,6 +237,7 @@ static struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-i2c", .id = 1 },
 	{ .name = "cgbc-i2c", .id = 2 },
 	{ .name = "cgbc-hwmon"	},
+	{ .name = "cgbc-backlight" },
 };
 
 static int cgbc_map(struct cgbc_device_data *cgbc)
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208cee..702f3b8ed036 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -249,6 +249,17 @@ config BACKLIGHT_PWM
 	  If you have a LCD backlight adjustable by PWM, say Y to enable
 	  this driver.
 
+config BACKLIGHT_CGBC
+	tristate "Congatec Board Controller (CGBC) backlight support"
+	depends on MFD_CGBC && X86
+	help
+	  Say Y here to enable support for LCD backlight control on Congatec
+	  x86-based boards via the CGBC (Congatec Board Controller).
+
+	  This driver provides backlight brightness control through the Linux
+	  backlight subsystem. It communicates with the board controller to
+	  adjust LCD backlight using PWM signals.
+
 config BACKLIGHT_DA903X
 	tristate "Backlight Driver for DA9030/DA9034 using WLED"
 	depends on PMIC_DA903X
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index dfbb169bf6ea..0169fd8873ed 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
+obj-$(CONFIG_BACKLIGHT_CGBC)		+= cgbc_bl.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
diff --git a/drivers/video/backlight/cgbc_bl.c b/drivers/video/backlight/cgbc_bl.c
new file mode 100644
index 000000000000..4382321f4cac
--- /dev/null
+++ b/drivers/video/backlight/cgbc_bl.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Congatec Board Controller (CGBC) Backlight Driver
+ *
+ * This driver provides backlight control for LCD displays connected to
+ * Congatec boards via the CGBC (Congatec Board Controller). It integrates
+ * with the Linux backlight subsystem and communicates with hardware through
+ * the cgbc-core module.
+ *
+ * Copyright (C) 2025 Novatron Oy
+ *
+ * Author: Petri Karhula <petri.karhula@novatron.fi>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/backlight.h>
+
+#include <linux/mfd/cgbc.h>
+
+#define CGBC_BL_DRIVER_VERSION     "0.0.1"
+
+#define BLT_PWM_DUTY_MASK          0x7F
+#define BLT_PWM_INVERTED_MASK      0x80
+
+/* CGBC command for PWM brightness control*/
+#define CGBC_CMD_BLT0_PWM          0x75
+
+#define CGBC_BL_MAX_BRIGHTNESS     100
+
+/**
+ * CGBC backlight driver data
+ * @dev: Pointer to the platform device
+ * @bl_dev: Pointer to the backlight device
+ * @cgbc: Pointer to the parent CGBC device data
+ * @current_brightness: Current brightness level (0-100)
+ */
+struct cgbc_bl_data {
+	struct device *dev;
+	struct backlight_device *bl_dev;
+	struct cgbc_device_data *cgbc;
+	unsigned int current_brightness;
+};
+
+/**
+ * Read current PWM settings from hardware
+ * @bl_data: Backlight driver data
+ *
+ * Reads the current PWM duty cycle percentage (= brightness level)
+ * from the board controller.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int cgbc_bl_read_pwm_settings(struct cgbc_bl_data *bl_data)
+{
+	u8 cmd_buf[4] = { CGBC_CMD_BLT0_PWM, 0, 0, 0 };
+	u8 reply_buf[3];
+	int ret;
+
+	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
+			   sizeof(reply_buf), NULL);
+
+	if (ret < 0) {
+		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Only return PWM duty factor percentage,
+	 * ignore polarity inversion bit (bit 7)
+	 */
+	bl_data->current_brightness = reply_buf[0] & BLT_PWM_DUTY_MASK;
+
+	dev_dbg(bl_data->dev, "Current PWM duty=%u\n", bl_data->current_brightness);
+
+	return 0;
+}
+
+/**
+ * Set backlight brightness
+ * @bl_data: Backlight driver data
+ * @brightness: Brightness level (0-100)
+ *
+ * Sets the backlight brightness by configuring the PWM duty cycle.
+ * Preserves the current polarity and frequency settings.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int cgbc_bl_set_brightness(struct cgbc_bl_data *bl_data, u8 brightness)
+{
+	u8 cmd_buf[4] = { CGBC_CMD_BLT0_PWM, 0, 0, 0 };
+	u8 reply_buf[3];
+	int ret;
+
+	/* Read the current values */
+	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
+			   sizeof(reply_buf), NULL);
+
+	if (ret < 0) {
+		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Prepare command buffer for writing new settings. Only 2nd byte is changed
+	 * to set new brightness (PWM duty cycle %). Other balues (polarity, frequency)
+	 * are preserved from the read values.
+	 */
+	cmd_buf[1] = (reply_buf[0] & BLT_PWM_INVERTED_MASK) |
+		     (BLT_PWM_DUTY_MASK & brightness);
+	cmd_buf[2] = reply_buf[1];
+	cmd_buf[3] = reply_buf[2];
+
+	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
+			   sizeof(reply_buf), NULL);
+
+	if (ret < 0) {
+		dev_err(bl_data->dev, "Failed to set brightness: %d\n", ret);
+		return ret;
+	}
+
+	bl_data->current_brightness = reply_buf[0] & BLT_PWM_DUTY_MASK;
+
+	/* Verify the setting was applied correctly */
+	if (bl_data->current_brightness != brightness) {
+		dev_err(bl_data->dev,
+			"Brightness setting verification failed\n");
+		return -EIO;
+	}
+
+	dev_dbg(bl_data->dev, "Set brightness to %u\n", brightness);
+
+	return 0;
+}
+
+/**
+ * Backlight update callback
+ * @bl: Backlight device
+ *
+ * Called by the backlight subsystem when brightness needs to be updated.
+ * Changes the brightness level on the hardware
+ * if requested value differs from the current setting.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int cgbc_bl_update_status(struct backlight_device *bl)
+{
+	struct cgbc_bl_data *bl_data = bl_get_data(bl);
+	u8 brightness;
+	int ret;
+
+	brightness = bl->props.brightness;
+
+	if (brightness != bl_data->current_brightness) {
+		ret = cgbc_bl_set_brightness(bl_data, brightness);
+
+		if (ret < 0) {
+			dev_err(bl_data->dev, "Failed to set brightness: %d\n",
+			       ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * Get current backlight brightness
+ * @bl: Backlight device
+ *
+ * Returns the current brightness level by reading from hardware.
+ *
+ * Return: Current brightness level (0-100), or negative error code
+ */
+static int cgbc_bl_get_brightness(struct backlight_device *bl)
+{
+	struct cgbc_bl_data *bl_data = bl_get_data(bl);
+	int ret;
+
+	/* Read current PWM brightness settings */
+	ret = cgbc_bl_read_pwm_settings(bl_data);
+
+	if (ret < 0) {
+		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
+		return ret;
+	}
+
+	return bl_data->current_brightness;
+}
+
+/* Backlight device operations */
+static const struct backlight_ops cgbc_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = cgbc_bl_update_status,
+	.get_brightness = cgbc_bl_get_brightness,
+};
+
+/**
+ * Probe function for CGBC backlight driver
+ * @pdev: Platform device
+ *
+ * Initializes the CGBC backlight driver and registers it with the
+ * Linux backlight subsystem.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int cgbc_bl_probe(struct platform_device *pdev)
+{
+	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
+	struct cgbc_bl_data *bl_data;
+	struct backlight_properties props;
+	struct backlight_device *bl_dev;
+	int ret;
+
+	bl_data = devm_kzalloc(&pdev->dev, sizeof(*bl_data), GFP_KERNEL);
+
+	if (!bl_data)
+		return -ENOMEM;
+
+	bl_data->dev = &pdev->dev;
+	bl_data->cgbc = cgbc;
+
+	ret = cgbc_bl_read_pwm_settings(bl_data);
+
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to read initial PWM settings: %d\n",
+			ret);
+		return ret;
+	}
+
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = CGBC_BL_MAX_BRIGHTNESS;
+	props.brightness = bl_data->current_brightness;
+
+	bl_dev = devm_backlight_device_register(&pdev->dev, "cgbc-backlight",
+						&pdev->dev, bl_data,
+						&cgbc_bl_ops, &props);
+
+	if (IS_ERR(bl_dev)) {
+		dev_err(&pdev->dev, "Failed to register backlight device\n");
+		return PTR_ERR(bl_dev);
+	}
+
+	bl_data->bl_dev = bl_dev;
+	platform_set_drvdata(pdev, bl_data);
+
+	dev_info(&pdev->dev,
+		 "CGBC backlight driver registered (brightness=%u)\n",
+		 bl_data->current_brightness);
+
+	return 0;
+}
+
+/**
+ * Remove function for CGBC backlight driver
+ * @pdev: Platform device
+ *
+ * The Linux device-managed resource framework (devres) does the cleanup.
+ * No explicit cleanup is needed here.
+ */
+static void cgbc_bl_remove(struct platform_device *pdev)
+{
+	dev_info(&pdev->dev, "CGBC backlight driver removed\n");
+}
+
+static struct platform_driver cgbc_bl_driver = {
+	.driver = {
+		.name = "cgbc-backlight",
+	},
+	.probe = cgbc_bl_probe,
+	.remove = cgbc_bl_remove,
+};
+
+module_platform_driver(cgbc_bl_driver);
+
+MODULE_AUTHOR("Petri Karhula <petri.karhula@novatron.fi>");
+MODULE_DESCRIPTION("Congatec Board Controller (CGBC) Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION(CGBC_BL_DRIVER_VERSION);
+MODULE_ALIAS("platform:cgbc-backlight");

---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251118-cgbc-backlight-35c1109db0b8

Best regards,
-- 
Petri Karhula <petri.karhula@novatron.fi>


