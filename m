Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333A98FC968
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 12:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632210E434;
	Wed,  5 Jun 2024 10:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="FzHjUzM6";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FDFOzMtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1603610E434
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1717584766; x=1749120766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wqxfxjkRrebq0WItOzY/LodMZ8b/zbkbX0spdNqVtYw=;
 b=FzHjUzM6QLKRpkBpkWsldh40texia+UC4TN0z6GJYV7/nGkp8OpgXQlf
 7j9w8Cni/MEBJf/Wl39GNGwk7dpruPsnCqu9W/OROqxNCXzszSaSI4gRl
 2xw1JO4kLM9G1Iumxcqs2EBr6TkDjxH1RRPOIsZE9l+8rctnF1lHm9nCx
 IzzUuzf5wcVfOC30BO/ONnV5lPENhmQrwD28qtQseYagjXG41GrYorG9s
 iWVGOBJnj0OccKDWxgh4XDqClipr6X2D6DeYnVALN1DXTIsMEWSxk2/3F
 XZ//M3KRS7PqKtRQ1BEpKMLL/0nvmuJbT8lrnxak1I8bT4+/DYovkI9Rk g==;
X-CSE-ConnectionGUID: BAulk1K+S1+pcuCYn3Mskg==
X-CSE-MsgGUID: 9UI3xmBDT7eVoDYQhDsdbQ==
X-IronPort-AV: E=Sophos;i="6.08,216,1712613600"; d="scan'208";a="37234313"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 05 Jun 2024 12:52:43 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5739D160A98; Wed,  5 Jun 2024 12:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1717584759;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wqxfxjkRrebq0WItOzY/LodMZ8b/zbkbX0spdNqVtYw=;
 b=FDFOzMtBtFhUocaPn5jSKbgLYpc+cmjE24rpc2WpTQZiHuAo73/YjSgCI5vhktXFuOedUK
 iicLx4fZyvQb+kqjCV1J9DY0AoCfAKozhNWA4eDeM6FDeNsWrW5icMvtZVOTWjzjcdPqL2
 WBbQ4iTyRFRJGAhRe4BpxNVqENEMUXL+rZeUPhGHgpe9+fIJseS7jW1zcF8RmL8lFCN8di
 eJxnENw56/3IoSNV3iSpt0UNezV/c9fgzG5gTRPV2KJv4Cgwxu/KEymje+AOy++z2XH7gG
 fBi6sjqvR8pefJ5dGVIVCiK1bBbutZhJIvLIdzkGMAqAsHiAvaP7xLIz3Jd9dQ==
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
Date: Wed, 05 Jun 2024 12:52:35 +0200
Message-ID: <1938447.taCxCBeP46@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <c0199d62-1b0d-488b-a54e-0b3512be1c9d@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <3228734.5fSG56mABF@steina-w> <c0199d62-1b0d-488b-a54e-0b3512be1c9d@denx.de>
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

Am Dienstag, 4. Juni 2024, 18:17:53 CEST schrieb Marek Vasut:
> On 6/4/24 1:35 PM, Alexander Stein wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> > Am Montag, 3. Juni 2024, 23:27:34 CEST schrieb Marek Vasut:
> >> On 6/3/24 2:45 PM, Alexander Stein wrote:
> >>
> >> Hi,
> >>
> >>>> @@ -1631,6 +1643,18 @@ static int tc_edp_atomic_check(struct drm_bri=
dge *bridge,
> >>>>    			       struct drm_crtc_state *crtc_state,
> >>>>    			       struct drm_connector_state *conn_state)
> >>>>    {
> >>>> +	struct tc_data *tc =3D bridge_to_tc(bridge);
> >>>> +	int adjusted_clock =3D 0;
> >>>> +	int ret;
> >>>> +
> >>>> +	ret =3D tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> >>>> +			      crtc_state->adjusted_mode.clock * 1000,
> >>>> +			      &adjusted_clock, NULL);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>> +
> >>>> +	crtc_state->adjusted_mode.clock =3D adjusted_clock / 1000;
> >>>
> >>> This is prone to rounding errors. Debug output in my case:
> >>>> [   16.007127] tc358767 1-000f: enable video stream
> >>>> [   16.007148] tc358767 1-000f: PLL: requested 148500000 pixelclock,=
 ref 26000000
