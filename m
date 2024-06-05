Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC438FD2E7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDB910E208;
	Wed,  5 Jun 2024 16:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Db3NN7Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC5A10E208
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:25:17 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CB84887A09;
 Wed,  5 Jun 2024 18:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717604715;
 bh=PlffDnV+IatIR3YiV4tWA1wJaSBnx3vLAwCbL0lJ/3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Db3NN7LtvG1hsDewhAU1A1r9rqRhv/MkGrvz4d9LCvAMcgq4vqZisHS7ld2kNKNb7
 8NwiproXm815FGxMX4HQdr2tFNyHCqT87x53aja+lEmEhxgX9HF2DAuaJ75RzbIIhu
 O2yzNl9+Z8I6XcZpEq0AQvGZvX7HR9H3ZL+mwauG25o3w7+mej8XV/uGjgc2hh/ZJ3
 sAS6BtX1eXdV1qimzCc8wp0qXgX5+FhUSHxNzwhxuz5D+IzKh2d+Pyk5xNuSh16I1+
 5aO8S5AIh6RXRPNSdd27w1ETcPXoL8vfgiOvcw78mPR5lw3CQ9nBk9Cy9CjwAcn/3l
 zyl9kVhDaRa9g==
Message-ID: <d899b518-404e-4cff-98a9-2c6d8c0d068a@denx.de>
Date: Wed, 5 Jun 2024 18:25:13 +0200
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
 <3228734.5fSG56mABF@steina-w> <c0199d62-1b0d-488b-a54e-0b3512be1c9d@denx.de>
 <1938447.taCxCBeP46@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1938447.taCxCBeP46@steina-w>
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

On 6/5/24 12:52 PM, Alexander Stein wrote:
> Hi Marek,

Hi,

>>>>> The accuracy degrades with each call, until a full kHz frequency is reached,
>>>>> because drm_display_mode.clock only accounts for kHz, but the PLL
>>>>> calculation takes Hz into account.
>>>>
>>>> Hmmmmm, I need to take a closer look at this one.
>>>>
>>>> Do you have any quick hints ?
>>
>> So the fix is real simple, try this extra diff:
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c
>> b/drivers/gpu/drm/bridge/tc358767.c
>> index 32639865fea07..5d76285dcf245 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1629,7 +1629,7 @@ static int tc_dpi_atomic_check(struct drm_bridge
>> *bridge,
>>           int ret;
>>
>>           ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
>> -                             crtc_state->adjusted_mode.clock * 1000,
>> +                             crtc_state->mode.clock * 1000,
>>                                 &adjusted_clock, NULL);
>>           if (ret)
>>                   return ret;
>> @@ -1653,7 +1653,7 @@ static int tc_edp_atomic_check(struct drm_bridge
>> *bridge,
>>           int ret;
>>
>>           ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
>> -                             crtc_state->adjusted_mode.clock * 1000,
>> +                             crtc_state->mode.clock * 1000,
>>                                 &adjusted_clock, NULL);
>>           if (ret)
>>                   return ret;
>>
> 
> Ah, right. That seems simple. But I noticed another thing:
> The TC9595 PLL is configured to 147333333 while the lcdif configures
> the display clock to 147333000, the value actually stored in
> adjusted_mode.clock. I do not know if this small difference can be neglected.

Good point, please see (*) below.

>>> No, sorry. I'm not sure about those VFIFO overruns/underruns you mentioned
>>> in the commit message. Does this maybe only apply to DPI input?
>>
>> No, this actually happens with DSI input in both DPI and (e)DP output
>> modes, it is only really well visible in some resolutions it seems.
> 
> Ah, i see.
> 
>>> At least for 148.5MHz (1080p) apparently it is not possible to that
>>> exact clock anyway.
>>
>> Right, which sucks, but the TC9595 datasheet explicitly states that the
>> FRMSYNC mode should always be enabled (and is apparently force-enabled
>> on newer bridge chips with no option to disable it) unless the Pixel
>> clock are sourced from DSI clock (which is never the case with this
>> driver). That's what the [1] patch does.
>>
>> But messing with the HFP isn't really working for all resolutions, so
>> this patch instead adjusts the input pixel clock to fit the Pixel PLL
>> limits, which avoids the VFIFO issues altogether. And that makes the
>> FRMSYNC mode work for all kinds of resolutions.
> 
> I can't tell if VFIFO issue arise here, because I'm currently trying to
> get a reliable and stable output for DP.

What kind of problem do you observe on your side exactly ? (I think the 
answer to this is at the end). I've spent quite a while on this, so 
maybe I ran into that before.

> The documentation is somewhat
> limited, but FRAMSYNC seems almost necessary in any case, unless you
> utilize DSI bus 100% for this device to get the correct display timings
> using DSI packets.

That's not quite what it says.

I don't know what kind of datasheet you have and for which exact bridge, 
but look at Section 4, block diagram.

The FRMSYNC operates on the LS_Clk domain side, right of V_FiFo . It 
reads lines from the VFIFO and sends them out of the DP as DP packets. 
As long as the input into the VFIFO delivers the lines such that the 
VFIFO does not overflow or underflow, everything is fine.

The DSI side starts to write line into the VFIFO on HSS (Hsync start), 
see "DSI Packets for Video Transmission". HSE (Hsync end) packet is 
ignored, see "Video Transmission" . Two consecutive HSS must be sent 
with the same time between the two as time between two lines configured 
into FRMSYNC timing generator.

However, I _think_ (*) if the time between two HSS is slightly longer 
than what the FRMSYNC expects, the FRMSYNC stretches the HFP slightly 
for each frame and we won't run into any problems (see 4.12 Clocks and 
search for keyword "approximated", they talk about close approximation 
there).

