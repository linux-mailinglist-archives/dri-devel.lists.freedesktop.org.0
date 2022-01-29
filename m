Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7794A3115
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 18:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D112910E125;
	Sat, 29 Jan 2022 17:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97310E138
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 17:48:19 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nDrpf-0005ax-H8; Sat, 29 Jan 2022 18:48:15 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 24/27] clk: rk3568: drop CLK_SET_RATE_PARENT from dclk_vop*
Date: Sat, 29 Jan 2022 18:48:13 +0100
Message-ID: <5329207.qDA9hNt6id@diego>
In-Reply-To: <20220126145549.617165-25-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-25-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Mittwoch, 26. Januar 2022, 15:55:46 CET schrieb Sascha Hauer:
> The pixel clocks dclk_vop[012] can be clocked from hpll, vpll, gpll or
> cpll. gpll and cpll also drive many other clocks, so changing the
> dclk_vop[012] clocks could change these other clocks as well. Drop
> CLK_SET_RATE_PARENT to fix that. With this change the VOP2 driver can
> only adjust the pixel clocks with the divider between the PLL and the
> dclk_vop[012] which means the user may have to adjust the PLL clock to a
> suitable rate using the assigned-clock-rate device tree property.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/rockchip/clk-rk3568.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
> index 9d889fc46811..7687c62d1fa8 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -1044,13 +1044,13 @@ static struct rockchip_clk_branch rk3568_clk_branches[] __initdata = {
>  			RK3568_CLKGATE_CON(20), 8, GFLAGS),
>  	GATE(HCLK_VOP, "hclk_vop", "hclk_vo", 0,
>  			RK3568_CLKGATE_CON(20), 9, GFLAGS),
> -	COMPOSITE(DCLK_VOP0, "dclk_vop0", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +	COMPOSITE(DCLK_VOP0, "dclk_vop0", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_NO_REPARENT,

hmm, I'm wondering about the use of having CLK_SET_RATE_NO_REPARENT here
(and even adding it below).

Using SET_RATE_PARENT in the following patch for the hdmi-pll, should give
us at least a suitable rate for the hdmi output, so the vop using that
should already find a nice rate to use.

The normal system-PLLs don't normally don't change their rate at runtime,
so I think we should liberate the dclks to select a PLL that best matches
their target rate - so drop the CLK_SET_RATE_NO_REPARENT as well.

That way the DCLKs can change to another PLL source if that provides
a rate nearer to their target.

Heiko

>  			RK3568_CLKSEL_CON(39), 10, 2, MFLAGS, 0, 8, DFLAGS,
>  			RK3568_CLKGATE_CON(20), 10, GFLAGS),
> -	COMPOSITE(DCLK_VOP1, "dclk_vop1", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +	COMPOSITE(DCLK_VOP1, "dclk_vop1", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_NO_REPARENT,
>  			RK3568_CLKSEL_CON(40), 10, 2, MFLAGS, 0, 8, DFLAGS,
>  			RK3568_CLKGATE_CON(20), 11, GFLAGS),
> -	COMPOSITE(DCLK_VOP2, "dclk_vop2", hpll_vpll_gpll_cpll_p, 0,
> +	COMPOSITE(DCLK_VOP2, "dclk_vop2", hpll_vpll_gpll_cpll_p, CLK_SET_RATE_NO_REPARENT,
>  			RK3568_CLKSEL_CON(41), 10, 2, MFLAGS, 0, 8, DFLAGS,
>  			RK3568_CLKGATE_CON(20), 12, GFLAGS),
>  	GATE(CLK_VOP_PWM, "clk_vop_pwm", "xin24m", 0,
> 




