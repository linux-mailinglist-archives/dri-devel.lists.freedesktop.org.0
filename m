Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D056B7A02
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F290810E52D;
	Mon, 13 Mar 2023 14:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A58010E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:11:42 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pbitn-0002Tg-IN; Mon, 13 Mar 2023 15:11:39 +0100
Message-ID: <71c8e22793330e413792824bd1affc36159a2de5.camel@pengutronix.de>
Subject: Re: MXSFB and Video PLL clock on i.MX8M Mini/Nano Question
From: Lucas Stach <l.stach@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Adam Ford <aford173@gmail.com>
Date: Mon, 13 Mar 2023 15:11:37 +0100
In-Reply-To: <20230313112937.GC7446@pengutronix.de>
References: <CAHCN7xJXMmwYqD=Eb2=_vJw390KAd6NgkWCpq6yCbAyaJ3xK5A@mail.gmail.com>
 <20230313085105.GB7446@pengutronix.de>
 <CAHCN7xJxBrN5aQgvkV8LrqoTATinr0kFYKht2_YKqTF71UCoKw@mail.gmail.com>
 <20230313112937.GC7446@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 13.03.2023 um 12:29 +0100 schrieb Sascha Hauer:
> On Mon, Mar 13, 2023 at 06:08:05AM -0500, Adam Ford wrote:
> > On Mon, Mar 13, 2023 at 3:51=E2=80=AFAM Sascha Hauer <s.hauer@pengutron=
ix.de> wrote:
> > >=20
> > > On Sun, Mar 12, 2023 at 02:28:45PM -0500, Adam Ford wrote:
> > > > I am trying to work through a series that was submitted for enablin=
g
> > > > the DSI on the i.MX8M Mini and Nano.  I have extended this series t=
o
> > > > route the DSI to an HDMI bridge, and I am able to get several
> > > > resolutions to properly sync on my monitor.  However, there are als=
o a
> > > >  bunch that appear on the list when I run modetest that do not sync=
 on
> > > > my monitor.
> > > >=20
> > > > When running some debug code, it appears that it's related to the
> > > > clocking of the MXSFB driver.
> > > >=20
> > > > From what I can tell, the MSXFB driver attempts to set the clock ba=
sed
> > > > on the desired resolution and refresh rate.  When the default
> > > > VIDEO_PLL clock is set to 594MHz, many of the resolutions that clea=
nly
> > > > divide from the 594MHz clock appear to sync with my monitor.  Howev=
er,
> > > > in order to get other resolutions to appear, I have to manually cha=
nge
> > > > the device tree to set VIDEO_PLL to a different clock rate so MSXFB
> > > > can use it.  Unfortunately, that breaks the resolutions that used t=
o
> > > > work.
> > > >=20
> > > > I threw together a hack into the MXSFB driver which adds a new
> > > > optional clock to the MSXFB driver.  When I pass VIDEO_PLL to this
> > > > driver, it can automatically set the clock rate to match that of
> > > > whatever the desired clock is, and I can get many more resolutions =
to
> > > > appear.
> > > > Another advantage of this is that the Video_PLL can be the minimum
> > > > speed needed for a given rate instead of setting a higher rate, the=
n
> > > > dividing it down.
> > >=20
> > > Isn't it possible to add the CLK_SET_RATE_PARENT flag to the pixel
> > > clock? That's what i.MX6sx and i.MX7 do.
> >=20
> > I thought about that, but on the Nano, the video_pll is several layers =
up.
> >=20
> > video_pll -> video_pll_bypass -> disp_pixel -> disp_pixel_clk
> >=20
> > Do I just set that flag for each of these?
>=20
> Yes, that's what I would suggest. I don't know the i.MX8M clock tree
> very well, so I don't know which other clocks might be influenced when
> the video_pll clock changes its rate. But if you have to change the PLL
> rate anyway it shouldn't make a difference if you change it directly
> or if you let the rate change propagate up from disp_pixel_clk.
>=20
The problem with a simple CLK_SET_RATE_PARENT is that the rate changes
propagate upwards in the tree for all possible sources. If the source
is the video PLL then the rate propagation is exactly what you want to
happen. If the display clock is sourced from a system PLL, you really
don't want to change the PLL rate, so we need something more clever
here.

Either the mux part of the composite clock needs to learn to only
propagate rate requests for specific sources, or we need to deny rate
changes to the system PLLs, but not sure if there are other similar
cases for other sources.

Regards,
Lucas

