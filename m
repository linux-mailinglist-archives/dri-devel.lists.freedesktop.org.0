Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC827D0E5F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 13:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A631010E0A0;
	Fri, 20 Oct 2023 11:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57D810E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 11:27:31 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso11364181fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697801250; x=1698406050; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cMmNFqskfyUOXpQegXuQzmiikeYo6k8K/89VdvccPyY=;
 b=QpOPxEBrXnyZA34wNreyblJakuhda6exiDuusJeSOau1GXw2zGLqXX17Roy7m+IlTG
 BHQ16bU2vVmd1Gy/fa1CFsIFkRdsDaEoLNON1zEajEw3ADXBuxt4bKIyUqhrdzPQDk4n
 FC5QGyr4lWAD6WawdWL+m7thcVU1vP9+/ye6p7jdi9iQl/CXdWe93Kxanbcos8FV3QWZ
 vvdeV/W4pAaOZH1fvm3RfH9wLA5E6y0V4L2N533NlL4xpVz376+VXgV1sJm/C3ntk/bG
 MuTNelOcxBeW5worCYPYcn2Ft0jPeexwtDR5lDPcexiVfu8dnadzFUGbC9rcDsfgS+1O
 rfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697801250; x=1698406050;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cMmNFqskfyUOXpQegXuQzmiikeYo6k8K/89VdvccPyY=;
 b=hJO2nqwkEX7Cdb/ss6j250l8B/h8SiFY+eXsivz30l+Mkzhz0Lealut0buKpqO4Y2C
 76TmTCCT4h6F9xgzPxsxjx9eHMqyhMb42JItuvmA03JUYP7uU06le+phvliebeSqWGMo
 0hAFp6WrFCq4PTmOABguxAhHNyibaUhJzY2IQ17aMsKSXID6Z3bZjUmgaROe7huikx9Z
 o/c6qWvJh+T3FBPiqWJq/KYFAdrVw397Uqw1cubGRz+XsIqTqzb2XaQNaSX1QUbKtYd3
 hL66X79zODixtnnwuGuj6FH6uW1mUNM5/3P7wjYczoyN9cqsuC0dtKmH3f/ccNny9i58
 riTg==
X-Gm-Message-State: AOJu0YyffYJ+OtcXL8ta3vSaVAPSMkDtoQtSJKP62FXY3DeyxrYG19Rh
 VzGBAqme4GKPa9bOBGPotupDFA==
X-Google-Smtp-Source: AGHT+IF6PQTaN2LIwk2vIQs8dGQckxx0OgLpZjue64p2nFkQLUkLGAUYJizVCo1QpyNFwO8uojzoSw==
X-Received: by 2002:a2e:a99b:0:b0:2b9:3684:165 with SMTP id
 x27-20020a2ea99b000000b002b936840165mr1279776ljq.8.1697801250111; 
 Fri, 20 Oct 2023 04:27:30 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003fc16ee2864sm1912171wmb.48.2023.10.20.04.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 04:27:29 -0700 (PDT)
Date: Fri, 20 Oct 2023 12:27:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker applying
 initial PWM state
Message-ID: <20231020112727.GF23755@aspen.lan>
References: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
 <20231018210741.6t3yfj6qgmpwhhlo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018210741.6t3yfj6qgmpwhhlo@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 11:07:41PM +0200, Uwe Kleine-König wrote:
> Hello Philipp,
>
> On Thu, Jun 08, 2023 at 04:11:14PM +0200, Philipp Zabel wrote:
> > The initial PWM state returned by pwm_init_state() has a duty cycle
> > of 0 ns.
>
> This is only true for drivers without a .get_state() callback, isn't it?

pwm_init_state() explicitly zeros the duty-cycle in order to avoid
problems when the default args have a different period to the currently
applied config:
https://elixir.bootlin.com/linux/latest/source/include/linux/pwm.h#L174


Daniel.


> > To avoid backlight flicker when taking over an enabled
> > display from the bootloader, skip the initial pwm_apply_state()
> > and leave the PWM be until backlight_update_state() will apply the
> > state with the desired brightness.
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > With a PWM driver that allows to inherit PWM state from the bootloader,
> > postponing the initial pwm_apply_state() with 0 ns duty cycle allows to
> > set the desired duty cycle before the PWM is set, avoiding a short flicker
> > if the backlight was previously enabled and will be enabled again.
> > ---
> >  drivers/video/backlight/pwm_bl.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index fce412234d10..47a917038f58 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -531,12 +531,10 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >  	if (!state.period && (data->pwm_period_ns > 0))
> >  		state.period = data->pwm_period_ns;
> >
> > -	ret = pwm_apply_state(pb->pwm, &state);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
> > -			ret);
> > -		goto err_alloc;
> > -	}
> > +	/*
> > +	 * No need to apply initial state, except in the error path.
>
> Why do you want to modify the PWM in the error path? I would have
> expected not touching it at all in .probe() is fine?!
>
> > +	 * State will be applied by backlight_update_status() on success.
> > +	 */
> >
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> >
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
