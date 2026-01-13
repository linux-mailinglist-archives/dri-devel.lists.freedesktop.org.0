Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC81D16F6B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 08:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A2A10E456;
	Tue, 13 Jan 2026 07:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SmXcLoVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4251E10E456
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:17:04 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-bc2abdcfc6fso2693146a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 23:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768288624; x=1768893424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UvKer4HmMc5hx5FHqiulh9U9Ul3iO4PsRZgPY52JLDQ=;
 b=SmXcLoVmdr3u4c6Ys7DoJcWZl8eFc3uDAN5KUdvTJiSQqEP4lNIObqwbHvppIES2b/
 7NnjRpDROyY8Zu08VUjTBESLvTLm3ltESSsBVW/BBD0G0Zwp13+ZOPRhtMlOhUtIURMS
 5fKtV9FSBrxsI/I1/DayQ10E8+0kezORfGgwt60TERGtUtOFaS6iqROt4dyiNGQBrAEi
 bUJ3of0o8910tNikZLvUWKfV/B3J+0xxUSFsfxS37H3dp4AKRyFkvh9iqv9wWg1Bepl4
 /5fV1y3oVglzWyA8r7C9Kkdy3+xl7waGi2ifxpQq+alFWxDPLLKy/7FYrYXaR5M0uVx4
 Qolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768288624; x=1768893424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvKer4HmMc5hx5FHqiulh9U9Ul3iO4PsRZgPY52JLDQ=;
 b=SIo9S9LjCmAjK2ORzc2oSatASJtykrEkgLPVcYv46sNE1olbQsvQRA/Fvbn3kIbjfC
 jGM/zYLusvGI0bC/pHXPm6x0BH4JwbWT+DBinZCOF1O35tC0BAaQJSC4dq0kA0PKyAIY
 Nfs2r7ctg0DGNkKmIOjwLFlZNMx37ZASxk3Edc1022FCdJUtxT/wKZ0ZpF8yBF71cpeu
 hi9edxp4tIfKoDnIbQA6M2Im0Szb0jVvMcVYxCk8mYm9UjuLe8rK9LMoapsFCPdXgIsW
 r1VOxZVabdh2cCrpMjuYBA9LcXu7VIirUo1BVkqy/OqT4Qbe1XGXqQxkDKBcBDloRoWK
 rtZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvYsKkBQPhExPuj0VM27O5cO185PiDjAS4fleC4EDORrfFgBD50U0ylOe1/8Xd1reGWCT+3S2Tfa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwflrYOkt5V8vrp3PXsBJKh1Ly90l0qd9k5tRnw1rvVf6r5wOKI
 6ahHxoI+dkO0DBujPkd+rj8jFx8OPd628FMHks3ZNaU/c5up1s4KONq5
X-Gm-Gg: AY/fxX4rgbMXamhK/Rkx/5AhaOtb3K3pt6ifil0sBQ/AlFc2n9Pmy49oxL6Hk/s4qHJ
 OS4eJLzZIn5O69HfhfWhbgQIPBfbBPgmRh1YfHFjh8ZLyYTyh0MSUrb1ckEqWl1r8TtSsI2nlXs
 CvIUrJ0vjxIA3vSQ8PhTR08t8kDfVfYdGpTH+o1gybbFDMrTZ5+e7z3lOjroMd29ek3wVxLFhFT
 nzWSTp05j4uajtn73bG39zCR7zlCojbKis0z6LK/gg3Ki92kmeN91NYaCxlXgyIaB0IiKgvokSE
 YyMSNPnY1BM/6Ctu9A3GrBJUg7i/Sf5JsWjNnbmPh3xMT40sne72WuVBweUNUqR1Bww3H8WkPHN
 CV40L3D/zF1vHD5MUFL12H5iQAp586mPCknuM3s9KYMhiMb8n+8cWwizx6hprC8kGpKbdERT2rv
 f2bTxyFezEyxY5EgEOWxoBMfaUgY8ctCP1Wg==
X-Google-Smtp-Source: AGHT+IGycyqSgqnKXtUwOpZwa1uFrCeCy1ot/yCOkWRUaczihN0aqz+rrtY+DvAGGlu2iBfjLIOe4g==
X-Received: by 2002:a05:6300:210d:b0:364:be7:6fe9 with SMTP id
 adf61e73a8af0-3898f8cbb93mr15641886637.32.1768288623537; 
 Mon, 12 Jan 2026 23:17:03 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cc8d2952dsm6490255a12.17.2026.01.12.23.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 23:17:03 -0800 (PST)
