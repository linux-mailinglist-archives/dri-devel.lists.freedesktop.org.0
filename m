Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BF789924
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 23:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5DA10E09C;
	Sat, 26 Aug 2023 21:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591810E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 21:02:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 37AC18063E;
 Sat, 26 Aug 2023 23:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693083727;
 bh=7tH92aOPbx9tMb4qq4wmL8XZXnyx+/7sFp1S4nsRNCs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kwmV627RieZeLvNwpWclAfWd29YYM3CZ8w0JjooWlGhRVujAbkzTxwOLylKjrj0eh
 lHEQdDj0+hGUqY36EnqokkPH3FHntXcRWpe6nP19Qi6GKwpYrGm6PqNMhnYkgr2Wmj
 5mR7+zb69QIzR7Qj5IzTwnW39oFhP0YHv37nUBpPnQJUbOVRJwnDyawTwCt2ULV8y2
 KBPbGbuCu5wdXQ29nFAKCON8M7gr1s7OdwUckGqrAlt1iAlHQNYasC5sHotiUVWXJt
 JIF8FJUtKvT2F06aCidyX6tWaHcUzkSvMU/L5venqHOc4ILmfr9wBgpqgEGH9pYVn1
 CklWXaIapBwJg==
Message-ID: <1ef18921-2f21-9970-3cd4-aa9680d44127@denx.de>
Date: Sat, 26 Aug 2023 23:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Move init sequence from
 prepare() to enable()
To: Mimoja <mimoja@mimoja.de>, Mimoja <git@mimoja.de>,
 dri-devel@lists.freedesktop.org, mimoja@aachen.ccc.de, alu@fffuego.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20230826095516.81387-1-git@mimoja.de>
 <f8d2bbfd-0f9c-31d8-729c-b316025b5b65@denx.de>
 <cccbcec8-b6e5-58e2-2197-f97cc434aa43@mimoja.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <cccbcec8-b6e5-58e2-2197-f97cc434aa43@mimoja.de>
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/26/23 20:33, Mimoja wrote:

Hi,

+CC Dave , he might be able to help with the last part.

> I appreciate you taking the time to respond!
> 
> On 26.08.23 17:18, Marek Vasut wrote:
>> On 8/26/23 11:55, Mimoja wrote:
>>> "The .prepare() function is typically called before the display 
>>> controller
>>> starts to transmit video data."
>>> and
>>> "After the display controller has started transmitting video data, 
>>> it's safe
>>>   to call the .enable() function."
>>
>> DSI commands are not DSI video, so this should be OK ?
> 
> You are correct, my commit message is mixing things up here. I wanted to 
> emphasize roughly the thought of
> "when enable() is called the dsi core is expected to have its clock 
> initialized". Will take note to clarify this if I succeed to
> make a case for this patch below :)

I vaguely recall there was this flag in include/drm/drm_bridge.h which 
might be related:

748 /**
749  * @pre_enable_prev_first: The bridge requires that the prev
750  * bridge @pre_enable function is called before its @pre_enable,
751  * and conversely for post_disable. This is most frequently a
752  * requirement for DSI devices which need the host to be initialised
753  * before the peripheral.
754  */
755 bool pre_enable_prev_first;

Could it be, this is what you need ?

>>> While generally fine this can lead to a fillup of the transmission 
>>> queue before
>>> the transmission is set up on certain dsi bridges.
>>> This issue can also be seen on downstream imx8m* kernels.
>>
>> Can you reproduce this with current mainline Linux or linux-next tree ?
>> I recall the display pipeline in the NXP downstream stuff is very 
>> different from mainline .
> 
> You are very much correct. The NXP downstream kernel is completely 
> different from the upstream one
> and is really a great example to show the issue (code cleaned up for 
> readability):
> 
> https://github.com/varigit/linux-imx/blob/5.15-2.0.x-imx_var01/drivers/gpu/drm/bridge/sec-dsim.c#L1368
> ```
>      ret = drm_panel_prepare(dsim->panel);
>      if (unlikely(ret)) [...]
> 
>      /* config esc clock, byte clock and etc */
>      sec_mipi_dsim_config_clkctrl(dsim);
> 
>      ret = drm_panel_enable(dsim->panel);
>      if (unlikely(ret)) [...]
> 
> ```
> 
>> Which SoC does have this problem ?
> Sadly I don't have any SoCs available which would work perfectly with 
> linux-next, let alone are confirmed affected :/
> 
> I were able to make my Kingway Panel work (Custom one and so far 
> unsupported by the st7701 driver) with this
> patch on downstream 5.4 and 5.15 imx8mn as well as on a raspberry pi CM4 
> with 6.1. However raspberrypi/linux brings
> SPI support to the st7701 driver which should not affect this but I 
> would just like to document it here.
> I could not find any success story with st7701 and the rpi on 6.1 online 
> after a short search (and only one
> reference with 5.10 which seems to me a bit different in a short 
> comparison)  but again I can only offer
> circumstantial evidence. Sorry :/

Maybe Dave can help with this part .
