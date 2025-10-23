Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F393C02FCE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 20:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBDA10E08D;
	Thu, 23 Oct 2025 18:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="p7FWOdK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD4510E08D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=N8OwZF05ONeAMEm4PJ6y8hqux3gt6ZGZAzMS1k+UvV4=; b=p7FWOdK0vNjYLq4cnFZWadvUHd
 KRqp26zeh9fW6InTNO7bIPZcYJlv1FXMPetXYTjPIJVSBEK+VWXDE4GDL2qw0YFfpNgeR1fv6bixL
 iq30kxHVz2shQXqmpwAMXfQsLi1VbofovIvsCw8ERInmDQT219ivNheJ4AWCKjFdxP9U=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:60432
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vC069-0006cp-Vs; Thu, 23 Oct 2025 14:31:42 -0400
Date: Thu, 23 Oct 2025 14:31:41 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
In-Reply-To: <20251022235903.1091453-2-chris.brandt@renesas.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.6 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

Hi Chris,

On Wed, 22 Oct 2025 19:59:02 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
> 
> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
> - Added Reviewed-by and Tested-by (Biju)
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 129 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |  11 +++
>  2 files changed, 130 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 07909e80bae2..0e9362c2ca95 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,19 @@
>  #define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))
>  
> +#define PLL5_FOUTVCO_MIN	800000000
> +#define PLL5_FOUTVCO_MAX	3000000000
> +#define PLL5_POSTDIV_MIN	1
> +#define PLL5_POSTDIV_MAX	7
> +#define PLL5_POSTDIV_DEF	1
> +#define PLL5_REFDIV_MIN		1
> +#define PLL5_REFDIV_MAX		2
> +#define PLL5_REFDIV_DEF		1
> +#define PLL5_INTIN_MIN		20
> +#define PLL5_INTIN_MAX		320
> +#define PLL5_INTIN_DEF		125
> +#define PLL5_FRACIN_DEF		0
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +142,12 @@ struct rzg2l_pll5_param {
>  	u8 pl5_spread;
>  };
>  
> +/* PLL5 output will be used for DPI or MIPI-DSI */
> +static int dsi_div_target = PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock changes depending on resolution and lanes. */
> +static unsigned int dsi_div_ab;
> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>  	u8 clksrc;
>  	u8 dsi_div_a;
> @@ -557,23 +576,104 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>  }
>  
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +			       struct rzg2l_pll5_param *params,
>  			       unsigned long rate)
>  {
>  	unsigned long foutpostdiv_rate, foutvco_rate;
> +	u8 div = 1;
> +	unsigned int a, b;
> +
> +	if (priv->mux_dsi_div_params.clksrc)
> +		div = 2;
> +
> +	/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +	for (a = 0; a < 4; a++) {
> +		if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
> +			continue;	/* 1/1 div not supported for DIV_DSI_A for DPI */
> +
> +		for (b = 0; b < 16; b++) {
> +			if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
> +				continue;	/* Only 1/1 div supported for DIV_DSI_B in DPI */
>  
> -	params->pl5_intin = rate / MEGA;
> -	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
> -	params->pl5_refdiv = 2;
> -	params->pl5_postdiv1 = 1;
> -	params->pl5_postdiv2 = 1;
> +			if ((b + 1) << a == dsi_div_ab) {
> +				priv->mux_dsi_div_params.dsi_div_a = a;
> +				priv->mux_dsi_div_params.dsi_div_b = b;
> +
> +				goto calc_pll_clk;
> +			}
> +		}
> +	}

If we arrive at this point, it seems that these values:
    priv->mux_dsi_div_params.dsi_div_a
    priv->mux_dsi_div_params.dsi_div_b

were not initialised by the previous loop. Is this expected? If yes,
maybe a comment would help?

> +
> +calc_pll_clk:
> +	/*
> +	 * Below conditions must be set for PLL5 parameters:
> +	 * - REFDIV must be between 1 and 2.

I am assuming this means PLL5_POSTDIV_MIN and PLL5_POSTDIV_MAX? If
these macros change, then that mean you would also need to change your
comment, not very practical and error-prone. I would suggest to remove
this comment altogether.

> +	 * - POSTDIV1/2 must be between 1 and 7.
> +	 * - INTIN must be between 20 and 320.
> +	 * - FOUTVCO must be between 800MHz and 3000MHz.

Same here.

> +	 */
> +	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> +	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> +	     params->pl5_postdiv1++) {
> +		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> +		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> +		     params->pl5_postdiv2++) {
> +			foutvco_rate = rate * (priv->mux_dsi_div_params.dsi_div_b + 1) * div *
> +				       params->pl5_postdiv1 * params->pl5_postdiv2 <<
> +				       priv->mux_dsi_div_params.dsi_div_a;
> +
> +			if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
> +			    foutvco_rate > PLL5_FOUTVCO_MAX - 1)
> +				continue;
> +
> +			for (params->pl5_refdiv = PLL5_REFDIV_MIN;
> +			     params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
> +			     params->pl5_refdiv++) {
> +				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +				    params->pl5_intin > PLL5_INTIN_MAX - 1)
> +					continue;
> +				params->pl5_fracin = div_u64(((u64)
> +						     (foutvco_rate * params->pl5_refdiv) %
> +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +
> +				params->pl5_fracin = div_u64((u64)
> +						     ((foutvco_rate * params->pl5_refdiv) %
> +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +
> +				goto clk_valid;
> +			}
> +		}
> +	}
> +
> +	/* Set defaults since valid clock was not found */
> +	params->pl5_intin = PLL5_INTIN_DEF;
> +	params->pl5_fracin = PLL5_FRACIN_DEF;
> +	params->pl5_refdiv = PLL5_REFDIV_DEF;
> +	params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
> +	params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
> +
> +clk_valid:
>  	params->pl5_spread = 0x16;
>  
>  	foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
>  					   (params->pl5_intin << 24) + params->pl5_fracin),
>  			       params->pl5_refdiv) >> 24;
> -	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> -						 params->pl5_postdiv1 * params->pl5_postdiv2);
> +
> +	/* If foutvco is above 1.5GHz, change parent and recalculate */

