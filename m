Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203B46BD1E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 14:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3786ECF2;
	Tue,  7 Dec 2021 13:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31056ECF2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 13:59:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 330D382058;
 Tue,  7 Dec 2021 14:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1638885591;
 bh=8moHGBmWf7fUJdOQJenYjYTvvpB7DbspovVkB1RVFkQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qTlnVKNis0iDSCHjSc5CWpyl5oQtqiJfGqUJoFDeR33FKYSDGzsUEBlo2DzFFBDEg
 JRD+ZqHsBDQn4Vjq2sRtXFhwaKZ6C/I/4DZxdfJ23Mfd/Sgk9zrwAPYPC/uoyX5jNe
 3Z3zA6XebD3jdRzFkaDaN886JNVehJHuLRqTENi6wrmunRRpM9+31x18eFmaepIc9g
 Q//eB4A1/H8v7Z5RvBq0oXRc8vb1xpfwwFieIE9/1wohE6TNmzNBVyYM+CMMXtoTDI
 xmMz13W44ChVgj82gXijlkiKYsveBT4WimnUtFdB2WLckZakS4JeoSS7zRsINbhOqr
 VleXp+8tncPUw==
Message-ID: <4ed56b2f-7d00-60bf-180b-fcf13b0ec107@denx.de>
Date: Tue, 7 Dec 2021 14:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] drm/bridge: tc358767: Move hardware init to enable
 callback
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-2-marex@denx.de>
 <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
 <77d26622-843b-1009-b331-5834d2d195d6@denx.de>
 <CAPY8ntBd1o-OpXAUf3s-OHCHrJ2VOt0HVn9sGOcXRd_2kUYG3g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntBd1o-OpXAUf3s-OHCHrJ2VOt0HVn9sGOcXRd_2kUYG3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/21 14:34, Dave Stevenson wrote:

Hi,

>>>> The TC358767/TC358867/TC9595 are all capable of operating either from
>>>> attached Xtal or from DSI clock lane clock. In case the later is used,
>>>> all I2C accesses will fail until the DSI clock lane is running and
>>>> supplying clock to the chip.
>>>>
>>>> Move all hardware initialization to enable callback to guarantee the
>>>> DSI clock lane is running before accessing the hardware. In case Xtal
>>>> is attached to the chip, this change has no effect.
>>>
>>> This puzzles me as there seem to be a couple of ambiguities over how
>>> it would be used.
>>>
>>> Firstly the DT binding lists the clock as a required property, but
>>> there isn't one present if deriving the clock from the DSI clock lane.
>>
>> That's correct, the clock for the internal PLLs are derived from the DSI
>> clock lane.
> 
> Does that mean you're creating a dummy clock device?
> If it's a required property then presumably yes, but it seems a little
> odd as that reflck does not exist.

No. The refclk will become optional, but for that I need some more 
infrastructure work, i.e. some way to communicate the requirements of 
the DSI clock lane to the DSI host.

>>> Secondly the datasheet states that the DSI Reference Clock Source
>>> Division Selection is done by the MODE1 pin, and switches between
>>> HSCKBY2 divided by 7 and HSCKBY2 divided by 9. There is a stated
>>> assumption that HSCK is either 364MHz or 468MHz, thereby ending up
>>> with 26MHz. To do this we have to be running DSI in burst mode, but
>>> the support for that in DRM is near zero.
>>
>> Yes, you have to run the DSI clock lane at either of the two clock
>> frequencies, that is rather limiting. The DSI has to be running in
>> continuous clock mode, this has nothing to do with burst mode, the burst
>> mode is a DSI host setting which is supported by most DSI hosts.
> 
> OK burst mode is technically dropping the lane to LP mode, and you
> don't need that state transition.
> 
> To quote the Toshiba datasheet:
> "As the clock derived from the
> DSICLK has to be fixed at 13, 26, 19.2 or 38.4 MHz, the DSI Host may
> need to run DSI clock lane at
> higher frequency than needed by frame rate and may have to send the
> DSI video mode transmissions in
> burst mode (explained in DSI section of this specification) "
> 
> So where are you configuring the DSI clock lane to be running at one
> of those frequencies? Or are you requiring your panel to be running
> with a matching pixel clock?

This is a preparatory patch, so nowhere yet. I forced the clock lane to 
the required clock frequency on the DSI host side thus far. You can 
still configure the chip to derive clock from Xtal, even with DSI as 
data input.

>>> Can I ask how the chip has actually been configured and run in this mode?
>>
>> REFCLK Xtal disconnected and HSCKBY2/7 MODE0=H MODE1=L , that should be
>> all you need. Do you plan to develop a board with this bridge ?
> 
> Yes, I have a board with this chip in DSI to DPI mode that I'm trying
> to get to work. The intent was to configure it via DSI LP commands
> rather than I2C, but currently it's refusing to do anything.

I see.
