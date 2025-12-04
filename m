Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BFCA46EA
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 17:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE3610E9A0;
	Thu,  4 Dec 2025 16:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fbLJpFaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB5010E995
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 16:17:25 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so9848665e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764865043; x=1765469843;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
 b=fbLJpFaILlPVuIhNh4mwx9zkFdbNuGiRomK7KNFDqk+9LLw1IFpB68nkTdoIMfg2ok
 eG8QsGhMcKcsOUismOQFqgF45gmkyp82TQIriQcTNU4zRUIbkn53ceEHZUTw35YffoTh
 7k63oMf24o0nhohvf/T6APN0J/TaCvGfhV0UlrGGWcTcHqlm1pzJ1E5q207GSCYrovWW
 EhKQtHtTjhIgr8groVl5iK2rJDnXFHqbbpk+/1dYDnIgYJ3hkPMvy25H041foPb9g7Cz
 kX6LzJnrNyK0YK7wLn1rgqyucWv2QVvkC/7oOIyj43Hyk9yGpp+tTxDWFD30ou8TrgBx
 Pznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764865043; x=1765469843;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
 b=Qknq/KfMv1S9ADO3BcEDh/Q68IlZRN+TVYmAtNwLc0lSn1iB80zCfwtscR2cK503vo
 AdJVkmiTxnztmgUNrpb6Y5JLy7d5nUsuEWANJaFtD9VDsUT68cBmUERDcgiaRQbV5M6N
 1S1vBPH3+CKNKElK4h47Ryye4ilsF5++O6BfuLWb+ttKR5pLtfkcbL5TY4iWFXBeVArH
 dIaEd3I8Tgi+8A8DkIOtH2CE7CAwVdTFiEMRiheZJirTkSqK9XzjEuJnyshYgxv8TiZ+
 Ojjk5P1tmVpIxbcKec7xJJ8g/YEsSU5Mi40ggFUD7OyGdnxiXqYCI6uu0toBYhq4KscB
 CKSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtGMPmlYRbXHObIYtGqigMbuGGpwp/JkZXMO2vS625spsySMmlHpCV501drBBVKdNeyFcUWZE0xw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpBV1qAuPRZHs49TF7ZqilObpfwU/oPgKDa/g8zvRR4SNMjl0B
 AzhS3rJo8BHSxIx/eRR8q4zWZN72s0x35st2DXqmJMT0oR0PxrWEkP8zhL6CD/3kp8M=
X-Gm-Gg: ASbGnctpW9Xw9f6aHI35jBULKPApwQLLcZqdyso3Dj3JZhSpMwYHO6xoNyI7+MMsbhl
 /jy3AQ0cmmaWOgPFTV6YTh/6WPpQePHKdbGZGO6oPgm0wumc3+lUYeAoXaMMq4HYEcQue5vdNt7
 EvEYSkMz38txWRcHJ8mVuitptFONLbWqASYVUDirUepPLB2va9zSvP4oCevAofx9ZSEHyuZtdsg
 oL+S1uJOaV7tuTM9aImIGqzH9kePJ6IXmUktIFQRtWpJHUQYNQTKtrSFTdHpkQM1Xu0jILRbsvq
 BilBL8wv1FyhvZzNjgyxfC3rsnTMVedcAzkVjS0Q6Um22oNHHeI9++HeimC2bCxiyw2uACZWrDZ
 Pd7N7uV6UEbizeZnmyfNniDpc3NuW+5osy4ISD2UHjOXzg8hY3DMw1JUKt+uhRcMFJUS9YQ5IWY
 gdA5ULBCb4QrxKqLn/yBFuHHyynqVmccI75910viNVlsCLDTtg74kgMlEtKCQ0f3v0Z6gCxg==
X-Google-Smtp-Source: AGHT+IH6HRzgtWVSRwk2pLy54f/ZcykaKll9/7ioHYJyiAfAQ0RExVb1Rrhx4JL/zXiO1Ib8Xi1u/g==
X-Received: by 2002:a05:600c:310c:b0:477:7b9a:bb0a with SMTP id
 5b1f17b1804b1-4792af34a44mr65294315e9.21.1764865043101; 
 Thu, 04 Dec 2025 08:17:23 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm4033746f8f.43.2025.12.04.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 08:17:22 -0800 (PST)
