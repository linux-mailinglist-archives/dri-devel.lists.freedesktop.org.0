Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7884319CA4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 11:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599B88994D;
	Fri, 12 Feb 2021 10:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809CD882C2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 10:31:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DcVD435syz1s15c;
 Fri, 12 Feb 2021 11:31:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DcVD426zDz1qql3;
 Fri, 12 Feb 2021 11:31:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id GZCDq6P3L2R6; Fri, 12 Feb 2021 11:31:46 +0100 (CET)
X-Auth-Info: ub1S4oRprCarLC/G5tVMN8R4TGtQq8N5eiZmf2T825I=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 12 Feb 2021 11:31:45 +0100 (CET)
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 driver
To: Linus Walleij <linus.walleij@linaro.org>
References: <20210130181014.161457-1-marex@denx.de>
 <20210130181014.161457-2-marex@denx.de>
 <CAD=FV=WzW1L=nwcnhagCXfX5SStE0jr0bqRrEOi-46g4huD4Sw@mail.gmail.com>
 <49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de>
 <CAD=FV=Ve3hj8YOSRnJn7kzULPaPqyWCT9_qDHU+LZi=C+69+Xw@mail.gmail.com>
 <754e1868-9a5f-39ab-ac14-0e84492e145b@denx.de>
 <CACRpkdb+Rc40sbVh64wuNiH4bvgwAz8DAP4j34Y4aDywbGx9CQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <441ae397-823f-91e7-352b-c126cec69115@denx.de>
Date: Fri, 12 Feb 2021 11:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdb+Rc40sbVh64wuNiH4bvgwAz8DAP4j34Y4aDywbGx9CQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/12/21 9:43 AM, Linus Walleij wrote:
> On Thu, Feb 4, 2021 at 11:05 PM Marek Vasut <marex@denx.de> wrote:
>> On 2/4/21 10:10 PM, Doug Anderson wrote:
> 
>>>>>> +       /*
>>>>>> +        * Reset the chip, pull EN line low for t_reset=10ms,
>>>>>> +        * then high for t_en=1ms.
>>>>>> +        */
>>>>>> +       gpiod_set_value(ctx->enable_gpio, 0);
>>>>>
>>>>> Why not use the "cansleep" version to give some flexibility?
>>>>
>>>> Does that make a difference in non-interrupt context ?
>>>
>>> As I understand it:
>>>
>>> * If a client calls gpiod_set_value() then the underlying GPIO can
>>> only be one that doesn't sleep.
>>>
>>> * If a client calls gpiod_set_value_cansleep() then the underlying
>>> GPIO can be either one that does or doesn't sleep.
>>>
>>> * A client is only allowed to call gpiod_set_value_cansleep() if it's
>>> not in interrupt context.
>>>
>>> You are definitely not in an interrupt context (right?), so calling
>>> the "cansleep" version has no downsides but allows board designers to
>>> hook up an enable that can sleep.
>>
>> Linus, can you please confirm this ? I find this hard to believe, since
>> there are plenty of places in the kernel which use gpiod_set_value()
>> without the _cansleep, are those problematic then ?
> 
> The function looks like so:
> 
> void gpiod_set_value(struct gpio_desc *desc, int value)
> {
>          VALIDATE_DESC_VOID(desc);
>          /* Should be using gpiod_set_value_cansleep() */
>          WARN_ON(desc->gdev->chip->can_sleep);
>          gpiod_set_value_nocheck(desc, value);
> }
> 
> So if the chip has set ->can_sleep (i,e, this GPIO is on something
> like an I2C bus) then a warning will appear.
> 
> The warning only really appear if you have a driver that was
> previously only used on a gpiochip with "fast" (write a register)
> GPIOs and somebody start to use the same driver with a
> GPIO on e.g. an I2C bus, which will define ->can_sleep.
> 
> The simple solution to the warning is to switch to the
> _cansleep() variant but really it is a sign to check that
> this is not being called in atomic context and just check
> that the driver overall will survive sleeping context
> here.
> 
> In a way _cansleep() is just syntactic sugar.
> 
> In this driver, you can use _cansleep() if you like but not
> using it mostly works too, if used with SoC-type GPIOs.
> Whoever uses the driver with a GPIO on an I2C chip
> or similar gets to fix it.

Nice, I'm gonna archive this, this explanation is very clear, thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
