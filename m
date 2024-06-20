Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E59910AE3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1E10EAC2;
	Thu, 20 Jun 2024 16:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uXYSdGIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1894210EAC2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:02:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BAAE621F1;
 Thu, 20 Jun 2024 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D10C32786;
 Thu, 20 Jun 2024 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718899337;
 bh=E8l1aqpdA74rDW1srzgQk+KGqt4ojJSzQh1RcolLCmo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uXYSdGIVzy3MF++t4b7l8KyvNLqDkr/Pp+2wHupaEw02gmmZFrrGO/IcYuTPG4bzB
 Nh1QjCjLD/6Sp4l1rtKewQAlMChRH7+Sgvonm9+ClJLsu1Y30yD53cb0S1w3blnHVp
 wK9FFewJrZOq9jFvwuxIjC6dfYpAYw7g91PfDmtq3PVBVwqzdhHhlSJ+iDjOMlKbOt
 Y+7hJvkwJfZDzUrJIpik/GnC7AhPHCI4FEeigLMpnsDIVB9yCSyxUNEk62eamGt6L+
 ib+lij7341S7ZDCGVcBmxbidKb7DYtDkeYRtnjqDGIxf2VNdU8yWwYBb7pC3O2mZXX
 3ALsB5ljELBIg==
Message-ID: <01f8f675-5606-417c-9dfc-81684c666a7b@kernel.org>
Date: Thu, 20 Jun 2024 18:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/23] mfd: Add new driver for MAX77705 PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Rose Hudson <rose@krx.sh>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-12-e3f6662017ac@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-12-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/06/2024 15:59, Dzmitry Sankouski wrote:
> Add the core MFD driver for max77705 PMIC. We define five sub-devices
> for which the drivers will be added in subsequent patches.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> Co-authored-by: Rose Hudson <rose@krx.sh>
> ---
>  MAINTAINERS                          |   2 +
>  drivers/mfd/Kconfig                  |  12 ++
>  drivers/mfd/Makefile                 |   3 +
>  drivers/mfd/max77705-core.c          | 278 ++++++++++++++++++++++++++++++++
>  drivers/mfd/max77705-irq.c           | 299 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77705-private.h | 281 ++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77705.h         |  20 +++
>  7 files changed, 895 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fae3b8ea9ce4..f66f08825db9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13690,6 +13690,7 @@ F:	drivers/*/*max77843.c
>  F:	drivers/*/max14577*.c
>  F:	drivers/*/max77686*.c
>  F:	drivers/*/max77693*.c
> +F:	drivers/*/max77705*.c
>  F:	drivers/clk/clk-max77686.c
>  F:	drivers/extcon/extcon-max14577.c
>  F:	drivers/extcon/extcon-max77693.c
> @@ -13697,6 +13698,7 @@ F:	drivers/rtc/rtc-max77686.c
>  F:	include/linux/mfd/max14577*.h
>  F:	include/linux/mfd/max77686*.h
>  F:	include/linux/mfd/max77693*.h
> +F:	include/linux/mfd/max77705*.h
>  
>  MAXIRADIO FM RADIO RECEIVER DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 266b4f54af60..c4eb8ff2dcad 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -880,6 +880,18 @@ config MFD_MAX77693
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_MAX77705
> +	tristate "Maxim Semiconductor MAX77705 PMIC Support"
> +	depends on I2C
> +	select MFD_CORE
> +	help
> +	  Say yes here to add support for Maxim Semiconductor MAX77705.
> +	  This is a Power Management IC with Charger, safe LDOs, Flash, Haptic
> +	  and MUIC controls on chip.
> +	  This driver provides common support for accessing the device;
> +	  additional drivers must be enabled in order to use the functionality
> +	  of the device.
> +
>  config MFD_MAX77714
>  	tristate "Maxim Semiconductor MAX77714 PMIC Support"
>  	depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index db1ba39de3b5..bf65cc36d59c 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -162,6 +162,8 @@ obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
>  obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
>  obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
> +max77705-objs := max77705-core.o max77705-irq.o
> +obj-$(CONFIG_MFD_MAX77705)	+= max77705.o
>  obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
>  obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
>  obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
> @@ -226,6 +228,7 @@ obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
>  obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
>  obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
>  obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
> +obj-$(CONFIG_MFD_S2DOS05)	+= s2dos05.o

??? That's not related.

>  obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
>  obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
>  obj-$(CONFIG_MFD_VEXPRESS_SYSREG)	+= vexpress-sysreg.o
> diff --git a/drivers/mfd/max77705-core.c b/drivers/mfd/max77705-core.c
> new file mode 100644
> index 000000000000..7cb71a0a9688
> --- /dev/null
> +++ b/drivers/mfd/max77705-core.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * max77705.c - mfd core driver for the Maxim 77705
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/max77705.h>
> +#include <linux/mfd/max77705-private.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/debugfs.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +
> +#define I2C_ADDR_PMIC	(0xCC >> 1)	/* Top sys, Haptic */
> +#define I2C_ADDR_MUIC	(0x4A >> 1)
> +#define I2C_ADDR_CHG    (0xD2 >> 1)
> +#define I2C_ADDR_FG     (0x6C >> 1)
> +#define I2C_ADDR_DEBUG  (0xC4 >> 1)
> +
> +static struct dentry *debugfs_file;
> +
> +static int max77705_debugfs_show(struct seq_file *s, void *data)
> +{
> +	struct max77705_dev *max77705 = s->private;
> +	struct regmap *regmap = max77705->regmap;
> +	unsigned int i, reg, reg_data, pmic_id, pmic_rev;
> +	int regs[] = {
> +		MAX77705_PMIC_REG_MAINCTRL1,
> +		MAX77705_PMIC_REG_MCONFIG,
> +		MAX77705_PMIC_REG_MCONFIG2,
> +		MAX77705_PMIC_REG_INTSRC,
> +		MAX77705_PMIC_REG_INTSRC_MASK,
> +		MAX77705_PMIC_REG_SYSTEM_INT,
> +		MAX77705_PMIC_REG_SYSTEM_INT_MASK,
> +		MAX77705_RGBLED_REG_LEDEN,
> +		MAX77705_RGBLED_REG_LED0BRT,
> +		MAX77705_RGBLED_REG_LED1BRT,
> +		MAX77705_RGBLED_REG_LED2BRT,
> +		MAX77705_RGBLED_REG_LED3BRT,
> +		MAX77705_RGBLED_REG_LEDBLNK
> +	};
> +
> +	regmap_read(regmap, MAX77705_PMIC_REG_PMICID1, &pmic_id);
> +	regmap_read(regmap, MAX77705_PMIC_REG_PMICREV, &pmic_rev);
> +	seq_printf(s, "MAX77705, pmic id: %d, pmic rev: %d\n",
> +		   pmic_id, pmic_rev);
> +	seq_puts(s, "===================\n");
> +	for (i = 0; i < ARRAY_SIZE(regs); i++) {
> +		reg = regs[i];
> +		regmap_read(regmap, reg, &reg_data);
> +		seq_printf(s, "0x%02x:\t0x%02x\n", reg, reg_data);
> +	}
> +
> +	seq_puts(s, "\n");
> +	return 0;

Why do you need this code? Regmap has its own debugging code.

> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(max77705_debugfs);
> +
> +static const struct regmap_config max77705_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX77705_PMIC_REG_END,
> +};
> +
> +static const struct regmap_config max77705_leds_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX77705_LED_REG_END,
> +};
> +
> +static const struct regmap_config max77705_fg_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX77705_FG_END,
> +};
> +
> +static struct mfd_cell max77705_devs[] = {
> +	{
> +		.name = "leds-max77705-rgb",
> +		.of_compatible = "maxim,max77705-led",
> +	},
> +	{
> +		.name = "max77705-fuelgauge",
> +		.of_compatible = "maxim,max77705-fg",
> +	},
> +	{
> +		.name = "max77705-charger",
> +		.of_compatible = "maxim,max77705-charger",
> +	},
> +	{
> +		.name = "max77705-haptic",
> +		.of_compatible = "maxim,max77705-haptic",
> +	},
> +};
> +
> +static int max77705_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct max77705_dev *max77705;
> +	struct max77705_platform_data *pdata = i2c->dev.platform_data;

