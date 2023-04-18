Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F836E5C63
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776210E6FA;
	Tue, 18 Apr 2023 08:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6F10E6FA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:47:20 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pogza-0008QK-48; Tue, 18 Apr 2023 10:47:14 +0200
Message-ID: <426e901f14254cfcff87ba1747534f9b856ef738.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>
Date: Tue, 18 Apr 2023 10:47:07 +0200
In-Reply-To: <56085a0f-02f7-6f45-f351-1f9ee612b748@denx.de>
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-3-aford173@gmail.com>
 <7eed74e8-9f67-a410-3cec-f61a6db85238@denx.de>
 <CAHCN7xKw26TQ=t75TEDbEkA0mb9rnEwNW=7ei1=WFBZjiJMf=g@mail.gmail.com>
 <56085a0f-02f7-6f45-f351-1f9ee612b748@denx.de>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 18.04.2023 um 10:30 +0200 schrieb Marek Vasut:
> On 4/18/23 04:29, Adam Ford wrote:
> > On Sun, Apr 16, 2023 at 5:08=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> > >=20
> > > On 4/15/23 12:41, Adam Ford wrote:
> > > > Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
> > > > having an entry in the device tree for samsung,pll-clock-frequency.
> > > >=20
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >    drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
> > > >    1 file changed, 6 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/dr=
m/bridge/samsung-dsim.c
> > > > index 9fec32b44e05..73f0c3fbbdf5 100644
> > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > @@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct sams=
ung_dsim *dsi)
> > > >        struct device_node *node =3D dev->of_node;
> > > >        int ret;
> > > >=20
> > > > -     ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-fre=
quency",
> > > > -                                    &dsi->pll_clk_rate);
> > > > -     if (ret < 0)
> > > > -             return ret;
> > > > -
> > > >        ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-=
frequency",
> > > >                                       &dsi->burst_clk_rate);
> > > >        if (ret < 0)
> > >=20
> > > Does this break compatibility with old samsung DTs ?
> >=20
> > My goal here was to declutter the device tree stuff and fetch data
> > automatically if possible. What if I changed this to make them
> > optional?  If they exist, we can use them, if they don't exist, we
> > could read the clock rate.  Would that be acceptable?
>=20
> If you do not see any potential problem with ignoring the DT property=20
> altogether, that would be better of course, but I think you cannot do=20
> that with old DTs, so you should retain backward compatibility fallback,=
=20
> yes. What do you think ?

I'm very much in favor of this patch, but I also think we shouldn't
risk breaking Samsung devices, where we don't now 100% that the input
clock rate provided by the clock driver is correct.

So I think the right approach is to use "samsung,pll-clock-frequency"
when present in DT and get it from the clock provider otherwise. Then
just remove the property from the DTs where we can validate that the
input clock rate is correct, i.e. all i.MX8M*.

Regards,
Lucas
