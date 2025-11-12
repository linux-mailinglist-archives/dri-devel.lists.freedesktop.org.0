Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC8C508CF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 05:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3D510E688;
	Wed, 12 Nov 2025 04:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="yOlYPZVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D6710E688
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 04:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=821GAUmPBVEwrBJC99nnDTItYKBj2TA2hT9R1ERel+k=; b=yOlYPZVmmb0iVUaEcyn/MV5F9l
 cyMaIscqGIXZ5S6MYe/SkVU7q0S+/o0r0CUuWN0KbowakMHRljB/h7T7JCp+TKgB3E3I7Q5+HaQzV
 ROBpbdao2+kP3rjiM7UYnYnEYWJXtqcXQ65juGiJs+N4Roj7fbMhUEchyynb/1osn9hg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:45172
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vJ2fa-0007Ue-Tn; Tue, 11 Nov 2025 23:41:24 -0500
Date: Tue, 11 Nov 2025 23:41:22 -0500
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
Message-Id: <20251111234122.5542a64223c6e286ca89dbd8@hugovil.com>
In-Reply-To: <20251105222530.979537-2-chris.brandt@renesas.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
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

On Wed,  5 Nov 2025 17:25:29 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
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
> 
> v3->v4:
> - Changed <,> to <=,>=  (Hugo)
> - Removed duplicate code bock (copy/paste mistake) (Hugo)
> - Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=n (Geert)
> - Remove comment "Below conditions must be set.." (Hugo)
> - Remove +1,-1 from pl5_intin comparison math (kernel test robot)
> - Remove default register settings (PLL5_xxx_DEF) because makes no sense
> - If any calcualtion error, print a message and return a rate of 0
> - Rename global var "dsi_div_ab" to "dsi_div_ab_desired"
> - Check the range of hsclk
> - The correct clock parent is determined by if the divider is even/odd
> - Add in all the restrictions from DIV A,B from the hardware manual
> - No more need to be a recursive function
> - DPI settings must have DSI_DIV_B be '0' (divide 1/1)
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 147 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |  12 +++
>  2 files changed, 146 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 07909e80bae2..1a552ea1c535 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,17 @@
>  #define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))
>  
> +#define PLL5_FOUTVCO_MIN	800000000
> +#define PLL5_FOUTVCO_MAX	3000000000
> +#define PLL5_POSTDIV_MIN	1
> +#define PLL5_POSTDIV_MAX	7
> +#define PLL5_REFDIV_MIN		1
> +#define PLL5_REFDIV_MAX		2
> +#define PLL5_INTIN_MIN		20
> +#define PLL5_INTIN_MAX		320
> +#define PLL5_HSCLK_MIN		10000000
> +#define PLL5_HSCLK_MAX		187500000
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +140,12 @@ struct rzg2l_pll5_param {
>  	u8 pl5_spread;
>  };
>  
> +/* PLL5 output will be used for DPI or MIPI-DSI */
> +static int dsi_div_target = PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock depending on number of lanes and bpp. */
> +static unsigned int dsi_div_ab_desired;

If I understand correctly, this value should hold:
    (b + 1) << a
with:
    a = 0 to 3
    b = 0 to 15
this gives a maximum of:
    (15 + 1) << 3 = 128

it is also computed as "DSI_AB_divider = bpp * 2 / num_lanes"
giving a maximum of 24 * 2 / 1 = 48

So change type to u8?

> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>  	u8 clksrc;
>  	u8 dsi_div_a;
> @@ -557,23 +574,118 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>  }
>  
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +			       struct rzg2l_pll5_param *params,
>  			       unsigned long rate)
>  {
>  	unsigned long foutpostdiv_rate, foutvco_rate;
> +	unsigned long hsclk;
> +	unsigned int a, b, odd;
> +	unsigned int dsi_div_ab_calc;
> +

Based on my tests, it seems we can arrive at this point with a
non-initialized dsi_div_ab_desired (0). Since valid values are from 1
to 128, add a check for this before using it.

> +	if (dsi_div_target == PLL5_TARGET_DSI) {
> +		/*
> +		 * VCO-->[POSTDIV1,2]--FOUTPOSTDIV-->|   |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
> +		 *            |                      |-->|
> +		 *            |-->[1/2]---FOUT1PH0-->|   |-->[1/16]---------------> hsclk (MIPI-PHY)
> +		 */
> +
> +		/* Check hsclk */
> +		hsclk = rate * dsi_div_ab_desired / 16;
> +		if (hsclk < PLL5_HSCLK_MIN || hsclk > PLL5_HSCLK_MAX) {
> +			dev_err(priv->dev, "hsclk out of range\n");
> +			return 0;
> +		}
> +
> +		/* Determine the correct clock source based on even/odd of the divider */
> +		odd = dsi_div_ab_desired & 1;
> +		if (odd) {
> +			/* divider is odd */

You can drop this comment, as your "odd" variable is self-explanatory.

> +			priv->mux_dsi_div_params.clksrc = 0;	/* FOUTPOSTDIV */
> +			dsi_div_ab_calc = dsi_div_ab_desired;
> +		} else {
> +			/* divider is even */

ditto.

> +			priv->mux_dsi_div_params.clksrc = 1;	/*  FOUT1PH0 */
> +			dsi_div_ab_calc = dsi_div_ab_desired / 2;
> +		}
> +
> +		/* Calculate the DIV_DSI_A and DIV_DSI_B based on the desired divider */
> +		for (a = 0; a < 4; a++) {
> +			/* FOUT1PH0: Max output of DIV_DSI_A is 750MHz so at least 1/2 to be safe */
> +			if (!odd && a == 0)
> +				continue;
> +
> +			/* FOUTPOSTDIV: DIV_DSI_A must always be 1/1 */
> +			if (odd && a != 0)
> +				continue;

Use break instead of continue?

> +
> +			for (b = 0; b < 16; b++) {
> +				/* FOUTPOSTDIV: DIV_DSI_B must always be odd divider 1/(b+1) */
> +				if (odd && b & 1)
> +					continue;
> +
> +				if ((b + 1) << a == dsi_div_ab_calc) {


It took me a while to decipher this :)

Use an inline function to compute div_ab to improve readability,
and you can reuse this function elsewhere instead of hardcoding the
div_ab value (to for example):

static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b)
{
	return (b + 1) << a;
}

and then:

    ...
    if (rzg2l_cpg_div_ab(a, b) == dsi_div_ab_calc) {
    ...

> +					priv->mux_dsi_div_params.dsi_div_a = a;
> +					priv->mux_dsi_div_params.dsi_div_b = b;
> +					goto calc_pll_clk;
> +				}
> +			}
> +		}
>  
> -	params->pl5_intin = rate / MEGA;
> -	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
> -	params->pl5_refdiv = 2;
> -	params->pl5_postdiv1 = 1;
> -	params->pl5_postdiv2 = 1;
> +		dev_err(priv->dev, "Failed to calculate DIV_DSI_A,B\n");
> +		return 0;
> +	}
> +
> +	if (dsi_div_target == PLL5_TARGET_DPI) {
> +		/* Fixed settings for DPI */
> +		priv->mux_dsi_div_params.clksrc = 0;
> +		priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +		priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +		dsi_div_ab_desired = 8;			/* (1 << a) * (b + 1) */
> +	}

