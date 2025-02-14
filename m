Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF8EA365A0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 19:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B2410ED31;
	Fri, 14 Feb 2025 18:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H8/m7CZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE7110E4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 18:20:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43948021a45so24632835e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739557243; x=1740162043;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=;
 b=H8/m7CZgFvwbWDF9Tjfc4KnTjFb5Ekn2HSUjSb3BNQYXk1MoOSMqvDqfhPrg1DRMVK
 s2R186JpqDb/LsLFe1mBOzPHqJkQD1vGV8fK6QhfdWb71QpK7cRHc3JORGsMYHNBUPpR
 j3VcAxZZ3w1kX06xl9lyd++FL+g42h/Zy80i+GIEVTGce0mrz3+bep47/H6xmKJV0mm6
 6sn8SPI2+gw6Vc2KBMmYgPsX0VVtTNvR6zvAnX4nYAdD49Dke0nFX/9cZ2FO+Uv9O3sj
 2ADXhS+tw7jkctKzxYxZtwP09b5xcDPPNDFk38kmTseD1O+IPjkQxHWPN8a3c/W+dr3q
 f9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739557243; x=1740162043;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=;
 b=PGwXkG158mg7E/M21sYUBIfXKztFB9wLipPc/8BCilrbRqtHYxPMWXMddqny0XxmCe
 bWmzw9uMl69+0dIhOlVjTqFTzD978QgHsS219ArD/5LjM31sw8x7FyCoyJ3cFwoe4E7b
 vuWOrQyCKLKqIWF5yaEUEUpWHJk1fCSGnVZfCjyk0RH4PP3lnJ9Ap8QCqgj3UH1pBFOC
 2ymLVJyYmO8SWjUXl6zTfbdXlcfPlBCM/85gBnCAD45Lxr+2eoQnSSySNgjKAt1Fyf0b
 M8MzbgQjzwFGDYrHrgk7+5YJXXOffZHSl5PG5nNc2WIA36e/beAR+nuLUDDThjWzzp3b
 J7PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOcPScu0wXtTxiqVzZBEI+IZGwFh4j7qxYCw0dTn54Eqi/r9CUjryVfy13wHQZsSSkQbiIhJss8BU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynmiJLA9QdhxdtkE4fGSkebsjvY/U9ocY38C8oQaCaHq1ktdow
 lnnAnOJYgQ+1hZKB9m68TK/giAMnwFUUpR62hn5iRVuzxno0kpLfK3cEbQSDVO4=
X-Gm-Gg: ASbGnct2qj2u8OzLqHlbRslaDm8R83VCFGQ/PLICGE/RAEzazWHsfGn3kDrQs7BBHMP
 niub20wp33+WJX49/szhPpyh18NlXm40rMQByNUdH/ADdrntUNNw3MsBIEzHLkQtO/WIsXqNMA6
 TIfVGF8qGv13jWa6LIUUvQRkg+NdvSzFXvUafTX5/jOtbcXwbGctpZQTRzHgz/05fTR5FUu9bj7
 OGIAcGofDyQDlneUnNQAiAy30z87kfZDgzwiUaUSZkCSD4sauUYUdEi5YeAJtI49VJx50QzihM5
 8i4dDf4IIZdp4A==
X-Google-Smtp-Source: AGHT+IHsTHTiL3wJj3nrHf3yF9cKckC3Rmpa9H0r1If+8TaecjIo4Dqny2vOXtw6IlfG2e9gn40oVw==
X-Received: by 2002:a05:6000:1542:b0:38d:d4b5:84d5 with SMTP id
 ffacd0b85a97d-38f33f14a9dmr31093f8f.8.1739557243484; 
 Fri, 14 Feb 2025 10:20:43 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:7018:8c7:bdd4:3436])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43961884e88sm49912865e9.26.2025.02.14.10.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 10:20:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
 Danilo Krummrich <dakr@kernel.org>,  Conor Dooley
 <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de Goede
 <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-kernel@vger.kernel.org>,  <linux-riscv@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
 <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
In-Reply-To: <67af6c284c349_1614f3294dd@iweiny-mobl.notmuch> (Ira Weiny's
 message of "Fri, 14 Feb 2025 10:15:36 -0600")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
 <67af6c284c349_1614f3294dd@iweiny-mobl.notmuch>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 19:20:40 +0100
Message-ID: <1jr040xu9z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 14 Feb 2025 at 10:15, Ira Weiny <ira.weiny@intel.com> wrote:

> Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>> 
>> Use it and remove some boilerplate code.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
>>  1 file changed, 6 insertions(+), 50 deletions(-)
>> 
>> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
>> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
>> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> @@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
>>  	struct clk_hw_onecell_data clk_data;
>>  };
>>  
>> -#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>
> I see the Kconfig ...
>
>         select AUXILIARY_BUS if RESET_CONTROLLER
>
> But I don't see how this code is omitted without AUXILIARY_BUS.  Is this
> kconfig check safe to remove?

Ahhh that's what this directive was for.

I thought it was really odd to have an #if on RESET while auxialiary
device was supposed to properly decouple the clock and reset part.

To keep things as they were I'll add an #if on CONFIG_AUXILIARY_BUS I
wonder if this driver should select CONFIG_AUXILIARY_BUS instead ?

>
> Ira
>
>> -
>> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
>> -{
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>> -	struct auxiliary_device *adev __free(kfree) = NULL;
>> -	int ret;
>> +	struct auxiliary_device *adev;
>>  
>>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>>  		return 0;
>>  
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> -	if (!adev)
>> -		return -ENOMEM;
>> -
>> -	adev->name = "reset";
>> -	adev->dev.parent = dev;
>> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
>> -					no_free_ptr(adev));
>> -}
>> -
>> -#else /* !CONFIG_RESET_CONTROLLER */
>> +	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
>> +	if (IS_ERR_OR_NULL(adev))
>> +		return PTR_ERR(adev);
>>  
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>>  	return 0;
>>  }
>>  
>> -#endif /* !CONFIG_RESET_CONTROLLER */
>> -
>>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>>  {
>>  	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
>> @@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_clk_register;
>>  
>> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
>> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>>  	if (ret)
>>  		goto err_clk_register;
>>  
>> 
>> -- 
>> 2.45.2
>> 

-- 
Jerome
