Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B69E8E07
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F1B10E67B;
	Mon,  9 Dec 2024 08:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="inHsnQYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C063D10E492
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:41:53 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 3CA29240101
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 08:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1733730110; bh=rapGzakJibp04i5NC4/8LsOno52rB3ZlGimGhoi2qLM=;
 h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
 Content-Transfer-Encoding:MIME-Version:From;
 b=inHsnQYfwTPgydM1fSqQJ+U3+LSw5UCgRLInTbd1KNxCwoBv0ZZ1DglHk/DvokW0O
 QpLomSfcNUi/fI8eb5Vc+xJahQOgbroswPpM4KaZ7hHb9gAX0zhlpWYKiUO1zKBaeR
 efn4p0GeCoP/UV+RjIaPXLZ+JEYdJtBTCFkRzL4zHfRGwnvogdPhDUIw8Sg85zP8m5
 jjCbqvlLcSkQO8n5XpJHnfHskLIOukyit0KOCbWZNtGx96zHW92b5vPKaE4iS37eg5
 7qx5XB5IqT1LjDK0h3VWoZRkCaoFugcsrJy02njUpy4K9BjIpPGzpAH8YivMD06DEd
 03I9sP5OVQu9Q==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Y6DMW6R48z9rxB;
 Mon,  9 Dec 2024 08:41:43 +0100 (CET)
Message-ID: <384913986510d3bb5ca198962dd5a124b9282853.camel@posteo.de>
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
From: Martin Kepplinger <martink@posteo.de>
To: Nikolaus Voss <nv@vosn.de>, Liu Ying <victor.liu@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Liu Ying
 <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Fabio
 Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nikolaus.voss@haag-streit.com, miquel.raynal@bootlin.com
Date: Mon, 09 Dec 2024 07:41:43 +0000
In-Reply-To: <000b34cdd1591c82265ce1f9848828d1@vosn.de>
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
 <000b34cdd1591c82265ce1f9848828d1@vosn.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2024 08:56:02 +0000
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

Am Montag, dem 02.12.2024 um 11:13 +0100 schrieb Nikolaus Voss:
> Hi Liu,
>=20
> On 02.12.2024 07:32, Liu Ying wrote:
> > On 11/27/2024, Nikolaus Voss wrote:
> > > LDB clock has to be a fixed multiple of the pixel clock.
> > > As LDB and pixel clock are derived from different clock sources
> > > (at least on imx8mp), this constraint cannot be satisfied for
> > > any pixel clock, which leads to flickering and incomplete
> > > lines on the attached display.
> > >=20
> > > To overcome this, check this condition in mode_fixup() and
> > > adapt the pixel clock accordingly.
> > >=20
> > > Cc: <stable@vger.kernel.org>
> >=20
> > It looks like stable is not effectively Cc'ed.
> > Need a Fixes tag?
>=20
> I will include
> Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale=20
> i.MX8MP LDB bridge")
> in v2.
>=20
> >=20
> > >=20
> > > Signed-off-by: Nikolaus Voss <nv@vosn.de>
> > > ---
> > > =C2=A0drivers/gpu/drm/bridge/fsl-ldb.c | 40=20
> > > ++++++++++++++++++++++++++++----
> > > =C2=A01 file changed, 36 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c=20
> > > b/drivers/gpu/drm/bridge/fsl-ldb.c
> > > index 0e4bac7dd04ff..e341341b8c600 100644
> > > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > > @@ -104,12 +104,14 @@ static inline struct fsl_ldb
> > > *to_fsl_ldb(struct=20
> > > drm_bridge *bridge)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return container_of(b=
ridge, struct fsl_ldb, bridge);
> > > =C2=A0}
> > >=20
> > > +static unsigned int fsl_ldb_link_freq_factor(const struct
> > > fsl_ldb=20
> > > *fsl_ldb)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return fsl_ldb_is_dual(fsl=
_ldb) ? 3500 : 7000;
> > > +}
> > > +
> > > =C2=A0static unsigned long fsl_ldb_link_frequency(struct fsl_ldb
> > > *fsl_ldb,=20
> > > int clock)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (fsl_ldb_is_dual(fsl_ld=
b))
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return clock * 3500;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return clock * 7000;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return clock * fsl_ldb_lin=
k_freq_factor(fsl_ldb);
> > > =C2=A0}
> > >=20
> > > =C2=A0static int fsl_ldb_attach(struct drm_bridge *bridge,
> > > @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge=20
> > > *bridge,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge, flags);
> > > =C2=A0}
> > >=20
> > > +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct drm_display_mode
> > > *mode,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_display_mode
> > > *adjusted_mode)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct fsl_ldb *fsl_=
ldb =3D to_fsl_ldb(bridge);
> >=20
> > Why const?
> > If no const, then ...
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long requested_li=
nk_freq =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
> >=20
> > ... this could be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long requested_link=
_freq =3D
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsl_ldb_link_frequency(fsl_ldb,=
=20
> > mode->clock);
>=20
> I used fsl_ldb_link_freq_factor(fsl_ldb) to point out the symmetry to
> recalculate
> pclk =3D freq / fsl_ldb_link_freq_factor(fsl_ldb) below:
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long freq =3D clk=
_round_rate(fsl_ldb->clk,=20
> > > requested_link_freq);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (freq !=3D requested_li=
nk_freq) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * this will lead to flicker and incomplete lines
> > > on
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * the attached display, adjust the CRTC clock
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * accordingly.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0int pclk =3D freq /
> > > fsl_ldb_link_freq_factor(fsl_ldb);
> >=20
> > I doubt that pixel clock tree cannot find appropriate division
> > ratios
> > for some pixel clock rates, especially for dual-link LVDS on
> > i.MX8MP
> > and i.MX93 platforms, because PLL clock rate should be 7x faster
> > than
> > pixel clock rate and 2x faster than "ldb" clock rate so that the
> > 3.5
> > folder between "ldb" clock and pixel clock can be met. That means
> > the
> > PLL clock rate needs to be explicitly set first for this case.
> >=20
> > Can you assign the PLL clock rate in DT to satisfy the "ldb" and
> > pixel
> > clock rates like the below commit does, if you use a LVDS panel?
> >=20
> > 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
> > frequency to 506.8 MHz")
>=20
> I probably could. The point of my patch is you don't have to know in
> advance which LVDS panel is connected, and you don't have to
> calculate
> the base PLL clock by hand and store it in the device tree.
>=20
> In my test system, I have three different LVDS panels with EDID
> EEPROM,
> none of which worked with the stock driver, but all work with this=20
> patch.
> With slightly adapted pixel clocks though.
>=20
> The driver already warns if LDB and PCLK don't match, because this is
> a
> hardware constraint and violating this will lead to no image or image
> distortion. With the patch the driver tries to fix that.
>=20
> I don't know if it works for all or at least most panels, but for my=20
> panels
> it does. And if the clocks match, by chance or by refconfiguring the
> PLL=20
> base
> clock, the patch does nothing.

just as a data point, I'm very happy with this patch as it make my 51,2
MHz lvds panel just work without doing anything else. I'll happily
carry it along for v6.12 if it's not going into stable :)

                                  martin

