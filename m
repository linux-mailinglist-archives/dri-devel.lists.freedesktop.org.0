Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27C82D4F4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A1210E0E8;
	Mon, 15 Jan 2024 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206B710E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705306943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDvrcOFbZHCB3Od8Ma5mTsDvXWbMD7Yk0uFxpr0XBF8=;
 b=h9fKs8sb0uoDaBH8SsDymAr+3IrEEAnJw4WA+yOgoVgeGIkYj4tGVKfvXlSJaFVEei25YA
 LYmimmTmcoBT50Qcmand0ChvS9PWqN+yGnPTJL/muOG7RszEsLZH7Qf8KBYATtb9yTgrC8
 CYKZ0kYwnymAKMRXt9FA5V083NHJE34=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-xCyV8SeMOXm0bLM8JT7K1g-1; Mon, 15 Jan 2024 03:22:21 -0500
X-MC-Unique: xCyV8SeMOXm0bLM8JT7K1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e4caa37f5so49436625e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705306940; x=1705911740;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nDvrcOFbZHCB3Od8Ma5mTsDvXWbMD7Yk0uFxpr0XBF8=;
 b=Nu9Z8nc25mv7NtlE7kxLkhjMzhQ7ojq3GW5MfG6GlVkKc21uo87KNwE0F/vIPzl3Sw
 Q85EQxVp0HIImclSA4sBYSoxCVhmnnfE6BQmhLI3wD0jeG+IwQEhwyBDI1pUBHM8vdrr
 rY7ho4JY1v/txqBbS2zyWn4GodMe0mQGRR5VpOuOcQPZ730ARE2xUrkez/NyXW1XLXwT
 9uKI2gvrV5KgP5TZRhJQkdifXFt6ELvju9k+O9T6+8ycpqWSITqiwq85Y/ynVr0qh/Yp
 gC2C8DNmgPU+RfGCF+/hCz0bYAQLj+45VY+LVl7y1NyDRJE/zTx+SwDqQHh+qo9yl3V6
 vkEQ==
X-Gm-Message-State: AOJu0YzMgWh8LlSJqWQjBAz/Zc7wvUAwRGqirXUBPiUQ7/eE/9lFY5hp
 mMnrJA1jdOMuMrNJEVnjmYvjTj/rjpdCej44m36T5faqtoO4w2qhsSRGsv3tozZ2oE94NemdwZA
 aY6/twIhB+DEhfFH93HGtz3MSM5NswHp6f1tl
X-Received: by 2002:a7b:c001:0:b0:40d:5f48:d1ed with SMTP id
 c1-20020a7bc001000000b0040d5f48d1edmr2597181wmb.66.1705306940695; 
 Mon, 15 Jan 2024 00:22:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ0NHyBcjOe6YwXt82/ItKtsQM+F0s2up4dWVDb/3J/Yk/w5sS+hxI8gjhqkvBzGwvSzZIiw==
X-Received: by 2002:a7b:c001:0:b0:40d:5f48:d1ed with SMTP id
 c1-20020a7bc001000000b0040d5f48d1edmr2597172wmb.66.1705306940369; 
 Mon, 15 Jan 2024 00:22:20 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b0040d2d33312csm15166041wmo.2.2024.01.15.00.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 00:22:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] backlight: hx8357: Move OF table closer to its
 consumer
In-Reply-To: <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-3-andriy.shevchenko@linux.intel.com>
Date: Mon, 15 Jan 2024 09:22:19 +0100
Message-ID: <878r4rovk4.fsf@minerva.mail-host-address-is-not-set>
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

> Move OF table near to the user.
>
> While at it, drop comma at terminator entry.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/backlight/hx8357.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> index c7fd10d55c5d..8709d9141cfb 100644
> --- a/drivers/video/backlight/hx8357.c
> +++ b/drivers/video/backlight/hx8357.c
> @@ -566,19 +566,6 @@ static struct lcd_ops hx8357_ops = {
>  
>  typedef int (*hx8357_init)(struct lcd_device *);
>  
> -static const struct of_device_id hx8357_dt_ids[] = {
> -	{
> -		.compatible = "himax,hx8357",
> -		.data = hx8357_lcd_init,
> -	},
> -	{
> -		.compatible = "himax,hx8369",
> -		.data = hx8369_lcd_init,
> -	},
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, hx8357_dt_ids);
> -
>  static int hx8357_probe(struct spi_device *spi)
>  {
>  	struct device *dev = &spi->dev;
> @@ -640,6 +627,19 @@ static int hx8357_probe(struct spi_device *spi)
>  	return 0;
>  }
>  
> +static const struct of_device_id hx8357_dt_ids[] = {
> +	{
> +		.compatible = "himax,hx8357",
> +		.data = hx8357_lcd_init,
> +	},
> +	{
> +		.compatible = "himax,hx8369",
> +		.data = hx8369_lcd_init,
> +	},
> +	{}

While at it, maybe add the { /* sentinel */ } convention to the last entry ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

