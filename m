Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53238B580B2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC56410E4F0;
	Mon, 15 Sep 2025 15:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sRw248T3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926A510E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:31:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0BF49419C6;
 Mon, 15 Sep 2025 15:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4703FC4CEF1;
 Mon, 15 Sep 2025 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757950288;
 bh=/6SecB83u1v8w/NbyVqyqydDInMYYCThfcOa2FnQ6dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRw248T3ndMFtl9dkaIozkjq9+OmsUtoXeVS/2ViJJiXXInmF5mPwvsyRfaVouLcj
 f1X4JoOzw7bIrGbtMpjh5nBEPQsIsEpwmymSBr3Qm9czUkA/15sgX2t/EggAHq04QX
 9AxYPUCYnKwFfcldSgS/czdTR6YAWPs6vao5OxpzHVnkt9KLOpd/DQp+RSHUDwXJOY
 ZeKGjhT+agUSQftAsF1U4MMkuCAx2d/e8F3oyiqf6JKv1M/FFALi8/BP77h+/Fwnz2
 u7U6Im+cXlrJ6glAFs8lfFcG1NO6UVhKHO6crDZ5LQ2qCn6Nzax30/Lj4fOlIjyhcd
 3sPyjKuu/cqPg==
Date: Mon, 15 Sep 2025 16:31:22 +0100
From: Daniel Thompson <danielt@kernel.org>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH v3 2/4] backlight: add max25014atg backlight
Message-ID: <aMgxSokzn9Y9tyAs@aspen.lan>
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
 <20250911-max25014-v3-2-d03f4eba375e@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-max25014-v3-2-d03f4eba375e@gocontroll.com>
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

On Thu, Sep 11, 2025 at 09:53:19AM +0200, Maud Spierings via B4 Relay wrote:
> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f4ca79dfc39ccb04702e6114c35a5863f80b8853
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Maxim MAX25014
> + *
> + * Copyright (C) 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11
> +#define MAX_BRIGHTNESS            100
> +#define MIN_BRIGHTNESS            0
> +#define TON_MAX                   130720 /* @153Hz */
> +#define TON_STEP                  1307 /* @153Hz */
> +#define TON_MIN                   0
> +
> +#define MAX25014_DEV_ID           0x00
> +#define MAX25014_REV_ID           0x01
> +#define MAX25014_ISET             0x02
> +#define MAX25014_IMODE            0x03
> +#define MAX25014_TON1H            0x04
> +#define MAX25014_TON1L            0x05
> +#define MAX25014_TON2H            0x06
> +#define MAX25014_TON2L            0x07
> +#define MAX25014_TON3H            0x08
> +#define MAX25014_TON3L            0x09
> +#define MAX25014_TON4H            0x0A
> +#define MAX25014_TON4L            0x0B
> +#define MAX25014_TON_1_4_LSB      0x0C
> +#define MAX25014_SETTING          0x12
> +#define MAX25014_DISABLE          0x13
> +#define MAX25014_BSTMON           0x14
> +#define MAX25014_IOUT1            0x15
> +#define MAX25014_IOUT2            0x16
> +#define MAX25014_IOUT3            0x17
> +#define MAX25014_IOUT4            0x18
> +#define MAX25014_OPEN             0x1B
> +#define MAX25014_SHORT_GND        0x1C
> +#define MAX25014_SHORT_LED        0x1D
> +#define MAX25014_MASK             0x1E
> +#define MAX25014_DIAG             0x1F
> +
> +#define MAX25014_IMODE_HDIM       BIT(2)
> +#define MAX25014_ISET_ENABLE      BIT(5)
> +#define MAX25014_ISET_PSEN        BIT(4)
> +#define MAX25014_DIAG_HW_RST      BIT(2)
> +#define MAX25014_SETTING_FPWM     GENMASK(6, 4)
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +
> +static const struct regmap_config max25014_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX25014_DIAG,
> +};
> +
> +/**
> + * @brief control the brightness with i2c registers
> + *
> + * @param regmap trivial
> + * @param brt brightness
> + * @return int
> + */
> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> +{
> +	uint32_t reg = TON_STEP * brt;
> +	int ret;
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint8_t i;
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret != 0)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
> +		if (val & 0b1)
> +			dev_err(&maxim->client->dev, "Overtemperature shutdown\n");
> +		if (val & 0b10)
> +			dev_warn(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");

The dev_warn() looks a bit odd here. Even through the hardware is alive
the drive reacts to this warning by refusing to probe.

That problem means this should be dev_err() like all the other issues
here.


> +		if (val & 0b1000)
> +			dev_err(&maxim->client->dev, "Boost converter overvoltage\n");
> +		if (val & 0b10000)
> +			dev_err(&maxim->client->dev, "Boost converter undervoltage\n");
> +		if (val & 0b100000)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set initial brightness
> + * 4. set setting register
> + * 5. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim, uint32_t initial_brightness)
> +{
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
> +			   maxim->strings_mask);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret != 0)
> +		return ret;
> +
> +	max25014_register_control(maxim->regmap,
> +				  initial_brightness);
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(
> +		maxim->regmap, MAX25014_SETTING,
> +		val & ~MAX25014_SETTING_FPWM);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENABLE | MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +
> +	if (bl_dev->props.state & BL_CORE_SUSPENDED)
> +		bl_dev->props.brightness = 0;