> >>>> [   16.007163] tc358767 1-000f: PLL: got 147333333, delta -1166667
> >>>> [   16.007169] tc358767 1-000f: PLL: 26000000 / 1 / 1 * 17 / 3
> >>>> [   16.027112] tc358767 1-000f: set mode 1920x1080
> >>>> [   16.027138] tc358767 1-000f: H margin 148,88 sync 44
> >>>> [   16.027144] tc358767 1-000f: V margin 36,4 sync 5
> >>>> [   16.027150] tc358767 1-000f: total: 2200x1125
> >>>> [   16.059426] tc358767 1-000f: PLL: requested 147333000 pixelclock,=
 ref 26000000
> >>>> [   16.059455] tc358767 1-000f: PLL: got 146250000, delta -1083000
> >>>> [   16.059461] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
> >>>> [   16.095724] tc358767 1-000f: PLL: requested 146250000 pixelclock,=
 ref 26000000
> >>>> [   16.095739] tc358767 1-000f: PLL: got 146250000, delta 0
> >>>> [   16.095745] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
> >>>
> >>> The accuracy degrades with each call, until a full kHz frequency is r=
eached,
> >>> because drm_display_mode.clock only accounts for kHz, but the PLL
> >>> calculation takes Hz into account.
> >>
> >> Hmmmmm, I need to take a closer look at this one.
> >>
> >> Do you have any quick hints ?
>=20
> So the fix is real simple, try this extra diff:
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c=20
> b/drivers/gpu/drm/bridge/tc358767.c
> index 32639865fea07..5d76285dcf245 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1629,7 +1629,7 @@ static int tc_dpi_atomic_check(struct drm_bridge=20
> *bridge,
>          int ret;
>=20
>          ret =3D tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> -                             crtc_state->adjusted_mode.clock * 1000,
> +                             crtc_state->mode.clock * 1000,
>                                &adjusted_clock, NULL);
>          if (ret)
>                  return ret;
> @@ -1653,7 +1653,7 @@ static int tc_edp_atomic_check(struct drm_bridge=20
> *bridge,
>          int ret;
>=20
>          ret =3D tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> -                             crtc_state->adjusted_mode.clock * 1000,
> +                             crtc_state->mode.clock * 1000,
>                                &adjusted_clock, NULL);
>          if (ret)
>                  return ret;
>=20

Ah, right. That seems simple. But I noticed another thing:
The TC9595 PLL is configured to 147333333 while the lcdif configures
the display clock to 147333000, the value actually stored in
adjusted_mode.clock. I do not know if this small difference can be neglecte=
d.

> > No, sorry. I'm not sure about those VFIFO overruns/underruns you mentio=
ned
> > in the commit message. Does this maybe only apply to DPI input?
>=20
> No, this actually happens with DSI input in both DPI and (e)DP output=20
> modes, it is only really well visible in some resolutions it seems.

Ah, i see.

> > At least for 148.5MHz (1080p) apparently it is not possible to that
> > exact clock anyway.
>=20
> Right, which sucks, but the TC9595 datasheet explicitly states that the=20
> FRMSYNC mode should always be enabled (and is apparently force-enabled=20
> on newer bridge chips with no option to disable it) unless the Pixel=20
> clock are sourced from DSI clock (which is never the case with this=20
> driver). That's what the [1] patch does.
>=20
> But messing with the HFP isn't really working for all resolutions, so=20
> this patch instead adjusts the input pixel clock to fit the Pixel PLL=20
> limits, which avoids the VFIFO issues altogether. And that makes the=20
> FRMSYNC mode work for all kinds of resolutions.

I can't tell if VFIFO issue arise here, because I'm currently trying to
get a reliable and stable output for DP. The documentation is somewhat
limited, but FRAMSYNC seems almost necessary in any case, unless you
utilize DSI bus 100% for this device to get the correct display timings
using DSI packets.

> You might be wondering why not source pixel clock from DSI HS clock and=20
> disable FRMSYNC. For one thing, this would limit the ability to pick=20
> faster DSI HS clock and make good use of the DSI burst mode (the DSI=20
> link can go into LP state after transmitting entire line of pixel data=20
> for longer with faster DSI HS clock). The other thing is, to drive the=20
> Pixel PLL (not to be confused with pixel clock) from DSI HS clock, the=20
> DSI HS clock have to be set to specific clock rates (13*4*7=3D364 MHz and=
=20
> 13*4*9=3D468 MHz), which is really limiting.

This is not mentioned in the datasheet at all, but just in a small note
in the calculation sheet, without any description. On a different platform
DSI HS clock running at 445.5MHz seems also possible, even if unsupported.

