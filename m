Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3B86FBC8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 09:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133A910E8A2;
	Mon,  4 Mar 2024 08:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZvKCxFJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C11A10E8A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 08:23:57 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-412a9e9c776so30154995e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 00:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709540635; x=1710145435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0B/S92iop6tJSt6y19xw6lMDPscfK5eWpa1jA+Mi6B0=;
 b=ZvKCxFJMEFH4L1VJJllN45Vpb8TvCROOQ8x1Th6rEU95Jnf8Dkx7FDZyCyLHA/sdJ8
 w/U7luRi2QgIvVVzRl3zzaaHs+dwqIVkdnB+lBWzOZ6yElvuHMF/d2yS5bzsfo79g8sc
 k0dUCYuJ/Xo0/VQAspdoH+6LalyO2Y8mmThOsY/uCE43Adh9dgzkQ5sCBmEXOs7KQkvy
 BUJeMJeb/jqNPBX77w3CRdTV5fqMkzzPHxtXbrvkC3fRJ1e9jg2JLOg4qcjIInANAyjL
 2meGbfnxEWIR0DwsNQQAYbjriL/KGMZmu92sp4KHPKhdSPTap49ZgNt7C6mTdz7pZn1n
 qHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709540635; x=1710145435;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0B/S92iop6tJSt6y19xw6lMDPscfK5eWpa1jA+Mi6B0=;
 b=haDOt70WSN74e412399iPM77dzvcilWSgiUy7RZ+uKMjYB7hDx40oDnAFGa0vUpF/K
 +6iUQgCOJYDDbd/t8mE+4ErYVnlNBihXDtSf1RX9qf4vLAzANLgPr0nh/Rr9BN79DvN4
 Z5CH5UFjA8wJEaKoHR5ZHYbR0pQ9QjcRC7C6iSJ68M7z7B97mBOWo1hh1dmG4HW8VL8q
 gy10YU7xlIHb845BCsVmyC83U/tahITQhqaRA+PFy74kiQxwk7SUbRvfF88ndguJODAE
 FmQFpNPq6n4XwRJY9nCXh1hu507FWbCqbwfVo7i6we1pjE87UBUiBWq00kjLBWHxS+vN
 Ymng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZQO4UwfRKeOpV3ICX3CGtJ340CHT3E3an3SwgowjdZqURQPdCEq5K1CihgHBwyMTJfIPqz2zFJcwO1227HBuWyMXzXWmmqc8EubLM8OFq
X-Gm-Message-State: AOJu0Yxhw0PIWIP8DC5A2cQ+0snaH8XdFcG/euW/j7Qxeq8ppthAaDF/
 kHZ5/4EQrhAI30acaED9Nyz4BE30DueFHcljy2t5Oie/Ot2SQxP3PiAu2VUNLeKcDcReukKXSnH
 l
X-Google-Smtp-Source: AGHT+IHijnSBhCDeBF70yGIkkN4tLJTnCmSqTGDVLLG3DYKpSUid276mLfLgsuKKOwvUcro3lcDgBA==
X-Received: by 2002:a05:600c:4447:b0:412:dcf4:143c with SMTP id
 v7-20020a05600c444700b00412dcf4143cmr2953328wmn.13.1709540635586; 
 Mon, 04 Mar 2024 00:23:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c444c00b00412b9e4af05sm14018908wmn.0.2024.03.04.00.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:23:55 -0800 (PST)
Message-ID: <c758d0b2-d46f-43ce-bfc2-c7ede4c3a945@linaro.org>
Date: Mon, 4 Mar 2024 09:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] backlight: Add new lm3509 backlight driver
Content-Language: en-US
To: Patrick Gansterer <paroga@paroga.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240302212757.1871164-1-paroga@paroga.com>
 <20240302212757.1871164-2-paroga@paroga.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240302212757.1871164-2-paroga@paroga.com>
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

On 02/03/2024 22:27, Patrick Gansterer wrote:
> This is a general driver for LM3509 backlight chip of TI.
> LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
> Dual Current Sinks. This driver supports OLED/White LED select, brightness
> control and sub/main control.
> The datasheet can be found at http://www.ti.com/product/lm3509.
> 
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>
> ---


...

> +
> +static int lm3509_probe(struct i2c_client *client)
> +{
> +	struct lm3509_bl *data;
> +	struct device *dev = &client->dev;
> +	int ret;
> +	bool unison_mode = false;
> +	bool oled_mode = false;
> +	unsigned int reg_gp_val = 0;
> +	u32 rate_of_change = 0;
> +	u32 brightness = LM3509_DEF_BRIGHTNESS;
> +	u32 max_brightness = LM3509_MAX_BRIGHTNESS;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "fail : i2c functionality check\n");

Drop the "fail : " everywhere and instead write something useful.


> +		return -EOPNOTSUPP;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(struct lm3509_bl), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &lm3509_regmap);
> +	if (IS_ERR(data->regmap)) {
> +		dev_err(dev, "fail : allocate register map\n");

This message can be dropped entirely.

> +		return PTR_ERR(data->regmap);
> +	}
> +	i2c_set_clientdata(client, data);
> +
> +	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(data->reset_gpio)) {
> +		ret = PTR_ERR(data->reset_gpio);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "fail : get reset GPIO: %d\n", ret);

No, don't upstream old vendor code directly but instead choose existing
mainline driver and customize it. The syntax is `return dev_err_probe()`.

> +		return ret;
> +	}
> +
> +	lm3509_reset(data);
> +
> +	of_property_read_u32(dev->of_node, "default-brightness", &brightness);
> +	of_property_read_u32(dev->of_node, "max-brightness", &max_brightness);
> +	unison_mode = of_property_read_bool(dev->of_node, "ti,unison-mode");
> +	oled_mode = of_property_read_bool(dev->of_node, "ti,oled-mode");
> +

Best regards,
Krzysztof

