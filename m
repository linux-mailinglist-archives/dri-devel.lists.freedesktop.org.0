Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE6A5B602
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 02:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F8B10E4FD;
	Tue, 11 Mar 2025 01:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="r+DzR7xI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B571110E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=m9R48WkcPvqp+088QwO4h5yu2gGi1ZdqKqOstpglSDI=; b=r+DzR7xIbpxJpxrF
 Vle1nM4Mww2qn9rY0gEH6/N4yluw+PcbqRVd+ICIz0S/vsnqKiDjooyiqJMWroJNM0T9sFXQ2+BHF
 9aZEmSQ9n3Vd7qOzGQ6jFpI51vTJz1O0ga4vCK8W/vMWg24HtXHthfgd1kGUyrIIy5QWbPXVFQcFK
 8fmX8QvPCnF2GXvn7x37Y4SaZINHBoU903w7j2OvlMCkEv607xpf9yf6xm2D9EHFStqDggRlbz8hM
 LyKkZ+Vm0cSMQ/XtSwKnL0VgomOcwyUwL27zPIxNdSP9ZRt/MugHKeSuGiP84M4rt9q6V/ajLWy10
 /VSeFvgC3OqCDMlxGA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trokt-0042n5-1N;
 Tue, 11 Mar 2025 01:50:03 +0000
From: linux@treblig.org
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 5/9] regulator: pcf50633-regulator: Remove
Date: Tue, 11 Mar 2025 01:49:55 +0000
Message-ID: <20250311014959.743322-6-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311014959.743322-1-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/regulator/Kconfig              |   7 --
 drivers/regulator/Makefile             |   1 -
 drivers/regulator/pcf50633-regulator.c | 124 -------------------------
 3 files changed, 132 deletions(-)
 delete mode 100644 drivers/regulator/pcf50633-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177..1236b3a1f93f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -988,13 +988,6 @@ config REGULATOR_PCAP
 	 This driver provides support for the voltage regulators of the
 	 PCAP2 PMIC.
 
-config REGULATOR_PCF50633
-	tristate "NXP PCF50633 regulator driver"
-	depends on MFD_PCF50633
-	help
-	 Say Y here to support the voltage regulators and converters
-	 on PCF50633
-
 config REGULATOR_PF8X00
 	tristate "NXP PF8100/PF8121A/PF8200 regulator driver"
 	depends on I2C && OF
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 3d5a803dce8a..8dca3567437f 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -132,7 +132,6 @@ obj-$(CONFIG_REGULATOR_PWM) += pwm-regulator.o
 obj-$(CONFIG_REGULATOR_TPS51632) += tps51632-regulator.o
 obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
 obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
-obj-$(CONFIG_REGULATOR_PCF50633) += pcf50633-regulator.o
 obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
diff --git a/drivers/regulator/pcf50633-regulator.c b/drivers/regulator/pcf50633-regulator.c
deleted file mode 100644
index 9f08a62c800e..000000000000
--- a/drivers/regulator/pcf50633-regulator.c
+++ /dev/null
@@ -1,124 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 PMIC Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte and Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/platform_device.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/pmic.h>
-
-#define PCF50633_REGULATOR(_name, _id, _min_uV, _uV_step, _min_sel, _n) \
-	{							\
-		.name = _name,					\
-		.id = PCF50633_REGULATOR_##_id,			\
-		.ops = &pcf50633_regulator_ops,			\
-		.n_voltages = _n,				\
-		.min_uV = _min_uV,				\
-		.uV_step = _uV_step,				\
-		.linear_min_sel = _min_sel,			\
-		.type = REGULATOR_VOLTAGE,			\
-		.owner = THIS_MODULE,				\
-		.vsel_reg = PCF50633_REG_##_id##OUT,		\
-		.vsel_mask = 0xff,				\
-		.enable_reg = PCF50633_REG_##_id##OUT + 1,	\
-		.enable_mask = PCF50633_REGULATOR_ON,		\
-	}
-
-static const struct regulator_ops pcf50633_regulator_ops = {
-	.set_voltage_sel = regulator_set_voltage_sel_regmap,
-	.get_voltage_sel = regulator_get_voltage_sel_regmap,
-	.list_voltage = regulator_list_voltage_linear,
-	.map_voltage = regulator_map_voltage_linear,
-	.enable = regulator_enable_regmap,
-	.disable = regulator_disable_regmap,
-	.is_enabled = regulator_is_enabled_regmap,
-};
-
-static const struct regulator_desc regulators[] = {
-	[PCF50633_REGULATOR_AUTO] =
-		PCF50633_REGULATOR("auto", AUTO, 1800000, 25000, 0x2f, 128),
-	[PCF50633_REGULATOR_DOWN1] =
-		PCF50633_REGULATOR("down1", DOWN1, 625000, 25000, 0, 96),
-	[PCF50633_REGULATOR_DOWN2] =
-		PCF50633_REGULATOR("down2", DOWN2, 625000, 25000, 0, 96),
-	[PCF50633_REGULATOR_LDO1] =
-		PCF50633_REGULATOR("ldo1", LDO1, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO2] =
-		PCF50633_REGULATOR("ldo2", LDO2, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO3] =
-		PCF50633_REGULATOR("ldo3", LDO3, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO4] =
-		PCF50633_REGULATOR("ldo4", LDO4, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO5] =
-		PCF50633_REGULATOR("ldo5", LDO5, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO6] =
-		PCF50633_REGULATOR("ldo6", LDO6, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_HCLDO] =
-		PCF50633_REGULATOR("hcldo", HCLDO, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_MEMLDO] =
-		PCF50633_REGULATOR("memldo", MEMLDO, 900000, 100000, 0, 28),
-};
-
-static int pcf50633_regulator_probe(struct platform_device *pdev)
-{
-	struct regulator_dev *rdev;
-	struct pcf50633 *pcf;
-	struct regulator_config config = { };
-
-	/* Already set by core driver */
-	pcf = dev_to_pcf50633(pdev->dev.parent);
-
-	config.dev = &pdev->dev;
-	config.init_data = dev_get_platdata(&pdev->dev);
-	config.driver_data = pcf;
-	config.regmap = pcf->regmap;
-
-	rdev = devm_regulator_register(&pdev->dev, &regulators[pdev->id],
-				       &config);
-	if (IS_ERR(rdev))
-		return PTR_ERR(rdev);
-
-	platform_set_drvdata(pdev, rdev);
-
-	if (pcf->pdata->regulator_registered)
-		pcf->pdata->regulator_registered(pcf, pdev->id);
-
-	return 0;
-}
-
-static struct platform_driver pcf50633_regulator_driver = {
-	.driver = {
-		.name = "pcf50633-regulator",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.probe = pcf50633_regulator_probe,
-};
-
-static int __init pcf50633_regulator_init(void)
-{
-	return platform_driver_register(&pcf50633_regulator_driver);
-}
-subsys_initcall(pcf50633_regulator_init);
-
-static void __exit pcf50633_regulator_exit(void)
-{
-	platform_driver_unregister(&pcf50633_regulator_driver);
-}
-module_exit(pcf50633_regulator_exit);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 regulator driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-regulator");
-- 
2.48.1

