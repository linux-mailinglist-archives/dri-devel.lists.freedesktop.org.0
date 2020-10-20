Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91C2948B7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523C86E973;
	Wed, 21 Oct 2020 07:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A16ECDC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 14:01:31 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id j7so2209755oie.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eV8Qm7gEOxRXitBzZlCD866ixtrTlZl+PdLiNQm+4Rs=;
 b=KIOkMaR+xgikLjNfFY6MoCOuGLLfV5odzjo6goJ8rKsRKC7ER4ZEWzrZq1+QALyz92
 OLZjAOuB9yy9mDzUU6PTpIVHfOUc0NOl+P7JBOOJnpqG8i3ZxUEkBKMwByHIhD0TbG7G
 6PwXpV4ynfFTKDaOukPCrazXF0DjW2CeKGCOyn+LEB4jjuwp4x0WRs83lIRvTEgO6GC0
 kcNpf/LgBxbf6BgQB5ELNEGNOGu8JcN0ScKFoQnl2nOnxzsIoDFB97f5gLQWTlQdHyoL
 2nPIlwMXJiWBpi7njvJQIlprd6l9jZ9mBKBk91Ljc1NW6lBj2PcHU2HngOgI3M/oJVSa
 o42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eV8Qm7gEOxRXitBzZlCD866ixtrTlZl+PdLiNQm+4Rs=;
 b=tvb3BuDtP5JVKXXnIkpq2BPqgZ8LjKpFAFtSEFhZ1qvw5UtbtbGp4tWUWYsbwxTWDz
 Gr+npVtQJuQq1NYrKbtQGlki4XKKdVBTB3tJ+vbE16oKcW2VZF5w2QWaOVllobqDEEcy
 1Bf3CfohX9TRafs1UvCHIlWM8hSqzkLcj+3i2Y6DUcxscU+88N7IXLzQR8s1bGFNuWV+
 baU5aft3ai72s1qqFV5p4f1Zit1p1JH2E8wcGRPu0hkyRmxheNYfS3SV4CMYx+Jstmbg
 s42HxyjCtXcDtXLFrsXgdt61UYhze/HYHMnvUC2sB9GIKgvaThOOCNYbSOjTnnP0Mpv0
 coaA==
X-Gm-Message-State: AOAM532cdmEPI1/TEprVCXqFmwEjzyc5BOv/y/vHTjfxHUgrX1Z9lmV3
 pd/LfaokHha+r2t2j9lPMlQ=
X-Google-Smtp-Source: ABdhPJz96OxyT8iyC0IE4Iv4A+26UjobchLzlieGvOBLB0JJpiOumMEENEaX6qE7xLpkRxGIN6mGSg==
X-Received: by 2002:aca:cd0a:: with SMTP id d10mr2037540oig.52.1603202489420; 
 Tue, 20 Oct 2020 07:01:29 -0700 (PDT)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id y5sm473639ool.30.2020.10.20.07.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 07:01:28 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] drm/bridge: sii902x: Enable I/O and core VCC
 supplies if present
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <20200928173056.1674274-1-mr.nuke.me@gmail.com>
 <d74c7626-8f16-db85-c23f-79bf0cc400d0@gmail.com>
 <20201020071628.GA1737816@ravnborg.org>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <5c21a4a4-717c-9f8a-9764-6e3fb9554e46@gmail.com>
Date: Tue, 20 Oct 2020 09:01:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201020071628.GA1737816@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/20/20 2:16 AM, Sam Ravnborg wrote:
> Hi Alex.

[snip]

