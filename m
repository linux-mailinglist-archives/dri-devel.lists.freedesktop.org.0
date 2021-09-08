Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E547403C75
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 17:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563A06E20F;
	Wed,  8 Sep 2021 15:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFBC6E204
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 15:26:21 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D5CF083370;
 Wed,  8 Sep 2021 17:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631114777;
 bh=WJL34owX2e0//PIfCOsTAgforcWti3JQ4D85GtYWohY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QPSd9Z+c8K7gSVHKmwZVbYYyVGcawzuZwbjlBPqbVRv7GKvK7dm2DjD3IGcFqvlem
 mdzr2ObIrHBbF07Tge2/VNqOacVoMBKFWZ2ApWswNx9Y6/cC74N7QC23AESPUDp5yW
 lO8PP0DWE4Al1jZ2knzbhVuqMhUFZvJEkvOhAZO3KRcTLH5jzA1DSbKI1Rts/qyVH7
 xXqMB30HI21dTze2+VGKLzaV1w0CArYTCrk04DAKRnsEjxsq4fp0A7YIoH3naemjMd
 VyYbAvmROYgZFS4nTBdQJhFgjQ3cYkbykS8zci1B/TpPywrJG0mEvQrWFeiDYH9sa6
 XgfPvDzB5+ylw==
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
 <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
 <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
 <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <13ecc7df-37b9-a686-9314-04a26359fc0d@denx.de>
Date: Wed, 8 Sep 2021 17:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/8/21 1:11 PM, Dave Stevenson wrote:
> Hi Marek and Andrzej

Hello Dave,

skipping the protocol discussion, which I hope Andrej will pick up.

[...]

>>> Usually video transmission starts in crtc->enable (CRTC->Encoder), and
>>> in encoder->enable (encoder->bridge), so in bridges->enable it would be
>>> too late for LP11 state - transmission can be already in progress.
>>>
>>> It shows well that this order of calls does not fit well to DSI, and
>>> probably many other protocols.
>>>
>>> Maybe moving most of the bridge->enable code to bridge->pre_enable would
>>> help, but I am not sur if it will not pose another issues.
>>
>> Yep, that won't work e.g. with the exynos DSIM, because
>> exynos_dsi_set_display_mode() sets the data lanes to LP11.
> 
> Isn't the bigger question for SN65DSI8[3|4|5] whether the clock lane
> is running or not in pre_enable?

I think the bigger question really is -- how do we cater for all the 
different bridges with different init-time requirements.

>>> This is quick analysis, so please fix me if I am wrong.
>>
>> I pretty much agree that the current state of things does not fit with
>> DSI too well.
> 
> That was why I was questioning how DSI was meant to be implemented in
> https://lore.kernel.org/dri-devel/CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com/
> 
> The need to have the DSI host in a defined idle state (often LP-11,
> but varying whether the clock lane is in HS) before powering up the
> panel/bridge is incredibly common, but currently undefined in DRM.
> 
> Taking the SN65DSI83 as an example, the datasheet [1] section 7.4.2
> states that the clock lane must be in HS mode, and data lanes in LP-11
> when coming out of reset. That means that we can't be "enable" as that
> will have the data lanes in HS mode and sending video, and as we can't
> be in "pre_enable" as the DSI PHY will be powered down and so we won't
> have the clock lanes in HS mode.
> 
> I've hit a similar one with the Toshiba TC358762 where it seems to get
> upset if it is receiving video data when it gets configured.
> panel-raspberrypi-touchscreen[2] which drives that chip is
> intermittent when using panel enable, whereas panel prepare is
> significantly more reliable but relies on the DSI host being
> initialised to LP-11 by breaking the chain.

Right

To make it worse, not initing the DSI bridge exactly per spec leads to 
intermittent failures, not consistently occuring ones.

>    Dave
> 
> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> [2] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c

Unrelated to this discussion -- there is a tc358762 driver, driver for 
that attiny88 regulator, and driver for the touchscreen chip, on that 
rpi 7" display, in upstream. You can use those to replace the composite 
panel driver (it works at least against stm32mp1 DSI host with the rpi 
7" panel). Sadly there is little documentation for that attiny88 
protocol or firmware, that's what I don't like about that panel.
