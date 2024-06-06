Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9020F8FE3D5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 12:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22B810E038;
	Thu,  6 Jun 2024 10:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="WZBVpd68";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ql3yg1vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8410E038
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1717668650; x=1749204650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EtryombmZLB1cj09pmy0DFhkGKtGIQSRnOSqMFUg48E=;
 b=WZBVpd68V9yoXgZGyKp3eJekKFdVZ4vxs3X+DxT0P/aSwsnGiOoBLp8P
 NZiXozJVzZpxMjYcx6TOhU+A724q/bqtC5ZYyRkGdTBVWf2L/2Q2VPI6t
 IJBBpk9/1Q9wGculpyICsQpfu8L2iPCjCAaqJ9isP65Nn3D44zqI/iLzw
 IE/bWw11EDWpxHkxPZCXZJuZlhXemAB8Dlub3PjkYfMMJfvh7f3yQVfrg
 3pOe1NoifOoRDGTwEykCwYle5d8mAii2RPvVh2XcwxmwP8aC/l7ht26Xf
 o7ap5U1syFLbo57Jws28QNzCY+zWVPomyPlz2YWQ3ZykyPfdAZQ5cRd/L A==;
X-CSE-ConnectionGUID: /edgGJy3TdmeIHdck/gpoA==
X-CSE-MsgGUID: ufaVPMJfSLSM8OFt7k10wg==
X-IronPort-AV: E=Sophos;i="6.08,218,1712613600"; d="scan'208";a="37257660"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 06 Jun 2024 12:10:46 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B20C16ED9B; Thu,  6 Jun 2024 12:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1717668642;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EtryombmZLB1cj09pmy0DFhkGKtGIQSRnOSqMFUg48E=;
 b=Ql3yg1vhBIGQd8i8TSYz0dpM0Bct1P62Xp1cdFrMKOvuaIfbfWjY7rIJqcDmXAfH4C69kV
 Do7Po9CSg061ajYqSBw5Rbzi76pf65zAE448XNUvdoGXOg7QefuEowNVN75602s2bQnukf
 4MvbEXN54fwgfScFyN98Qmkk1ddh1N+x7XwJbDYI410Ui0DycG7tZJnIrjzmzoBRYmhH0X
 enogda78vZyfeGQKh+JcSEXVZZQvcc+AOtZylIKqMCJOBG8zOdu6J6m4zwXklj0/LYLLmZ
 Pbybvrs6359tINWKl9bV7PUE/Ic0sm67SsOZWsjFL+HLsLlgvJgqKUqr2c7eHg==
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
Date: Thu, 06 Jun 2024 12:10:39 +0200
Message-ID: <4599102.cEBGB3zze1@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <d899b518-404e-4cff-98a9-2c6d8c0d068a@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <1938447.taCxCBeP46@steina-w> <d899b518-404e-4cff-98a9-2c6d8c0d068a@denx.de>
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

Am Mittwoch, 5. Juni 2024, 18:25:13 CEST schrieb Marek Vasut:
> On 6/5/24 12:52 PM, Alexander Stein wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> [snip]
> > Ah, right. That seems simple. But I noticed another thing:
> > The TC9595 PLL is configured to 147333333 while the lcdif configures
> > the display clock to 147333000, the value actually stored in
> > adjusted_mode.clock. I do not know if this small difference can be negl=
ected.
>=20
> Good point, please see (*) below.
>=20
> >>> No, sorry. I'm not sure about those VFIFO overruns/underruns you ment=
ioned
> >>> in the commit message. Does this maybe only apply to DPI input?
> >>
> >> No, this actually happens with DSI input in both DPI and (e)DP output
> >> modes, it is only really well visible in some resolutions it seems.
> >=20
> > Ah, i see.
> >=20
> >>> At least for 148.5MHz (1080p) apparently it is not possible to that
> >>> exact clock anyway.
> >>
> >> Right, which sucks, but the TC9595 datasheet explicitly states that the
> >> FRMSYNC mode should always be enabled (and is apparently force-enabled
> >> on newer bridge chips with no option to disable it) unless the Pixel
> >> clock are sourced from DSI clock (which is never the case with this
> >> driver). That's what the [1] patch does.
> >>
> >> But messing with the HFP isn't really working for all resolutions, so
> >> this patch instead adjusts the input pixel clock to fit the Pixel PLL
> >> limits, which avoids the VFIFO issues altogether. And that makes the
> >> FRMSYNC mode work for all kinds of resolutions.
> >=20
> > I can't tell if VFIFO issue arise here, because I'm currently trying to
> > get a reliable and stable output for DP.
>=20
> What kind of problem do you observe on your side exactly ? (I think the=20
> answer to this is at the end). I've spent quite a while on this, so=20
> maybe I ran into that before.

