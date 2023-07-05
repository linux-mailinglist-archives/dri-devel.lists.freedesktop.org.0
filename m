Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A77485A6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 16:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4F10E132;
	Wed,  5 Jul 2023 14:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6E010E132
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 14:07:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso7598736f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688566054; x=1691158054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AU4Y7nxn9moTeBBiKE7ZanFY0pefA4riCcCyZ8JBU98=;
 b=ZzTLNwtGWeCGnixiUkB+Fh04qBn9O7QW6d9xvz/3NlQEureQD3sqSlyuVuimTv+PSW
 /51cQhitClXf2IZyEcKowFYfQVRHNXsGpKUVodcsr0Z7ppSF2+wSZPwRRYCTcaGRQzfZ
 FhIxaBU3LKA6Os+rtZz6v0wFpYDZwfuGLhYRVPtFQPsWRUT3rGldokdVtTUrzkBxRlx3
 Hjl2Zm9HcwLpKZWtrIqqbLPmBrkp/hTHln1gx0Rj3y950ZXMW4F0XJaBToPWFWeFmxBP
 nrbROTnQv4jDLj9pyTqZfUgk6XkxGP8f7GZv8HXX04Y/UjJFdKGzIKx3Lz4X1OkFk3XI
 Yvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688566054; x=1691158054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AU4Y7nxn9moTeBBiKE7ZanFY0pefA4riCcCyZ8JBU98=;
 b=d8+1gmLjn7CAx7t4VO0HaqOscgtFWGWw2At89auaNKoWtd2KTNg/wXffdbXmj9l4Wa
 IDnDY6pGeEOItSO3lpSkOWEn9SzlYEYKXGm+j0WkMZCjHvPNOa38qj1bycAGSHoNZC5n
 j/8idKcYLNkYfK00knQ94SSvy6wmmq8Cu3xx45c79gmsLsQa/ro3I+FFvH8en5No8Rnt
 Cv6UsJiicu8NedLlzpju3N2LwjbK1rjq847+rOyjo/Vk+TX8A74WPrn2m5uUGP1WS1vv
 c150xzRpUlD/TpF6/ql7vVKXV/C28SQ9Oho5iL2QfGfyxLZJflSNiT+avMsPPliC+zei
 FqAw==
X-Gm-Message-State: ABy/qLYxeUAiUeYltUzI73vEi54CmciuPCTfUTuTy2YgS64fkID9FQue
 ofemYpRPIRlwU/fIMhSgr5etBg==
X-Google-Smtp-Source: APBJJlEnUvR0WUVjYcvCf+AnF9twxW7bci+6wQkHZaaSQhCGbaLChPiymZ+M6m58en6eNR6b0wqW3A==
X-Received: by 2002:a5d:4241:0:b0:314:824:3788 with SMTP id
 s1-20020a5d4241000000b0031408243788mr13057703wrr.27.1688566054110; 
 Wed, 05 Jul 2023 07:07:34 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d50cd000000b003143b7449ffsm6437811wrt.25.2023.07.05.07.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 07:07:33 -0700 (PDT)
Date: Wed, 5 Jul 2023 15:07:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
Message-ID: <20230705140731.GB6265@aspen.lan>
References: <20230704140750.25799-1-mans@mansr.com>
 <20230704150310.GA385243@aspen.lan>
 <20230704170731.GB940443@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704170731.GB940443@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Mans Rullgard <mans@mansr.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 07:07:31PM +0200, Sam Ravnborg wrote:
> Hi Daniel,
>
> > > @@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
> > >  	props.type = BACKLIGHT_RAW;
> > >  	props.max_brightness = priv->max_brightness;
> > >  	props.brightness = priv->default_brightness;
> > > -	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> > > -		      FB_BLANK_UNBLANK;
> > > +	props.power = (priv->default_brightness > 0) ? FB_BLANK_UNBLANK :
> > > +		      FB_BLANK_POWERDOWN;
> >
> > The logic was wrong before but I think will still be wrong after the
> > change too (e.g. the bogus logic is probably avoiding backlight flicker
> > in some use cases).
> >
> > The logic here needs to be similar to what pwm_bl.c implements in
> > pwm_backlight_initial_power_state(). Whilst it might be better
> > to implement this in led_bl_get_leds() let me show what I mean
> > in code that fits in the current line:
> >
> > 	/*
> > 	 * Activate the backlight if the LEDs are already lit *or*
> > 	 * there is no phandle link (meaning the backlight power
> > 	 * state cannot be synced with the display state).
> > 	 */
> > 	props.power = (active_at_boot || !dev->node->phandle) ?
> > 			FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> >
> The following code does the same using helpers:
>
> 	if (active_at_boot || !dev->node->phandle))
> 		backlight_enable(bd);
> 	else
> 		backlight_disable(bd);
>
> The code needs to execute after backlight_device_register() so maybe not
> so great an idea?!?

It would introduce a need for a bunch of new locks since userspace
could get in between device creation and the call to the helpers.

Additionally, it is even correct for a driver to forcefully set
fb_blank to powerdown during the probe? All current drivers set
fb_blank to unblank during the probe.


Daniel.
