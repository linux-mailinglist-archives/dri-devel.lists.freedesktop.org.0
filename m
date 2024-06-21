Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057091227A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D51810F145;
	Fri, 21 Jun 2024 10:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="a/SlPaq+";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GAOeV98i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3216C10F145
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1718965953; x=1750501953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jt1quff2Nmyj7QmXokpYg1gCG1yp1em2T5/BoosmT60=;
 b=a/SlPaq+m3hWIqKVuqAg96gmP3duhJKwBv+46zA4Kd2d323YAXpctBjP
 3Z73I7n8K0NisLkjlnQZdMnU5zG8GvaK2RedHD2/x8Do+R12C1NuGeSYD
 BzFYBmNh7SDr+7Y7ABt2DMt5+GNEHmShrpCLBULDN0ebs8TKupyQPnH5f
 WE1BlK3YVNLIcP7N3wLJqdw2UCogkXrRwWVYJXqu2GzmW3pqMsouGlk4E
 t19nipc/WKbMckmY/86EobJmVROVJ1tbmmvFmFEcDXl7U1B+ZQyu2YGxL
 FdUN45/NQyw2OnNZcnjhJv16KquHQqmsVk/EUUI2FykXhlQvQaUlbe0Fs A==;
X-CSE-ConnectionGUID: fQnaMeaaRny1jY3J9DNqbQ==
X-CSE-MsgGUID: yHACEzuJSMuKDgmlgkIoqA==
X-IronPort-AV: E=Sophos;i="6.08,254,1712613600"; d="scan'208";a="37520038"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 21 Jun 2024 12:32:31 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A65661660DB; Fri, 21 Jun 2024 12:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1718965946;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jt1quff2Nmyj7QmXokpYg1gCG1yp1em2T5/BoosmT60=;
 b=GAOeV98iS9UFLike2YwymT7dDV++Kzns24twiZeI6jFXF8EPcXjbQiN3g1Vw5ZleSkQt44
 Y34aKHJNnjUV0Z9SdAMkELyL3YeBgWLTZbQm00YQrwV0duZ48GF8GEQp5SZzAqNQaVOjqh
 W198LCkaSSGxUQ1JEJeUG4/jw058vV6NEaq0o2iIRp6Z+YJ1GUTOUCDVMCMkmqeawj5TkE
 XUrMR8f2Gm1Ieb/LYno9UZMKvS1P4VhH89DtTlIT3RQc2j5/dsJ/3NKuuqXLGW9hk6XKWx
 A2TAsfsKCiOEvt3ZQOXz3JCftiPsSocyo/nbE7fc6aHJ7GqJBsR40LbmczUzxg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com
Subject: Re: [PATCH 2/6] drm/bridge: tc358767: Use tc_pxl_pll_calc() to
 correct adjusted_mode clock
Date: Fri, 21 Jun 2024 12:32:26 +0200
Message-ID: <4623820.cEBGB3zze1@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <f0d85728-2e19-4011-bfdc-0bca965e0b35@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <47ec3645-1584-467f-a2c9-d2a8debb0243@denx.de>
 <f0d85728-2e19-4011-bfdc-0bca965e0b35@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Marek,

Am Freitag, 21. Juni 2024, 05:30:26 CEST schrieb Marek Vasut:
> On 6/11/24 6:45 PM, Marek Vasut wrote:
> > On 6/6/24 12:10 PM, Alexander Stein wrote:
> >> Hi Marek,
> >=20
> > Hello Alexander,
> >=20
> > sorry for the delay.
> >=20
> >>>>>> At least for 148.5MHz (1080p) apparently it is not possible to that
> >>>>>> exact clock anyway.
> >>>>>
> >>>>> Right, which sucks, but the TC9595 datasheet explicitly states that=
=20
> >>>>> the
> >>>>> FRMSYNC mode should always be enabled (and is apparently force-enab=
led
> >>>>> on newer bridge chips with no option to disable it) unless the Pixel
> >>>>> clock are sourced from DSI clock (which is never the case with this
> >>>>> driver). That's what the [1] patch does.
> >>>>>
> >>>>> But messing with the HFP isn't really working for all resolutions, =
so
> >>>>> this patch instead adjusts the input pixel clock to fit the Pixel P=
LL
> >>>>> limits, which avoids the VFIFO issues altogether. And that makes the
> >>>>> FRMSYNC mode work for all kinds of resolutions.
> >>>>
> >>>> I can't tell if VFIFO issue arise here, because I'm currently trying=
 to
