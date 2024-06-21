Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E343911902
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 05:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D1310E275;
	Fri, 21 Jun 2024 03:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="XDkvqqGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF87C10E275
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 03:30:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 46EC687EED;
 Fri, 21 Jun 2024 05:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718940628;
 bh=Yo0moB/Y/jPzjElekH8O0+0uaD75l1hwEuPI9CbU8ys=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=XDkvqqGHsPqX1shalrfdZEVNKup08hj6Lsw6dAiTEZtjBRJzaGoLXejHSEN5qKTJs
 /WHsOO5APX8xVDa7racz8b7HfMUIeGtW/oR+9IB8cHB2DSKmHzidzL1T/uF2YASI/W
 Xri6ETSNGSz+PiA8NbbzZuFjw9RxRl9Sb28dENUqdrGsCGgwY1W6Wf4ShWK6bh+6mS
 CxeOjLomt5tl+VYUaMQcH4nhnOtsATwqyKPKsNvha41LQaCQrjvgX2JwbweLFnvwkA
 5aLsZAUvUEDwqS1gpLZpQJEFLpMNdT9bfio3mDYa9MCse0QYYkELbVSOixKr2g7yD1
 M65tWgJCihS2g==
Message-ID: <f0d85728-2e19-4011-bfdc-0bca965e0b35@denx.de>
Date: Fri, 21 Jun 2024 05:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: tc358767: Use tc_pxl_pll_calc() to
 correct adjusted_mode clock
From: Marek Vasut <marex@denx.de>
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
 <1938447.taCxCBeP46@steina-w> <d899b518-404e-4cff-98a9-2c6d8c0d068a@denx.de>
 <4599102.cEBGB3zze1@steina-w> <47ec3645-1584-467f-a2c9-d2a8debb0243@denx.de>
Content-Language: en-US
In-Reply-To: <47ec3645-1584-467f-a2c9-d2a8debb0243@denx.de>
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

