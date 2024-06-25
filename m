Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40984915BF9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 04:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1F10E146;
	Tue, 25 Jun 2024 02:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="sjgXhs6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E460610E146
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 02:02:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DA77C86E40;
 Tue, 25 Jun 2024 04:02:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719280927;
 bh=nsEi7RNIulK1pvVyvHXkzee9w6X1Ye0ka9Tc4jevF3s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sjgXhs6IutV8XsVAzcA4/6CvlqF9Zv+2IN3br5GdDtzEd2iZb37xzJb/oi5gk2Fht
 x/KvHDUVNBk0CJb6XhyRu7JJt+sb3BvetdHu/pEhd1SMZHFIxTmAUN+T+W7JhlN5PC
 Q0zj/4CIZvzjhuR8UNFRH8NX75IpE+AXCLWtbRxk03rno9fyzgLY8P2nfOz2A6IFBO
 Icjac5f7qLM7C5p3Uqs+9FlkSWImzc1//x9D96HRE75m74j+vuq1peyQzmK5yJrGg5
 TMaRd75pZ4DtIsn+IQRMBL/pGkqPJJ7Z+q6SspnXtoD643yaLrmI1I4rorX0kXqeFI
 7f6M6e8qmV3CA==
Message-ID: <3db8424d-9880-4e9f-8441-26139a44dba8@denx.de>
Date: Tue, 25 Jun 2024 02:33:53 +0200
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
 <4623820.cEBGB3zze1@steina-w> <71f042ba-63f4-402c-8be2-3bfe6fe91a0b@denx.de>
 <3760061.MHq7AAxBmi@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3760061.MHq7AAxBmi@steina-w>
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

On 6/24/24 11:26 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Freitag, 21. Juni 2024, 16:54:51 CEST schrieb Marek Vasut:
>> On 6/21/24 12:32 PM, Alexander Stein wrote:
>>
>> Hi,
>>
>> skipping the parts where I would simply write "OK" ...
>>
>>>>>> As FVUEN is cleared at the next VSYNC event I suspect the DSI timings
>>>>>> are (slightly) off, but unfortunately I don't have equipment to check
>>>>>> DSI signal quality/timings.
>>>>>
>>>>> As long as the LCDIFv3 pixel clock are equal or slightly slower than
>>>>> what the TC9595 PixelPLL generates, AND, DSIM serializer has enough
>>>>> bandwidth on the DSI bus (i.e. set the bus to 1 GHz, the TC9595 DSI RX
>>>>> cannot go any faster), you should have no issues on that end.
>>>
>>> I'm using samsung,burst-clock-frequency = <1000000000> so this should be
>>> okay. That is 1080p resolution.
>>
>> Yes, correct.
>>
>>>>> When in doubt, try and use i2ctransfer to read out register 0x300
>>>>> repeatedly, that's DSI RX error counter register. See if the DSI error
>>>>> count increments.
>>>
>>> If the bridge is not working the registers look like this:
>>> 300: c0800000
>>> 464: 00000001
>>>
>>> they are not changing and stay like that.
>>>
>>> If the bridge is actually running they are like
>>> 300: c08000d3
>>> 464: 00000000
>>>
>>> and are also not changing.
>>
>> Uh ... that looks like the whole chip clock tree somehow locked up .
>>
>> Thinking about this, I once did force the DSIM into 24 MHz mode (there
>> is PLL bypass setting, where the DSIM uses 24 MHz serializer clock
>> directly for the DSI HS clock) or something close, it was enough to
>> drive a low resolution panel. But the upside was, with a 200 MHz 5Gsps
>> scope set to AC-coupling and 10x probe, I could discern the traffic on
>> DSI data lane and decode it by hand. The nice thing is, you could
>> trigger on 1V2 LP mode, so you know where the packet starts. The
>> downside is, if you have multiple data lanes, the packet is spread
>> across them.
>>
>> You could also tweak tc_edp_atomic_check()/tc_edp_mode_valid() and force
>> only low(er) resolution modes of your DP panel right from the start, so
>> you wouldn't need that much DSI bandwidth. Maybe you could reach some
>> mode where your equipment is enough to analyze the traffic by hand ?
> 
> I think I got it running now. Apparently there were different, independent
> problems which you addressed by your series.

Oh, glad I could help.

> Unfortunately the patch
> 'tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS' introduced a new problem
> (at least for me). For the record I'm running the following patch stack based
> on next-20240621:

Thanks for tracking it down. I can drop that one 
MIPI_DSI_CLOCK_NON_CONTINUOUS patch from the series and do a V4. Would 
that work for you ? At least there would be some improvement to the 
driver and I can analyze the MIPI_DSI_CLOCK_NON_CONTINUOUS issue in 
detail separately.

> * Add linux-next specific files for 20240621
> * arm64: dts: imx8mp: Add TC9595 DSI-DP bridge on TQMa8MPxL/MBa8MPxL
> * drm: bridge: samsung-dsim: Initialize bridge on attach
> * drm/bridge: tc358767: Reset chip again on attach
> * drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
> * drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation and enablement
> * drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode clock
> * drm/bridge: tc358767: Drop line_pixel_subtract
> * drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
> * Revert "drm/bridge: tc358767: Set default CLRSIPO count"
> 
> All of them are needed, reverting/dropping a single one results in a
> non-functioning bridge.

Thank you for testing !
