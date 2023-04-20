Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860B6E9610
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2969D10E0C3;
	Thu, 20 Apr 2023 13:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AB210EC54
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:43:03 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ppUYu-0001Bj-Uu; Thu, 20 Apr 2023 15:43:01 +0200
Message-ID: <19d2c40180d0b9176e17aa6e91c1e7f36f77f626.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Date: Thu, 20 Apr 2023 15:42:57 +0200
In-Reply-To: <CAHCN7x+bZHZHxYk=qC3QFS07kLO85w_rj1tOuX1Y3fJXekmvMQ@mail.gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
 <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
 <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
 <CAHCN7x+bZHZHxYk=qC3QFS07kLO85w_rj1tOuX1Y3fJXekmvMQ@mail.gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 20.04.2023 um 08:24 -0500 schrieb Adam Ford:
> On Thu, Apr 20, 2023 at 8:06=E2=80=AFAM Lucas Stach <l.stach@pengutronix.=
de> wrote:
> >=20
> > Hi Adam,
> >=20
> > Am Mittwoch, dem 19.04.2023 um 05:47 -0500 schrieb Adam Ford:
> > > On Mon, Apr 17, 2023 at 6:55=E2=80=AFAM Adam Ford <aford173@gmail.com=
> wrote:
> > > >=20
> > > > On Mon, Apr 17, 2023 at 3:43=E2=80=AFAM Lucas Stach <l.stach@pengut=
ronix.de> wrote:
> > > > >=20
> > > > > Hi Adam,
> > > > >=20
> > > > > Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> > > > > > If there is more than one lane, the HFP, HBP, and HSA is calcul=
ated in
> > > > > > bytes/pixel, then they are divided amongst the different lanes =
with some
> > > > > > additional overhead. This is necessary to achieve higher resolu=
tions while
> > > > > > keeping the pixel clocks lower as the number of lanes increase.
> > > > > >=20
> > > > >=20
> > > > > In the testing I did to come up with my patch "drm: bridge: samsu=
ng-
> > > > > dsim: fix blanking packet size calculation" the number of lanes d=
idn't
> > > > > make any difference. My testing might be flawed, as I could only
> > > > > measure the blanking after translation from MIPI DSI to DPI, so I=
'm
> > > > > interested to know what others did here. How did you validate the
> > > > > blanking with your patch? Would you have a chance to test my patc=
h and
> > > > > see if it works or breaks in your setup?
> > >=20
> > > Lucas,
> > >=20
> > > I tried your patch instead of mine.  Yours is dependent on the
> > > hs_clock being always set to the burst clock which is configured by
> > > the device tree.  I unrolled a bit of my stuff and replaced it with
> > > yours.  It worked at 1080p, but when I tried a few other resolutions,
> > > they did not work.  I assume it's because the DSI clock is fixed and
> > > not changing based on the pixel clock.  In the version I did, I only
> > > did that math when the lanes were > 1. In your patch, you divide by 8=
,
> > > and in mine, I fetch the bits-per-pixel (which is 8) and I divide by
> > > that just in case the bpp ever changes from 8.  Overall,  I think our
> > > patches basically do the same thing.
> >=20
> > The calculations in your and my patch are quite different. I'm not
> > taking into account the number of lanes or the MIPI format. I'm basing
>=20
> I was looking more at the division by 8 and the overhead correction of 6.
> This number 6 also appears in the NXP downstream kernel [1].  I know
> Marek V had some concerns about that.
>=20
Yea, I don't fully remember the details about the overhead. Need to
page that back in. The division by 8 in my patch is just to get from
the bit to a byte clock, nothing to do with the MIPI format bits per
channel or something like that.

> > the blanking size purely on the ratio between MIPI DSI byte clock and
> > the DPI interface clock. It's quite counter-intuitive that the host
> > would scale the blanking to the number of lanes automatically, but
> > still require the MIPI packet offset removed, but that's what my
> > measurements showed to produce the correct blanking after translation
> > to DPI by the TC358767 bridge chip.
>=20
> How many lanes is your DSI interface using?
>=20
When I did the measurements to come up with the patch, I varied the
number of lanes between 1 and 4. Different number of lanes didn't make
a difference. In fact trying to compensate for the number of lanes when
calculating the blanking size to program into the controller lead to
wildly wrong blanking on the DPI side of the external bridge.

> >=20
> > If you dynamically scale the HS clock, then you would need to input the
> > real used HS clock to the calculation in my patch, instead of the fixed
> > burst mode rate.
>=20
> I think what you're saying makes sense.
>=20
> The code I originally modeled this from was from the NXP downstream
> kernel where they define the calculation as being in words [2]. I am
> not saying the NXP code is perfect, but the NXP code works.  With this
> series, my monitors are able to sync a bunch of different resolutions
> from 1080p down to 640x480 and a bunch in between with various refresh
> rates too. That was the goal of this series.
>=20
> Instead of just using your patch as-is, I will adapt yours to use the
> scaled clock to see how it behaves and get back to you.
>=20

Thanks, that would be very much appreciated.

I also don't assert that my calculation is perfect, as I also don't
have any more information and needed to resort to observing the
blanking after translation by the external bridge, so I hope we could
get some better understanding of how things really work by checking
what works for both our systems.

>   I have
> finished reworking the dynamic DPHY settings, and I've fixed up making
> the PLL device tree optional. If your patch works, I'll drop my
> calculation and just build off what you have to use the scaled HS
> clock when I submit the V2 and I'll make sure I CC you.
>=20
Thanks, I'm open to re-do my measurements with your new patches.

Regards,
Lucas

> adam
>=20
> [1] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/=
bridge/sec-dsim.c#L270
> [2] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/=
bridge/sec-dsim.c#L914
>=20
> >=20
> > Regards,
> > Lucas