>> You might be wondering why not source pixel clock from DSI HS clock and
>> disable FRMSYNC. For one thing, this would limit the ability to pick
>> faster DSI HS clock and make good use of the DSI burst mode (the DSI
>> link can go into LP state after transmitting entire line of pixel data
>> for longer with faster DSI HS clock). The other thing is, to drive the
>> Pixel PLL (not to be confused with pixel clock) from DSI HS clock, the
>> DSI HS clock have to be set to specific clock rates (13*4*7=364 MHz and
>> 13*4*9=468 MHz), which is really limiting.

btw. those 13 MHz match one of RefClk input options, the *4 is from 
HSBY4 divider and 7 and 9 come from MODE[1] strap option dividers.

> This is not mentioned in the datasheet at all, but just in a small note
> in the calculation sheet, without any description. On a different platform
> DSI HS clock running at 445.5MHz seems also possible, even if unsupported.

You can use arbitrary DSI HS clock as long as you don't derive RefClk 
from DSI HS clock (and RefClk feeds Pixel PLL).

>>>>> BTW: Which platform are you testing on?
>>>>
>>>> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
>>>>
>>>> The TC9595 is 2nd generation (automotive?) replacement for TC358767 (1st
>>>> generation replacement is TC358867) .
>>>
>>> Same here. But fail to get output on a DP monitor if I'm running from
>>> external refclk. Using DSICLK/4 seems necessary for some reason, but it
>>> is very unreliable to get a proper image.
>>
>> Do you have all the patches in place ? This is what you should have:
>>
>> drm/bridge: tc358767: Enable FRMSYNC timing generator
>> drm: bridge: samsung-dsim: Initialize bridge on attach
>> drm/bridge: tc358767: Reset chip again on attach
>> clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate
>> drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
>> drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
>> drm/bridge: tc358767: Check if fully initialized before signalling HPD
>> event via IRQ
>> drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation
>> and enablement
>> drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode clock
>> drm/bridge: tc358767: Drop line_pixel_subtract
>> drm/bridge: tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS
>> drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
>> Revert "drm/bridge: tc358767: Set default CLRSIPO count"
>> drm/bridge: tc358767: Add configurable default preemphasis
> 
> Thanks, I was missing the lcdif and clk-imx8mp patches. I saw them separately
> on the mailing list, but didn't realize would need them.
> 
>> I only use external refclk, at 26 MHz.
> 
> Same for me, difference is I'm using a crystal oscillator instead of
> CCM_CLKOUT. And yes, this is the TQ platform TQMa8MPxL/MBa8MPxL.

I also have a SoM modified to use Xtal, but it seems unnecessary, the 
CCM output saves on BoM too.

[...]

> Thanks for sharing, despite the fixed-clock and IMX8MP_CLK_CLKOUT2 this
> looks very much the same. Unfortunately I get an output on DP just sometimes.
> As Bit 0 in register 0x464 is not cleared, I suspect the bridge is not
> recognizing DSI (VSYNC) packets properly :(
> At some point this bridge is lenient, but picky otherwise.

You did strap the bridge such that it sources RefClk from the Xtal, 
right (MODE[0] = 0 -> RefClk)? I haven't seen VFUEN[0] lock up like that 
before.

You could try and force the bridge to generate test pattern instead of 
DSI_RX, edit the tc358767.c -> locate tc_dsi_rx_enable() -> locate 
tc_test_pattern -> make sure the branch option value |= 
DP0_VIDSRC_COLOR_BAR is activated . Rebuild and retest .

This will allow you to validate the TC358767<->DP connection separately 
from the DSI<->TC358767 connection . This is what I did when I was 
debugging DSI issues on another board with TC9595 . Once you are sure 
one side of the connection is stable, you can focus on the other side.

Also, with the COLOR_BAR mode in place, try experimenting with the DP 
preemphasis tuning and possibly the initial differential voltage tuning 
(it is in the same registers as the preemphasis). Maybe you have link 
quality issues and the link is borderline, it does train and link up, 
but fails right after. Increasing the preemphasis and differential 
voltage might help stabilize it.

Also, I use these to fiddle with the TC9595 (in my case) DP timing 
registers, the first one reads them all out, the second one writes them. 
Aadjust values as needed, the values below are from whatever experiment 
so they are likely invalid. Make specific note of the last 0x01 on the 
second line, that's the VFUEN update:
$ i2ctransfer -f -y 2 w2@0xf 0x4 0x50 r24
$ i2ctransfer -f -y 2 w26@0xf 0x4 0x50   0x10 0x01 0x50 0x01   0x20 0x00 
0x50 0x00   0x80 0x07 0x20 0x00   0x06 0x00 0x1a 0x00   0xb0 0x04 0x03 
0x00   0x01 0x00 0x00 0x00

>> // This is to let LCDIF configure the pixel clock,
>> // it removes the fixed Video PLL configuration from DT
>> &media_blk_ctrl {
>>          assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
>>                            <&clk IMX8MP_CLK_MEDIA_APB>,
>>                            <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>>                            <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>;
>>          assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
>>                                   <&clk IMX8MP_SYS_PLL1_800M>,
>>                                   <&clk IMX8MP_VIDEO_PLL1_OUT>,
>>                                   <&clk IMX8MP_SYS_PLL3_OUT>;
>>          assigned-clock-rates = <500000000>, <200000000>,
>>                                 <0>, <0>;
>> };
> 
> I get the intention, but this might change once you want to enable ISP/DWE.
> But that is a different matter for now.

ACK

[...]