This is not used. You need to clean the driver from such obsoletes from
2010.

> +
> +	unsigned int reg_data;
> +	int ret = 0;
> +
> +	max77705 = kzalloc(sizeof(struct max77705_dev), GFP_KERNEL);

sizeof(*)

devm_kzalloc, unless you cannot use it because (missing comment)?

Please take the newest driver as your template. Do not upstream some
old, crappy code. Things changed over last 10 years, conventions changed.

> +	if (!max77705)
> +		return -ENOMEM;
> +
> +	max77705->pdata = pdata;

Drop, not used.

> +	max77705->dev = &i2c->dev;
> +	max77705->i2c = i2c;
> +	max77705->irq = i2c->irq;
> +
> +	max77705->regmap = devm_regmap_init_i2c(max77705->i2c, &max77705_regmap_config);
> +	if (IS_ERR(max77705->regmap)) {
> +		ret = PTR_ERR(max77705->regmap);
> +		dev_err(max77705->dev, "failed to allocate register map: %d\n",
> +				ret);

Not sure if we print allocation errors... but if you print, then:
ret = dev_err_probe

> +		return ret;
> +	}
> +
> +	max77705->regmap_leds = devm_regmap_init_i2c(max77705->i2c, &max77705_leds_regmap_config);
> +	if (IS_ERR(max77705->regmap_leds)) {
> +		ret = PTR_ERR(max77705->regmap_leds);
> +		dev_err(max77705->dev, "failed to allocate register map: %d\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	i2c_set_clientdata(i2c, max77705);
> +
> +	if (regmap_read(max77705->regmap, MAX77705_PMIC_REG_PMICREV, &reg_data) < 0) {
> +		dev_err(max77705->dev,
> +			"device not found on this channel (this is not an error)\n");
> +		ret = -ENODEV;
> +		goto err;
> +	} else {
> +		/* print rev */
> +		max77705->pmic_rev = (reg_data & MAX77705_REVISION_MASK);
> +		max77705->pmic_ver = ((reg_data & MAX77705_VERSION_MASK) >> MAX77705_VERSION_SHIFT);
> +		dev_info(max77705->dev, "%s device found: rev.0x%x, ver.0x%x\n",
> +				__func__, max77705->pmic_rev, max77705->pmic_ver);

dev_dbg

> +	}
> +
> +	max77705->charger = devm_i2c_new_dummy_device(max77705->dev, i2c->adapter, I2C_ADDR_CHG);
> +	i2c_set_clientdata(max77705->charger, max77705);
> +	max77705->regmap_charger = devm_regmap_init_i2c(max77705->charger, &max77705_regmap_config);
> +	if (IS_ERR(max77705->regmap)) {
> +		ret = PTR_ERR(max77705->regmap);
> +		dev_err(max77705->dev, "failed to allocate register map: %d\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	max77705->fuelgauge = devm_i2c_new_dummy_device(max77705->dev, i2c->adapter, I2C_ADDR_FG);
> +	i2c_set_clientdata(max77705->fuelgauge, max77705);
> +	max77705->regmap_fg = devm_regmap_init_i2c(max77705->fuelgauge, &max77705_fg_regmap_config);
> +	if (IS_ERR(max77705->regmap_fg)) {
> +		ret = PTR_ERR(max77705->regmap_fg);
> +		dev_err(max77705->dev, "failed to allocate register map: %d\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	if (likely(i2c->irq > 0))

Drop likely

> +		max77705->irq = i2c->irq;

Why do you need it?

> +	else {
> +		dev_err(max77705->dev, "failed to get irq number\n");
> +		return -EINVAL;
> +	}
> +
> +	max77705->irq_base = irq_alloc_descs(-1, 0, MAX77705_IRQ_NR, -1);

Why this is not using simple regmap_irq_chip?

> +	if (unlikely(max77705->irq_base < 0)) {
> +		dev_err(max77705->dev, "irq_alloc_descs fail: %d\n", max77705->irq_base);
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	disable_irq(max77705->irq);

Heh?

> +	ret = max77705_irq_init(max77705);
> +	if (ret) {
> +		dev_err(max77705->dev, "failed to init irq system: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mfd_add_devices(max77705->dev, -1, max77705_devs,
> +			ARRAY_SIZE(max77705_devs), NULL, 0, NULL);
> +	if (ret < 0)
> +		goto err_mfd;
> +
> +	debugfs_file = debugfs_create_file("max77705-regs",
> +				0664, NULL, (void *)max77705,
> +				  &max77705_debugfs_fops);
> +	if (!debugfs_file)
> +		dev_err(max77705->dev, "Failed to create debugfs file\n");

Drop dev_err

> +
> +	device_init_wakeup(max77705->dev, true);
> +
> +	return ret;
> +
> +err_mfd:
> +	mfd_remove_devices(max77705->dev);
> +err:
> +	kfree(max77705);
> +	return ret;
> +}
> +
> +static void max77705_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct max77705_dev *max77705 = i2c_get_clientdata(i2c);
> +
> +	if (debugfs_file)
> +		debugfs_remove(debugfs_file);
> +
> +	device_init_wakeup(max77705->dev, 0);
> +	mfd_remove_devices(max77705->dev);

No freeing here? Sorry, this code is really poor.

> +}
> +
> +static int __maybe_unused max77705_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct max77705_dev *max77705 = i2c_get_clientdata(i2c);
> +
> +	disable_irq(max77705->irq);
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(max77705->irq);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused max77705_resume(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct max77705_dev *max77705 = i2c_get_clientdata(i2c);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(max77705->irq);
> +	enable_irq(max77705->irq);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(max77705_pm, max77705_suspend, max77705_resume);
> +
> +static const struct of_device_id max77705_i2c_dt_ids[] = {
> +	{ .compatible = "maxim,max77705" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, max77705_i2c_dt_ids);
> +
> +static struct i2c_driver max77705_i2c_driver = {
> +	.driver		= {
> +		.name	= MFD_DEV_NAME,
> +		.pm = &max77705_pm,
> +		.of_match_table	= max77705_i2c_dt_ids,
> +		.suppress_bind_attrs = true,

Nope, drop. Fix the code instead.


> +	},
> +	.probe		= max77705_i2c_probe,
> +	.remove		= max77705_i2c_remove,
> +};
> +module_i2c_driver(max77705_i2c_driver);
> +
> +MODULE_DESCRIPTION("MAXIM 77705 multi-function core driver");
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/max77705-irq.c b/drivers/mfd/max77705-irq.c
> new file mode 100644
> index 000000000000..0da17fc95e18
> --- /dev/null
> +++ b/drivers/mfd/max77705-irq.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * max77705-irq.c - Interrupt controller support for MAX77705
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/max77705.h>
> +#include <linux/mfd/max77705-private.h>
> +#include <linux/regmap.h>
> +
> +static const u8 max77705_mask_reg[] = {
> +	[SYS_INT] = MAX77705_PMIC_REG_SYSTEM_INT_MASK,
> +	[CHG_INT] = MAX77705_CHG_REG_INT_MASK,
> +	[FUEL_INT] = MAX77705_REG_INVALID,
> +};
> +
> +static struct regmap *get_i2c(struct max77705_dev *max77705,
> +				enum max77705_irq_source src)
> +{
> +	switch (src) {
> +	case SYS_INT:
> +		return max77705->regmap;
> +	case FUEL_INT:
> +		return max77705->regmap_fg;
> +	case CHG_INT:
> +		return max77705->regmap_charger;
> +	default:
> +		return ERR_PTR(-EINVAL);
> +	}
> +}
> +
> +struct max77705_irq_data {
> +	int mask;
> +	enum max77705_irq_source group;
> +};
> +
> +static const struct max77705_irq_data max77705_irqs[] = {
> +	[MAX77705_SYSTEM_IRQ_BSTEN_INT] = { .group = SYS_INT, .mask = BIT(3) },
> +	[MAX77705_SYSTEM_IRQ_SYSUVLO_INT] = { .group = SYS_INT, .mask = BIT(4) },
> +	[MAX77705_SYSTEM_IRQ_SYSOVLO_INT] = { .group = SYS_INT, .mask = BIT(5) },
> +	[MAX77705_SYSTEM_IRQ_TSHDN_INT] = { .group = SYS_INT, .mask = BIT(6) },
> +	[MAX77705_SYSTEM_IRQ_TM_INT] = { .group = SYS_INT, .mask = BIT(7) },
> +
> +	[MAX77705_CHG_IRQ_BYP_I] = { .group = CHG_INT, .mask = BIT(0) },
> +	[MAX77705_CHG_IRQ_BAT_I] = { .group = CHG_INT, .mask = BIT(3) },
> +	[MAX77705_CHG_IRQ_CHG_I] = { .group = CHG_INT, .mask = BIT(4) },
> +	[MAX77705_CHG_IRQ_WCIN_I] = { .group = CHG_INT, .mask = BIT(5) },
> +	[MAX77705_CHG_IRQ_CHGIN_I] = { .group = CHG_INT, .mask = BIT(6) },
> +	[MAX77705_CHG_IRQ_AICL_I] = { .group = CHG_INT, .mask = BIT(7) },
> +
> +	[MAX77705_FG_IRQ_ALERT] = { .group = FUEL_INT, .mask = BIT(1) },
> +};
> +
> +static void max77705_irq_lock(struct irq_data *data)
> +{
> +	struct max77705_dev *max77705 = irq_get_chip_data(data->irq);
> +
> +	mutex_lock(&max77705->irqlock);
> +}
> +
> +static void max77705_irq_sync_unlock(struct irq_data *data)
> +{
> +	struct max77705_dev *max77705 = irq_get_chip_data(data->irq);
> +	int i;
> +
> +	for (i = 0; i < MAX77705_IRQ_GROUP_NR; i++) {
> +		u8 mask_reg = max77705_mask_reg[i];
> +		struct regmap *i2c = get_i2c(max77705, i);
> +
> +		if (mask_reg == MAX77705_REG_INVALID ||
> +				IS_ERR_OR_NULL(i2c))
> +			continue;
> +		max77705->irq_masks_cache[i] = max77705->irq_masks_cur[i];
> +
> +		regmap_write(i2c, max77705_mask_reg[i],
> +				max77705->irq_masks_cur[i]);
> +	}
> +
> +	mutex_unlock(&max77705->irqlock);

Just use regmap_irq_chip.


> +
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/max77705-private.h b/include/linux/mfd/max77705-private.h
> new file mode 100644
> index 000000000000..bd6ab9c582b8
> --- /dev/null
> +++ b/include/linux/mfd/max77705-private.h
> @@ -0,0 +1,281 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * max77705-private.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

OMG, how this code is?

I already said but above is the nail to the coffin: sorry, start from
scratch and do not try to upstream junk downstream code.

Amount of work you require from reviewers on silly things which we
solved long time ago, is just tremendous.

That's not how upstreaming works.

> + */
> +
> +#ifndef __LINUX_MFD_MAX77705_PRIV_H
> +#define __LINUX_MFD_MAX77705_PRIV_H
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +
> +#define MAX77705_REG_INVALID		(0xff)
> +#define MAX77705_IRQSRC_CHG			BIT(0)
> +#define MAX77705_IRQSRC_TOP			BIT(1)
> +#define MAX77705_IRQSRC_FG			BIT(2)
> +#define MAX77705_IRQSRC_USBC		BIT(3)
> +
> +/* STATUS_REG */
> +#define MAX77705_BAT_ABSENT_MASK	BIT(3)
> +/* MAX77705 MAINCTRL1 register */
> +#define MAX77705_MAINCTRL1_BIASEN_SHIFT		7
> +#define MAX77705_MAINCTRL1_BIASEN_MASK		BIT(MAX77705_MAINCTRL1_BIASEN_SHIFT)
> +
> +/* max77705-haptic configuration register */
> +#define MAX77705_CONFIG2_MEN_SHIFT		6
> +#define MAX77705_CONFIG2_MODE_SHIFT		7
> +#define MAX77705_CONFIG2_HTYP_SHIFT		5
> +
> +#define MAX77705_REVISION_MASK	7
> +#define MAX77705_VERSION_MASK	0xF8
> +#define MAX77705_VERSION_SHIFT	3
> +
> +enum max77705_hw_rev {
> +	MAX77705_PASS1 = 1,
> +	MAX77705_PASS2,
> +	MAX77705_PASS3,
> +};
> +
> +enum max77705_reg {
> +	/* Slave addr = 0xCC */
> +	/* PMIC Top-Level Registers */
> +	MAX77705_PMIC_REG_PMICID1		= 0x00,
> +	MAX77705_PMIC_REG_PMICREV		= 0x01,
> +	MAX77705_PMIC_REG_MAINCTRL1		= 0x02,
> +	MAX77705_PMIC_REG_INTSRC		= 0x22,

That's not enum but defines. This applies to all your register definitions.

> +	MAX77705_PMIC_REG_INTSRC_MASK		= 0x23,
> +	MAX77705_PMIC_REG_SYSTEM_INT		= 0x24,
> +	MAX77705_PMIC_REG_RESERVED_25		= 0x25,
> +	MAX77705_PMIC_REG_SYSTEM_INT_MASK	= 0x26,
> +	MAX77705_PMIC_REG_RESERVED_27		= 0x27,
> +	MAX77705_PMIC_REG_RESERVED_28		= 0x28,
> +	MAX77705_PMIC_REG_RESERVED_29		= 0x29,
> +	MAX77705_PMIC_REG_BOOSTCONTROL1		= 0x4C,
> +	MAX77705_PMIC_REG_BSTOUT_MASK		= 0x03,
> +	MAX77705_PMIC_REG_BOOSTCONTROL2		= 0x4F,
> +	MAX77705_PMIC_REG_FORCE_EN_MASK		= 0x08,
> +	MAX77705_PMIC_REG_SW_RESET		= 0x50,
> +	MAX77705_PMIC_REG_USBC_RESET		= 0x51,
> +
> +	/* Haptic motor driver Registers */
> +	MAX77705_PMIC_REG_MCONFIG		= 0x10,
> +	MAX77705_PMIC_REG_MCONFIG2		= 0x11,
> +
> +	MAX77705_CHG_REG_INT			= 0xB0,
> +	MAX77705_CHG_REG_INT_MASK		= 0xB1,
> +	MAX77705_CHG_REG_INT_OK			= 0xB2,
> +	MAX77705_CHG_REG_DETAILS_00		= 0xB3,
> +	MAX77705_CHG_REG_DETAILS_01		= 0xB4,
> +	MAX77705_CHG_REG_DETAILS_02		= 0xB5,
> +	MAX77705_CHG_REG_DTLS_03		= 0xB6,
> +	MAX77705_CHG_REG_CNFG_00		= 0xB7,
> +	MAX77705_CHG_REG_CNFG_01		= 0xB8,
> +	MAX77705_CHG_REG_CNFG_02		= 0xB9,
> +	MAX77705_CHG_REG_CNFG_03		= 0xBA,
> +	MAX77705_CHG_REG_CNFG_04		= 0xBB,
> +	MAX77705_CHG_REG_CNFG_05		= 0xBC,
> +	MAX77705_CHG_REG_CNFG_06		= 0xBD,
> +	MAX77705_CHG_REG_CNFG_07		= 0xBE,
> +	MAX77705_CHG_REG_CNFG_08		= 0xBF,
> +	MAX77705_CHG_REG_CNFG_09		= 0xC0,
> +	MAX77705_CHG_REG_CNFG_10		= 0xC1,
> +	MAX77705_CHG_REG_CNFG_11		= 0xC2,
> +	MAX77705_CHG_REG_CNFG_12		= 0xC3,
> +	MAX77705_CHG_REG_CNFG_13		= 0xC4,
> +	MAX77705_CHG_REG_CNFG_14		= 0xC5,
> +	MAX77705_CHG_REG_SAFEOUT_CTRL		= 0xC6,
> +
> +	MAX77705_PMIC_REG_END,
> +};
> +
> +enum max77705_charger_battery_state {
> +	MAX77705_BATTERY_NOBAT,
> +	MAX77705_BATTERY_PREQUALIFICATION,
> +	MAX77705_BATTERY_DEAD,
> +	MAX77705_BATTERY_GOOD,
> +	MAX77705_BATTERY_LOWVOLTAGE,
> +	MAX77705_BATTERY_OVERVOLTAGE,
> +	MAX77705_BATTERY_RESERVED,
> +};
> +
> +enum max77705_charger_charge_type {
> +	MAX77705_CHARGER_CONSTANT_CURRENT	= 1,
> +	MAX77705_CHARGER_CONSTANT_VOLTAGE,
> +	MAX77705_CHARGER_END_OF_CHARGE,
> +	MAX77705_CHARGER_DONE,
> +};
> +
> +/* Slave addr = 0x6C : Fuelgauge */
> +enum max77705_fuelgauge_reg {
> +	STATUS_REG				= 0x00,
> +	VALRT_THRESHOLD_REG			= 0x01,
> +	TALRT_THRESHOLD_REG			= 0x02,
> +	SALRT_THRESHOLD_REG			= 0x03,
> +	REMCAP_REP_REG				= 0x05,
> +	SOCREP_REG				= 0x06,
> +	TEMPERATURE_REG				= 0x08,
> +	VCELL_REG				= 0x09,
> +	TIME_TO_EMPTY_REG			= 0x11,
> +	FULLSOCTHR_REG				= 0x13,
> +	CURRENT_REG				= 0x0A,
> +	AVG_CURRENT_REG				= 0x0B,
> +	SOCMIX_REG				= 0x0D,
> +	SOCAV_REG				= 0x0E,
> +	REMCAP_MIX_REG				= 0x0F,
> +	FULLCAP_REG				= 0x10,
> +	RFAST_REG				= 0x15,
> +	AVR_TEMPERATURE_REG			= 0x16,
> +	CYCLES_REG				= 0x17,
> +	DESIGNCAP_REG				= 0x18,
> +	AVR_VCELL_REG				= 0x19,
> +	TIME_TO_FULL_REG			= 0x20,
> +	CONFIG_REG				= 0x1D,
> +	ICHGTERM_REG				= 0x1E,
> +	REMCAP_AV_REG				= 0x1F,
> +	FULLCAP_NOM_REG				= 0x23,
> +	LEARN_CFG_REG				= 0x28,
> +	FILTER_CFG_REG				= 0x29,
> +	MISCCFG_REG				= 0x2B,
> +	QRTABLE20_REG				= 0x32,
> +	FULLCAP_REP_REG				= 0x35,
> +	RCOMP_REG				= 0x38,
> +	VEMPTY_REG				= 0x3A,
> +	FSTAT_REG				= 0x3D,
> +	DISCHARGE_THRESHOLD_REG			= 0x40,
> +	QRTABLE30_REG				= 0x42,
> +	ISYS_REG				= 0x43,
> +	DQACC_REG				= 0x45,
> +	DPACC_REG				= 0x46,
> +	AVGISYS_REG				= 0x4B,
> +	QH_REG					= 0x4D,
> +	VSYS_REG				= 0xB1,
> +	TALRTTH2_REG				= 0xB2,
> +	/* "not used REG(0xB2)" is for checking fuelgague init result. */
> +	FG_INIT_RESULT_REG			= TALRTTH2_REG,
> +	VBYP_REG				= 0xB3,
> +	CONFIG2_REG				= 0xBB,
> +	IIN_REG					= 0xD0,
> +	OCV_REG					= 0xEE,
> +	VFOCV_REG				= 0xFB,
> +	VFSOC_REG				= 0xFF,
> +
> +	MAX77705_FG_END,
> +};
> +
> +enum max77705_irq_source {
> +	SYS_INT = 0,
> +	CHG_INT,
> +	FUEL_INT,
> +	MAX77705_IRQ_GROUP_NR,
> +};
> +
> +
> +#define MAX77705_REG_MAINCTRL1_BIASEN		BIT(7)
> +
> +/* Slave addr = 0x94: RGB LED */
> +enum max77705_led_reg {
> +	MAX77705_RGBLED_REG_LEDEN			= 0x30,
> +	MAX77705_RGBLED_REG_LED0BRT			= 0x31,
> +	MAX77705_RGBLED_REG_LED1BRT			= 0x32,
> +	MAX77705_RGBLED_REG_LED2BRT			= 0x33,
> +	MAX77705_RGBLED_REG_LED3BRT			= 0x34,
> +	MAX77705_RGBLED_REG_LEDRMP			= 0x36,
> +	MAX77705_RGBLED_REG_LEDBLNK			= 0x38,
> +	MAX77705_LED_REG_END,
> +};
> +
> +enum max77705_irq {
> +	/* PMIC; TOPSYS */
> +	MAX77705_SYSTEM_IRQ_BSTEN_INT,
> +	MAX77705_SYSTEM_IRQ_SYSUVLO_INT,
> +	MAX77705_SYSTEM_IRQ_SYSOVLO_INT,
> +	MAX77705_SYSTEM_IRQ_TSHDN_INT,
> +	MAX77705_SYSTEM_IRQ_TM_INT,
> +
> +	/* PMIC; Charger */
> +	MAX77705_CHG_IRQ_BYP_I,
> +	MAX77705_CHG_IRQ_BAT_I,
> +	MAX77705_CHG_IRQ_CHG_I,
> +	MAX77705_CHG_IRQ_WCIN_I,
> +	MAX77705_CHG_IRQ_CHGIN_I,
> +	MAX77705_CHG_IRQ_AICL_I,
> +
> +	/* Fuelgauge */
> +	MAX77705_FG_IRQ_ALERT,
> +
> +	MAX77705_IRQ_NR,
> +};
> +
> +struct max77705_dev {
> +	struct device *dev;
> +	struct i2c_client *i2c; /* 0xCC; Haptic, PMIC */
> +	struct i2c_client *charger; /* 0xD2; Charger */
> +	struct i2c_client *fuelgauge; /* 0x6C; Fuelgauge */
> +	struct i2c_client *muic; /* 0x4A; MUIC */
> +	struct i2c_client *debug; /* 0xC4; Debug */
> +	struct mutex i2c_lock;
> +
> +	struct regmap *regmap;
> +	struct regmap *regmap_fg;
> +	struct regmap *regmap_charger;
> +	struct regmap *regmap_leds;
> +
> +	int type;
> +
> +	int irq;
> +	int irq_base;
> +	int irq_masks_cur[MAX77705_IRQ_GROUP_NR];
> +	int irq_masks_cache[MAX77705_IRQ_GROUP_NR];
> +	bool wakeup;
> +	struct mutex irqlock;
> +
> +#ifdef CONFIG_HIBERNATION
> +	/* For hibernation */
> +	u8 reg_pmic_dump[MAX77705_PMIC_REG_END];
> +	u8 reg_muic_dump[MAX77705_USBC_REG_END];
> +	u8 reg_led_dump[MAX77705_LED_REG_END];
> +#endif
> +
> +	/* pmic VER/REV register */
> +	u8 pmic_rev;	/* pmic Rev */
> +	u8 pmic_ver;	/* pmic version */

Why do you need to store it?

> +
> +	u8 cc_booting_complete;

That's nowhere used. Just like many other fields here. Clean up your
driver before posting it upstream.

> +
> +	wait_queue_head_t queue_empty_wait_q;
> +	int doing_irq;
> +	int is_usbc_queue;
> +
> +	struct max77705_platform_data *pdata;
> +};
> +
> +enum max77705_types {
> +	TYPE_MAX77705,

Drop. What is this for?

> +};
> +
> +
> +/**
> + * Unmask sub device interrupts on device level
> + *
> + * @param max77705 - device structure
> + * @param mask - sub device interrupts to unmask
> + */
> +extern inline int max77705_irq_unmask_subdevice(struct max77705_dev *max77705, unsigned int mask);

See coding style: limit is 80. checkpatch is not coding style.

> +
> +/**
> + * Same as max77705_irq_unmask_device, but for masking.
> + */
> +extern inline int max77705_irq_mask_subdevice(struct max77705_dev *max77705, unsigned int mask);
> +
> +
> +extern int max77705_irq_init(struct max77705_dev *max77705);

Drop externs everywhere.

> +
> +#endif /* __LINUX_MFD_MAX77705_PRIV_H */
> diff --git a/include/linux/mfd/max77705.h b/include/linux/mfd/max77705.h
> new file mode 100644
> index 000000000000..e2d757c77973
> --- /dev/null
> +++ b/include/linux/mfd/max77705.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * max77705.h - Driver for the Maxim 77705
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __MAX77705_H__
> +#define __MAX77705_H__
> +
> +#define MFD_DEV_NAME "max77705"
> +
> +struct max77705_platform_data {
> +	struct power_supply_battery_info *bat_info;

Entire platform data is redundant. Drop.

> +};
> +
> +#endif /* __MAX77705_H__ */
> +
> 

Do not keep redundant blank lines. Drop.

Best regards,
Krzysztof

