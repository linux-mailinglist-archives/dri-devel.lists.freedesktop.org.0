Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E064F3979
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662A10E641;
	Tue,  5 Apr 2022 14:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FDE10E8F7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:48:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5E7AE83B10;
 Tue,  5 Apr 2022 16:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649170098;
 bh=7wALIcku6Fl2yh6DAdyhqV2TK2ItqamQscXaO7p6Yh4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nYThkudba4Ve7nk3Hbi8x9bQR6j5KjP6hFB2gsXYH710R8hPj9t4YyAYURDZThNmm
 8FMuR+ucYoVmhIDkL9qTZ1J2N1gZqoGujr6NHx2DCmD39B5Yha1AQOFk0amaHzbAaa
 3Ij6f5UJYKGBGOYjMAZZxICnB0kXIhwT6pNxEXOgEg+S8IyIRLpLCUuO9MlMBmVNB7
 mejk72DgUxhnT0KugC87jK6jXvjc6aJU13LJj36BLs5o9/6KsnF2cuLlo1jfBusVsx
 j2kYwXBSebiVXghDax3aVuufyN2IoKNiWvXDs63y7Z3UGQyGoQaP3yAEHbLVj2IspP
 XnPQukj3W+qzQ==
Message-ID: <941582a8-ca70-dd96-3097-570ae731eb73@denx.de>
Date: Tue, 5 Apr 2022 16:48:17 +0200
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntDVaAoaCu19=2DxW97STQdaVMv1-DbuPuvQu50N6mY1mg@mail.gmail.com>
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

On 4/5/22 16:20, Dave Stevenson wrote:

Hi,

>>> If we can initialise the DSI host before the bridge for the
>>> pre_enable, then all the configuration moves to the atomic_pre_enable
>>> and there should be no need to have the delay.
>>>
>>> I can't 100% guarantee that, but one of the folks on the Pi forums is
>>> using [1] which does that, and is reporting it working well. (He's
>>> also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
>>> panels)
>>
>> It seems to me that checking whether the bridge got correctly
>> initialized is orthogonal to the aforementioned patchset though ?
> 
> It's the delay that is ugly.

You do need to wait a little after the initialization and before 
checking the status, so that delay is not going away no matter how you 
frob with the DSI bridge.

> Put the check in atomic_enable which will be slightly later than
> configuration in pre_enable? Check that sufficient jiffies have passed
> if you needed.
> Or wire up the IRQ line from the SN65DSI83 rather than polling the IRQ
> Status register. Delayed workqueue if the IRQ isn't wired up.

Are you able to do such deferred non-atomic operations in atomic_enable 
callback ?

> If I read it right your log message is triggered by any bit being set
> in REG_IRQ_STAT. So an inconveniently timed correctable DSI error will
> set bit 4 and log the error even though it's been corrected. Likewise
> bit 7 / CHA_SYNCH_ERR could get triggered by an H or V sync packet
> being received in that 10-12ms window (we're in atomic_enable, so
> video is already running).

There should be no bits set in the IRQ_STAT register if everything works 
as it should.

> If it's the PLL being unlocked that is the issue then it should only
> be checking bit 0. Or possibly reading the actual PLL lock status from
> REG_RC_LVDS_PLL_PLL_EN_STAT. Although as we've already checked that
> the PLL is locked via REG_RC_LVDS_PLL_PLL_EN_STAT earlier in the
> atomic_enable, I'm now a little confused as to the condition you are
> actually wanting to detect.

Any outstanding errors which are currently hidden and only show up 
sporadically at the worst possible moment.

[...]
