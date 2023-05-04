Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB46F6596
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0510E39E;
	Thu,  4 May 2023 07:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780C910E39E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:15:09 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1puTB8-0007Hz-VW; Thu, 04 May 2023 09:15:03 +0200
Message-ID: <9f98e3b5194640cf578d2aa290c6d0ff9ab92369.camel@pengutronix.de>
Subject: Re: [PATCH V2 1/6] drm: bridge: samsung-dsim: fix blanking packet
 size calculation
From: Lucas Stach <l.stach@pengutronix.de>
To: Jagan Teki <jagan@amarulasolutions.com>, Adam Ford <aford173@gmail.com>
Date: Thu, 04 May 2023 09:14:57 +0200
In-Reply-To: <CAMty3ZB0q7MLRyu4TgcV20rX7c8d2SMbvBr39XRru5_Ry6q1Ug@mail.gmail.com>
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-2-aford173@gmail.com>
 <CAMty3ZCn9_AT8SOfFD-MYox16ZcqOEezt_0x6aES6LWQFj8Kpg@mail.gmail.com>
 <CAHCN7xLYfEO9Pxq91vZSDG0QXjnx3BEKYdsTXgQ1BTbtuTbLGQ@mail.gmail.com>
 <CAMty3ZB0q7MLRyu4TgcV20rX7c8d2SMbvBr39XRru5_Ry6q1Ug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 03.05.2023 um 22:05 +0530 schrieb Jagan Teki:
> On Mon, Apr 24, 2023 at 3:17=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >=20
> > On Mon, Apr 24, 2023 at 4:03=E2=80=AFAM Jagan Teki <jagan@amarulasoluti=
ons.com> wrote:
> > >=20
> > > On Sun, Apr 23, 2023 at 5:42=E2=80=AFPM Adam Ford <aford173@gmail.com=
> wrote:
> > > >=20
> > > > From: Lucas Stach <l.stach@pengutronix.de>
> > > >=20
> > > > Scale the blanking packet sizes to match the ratio between HS clock
> > > > and DPI interface clock. The controller seems to do internal scalin=
g
> > > > to the number of active lanes, so we don't take those into account.
> > > >=20
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
> > > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/dr=
m/bridge/samsung-dsim.c
> > > > index e0a402a85787..2be3b58624c3 100644
> > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > @@ -874,17 +874,29 @@ static void samsung_dsim_set_display_mode(str=
uct samsung_dsim *dsi)
> > > >         u32 reg;
> > > >=20
> > > >         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > > > +               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8=
;
> > > > +               int hfp =3D (m->hsync_start - m->hdisplay) * byte_c=
lk_khz / m->clock;
> > >=20
> > > I do not quite understand why it depends on burst_clk_rate, would you
> > > please explain? does it depends on bpp something like this
> > >=20
> > > mipi_dsi_pixel_format_to_bpp(format) / 8
> >=20
> > The pixel clock is currently set to the burst clock rate.  Dividing
> > the clock by 1000 gets the pixel clock in KHz, and dividing by 8
> > converts bits to bytes.
> > Later in the series, I change the clock from the burst clock to the
> > cached value returned from samsung_dsim_set_pll.
>=20
> Okay.
>=20
> >=20
> > >=20
> > > > +               int hbp =3D (m->htotal - m->hsync_end) * byte_clk_k=
hz / m->clock;
> > > > +               int hsa =3D (m->hsync_end - m->hsync_start) * byte_=
clk_khz / m->clock;
> > > > +
> > > > +               /* remove packet overhead when possible */
> > > > +               hfp =3D max(hfp - 6, 0);
> > > > +               hbp =3D max(hbp - 6, 0);
> > > > +               hsa =3D max(hsa - 6, 0);
> > >=20
> > > 6 blanking packet overhead here means, 4 bytes + payload + 2 bytes
> > > format? does this packet overhead depends on the respective porch's
> > > like hpf, hbp and hsa has different packet overheads?
> >=20
> > Lucas might be able to explain this better.  However, it does match
> > the values of the downstream NXP kernel, and I tried playing with
> > these values manually, and 6 appeared to be the only number that
> > seemed to work for me too.  I abandoned my approach for Lucas'
> > implementation, because it seemed more clear than mine.
> > Maybe Lucas can chime in, since this is really his patch.
>=20
> Lucan, any inputs?
>=20
The blanking packets are are MIPI long packets, so 4 byte header,
payload, 2 bytes footer. I experimented with different blanking sizes
and haven't found that it would make any difference. I don't think any
real-world horizontal blanking sizes would require multiple packets to
be sent.

Regards,
Lucas

