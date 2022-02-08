Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A8F4AD7B1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C310E327;
	Tue,  8 Feb 2022 11:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614FD10E327
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 11:41:13 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHOrt-00014g-Pz; Tue, 08 Feb 2022 12:41:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 24/27] clk: rk3568: drop CLK_SET_RATE_PARENT from dclk_vop*
Date: Tue, 08 Feb 2022 12:41:08 +0100
Message-ID: <2260638.yNqFStFpQL@diego>
In-Reply-To: <20220131081042.GW23490@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <5329207.qDA9hNt6id@diego> <20220131081042.GW23490@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 31. Januar 2022, 09:10:42 CET schrieb Sascha Hauer:
> On Sat, Jan 29, 2022 at 06:48:13PM +0100, Heiko St=FCbner wrote:
> > Am Mittwoch, 26. Januar 2022, 15:55:46 CET schrieb Sascha Hauer:
> > > The pixel clocks dclk_vop[012] can be clocked from hpll, vpll, gpll or
> > > cpll. gpll and cpll also drive many other clocks, so changing the
> > > dclk_vop[012] clocks could change these other clocks as well. Drop
> > > CLK_SET_RATE_PARENT to fix that. With this change the VOP2 driver can
> > > only adjust the pixel clocks with the divider between the PLL and the
> > > dclk_vop[012] which means the user may have to adjust the PLL clock t=
o a
> > > suitable rate using the assigned-clock-rate device tree property.
> > >=20
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > >  drivers/clk/rockchip/clk-rk3568.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip=
/clk-rk3568.c
> > > index 9d889fc46811..7687c62d1fa8 100644
> > > --- a/drivers/clk/rockchip/clk-rk3568.c
> > > +++ b/drivers/clk/rockchip/clk-rk3568.c
> > > @@ -1044,13 +1044,13 @@ static struct rockchip_clk_branch rk3568_clk_=
branches[] __initdata =3D {
> > >  			RK3568_CLKGATE_CON(20), 8, GFLAGS),
> > >  	GATE(HCLK_VOP, "hclk_vop", "hclk_vo", 0,
> > >  			RK3568_CLKGATE_CON(20), 9, GFLAGS),
> > > -	COMPOSITE(DCLK_VOP0, "dclk_vop0", hpll_vpll_gpll_cpll_p, CLK_SET_RA=
TE_PARENT | CLK_SET_RATE_NO_REPARENT,
> > > +	COMPOSITE(DCLK_VOP0, "dclk_vop0", hpll_vpll_gpll_cpll_p, CLK_SET_RA=
TE_NO_REPARENT,
> >=20
> > hmm, I'm wondering about the use of having CLK_SET_RATE_NO_REPARENT here
> > (and even adding it below).
> >=20
> > Using SET_RATE_PARENT in the following patch for the hdmi-pll, should g=
ive
> > us at least a suitable rate for the hdmi output, so the vop using that
> > should already find a nice rate to use.
> >=20
> > The normal system-PLLs don't normally don't change their rate at runtim=
e,
> > so I think we should liberate the dclks to select a PLL that best match=
es
> > their target rate - so drop the CLK_SET_RATE_NO_REPARENT as well.
> >=20
> > That way the DCLKs can change to another PLL source if that provides
> > a rate nearer to their target.
>=20
> The HDMI reference clock has the CLK_SET_RATE_PARENT flag set and we
> need that to program the HPLL clock to suitable rates for the HDMI
> output. Now any other display choosing HPLL as parent, because that
> provides the best rate in that point of time, hangs on a PLL which
> changes its rate whenever the resolution is changed on the HDMI output.

Ah, right ... the hpll is in the parent list, that changes things as you sa=
id.
I somehow only noticed the regular PLLs that normally have a constant
rate. So never mind ;-)


Heiko


> Changing parents on rate changes only works when all possible parents of
> all the children involved have a constant rate. IMO allowing reparenting
> on rate changes is a poorly chosen default because it's very unsafe. We
> should rather have a CLK_SET_RATE_ALLOW_REPARENT flag.
>=20
> Sascha
>=20
>=20




