Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AEB40AC41
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 13:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA606E479;
	Tue, 14 Sep 2021 11:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A816E479
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 11:14:36 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mQ6OW-0006FY-Ky; Tue, 14 Sep 2021 13:14:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@linux.ie,
 hjc@rock-chips.com, andriy.shevchenko@linux.intel.com,
 zhangqing@rock-chips.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] drm/rockchip: Update crtc fixup to account for fractional
 clk change
Date: Tue, 14 Sep 2021 13:14:28 +0200
Message-ID: <2719341.5nTrVeAVQv@diego>
In-Reply-To: <20210908135356.18689-1-macroalpha82@gmail.com>
References: <20210908135356.18689-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Mittwoch, 8. September 2021, 15:53:56 CEST schrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> After commit 928f9e268611 ("clk: fractional-divider: Hide
> clk_fractional_divider_ops from wide audience") was merged it appears
> that the DSI panel on my Odroid Go Advance stopped working. Upon closer
> examination of the problem, it looks like it was the fixup in the
> rockchip_drm_vop.c file was causing the issue. The changes made to the
> clk driver appear to change some assumptions made in the fixup.
> 
> After debugging the working 5.14 kernel and the no-longer working
> 5.15 kernel, it looks like this was broken all along but still
> worked, whereas after the fractional clock change it stopped
> working despite the issue (it went from sort-of broken to very broken).
> 
> In the 5.14 kernel the dclk_vopb_frac was being requested to be set to
> 17000999 on my board. The clock driver was taking the value of the
> parent clock and attempting to divide the requested value from it
> (17000000/17000999 = 0), then subtracting 1 from it (making it -1),
> and running it through fls_long to get 64. It would then subtract
> the value of fd->mwidth from it to get 48, and then bit shift
> 17000999 to the left by 48, coming up with a very large number of
> 7649082492112076800. This resulted in a numerator of 65535 and a
> denominator of 1 from the clk driver. The driver seemingly would
> try again and get a correct 1:1 value later, and then move on.
> 
> Output from my 5.14 kernel (with some printfs for good measure):
> [    2.830066] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
> [    2.839431] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
> [    2.855980] Clock is dclk_vopb_frac
> [    2.856004] Scale 64, Rate 7649082492112076800, Oldrate 17000999, Parent Rate 17000000, Best Numerator 65535, Best Denominator 1, fd->mwidth 16
> [    2.903529] Clock is dclk_vopb_frac
> [    2.903556] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
> [    2.903579] Clock is dclk_vopb_frac
> [    2.903583] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
> 
> Contrast this with 5.15 after the clk change where the rate of 17000999
> was getting passed and resulted in numerators/denomiators of 17001/
> 17000.
> 
> Output from my 5.15 kernel (with some printfs added for good measure):
> [    2.817571] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
> [    2.826975] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
> [    2.843430] Rate 17000999, Parent Rate 17000000, Best Numerator 17018, Best Denominator 17017
> [    2.891073] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
> [    2.891269] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
> [    2.891281] Rate 17001000, Parent Rate 17000000, Best Numerator 17001, Best Denominator 17000
> 
> After tracing through the code it appeared that this function here was
> adding a 999 to the requested frequency because of how the clk driver
> was rounding/accepting those frequencies. I believe after the changes
> made in the commit listed above the assumptions listed in this driver
> are no longer true. When I remove the + 999 from the driver the DSI
> panel begins to work again.
> 
> Output from my 5.15 kernel with 999 removed (printfs added):
> [    2.852054] rockchip-drm display-subsystem: bound ff460000.vop (ops vop_component_ops)
> [    2.864483] rockchip-drm display-subsystem: bound ff450000.dsi (ops dw_mipi_dsi_rockchip_ops)
> [    2.880869] Clock is dclk_vopb_frac
> [    2.880892] Rate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1
> [    2.928521] Clock is dclk_vopb_frac
> [    2.928551] Rate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1
> [    2.928570] Clock is dclk_vopb_frac
> [    2.928574] Rate 17000000, Parent Rate 17000000, Best Numerator 1, Best Denominator 1
> 
> I have tested the change extensively on my Odroid Go Advance (Rockchip
> RK3326) and it appears to work well. However, this change will affect
> all Rockchip SoCs that use this driver so I believe further testing
> is warranted. Please note that without this change I can confirm
> at least all PX30s with DSI panels will stop working with the 5.15
> kernel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

With 5.15-rc1 on:
- rk3288-pinky+eDP (was working -> still working)
- rk3399-kevin+eDP (was working -> still working)
- px30-minievb (was broken -> working again)

Tested-by: Heiko Stuebner <heiko@sntech.de>


I've also added Doug, maybe he remembers some historic artifact
to keep in mind about the original patch.


Heiko

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index ba9e14da41b4..bfef4f52dce6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1169,31 +1169,16 @@ static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
>  	 *
>  	 * - DRM works in in kHz.
>  	 * - Clock framework works in Hz.
> -	 * - Rockchip's clock driver picks the clock rate that is the
> -	 *   same _OR LOWER_ than the one requested.
>  	 *
>  	 * Action plan:
>  	 *
> -	 * 1. When DRM gives us a mode, we should add 999 Hz to it.  That way
> -	 *    if the clock we need is 60000001 Hz (~60 MHz) and DRM tells us to
> -	 *    make 60000 kHz then the clock framework will actually give us
> -	 *    the right clock.
> -	 *
> -	 *    NOTE: if the PLL (maybe through a divider) could actually make
> -	 *    a clock rate 999 Hz higher instead of the one we want then this
> -	 *    could be a problem.  Unfortunately there's not much we can do
> -	 *    since it's baked into DRM to use kHz.  It shouldn't matter in
> -	 *    practice since Rockchip PLLs are controlled by tables and
> -	 *    even if there is a divider in the middle I wouldn't expect PLL
> -	 *    rates in the table that are just a few kHz different.
> -	 *
> -	 * 2. Get the clock framework to round the rate for us to tell us
> +	 * 1. Get the clock framework to round the rate for us to tell us
>  	 *    what it will actually make.
>  	 *
> -	 * 3. Store the rounded up rate so that we don't need to worry about
> +	 * 2. Store the rounded up rate so that we don't need to worry about
>  	 *    this in the actual clk_set_rate().
>  	 */
> -	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
> +	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000);
>  	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
>  
>  	return true;
> 




