Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A230FFD5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 23:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFE76EE70;
	Thu,  4 Feb 2021 22:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E306EE70
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 22:05:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DWt0T0GY9z1qsZv;
 Thu,  4 Feb 2021 23:05:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DWt0S6ZNfz1t6pt;
 Thu,  4 Feb 2021 23:05:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id A42zhnKn8apA; Thu,  4 Feb 2021 23:05:43 +0100 (CET)
X-Auth-Info: T/t4LPIfsrigfXnl8Qq6X85XUECP2UrZqUxJOOmHOew=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  4 Feb 2021 23:05:43 +0100 (CET)
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 driver
To: Doug Anderson <dianders@chromium.org>
References: <20210130181014.161457-1-marex@denx.de>
 <20210130181014.161457-2-marex@denx.de>
 <CAD=FV=WzW1L=nwcnhagCXfX5SStE0jr0bqRrEOi-46g4huD4Sw@mail.gmail.com>
 <49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de>
 <CAD=FV=Ve3hj8YOSRnJn7kzULPaPqyWCT9_qDHU+LZi=C+69+Xw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <754e1868-9a5f-39ab-ac14-0e84492e145b@denx.de>
Date: Thu, 4 Feb 2021 23:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Ve3hj8YOSRnJn7kzULPaPqyWCT9_qDHU+LZi=C+69+Xw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/21 10:10 PM, Doug Anderson wrote:
> Hi,

Hi,

[...]

>>>> +       regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
>>>
>>> Do you need to list REG_RC_RESET as volatile?  Specifically you need
>>> to make sure it's not cached...
>>
>> Isn't volatile table exactly for this purpose -- to make sure the reg is
>> not cached ?
> 
> Sorry, I was unclear I guess.  I'm suggesting that you add
> REG_RC_RESET to the list of volatile ones since I don't see it there.

Ah, yes, it should.

>>>> +static const struct regmap_config sn65dsi83_regmap_config = {
>>>> +       .reg_bits = 8,
>>>> +       .val_bits = 8,
>>>> +       .rd_table = &sn65dsi83_readable_table,
>>>> +       .wr_table = &sn65dsi83_writeable_table,
>>>> +       .volatile_table = &sn65dsi83_volatile_table,
>>>> +       .cache_type = REGCACHE_RBTREE,
>>>> +       .max_register = REG_IRQ_STAT,
>>>> +};
>>>
>>> I'm curious how much the "readable" and "writable" sections get you.
>>> In theory only the "volatile" should really matter, right?
>>
>> They are useful when dumping the regs from debugfs regmap registers .
> 
> OK, fair enough.  When I thought about doing this on sn65dsi86, it
> came to be that a better way might be something like:
> 
> #define ACC_RO BIT(0)
> #define ACC_RW BIT(1)
> #define ACC_W1C BIT(2)
> #define ACC_WO BIT(3)
> 
> u8 reg_acceess[] = {
>    [0x00] = ACC_RO,
>    [0x01] = ACC_RO,
>    ...
>    [0x0a] = ACC_RO | ACC_RW,
>    [0x0b] = ACC_RW,
>    [0x0d] = ACC_RW
>    ...
> };
> 
> The above maps really nicely to the public datasheet and is easy to
> validate.  Then you can just look up in that array in a constant time
> lookup.  In other words, "readable" if either RO or RW is set.
> "writable" if any of RW, W1C, or WO is set.  Everything that's not RW
> is volatile (technically you could differentiate between RO things
> that are hardcoded and ones that aren't, but you probably don't need
> to).
> 
> Anyway, feel free to ignore...  What you have is fine too.

It might make sense to implement some more generic support for this ^ 
into the regmap core ? This seems to be a rather common pattern.

>>>> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
>>>> +{
>>>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>>>> +
>>>> +       /*
>>>> +        * Reset the chip, pull EN line low for t_reset=10ms,
>>>> +        * then high for t_en=1ms.
>>>> +        */
>>>> +       gpiod_set_value(ctx->enable_gpio, 0);
>>>
>>> Why not use the "cansleep" version to give some flexibility?
>>
>> Does that make a difference in non-interrupt context ?
> 
> As I understand it:
> 
> * If a client calls gpiod_set_value() then the underlying GPIO can
> only be one that doesn't sleep.
> 
> * If a client calls gpiod_set_value_cansleep() then the underlying
> GPIO can be either one that does or doesn't sleep.
> 
> * A client is only allowed to call gpiod_set_value_cansleep() if it's
> not in interrupt context.
> 
> You are definitely not in an interrupt context (right?), so calling
> the "cansleep" version has no downsides but allows board designers to
> hook up an enable that can sleep.

Linus, can you please confirm this ? I find this hard to believe, since 
there are plenty of places in the kernel which use gpiod_set_value() 
without the _cansleep, are those problematic then ?

>>>> +       usleep_range(10000, 11000);
>>>
>>> It seems like it would be worth it to read the enable_gpio first?  If
>>> it was already 0 maybe you can skip the 10 ms delay?  I would imagine
>>> that most of the time the bridge would already be disabled to start?
>>
>> How do you guarantee the GPIO was LO for 10 mS here? You can sample that
>> it is LO, but you won't know how long it was LO before this code was
>> executed.
> 
> Ah, true.  I guess the best we could do would be keep track of the
> GPIO ourselves so that if we were the one to last turn it off we could
> avoid the delay.

Does the extra complexity outweigh the benefit of saving those 10mS ?

>>>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>>
>>> Probably you don't need this?  It's the default and in pre-enable you
>>> just reset the chip.  Maybe it was needed since you don't flush the
>>> cache in pre-enable?
>>
>> Have a look at the Example Script in the DSI83 datasheet, this PLL part
>> is needed.
> 
> I think that script is written without the assumption that you have
> just reset the chip using the enable GPIO.  If you have just reset
> with the enable GPIO it shouldn't be needed.

I don't think it hurts anything, so let's keep it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
