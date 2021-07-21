Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C25E3D11FC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DC36E86E;
	Wed, 21 Jul 2021 15:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D066E86E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:10:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CA75482039;
 Wed, 21 Jul 2021 17:09:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626880198;
 bh=gVzLSMlvEpKxP0K+zmlqHuSXNrL3MNmtqjvyCCiDHlw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jlu6Jp6RSvY15NsbCEgcw1Sqv9NCBvIkQWa0RPYnWm4H2D+AkSq4xLa6/Hmnzzyoe
 XPo1+vq1QHRtxV/9orrBdn/sCyTWDCWBXfpxzMRFOIaGb6LPin6nLnn5SBRQWXcezo
 J2tTbjBGPNjM86SImL5ub6SqqWtWaF+wqqXufQYqOAAnsc/c2pcOLHUQ0CwMoN9Oj5
 dYleMgMMTXs4XG67jlP1Q30e+rP/IIXCRUrFS+qtLfKdhk0BAU0NEQhUvEFq9mMdGA
 WVdjLbtKY0Zv2HfYgM7GvK7C1Xb/9cT2kIbgrI/WnXrKNSN1ZovIxU6tMHzgacW3uM
 GFltE7UfzKsAw==
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
From: Marek Vasut <marex@denx.de>
Message-ID: <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
Date: Wed, 21 Jul 2021 17:09:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721104914.4difos6w3ysjelnv@maple.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 7/21/21 12:49 PM, Daniel Thompson wrote:
[...]

>>>> NOTE: I think this whole auto-detection scheme should just be replaced by a
>>>>         DT prop, because it is very fragile.
>>>
>>> I have some sympathy for this view... although I think the boat has
>>> already set sail.
>>
>> I'm not sure that's correct, we can simply say that any new uses of the
>> pwm-backlight should specify the initial GPIO configuration, and for the
>> legacy ones, use whatever is in the code now.
> 
> I'm not 100% against the idea... however if we still have to get the
> code to read state from the hardware right for legacy cases that means
> we have to do the same work but with fewer people testing it.

We can do something like this:

if (of_property_read_bool(np, "enable-active-high"))
   gpiod_direction_output(pb->enable_gpio, 1);
else if (of_property_read_bool(np, "enable-active-low"))
   gpiod_direction_output(pb->enable_gpio, 0);
else {
   WARN_ON_ONCE("Fix your DT"); // or some such notification
   ... legacy code path ...
}

Note that I picked the same DT prop names as drivers/gpio/gpiolib-of.c 
of_gpio_flags_quirks() uses, because we are headed into similar mess 
here I'm afraid.

>>> However, on the basis of making things less fragile, I think the
>>> underlying problem here is the assumption that it is safe to modify
>>> enable_gpio before the driver has imposed state upon the PWM (this
>>> assumption has always been made and, in addition to systems where the BL
>>> has a phandle will also risks flicker problems on systems where
>>> power_pwm_on_delay is not zero).
>>
>> It is safe to modify the GPIO into defined state, but that defined state is
>> not always out/enabled, that defined state depends on the hardware.
> 
> It is only safe to do this once we know what the initial value should be
> and I'm not sure that value can comes exclusively from reading the pin.

I agree, it is far from perfect, but so is the current code.

However, see below regarding the floating backlight enable pin.

>>> This patch does not change the assumption that we can configure the
>>> GPIO before we modify the PWM state. This means it won't fix the problem
>>> for cases there the pin is HiZ by default but whose GPIOD_ASIS state is
>>> neither input nor output.
>>
>> That is correct, for pin that is floating, we lost. But then I would argue
>> that if your backlight-enable GPIO is floating, the hardware is buggy, I
>> would expect some pull resistor to keep the backlight off on power on on
>> that GPIO.
> 
> I didn't say that the pin was floating. I said that the pin was in a HiZ
> state meaning it could still be subject to pull up/down.
> 
> However there are cases, such as when the regulator is off, where I
> think it is entirely legitimate for the enable pin to be floating. The
> current driver does the wrong thing here if the pin is set as input
> since if the regulator is off the initial enable_gpio value should be 0.

Oh, right, that's a valid point.

So if the pin is input, we can basically toss a coin.

