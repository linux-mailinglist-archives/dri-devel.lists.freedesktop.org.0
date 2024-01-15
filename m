Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2582D4EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA51C10E205;
	Mon, 15 Jan 2024 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D4810E205
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705306850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LRrQ9hj3v8JeCLKcpLTeqR/vnXCdHRzqkMMDMAxwZhE=;
 b=ahkiEaD3VNLcL7mLHZn+rMh9rvoZjqiANMY1XhJkY42DI8JX0tbsPYiEi8PDAeoul60Z69
 nyQQMuub9yckCt0Fn+zwmDfEnNZI1myyYMwhrZ5JVQw3m9LeDQI4hybpnwSD3dpOrFqLOG
 Y/jSdbhuD8clr86gQCIVLMWA2K1pBFA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-ouGdPspCOICuEbfN7HhQJA-1; Mon, 15 Jan 2024 03:20:49 -0500
X-MC-Unique: ouGdPspCOICuEbfN7HhQJA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e61491b81so16094325e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705306848; x=1705911648;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LRrQ9hj3v8JeCLKcpLTeqR/vnXCdHRzqkMMDMAxwZhE=;
 b=TcQqItZqfo7Xoq3usDZOZPj+0KySBbtKpf7oKy+fK0vuV7uEEbTh7nGY4x/yKE9NUY
 O8sC/7wfiT7WwWLoy9U4tQ2IGUzg1d4KlQZJr1K1h0cRjrkndgWQMfa0olsCe2Dect0S
 /R8sq1ItlrA0V9iUJHpZQ0ptSP1AZ5eoZr5uc5YOz3N43glQY1lQf7+KmEDa7lyzAviz
 dOIO61RcMQy2bHHQyn2v0F4FVDBMxkUAyHhyVo/D80Uubp+cDzf5//JzEAQj71Ku53sl
 AOvX/gENQhiL2g/Odmd1h2fe9jX7yy4kpRo+bGL7CGUh96a3MRAnPpJmFn5G0HGnWpRB
 O9ZQ==
X-Gm-Message-State: AOJu0YzOazHm4SUzjifvOOWM1YDB985WygeFUoYc51jX8mFVE8YQcRUw
 0z5eF/EFnZMovhJ2uv6hlu1gMuaiyQaomNh+eAnuG8quQu9ufJZQel2vR0MxDYBxoApwMH6kCVz
 4A/wm0QXIa8tI4pzylkSSHTzWBPVQsBsEAIcKIM6wRsAV
X-Received: by 2002:a05:600c:8515:b0:40e:66cd:1868 with SMTP id
 gw21-20020a05600c851500b0040e66cd1868mr2066353wmb.88.1705306847866; 
 Mon, 15 Jan 2024 00:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPwI3UICWY2yo54y5yNxKfPuc3OoaC2AsJ2BmiXtKiDTgSkaxoQcQyHiv07sCt2HzzIkDD2A==
X-Received: by 2002:a05:600c:8515:b0:40e:66cd:1868 with SMTP id
 gw21-20020a05600c851500b0040e66cd1868mr2066345wmb.88.1705306847586; 
 Mon, 15 Jan 2024 00:20:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d13-20020a056000114d00b003379d5d2f1csm5969671wrx.28.2024.01.15.00.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 00:20:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] backlight: hx8357: Make use of device properties
In-Reply-To: <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
Date: Mon, 15 Jan 2024 09:20:46 +0100
Message-ID: <87bk9novmp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

Hello Andy,

> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Include mod_devicetable.h explicitly to replace the dropped of.h
> which included mod_devicetable.h indirectly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/backlight/hx8357.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> index bf18337ff0c2..c7fd10d55c5d 100644
> --- a/drivers/video/backlight/hx8357.c
> +++ b/drivers/video/backlight/hx8357.c
> @@ -8,9 +8,9 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/lcd.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/property.h>
>  #include <linux/spi/spi.h>
>  
>  #define HX8357_NUM_IM_PINS	3
> @@ -564,6 +564,8 @@ static struct lcd_ops hx8357_ops = {
>  	.get_power	= hx8357_get_power,
>  };
>  
> +typedef int (*hx8357_init)(struct lcd_device *);
> +

This kind of typedef usage is frowned upon in the Linux coding style [0]
(per my understanding at least) and indeed in my opinion it makes harder
to grep.

[0] https://www.kernel.org/doc/Documentation/process/coding-style.rst

>  static const struct of_device_id hx8357_dt_ids[] = {
>  	{
>  		.compatible = "himax,hx8357",
> @@ -582,7 +584,7 @@ static int hx8357_probe(struct spi_device *spi)
>  	struct device *dev = &spi->dev;
>  	struct lcd_device *lcdev;
>  	struct hx8357_data *lcd;
> -	const struct of_device_id *match;
> +	hx8357_init init;
>  	int i, ret;
>  
>  	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
> @@ -597,8 +599,8 @@ static int hx8357_probe(struct spi_device *spi)
>  
>  	lcd->spi = spi;
>  
> -	match = of_match_device(hx8357_dt_ids, &spi->dev);
> -	if (!match || !match->data)
> +	init = device_get_match_data(dev);
> +	if (!init)
>  		return -EINVAL;
>  
>  	lcd->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> @@ -627,7 +629,7 @@ static int hx8357_probe(struct spi_device *spi)
>  
>  	hx8357_lcd_reset(lcdev);
>  
> -	ret = ((int (*)(struct lcd_device *))match->data)(lcdev);

This is what I mean, before it was clear what was stored in match->data.
But after you changes, what is returned by the device_get_match_data()
function is opaque and you need to look at the typedef hx8357_init to
figure that out.

No strong opinion though and I see other drivers doing the same (but no
other driver in drivers/video/backlight).

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