DP output either works as expected or not at all. The monitor stays in
sleep mode then. I only notice that VFUEN is not cleared in this case.

> > The documentation is somewhat
> > limited, but FRAMSYNC seems almost necessary in any case, unless you
> > utilize DSI bus 100% for this device to get the correct display timings
> > using DSI packets.
>=20
> That's not quite what it says.
>=20
> I don't know what kind of datasheet you have and for which exact bridge,=
=20
> but look at Section 4, block diagram.

I have the datasheet 0.1 and 1.1 for TC9595 available. Also the
TC358767A_867XBG v37 spreadsheet.

> The FRMSYNC operates on the LS_Clk domain side, right of V_FiFo . It=20
> reads lines from the VFIFO and sends them out of the DP as DP packets.=20
> As long as the input into the VFIFO delivers the lines such that the=20
> VFIFO does not overflow or underflow, everything is fine.
>=20
> The DSI side starts to write line into the VFIFO on HSS (Hsync start),=20
> see "DSI Packets for Video Transmission". HSE (Hsync end) packet is=20
> ignored, see "Video Transmission" . Two consecutive HSS must be sent=20
> with the same time between the two as time between two lines configured=20
> into FRMSYNC timing generator.
>=20
> However, I _think_ (*) if the time between two HSS is slightly longer=20
> than what the FRMSYNC expects, the FRMSYNC stretches the HFP slightly=20
> for each frame and we won't run into any problems (see 4.12 Clocks and=20
> search for keyword "approximated", they talk about close approximation=20
> there).

Which datasheet do you have available? It might just be a typo, but the
Clocks section is 4.13 in my case.

> >> You might be wondering why not source pixel clock from DSI HS clock and
> >> disable FRMSYNC. For one thing, this would limit the ability to pick
> >> faster DSI HS clock and make good use of the DSI burst mode (the DSI
> >> link can go into LP state after transmitting entire line of pixel data
> >> for longer with faster DSI HS clock). The other thing is, to drive the
> >> Pixel PLL (not to be confused with pixel clock) from DSI HS clock, the
> >> DSI HS clock have to be set to specific clock rates (13*4*7=3D364 MHz =
and
> >> 13*4*9=3D468 MHz), which is really limiting.
>=20
> btw. those 13 MHz match one of RefClk input options, the *4 is from=20
> HSBY4 divider and 7 and 9 come from MODE[1] strap option dividers.
>=20
> > This is not mentioned in the datasheet at all, but just in a small note
> > in the calculation sheet, without any description. On a different platf=
orm
> > DSI HS clock running at 445.5MHz seems also possible, even if unsupport=
ed.
>=20
> You can use arbitrary DSI HS clock as long as you don't derive RefClk=20
> from DSI HS clock (and RefClk feeds Pixel PLL).

Yes, that's what I would expect as well, but that other platform was
configured to derive RefClk from DSI/4.