> >>>> get a reliable and stable output for DP.
> >>>
> >>> What kind of problem do you observe on your side exactly ? (I think t=
he
> >>> answer to this is at the end). I've spent quite a while on this, so
> >>> maybe I ran into that before.
> >>
> >> DP output either works as expected or not at all. The monitor stays in
> >> sleep mode then. I only notice that VFUEN is not cleared in this case.
> >=20
> > Let's continue this one at the end of this thread.
> >=20
> >>>> The documentation is somewhat
> >>>> limited, but FRAMSYNC seems almost necessary in any case, unless you
> >>>> utilize DSI bus 100% for this device to get the correct display timi=
ngs
> >>>> using DSI packets.
> >>>
> >>> That's not quite what it says.
> >>>
> >>> I don't know what kind of datasheet you have and for which exact brid=
ge,
> >>> but look at Section 4, block diagram.
> >>
> >> I have the datasheet 0.1 and 1.1 for TC9595 available. Also the
> >> TC358767A_867XBG v37 spreadsheet.
> >=20
> > I have rev. 0.1 and rev. 1.3 datasheets for TC9595 .
> > I also have TC9595 DSI-to-DPI timing spreadsheet.
> >=20
> >>> The FRMSYNC operates on the LS_Clk domain side, right of V_FiFo . It
> >>> reads lines from the VFIFO and sends them out of the DP as DP packets.
> >>> As long as the input into the VFIFO delivers the lines such that the
> >>> VFIFO does not overflow or underflow, everything is fine.
> >>>
> >>> The DSI side starts to write line into the VFIFO on HSS (Hsync start),
> >>> see "DSI Packets for Video Transmission". HSE (Hsync end) packet is
> >>> ignored, see "Video Transmission" . Two consecutive HSS must be sent
> >>> with the same time between the two as time between two lines configur=
ed
> >>> into FRMSYNC timing generator.
> >>>
> >>> However, I _think_ (*) if the time between two HSS is slightly longer
> >>> than what the FRMSYNC expects, the FRMSYNC stretches the HFP slightly
> >>> for each frame and we won't run into any problems (see 4.12 Clocks and
> >>> search for keyword "approximated", they talk about close approximation
> >>> there).
> >>
> >> Which datasheet do you have available? It might just be a typo, but the
> >> Clocks section is 4.13 in my case.
> >=20
> > Here I used the rev. 1.3 from 20230727 . Definitely section 4.12 in thi=
s=20
> > datasheet, maybe they removed a chapter since ? Here is section 4 list:
> >=20
> > - MIPI DSI Rx
> > - MIPI DPI Rx
> > - I2S Audio Rx
> > - DisplayPortTM Tx
> > - Parallel Output Mode
> > - GPIO Interface
> > - I2C Slave Interface
> > - Interrupt Interface
> > - Internal Test Pattern (Color Bar) Generator
> > - Reset
> > - Boot-Strap & State of TC9595XBG chip after Reset
> > - Clocks
> >=20
> >>>>> You might be wondering why not source pixel clock from DSI HS clock=
=20
> >>>>> and
> >>>>> disable FRMSYNC. For one thing, this would limit the ability to pick
> >>>>> faster DSI HS clock and make good use of the DSI burst mode (the DSI
> >>>>> link can go into LP state after transmitting entire line of pixel d=
ata
> >>>>> for longer with faster DSI HS clock). The other thing is, to drive =
the
> >>>>> Pixel PLL (not to be confused with pixel clock) from DSI HS clock, =
the
> >>>>> DSI HS clock have to be set to specific clock rates (13*4*7=3D364 M=
Hz=20
> >>>>> and
> >>>>> 13*4*9=3D468 MHz), which is really limiting.
> >>>
> >>> btw. those 13 MHz match one of RefClk input options, the *4 is from
> >>> HSBY4 divider and 7 and 9 come from MODE[1] strap option dividers.
> >>>
> >>>> This is not mentioned in the datasheet at all, but just in a small n=
ote
> >>>> in the calculation sheet, without any description. On a different=20
> >>>> platform
> >>>> DSI HS clock running at 445.5MHz seems also possible, even if=20
> >>>> unsupported.
> >>>
> >>> You can use arbitrary DSI HS clock as long as you don't derive RefClk
> >>> from DSI HS clock (and RefClk feeds Pixel PLL).
> >>
> >> Yes, that's what I would expect as well, but that other platform was
> >> configured to derive RefClk from DSI/4.
> >=20
> > I think that's the HSCKBY4 thing, the DSI HS clock are divided by 4 and=
=20
> > then by either 7 or 9 to achieve 13 MHz RefClk input.
> >=20
> > This may be achievable with some effort for DSI-to-DPI mode, but for th=
e=20
> > DSI-to-(e)DP mode with aux channel this is currently far away. And with=
=20
> > the limitations this imposes on the DSI clock, I am not particularly=20
> > interested in this mode of operation, sourcing the RefClk from Xtal as=
=20
> > the driver assumes right now does provide much more flexibility.

