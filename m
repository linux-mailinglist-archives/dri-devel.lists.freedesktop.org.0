Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52668CE14
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 05:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877010E1BD;
	Tue,  7 Feb 2023 04:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C75310E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 04:16:00 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so17328842pjd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 20:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2C5M2n2QmosP+JmwI3LMq0zuwLZPr4grwBdxmYTFAJk=;
 b=ERileFf4lERt72Vv1Me4JBfKOrl1bjyYp8lFAwfFdhg7Mp/wn33iTwDReqYSyTv9UB
 5eHk8gIUBaJK4PhdGk+7UePdArB703VNFZyfV1ZmqfCZZwDurRzGzl+jw+VPC2U02UV6
 m08s0ZYUN9pvVNg/Ex6ftB34Y9ouyUaDBzAytsE8XdKRurccLkvAing22zFNIjTsHMH4
 VS3yIJjxGMRULlKNUfOXMhbVCyEAIi84wAk0ZzTPZmJZEhIlbZV9VLvaD98m86R/84R1
 5jf6GH8BG5VcPZaor07NVx5TBYxJdNTi/hz4GQG9MH2OiCillrOxG3wX4ld3YPCr6XlD
 e3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2C5M2n2QmosP+JmwI3LMq0zuwLZPr4grwBdxmYTFAJk=;
 b=ivaagaw5Oxi3eHW/RYpjeloSh7sw2K5EIp5cCkdlPHXbtl8ZXmVrJlag6CAkZ1I5Vd
 Jre+6kuLCas8y68LFOrK+9DsNBvn45saBfsRmYmwYHYeGeIP6O4Dc0U2CqL7fsVn3RVE
 xLfEZF7hCXx5xkrcqo46ugpT+/H6i9e4rAxT/2E5ocnV4LCYz2lqEmCrQX7A+/c0Lttc
 GOOkVgc+jSQ0lBjztAH9EaPFM1eYw2yxpmyW4DpWXLKMIjoO5iJ2nveRYcp/ogqHjfO+
 OXnksCFBGLLymCQ79LlBTTAfaWCmzYC9kJRaWgYzqqQdS5n+YA+3j267akKCU2HoQhgS
 C1dA==
X-Gm-Message-State: AO0yUKUD0/EYG5LKJPcWorXvL8IWb9vIgrq510xCu3g1clBp/DDq0OOg
 /WYwEO9YNoilozV4BiB6qh7YoMXPhMQ=
X-Google-Smtp-Source: AK7set/fA+mhjJmmmjRqCn5WOKLa/XCg43FSX7iofX4GncywxkFyU/J+6RMjDO4H1P3Up/Fw8ofhaA==
X-Received: by 2002:a17:90a:e7cb:b0:230:a49b:2e64 with SMTP id
 kb11-20020a17090ae7cb00b00230a49b2e64mr2356976pjb.29.1675743359769; 
 Mon, 06 Feb 2023 20:15:59 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:c930:81ab:3aec:b9cb])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090ac40600b00229b17bb1e8sm7120181pjt.34.2023.02.06.20.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 20:15:59 -0800 (PST)
Date: Mon, 6 Feb 2023 20:15:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 1/2] backlight: hx8357: switch to using gpiod API
Message-ID: <Y+HQfDtiqUso7e9k@google.com>
References: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
 <Y+DmBGiq9kvRBHLY@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+DmBGiq9kvRBHLY@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 11:35:32AM +0000, Daniel Thompson wrote:
> On Tue, Jan 31, 2023 at 02:57:06PM -0800, Dmitry Torokhov wrote:
> > Switch the driver from legacy gpio API that is deprecated to the newer
> > gpiod API that respects line polarities described in ACPI/DT.
> >
> > This makes driver use standard property name for the reset gpio
> > ("reset-gpios" vs "gpios-reset"), however there is a quirk in gpiolib
> > to also recognize the legacy name and keep compatibility with older
> > DTSes.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > All preparation gpiolib work to handle legacy names and polarity quirks
> > has landed in mainline...
> >
> >  drivers/video/backlight/hx8357.c | 82 ++++++++++++++------------------
> >  1 file changed, 37 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> > index 9b50bc96e00f..a93e14adb846 100644
> > --- a/drivers/video/backlight/hx8357.c
> > +++ b/drivers/video/backlight/hx8357.c
> > [snip]
> > -	if (of_find_property(spi->dev.of_node, "im-gpios", NULL)) {
> > -		lcd->use_im_pins = 1;
> > -
> > -		for (i = 0; i < HX8357_NUM_IM_PINS; i++) {
> > -			lcd->im_pins[i] = of_get_named_gpio(spi->dev.of_node,
> > -							    "im-gpios", i);
> > -			if (lcd->im_pins[i] == -EPROBE_DEFER) {
> > -				dev_info(&spi->dev, "GPIO requested is not here yet, deferring the probe\n");
> > -				return -EPROBE_DEFER;
> > -			}
> > -			if (!gpio_is_valid(lcd->im_pins[i])) {
> > -				dev_err(&spi->dev, "Missing dt property: im-gpios\n");
> > -				return -EINVAL;
> > +	gpiod_set_consumer_name(lcd->reset, "hx8357-reset");
> > +
> > +	for (i = 0; i < HX8357_NUM_IM_PINS; i++) {
> > +		lcd->im_pins[i] = devm_gpiod_get_index(&spi->dev,
> > +						       "im", i, GPIOD_OUT_LOW);
> > +		ret = PTR_ERR_OR_ZERO(lcd->im_pins[i]);
> > +		if (ret) {
> > +			if (ret == -ENOENT) {
> > +				if (i == 0)
> > +					break;
> > +				dev_err(&spi->dev, "Missing im gpios[%d]\n", i);
> > +				ret = -EINVAL;
> > +			} if (ret == -EPROBE_DEFER) {

I see I miss "else" here...

> > +				dev_info(&spi->dev, "im gpio[%d] is not here yet, deferring the probe\n",
> > +					 i);
> > +			} else {
> > +				dev_err(&spi->dev, "failed to request im gpio[%d]: %d\n",
> > +					i, ret);
> >  			}
> 
> These last two clauses should be updated to return dev_err_probe(...)
> instead.
> 
> With that change:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

So you want to actually suppress the deferral message unless debug
printks are enabled? So you want this to read:


		if (ret) {
			if (ret == -ENOENT) {
				if (i == 0)
					break;

				dev_err(&spi->dev, "Missing im gpios[%d]\n", i);
				return -EINVAL;
			}

			return dev_err_probe(&spi->dev, ret,
					     "failed to request im gpio[%d]\n", i);
		}


Did I get it right?

Thanks.

-- 
Dmitry
