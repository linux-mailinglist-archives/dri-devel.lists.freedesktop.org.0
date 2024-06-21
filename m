Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62EC912993
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F2D10F204;
	Fri, 21 Jun 2024 15:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="nIUJc37n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C063410F204
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:26:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3B1D888550;
 Fri, 21 Jun 2024 17:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718983573;
 bh=Mh2Ujrfb9C0g7WSIKhUk7YW6twTnT6ONS5b92tKVS54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nIUJc37nyVdFa1dlM2T1JE2K7rsDfSlZ510w2S9Glvks8N/g+bUrexcL27SG5f0S8
 ozRywtMYAExEUUmKSQnpaBKUzQGyY+LUKJvnFYgpszhJ2bhs7esmA7rbsNKY4FrY55
 lD8TwJG4x9H1kCV4q+uAvG4M/vNlrCcaorsJXqu3CtoUogbudEglKlx2i5tATM0JQP
 vd5LCNhXezdZmQDJ2i3x4dg5l9PaSJCph95JV6aSEHSVk3y+VO3B/anvXGtP7pzu0q
 KG8w4GVHYdNdsS2EpibKG59rocBmx7NTPmCFy0qXbQJHWdedss0WclY4qiYDZBcLvC
 HGlDNp1JXnsZA==
Message-ID: <71f042ba-63f4-402c-8be2-3bfe6fe91a0b@denx.de>
Date: Fri, 21 Jun 2024 16:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: tc358767: Use tc_pxl_pll_calc() to
 correct adjusted_mode clock
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240531204130.277800-1-marex@denx.de>
 <47ec3645-1584-467f-a2c9-d2a8debb0243@denx.de>
 <f0d85728-2e19-4011-bfdc-0bca965e0b35@denx.de> <4623820.cEBGB3zze1@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4623820.cEBGB3zze1@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/24 12:32 PM, Alexander Stein wrote:

Hi,

skipping the parts where I would simply write "OK" ...

>>>> As FVUEN is cleared at the next VSYNC event I suspect the DSI timings
>>>> are (slightly) off, but unfortunately I don't have equipment to check
>>>> DSI signal quality/timings.
>>>
>>> As long as the LCDIFv3 pixel clock are equal or slightly slower than
>>> what the TC9595 PixelPLL generates, AND, DSIM serializer has enough
>>> bandwidth on the DSI bus (i.e. set the bus to 1 GHz, the TC9595 DSI RX
>>> cannot go any faster), you should have no issues on that end.
> 
> I'm using samsung,burst-clock-frequency = <1000000000> so this should be
> okay. That is 1080p resolution.

Yes, correct.

>>> When in doubt, try and use i2ctransfer to read out register 0x300
>>> repeatedly, that's DSI RX error counter register. See if the DSI error
>>> count increments.
> 
> If the bridge is not working the registers look like this:
> 300: c0800000
> 464: 00000001
> 
> they are not changing and stay like that.
> 
> If the bridge is actually running they are like
> 300: c08000d3
> 464: 00000000
> 
> and are also not changing.

Uh ... that looks like the whole chip clock tree somehow locked up .

Thinking about this, I once did force the DSIM into 24 MHz mode (there 
is PLL bypass setting, where the DSIM uses 24 MHz serializer clock 
directly for the DSI HS clock) or something close, it was enough to 
drive a low resolution panel. But the upside was, with a 200 MHz 5Gsps 
scope set to AC-coupling and 10x probe, I could discern the traffic on 
DSI data lane and decode it by hand. The nice thing is, you could 
trigger on 1V2 LP mode, so you know where the packet starts. The 
downside is, if you have multiple data lanes, the packet is spread 
across them.

You could also tweak tc_edp_atomic_check()/tc_edp_mode_valid() and force 
only low(er) resolution modes of your DP panel right from the start, so 
you wouldn't need that much DSI bandwidth. Maybe you could reach some 
mode where your equipment is enough to analyze the traffic by hand ?

>>>> Are you running the DSIM host from 24MHz refclock?
>>>
>>> Yes, I did not modify imx8mp.dtsi mipi_dsi node
>>> samsung,pll-clock-frequency = <24000000>; in any way , so that's 24 MHz
>>> base.
>>
>> How shall we proceed with this series ?
> 
> Would you mind rebasing and fix patch 2/6 regarding the adjusted mode?

I wouldn't ... and I totally forgot about that, even if I have a V2 
patch in my tree already. I'll send it out, thanks for the reminder.

> BTW: Patch 3/6 (dropping line_pixel_subtract) is actually necessary for even
> running test mode (tc358767.test=1), so this fixes an actual problem as well.

:)