I don't like that mode as well, so I would be very happy to make this
reliable using RefClk from Xtal.

> >>>>>>>> BTW: Which platform are you testing on?
> >>>>>>>
> >>>>>>> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
> >>>>>>>
> >>>>>>> The TC9595 is 2nd generation (automotive?) replacement for=20
> >>>>>>> TC358767 (1st
> >>>>>>> generation replacement is TC358867) .
> >>>>>>
> >>>>>> Same here. But fail to get output on a DP monitor if I'm running f=
rom
> >>>>>> external refclk. Using DSICLK/4 seems necessary for some reason,=20
> >>>>>> but it
> >>>>>> is very unreliable to get a proper image.
> >>>>>
> >>>>> Do you have all the patches in place ? This is what you should have:
> >>>>>
> >>>>> drm/bridge: tc358767: Enable FRMSYNC timing generator
> >>>>> drm: bridge: samsung-dsim: Initialize bridge on attach
> >>>>> drm/bridge: tc358767: Reset chip again on attach
> >>>>> clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure=20
> >>>>> parent rate
> >>>>> drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
> >>>>> drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
> >>>>> drm/bridge: tc358767: Check if fully initialized before signalling =
HPD
> >>>>> event via IRQ
> >>>>> drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculat=
ion
> >>>>> and enablement
> >>>>> drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct=20
> >>>>> adjusted_mode clock
> >>>>> drm/bridge: tc358767: Drop line_pixel_subtract
> >>>>> drm/bridge: tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS
> >>>>> drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
> >>>>> Revert "drm/bridge: tc358767: Set default CLRSIPO count"
> >>>>> drm/bridge: tc358767: Add configurable default preemphasis
> >>>>
> >>>> Thanks, I was missing the lcdif and clk-imx8mp patches. I saw them=20
> >>>> separately
> >>>> on the mailing list, but didn't realize would need them.
> >>>>
> >>>>> I only use external refclk, at 26 MHz.
> >>>>
> >>>> Same for me, difference is I'm using a crystal oscillator instead of
> >>>> CCM_CLKOUT. And yes, this is the TQ platform TQMa8MPxL/MBa8MPxL.
> >>>
> >>> I also have a SoM modified to use Xtal, but it seems unnecessary, the
> >>> CCM output saves on BoM too.
> >>
> >> That's right, but Xtal is what I have right now. A modification for
> >> CCM_CLKOUT wouldbe possible if clock drift is an issue here.
> >=20
> > I think the TC9595 does have rather stringent requirements on the Xtal=
=20
> > indeed, although it also seems the bridge is very tolerant about those=
=20
> > input clock :)
> >=20
> >>> [...]
> >>>
> >>>> Thanks for sharing, despite the fixed-clock and IMX8MP_CLK_CLKOUT2 t=
his
> >>>> looks very much the same. Unfortunately I get an output on DP just=20
> >>>> sometimes.
> >>>> As Bit 0 in register 0x464 is not cleared, I suspect the bridge is n=
ot
> >>>> recognizing DSI (VSYNC) packets properly :(
> >>>> At some point this bridge is lenient, but picky otherwise.
> >>>
> >>> You did strap the bridge such that it sources RefClk from the Xtal,
> >>> right (MODE[0] =3D 0 -> RefClk)? I haven't seen VFUEN[0] lock up like=
 that
> >>> before.
> >>
> >> Yes, MODE[0] is pulled down. Otherwise I2C is not even possible.
> >> I've tried using MODE[0]=3D1 with a fixed DSI HS clock, but without lu=
ck.
> >=20
> > You would have to have DSI clock running before releasing the bridge=20
> > from reset. I did manage to get this working at some point with=20
> > STM32MP15xx DSI host using crude hackage, but I don't have any interest=
=20
> > in supporting this mode. All the hardware I have available has external=
=20
> > RefClk.

As said above I'm not interested in using DSI clock as RefClk, whether just
for pixel PLL or even for PLL_REF.

> >>> You could try and force the bridge to generate test pattern instead of
> >>> DSI_RX, edit the tc358767.c -> locate tc_dsi_rx_enable() -> locate
> >>> tc_test_pattern -> make sure the branch option value |=3D
> >>> DP0_VIDSRC_COLOR_BAR is activated . Rebuild and retest .
> >>>
> >>> This will allow you to validate the TC358767<->DP connection separate=
ly
> >>> from the DSI<->TC358767 connection . This is what I did when I was
> >>> debugging DSI issues on another board with TC9595 . Once you are sure
> >>> one side of the connection is stable, you can focus on the other side.
> >>>
> >>> Also, with the COLOR_BAR mode in place, try experimenting with the DP
> >>> preemphasis tuning and possibly the initial differential voltage tuni=
ng
> >>> (it is in the same registers as the preemphasis). Maybe you have link
> >>> quality issues and the link is borderline, it does train and link up,
> >>> but fails right after. Increasing the preemphasis and differential
> >>> voltage might help stabilize it.
> >>
> >> Thanks, but as far I can tell I don't have any issues on the DP side.
> >> With command line parameter 'tc358767.test=3D1' in place I get that te=
st
> >> pattern with 100% success rate. So I consider my problem on the DSI=20
> >> side only.
> >=20
> > Try tuning the CLRSIPO values up and down (probably between 3..25), doe=
s=20
> > that help ?

I did but without luck so far to make it reliable.

> >> As FVUEN is cleared at the next VSYNC event I suspect the DSI timings
> >> are (slightly) off, but unfortunately I don't have equipment to check
> >> DSI signal quality/timings.
> >=20
> > As long as the LCDIFv3 pixel clock are equal or slightly slower than=20
> > what the TC9595 PixelPLL generates, AND, DSIM serializer has enough=20
> > bandwidth on the DSI bus (i.e. set the bus to 1 GHz, the TC9595 DSI RX=
=20
> > cannot go any faster), you should have no issues on that end.

I'm using samsung,burst-clock-frequency =3D <1000000000> so this should be
okay. That is 1080p resolution.

> > When in doubt, try and use i2ctransfer to read out register 0x300=20
> > repeatedly, that's DSI RX error counter register. See if the DSI error=
=20
> > count increments.

If the bridge is not working the registers look like this:
300: c0800000
464: 00000001

they are not changing and stay like that.

If the bridge is actually running they are like
300: c08000d3
464: 00000000

and are also not changing.

> >> Are you running the DSIM host from 24MHz refclock?
> >=20
> > Yes, I did not modify imx8mp.dtsi mipi_dsi node=20
> > samsung,pll-clock-frequency =3D <24000000>; in any way , so that's 24 M=
Hz=20
> > base.
>=20
> How shall we proceed with this series ?

Would you mind rebasing and fix patch 2/6 regarding the adjusted mode?

BTW: Patch 3/6 (dropping line_pixel_subtract) is actually necessary for even
running test mode (tc358767.test=3D1), so this fixes an actual problem as w=
ell.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


