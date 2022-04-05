Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570984F41D2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D810EBE8;
	Tue,  5 Apr 2022 21:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5E10EBE8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:36:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2714681CFC;
 Tue,  5 Apr 2022 23:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649194588;
 bh=jA6RvtAe6d7vOEQr1dPcXyOe2QYjWwKFn7ZCqLcfXnw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JATVwDfhzyz0aUWxeKEaT5lpiw/2hTDjFFvNwfRoHUB1hpHb0anzdjD/VqUwR8nuO
 BlEqNZHZfYeoZ2buOfQhgQiifj/HlOwLKvjJ05b7B5Im0WRtBic25LeGA5o98HuIjW
 7ebitxpso84ITBEBNhnFzMz/Vfrlh2LG1F7hkWwZ67UR9ynDCpXENO331MysB29A+s
 EaFuT5SOI35SHuAtp333iWks5lAt0TPK1Kn9iSknX2kkB40B+cvGfEiP57UcWlMtEu
 5KLeqHoGcU4dwVNpe+kwTsFidhvFo4TVJBxtMe/k25Vv+1bfN5MuJbOZDS0IWU+shM
 /q4g7NVXG8oFw==
Message-ID: <b352a7c2-c0d5-7058-d4c9-fcd5b46bd322@denx.de>
Date: Tue, 5 Apr 2022 23:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
 <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
 <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
 <2b6df0ac-d429-7d49-60e8-727f8c135671@denx.de>
 <CAPY8ntDVaAoaCu19=2DxW97STQdaVMv1-DbuPuvQu50N6mY1mg@mail.gmail.com>
 <941582a8-ca70-dd96-3097-570ae731eb73@denx.de>
 <CAPY8ntAYWgqTxZ3gwYt+Eo1_hJyYc1OgLE6cDGMqAb_djPPPuA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntAYWgqTxZ3gwYt+Eo1_hJyYc1OgLE6cDGMqAb_djPPPuA@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/22 17:24, Dave Stevenson wrote:

Hi,

>>>>> If we can initialise the DSI host before the bridge for the
>>>>> pre_enable, then all the configuration moves to the atomic_pre_enable
>>>>> and there should be no need to have the delay.
>>>>>
>>>>> I can't 100% guarantee that, but one of the folks on the Pi forums is
>>>>> using [1] which does that, and is reporting it working well. (He's
>>>>> also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
>>>>> panels)
>>>>
>>>> It seems to me that checking whether the bridge got correctly
>>>> initialized is orthogonal to the aforementioned patchset though ?
>>>
>>> It's the delay that is ugly.
>>
>> You do need to wait a little after the initialization and before
>> checking the status, so that delay is not going away no matter how you
>> frob with the DSI bridge.
>>
>>> Put the check in atomic_enable which will be slightly later than
>>> configuration in pre_enable? Check that sufficient jiffies have passed
>>> if you needed.
>>> Or wire up the IRQ line from the SN65DSI83 rather than polling the IRQ
>>> Status register. Delayed workqueue if the IRQ isn't wired up.
>>
>> Are you able to do such deferred non-atomic operations in atomic_enable
>> callback ?
> 
> atomic_enable returns void so you can't fail the atomic_enable.
> All you're doing is reading a register and potentially logging an
> error - surely that can be done from any context.
> 
>>> If I read it right your log message is triggered by any bit being set
>>> in REG_IRQ_STAT. So an inconveniently timed correctable DSI error will
>>> set bit 4 and log the error even though it's been corrected. Likewise
>>> bit 7 / CHA_SYNCH_ERR could get triggered by an H or V sync packet
>>> being received in that 10-12ms window (we're in atomic_enable, so
>>> video is already running).
>>
>> There should be no bits set in the IRQ_STAT register if everything works
>> as it should.
> 
> On a perfect link, yes.

If your hardware is broken, then you really do want to know about it.

> Looking at the top 4 bits.
> 
> Bit 4
> CHA_COR_ECC_ERR
> When the DSI channel A packet processor detects a correctable ECC
> error, this bit is set.
> 
> The error is corrected, so why do we care? The display is still working.

If you get a lot of those correctable errors, your display might not 
work at all. So we do care.

> Bit 5
> CHA_UNC_ECC_ERR
> When the DSI channel A packet processor detects an uncorrectable ECC
> error, this bit is set;
> Bit 6
> CHA_CRC_ERR
> When the DSI channel A packet processor detects a data stream CRC error,
> this bit is set
> 
> It doesn't say what behaviour the DSI83 will take under these
> circumstances, but shouldn't be fatal to the display.

See above, it is an error, hardware is broken, you want to know about 
this and fix the hardware.

> Bit 7
> CHA_SYNCH_ERR
> When the DSI channel A packet processor detects an HS or VS
> synchronization error, that is, an unexpected sync packet; this bit is
> set.
> 
> It's happened, but shouldn't be fatal, so why do we care? The display
> should pick up correctly at the start of the next frame.

Or maybe it won't because of noise on the DSI link, fix the hardware.

Sorry, I am not happy about hiding errors and trying to somehow justify 
they are OK. They are not, the hardware is likely broken and it should 
be fixed, that is the right way to handle these errors.

> As I've already said, we're in atomic_enable and video is therefore
> running, this is highly plausibly going to happen. We've delayed for
> 4-5ms in sn65dsi83_atomic_enable, so we're a third of the way through
> a frame at 60fps. The chances of seeing a VS or HS packet at an
> unexpected time is therefore high.
> 
> Bits 2 & 3 look equally inconsequential.
> 
> Bit 0 as PLL unlock would cause grief.
> 
>>> If it's the PLL being unlocked that is the issue then it should only
>>> be checking bit 0. Or possibly reading the actual PLL lock status from
>>> REG_RC_LVDS_PLL_PLL_EN_STAT. Although as we've already checked that
>>> the PLL is locked via REG_RC_LVDS_PLL_PLL_EN_STAT earlier in the
>>> atomic_enable, I'm now a little confused as to the condition you are
>>> actually wanting to detect.
>>
>> Any outstanding errors which are currently hidden and only show up
>> sporadically at the worst possible moment.
> 
> If you were constantly looking at the status then that would be reasonable.
> To be looking during one specific 10-12ms period of time for some
> fairly generic status values seems a little redundant, and a waste of
> time in delaying the atomic_enable.

Sorry, I disagree. I think 10ms extra time in atomic_enable() is a good 
trade-off for knowing about possible hardware problems sooner rather 
than later.

> It'll be interesting to see if these events just go away when the
> initialisation sequence specified in the datasheet is being followed.
> Let's leave the debate until then, as it's currently fairly arbitrary.

No, your patch series is orthogonal to this patch.
