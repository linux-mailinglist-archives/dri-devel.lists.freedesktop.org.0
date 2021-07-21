Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87483D178F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0ED6ECB7;
	Wed, 21 Jul 2021 20:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CF56ECB7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:10:29 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4454F8164D;
 Wed, 21 Jul 2021 22:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626898227;
 bh=Nxg6D9/LNvGyyanXCtwvpqzrW0bClFd5ufksR+iD2ro=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=q5moY773ha3x3um5//G43YCFsmvOk/oy05rHfEQsbrUfVEacfY3dwlf4N+uPGqPZ+
 OqtYJAyqPx+7fXQ+Ru0YSkHKGAo1FNR7VbfjKgLiVpjAmtn1Hu/ZpjD9SK4iKsR95u
 UV42HlgMUraA3/ZhN83ZQDDeihOeiU/UAJp4l9/WOk7aJwXX2DonyfeIU3mnL7Pi1J
 vyNX3J+JaE0vpJkM0+IHWrvpID3P3p8ufsQoQmWD4wTkWsCTiyK0OjbiHw6VScknMX
 zdIxFVNKSSFRx6jvU1SxSi/kRZRvnJtUx0XrahDtE40JDSWPr2GSkwcbALO5KevWI/
 Ci4FyV5bpmL0g==
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
From: Marek Vasut <marex@denx.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721164319.uaf4qyr62dnktadv@maple.lan>
 <f8b2bc71-2d2d-09f1-913d-0a6b93a1da31@denx.de>
Message-ID: <7c354dc1-11d5-ed80-ed74-59c1aa6a9a31@denx.de>
Date: Wed, 21 Jul 2021 22:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f8b2bc71-2d2d-09f1-913d-0a6b93a1da31@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 7/21/21 9:01 PM, Marek Vasut wrote:

[...]

>>>> @@ -486,18 +500,6 @@ static int pwm_backlight_probe(struct 
>>>> platform_device *pdev)
>>>>            goto err_alloc;
>>>>        }
>>>> -    /*
>>>> -     * If the GPIO is not known to be already configured as output, 
>>>> that
>>>> -     * is, if gpiod_get_direction returns either 1 or -EINVAL, 
>>>> change the
>>>> -     * direction to output and set the GPIO as active.
>>>> -     * Do not force the GPIO to active when it was already output 
>>>> as it
>>>> -     * could cause backlight flickering or we would enable the 
>>>> backlight too
>>>> -     * early. Leave the decision of the initial backlight state for 
>>>> later.
>>>> -     */
>>>> -    if (pb->enable_gpio &&
>>>> -        gpiod_get_direction(pb->enable_gpio) != 0)
>>>> -        gpiod_direction_output(pb->enable_gpio, 1);
>>>
>>> pwm_backlight_initial_power_state() is still called after 
>>> pwm_apply_state()
>>> in pwm_backlight_probe(), so that might still be too late, no ?
>>
>> The initial pwm_apply_state() is essentially a nop or, perhaps, a sanity
>> check if you prefer to think if it that way.
>>
>> It can change the PWM period in some (non-DT) cases but only if the PWM
>> is not already running... and the change of period should not start it
>> running.
> 
> All right, let me give this a try.

ACK, for this case I have here, this works too. Can you submit a proper 
patch, including my AB/TB and I think also the Fixes tag ?