> >>>>> BTW: Which platform are you testing on?
> >>>>
> >>>> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
> >>>>
> >>>> The TC9595 is 2nd generation (automotive?) replacement for TC358767 =
(1st
> >>>> generation replacement is TC358867) .
> >>>
> >>> Same here. But fail to get output on a DP monitor if I'm running from
> >>> external refclk. Using DSICLK/4 seems necessary for some reason, but =
it
> >>> is very unreliable to get a proper image.
> >>
> >> Do you have all the patches in place ? This is what you should have:
> >>
> >> drm/bridge: tc358767: Enable FRMSYNC timing generator
> >> drm: bridge: samsung-dsim: Initialize bridge on attach
> >> drm/bridge: tc358767: Reset chip again on attach
> >> clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent =
rate
> >> drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
> >> drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
> >> drm/bridge: tc358767: Check if fully initialized before signalling HPD
> >> event via IRQ
> >> drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation
> >> and enablement
> >> drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode c=
lock
> >> drm/bridge: tc358767: Drop line_pixel_subtract
> >> drm/bridge: tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS
> >> drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
> >> Revert "drm/bridge: tc358767: Set default CLRSIPO count"
> >> drm/bridge: tc358767: Add configurable default preemphasis
> >=20
> > Thanks, I was missing the lcdif and clk-imx8mp patches. I saw them sepa=
rately
> > on the mailing list, but didn't realize would need them.
> >=20
> >> I only use external refclk, at 26 MHz.
> >=20
> > Same for me, difference is I'm using a crystal oscillator instead of
> > CCM_CLKOUT. And yes, this is the TQ platform TQMa8MPxL/MBa8MPxL.
>=20
> I also have a SoM modified to use Xtal, but it seems unnecessary, the=20
> CCM output saves on BoM too.

That's right, but Xtal is what I have right now. A modification for
CCM_CLKOUT wouldbe possible if clock drift is an issue here.

> [...]
>=20
> > Thanks for sharing, despite the fixed-clock and IMX8MP_CLK_CLKOUT2 this
> > looks very much the same. Unfortunately I get an output on DP just some=
times.
> > As Bit 0 in register 0x464 is not cleared, I suspect the bridge is not
> > recognizing DSI (VSYNC) packets properly :(
> > At some point this bridge is lenient, but picky otherwise.
>=20
> You did strap the bridge such that it sources RefClk from the Xtal,=20
> right (MODE[0] =3D 0 -> RefClk)? I haven't seen VFUEN[0] lock up like tha=
t=20
> before.

Yes, MODE[0] is pulled down. Otherwise I2C is not even possible.
I've tried using MODE[0]=3D1 with a fixed DSI HS clock, but without luck.

> You could try and force the bridge to generate test pattern instead of=20
> DSI_RX, edit the tc358767.c -> locate tc_dsi_rx_enable() -> locate=20
> tc_test_pattern -> make sure the branch option value |=3D=20
> DP0_VIDSRC_COLOR_BAR is activated . Rebuild and retest .
>=20
> This will allow you to validate the TC358767<->DP connection separately=20
> from the DSI<->TC358767 connection . This is what I did when I was=20
> debugging DSI issues on another board with TC9595 . Once you are sure=20
> one side of the connection is stable, you can focus on the other side.
>=20
> Also, with the COLOR_BAR mode in place, try experimenting with the DP=20
> preemphasis tuning and possibly the initial differential voltage tuning=20
> (it is in the same registers as the preemphasis). Maybe you have link=20
> quality issues and the link is borderline, it does train and link up,=20
> but fails right after. Increasing the preemphasis and differential=20
> voltage might help stabilize it.

Thanks, but as far I can tell I don't have any issues on the DP side.
With command line parameter 'tc358767.test=3D1' in place I get that test
pattern with 100% success rate. So I consider my problem on the DSI side on=
ly.
As FVUEN is cleared at the next VSYNC event I suspect the DSI timings
are (slightly) off, but unfortunately I don't have equipment to check
DSI signal quality/timings.

Are you running the DSIM host from 24MHz refclock?

> Also, I use these to fiddle with the TC9595 (in my case) DP timing=20
> registers, the first one reads them all out, the second one writes them.=
=20
> Aadjust values as needed, the values below are from whatever experiment=20
> so they are likely invalid. Make specific note of the last 0x01 on the=20
> second line, that's the VFUEN update:
> $ i2ctransfer -f -y 2 w2@0xf 0x4 0x50 r24
> $ i2ctransfer -f -y 2 w26@0xf 0x4 0x50   0x10 0x01 0x50 0x01   0x20 0x00=
=20
> 0x50 0x00   0x80 0x07 0x20 0x00   0x06 0x00 0x1a 0x00   0xb0 0x04 0x03=20
> 0x00   0x01 0x00 0x00 0x00
>=20
> [...]

Thanks I'll keep that at hand, if they might come handy.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


