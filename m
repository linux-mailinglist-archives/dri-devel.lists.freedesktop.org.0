Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC257A587A2
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 20:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E15610E1D3;
	Sun,  9 Mar 2025 19:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ZZqA3VcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6C10E1D3
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 19:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=PTHHpGneiUEeWnFXNFBaFyXoGWMjYB9q2UZzdF4jnAM=; b=ZZqA3VcFi90+YU2C
 GZWdJ8JLNzNBGt2ElSLvI2JgUeWvDDfDCB3mSIep/DLCl4tl2O4n4jEDTx7nDOPG28TJYHiGPyDH2
 3INrv54asBa0ZmF6jF5MgrxJP/A8YxHGmVhann3E7S0R5ufWSsdGP0am/nv4WPEPbH90z49Dn1YbD
 Gdgy+3OXSciaFJvX7b/kCeL/OkZn3xBRVSiMOfAM9vUaVH9UrNzvJeXEEa+xsBR/tR6vRUkrw6/l8
 fN0kHoza+xhd0Ld0Jcc4GJqLDWYjzdV8qu+kIcRfPeIRKlUiLW653oBZKzAFuG2DqzkN8MIFwZtXi
 CKKPidy5AFzcQ1qh+g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trMSG-003kFU-13;
 Sun, 09 Mar 2025 19:36:56 +0000
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
Subject: [PATCH 7/9] power: supply: pcf50633: Remove charger
Date: Sun,  9 Mar 2025 19:36:10 +0000
Message-ID: <20250309193612.251929-8-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
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
 drivers/power/supply/Kconfig            |   6 -
 drivers/power/supply/Makefile           |   1 -
 drivers/power/supply/pcf50633-charger.c | 466 ------------------------
 3 files changed, 473 deletions(-)
 delete mode 100644 drivers/power/supply/pcf50633-charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 7b18358f194a..aa569badaf73 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -449,12 +449,6 @@ config CHARGER_88PM860X
 	help
 	  Say Y here to enable charger for Marvell 88PM860x chip.
 
-config CHARGER_PCF50633
-	tristate "NXP PCF50633 MBC"
-	depends on MFD_PCF50633
-	help
-	  Say Y to include support for NXP PCF50633 Main Battery Charger.
-
 config BATTERY_RX51
 	tristate "Nokia RX-51 (N900) battery driver"
 	depends on TWL4030_MADC
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index b55cc48a4c86..eedb00e377cb 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -62,7 +62,6 @@ obj-$(CONFIG_CHARGER_RT9467)	+= rt9467-charger.o
 obj-$(CONFIG_CHARGER_RT9471)	+= rt9471.o
 obj-$(CONFIG_BATTERY_TWL4030_MADC)	+= twl4030_madc_battery.o
 obj-$(CONFIG_CHARGER_88PM860X)	+= 88pm860x_charger.o
-obj-$(CONFIG_CHARGER_PCF50633)	+= pcf50633-charger.o
 obj-$(CONFIG_BATTERY_RX51)	+= rx51_battery.o
 obj-$(CONFIG_AB8500_BM)		+= ab8500_bmdata.o ab8500_charger.o ab8500_fg.o ab8500_btemp.o ab8500_chargalg.o
 obj-$(CONFIG_CHARGER_CPCAP)	+= cpcap-charger.o
