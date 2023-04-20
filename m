Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD06E955A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EE610EC2D;
	Thu, 20 Apr 2023 13:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBAD10EC28
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:06:58 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ppTzu-0005Ar-MN; Thu, 20 Apr 2023 15:06:50 +0200
Message-ID: <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Date: Thu, 20 Apr 2023 15:06:45 +0200
In-Reply-To: <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
 <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
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

Hi Adam,

Am Mittwoch, dem 19.04.2023 um 05:47 -0500 schrieb Adam Ford:
> On Mon, Apr 17, 2023 at 6:55=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> >=20
> > On Mon, Apr 17, 2023 at 3:43=E2=80=AFAM Lucas Stach <l.stach@pengutroni=
x.de> wrote:
> > >=20
> > > Hi Adam,
> > >=20
> > > Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> > > > If there is more than one lane, the HFP, HBP, and HSA is calculated=
 in
> > > > bytes/pixel, then they are divided amongst the different lanes with=
 some
> > > > additional overhead. This is necessary to achieve higher resolution=
s while
> > > > keeping the pixel clocks lower as the number of lanes increase.
> > > >=20
> > >=20
> > > In the testing I did to come up with my patch "drm: bridge: samsung-
> > > dsim: fix blanking packet size calculation" the number of lanes didn'=
t
> > > make any difference. My testing might be flawed, as I could only
> > > measure the blanking after translation from MIPI DSI to DPI, so I'm
> > > interested to know what others did here. How did you validate the
> > > blanking with your patch? Would you have a chance to test my patch an=
d
> > > see if it works or breaks in your setup?
>=20
> Lucas,
>=20
> I tried your patch instead of mine.  Yours is dependent on the
> hs_clock being always set to the burst clock which is configured by
> the device tree.  I unrolled a bit of my stuff and replaced it with
> yours.  It worked at 1080p, but when I tried a few other resolutions,
> they did not work.  I assume it's because the DSI clock is fixed and
> not changing based on the pixel clock.  In the version I did, I only
> did that math when the lanes were > 1. In your patch, you divide by 8,
> and in mine, I fetch the bits-per-pixel (which is 8) and I divide by
> that just in case the bpp ever changes from 8.  Overall,  I think our
> patches basically do the same thing.

The calculations in your and my patch are quite different. I'm not
taking into account the number of lanes or the MIPI format. I'm basing
the blanking size purely on the ratio between MIPI DSI byte clock and
the DPI interface clock. It's quite counter-intuitive that the host
would scale the blanking to the number of lanes automatically, but
still require the MIPI packet offset removed, but that's what my
measurements showed to produce the correct blanking after translation
to DPI by the TC358767 bridge chip.

If you dynamically scale the HS clock, then you would need to input the
real used HS clock to the calculation in my patch, instead of the fixed
burst mode rate.

Regards,
Lucas