Similar suggestion for hardcoded values in comments, maybe replace
"above 1.5GHz" with "too high"...

> +	if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {

Define a macro for 1500000000?

> +		priv->mux_dsi_div_params.clksrc = 0;
> +		dsi_div_ab *= 2;
> +		dsi_div_target = PLL5_TARGET_DSI;	/* Assume MIPI-DSI */
> +		return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> +	}
> +
> +	foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
> +					     params->pl5_postdiv1 * params->pl5_postdiv2);
>  
>  	return foutpostdiv_rate;
>  }
> @@ -607,7 +707,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
>  	struct rzg2l_pll5_param params;
>  	unsigned long parent_rate;
>  
> -	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
>  
>  	if (priv->mux_dsi_div_params.clksrc)
>  		parent_rate /= 2;
> @@ -626,6 +726,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
>  	return 0;
>  }
>  
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target)
> +{
> +	dsi_div_ab = divider;
> +	dsi_div_target = target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>  				      unsigned long rate,
>  				      unsigned long parent_rate)
> @@ -858,7 +965,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>  
>  	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
>  	sipll5->foutpostdiv_rate =
> -		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>  
>  	/* Put PLL5 into standby mode */
>  	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
> @@ -948,6 +1055,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>  	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
>  	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
>  	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> +	dsi_div_ab = (priv->mux_dsi_div_params.dsi_div_b + 1) <<
> +		     priv->mux_dsi_div_params.dsi_div_a;
>  
>  	return clk_hw->clk;
>  }
> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index 0ebbe2f0b45e..f2edd1f4a6d9 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -16,6 +16,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>  
> +enum {
> +	PLL5_TARGET_DPI,
> +	PLL5_TARGET_DSI
> +};
> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -32,4 +37,10 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev	NULL
>  #define cpg_mssr_detach_dev	NULL
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
> +#else
> +#define rzg2l_cpg_dsi_div_set_divider	NULL
> +#endif
>  #endif
> -- 
> 2.50.1
> 
> 


-- 
Hugo Villeneuve