>>
>>
>>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>>> index 33fd33f953ec..d15e9f2c0d8a 100644
>>> --- a/drivers/gpu/drm/bridge/sii902x.c
>>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>>> @@ -17,6 +17,7 @@
>>>    #include <linux/i2c.h>
>>>    #include <linux/module.h>
>>>    #include <linux/regmap.h>
>>> +#include <linux/regulator/consumer.h>
>>>    #include <linux/clk.h>
>>>    #include <drm/drm_atomic_helper.h>
>>> @@ -168,6 +169,8 @@ struct sii902x {
>>>    	struct drm_connector connector;
>>>    	struct gpio_desc *reset_gpio;
>>>    	struct i2c_mux_core *i2cmux;
>>> +	struct regulator *iovcc;
>>> +	struct regulator *cvcc12;
>>>    	/*
>>>    	 * Mutex protects audio and video functions from interfering
>>>    	 * each other, by keeping their i2c command sequences atomic.
>>> @@ -954,13 +957,13 @@ static const struct drm_bridge_timings default_sii902x_timings = {
>>>    		 | DRM_BUS_FLAG_DE_HIGH,
>>>    };
>>> +static int sii902x_init(struct sii902x *sii902x);
> Please re-arrange the code so this prototype is not needed.

I'd be happy to re-arrange things. It will make the diff look a lot 
bigger than what it is. Is that okay?

Alex

>>> +
>>>    static int sii902x_probe(struct i2c_client *client,
>>>    			 const struct i2c_device_id *id)
>>>    {
>>>    	struct device *dev = &client->dev;
>>> -	unsigned int status = 0;
>>>    	struct sii902x *sii902x;
>>> -	u8 chipid[4];
>>>    	int ret;
>>>    	ret = i2c_check_functionality(client->adapter,
>>> @@ -989,6 +992,43 @@ static int sii902x_probe(struct i2c_client *client,
>>>    	mutex_init(&sii902x->mutex);
>>> +	sii902x->iovcc = devm_regulator_get(dev, "iovcc");
>>> +	if (IS_ERR(sii902x->iovcc))
>>> +		return PTR_ERR(sii902x->iovcc);
>>> +
>>> +	sii902x->cvcc12 = devm_regulator_get(dev, "cvcc12");
>>> +	if (IS_ERR(sii902x->cvcc12))
>>> +		return PTR_ERR(sii902x->cvcc12);
>>> +
>>> +	ret = regulator_enable(sii902x->iovcc);
>>> +	if (ret < 0) {
>>> +		dev_err_probe(dev, ret, "Failed to enable iovcc supply");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = regulator_enable(sii902x->cvcc12);
>>> +	if (ret < 0) {
>>> +		dev_err_probe(dev, ret, "Failed to enable cvcc12 supply");
>>> +		regulator_disable(sii902x->iovcc);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = sii902x_init(sii902x);
>>> +	if (ret < 0) {
>>> +		regulator_disable(sii902x->cvcc12);
>>> +		regulator_disable(sii902x->iovcc);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int sii902x_init(struct sii902x *sii902x)
>>> +{
>>> +	struct device *dev = &sii902x->i2c->dev;
>>> +	unsigned int status = 0;
>>> +	u8 chipid[4];
>>> +	int ret;
>>> +
>>>    	sii902x_reset(sii902x);
>>>    	ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
>>> @@ -1012,11 +1052,11 @@ static int sii902x_probe(struct i2c_client *client,
>>>    	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
>>>    	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
>>> -	if (client->irq > 0) {
>>> +	if (sii902x->i2c->irq > 0) {
>>>    		regmap_write(sii902x->regmap, SII902X_INT_ENABLE,
>>>    			     SII902X_HOTPLUG_EVENT);
>>> -		ret = devm_request_threaded_irq(dev, client->irq, NULL,
>>> +		ret = devm_request_threaded_irq(dev, sii902x->i2c->irq, NULL,
>>>    						sii902x_interrupt,
>>>    						IRQF_ONESHOT, dev_name(dev),
>>>    						sii902x);
>>> @@ -1031,9 +1071,9 @@ static int sii902x_probe(struct i2c_client *client,
>>>    	sii902x_audio_codec_init(sii902x, dev);
>>> -	i2c_set_clientdata(client, sii902x);
>>> +	i2c_set_clientdata(sii902x->i2c, sii902x);
>>> -	sii902x->i2cmux = i2c_mux_alloc(client->adapter, dev,
>>> +	sii902x->i2cmux = i2c_mux_alloc(sii902x->i2c->adapter, dev,
>>>    					1, 0, I2C_MUX_GATE,
>>>    					sii902x_i2c_bypass_select,
>>>    					sii902x_i2c_bypass_deselect);
>>> @@ -1051,6 +1091,8 @@ static int sii902x_remove(struct i2c_client *client)
>>>    	i2c_mux_del_adapters(sii902x->i2cmux);
>>>    	drm_bridge_remove(&sii902x->bridge);
>>> +	regulator_disable(sii902x->cvcc12);
>>> +	regulator_disable(sii902x->iovcc);
>>>    	return 0;
>>>    }
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
