Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7697CC2B0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9E10E03C;
	Tue, 17 Oct 2023 12:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3785410E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:13:27 +0000 (UTC)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsiwt-000833-4y; Tue, 17 Oct 2023 14:13:23 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Date: Tue, 17 Oct 2023 14:13:21 +0200
Message-ID: <5979575.UjTJXf6HLC@diego>
In-Reply-To: <AM7PR04MB7046C954891C3ABEC568DC1F98D6A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <1971539.CrzyxZ31qj@diego>
 <AM7PR04MB7046C954891C3ABEC568DC1F98D6A@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Dienstag, 17. Oktober 2023, 12:15:11 CEST schrieb Ying Liu:
> On Tuesday, October 17, 2023 2:15 AM, Heiko St=FCbner <heiko@sntech.de> w=
rote:
> > Am Montag, 17. Juli 2023, 08:18:27 CEST schrieb Liu Ying:
> > > To get better accuration, use pixel clock rate to calculate lbcc inst=
ead of
> > > lane_mbps since the pixel clock rate is in KHz while lane_mbps is in =
MHz.
> > > Without this, distorted image can be seen on a HDMI monitor connected
> > with
> > > i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60
> > video
> > > mode.
> > >
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >
> > looks like I'm late to the party, but this change breaks the display ou=
tput
> > my px30 minievb with the xinpeng xpp055c272 dsi display [0].
>=20
> Hmm, I asked for a test, but anyway sorry for the breakage.

I'm often way behind with looking at drm-related changes, sorry about that.

So thanks a lot for taking the time to look into the problem.


> The panel driver sets MIPI_DSI_MODE_VIDEO_BURST.
> And, it seems that rockchip dsi driver [1] only supports the burst mode,
> because it takes 1/0.8 =3D 1.25 faster lane_mbps than "bandwidth of RGB".
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c#n568
>=20
> >
> > Found this commit via git bisection and added a bit of debug output to
> > compare the value differences for the old and new calculation:
> >
> > [   34.810722] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 810 * 480 * 1=
000
> > / 8
> > [   34.810749] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 810 * 64000 *
> > 24 / (4 * 8)
> > [   34.810756] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 48600000, new
> > lbcc: 38880000
> > [   34.810762] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 10 * 480 * 10=
00 /
> > 8
> > [   34.810767] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 10 * 64000 * =
24
> > / (4 * 8)
> > [   34.810773] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 600000, new l=
bcc:
> > 480000
> > [   34.810778] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 40 * 480 * 10=
00 /
> > 8
> > [   34.810783] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 40 * 64000 * =
24
> > / (4 * 8)
> > [   34.810789] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 2400000, new
> > lbcc: 1920000
>=20
> Old lbcc / new lbcc is always 1.25.
>=20
> The new lbcc is for non-burst modes(sync pulse/sync event), IIUC.
> At least, it works for i.MX93 with the RM67191 panel and ADV7535 in
> sync pulse mode.
>=20
> >
> > With the new lbcc I get a blank dsi panel and just going back to the old
> > calculation of lbcc restores the image.
> >
> > I don't have that much in-depth knowledge about dsi stuff and the origi=
nal
> > panel times also "just" came from the vendor tree, but I really would l=
ike
> > to keep that display working ;-) .
> >
> > Do you have any idea which way to go to fix this?
>=20
> Can you please test the below patch for your case?

The patch below does fix the display on the device. After applying it
I do get a working display again.


> --------------------------------------------------------8<---------------=
=2D-----------------------------------------------------
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -774,13 +774,19 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct d=
w_mipi_dsi *dsi,
>         u32 frac, lbcc, minimum_lbcc;
>         int bpp;
>=20
> -       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> -       if (bpp < 0) {
> -               dev_err(dsi->dev, "failed to get bpp\n");
> -               return 0;
> -       }
> +       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +               /* lbcc based on lane_mbps */
> +               lbcc =3D hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
> +       } else {
> +               /* lbcc based on pixel clock */
> +               bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +               if (bpp < 0) {
> +                       dev_err(dsi->dev, "failed to get bpp\n");
> +                       return 0;
> +               }
>=20
> -       lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes =
* 8);
> +               lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi=
=2D>lanes * 8);
> +       }
>=20
>         frac =3D lbcc % mode->clock;
>         lbcc =3D lbcc / mode->clock;
> --------------------------------------------------------8<---------------=
=2D-----------------------------------------------------
>=20
> It kind of keeps the old lbcc for burst mode, except for the minimum lbcc=
 check
> I introduced.
>=20
> It seems that meson supports non-burst modes only and stm supports both
> non-burst modes and burst mode.  With the patch, I still worry about non-=
burst
> modes for stm, assuming the minimum lbcc check is ok and everything works
> for meson since I guess Neil has already tested the patch set on meson.
>=20
> Should we go with the above patch?  If yes, I may send it out.

In my mind, definitly :-) .

But maybe Neil as the other reviewer also wants to chime in.


So again thanks for looking into the issue.
Heiko


> >
> > [0]
> > https://git.ker/
> > nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F
> > tree%2Farch%2Farm64%2Fboot%2Fdts%2Frockchip%2Fpx30-
> > evb.dts%23n138&data=3D05%7C01%7Cvictor.liu%40nxp.com%7C8f712ad41720
> > 4ba7411808dbce73ce63%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > %7C638330769044424464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> > 7C%7C&sdata=3DeffPCbPOk3GGuO8mR%2FSlcjFJfDUEZmq082simvjkux0%3D&r
> > eserved=3D0
> > https://git.ker/
> > nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F
> > tree%2Fdrivers%2Fgpu%2Fdrm%2Fpanel%2Fpanel-xinpeng-
> > xpp055c272.c&data=3D05%7C01%7Cvictor.liu%40nxp.com%7C8f712ad417204b
> > a7411808dbce73ce63%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> > C638330769044424464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C
> > %7C&sdata=3DbAgcLnJpIEQaYZZUI1CnUsgP7rMiNV6wKKg%2Bl8%2FlN40%3D&r
> > eserved=3D0
> >
> > > ---
> > >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > > index c754d55f71d1..332388fd86da 100644
> > > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/component.h>
> > >  #include <linux/debugfs.h>
> > >  #include <linux/iopoll.h>
> > > +#include <linux/math64.h>
> > >  #include <linux/media-bus-format.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > > @@ -762,8 +763,15 @@ static u32
> > dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
> > >                                        u32 hcomponent)
> > >  {
> > >     u32 frac, lbcc;
> > > +   int bpp;
> > >
> > > -   lbcc =3D hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
> > > +   bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > +   if (bpp < 0) {
> > > +           dev_err(dsi->dev, "failed to get bpp\n");
> > > +           return 0;
> > > +   }
> > > +
> > > +   lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes *
> > 8);
> >
> >
> >
>=20
>=20