Here this block could be combined as an if/else-if:

    if (dsi_div_target == PLL5_TARGET_DPI) {
        ...
    } else if (dsi_div_target == PLL5_TARGET_DSI) {
        ...

> +
> +calc_pll_clk:
> +	/* PLL5 (MIPI_DSI_PLLCLK) = VCO / POSTDIV1 / POSTDIV2 */
> +	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> +	     params->pl5_postdiv1 <= PLL5_POSTDIV_MAX;
> +	     params->pl5_postdiv1++) {
> +		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> +		     params->pl5_postdiv2 <= PLL5_POSTDIV_MAX;
> +		     params->pl5_postdiv2++) {
> +			foutvco_rate = rate * params->pl5_postdiv1 * params->pl5_postdiv2 *
> +				       dsi_div_ab_desired;
> +			if (foutvco_rate <= PLL5_FOUTVCO_MIN || foutvco_rate >= PLL5_FOUTVCO_MAX)
> +				continue;
> +
> +			for (params->pl5_refdiv = PLL5_REFDIV_MIN;
> +			     params->pl5_refdiv <= PLL5_REFDIV_MAX;
> +			     params->pl5_refdiv++) {
> +				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> +				    params->pl5_intin > PLL5_INTIN_MAX)
> +					continue;

Insert line for readability

> +				params->pl5_fracin = div_u64(((u64)
> +						     (foutvco_rate * params->pl5_refdiv) %
> +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				goto clk_valid;
> +			}
> +		}
> +	}
> +
> +	dev_err(priv->dev, "Failed to calculate PLL5 settings\n");
> +	return 0;
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
> +	foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
> +					     params->pl5_postdiv1 * params->pl5_postdiv2);
>  
>  	return foutpostdiv_rate;

You can drop foutpostdiv_rate intermediate variable and return directly,
all on one line:

    return DIV_ROUND_CLOSEST(foutvco_rate, params->pl5_postdiv1 * params->pl5_postdiv2);

>  }
> @@ -607,7 +719,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
>  	struct rzg2l_pll5_param params;
>  	unsigned long parent_rate;
>  
> -	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
>  
>  	if (priv->mux_dsi_div_params.clksrc)
>  		parent_rate /= 2;
> @@ -626,6 +738,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
>  	return 0;
>  }
>  
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target)
> +{
> +	dsi_div_ab_desired = divider;
> +	dsi_div_target = target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>  				      unsigned long rate,
>  				      unsigned long parent_rate)
> @@ -858,7 +977,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>  
>  	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
>  	sipll5->foutpostdiv_rate =
> -		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);

Before this patch, rzg2l_cpg_get_foutpostdiv_rate() seemed to
always return a valid rate. Therefore, no validation was done of the
computed rate.

Now with your patch it may return "0" if the rate is invalid. Therefore
you need to check for this here and return a corresponding error
code.

 
>  	/* Put PLL5 into standby mode */
>  	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
> @@ -945,9 +1064,11 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
> -	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
> -	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> +	/* Default settings for DPI */
> +	priv->mux_dsi_div_params.clksrc = 0;
> +	priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +	priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +	dsi_div_ab_desired = 8;			/* (1 << a) * (b + 1) */

Use inline function rzg2l_cpg_div_ab() previously suggested.

>  
>  	return clk_hw->clk;
>  }
> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index 0ebbe2f0b45e..dc8ae83460f4 100644
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
> @@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev	NULL
>  #define cpg_mssr_detach_dev	NULL
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
> +#else
> +static inline void rzg2l_cpg_dsi_div_set_divider(int divider, int target) { }
> +#endif
> +
>  #endif
> -- 
> 2.50.1
> 
> 


-- 
Hugo Villeneuve
