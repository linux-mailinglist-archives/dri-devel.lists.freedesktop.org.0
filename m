Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56B076A27F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 23:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081E110E2E4;
	Mon, 31 Jul 2023 21:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0C410E309
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 21:15:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 19A5486A64;
 Mon, 31 Jul 2023 23:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690838111;
 bh=6eqaVsr9Pm3bwPTOc4doll72m51xou42jmOT8RxXUFw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rCTwd/9Lh2UYuxkfNMBhcpcWJn+0cLgtE2q1rpVqAcQ2MH5JgpTTHDIV4anctakWL
 2qBieG6yfEaCRUfznMZTxoKI6AjcTLmR7KHxdz89pBZ5+SfkZeLqMiT5jXaor+Mpk/
 mqnxn3xEUW4gKPfsTdfsvidS+wTHttpVB0P7SEs5hTPwmqWSBNN2rx+dLHTmCWr1m0
 WYrRf8TykziNKVTtfVrx8CC7CQ/hvFbphX9ZscSTn/XISOR1W5EsQ7irCi+Z+FA59D
 4j+kT6whlL/Bbl9lXNkNenv+xAe3LFxl02Veismn419quusI1emxUNctuxgsM9SAH4
 s7tREmhbIOSIg==
Message-ID: <75b6257d-b9d0-9cba-b3d3-218bad8209b4@denx.de>
Date: Mon, 31 Jul 2023 23:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Doug Anderson <dianders@chromium.org>
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
 <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
 <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
 <594f8182-b74d-6ef2-0d90-74061b35bc50@denx.de>
 <CAD=FV=VXMsZ-kUOgd32LnjBP4eP-j0rbiDhF6O0wSAQsEB5mng@mail.gmail.com>
 <2a6e338d-36ef-6836-bc9d-ef1f727463a4@denx.de>
 <CAD=FV=X17TEovhxm9Wh9qX0RZXAO3Km0coYnfnoO=nsr=doUFw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAD=FV=X17TEovhxm9Wh9qX0RZXAO3Km0coYnfnoO=nsr=doUFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/23 21:50, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 31, 2023 at 11:03 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/24/23 15:49, Doug Anderson wrote:
>>
>> Hi,
>>
>> [...]
>>
>>>> Maybe the EPROBE_DEFER actually happens and triggers the failure ?
>>>
>>> I could certainly believe that EPROBE_DEFER is involved.
>>
>> So no, it is not. It is difficult to set this up and access the signals,
>> but so I did.
>>
>> What happens is this:
>> panel_simple_probe() calls devm_regulator_get()
>>     -> If the regulator was ENABLED, then it is now DISABLED
> 
> As per my previous response, I don't think this is true.

I just measured that with a scope on actual hardware .

reg_fixed_voltage_probe() is the code which turns the regulator OFF, 
specifically in the part gpiod_get_optional(...GPIOD_OUT_LOW);

> This was the
> part where I referred to `Documentation/power/regulator/consumer.rst`
> which said:
> 
> NOTE:
>    The supply may already be enabled before regulator_enabled() is called.
>    This may happen if the consumer shares the regulator or the regulator has been
>    previously enabled by bootloader or kernel board initialization code.
> 
> 
> My belief is that what's actually happening is that when the regulator
> _probes_ that the regulator turns off. In Linux GPIO regulators cannot
> read the state of the regulator at bootup. That means that when the
> regulator itself probes that Linux has to decide on the default state
> of the regulator itself. If the device tree has "regulator-boot-on"
> then Linux will turn the regulator on (even without any clients). In
> this case the regulator will stay on until some client enables and
> then disables the regulator, or until the regulator boot timeout
> happens and all unused regulators are powered off. If the device tree
> doesn't have "regulator-boot-on" then Linux will turn the regulator
> off.
> 
> 
>>     -> For regulator-fixed, this means the regulator GPIO goes HIGH->LOW
>>
>> panel_simple_prepare() triggers panel_simple_resume()
>>     -> If this occurs too soon after devm_regulator_get() turned the
>>        regulator OFF and thus regulator GPIO low, then unprepare time is
>>        not respected => FAIL
>>
>> Since there is no way to find out in which state the regulator was when
>> devm_regulator_get() was called, we have to wait the full unprepare time
>> before re-enabling that regulator in panel_simple_resume().
> 
> So just as a point of order, do you agree that prior to the commit
> that you are "Fixing" that we _weren't_ doing the full delay at probe
> time? That means that if things worked before they were working by
> some amount of luck, right? The old code used to do a delay after
> turning _off_ the regulator (at unprepare time).

Yes, that's well possible.

> I will also continue to assert that trying to fix the problem via a
> delay in the probe of the panel code is the wrong place to fix the
> code. The problem is that you need a board-level constraint on this
> regulator (off-on-delay-us) preventing it from turning on again within
> a certain amount of time after it is turned off. This allows the
> regulator framework, which is what decided to turn this rail off
> during the regulator probe, to enforce this constraint.

No, the driver must respect the unprepare delay, that is what is 
currently not happening. Trying to somehow work around that by adding 
random changes to DT is not going to fix the fact that panel-simple is 
not respecting its own internal built-in constraints.
