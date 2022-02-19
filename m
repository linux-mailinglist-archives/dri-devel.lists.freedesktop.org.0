Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60F4BC4F3
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3CE10E11D;
	Sat, 19 Feb 2022 02:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1ED10E11D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:39:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B6E118366A;
 Sat, 19 Feb 2022 03:39:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645238352;
 bh=Xa3eZmDDOofaXgixPVvIBohHA9y7JHjFIVu7uio8SlM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bN6aLkMRd7j6MK0tT3UNqUQBElatgCMJtBmkeVYM595+xK5uJYz+ytoTvHtshb0Hd
 xsnSQkD/SE4gw+dyr0UMH/HhVUDOtqzs9lJvWfG5GxZD+H3GCdHKH6hYNlKmNWVFaa
 q14sBhVmOB95vgOP5yN5UVt4WG1g7TpzzJHL1jY4D+5v/luArDZ7dnBkK8VOxAvLZ7
 hieATKl+LWPx8pbRkdZCADc8XZw4FPLvLs7N871l6FodaUEYylrsoljir1vc5YGXF3
 PwFMurCqQw3rEoi4syP551W8TFWgVQ95n9dgJFCopppqAZvgsV7uxBU2NnqLn0PQkr
 m3fkuQx77oh7Q==
Message-ID: <64715cae-ab3c-2a14-dfa5-00f93d4db678@denx.de>
Date: Sat, 19 Feb 2022 03:39:11 +0100
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <fcf1f83690ea7faa8b0667840eef7a9f4967cf72.camel@pengutronix.de>
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

On 2/18/22 18:49, Lucas Stach wrote:
> Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
>> The TC358767/TC358867/TC9595 are all capable of operating either from
>> attached Xtal or from DSI clock lane clock. In case the later is used,
>> all I2C accesses will fail until the DSI clock lane is running and
>> supplying clock to the chip.
>>
>> Move all hardware initialization to enable callback to guarantee the
>> DSI clock lane is running before accessing the hardware. In case Xtal
>> is attached to the chip, this change has no effect.
> 
> I'm not sure if that last statement is correct. When the chip is
> bridging to eDP, the aux channel and HPD handling is needed to be
> functional way before the atomic enable happen. I have no idea how this
> would interact with the clock supplied from the DSI lanes. Maybe it
> doesn't work at all and proper eDP support always needs a external
> reference clock?

The driver currently assumes the TC358767 always gets RefClk from Xtal.

There is subsequent series which adds support for deriving clock which 
drive the TC358767 PLLs from DSI HS clock instead of Xtal in case the 
bridge operates in DSI-to-DPI mode. That needs additional plumbing, as 
the TC358767 must be able to select specific clock frequency on the DSI 
HS clock lane, because its PLLs need specific frequencies, see:

[RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS clock 
from DSI bridge

If someone needs to implement DSI-to-(e)DP mode without Xtal, ugh, that 
would likely need to have a way to figure out the DSI HS clock frequency 
already in probe and then enable those DSI HS clock very early on too ?

> I think we should make the "ref" clock a optional clock to properly
> describe the fact that the chip can operate without this clock in DSI
> input mode and then either do the chip init in the probe routine when
> the ref clock is present, or defer it to atomic enable when the ref
> clock is absent.

See the RFC patchset above, that patchset does exactly that, it makes 
RefClk optional.

[...]
