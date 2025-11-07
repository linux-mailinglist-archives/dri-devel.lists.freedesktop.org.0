Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DEC40CA5
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069D610EB0D;
	Fri,  7 Nov 2025 16:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Pmr+/wlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6968B10EB0D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:12:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47114a40161so9742875e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762531943; x=1763136743;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4I9Nmi0x1XRh5MmNss3uO6kHDeCcgFZXdE1zsROAGYg=;
 b=Pmr+/wlE5WYk3NolzGdivpGJOgH+vtzNhbXlMmAt66ZQ9jPTKv0IQyTj5r87nDItbL
 uncCuHDpcEBRptH4SeLBrFyKTbAmE7KfY7qI/GP92qgwnh3xu4uKROSCrSrkrqmNamWk
 RK9Wi9AYWDhxdEY6SDq7RgTfwiaqti/6lVhclOaJG5bB9oOPbFLuMX3Lwa51dOzyYnSa
 6+cfv0wFwDQV+im3I4FkoMzq/faMB2iV6j9ezCRb34/uZRuYQHFsJXcNFXV8LbxpAEih
 L/UCVXRnfDJrAjCtBEA5wdAd9An1rbjuRR9DhQGrG0y1pzzyDrAwurap3Sj32fywiEBc
 b/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762531943; x=1763136743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4I9Nmi0x1XRh5MmNss3uO6kHDeCcgFZXdE1zsROAGYg=;
 b=sNw/HbdK7ss4JJSGqJlcyzfjTZctHHByS7fL5ZpCRHuk8a23Io+qt/gPBsua/u6HnN
 uW3KdmpxQUGPMMx57CgdOcjCxZJ0SOQXokgn4ZPIvTBlqz9lOmJ+cRin9s2HAvVJompn
 RzBq6W1EFx2mvfNSZ0nCwcZn5UbFexCHKlupmaL2OVgFf6kCvfEgkk5k9QdiE31UQOmZ
 P7DPmA5k8c3PF/icbvmmYYNyPkIQ4HCKpOLmV/rsAl7kdYw9z1bOR80IJBLeIDwgUlEf
 y3Q5iuXd8GZkUBZAAeZgBwqDGwSI+BFu7TiDEpPi1ZGjwC19khbMuscMcNBqRN8Jt9k4
 xKjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcbKfY3vrFd7Z5SQu8nPnxWyagHuNfX3iw/vuTO0RUfM7+Km5Q+zi5FF2odWf5AJxvHvmuTIpB748=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr44Rz1vAce04P2taWY9P9Lb+fpZQ1enXk23YclkCKhUNSG7XT
 X685tE8cJPchWfbvx/ezXVA0AMut6mLiSgZ6KQSXVxo36ZjLZ0LpynQOMCFnYA9wprg=
X-Gm-Gg: ASbGncsBQr3SRFxGVjnUQAqmSyeWRnm90wsFBuFwfmM3ifNMVS8L6SiFo5MiFWjTeit
 SrQoT5wfbCLyXI9FEKE99lSUbASzxkGlnVMoiNSTYyl9EPfSjDSjcW4fkPvHwkcHWy5XpHW0DaG
 PyLFGzjtRBin7vfhBzrhvqBgHmBybeC6SNvhhXW7Fx7jDeo3nZ5HG7mXJwHk202zK/9sRbETQ68
 e/ImDRD6ZFhNGBQ5bzDJU6veUpkwiaFSoW6Pu3wPqiPnudRAaa1jYlhgY8d2TFLB2xifG6v3Jyo
 ghR5GWzURz9X9O6SSuRzgNbFiprTbJVnPxSzzueDQ7ItfACpE0EJCs0LH+6lAASmppy3/2d0YNa
 0YOg4duYoJB86t4yHzSdUsN99bewXV0UdoYHZ1MgjDiCd/f/eoYcnRe5VDcdBsrFGtQsHaVvy/I
 uOrlzle5cWl/gUn8AOJBjhjnPhHKdVTsdIDGm355PjwE+cf48tnBFkiDIloJs=
X-Google-Smtp-Source: AGHT+IGHroTzRo1cJ44LOHTxL+NRy7sTi9c/ImeIIStaKdw3lsU0/qp1TjSL/vM3MWErBezrq59Q0A==
X-Received: by 2002:a05:6000:1884:b0:429:cbba:b247 with SMTP id
 ffacd0b85a97d-42ae58d03b4mr3192709f8f.23.1762531942614; 
 Fri, 07 Nov 2025 08:12:22 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe62b23csm6015125f8f.10.2025.11.07.08.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 08:12:21 -0800 (PST)
Date: Fri, 7 Nov 2025 16:14:17 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aQ4a2SBDldYgQb56@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
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

On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 000000000000..36bae508697e
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,409 @@
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

