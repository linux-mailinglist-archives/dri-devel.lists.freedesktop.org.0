Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B0F86FF36
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3410E9E8;
	Mon,  4 Mar 2024 10:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KvL0jlL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AF110E9E8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:40:04 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so49595311fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709548803; x=1710153603; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W9/tP/ZbC0JsITFItqvv/KxYTeSI+hdxPkuzSwYAtNM=;
 b=KvL0jlL16cGlKY5kXTEzLQaxf7iHkyeBgs85zM8uRC39LCj6C8uftE2zqvTEOzE5d1
 QBr0p1BFQlyWVoqY+zhgVhVebceQhlBW9bmCyW5OdnXSRmG2lrnjwoE9afV9gIuOTVGB
 7vYtLZcmkaV4h9AOBa1OTwpL7JqvpheV5hpU3E1l3F2OhmpQTTs4SvFobzssav692Hxi
 6tY45VJ9BmAT8BfCVqK+2sNIU0vWU9M1dc0Sot1lsMXX+Io/VhAhaaa3VL4Se17ZwdN/
 omkYBfm9rbXpOAa796uSfkXDCun3Gi7Rgpkltu0IOonUePuhwp0otRiz8/CVnWaIxy8u
 rOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709548803; x=1710153603;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9/tP/ZbC0JsITFItqvv/KxYTeSI+hdxPkuzSwYAtNM=;
 b=R/sSABxPti47zaGVFN0+BtR+xqxmGSLqBusES9dJ+ehP90ewMDZnDdLaLC8ev5dE8K
 w6d49gkHk47u8W7c30xP4loA+SCwJLrSunmKGRDDShVssRxHCAnQAoT4/qV1OMYKwwSy
 atCsLi3idusV9CsrUaRuCzdotAnaIBzYQesZ2Gtapewt/U0Kuy3PWpHQx49hbC/OwSil
 YBjRl7yV8kXgI247Muw0Smwpg1SMZL9NJ1dSWoiXUClwGqfIrAr+MWn16cPNyzFvQ00W
 5zUOEfESM42WeQ7Pu7kKPBVxF8bKv7T+5WW/6XunekbwxZpkCkJVBaSZSiYltjV+Z+/G
 AlLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCcQDJsEQU0CGXl5RJFeyb+bjzffk7oAQMfB+1c/Tkbv0dtEv/eXzhMw48z+ElqGwZEKDe/6D7GD5hbQ0bas0yntZSJSQ9jGtQt7kz1pRa
X-Gm-Message-State: AOJu0Yx8pzlDsukFIEMVMey7LUnUOyu3M+yai7JHOsFsoJSVMghJt/78
 kieXlScW1kP04aHPnZ7M/bT5YmdrunZUNbeNfaxAfurjQNU8WdEPGHeUg5bFa7k=
X-Google-Smtp-Source: AGHT+IHy2hD7I8n57uZ/ZLTPk4mOw39Pr9Mxe+/s9Lm4AJxmZpTlPtP8zpuXOrVna1EzdyQwmIaOcA==
X-Received: by 2002:a2e:3801:0:b0:2d2:a9f8:c436 with SMTP id
 f1-20020a2e3801000000b002d2a9f8c436mr4984250lja.53.1709548802698; 
 Mon, 04 Mar 2024 02:40:02 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 hg14-20020a05600c538e00b0041228b2e179sm14216843wmb.39.2024.03.04.02.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:40:02 -0800 (PST)
Date: Mon, 4 Mar 2024 10:40:00 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] backlight: gpio: Simplify with dev_err_probe()
Message-ID: <20240304104000.GA102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-1-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-1-e5f57d0df6e6@linaro.org>
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

On Mon, Mar 04, 2024 at 11:11:38AM +0100, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/video/backlight/gpio_backlight.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index d28c30b2a35d..9f960f853b6e 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -64,13 +64,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	def_value = device_property_read_bool(dev, "default-on");
>
>  	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod)) {
> -		ret = PTR_ERR(gbl->gpiod);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev,
> -				"Error: The gpios parameter is missing or invalid.\n");
> -		return ret;
> -	}
> +	if (IS_ERR(gbl->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> +				     "Error: The gpios parameter is missing or invalid.\n");

The "Error: " should be removed from the string. dev_err_probe() already prints
that.


Daniel.