>>> I wonder if it might be better to move the code to configure the
>>> direction of enable_gpio out of the probe function and into
>>> pwm_backlight_power_on():
>>
>> No, I tried that already.
>>
>> The first thing that is called on boot is pwm_backlight_power_off() to set
>> the backlight to 0 (and thus set pwm to 0), but since pb->enabled is false,
>> that is where the function exits with configuring PWM and without
>> configuring the GPIO state.
>>
>> I also experimented with some "first time only" flag in those functions, but
>> that looked ugly and complicated the runtime code.
> 
> I followed that idea and came to a similar conclusion w.r.t. to the
> first time flag.
> 
> I think a reasonably elegant approach can be reached by making
> pwm_backlight_initial_power_state() responsible for ensuring enable_gpio
> matches the observed hardware state (taking into account both the pin
> state and the regulator). I think this will fix both your flicker
> concerns whilst permitting the legitimate cases for a floating pin.
> 
> Something like:

I think we are getting closer, but there is extra problem to this.

> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index e48fded3e414..8d8959a70e44 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -409,6 +409,33 @@ static bool pwm_backlight_is_linear(struct platform_pwm_backlight_data *data)
>   static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
>   {
>   	struct device_node *node = pb->dev->of_node;
> +	bool active = true;
> +
> +	/*
> +	 * If the enable GPIO is present, observable (either as input
> +	 * or output) and off then the backlight is not currently active.
> +	 * */
> +	if (pb->enable_gpio && gpiod_get_value_cansleep(pb->enable_gpio) == 0)
> +		active = false;

This will fail on iMX GPIO controller, where if the GPIO is output, you 
can read its state, but by default that state is what you wrote into the 
GPIO output value register, not what is the actual value on the pin 
(i.e. consider you have a strong pull resistor that overpowers the driver).

To have a GPIO which is output and sample the actual pin value, you have 
to tweak the pinmux and enable the SION bit, then you get the actual 
value. But that is specific to the iMX GPIO controller/pinmux.

So I suspect you might still want to check the direction here.

> +	if (!regulator_is_enabled(pb->power_supply))
> +		active = false;
> +
> +	if (!pwm_is_enabled(pb->pwm))
> +		active = false;
> +
> +	/*
> +	 * Synchronize the enable_gpio with the observed state of the
> +	 * hardware.
> +	 */
> +	if (pb->enable_gpio)
> +		gpiod_direction_output(pb->enable_gpio, active);
> +
> +	/*
> +	 * Do not change pb->enabled here! pb->enabled essentially
> +	 * tells us if we own one of the regulator's use counts and
> +	 * right now we do not.
> +	 */
>   
>   	/* Not booted with device tree or no phandle link to the node */
>   	if (!node || !node->phandle)
> @@ -420,20 +447,7 @@ static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
>   	 * assume that another driver will enable the backlight at the
>   	 * appropriate time. Therefore, if it is disabled, keep it so.
>   	 */
> -
> -	/* if the enable GPIO is disabled, do not enable the backlight */
> -	if (pb->enable_gpio && gpiod_get_value_cansleep(pb->enable_gpio) == 0)
> -		return FB_BLANK_POWERDOWN;
> -
> -	/* The regulator is disabled, do not enable the backlight */
> -	if (!regulator_is_enabled(pb->power_supply))
> -		return FB_BLANK_POWERDOWN;
> -
> -	/* The PWM is disabled, keep it like this */
> -	if (!pwm_is_enabled(pb->pwm))
> -		return FB_BLANK_POWERDOWN;
> -
> -	return FB_BLANK_UNBLANK;
> +	return active ? FB_BLANK_UNBLANK: FB_BLANK_POWERDOWN;
>   }
>   
>   static int pwm_backlight_probe(struct platform_device *pdev)
> @@ -486,18 +500,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>   		goto err_alloc;
>   	}
>   
> -	/*
> -	 * If the GPIO is not known to be already configured as output, that
> -	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
> -	 * direction to output and set the GPIO as active.
> -	 * Do not force the GPIO to active when it was already output as it
> -	 * could cause backlight flickering or we would enable the backlight too
> -	 * early. Leave the decision of the initial backlight state for later.
> -	 */
> -	if (pb->enable_gpio &&
> -	    gpiod_get_direction(pb->enable_gpio) != 0)
> -		gpiod_direction_output(pb->enable_gpio, 1);

pwm_backlight_initial_power_state() is still called after 
pwm_apply_state() in pwm_backlight_probe(), so that might still be too 
late, no ?