This isn't a good name for a function. It doesn't really say what it
does. Please find a more descriptive name.


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
> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & 0b10)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & 0b1000)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & 0b10000)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
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

How does this code set the initial brightness? It doens't set the
MAX25014_TON* registers.


> + * 4. set setting register
> + * 5. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim)
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
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
> +			   val & ~MAX25014_SETTING_FPWM);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENABLE |
> +			   MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +
> +	if (backlight_is_blank(maxim->bl))
> +		bl_dev->props.brightness = 0;
> +
> +	return max25014_register_control(maxim->regmap,
> +					 bl_dev->props.brightness);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_parse_dt(struct max25014 *maxim,
> +			     uint32_t *initial_brightness)
> +{
> +	struct device *dev = &maxim->client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct fwnode_handle *child;
> +	uint32_t strings[4];
> +	int res, i;
> +
> +	if (!node) {
> +		dev_err(dev, "no platform data\n");
> +		return -EINVAL;
> +	}
> +
> +	child = device_get_next_child_node(dev, NULL);
> +	if (child) {
> +		res = fwnode_property_count_u32(child, "led-sources");
> +		if (res > 0) {
> +			fwnode_property_read_u32_array(child, "led-sources",
> +						       strings, res);
> +
> +			/* set all strings as disabled, then enable those in led-sources*/
> +			maxim->strings_mask = 0xf;
> +			for (i = 0; i < res; i++) {
> +				if (strings[i] <= 4)
> +					maxim->strings_mask &= ~BIT(strings[i]);
> +			}
> +		}
> +
> +		fwnode_property_read_u32(child, "default-brightness",
> +					 initial_brightness);
> +
> +		fwnode_handle_put(child);
> +	}
> +
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
> +	uint32_t initial_brightness = 50;
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
> +	maxim->vin = devm_regulator_get_optional(&maxim->client->dev, "power");

I would have expected to see devm_regulator_get() here. Why do you care
whether you get a real regulator or a dummy if you just NULL check
maxim->vin everywhere?


> +	if (IS_ERR(maxim->vin)) {
> +		if (PTR_ERR(maxim->vin) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		maxim->vin = NULL;
> +	}
> +
> +	if (maxim->vin) {

If you had called devm_regulator_get() there would be no need for a NULL
check here.


> +		ret = regulator_enable(maxim->vin);
> +		if (ret < 0) {
> +			dev_err(&maxim->client->dev,
> +				"failed to enable Vin: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_ASIS);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = PTR_ERR(maxim->enable);
> +		dev_err(&maxim->client->dev, "failed to get enable gpio: %d\n",
> +			ret);
> +		goto disable_vin;
> +	}
> +
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 1);

No need for NULL pointer check here (see
https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpio/gpiolib.c#L358-L363 ).


> +
> +	/* Enable can be tied to vin rail wait if either is available */
> +	if (maxim->enable || maxim->vin) {
> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +		usleep_range(2000, 2500);
> +	}

If you really want to keep the devm_regulator_get_optional() I guess
maybe you could persuade me it's need to avoid this sleep... although
I'd be fairly happy to remove the NULL checks here too!


> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = PTR_ERR(maxim->regmap);
> +		dev_err(&maxim->client->dev,
> +			"failed to initialize the i2c regmap: %d\n", ret);
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
> +	ret = max25014_configure(maxim);
> +	if (ret) {
> +		dev_err(&maxim->client->dev, "device config err: %d", ret);
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl))
> +		return PTR_ERR(bl);
> +
> +	maxim->bl = bl;
> +
> +	return 0;
> +
> +disable_full:
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 0);

Again, NULL check isn't needed.

> +disable_vin:
> +	if (maxim->vin)
> +		regulator_disable(maxim->vin);
> +	return ret;
> +}
> +
> +static void max25014_remove(struct i2c_client *cl)
> +{
> +	struct max25014 *maxim = i2c_get_clientdata(cl);
> +
> +	maxim->bl->props.brightness = 0;
> +	max25014_update_status(maxim->bl);
> +	if (maxim->enable)
> +		gpiod_set_value_cansleep(maxim->enable, 0);

Lose the NULL check.

> +	if (maxim->vin)
> +		regulator_disable(maxim->vin);
> +}
> +
> +static const struct of_device_id max25014_dt_ids[] = {
> +	{ .compatible = "maxim,max25014", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max25014_dt_ids);
> +
> +static const struct i2c_device_id max25014_ids[] = {
> +	{ "max25014" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max25014_ids);
> +
> +static struct i2c_driver max25014_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = of_match_ptr(max25014_dt_ids),
> +	},
> +	.probe = max25014_probe,
> +	.remove = max25014_remove,
> +	.id_table = max25014_ids,
> +};
> +module_i2c_driver(max25014_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
> +MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
> +MODULE_LICENSE("GPL");


Daniel.
