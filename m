Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A9D2008B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FC110E012;
	Wed, 14 Jan 2026 16:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KOMtm1ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C02210E012
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:03:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43246af170aso659897f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768406595; x=1769011395;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ki1lLYztHBUL2cAjzv+IOytmx7cnlyYwYvN02RNUp4U=;
 b=KOMtm1ZBnegZ4YyZNShZ8vENmplJzjw4c30r3GsbZIzujkFyXc7wNTC5tYkP+/E/VA
 JgMDfw8fSX2409ubgOxcmZ/0kQ8eJuE/tUXXAtv9yzU30j98ESq/ITsDcpCw9tM61qJy
 rNu7kA5LP2EERkQkNcOkQEnqUppQ35jbV+uf2F0WvvFBoPrfDskCKU/lkRacODGO9p66
 JsiFEJ/7q7kC0a/9J2e4sNBXpBNtboWxkc+JVfCw0wrAE5Xtky4FouaAQ6pIJ78RIDF0
 abhRpWog5TyPy0gqr/4k8p0ldBW9dJN5tbJkHQotg2iXozpfsFFa+LchINYwaXKM0X+L
 bAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768406595; x=1769011395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ki1lLYztHBUL2cAjzv+IOytmx7cnlyYwYvN02RNUp4U=;
 b=K1UwkIBtOFQIw/3JsjbAsTU9yy6jZoZumzYGHiXr6eX8JOqCfDvQPOMCy0qBSoLn/1
 b1r6ZD6wkfrjqav4+FACVVK+4Jrg/0POuw9YyroEWhMrttUQvJQ3REIL0v52L9cT+Ezc
 J1x73XHh9NwFQZNY+4vIGts6JFRN5y8FxRX5li8CZ17UrljlIMxYX21waF1mQcrwIls3
 ll0MS9zXeLS8o9RW7SWJWxR31vBBwF179HDMT4MUqg6FNMvbl6w92PtwWH0sd6KMtCyz
 Rc7TdLRJrrxa4lCKR56DajO83SpoqINp64t8BdzIhWXsUx2mCr6CsJRXG6xAoM8rGPP8
 g0wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz8k1OZuFsAiqilT45CQPYI5l/cFbTzqNKgyUdMGHr2LSR8feQGru7AOZ5TXzcfC6g1QTwZ9JhUBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhUnMTaqyLw9EhsOdMQCFxNk/NT++P3fAUSih98jR7UXecmkWn
 FT5LKHunIvDuFq8fkiw+FNQJ8+pjY9RiAulKhZNCXzuIrvC8PKqeBAG74RJbykj1lCM=
X-Gm-Gg: AY/fxX5xEhLiDQIai3FEVmn+eVfwDQgJO9tjBJ1h5r7acW99Eurm16pFg30Wj39Snvy
 fEvxOhGFMEkj3zmnPthoGpmzGuZecdDntN4o1t71dad034lcSKnPMh+m5BJceUge8D5O9ziYmHw
 +0A0uQc+XYaIOVzNsVyvQdB/rtkQTIereGBKBsMTGlT1znNikYR1j0E8gvj9SPPUpbahgTp/9+Q
 7N8JUQZWcQRXR/t7GjKK5HMMgRGigFvvejVZF5KlNbuZ36SXCglq7Up0HBlRnqLL+WDXV0INzTm
 cQiBu/6mdBqfLMvHULIUYunCxX0ws9L9BC1gL4WnRF7vN30I32jb+tdoM1Yx3ldL2mEsBeDILi6
 M7YTigWCmr9zzvMGyiJP3Q+tHzp2yj1IYq+DzB0GHnSTgR2NMYJSP1BHy6EkxPjyL0AEgdkTk7Y
 Vuouk2fs9ZPxXQXsJeUqT/mXBeZ2cPLvivnszsYf+Qp1513X1GQLYJ5fK/75xlHF17y2VduWCfr
 TJW2UOZUA0+YsXhGiGnsG7JxvWeuCbi5IAyWGlJhYU7LH6S8HtUuy5eGxPx9eJeQJToEsbO
X-Received: by 2002:a5d:5f47:0:b0:431:397:4c4f with SMTP id
 ffacd0b85a97d-4342c0ac6e4mr4353689f8f.7.1768406595260; 
 Wed, 14 Jan 2026 08:03:15 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6d90aasm40196f8f.29.2026.01.14.08.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:03:14 -0800 (PST)
Date: Wed, 14 Jan 2026 16:03:12 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <aWe-QA_grqNwnE4n@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
 <aVuN7zVUWJ1qsVh8@aspen.lan>
 <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
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

On Tue, Jan 13, 2026 at 12:47:26PM +0530, tessolveupstream@gmail.com wrote:
>
>
> On 05-01-2026 15:39, Daniel Thompson wrote:
> > On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
> >> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
> >> single one. This allows panels that require driving several enable pins
> >> to be controlled by the backlight framework.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
> >>  1 file changed, 45 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> >> index 728a546904b0..037e1c111e48 100644
> >> --- a/drivers/video/backlight/gpio_backlight.c
> >> +++ b/drivers/video/backlight/gpio_backlight.c
> >> @@ -17,14 +17,18 @@
> >>
> >>  struct gpio_backlight {
> >>  	struct device *dev;
> >> -	struct gpio_desc *gpiod;
> >> +	struct gpio_desc **gpiods;
> >> +	unsigned int num_gpios;
> >
> > Why not use struct gpio_descs for this?
> >
> > Once you do that, then most of the gbl->num_gpios loops can be replaced with
> > calls to the array based accessors.
> >
>
> Based on your feedback, I have updated the implementation to use
> struct gpio_descs and array-based accessors, as recommended like
> below:
>
> git diff drivers/video/backlight/gpio_backlight.c
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 037e1c111e48..e99d7a9dc670 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -14,22 +14,37 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/bitmap.h>
>
>  struct gpio_backlight {
>         struct device *dev;
> -       struct gpio_desc **gpiods;
> +       struct gpio_descs *gpiods;
>         unsigned int num_gpios;
>  };
>
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>         struct gpio_backlight *gbl = bl_get_data(bl);
> -       unsigned int i;
> +       unsigned int n = gbl->num_gpios;
>         int br = backlight_get_brightness(bl);
> +       unsigned long *value_bitmap;
> +       int words = BITS_TO_LONGS(n);
> +
> +       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);

Not sure you need a kcalloc() here. If you want to support more than 32
GPIOs then you can pre-allocate space with a devm_kcalloc() in the probe
method rather than reallocate every time it is used.

To be honest I don't really mind putting a hard limit on the maximum
gpl->num_gpios (so you can just use a local variable) and having no
allocation at all.


> Could you please share your thoughts on whether this approach
> aligns with your expectations?

Looks like it is going in the right direction, yes.


Daniel.
