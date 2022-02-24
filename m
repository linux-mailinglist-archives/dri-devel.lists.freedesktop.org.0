Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92A4C3573
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B502510E7D2;
	Thu, 24 Feb 2022 19:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F3610E2AE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:13:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D99A1837F5;
 Thu, 24 Feb 2022 20:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645729997;
 bh=CcQIAItWc/yb3pKfpJUEqaz4Gbo3EJMQM0qrw4IZwsQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pKjUGWjdvSg86Eu7+dNYTYiii0PsuUfh2tvzwWzV7ZZApZmZ5+asO0PX5zvUiRuej
 quCjFg0WoJnXNzH5Nc31Xrmk0pp70bQysHP3nWCn2TNm88a8anZB3KmAibsJ5sxrQ1
 f9R2vWnmBpW8ORSNrQfkWGXzwOVmvKgDpY7j6pKj5kWnlgw0eDVKIeqX7HJ1mTQMIJ
 fog37WJcMxn3k2C6TftXr1C9vkafs0gBa0cUdNE4dSyYr43DSLe/TtaBKSUbosX9xa
 eBpiJKLiwwU/6SbucmqKoTcmJ7/ybr4dMxqfXfHFyNSCSdvSILDYV0klfJP8aYEIW1
 pua41Pz8jevRw==
Message-ID: <bb1db301-71fe-8ebd-ea23-f1c602542ffb@denx.de>
Date: Thu, 24 Feb 2022 20:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 05/11] drm/bridge: tc358767: Move hardware init to
 enable callback
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-6-marex@denx.de>
 <fcf1f83690ea7faa8b0667840eef7a9f4967cf72.camel@pengutronix.de>
 <64715cae-ab3c-2a14-dfa5-00f93d4db678@denx.de>
 <15821a06946264bb5a6df671d664a29ebfcabbb9.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <15821a06946264bb5a6df671d664a29ebfcabbb9.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 10:12, Lucas Stach wrote:
> Am Samstag, dem 19.02.2022 um 03:39 +0100 schrieb Marek Vasut:
>> On 2/18/22 18:49, Lucas Stach wrote:
>>> Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
>>>> The TC358767/TC358867/TC9595 are all capable of operating either from
>>>> attached Xtal or from DSI clock lane clock. In case the later is used,
>>>> all I2C accesses will fail until the DSI clock lane is running and
>>>> supplying clock to the chip.
>>>>
>>>> Move all hardware initialization to enable callback to guarantee the
>>>> DSI clock lane is running before accessing the hardware. In case Xtal
>>>> is attached to the chip, this change has no effect.
>>>
>>> I'm not sure if that last statement is correct. When the chip is
>>> bridging to eDP, the aux channel and HPD handling is needed to be
>>> functional way before the atomic enable happen. I have no idea how this
>>> would interact with the clock supplied from the DSI lanes. Maybe it
>>> doesn't work at all and proper eDP support always needs a external
>>> reference clock?
>>
>> The driver currently assumes the TC358767 always gets RefClk from Xtal.
>>
>> There is subsequent series which adds support for deriving clock which
>> drive the TC358767 PLLs from DSI HS clock instead of Xtal in case the
>> bridge operates in DSI-to-DPI mode. That needs additional plumbing, as
>> the TC358767 must be able to select specific clock frequency on the DSI
>> HS clock lane, because its PLLs need specific frequencies, see:
>>
>> [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS clock
>> from DSI bridge
>>
>> If someone needs to implement DSI-to-(e)DP mode without Xtal, ugh, that
>> would likely need to have a way to figure out the DSI HS clock frequency
>> already in probe and then enable those DSI HS clock very early on too ?
>>
> Probably, but that was really just something I wondered about while
> passing by.
> 
> The real issue is that I think _this_ patch breaks eDP operation, as
> now the chip is initialized way too late, as the AUX channel
> functionality needs to be available long before the atomic bridge
> enable callback is called.

I don't think that's correct -- look at the tc_hardware_init() function, 
all it does is it reads the chip ID, optionally does software reset if 
there is no reset GPIO connected, and then sets up hotplug detect IRQ. 
There is nothing specific to bringing up the AUX channel in that 
function, so the AUX channel should work even before tc_hardware_init() 
is called.

> The AUX channel is used to fetch the display
> EDID, so before you can even set a mode it needs to be functional.
> Unconditionally moving the chip init is probably (I haven't tested it
> yet) going to break this.

If you have such a setup with eDP, please test it, I don't think this is 
going to break it.