On 6/11/24 6:45 PM, Marek Vasut wrote:
> On 6/6/24 12:10 PM, Alexander Stein wrote:
>> Hi Marek,
> 
> Hello Alexander,
> 
> sorry for the delay.
> 
>>>>>> At least for 148.5MHz (1080p) apparently it is not possible to that
>>>>>> exact clock anyway.
>>>>>
>>>>> Right, which sucks, but the TC9595 datasheet explicitly states that 
>>>>> the
>>>>> FRMSYNC mode should always be enabled (and is apparently force-enabled
>>>>> on newer bridge chips with no option to disable it) unless the Pixel
>>>>> clock are sourced from DSI clock (which is never the case with this
>>>>> driver). That's what the [1] patch does.
>>>>>
>>>>> But messing with the HFP isn't really working for all resolutions, so
>>>>> this patch instead adjusts the input pixel clock to fit the Pixel PLL
>>>>> limits, which avoids the VFIFO issues altogether. And that makes the
>>>>> FRMSYNC mode work for all kinds of resolutions.
>>>>
>>>> I can't tell if VFIFO issue arise here, because I'm currently trying to
>>>> get a reliable and stable output for DP.
>>>
>>> What kind of problem do you observe on your side exactly ? (I think the
>>> answer to this is at the end). I've spent quite a while on this, so
>>> maybe I ran into that before.
>>
>> DP output either works as expected or not at all. The monitor stays in
>> sleep mode then. I only notice that VFUEN is not cleared in this case.
> 
> Let's continue this one at the end of this thread.
> 
>>>> The documentation is somewhat
>>>> limited, but FRAMSYNC seems almost necessary in any case, unless you
>>>> utilize DSI bus 100% for this device to get the correct display timings
>>>> using DSI packets.
>>>
>>> That's not quite what it says.
>>>
>>> I don't know what kind of datasheet you have and for which exact bridge,
>>> but look at Section 4, block diagram.
>>
>> I have the datasheet 0.1 and 1.1 for TC9595 available. Also the
>> TC358767A_867XBG v37 spreadsheet.
> 
> I have rev. 0.1 and rev. 1.3 datasheets for TC9595 .
> I also have TC9595 DSI-to-DPI timing spreadsheet.
> 
>>> The FRMSYNC operates on the LS_Clk domain side, right of V_FiFo . It
>>> reads lines from the VFIFO and sends them out of the DP as DP packets.
>>> As long as the input into the VFIFO delivers the lines such that the
>>> VFIFO does not overflow or underflow, everything is fine.
>>>
>>> The DSI side starts to write line into the VFIFO on HSS (Hsync start),
>>> see "DSI Packets for Video Transmission". HSE (Hsync end) packet is
>>> ignored, see "Video Transmission" . Two consecutive HSS must be sent
>>> with the same time between the two as time between two lines configured
>>> into FRMSYNC timing generator.
>>>
>>> However, I _think_ (*) if the time between two HSS is slightly longer
>>> than what the FRMSYNC expects, the FRMSYNC stretches the HFP slightly
>>> for each frame and we won't run into any problems (see 4.12 Clocks and
>>> search for keyword "approximated", they talk about close approximation
>>> there).
>>
>> Which datasheet do you have available? It might just be a typo, but the
>> Clocks section is 4.13 in my case.
> 
> Here I used the rev. 1.3 from 20230727 . Definitely section 4.12 in this 
> datasheet, maybe they removed a chapter since ? Here is section 4 list:
> 
> - MIPI DSI Rx
> - MIPI DPI Rx
> - I2S Audio Rx
> - DisplayPortTM Tx
> - Parallel Output Mode
> - GPIO Interface
> - I2C Slave Interface
> - Interrupt Interface
> - Internal Test Pattern (Color Bar) Generator
> - Reset
> - Boot-Strap & State of TC9595XBG chip after Reset
> - Clocks
> 
>>>>> You might be wondering why not source pixel clock from DSI HS clock 
>>>>> and
>>>>> disable FRMSYNC. For one thing, this would limit the ability to pick
>>>>> faster DSI HS clock and make good use of the DSI burst mode (the DSI
>>>>> link can go into LP state after transmitting entire line of pixel data
>>>>> for longer with faster DSI HS clock). The other thing is, to drive the
>>>>> Pixel PLL (not to be confused with pixel clock) from DSI HS clock, the
>>>>> DSI HS clock have to be set to specific clock rates (13*4*7=364 MHz 
>>>>> and
>>>>> 13*4*9=468 MHz), which is really limiting.
>>>
>>> btw. those 13 MHz match one of RefClk input options, the *4 is from
>>> HSBY4 divider and 7 and 9 come from MODE[1] strap option dividers.
>>>
>>>> This is not mentioned in the datasheet at all, but just in a small note
>>>> in the calculation sheet, without any description. On a different 
>>>> platform
>>>> DSI HS clock running at 445.5MHz seems also possible, even if 
>>>> unsupported.
>>>
>>> You can use arbitrary DSI HS clock as long as you don't derive RefClk
>>> from DSI HS clock (and RefClk feeds Pixel PLL).
>>
>> Yes, that's what I would expect as well, but that other platform was
>> configured to derive RefClk from DSI/4.
> 
> I think that's the HSCKBY4 thing, the DSI HS clock are divided by 4 and 
> then by either 7 or 9 to achieve 13 MHz RefClk input.
> 
> This may be achievable with some effort for DSI-to-DPI mode, but for the 
> DSI-to-(e)DP mode with aux channel this is currently far away. And with 
> the limitations this imposes on the DSI clock, I am not particularly 
> interested in this mode of operation, sourcing the RefClk from Xtal as 
> the driver assumes right now does provide much more flexibility.
> 
>>>>>>>> BTW: Which platform are you testing on?
>>>>>>>
>>>>>>> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
>>>>>>>
>>>>>>> The TC9595 is 2nd generation (automotive?) replacement for 
>>>>>>> TC358767 (1st
>>>>>>> generation replacement is TC358867) .
>>>>>>
>>>>>> Same here. But fail to get output on a DP monitor if I'm running from
>>>>>> external refclk. Using DSICLK/4 seems necessary for some reason, 
>>>>>> but it
>>>>>> is very unreliable to get a proper image.
>>>>>
>>>>> Do you have all the patches in place ? This is what you should have:
>>>>>
>>>>> drm/bridge: tc358767: Enable FRMSYNC timing generator
>>>>> drm: bridge: samsung-dsim: Initialize bridge on attach
>>>>> drm/bridge: tc358767: Reset chip again on attach
>>>>> clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure 
>>>>> parent rate
>>>>> drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
>>>>> drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
>>>>> drm/bridge: tc358767: Check if fully initialized before signalling HPD
>>>>> event via IRQ
>>>>> drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation
>>>>> and enablement
>>>>> drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct 
>>>>> adjusted_mode clock
>>>>> drm/bridge: tc358767: Drop line_pixel_subtract
>>>>> drm/bridge: tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS
>>>>> drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
>>>>> Revert "drm/bridge: tc358767: Set default CLRSIPO count"
>>>>> drm/bridge: tc358767: Add configurable default preemphasis
>>>>
>>>> Thanks, I was missing the lcdif and clk-imx8mp patches. I saw them 
>>>> separately
>>>> on the mailing list, but didn't realize would need them.
>>>>
>>>>> I only use external refclk, at 26 MHz.
>>>>
>>>> Same for me, difference is I'm using a crystal oscillator instead of
>>>> CCM_CLKOUT. And yes, this is the TQ platform TQMa8MPxL/MBa8MPxL.
>>>
>>> I also have a SoM modified to use Xtal, but it seems unnecessary, the
>>> CCM output saves on BoM too.
>>
>> That's right, but Xtal is what I have right now. A modification for
>> CCM_CLKOUT wouldbe possible if clock drift is an issue here.
> 
> I think the TC9595 does have rather stringent requirements on the Xtal 
> indeed, although it also seems the bridge is very tolerant about those 
> input clock :)
> 
>>> [...]
>>>
>>>> Thanks for sharing, despite the fixed-clock and IMX8MP_CLK_CLKOUT2 this
>>>> looks very much the same. Unfortunately I get an output on DP just 
>>>> sometimes.
>>>> As Bit 0 in register 0x464 is not cleared, I suspect the bridge is not
>>>> recognizing DSI (VSYNC) packets properly :(
>>>> At some point this bridge is lenient, but picky otherwise.
>>>
>>> You did strap the bridge such that it sources RefClk from the Xtal,
>>> right (MODE[0] = 0 -> RefClk)? I haven't seen VFUEN[0] lock up like that
>>> before.
>>
>> Yes, MODE[0] is pulled down. Otherwise I2C is not even possible.
>> I've tried using MODE[0]=1 with a fixed DSI HS clock, but without luck.
> 
> You would have to have DSI clock running before releasing the bridge 
> from reset. I did manage to get this working at some point with 
> STM32MP15xx DSI host using crude hackage, but I don't have any interest 
> in supporting this mode. All the hardware I have available has external 
> RefClk.
> 
>>> You could try and force the bridge to generate test pattern instead of
>>> DSI_RX, edit the tc358767.c -> locate tc_dsi_rx_enable() -> locate
>>> tc_test_pattern -> make sure the branch option value |=
>>> DP0_VIDSRC_COLOR_BAR is activated . Rebuild and retest .
>>>
>>> This will allow you to validate the TC358767<->DP connection separately
>>> from the DSI<->TC358767 connection . This is what I did when I was
>>> debugging DSI issues on another board with TC9595 . Once you are sure
>>> one side of the connection is stable, you can focus on the other side.
>>>
>>> Also, with the COLOR_BAR mode in place, try experimenting with the DP
>>> preemphasis tuning and possibly the initial differential voltage tuning
>>> (it is in the same registers as the preemphasis). Maybe you have link
>>> quality issues and the link is borderline, it does train and link up,
>>> but fails right after. Increasing the preemphasis and differential
>>> voltage might help stabilize it.
>>
>> Thanks, but as far I can tell I don't have any issues on the DP side.
>> With command line parameter 'tc358767.test=1' in place I get that test
>> pattern with 100% success rate. So I consider my problem on the DSI 
>> side only.
> 
> Try tuning the CLRSIPO values up and down (probably between 3..25), does 
> that help ?
> 
>> As FVUEN is cleared at the next VSYNC event I suspect the DSI timings
>> are (slightly) off, but unfortunately I don't have equipment to check
>> DSI signal quality/timings.
> 
> As long as the LCDIFv3 pixel clock are equal or slightly slower than 
> what the TC9595 PixelPLL generates, AND, DSIM serializer has enough 
> bandwidth on the DSI bus (i.e. set the bus to 1 GHz, the TC9595 DSI RX 
> cannot go any faster), you should have no issues on that end.
> 
> When in doubt, try and use i2ctransfer to read out register 0x300 
> repeatedly, that's DSI RX error counter register. See if the DSI error 
> count increments.
> 
>> Are you running the DSIM host from 24MHz refclock?
> 
> Yes, I did not modify imx8mp.dtsi mipi_dsi node 
> samsung,pll-clock-frequency = <24000000>; in any way , so that's 24 MHz 
> base.

How shall we proceed with this series ?
