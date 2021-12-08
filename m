Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819346D8EC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 17:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F6A6F9BC;
	Wed,  8 Dec 2021 16:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0D173ECF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 16:51:48 +0000 (UTC)
Received: from ip4d17a2ab.dynamic.kabel-deutschland.de ([77.23.162.171]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mv0AS-0000IK-JA; Wed, 08 Dec 2021 17:51:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 18/18] [HACK, RFC] clk: rk3568: do not divide dclk_vop0
Date: Wed, 08 Dec 2021 17:51:43 +0100
Message-ID: <10508489.WJHl9KOmCk@diego>
In-Reply-To: <20211208151230.3695378-19-s.hauer@pengutronix.de>
References: <20211208151230.3695378-1-s.hauer@pengutronix.de>
 <20211208151230.3695378-19-s.hauer@pengutronix.de>
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
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

Am Mittwoch, 8. Dezember 2021, 16:12:30 CET schrieb Sascha Hauer:
> On the rk3568 we have this (simplified) situation:
>=20
>  .--------.     .-----.    .---------.
> -| hpll   |--.--| /n  |----|dclk_vop0|-
>  `--------=B4  |  `-----=B4    `---------=B4
>              |  .-----.    .---------.
>              `--| /m  |----|dclk_vop1|-
>              |  `-----=B4    `---------=B4
>              |             .---------.
>              `-------------|hdmi_ref |-
>                            `---------=B4
>=20
> hpll is the PLL that drives the HDMI reference clock and the pixel
> clocks for the different CRTCs (dclk_vop0/1). Between the pixel clocks
> and the hpll there are programmable dividers whereas the HDMI reference
> clock is directly connected to the hpll.
>=20
> For the HDMI output to work the pixel clock must be the same as the HDMI
> reference clock, hence the dividers must be programmed to 1. Normally a
> rate change on dclk_vop0/1 propagates through to the hpll and the clock
> framework picks a suitable combination of hpll and divider settings. by
> accident it picks a divider setting of 1 for the standard 1080p case,
> but other divider settings for most other resolutions leaving the HDMI
> port non working.
>=20
> This patch is not a solution, it merely puts the finger in the wound. We
> leave out the divider for the composite clock for dclk_vop0 which then
> leaves the divider at the bootloader default setting of 1. I assume
> the divider is disturbing only for the HDMI case, but needed for other
> outputs. Any thoughts how this can be handled?

I'm not even sure if/how the common clock framework keeps track of
diverging wishes to parent-rates :-) .

But I do see two direct issues in the _existing_ code.

dclk_vop0/1 uses CLK_SET_RATE_PARENT so is allowed to change
the rates of its parent clock(s).

Its parent clocks are not only hpll but can also be vpll, gpll and cpll.
So this can cause even more mayhem, if the ccf for example decides
to select the gpll and then change its rate,which may result in a lot
of peripherals getting their rates changed under them ;-) .

On the other hand I see in the clock driver that hdmi-ref is not allowed
to change its parent rate, so can only select between hpll and hpll_ph0
(1/2 the rate?).

So I guess, one way could be:
=2D add CLK_SET_RATE_PARENT to the hdmi-ref clock
=2D drop CLK_SET_RATE_PARENT from the dclks
=2D make sure hdmi-clock is set before the dclk


Heiko


> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/rockchip/clk-rk3568.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk=
=2Drk3568.c
> index 69a9e8069a486..2d04d8253ca22 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -1038,8 +1038,8 @@ static struct rockchip_clk_branch rk3568_clk_branch=
es[] __initdata =3D {
>  			RK3568_CLKGATE_CON(20), 8, GFLAGS),
>  	GATE(HCLK_VOP, "hclk_vop", "hclk_vo", 0,
>  			RK3568_CLKGATE_CON(20), 9, GFLAGS),
> -	COMPOSITE(DCLK_VOP0, "dclk_vop0", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_P=
ARENT | CLK_SET_RATE_NO_REPARENT,
> -			RK3568_CLKSEL_CON(39), 10, 2, MFLAGS, 0, 8, DFLAGS,
> +	COMPOSITE_NODIV(DCLK_VOP0, "dclk_vop0", hpll_vpll_gpll_cpll_p, CLK_SET_=
RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			RK3568_CLKSEL_CON(39), 10, 2, MFLAGS,
>  			RK3568_CLKGATE_CON(20), 10, GFLAGS),
>  	COMPOSITE(DCLK_VOP1, "dclk_vop1", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_P=
ARENT | CLK_SET_RATE_NO_REPARENT,
>  			RK3568_CLKSEL_CON(40), 10, 2, MFLAGS, 0, 8, DFLAGS,
>=20




