Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C40789C12
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 10:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E974710E00D;
	Sun, 27 Aug 2023 08:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 377 seconds by postgrey-1.36 at gabe;
 Sat, 26 Aug 2023 18:39:49 UTC
Received: from mail.mimoja.de (mail.mimoja.de [IPv6:2a00:17d8:100::c31])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8080E10E11D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 18:39:49 +0000 (UTC)
Received: from [192.168.0.151] (ip-77-25-13-203.web.vodafone.de [77.25.13.203])
 by mail.mimoja.de (Postfix) with ESMTPSA id C45B42612F;
 Sat, 26 Aug 2023 20:33:30 +0200 (CEST)
Message-ID: <cccbcec8-b6e5-58e2-2197-f97cc434aa43@mimoja.de>
Date: Sat, 26 Aug 2023 20:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Move init sequence from
 prepare() to enable()
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Mimoja <git@mimoja.de>,
 dri-devel@lists.freedesktop.org, mimoja@aachen.ccc.de, alu@fffuego.com
References: <20230826095516.81387-1-git@mimoja.de>
 <f8d2bbfd-0f9c-31d8-729c-b316025b5b65@denx.de>
From: Mimoja <mimoja@mimoja.de>
In-Reply-To: <f8d2bbfd-0f9c-31d8-729c-b316025b5b65@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Aug 2023 08:16:19 +0000
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I appreciate you taking the time to respond!

On 26.08.23 17:18, Marek Vasut wrote:
> On 8/26/23 11:55, Mimoja wrote:
>> "The .prepare() function is typically called before the display 
>> controller
>> starts to transmit video data."
>> and
>> "After the display controller has started transmitting video data, 
>> it's safe
>>   to call the .enable() function."
>
> DSI commands are not DSI video, so this should be OK ?

You are correct, my commit message is mixing things up here. I wanted to 
emphasize roughly the thought of
"when enable() is called the dsi core is expected to have its clock 
initialized". Will take note to clarify this if I succeed to
make a case for this patch below :)

>> While generally fine this can lead to a fillup of the transmission 
>> queue before
>> the transmission is set up on certain dsi bridges.
>> This issue can also be seen on downstream imx8m* kernels.
>
> Can you reproduce this with current mainline Linux or linux-next tree ?
> I recall the display pipeline in the NXP downstream stuff is very 
> different from mainline .

You are very much correct. The NXP downstream kernel is completely 
different from the upstream one
and is really a great example to show the issue (code cleaned up for 
readability):

https://github.com/varigit/linux-imx/blob/5.15-2.0.x-imx_var01/drivers/gpu/drm/bridge/sec-dsim.c#L1368
```
     ret = drm_panel_prepare(dsim->panel);
     if (unlikely(ret)) [...]

     /* config esc clock, byte clock and etc */
     sec_mipi_dsim_config_clkctrl(dsim);

     ret = drm_panel_enable(dsim->panel);
     if (unlikely(ret)) [...]

```

> Which SoC does have this problem ?
Sadly I don't have any SoCs available which would work perfectly with 
linux-next, let alone are confirmed affected :/

I were able to make my Kingway Panel work (Custom one and so far 
unsupported by the st7701 driver) with this
patch on downstream 5.4 and 5.15 imx8mn as well as on a raspberry pi CM4 
with 6.1. However raspberrypi/linux brings
SPI support to the st7701 driver which should not affect this but I 
would just like to document it here.
I could not find any success story with st7701 and the rpi on 6.1 online 
after a short search (and only one
reference with 5.10 which seems to me a bit different in a short 
comparison)  but again I can only offer
circumstantial evidence. Sorry :/

Thank you again
~Mimoja