> >>> BTW: Which platform are you testing on?
> >>
> >> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
> >>
> >> The TC9595 is 2nd generation (automotive?) replacement for TC358767 (1=
st
> >> generation replacement is TC358867) .
> >=20
> > Same here. But fail to get output on a DP monitor if I'm running from
> > external refclk. Using DSICLK/4 seems necessary for some reason, but it
> > is very unreliable to get a proper image.
>=20
> Do you have all the patches in place ? This is what you should have:
>=20
> drm/bridge: tc358767: Enable FRMSYNC timing generator
> drm: bridge: samsung-dsim: Initialize bridge on attach
> drm/bridge: tc358767: Reset chip again on attach
> clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate
> drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
> drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
> drm/bridge: tc358767: Check if fully initialized before signalling HPD=20
> event via IRQ
> drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation=20
> and enablement
> drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode clock
> drm/bridge: tc358767: Drop line_pixel_subtract
> drm/bridge: tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS
> drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
> Revert "drm/bridge: tc358767: Set default CLRSIPO count"
> drm/bridge: tc358767: Add configurable default preemphasis

Thanks, I was missing the lcdif and clk-imx8mp patches. I saw them separate=
ly
on the mailing list, but didn't realize would need them.

> I only use external refclk, at 26 MHz.

Same for me, difference is I'm using a crystal oscillator instead of
CCM_CLKOUT. And yes, this is the TQ platform TQMa8MPxL/MBa8MPxL.

> > Which display are you using? Do you mind sharing your DT?
>=20
> HP LA2405wg , ancient 1920x1200 one.

ASUS PB238, 1920x1080 here.

> Relevant parts are below:
>=20
> // This is in I2C controller node, it actually is modified
> // arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> tc_bridge: bridge@f {
>          compatible =3D "toshiba,tc9595", "toshiba,tc358767";
>          pinctrl-names =3D "default";
>          pinctrl-0 =3D <&pinctrl_tc9595>;
>          reg =3D <0xf>;
>          clock-names =3D "ref";
>          clocks =3D <&clk IMX8MP_CLK_CLKOUT2>;
>          assigned-clocks =3D <&clk IMX8MP_CLK_CLKOUT2_SEL>,
>                            <&clk IMX8MP_CLK_CLKOUT2>,
>                            <&clk IMX8MP_AUDIO_PLL2_OUT>;
>          assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL2_OUT>;
>          assigned-clock-rates =3D <26000000>, <26000000>, <416000000>;
>          reset-gpios =3D <&gpio4 1 GPIO_ACTIVE_HIGH>;
>          status =3D "okay";
>=20
>          ports {
>                  #address-cells =3D <1>;
>                  #size-cells =3D <0>;
>=20
>                  port@0 {
>                          reg =3D <0>;
>=20
>                          tc_bridge_in: endpoint {
>                                  data-lanes =3D <1 2 3 4>;
>                                  remote-endpoint =3D <&dsi_out>;
>                          };
>                  };
>=20
>                  port@2 { // This is optional
>                          reg =3D <2>;
>                          toshiba,pre-emphasis =3D /bits/ 8 <1 1>;
>                  };
>          };
> };
>=20
> // 1 GHz burst clock is the maximum the bridge can do
> &mipi_dsi {
>          samsung,burst-clock-frequency =3D <1000000000>;
>          samsung,esc-clock-frequency =3D <10000000>;
>          status =3D "okay";
>=20
>          ports {
>                  port@1 {
>                          reg =3D <1>;
>=20
>                          dsi_out: endpoint {
>                                  data-lanes =3D <1 2 3 4>;
>                                  remote-endpoint =3D <&tc_bridge_in>;
>                          };
>                  };
>          };
> };

Thanks for sharing, despite the fixed-clock and IMX8MP_CLK_CLKOUT2 this
looks very much the same. Unfortunately I get an output on DP just sometime=
s.
As Bit 0 in register 0x464 is not cleared, I suspect the bridge is not
recognizing DSI (VSYNC) packets properly :(
At some point this bridge is lenient, but picky otherwise.

> // This is to let LCDIF configure the pixel clock,
> // it removes the fixed Video PLL configuration from DT
> &media_blk_ctrl {
>         assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_AXI>,
>                           <&clk IMX8MP_CLK_MEDIA_APB>,
>                           <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>                           <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>;
>         assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
>                                  <&clk IMX8MP_SYS_PLL1_800M>,
>                                  <&clk IMX8MP_VIDEO_PLL1_OUT>,
>                                  <&clk IMX8MP_SYS_PLL3_OUT>;
>         assigned-clock-rates =3D <500000000>, <200000000>,
>                                <0>, <0>;
> };

I get the intention, but this might change once you want to enable ISP/DWE.
But that is a different matter for now.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


