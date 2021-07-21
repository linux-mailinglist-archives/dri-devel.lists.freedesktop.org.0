Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4303D16C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 21:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265946E8C7;
	Wed, 21 Jul 2021 19:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08F66E8C7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:01:03 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A254F81BC0;
 Wed, 21 Jul 2021 21:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626894062;
 bh=71iB0AP2uo1+ZtiFwmKYH+Vix8g5YJOtJvdq/JuL5MQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Xy+/9BvihvtCwsNFLZCmESCUcSZ9CMti3/uRjV+zkHFKuf2vzn/Z9Gwc7DUhbvzAx
 QVomUKH4ZgoRI0Qxl2ZpEkprgRqtp6jWFynGvtXlxQK7Fh00qYeB3Ks8+G/LtVgn4s
 cXatY+GRFnSRL3lQcCBsqkg781jYWAbf6apoi+5h1kRJjPv6xW7tAa7uFji5K4B2RB
 0jKXEXUXuqzgsqb5N5y5LA50lAh3+KIHgKLRaFAcchWzVU7C8afM8M3JmFx+aYH1JF
 URAB85cm2TWf74Z1jKQ7VW9GD5K6MT3mHkE/6s6+d1/rYljW7oCkMPsD0SbMipMdkM
 9QYfRl9l2F2DA==
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721164319.uaf4qyr62dnktadv@maple.lan>
From: Marek Vasut <marex@denx.de>
Message-ID: <f8b2bc71-2d2d-09f1-913d-0a6b93a1da31@denx.de>
Date: Wed, 21 Jul 2021 21:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721164319.uaf4qyr62dnktadv@maple.lan>
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

On 7/21/21 6:43 PM, Daniel Thompson wrote:
> On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
>> On 7/21/21 12:49 PM, Daniel Thompson wrote:
>>>>> However, on the basis of making things less fragile, I think the
>>>>> underlying problem here is the assumption that it is safe to modify
>>>>> enable_gpio before the driver has imposed state upon the PWM (this
>>>>> assumption has always been made and, in addition to systems where the BL
>>>>> has a phandle will also risks flicker problems on systems where
>>>>> power_pwm_on_delay is not zero).
>>>>
>>>> It is safe to modify the GPIO into defined state, but that defined state is
>>>> not always out/enabled, that defined state depends on the hardware.
>>>
>>> It is only safe to do this once we know what the initial value should be
>>> and I'm not sure that value can comes exclusively from reading the pin.
>>
>> I agree, it is far from perfect, but so is the current code.
> 
> Agreed. Current handling of enable pin isn't right.
> 
> 
>> However, see below regarding the floating backlight enable pin.
>>
>>>>> This patch does not change the assumption that we can configure the
>>>>> GPIO before we modify the PWM state. This means it won't fix the problem
>>>>> for cases there the pin is HiZ by default but whose GPIOD_ASIS state is
>>>>> neither input nor output.
>>>>
>>>> That is correct, for pin that is floating, we lost. But then I would argue
>>>> that if your backlight-enable GPIO is floating, the hardware is buggy, I
>>>> would expect some pull resistor to keep the backlight off on power on on
>>>> that GPIO.
>>>
>>> I didn't say that the pin was floating. I said that the pin was in a HiZ
>>> state meaning it could still be subject to pull up/down.
>>>
>>> However there are cases, such as when the regulator is off, where I
>>> think it is entirely legitimate for the enable pin to be floating. The
>>> current driver does the wrong thing here if the pin is set as input
>>> since if the regulator is off the initial enable_gpio value should be 0.
>>
>> Oh, right, that's a valid point.
>>
>> So if the pin is input, we can basically toss a coin.
> 
> I don't think it is quite as bad as that: if the PWM and regulator
> are enabled then it is not okay for this pin to be floating.

So then we would have to check the regulator and pwm state, however 
Linux driver for those can reinit both the regulator and pwm block, so 
we are growing more and more heuristics.

>>> [...]
>>> I think a reasonably elegant approach can be reached by making
>>> pwm_backlight_initial_power_state() responsible for ensuring enable_gpio
>>> matches the observed hardware state (taking into account both the pin
>>> state and the regulator). I think this will fix both your flicker
>>> concerns whilst permitting the legitimate cases for a floating pin.
>>>
>>> Something like:
>>
>> I think we are getting closer, but there is extra problem to this.
>>
>>> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
>>> index e48fded3e414..8d8959a70e44 100644
>>> --- a/drivers/video/backlight/pwm_bl.c
>>> +++ b/drivers/video/backlight/pwm_bl.c
>>> @@ -409,6 +409,33 @@ static bool pwm_backlight_is_linear(struct platform_pwm_backlight_data *data)
>>>    static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
>>>    {
>>>    	struct device_node *node = pb->dev->of_node;
>>> +	bool active = true;
>>> +
>>> +	/*
>>> +	 * If the enable GPIO is present, observable (either as input
>>> +	 * or output) and off then the backlight is not currently active.
>>> +	 * */
>>> +	if (pb->enable_gpio && gpiod_get_value_cansleep(pb->enable_gpio) == 0)
>>> +		active = false;
>>
>> This will fail on iMX GPIO controller, where if the GPIO is output, you can
>> read its state, but by default that state is what you wrote into the GPIO
>> output value register, not what is the actual value on the pin (i.e.
>> consider you have a strong pull resistor that overpowers the driver).
>>
>> To have a GPIO which is output and sample the actual pin value, you have to
>> tweak the pinmux and enable the SION bit, then you get the actual value. But
>> that is specific to the iMX GPIO controller/pinmux.
> 
> You're describing a situation where we own a GPIO output pin and the
> value we believe we are driving into the pin is not being achieved due
> to some additional factor.

E.g. disabled PWM or regulator.

> Do we need to care about that? It sounds like
> the backlight driver won't work properly in this case since whatever
> value we set the enable_gpio then it will stay at the same value.

Possibly.

>>> [...]
>>> @@ -486,18 +500,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>>>    		goto err_alloc;
>>>    	}
>>> -	/*
>>> -	 * If the GPIO is not known to be already configured as output, that
>>> -	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
>>> -	 * direction to output and set the GPIO as active.
>>> -	 * Do not force the GPIO to active when it was already output as it
>>> -	 * could cause backlight flickering or we would enable the backlight too
>>> -	 * early. Leave the decision of the initial backlight state for later.
>>> -	 */
>>> -	if (pb->enable_gpio &&
>>> -	    gpiod_get_direction(pb->enable_gpio) != 0)
>>> -		gpiod_direction_output(pb->enable_gpio, 1);
>>
>> pwm_backlight_initial_power_state() is still called after pwm_apply_state()
>> in pwm_backlight_probe(), so that might still be too late, no ?
> 
> The initial pwm_apply_state() is essentially a nop or, perhaps, a sanity
> check if you prefer to think if it that way.
> 
> It can change the PWM period in some (non-DT) cases but only if the PWM
> is not already running... and the change of period should not start it
> running.

All right, let me give this a try.