Message-ID: <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
Date: Tue, 13 Jan 2026 12:47:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
 <aVuN7zVUWJ1qsVh8@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aVuN7zVUWJ1qsVh8@aspen.lan>
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



On 05-01-2026 15:39, Daniel Thompson wrote:
> On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
>> single one. This allows panels that require driving several enable pins
>> to be controlled by the backlight framework.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>>  1 file changed, 45 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>> index 728a546904b0..037e1c111e48 100644
>> --- a/drivers/video/backlight/gpio_backlight.c
>> +++ b/drivers/video/backlight/gpio_backlight.c
>> @@ -17,14 +17,18 @@
>>
>>  struct gpio_backlight {
>>  	struct device *dev;
>> -	struct gpio_desc *gpiod;
>> +	struct gpio_desc **gpiods;
>> +	unsigned int num_gpios;
> 
> Why not use struct gpio_descs for this?
> 
> Once you do that, then most of the gbl->num_gpios loops can be replaced with
> calls to the array based accessors.
>

Based on your feedback, I have updated the implementation to use
struct gpio_descs and array-based accessors, as recommended like
below:

git diff drivers/video/backlight/gpio_backlight.c
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 037e1c111e48..e99d7a9dc670 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -14,22 +14,37 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/bitmap.h>

 struct gpio_backlight {
        struct device *dev;
-       struct gpio_desc **gpiods;
+       struct gpio_descs *gpiods;
        unsigned int num_gpios;
 };

 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
        struct gpio_backlight *gbl = bl_get_data(bl);
-       unsigned int i;
+       unsigned int n = gbl->num_gpios;
        int br = backlight_get_brightness(bl);
+       unsigned long *value_bitmap;
+       int words = BITS_TO_LONGS(n);
+
+       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
+       if (!value_bitmap)
+               return -ENOMEM;
+
+       if (br)
+               bitmap_fill(value_bitmap, n);
+       else
+               bitmap_zero(value_bitmap, n);

-       for (i = 0; i < gbl->num_gpios; i++)
-               gpiod_set_value_cansleep(gbl->gpiods[i], br);
+       gpiod_set_array_value_cansleep(gbl->gpiods->ndescs,
+                                  gbl->gpiods->desc,
+                                  gbl->gpiods->info,
+                                  value_bitmap);

+       kfree(value_bitmap);
        return 0;
 }

@@ -67,22 +82,18 @@ static int gpio_backlight_probe(struct platform_device *pdev)

        def_value = device_property_read_bool(dev, "default-on");

-       gbl->num_gpios = gpiod_count(dev, NULL);
+       gbl->gpiods = devm_gpiod_get_array(dev, NULL, GPIOD_ASIS);
+       if (IS_ERR(gbl->gpiods)) {
+               if (PTR_ERR(gbl->gpiods) == -ENODEV)
+                       return dev_err_probe(dev, -EINVAL,
+                       "The gpios parameter is missing or invalid\n");
+               return PTR_ERR(gbl->gpiods);
+       }
+
+       gbl->num_gpios = gbl->gpiods->ndescs;
        if (gbl->num_gpios == 0)
                return dev_err_probe(dev, -EINVAL,
                        "The gpios parameter is missing or invalid\n");
-       gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
-                                  GFP_KERNEL);
-       if (!gbl->gpiods)
-               return -ENOMEM;
-
-       for (i = 0; i < gbl->num_gpios; i++) {
-               gbl->gpiods[i] =
-                       devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
-               if (IS_ERR(gbl->gpiods[i]))
-                       return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
-                                       "Failed to get GPIO at index %u\n", i);
-       }

        memset(&props, 0, sizeof(props));
        props.type = BACKLIGHT_RAW;