diff --git a/drivers/power/supply/pcf50633-charger.c b/drivers/power/supply/pcf50633-charger.c
deleted file mode 100644
index 0136bc87b105..000000000000
--- a/drivers/power/supply/pcf50633-charger.c
+++ /dev/null
@@ -1,466 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 Main Battery Charger Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte, Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/device.h>
-#include <linux/sysfs.h>
-#include <linux/platform_device.h>
-#include <linux/power_supply.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/mbc.h>
-
-struct pcf50633_mbc {
-	struct pcf50633 *pcf;
-
-	int adapter_online;
-	int usb_online;
-
-	struct power_supply *usb;
-	struct power_supply *adapter;
-	struct power_supply *ac;
-};
-
-int pcf50633_mbc_usb_curlim_set(struct pcf50633 *pcf, int ma)
-{
-	struct pcf50633_mbc *mbc = platform_get_drvdata(pcf->mbc_pdev);
-	int ret = 0;
-	u8 bits;
-	u8 mbcs2, chgmod;
-	unsigned int mbcc5;
-
-	if (ma >= 1000) {
-		bits = PCF50633_MBCC7_USB_1000mA;
-		ma = 1000;
-	} else if (ma >= 500) {
-		bits = PCF50633_MBCC7_USB_500mA;
-		ma = 500;
-	} else if (ma >= 100) {
-		bits = PCF50633_MBCC7_USB_100mA;
-		ma = 100;
-	} else {
-		bits = PCF50633_MBCC7_USB_SUSPEND;
-		ma = 0;
-	}
-
-	ret = pcf50633_reg_set_bit_mask(pcf, PCF50633_REG_MBCC7,
-					PCF50633_MBCC7_USB_MASK, bits);
-	if (ret)
-		dev_err(pcf->dev, "error setting usb curlim to %d mA\n", ma);
-	else
-		dev_info(pcf->dev, "usb curlim to %d mA\n", ma);
-
-	/*
-	 * We limit the charging current to be the USB current limit.
-	 * The reason is that on pcf50633, when it enters PMU Standby mode,
-	 * which it does when the device goes "off", the USB current limit
-	 * reverts to the variant default.  In at least one common case, that
-	 * default is 500mA.  By setting the charging current to be the same
-	 * as the USB limit we set here before PMU standby, we enforce it only
-	 * using the correct amount of current even when the USB current limit
-	 * gets reset to the wrong thing
-	 */
-
-	if (mbc->pcf->pdata->charger_reference_current_ma) {
-		mbcc5 = (ma << 8) / mbc->pcf->pdata->charger_reference_current_ma;
-		if (mbcc5 > 255)
-			mbcc5 = 255;
-		pcf50633_reg_write(mbc->pcf, PCF50633_REG_MBCC5, mbcc5);
-	}
-
-	mbcs2 = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCS2);
-	chgmod = (mbcs2 & PCF50633_MBCS2_MBC_MASK);
-
-	/* If chgmod == BATFULL, setting chgena has no effect.
-	 * Datasheet says we need to set resume instead but when autoresume is
-	 * used resume doesn't work. Clear and set chgena instead.
-	 */
-	if (chgmod != PCF50633_MBCS2_MBC_BAT_FULL)
-		pcf50633_reg_set_bit_mask(pcf, PCF50633_REG_MBCC1,
-				PCF50633_MBCC1_CHGENA, PCF50633_MBCC1_CHGENA);
-	else {
-		pcf50633_reg_clear_bits(pcf, PCF50633_REG_MBCC1,
-				PCF50633_MBCC1_CHGENA);
-		pcf50633_reg_set_bit_mask(pcf, PCF50633_REG_MBCC1,
-				PCF50633_MBCC1_CHGENA, PCF50633_MBCC1_CHGENA);
-	}
-
-	power_supply_changed(mbc->usb);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pcf50633_mbc_usb_curlim_set);
-
-int pcf50633_mbc_get_status(struct pcf50633 *pcf)
-{
-	struct pcf50633_mbc *mbc  = platform_get_drvdata(pcf->mbc_pdev);
-	int status = 0;
-	u8 chgmod;
-
-	if (!mbc)
-		return 0;
-
-	chgmod = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCS2)
-		& PCF50633_MBCS2_MBC_MASK;
-
-	if (mbc->usb_online)
-		status |= PCF50633_MBC_USB_ONLINE;
-	if (chgmod == PCF50633_MBCS2_MBC_USB_PRE ||
-	    chgmod == PCF50633_MBCS2_MBC_USB_PRE_WAIT ||
-	    chgmod == PCF50633_MBCS2_MBC_USB_FAST ||
-	    chgmod == PCF50633_MBCS2_MBC_USB_FAST_WAIT)
-		status |= PCF50633_MBC_USB_ACTIVE;
-	if (mbc->adapter_online)
-		status |= PCF50633_MBC_ADAPTER_ONLINE;
-	if (chgmod == PCF50633_MBCS2_MBC_ADP_PRE ||
-	    chgmod == PCF50633_MBCS2_MBC_ADP_PRE_WAIT ||
-	    chgmod == PCF50633_MBCS2_MBC_ADP_FAST ||
-	    chgmod == PCF50633_MBCS2_MBC_ADP_FAST_WAIT)
-		status |= PCF50633_MBC_ADAPTER_ACTIVE;
-
-	return status;
-}
-EXPORT_SYMBOL_GPL(pcf50633_mbc_get_status);
-
-int pcf50633_mbc_get_usb_online_status(struct pcf50633 *pcf)
-{
-	struct pcf50633_mbc *mbc  = platform_get_drvdata(pcf->mbc_pdev);
-
-	if (!mbc)
-		return 0;
-
-	return mbc->usb_online;
-}
-EXPORT_SYMBOL_GPL(pcf50633_mbc_get_usb_online_status);
-
-static ssize_t
-show_chgmode(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct pcf50633_mbc *mbc = dev_get_drvdata(dev);
-
-	u8 mbcs2 = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCS2);
-	u8 chgmod = (mbcs2 & PCF50633_MBCS2_MBC_MASK);
-
-	return sysfs_emit(buf, "%d\n", chgmod);
-}
-static DEVICE_ATTR(chgmode, S_IRUGO, show_chgmode, NULL);
-
-static ssize_t
-show_usblim(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct pcf50633_mbc *mbc = dev_get_drvdata(dev);
-	u8 usblim = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCC7) &
-						PCF50633_MBCC7_USB_MASK;
-	unsigned int ma;
-
-	if (usblim == PCF50633_MBCC7_USB_1000mA)
-		ma = 1000;
-	else if (usblim == PCF50633_MBCC7_USB_500mA)
-		ma = 500;
-	else if (usblim == PCF50633_MBCC7_USB_100mA)
-		ma = 100;
-	else
-		ma = 0;
-
-	return sysfs_emit(buf, "%u\n", ma);
-}
-
-static ssize_t set_usblim(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
-{
-	struct pcf50633_mbc *mbc = dev_get_drvdata(dev);
-	unsigned long ma;
-	int ret;
-
-	ret = kstrtoul(buf, 10, &ma);
-	if (ret)
-		return ret;
-
-	pcf50633_mbc_usb_curlim_set(mbc->pcf, ma);
-
-	return count;
-}
-
-static DEVICE_ATTR(usb_curlim, S_IRUGO | S_IWUSR, show_usblim, set_usblim);
-
-static ssize_t
-show_chglim(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct pcf50633_mbc *mbc = dev_get_drvdata(dev);
-	u8 mbcc5 = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCC5);
-	unsigned int ma;
-
-	if (!mbc->pcf->pdata->charger_reference_current_ma)
-		return -ENODEV;
-
-	ma = (mbc->pcf->pdata->charger_reference_current_ma *  mbcc5) >> 8;
-
-	return sysfs_emit(buf, "%u\n", ma);
-}
-
-static ssize_t set_chglim(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
-{
-	struct pcf50633_mbc *mbc = dev_get_drvdata(dev);
-	unsigned long ma;
-	unsigned int mbcc5;
-	int ret;
-
-	if (!mbc->pcf->pdata->charger_reference_current_ma)
-		return -ENODEV;
-
-	ret = kstrtoul(buf, 10, &ma);
-	if (ret)
-		return ret;
-
-	mbcc5 = (ma << 8) / mbc->pcf->pdata->charger_reference_current_ma;
-	if (mbcc5 > 255)
-		mbcc5 = 255;
-	pcf50633_reg_write(mbc->pcf, PCF50633_REG_MBCC5, mbcc5);
-
-	return count;
-}
-
-/*
- * This attribute allows to change MBC charging limit on the fly
- * independently of usb current limit. It also gets set automatically every
- * time usb current limit is changed.
- */
-static DEVICE_ATTR(chg_curlim, S_IRUGO | S_IWUSR, show_chglim, set_chglim);
-
-static struct attribute *pcf50633_mbc_sysfs_attrs[] = {
-	&dev_attr_chgmode.attr,
-	&dev_attr_usb_curlim.attr,
-	&dev_attr_chg_curlim.attr,
-	NULL,
-};
-
-ATTRIBUTE_GROUPS(pcf50633_mbc_sysfs);
-
-static void
-pcf50633_mbc_irq_handler(int irq, void *data)
-{
-	struct pcf50633_mbc *mbc = data;
-
-	/* USB */
-	if (irq == PCF50633_IRQ_USBINS) {
-		mbc->usb_online = 1;
-	} else if (irq == PCF50633_IRQ_USBREM) {
-		mbc->usb_online = 0;
-		pcf50633_mbc_usb_curlim_set(mbc->pcf, 0);
-	}
-
-	/* Adapter */
-	if (irq == PCF50633_IRQ_ADPINS)
-		mbc->adapter_online = 1;
-	else if (irq == PCF50633_IRQ_ADPREM)
-		mbc->adapter_online = 0;
-
-	power_supply_changed(mbc->ac);
-	power_supply_changed(mbc->usb);
-	power_supply_changed(mbc->adapter);
-
-	if (mbc->pcf->pdata->mbc_event_callback)
-		mbc->pcf->pdata->mbc_event_callback(mbc->pcf, irq);
-}
-
-static int adapter_get_property(struct power_supply *psy,
-			enum power_supply_property psp,
-			union power_supply_propval *val)
-{
-	struct pcf50633_mbc *mbc = power_supply_get_drvdata(psy);
-	int ret = 0;
-
-	switch (psp) {
-	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval =  mbc->adapter_online;
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-	return ret;
-}
-
-static int usb_get_property(struct power_supply *psy,
-			enum power_supply_property psp,
-			union power_supply_propval *val)
-{
-	struct pcf50633_mbc *mbc = power_supply_get_drvdata(psy);
-	int ret = 0;
-	u8 usblim = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCC7) &
-						PCF50633_MBCC7_USB_MASK;
-
-	switch (psp) {
-	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval = mbc->usb_online &&
-				(usblim <= PCF50633_MBCC7_USB_500mA);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-	return ret;
-}
-
-static int ac_get_property(struct power_supply *psy,
-			enum power_supply_property psp,
-			union power_supply_propval *val)
-{
-	struct pcf50633_mbc *mbc = power_supply_get_drvdata(psy);
-	int ret = 0;
-	u8 usblim = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCC7) &
-						PCF50633_MBCC7_USB_MASK;
-
-	switch (psp) {
-	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval = mbc->usb_online &&
-				(usblim == PCF50633_MBCC7_USB_1000mA);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-	return ret;
-}
-
-static enum power_supply_property power_props[] = {
-	POWER_SUPPLY_PROP_ONLINE,
-};
-
-static const u8 mbc_irq_handlers[] = {
-	PCF50633_IRQ_ADPINS,
-	PCF50633_IRQ_ADPREM,
-	PCF50633_IRQ_USBINS,
-	PCF50633_IRQ_USBREM,
-	PCF50633_IRQ_BATFULL,
-	PCF50633_IRQ_CHGHALT,
-	PCF50633_IRQ_THLIMON,
-	PCF50633_IRQ_THLIMOFF,
-	PCF50633_IRQ_USBLIMON,
-	PCF50633_IRQ_USBLIMOFF,
-	PCF50633_IRQ_LOWSYS,
-	PCF50633_IRQ_LOWBAT,
-};
-
-static const struct power_supply_desc pcf50633_mbc_adapter_desc = {
-	.name		= "adapter",
-	.type		= POWER_SUPPLY_TYPE_MAINS,
-	.properties	= power_props,
-	.num_properties	= ARRAY_SIZE(power_props),
-	.get_property	= &adapter_get_property,
-};
-
-static const struct power_supply_desc pcf50633_mbc_usb_desc = {
-	.name		= "usb",
-	.type		= POWER_SUPPLY_TYPE_USB,
-	.properties	= power_props,
-	.num_properties	= ARRAY_SIZE(power_props),
-	.get_property	= usb_get_property,
-};
-
-static const struct power_supply_desc pcf50633_mbc_ac_desc = {
-	.name		= "ac",
-	.type		= POWER_SUPPLY_TYPE_MAINS,
-	.properties	= power_props,
-	.num_properties	= ARRAY_SIZE(power_props),
-	.get_property	= ac_get_property,
-};
-
-static int pcf50633_mbc_probe(struct platform_device *pdev)
-{
-	struct power_supply_config psy_cfg = {};
-	struct power_supply_config usb_psy_cfg;
-	struct pcf50633_mbc *mbc;
-	int i;
-	u8 mbcs1;
-
-	mbc = devm_kzalloc(&pdev->dev, sizeof(*mbc), GFP_KERNEL);
-	if (!mbc)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, mbc);
-	mbc->pcf = dev_to_pcf50633(pdev->dev.parent);
-
-	/* Set up IRQ handlers */
-	for (i = 0; i < ARRAY_SIZE(mbc_irq_handlers); i++)
-		pcf50633_register_irq(mbc->pcf, mbc_irq_handlers[i],
-					pcf50633_mbc_irq_handler, mbc);
-
-	psy_cfg.supplied_to		= mbc->pcf->pdata->batteries;
-	psy_cfg.num_supplicants		= mbc->pcf->pdata->num_batteries;
-	psy_cfg.drv_data		= mbc;
-
-	/* Create power supplies */
-	mbc->adapter = devm_power_supply_register(&pdev->dev,
-						  &pcf50633_mbc_adapter_desc,
-						  &psy_cfg);
-	if (IS_ERR(mbc->adapter)) {
-		dev_err(mbc->pcf->dev, "failed to register adapter\n");
-		return PTR_ERR(mbc->adapter);
-	}
-
-	usb_psy_cfg = psy_cfg;
-	usb_psy_cfg.attr_grp = pcf50633_mbc_sysfs_groups;
-
-	mbc->usb = devm_power_supply_register(&pdev->dev,
-					      &pcf50633_mbc_usb_desc,
-					      &usb_psy_cfg);
-	if (IS_ERR(mbc->usb)) {
-		dev_err(mbc->pcf->dev, "failed to register usb\n");
-		return PTR_ERR(mbc->usb);
-	}
-
-	mbc->ac = devm_power_supply_register(&pdev->dev,
-					     &pcf50633_mbc_ac_desc,
-					     &psy_cfg);
-	if (IS_ERR(mbc->ac)) {
-		dev_err(mbc->pcf->dev, "failed to register ac\n");
-		return PTR_ERR(mbc->ac);
-	}
-
-	mbcs1 = pcf50633_reg_read(mbc->pcf, PCF50633_REG_MBCS1);
-	if (mbcs1 & PCF50633_MBCS1_USBPRES)
-		pcf50633_mbc_irq_handler(PCF50633_IRQ_USBINS, mbc);
-	if (mbcs1 & PCF50633_MBCS1_ADAPTPRES)
-		pcf50633_mbc_irq_handler(PCF50633_IRQ_ADPINS, mbc);
-
-	return 0;
-}
-
-static void pcf50633_mbc_remove(struct platform_device *pdev)
-{
-	struct pcf50633_mbc *mbc = platform_get_drvdata(pdev);
-	int i;
-
-	/* Remove IRQ handlers */
-	for (i = 0; i < ARRAY_SIZE(mbc_irq_handlers); i++)
-		pcf50633_free_irq(mbc->pcf, mbc_irq_handlers[i]);
-}
-
-static struct platform_driver pcf50633_mbc_driver = {
-	.driver = {
-		.name = "pcf50633-mbc",
-	},
-	.probe = pcf50633_mbc_probe,
-	.remove = pcf50633_mbc_remove,
-};
-
-module_platform_driver(pcf50633_mbc_driver);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 mbc driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-mbc");
-- 
2.48.1