This should be using the backlight_is_blank() helper rather than
fiddling with the state variables.


> +
> +	return max25014_register_control(maxim->regmap, bl_dev->props.brightness);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_parse_dt(struct max25014 *maxim, uint32_t *initial_brightness)
> +{
> +	struct device *dev = &maxim->client->dev;
> +	struct device_node *node = dev->of_node;
> +	uint32_t strings[4];
> +	int res, i;
> +
> +	if (!node) {
> +		dev_err(dev, "no platform data\n");
> +		return -EINVAL;
> +	}
> +
> +	res = of_property_count_u32_elems(node, "maxim,strings");
> +	if (res == 4) {
> +		of_property_read_u32_array(node, "maxim,strings", strings, 4);
> +	} else {
> +		dev_err(dev, "strings property not correctly defined\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < 4; i++) {
> +		if (strings[i] == 0)
> +			maxim->strings_mask |= 1 << i;
> +	}
> +
> +	*initial_brightness = 50U;
> +	of_property_read_u32(node, "default-brightness", initial_brightness);
> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
> +
> +	if (maxim->iset < 0 || maxim->iset > 15) {
> +		dev_err(dev,
> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
> +			maxim->iset);
> +		return -EINVAL;
> +	}
> +
> +	if (*initial_brightness < 0 || *initial_brightness > 100) {
> +		dev_err(dev,
> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +			*initial_brightness);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	struct backlight_device *bl;
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct max25014 *maxim;
> +	struct backlight_properties props;
> +	int ret;
> +	uint32_t initial_brightness;
> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get(&maxim->client->dev, "power");
> +	if (IS_ERR(maxim->vin)) {
> +		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		maxim->vin = NULL;
> +	}
> +
> +	if (maxim->vin) {
> +		ret = regulator_enable(maxim->vin);
> +		if (ret < 0) {
> +			dev_err(&maxim->client->dev, "failed to enable Vin: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	maxim->enable =
> +		devm_gpiod_get_optional(&maxim->client->dev, "enable", GPIOD_ASIS);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = PTR_ERR(maxim->enable);
> +		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n", ret);
> +		goto disable_vin;
> +	}
> +
> +	if (maxim->enable) {
> +		gpiod_set_value_cansleep(maxim->enable, 1);
> +
> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +		usleep_range(2000, 2500);
> +	}
> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = PTR_ERR(maxim->regmap);
> +		dev_err(&maxim->client->dev, "failed to initialize the i2c regmap: %d\n", ret);
> +		goto disable_full;
> +	}
> +
> +	i2c_set_clientdata(cl, maxim);
> +
> +	ret = max25014_check_errors(maxim);
> +	if (ret) { /* error is already reported in the above function */
> +		goto disable_full;
> +	}
> +
> +	ret = max25014_configure(maxim, initial_brightness);
> +	if (ret) {
> +		dev_err(&maxim->client->dev, "device config err: %d", ret);
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;

Please ensure that props.scale is set to something better than UNKNOWN.


Daniel.
