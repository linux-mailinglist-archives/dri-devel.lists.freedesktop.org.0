Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB003D1459
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D18B6EC0A;
	Wed, 21 Jul 2021 16:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206166EC0A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 16:43:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l7so2879284wrv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nQO0vUaJebZ8yUobOfxAEXw8DG1tZACsGQaT/ABF1rM=;
 b=J47DZctwJ55jmuyGRXHGf0iufMlj020N1WTJhljXm1xsI++nmhnoNgjk/XJihg0tYI
 i0MsUJlDO7DieTeby8k95UhREvTXaXkxU6AHm0+4IYCEH7MssUAWNc3KUN4LPEYbFTmf
 nPR0vhDHfDHS5fzIwbDkIqqQ/rdzJ5v+NFBwUPS/8Ep2sKjjB1yxrwrBXv3NUW2Sj+OS
 pm4PBxZv+z331f7OdJ5wjxlSrAVXIqCAdc/ExYBh6LeUxcJYVnt0eYn8oHNlFasvc6AP
 c+KzpgPcFC1GNMWrYL5qzbGtXw4DkpLV1vXcSyr2XI5U0gFB4ftuL8zC7Q8LBS9yqEhT
 4QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQO0vUaJebZ8yUobOfxAEXw8DG1tZACsGQaT/ABF1rM=;
 b=LxKwC7p3pVw2Z0xU7vAvwV+rmOwmPaEr4qNi7rTCpetUV8n48wc+9t+Ud/FuA8n1H+
 zFbHgIWKY4u4szCsYEZ0BMqzR8J8aRre3xZrMmln/1E9UbzyF9WeRnma+1tt9i+Mbn1L
 1x3aj1X7tIFq6p365Uim00B+hzbR7u665b0ozTMFCWDFkjUMe1kS0c+Oabou6ehqAaLa
 rolgkXoPN1MPcGWkB+YExpeAq2MWOHAFFVHOPlTvsI6yhzRVlm+kmzndaVOJ4IorHz1q
 aFB7DSD7rPocyuLVzBAJG96wSuJiJO+4Ho/KPLUlmts3eW7JdMK0Ma4yUzkXkWVyMwVl
 H9+A==
X-Gm-Message-State: AOAM532bxNk19mCHg1xES9haydQJvattUIhUaWt0/VYlwborsV+nngg/
 Dg4oxyC9cHzXR3WO3VCbS+d5sw==
X-Google-Smtp-Source: ABdhPJwRK7tf/HXiZC/QWXzBpX9EOm/2GFlAF4mJriq8sWZ7kI/u9d+AVN8PggUMpsc3+UygJ5kzSQ==
X-Received: by 2002:adf:e488:: with SMTP id i8mr44097592wrm.285.1626885801663; 
 Wed, 21 Jul 2021 09:43:21 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id j16sm27353747wrw.62.2021.07.21.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 09:43:20 -0700 (PDT)
Date: Wed, 21 Jul 2021 17:43:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210721164319.uaf4qyr62dnktadv@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
> On 7/21/21 12:49 PM, Daniel Thompson wrote:
> > > > However, on the basis of making things less fragile, I think the
> > > > underlying problem here is the assumption that it is safe to modify
> > > > enable_gpio before the driver has imposed state upon the PWM (this
> > > > assumption has always been made and, in addition to systems where the BL
> > > > has a phandle will also risks flicker problems on systems where
> > > > power_pwm_on_delay is not zero).
> > > 
> > > It is safe to modify the GPIO into defined state, but that defined state is
> > > not always out/enabled, that defined state depends on the hardware.
> > 
> > It is only safe to do this once we know what the initial value should be
> > and I'm not sure that value can comes exclusively from reading the pin.
> 
> I agree, it is far from perfect, but so is the current code.

Agreed. Current handling of enable pin isn't right.


> However, see below regarding the floating backlight enable pin.
> 
> > > > This patch does not change the assumption that we can configure the
> > > > GPIO before we modify the PWM state. This means it won't fix the problem
> > > > for cases there the pin is HiZ by default but whose GPIOD_ASIS state is
> > > > neither input nor output.
> > > 
> > > That is correct, for pin that is floating, we lost. But then I would argue
> > > that if your backlight-enable GPIO is floating, the hardware is buggy, I
> > > would expect some pull resistor to keep the backlight off on power on on
> > > that GPIO.
> > 
> > I didn't say that the pin was floating. I said that the pin was in a HiZ
> > state meaning it could still be subject to pull up/down.
> > 
> > However there are cases, such as when the regulator is off, where I
> > think it is entirely legitimate for the enable pin to be floating. The
> > current driver does the wrong thing here if the pin is set as input
> > since if the regulator is off the initial enable_gpio value should be 0.
> 
> Oh, right, that's a valid point.
> 
> So if the pin is input, we can basically toss a coin.

I don't think it is quite as bad as that: if the PWM and regulator
are enabled then it is not okay for this pin to be floating.


> > [...]
> > I think a reasonably elegant approach can be reached by making
> > pwm_backlight_initial_power_state() responsible for ensuring enable_gpio
> > matches the observed hardware state (taking into account both the pin
> > state and the regulator). I think this will fix both your flicker
> > concerns whilst permitting the legitimate cases for a floating pin.
> > 
> > Something like:
> 
> I think we are getting closer, but there is extra problem to this.
> 
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index e48fded3e414..8d8959a70e44 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -409,6 +409,33 @@ static bool pwm_backlight_is_linear(struct platform_pwm_backlight_data *data)
> >   static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
> >   {
> >   	struct device_node *node = pb->dev->of_node;
> > +	bool active = true;
> > +
> > +	/*
> > +	 * If the enable GPIO is present, observable (either as input
> > +	 * or output) and off then the backlight is not currently active.
> > +	 * */
> > +	if (pb->enable_gpio && gpiod_get_value_cansleep(pb->enable_gpio) == 0)
> > +		active = false;
> 
> This will fail on iMX GPIO controller, where if the GPIO is output, you can
> read its state, but by default that state is what you wrote into the GPIO
> output value register, not what is the actual value on the pin (i.e.
> consider you have a strong pull resistor that overpowers the driver).
> 
> To have a GPIO which is output and sample the actual pin value, you have to
> tweak the pinmux and enable the SION bit, then you get the actual value. But
> that is specific to the iMX GPIO controller/pinmux.

You're describing a situation where we own a GPIO output pin and the
value we believe we are driving into the pin is not being achieved due
to some additional factor. Do we need to care about that? It sounds like
the backlight driver won't work properly in this case since whatever
value we set the enable_gpio then it will stay at the same value.


> > [...]
> > @@ -486,18 +500,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >   		goto err_alloc;
> >   	}
> > -	/*
> > -	 * If the GPIO is not known to be already configured as output, that
> > -	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
> > -	 * direction to output and set the GPIO as active.
> > -	 * Do not force the GPIO to active when it was already output as it
> > -	 * could cause backlight flickering or we would enable the backlight too
> > -	 * early. Leave the decision of the initial backlight state for later.
> > -	 */
> > -	if (pb->enable_gpio &&
> > -	    gpiod_get_direction(pb->enable_gpio) != 0)
> > -		gpiod_direction_output(pb->enable_gpio, 1);
> 
> pwm_backlight_initial_power_state() is still called after pwm_apply_state()
> in pwm_backlight_probe(), so that might still be too late, no ?

The initial pwm_apply_state() is essentially a nop or, perhaps, a sanity
check if you prefer to think if it that way.

It can change the PWM period in some (non-DT) cases but only if the PWM
is not already running... and the change of period should not start it
running.


Daniel.