@@ -101,14 +112,26 @@ static int gpio_backlight_probe(struct platform_device *pdev)
                                                    : BACKLIGHT_POWER_OFF;
        } else {
                bool all_high = true;
-
-               for (i = 0; i < gbl->num_gpios; i++) {
-                       if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
-                               all_high = false;
-                               break;
-                       }
+               unsigned long *value_bitmap;
+               int words = BITS_TO_LONGS(gbl->num_gpios);
+
+               value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
+               if (!value_bitmap)
+                       return -ENOMEM;
+
+               ret = gpiod_get_array_value_cansleep(gbl->gpiods->ndescs,
+                                           gbl->gpiods->desc,
+                                           gbl->gpiods->info,
+                                           value_bitmap);
+               if (ret) {
+                       kfree(value_bitmap);
+                       return dev_err_probe(dev, ret,
+                                           "failed to read initial gpio values\n");
                }

+               all_high = bitmap_full(value_bitmap, gbl->num_gpios);
+
+               kfree(value_bitmap);
                bl->props.power =
                        all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
        }
@@ -118,7 +141,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
        init_brightness = backlight_get_brightness(bl);

        for (i = 0; i < gbl->num_gpios; i++) {
-               ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
+               ret = gpiod_direction_output(gbl->gpiods->desc[i], init_brightness);
                if (ret)
                        return dev_err_probe(dev, ret,
                                        "failed to set gpio %u direction\n",

Could you please share your thoughts on whether this approach 
aligns with your expectations?
 
> 
>>  };
>>
>>  static int gpio_backlight_update_status(struct backlight_device *bl)
>>  {
>>  	struct gpio_backlight *gbl = bl_get_data(bl);
>> +	unsigned int i;
>> +	int br = backlight_get_brightness(bl);
>>
>> -	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
>> +	for (i = 0; i < gbl->num_gpios; i++)
>> +		gpiod_set_value_cansleep(gbl->gpiods[i], br);
>>
>>  	return 0;
>>  }
>> @@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>  	struct backlight_device *bl;
>>  	struct gpio_backlight *gbl;
>>  	int ret, init_brightness, def_value;
>> +	unsigned int i;
>>
>>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>>  	if (gbl == NULL)
>> @@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>
>>  	def_value = device_property_read_bool(dev, "default-on");
>>
>> -	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
>> -	if (IS_ERR(gbl->gpiod))
>> -		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
>> -				     "The gpios parameter is missing or invalid\n");
>> +	gbl->num_gpios = gpiod_count(dev, NULL);
>> +	if (gbl->num_gpios == 0)
>> +		return dev_err_probe(dev, -EINVAL,
>> +			"The gpios parameter is missing or invalid\n");
>> +	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
>> +				   GFP_KERNEL);
>> +	if (!gbl->gpiods)
>> +		return -ENOMEM;
> 
> This is definitely easier if you simply use devm_get_array().
> 
> 
>> +
>> +	for (i = 0; i < gbl->num_gpios; i++) {
>> +		gbl->gpiods[i] =
>> +			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
>> +		if (IS_ERR(gbl->gpiods[i]))
>> +			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
>> +					"Failed to get GPIO at index %u\n", i);
>> +	}
>>
>>  	memset(&props, 0, sizeof(props));
>>  	props.type = BACKLIGHT_RAW;
>> @@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>  	}
>>
>>  	/* Set the initial power state */
>> -	if (!of_node || !of_node->phandle)
>> +	if (!of_node || !of_node->phandle) {
>>  		/* Not booted with device tree or no phandle link to the node */
>>  		bl->props.power = def_value ? BACKLIGHT_POWER_ON
>> -					    : BACKLIGHT_POWER_OFF;
>> -	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
>> -		bl->props.power = BACKLIGHT_POWER_OFF;
>> -	else
>> -		bl->props.power = BACKLIGHT_POWER_ON;
>> +						    : BACKLIGHT_POWER_OFF;
>> +	} else {
>> +		bool all_high = true;
>> +
>> +		for (i = 0; i < gbl->num_gpios; i++) {
>> +			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
> 
> Why is there a != here?
> 
> 
>> +				all_high = false;
>> +				break;
>> +			}
>> +		}
>> +
>> +		bl->props.power =
>> +			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
>> +	}
>>
>>  	bl->props.brightness = 1;
>>
>>  	init_brightness = backlight_get_brightness(bl);
>> -	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
>> -	if (ret) {
>> -		dev_err(dev, "failed to set initial brightness\n");
>> -		return ret;
>> +
>> +	for (i = 0; i < gbl->num_gpios; i++) {
>> +		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret,
>> +					"failed to set gpio %u direction\n",
>> +					i);
>>  	}
>>
>>  	platform_set_drvdata(pdev, bl);
> 
> 
> Daniel.