Date: Thu, 4 Dec 2025 16:17:20 +0000
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
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTG0EK_zuSB-U_bb@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
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

On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

> <snip>

> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint32_t val;
> +	uint8_t i;
> +	int ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);

Shouldn't this be MAX25014_SHORT_LED?


> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val && val != MAX25014_DIAG_HW_RST) {
> +		if (val & MAX25014_DIAG_OT)
> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & MAX25014_DIAG_OTW)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & MAX25014_DIAG_BSTOV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & MAX25014_DIAG_BSTUV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
> +		if (val & MAX25014_DIAG_IREFOOR)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set setting register
> + * 4. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim, int initial_state)
> +{
> +	uint32_t val;
> +	int ret;
> +
> +	/*
> +	 * Strings can only be disabled when MAX25014_ISET_ENA == 0, check if
> +	 * it needs to be changed at all to prevent the backlight flashing when
> +	 * it is configured correctly by the bootloader
> +	 */

Attach the comment to the if statement rather than the read.


> +	ret = regmap_read(maxim->regmap, MAX25014_DISABLE, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!((val & MAX25014_DISABLE_DIS_MASK) == maxim->strings_mask)) {
> +		if (initial_state == BACKLIGHT_POWER_ON) {
> +			ret = regmap_write(maxim->regmap, MAX25014_ISET, 0);
> +			if (ret)
> +				return ret;
> +		}
> +		ret = regmap_write(maxim->regmap, MAX25014_DISABLE, maxim->strings_mask);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
> +			   val & ~MAX25014_SETTING_FPWM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENA |
> +			   MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +	uint32_t reg;
> +	int ret;
> +
> +	if (backlight_is_blank(maxim->bl))
> +		bl_dev->props.brightness = 0;

This isn't right. Why would you change the backlight level just because
it is currently blanked (and sorry I missed this one last time).

> +
> +	reg  = TON_STEP * bl_dev->props.brightness;

The correct way to honour blanking is just go call
backlight_get_brightness() instead of reading the property directly.


> +
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(maxim->regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(maxim->regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
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
> +	if (!node)
> +		return dev_err_probe(dev, -EINVAL, "no platform data\n");
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
> +	if (maxim->iset > 15)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid iset, should be a value from 0-15, entered was %d\n",
> +				     maxim->iset);
> +
> +	if (*initial_brightness > 100)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +				     *initial_brightness);
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct backlight_properties props;
> +	uint32_t initial_brightness = 50;
> +	struct backlight_device *bl;
> +	struct max25014 *maxim;
> +	int ret;
> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get(&maxim->client->dev, "power");
> +	if (IS_ERR(maxim->vin)) {
> +		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->vin),
> +				     "failed to get power-supply");
> +	}
> +
> +	ret = regulator_enable(maxim->vin);
> +	if (ret)
> +		return dev_err_probe(&maxim->client->dev, ret,
> +			"failed to enable power-supply\n");

Can this use devm_regulator_get_enable()?


> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->enable),
> +				    "failed to get enable gpio\n");
> +		goto disable_vin;
> +	}
> +
> +	/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +	fsleep(2000);
> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->regmap),
> +			"failed to initialize the i2c regmap\n");
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
> +	ret = max25014_initial_power_state(maxim);
> +	if (ret < 0) {
> +		dev_err_probe(&maxim->client->dev, ret, "Could not get enabled state\n");
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +	props.power = ret;
> +
> +	ret = max25014_configure(maxim, ret);
> +	if (ret) {
> +		dev_err_probe(&maxim->client->dev, ret, "device config error");
> +		goto disable_full;
> +	}
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(bl),
> +				    "failed to register backlight\n");
> +		goto disable_full;
> +	}
> +
> +	maxim->bl = bl;
> +
> +	backlight_update_status(maxim->bl);
> +
> +	return 0;
> +
> +disable_full:
> +	gpiod_set_value_cansleep(maxim->enable, 0);

Why is this needed? It was only ever set by devm_gpiod_get_optional().

> +disable_vin:
> +	regulator_disable(maxim->vin);

This is also not needed if you use devm_regulator_get_enable().


> +	return ret;
> +}


Daniel.
