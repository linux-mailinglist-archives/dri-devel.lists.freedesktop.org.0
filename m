Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC41B81D5B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 22:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA46010E1E7;
	Wed, 17 Sep 2025 20:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="f1CH0B4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05FE10E1E7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 20:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=uU7GEhoenCBxnb5vsU1/qiJ57eGmzld0kOVXPNrAnyY=; b=f1CH0B4/UgT3hWGtAeg/6QAu1/
 5dTohVidnib8RaHN+86UyzV6eIza7XzPoXl7ZDVnnuwz/VFkPKSeDQAI5cOFK+jag8ekPc5j9AB5G
 V+pooEVX7c37VG+zFBvtZlfI1Nbtg8xyxHcJXbicmi6hvTEcRNUhcyybpU1jSjwKH11Y=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:55420
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uyydA-0000ZZ-3v; Wed, 17 Sep 2025 16:19:56 -0400
Date: Wed, 17 Sep 2025 16:19:55 -0400
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
Message-Id: <20250917161955.8927cc071c96641c32878b01@hugovil.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-2-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -3.3 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
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

On Fri, 12 Sep 2025 10:20:55 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> 
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 129 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |   4 +
>  2 files changed, 123 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 187233302818..33d799a2e8ac 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,22 @@
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
> +#define PLL5_TARGET_DPI		0
> +#define PLL5_TARGET_DSI		1
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +145,12 @@ struct rzg2l_pll5_param {
>  	u8 pl5_spread;
>  };
>  
> +/* PLL5 output will be used for DPI or MIPI-DSI */
> +static int dsi_div_target = PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock changes depending on resolution and lanes. */
> +static int dsi_div_ab;
> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>  	u8 clksrc;
>  	u8 dsi_div_a;
> @@ -557,24 +579,102 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
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
> +	bool found = 0;
> +	int a, b;
> +
> +	if (priv->mux_dsi_div_params.clksrc)
> +		div = 2;
> +
> +	/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +	for (a = 0; a < 4; a++) {
> +

Remove empty line.

> +		if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
> +			continue;	/* 1/1 div not supported for DIV_DSI_A for DPI */
> +
> +		for (b = 0; b < 16; b++) {
> +

Remove empty line.

> +			if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
> +				continue;	/* Only 1/1 div supported for DIV_DSI_B in DPI */
> +
> +			if (((1 << a) * (b + 1)) == dsi_div_ab) {
> +				priv->mux_dsi_div_params.dsi_div_a = a;
> +				priv->mux_dsi_div_params.dsi_div_b = b;
> +
> +				goto found_dsi_div;
> +			}
> +		}
> +	}

If we arrive at this point, with the name of the label being
"found_dsi_div" we assume that dsi div was found.

But looking at the code above, if you hit the 'continue' statements, or
if the check for "if (((1 << a) * (b + 1)) == dsi_div_ab) {" is not
triggered, is "found_dsi_div" still making sense?

Maybe its is just a matter of renaming that goto label so that it
removes any confusion? (ex: found_dsi_div -> process_dsi_div or
check_clk?)

> +
> +found_dsi_div:
> +	/*
> +	 * Below conditions must be set for PLL5 parameters:
> +	 * - REFDIV must be between 1 and 2.
> +	 * - POSTDIV1/2 must be between 1 and 7.
> +	 * - INTIN must be between 20 and 320.
> +	 * - FOUTVCO must be between 800MHz and 3000MHz.
> +	 */
> +	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> +	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> +	     params->pl5_postdiv1++) {
> +		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> +		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> +		     params->pl5_postdiv2++) {
> +			foutvco_rate = rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *
> +					       (priv->mux_dsi_div_params.dsi_div_b + 1)) *
> +					      div * params->pl5_postdiv1 * params->pl5_postdiv2;
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
> +				found = 1;
> +				goto found_clk;
> +			}
> +		}
> +	}
> +

Again, the next goto label seems to indicate that we arrive here if the
clk was found, but this is not the case, and a little
confusing...

> +found_clk:
> +	if (!found) {

Confusing to have a label that says "found_clk", but in reality it may
not have been found :)

Maybe remove the "found" variable, and the found_clk label, and see
rest of comments below...


> +		params->pl5_intin = PLL5_INTIN_DEF;
> +		params->pl5_fracin = PLL5_FRACIN_DEF;
> +		params->pl5_refdiv = PLL5_REFDIV_DEF;
> +		params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
> +		params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
> +	}

... add a label "clk_valid" (or other) here, and replace
"goto found_clk" above with "goto clk_valid"?

>  
> -	params->pl5_intin = rate / MEGA;
> -	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
> -	params->pl5_refdiv = 2;
> -	params->pl5_postdiv1 = 1;
> -	params->pl5_postdiv2 = 1;
>  	params->pl5_spread = 0x16;
>  
>  	foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> -					   (params->pl5_intin << 24) + params->pl5_fracin),
> -			       params->pl5_refdiv) >> 24;
> +		       (params->pl5_intin << 24) + params->pl5_fracin),
> +		       params->pl5_refdiv) >> 24;
>  	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
>  						 params->pl5_postdiv1 * params->pl5_postdiv2);
>  

If the below condition is met, it seems that you compute
foutpostdiv_rate for nothing here, since you will recursively call
the function again and recompute it. Maybe move
foutpostdiv_rate computation after the below if() bloc?

> +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> +	if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
> +		priv->mux_dsi_div_params.clksrc = 0;
> +		dsi_div_ab *= 2;
> +		dsi_div_target = PLL5_TARGET_DSI;	/* Assume MIPI-DSI */
> +		return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> +	}
> +
>  	return foutpostdiv_rate;
>  }
>  
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
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target)
> +{
> +	dsi_div_ab = divider;
> +	dsi_div_target = target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>  				      unsigned long rate,
>  				      unsigned long parent_rate)
> @@ -859,7 +966,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>  
>  	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
>  	sipll5->foutpostdiv_rate =
> -		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>  
>  	/* Put PLL5 into standby mode */
>  	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
> @@ -949,6 +1056,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>  	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
>  	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
>  	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> +	dsi_div_ab = (1 << priv->mux_dsi_div_params.dsi_div_a) *
> +		     (priv->mux_dsi_div_params.dsi_div_b + 1);
>  
>  	return clk_hw->clk;
>  }
> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index 0ebbe2f0b45e..0cdbd3922cf4 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_detach_dev	NULL
>  #endif
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target);
> +#endif
> -- 
> 2.50.1
> 
> 


-- 
Hugo Villeneuve
