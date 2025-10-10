Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5627BCCD19
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA38C10EB73;
	Fri, 10 Oct 2025 12:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nvhPta5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC6F10EB73
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:02:26 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85814664;
 Fri, 10 Oct 2025 14:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1760097648;
 bh=bI6gqf6dquXz6V2B2bMTxxsMslxCcGNkjKVZ28aWX4E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nvhPta5POF/rNmveTj3llPR4v0jg8GxFXTvWCwmiFp4TlS+wSRDjnC+p4MN0vJ3gV
 5oYTtUutl57YiVSstwNp4rvmt+S5B7AqDDdaCELDvyyKMCI6o4sg02GSeZeRs4jSEb
 HlwUCVDTm5l93VnmEZWBTNYiwgHszLkqLTYM58vs=
Message-ID: <208ec78a-9c07-4b9e-bbd3-5ad91e767738@ideasonboard.com>
Date: Fri, 10 Oct 2025 15:02:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/10/2025 19:07, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for PLLDSI and its post-dividers to the RZ/V2H CPG driver and
> export a set of helper APIs to allow other consumers (notably the DSI
> driver) to compute and select PLL parameter combinations.
> 
> Introduce per-PLL-DSI state in the CPG private structure and implement
> clk ops and registration for PLLDSI and PLLDSI divider clocks. Implement
> rzv2h_cpg_plldsi_determine_rate and rzv2h_cpg_plldsi_set_rate to drive
> PLL programming via the new per-PLL state and add a plldsi divider clk
> with determine/set/recalc operations that cooperate with the PLL
> algorithm.
> 
> Centralize PLL parameter types and limits by moving definitions into a
> shared header (include/linux/clk/renesas.h). Add struct rzv2h_pll_limits,
> struct rzv2h_pll_pars and struct rzv2h_pll_div_pars, plus the
> RZV2H_CPG_PLL_DSI_LIMITS() macro to declare DSI PLL limits.
> 
> Provide two exported helper functions, rzv2h_get_pll_pars() and
> rzv2h_get_pll_divs_pars(), that perform iterative searches over PLL
> parameters (M, K, P, S) and optional post-dividers to find the best (or
> exact) match for a requested frequency. Export these helpers in the
> "RZV2H_CPG" namespace for use by external drivers.
> 
> This change centralizes DSI PLL rate selection logic, prevents duplicate
> implementations in multiple drivers, and enables the DSI driver to
> request accurate PLL rates and program the hardware consistently.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v9->v10:
> - Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
> - Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
> - Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars()
>   in renesas.h for !CONFIG_CLK_RZV2H case.
> - Updated commit message.
> 
> v8->v9:
> - Dropped `renesas-rzv2h-cpg-pll.h` header and merged into `renesas.h`
> - Exported the symbols for PLL calculation apis
> - Updated commit message
> - Dropped reviewed-by tags due to above changes
> 
> v7->v8:
> - Dropped rzv2h_get_pll_dsi_info() helper and opencoded instead.
> - Dropped is_plldsi parameter from rzv2h_cpg_pll_clk_register()
> 
> v6->v7:
> - Made struct rzv2h_pll_limits more modular also added Ffout limits
> - Made the alogirithm modular and also added apis based on the
>   needs for lvds and dpi
> 
> v5->v6:
> - Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
> - Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
>   CPG_PLL_CLK1_DIV_P macros to use GENMASK
> - Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
> - Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
> - Dropped rzv2h_cpg_plldsi_round_rate() and implemented
>   rzv2h_cpg_plldsi_determine_rate() instead
> - Made use of FIELD_PREP()
> - Moved CPG_CSDIV1 macro in patch 2/4
> - Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
> - Used mul_u32_u32() while calculating output_m and output_k_range
> - Used div_s64() instead of div64_s64() while calculating
>   pll_k
> - Used mul_u32_u32() while calculating fvco and fvco checks
> - Rounded the final output using DIV_U64_ROUND_CLOSEST()
> 
> v4->v5:
> - No changes
> 
> v3->v4:
> - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
>   description freq_millihz
> 
> v2->v3:
> - Update the commit message to clarify the purpose of `renesas-rzv2h-dsi.h`
>   header
> - Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
> - Replaced *_mhz to *_millihz for clarity
> - Updated u64->u32 for fvco limits
> - Initialized the members in declaration order for
>   RZV2H_CPG_PLL_DSI_LIMITS() macro
> - Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
> - Replaced `unsigned long long` with u64
> - Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
>   rzv2h_cpg_pll_clk_recalc_rate() instead
> - In rzv2h_cpg_plldsi_div_set_rate() followed the same style
>   of RMW-operation as done in the other functions
> - Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
> - Dropped rzv2h_cpg_plldsi_clk_register() and reused
>   rzv2h_cpg_pll_clk_register() instead
> - Added a gaurd in renesas-rzv2h-dsi.h header
> 
> v1->v2:
> - No changes
> ---
>  drivers/clk/renesas/rzv2h-cpg.c | 514 +++++++++++++++++++++++++++++++-
>  drivers/clk/renesas/rzv2h-cpg.h |  19 +-
>  include/linux/clk/renesas.h     | 145 +++++++++
>  3 files changed, 669 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
> index ff688dc88ba3..5647f16ea3a8 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -14,9 +14,14 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -26,6 +31,7 @@
>  #include <linux/refcount.h>
>  #include <linux/reset-controller.h>
>  #include <linux/string_choices.h>
> +#include <linux/units.h>
>  
>  #include <dt-bindings/clock/renesas-cpg-mssr.h>
>  
> @@ -47,13 +53,15 @@
>  
>  #define CPG_PLL_STBY(x)		((x))
>  #define CPG_PLL_STBY_RESETB	BIT(0)
> +#define CPG_PLL_STBY_SSC_EN	BIT(2)
>  #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
> +#define CPG_PLL_STBY_SSC_EN_WEN BIT(18)
>  #define CPG_PLL_CLK1(x)		((x) + 0x004)
> -#define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
> -#define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
> -#define CPG_PLL_CLK1_PDIV(x)	FIELD_GET(GENMASK(5, 0), (x))
> +#define CPG_PLL_CLK1_KDIV	GENMASK(31, 16)
> +#define CPG_PLL_CLK1_MDIV	GENMASK(15, 6)
> +#define CPG_PLL_CLK1_PDIV	GENMASK(5, 0)
>  #define CPG_PLL_CLK2(x)		((x) + 0x008)
> -#define CPG_PLL_CLK2_SDIV(x)	FIELD_GET(GENMASK(2, 0), (x))
> +#define CPG_PLL_CLK2_SDIV	GENMASK(2, 0)

These field changes look like something that should be in a separate patch.

I didn't study the PLL configuration code, but the structure looks
sensible to me now. So:

Acked-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi

>  #define CPG_PLL_MON(x)		((x) + 0x010)
>  #define CPG_PLL_MON_RESETB	BIT(0)
>  #define CPG_PLL_MON_LOCK	BIT(4)
> @@ -65,6 +73,22 @@
>  
>  #define CPG_CLKSTATUS0		(0x700)
>  
> +/* On RZ/G3E SoC we have two DSI PLLs */
> +#define MAX_CPG_DSI_PLL		2
> +
> +/**
> + * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
> + *
> + * @pll_dsi_limits: PLL DSI parameters limits
> + * @pll_dsi_parameters: Calculated PLL DSI parameters
> + * @req_pll_dsi_rate: Requested PLL DSI rate
> + */
> +struct rzv2h_pll_dsi_info {
> +	const struct rzv2h_pll_limits *pll_dsi_limits;
> +	struct rzv2h_pll_div_pars pll_dsi_parameters;
> +	unsigned long req_pll_dsi_rate;
> +};
> +
>  /**
>   * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
>   *
> @@ -80,6 +104,7 @@
>   * @ff_mod_status_ops: Fixed Factor Module Status Clock operations
>   * @mstop_count: Array of mstop values
>   * @rcdev: Reset controller entity
> + * @pll_dsi_info: Array of PLL DSI information, holds the limits and parameters
>   */
>  struct rzv2h_cpg_priv {
>  	struct device *dev;
> @@ -98,6 +123,8 @@ struct rzv2h_cpg_priv {
>  	atomic_t *mstop_count;
>  
>  	struct reset_controller_dev rcdev;
> +
> +	struct rzv2h_pll_dsi_info pll_dsi_info[MAX_CPG_DSI_PLL];
>  };
>  
>  #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
> @@ -168,6 +195,462 @@ struct rzv2h_ff_mod_status_clk {
>  #define to_rzv2h_ff_mod_status_clk(_hw) \
>  	container_of(_hw, struct rzv2h_ff_mod_status_clk, fix.hw)
>  
> +/**
> + * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
> + *
> + * @dtable: divider table
> + * @priv: CPG private data
> + * @hw: divider clk
> + * @ddiv: divider configuration
> + */
> +struct rzv2h_plldsi_div_clk {
> +	const struct clk_div_table *dtable;
> +	struct rzv2h_cpg_priv *priv;
> +	struct clk_hw hw;
> +	struct ddiv ddiv;
> +};
> +
> +#define to_plldsi_div_clk(_hw) \
> +	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
> +
> +#define RZ_V2H_OSC_CLK_IN_MEGA		(24 * MEGA)
> +#define RZV2H_MAX_DIV_TABLES		(16)
> +
> +/**
> + * rzv2h_get_pll_pars - Finds the best combination of PLL parameters
> + * for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters
> + * @pars: Pointer to the structure where the best calculated PLL parameters values
> + * will be stored
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
> + * the desired frequency.
> + * There is no direct formula to calculate the PLL parameters, as it's an open
> + * system of equations, therefore this function uses an iterative approach to
> + * determine the best solution. The best solution is one that minimizes the error
> + * (desired frequency - actual frequency).
> + *
> + * Return: true if a valid set of parameters values is found, false otherwise.
> + */
> +bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +			struct rzv2h_pll_pars *pars, u64 freq_millihz)
> +{
> +	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
> +	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
> +	struct rzv2h_pll_pars p, best;
> +
> +	if (freq_millihz > fout_max_millihz ||
> +	    freq_millihz < fout_min_millihz)
> +		return false;
> +
> +	/* Initialize best error to maximum possible value */
> +	best.error_millihz = S64_MAX;
> +
> +	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
> +		u32 fref = RZ_V2H_OSC_CLK_IN_MEGA / p.p;
> +		u16 divider;
> +
> +		for (divider = 1 << limits->s.min, p.s = limits->s.min;
> +			p.s <= limits->s.max; p.s++, divider <<= 1) {
> +			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
> +				u64 output_m, output_k_range;
> +				s64 pll_k, output_k;
> +				u64 fvco, output;
> +
> +				/*
> +				 * The frequency generated by the PLL + divider
> +				 * is calculated as follows:
> +				 *
> +				 * With:
> +				 * Freq = Ffout = Ffvco / 2^(pll_s)
> +				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
> +				 * Ffref = 24MHz / pll_p
> +				 *
> +				 * Freq can also be rewritten as:
> +				 * Freq = Ffvco / 2^(pll_s)
> +				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
> +				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
> +				 *      = output_m + output_k
> +				 *
> +				 * Every parameter has been determined at this
> +				 * point, but pll_k.
> +				 *
> +				 * Considering that:
> +				 * limits->k.min <= pll_k <= limits->k.max
> +				 * Then:
> +				 * -0.5 <= (pll_k / 65536) < 0.5
> +				 * Therefore:
> +				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
> +				 */
> +
> +				/* Compute output M component (in mHz) */
> +				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
> +								 divider);
> +				/* Compute range for output K (in mHz) */
> +				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
> +								       2 * divider);
> +				/*
> +				 * No point in continuing if we can't achieve
> +				 * the desired frequency
> +				 */
> +				if (freq_millihz <  (output_m - output_k_range) ||
> +				    freq_millihz >= (output_m + output_k_range)) {
> +					continue;
> +				}
> +
> +				/*
> +				 * Compute the K component
> +				 *
> +				 * Since:
> +				 * Freq = output_m + output_k
> +				 * Then:
> +				 * output_k = Freq - output_m
> +				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
> +				 * Therefore:
> +				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
> +				 */
> +				output_k = freq_millihz - output_m;
> +				pll_k = div_s64(output_k * 65536ULL * divider,
> +						fref);
> +				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
> +
> +				/* Validate K value within allowed limits */
> +				if (pll_k < limits->k.min ||
> +				    pll_k > limits->k.max)
> +					continue;
> +
> +				p.k = pll_k;
> +
> +				/* Compute (Ffvco * 65536) */
> +				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
> +				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
> +				    fvco > mul_u32_u32(limits->fvco.max, 65536))
> +					continue;
> +
> +				/* PLL_M component of (output * 65536 * PLL_P) */
> +				output = mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
> +				/* PLL_K component of (output * 65536 * PLL_P) */
> +				output += p.k * RZ_V2H_OSC_CLK_IN_MEGA;
> +				/* Make it in mHz */
> +				output *= MILLI;
> +				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
> +
> +				/* Check output frequency against limits */
> +				if (output < fout_min_millihz ||
> +				    output > fout_max_millihz)
> +					continue;
> +
> +				p.error_millihz = freq_millihz - output;
> +				p.freq_millihz = output;
> +
> +				/* If an exact match is found, return immediately */
> +				if (p.error_millihz == 0) {
> +					*pars = p;
> +					return true;
> +				}
> +
> +				/* Update best match if error is smaller */
> +				if (abs(best.error_millihz) > abs(p.error_millihz))
> +					best = p;
> +			}
> +		}
> +	}
> +
> +	/* If no valid parameters were found, return false */
> +	if (best.error_millihz == S64_MAX)
> +		return false;
> +
> +	*pars = best;
> +	return true;
> +}
> +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
> +
> +/*
> + * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters
> + * @pars: Pointer to the structure where the best calculated PLL parameters and
> + * divider values will be stored
> + * @table: Pointer to the array of valid divider values
> + * @table_size: Size of the divider values array
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) and divider
> + * value to achieve the desired frequency. See rzv2h_get_pll_pars() for more details
> + * on how the PLL parameters are calculated.
> + *
> + * freq_millihz is the desired frequency generated by the PLL followed by a
> + * a gear.
> + */
> +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +			     struct rzv2h_pll_div_pars *pars,
> +			     const u8 *table, u8 table_size, u64 freq_millihz)
> +{
> +	struct rzv2h_pll_div_pars p, best;
> +
> +	best.div.error_millihz = S64_MAX;
> +	p.div.error_millihz = S64_MAX;
> +	for (unsigned int i = 0; i < table_size; i++) {
> +		if (!rzv2h_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
> +			continue;
> +
> +		p.div.divider_value = table[i];
> +		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
> +		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
> +
> +		if (p.div.error_millihz == 0) {
> +			*pars = p;
> +			return true;
> +		}
> +
> +		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
> +			best = p;
> +	}
> +
> +	if (best.div.error_millihz == S64_MAX)
> +		return false;
> +
> +	*pars = best;
> +	return true;
> +}
> +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
> +
> +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
> +						      unsigned long parent_rate)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +	struct ddiv ddiv = dsi_div->ddiv;
> +	u32 div;
> +
> +	div = readl(priv->base + ddiv.offset);
> +	div >>= ddiv.shift;
> +	div &= clk_div_mask(ddiv.width);
> +	div = dsi_div->dtable[div].div;
> +
> +	return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +					       struct clk_rate_request *req)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +	struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +	u8 table[RZV2H_MAX_DIV_TABLES] = { 0 };
> +	struct rzv2h_pll_div_pars *dsi_params;
> +	struct rzv2h_pll_dsi_info *dsi_info;
> +	const struct clk_div_table *div;
> +	u64 rate_millihz;
> +	unsigned int i;
> +
> +	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +	dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +	rate_millihz = mul_u32_u32(req->rate, MILLI);
> +	if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +		goto exit_determine_rate;
> +
> +	div = dsi_div->dtable;
> +	i = 0;
> +	for (; div->div; div++) {
> +		if (i >= RZV2H_MAX_DIV_TABLES)
> +			return -EINVAL;
> +		table[i++] = div->div;
> +	}
> +
> +	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params, table, i,
> +				     rate_millihz)) {
> +		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +
> +exit_determine_rate:
> +	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +	req->best_parent_rate = req->rate * dsi_params->div.divider_value;
> +	dsi_info->req_pll_dsi_rate = req->best_parent_rate;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> +					 unsigned long rate,
> +					 unsigned long parent_rate)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +	struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +	struct rzv2h_pll_div_pars *dsi_params;
> +	struct rzv2h_pll_dsi_info *dsi_info;
> +	struct ddiv ddiv = dsi_div->ddiv;
> +	const struct clk_div_table *clkt;
> +	bool divider_found = false;
> +	u32 val, shift;
> +
> +	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +	dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +	for (clkt = dsi_div->dtable; clkt->div; clkt++) {
> +		if (clkt->div == dsi_params->div.divider_value) {
> +			divider_found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!divider_found)
> +		return -EINVAL;
> +
> +	shift = ddiv.shift;
> +	val = readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
> +	val &= ~(clk_div_mask(ddiv.width) << shift);
> +	val |= clkt->val << shift;
> +	writel(val, priv->base + ddiv.offset);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_ops = {
> +	.recalc_rate = rzv2h_cpg_plldsi_div_recalc_rate,
> +	.determine_rate = rzv2h_cpg_plldsi_div_determine_rate,
> +	.set_rate = rzv2h_cpg_plldsi_div_set_rate,
> +};
> +
> +static struct clk * __init
> +rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
> +				  struct rzv2h_cpg_priv *priv)
> +{
> +	struct rzv2h_plldsi_div_clk *clk_hw_data;
> +	struct clk **clks = priv->clks;
> +	struct clk_init_data init;
> +	const struct clk *parent;
> +	const char *parent_name;
> +	struct clk_hw *clk_hw;
> +	int ret;
> +
> +	parent = clks[core->parent];
> +	if (IS_ERR(parent))
> +		return ERR_CAST(parent);
> +
> +	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> +	if (!clk_hw_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk_hw_data->priv = priv;
> +	clk_hw_data->ddiv = core->cfg.ddiv;
> +	clk_hw_data->dtable = core->dtable;
> +
> +	parent_name = __clk_get_name(parent);
> +	init.name = core->name;
> +	init.ops = &rzv2h_cpg_plldsi_div_ops;
> +	init.flags = core->flag;
> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +
> +	clk_hw = &clk_hw_data->hw;
> +	clk_hw->init = &init;
> +
> +	ret = devm_clk_hw_register(priv->dev, clk_hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return clk_hw->clk;
> +}
> +
> +static int rzv2h_cpg_plldsi_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	struct pll_clk *pll_clk = to_pll(hw);
> +	struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +	struct rzv2h_pll_dsi_info *dsi_info;
> +	u64 rate_millihz;
> +
> +	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +	/* check if the divider has already invoked the algorithm */
> +	if (req->rate == dsi_info->req_pll_dsi_rate)
> +		return 0;
> +
> +	/* If the req->rate doesn't match we do the calculation assuming there is no divider */
> +	rate_millihz = mul_u32_u32(req->rate, MILLI);
> +	if (!rzv2h_get_pll_pars(dsi_info->pll_dsi_limits,
> +				&dsi_info->pll_dsi_parameters.pll, rate_millihz)) {
> +		dev_err(priv->dev,
> +			"failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +
> +	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_info->pll_dsi_parameters.pll.freq_millihz, MILLI);
> +	dsi_info->req_pll_dsi_rate = req->rate;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_cpg_pll_set_rate(struct pll_clk *pll_clk,
> +				  struct rzv2h_pll_pars *params,
> +				  bool ssc_disable)
> +{
> +	struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +	u16 offset = pll_clk->pll.offset;
> +	u32 val;
> +	int ret;
> +
> +	/* Put PLL into standby mode */
> +	writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
> +	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +					val, !(val & CPG_PLL_MON_LOCK),
> +					100, 2000);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
> +		return ret;
> +	}
> +
> +	/* Output clock setting 1 */
> +	writel(FIELD_PREP(CPG_PLL_CLK1_KDIV, (u16)params->k) |
> +	       FIELD_PREP(CPG_PLL_CLK1_MDIV, params->m) |
> +	       FIELD_PREP(CPG_PLL_CLK1_PDIV, params->p),
> +	       priv->base + CPG_PLL_CLK1(offset));
> +
> +	/* Output clock setting 2 */
> +	val = readl(priv->base + CPG_PLL_CLK2(offset));
> +	writel((val & ~CPG_PLL_CLK2_SDIV) | FIELD_PREP(CPG_PLL_CLK2_SDIV, params->s),
> +	       priv->base + CPG_PLL_CLK2(offset));
> +
> +	/* Put PLL to normal mode */
> +	if (ssc_disable)
> +		val = CPG_PLL_STBY_SSC_EN_WEN;
> +	else
> +		val = CPG_PLL_STBY_SSC_EN_WEN | CPG_PLL_STBY_SSC_EN;
> +	writel(val | CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> +	       priv->base + CPG_PLL_STBY(offset));
> +
> +	/* PLL normal mode transition, output clock stability check */
> +	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +					val, (val & CPG_PLL_MON_LOCK),
> +					100, 2000);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk = to_pll(hw);
> +	struct rzv2h_pll_dsi_info *dsi_info;
> +	struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +
> +	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +
> +	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
> +}
> +
>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
>  {
>  	struct pll_clk *pll_clk = to_pll(hw);
> @@ -231,12 +714,19 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>  	clk1 = readl(priv->base + CPG_PLL_CLK1(pll.offset));
>  	clk2 = readl(priv->base + CPG_PLL_CLK2(pll.offset));
>  
> -	rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(clk1) << 16) +
> -			       CPG_PLL_CLK1_KDIV(clk1), 16 + CPG_PLL_CLK2_SDIV(clk2));
> +	rate = mul_u64_u32_shr(parent_rate, (FIELD_GET(CPG_PLL_CLK1_MDIV, clk1) << 16) +
> +			       (s16)FIELD_GET(CPG_PLL_CLK1_KDIV, clk1),
> +			       16 + FIELD_GET(CPG_PLL_CLK2_SDIV, clk2));
>  
> -	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));
> +	return DIV_ROUND_CLOSEST_ULL(rate, FIELD_GET(CPG_PLL_CLK1_PDIV, clk1));
>  }
>  
> +static const struct clk_ops rzv2h_cpg_plldsi_ops = {
> +	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
> +	.determine_rate = rzv2h_cpg_plldsi_determine_rate,
> +	.set_rate = rzv2h_cpg_plldsi_set_rate,
> +};
> +
>  static const struct clk_ops rzv2h_cpg_pll_ops = {
>  	.is_enabled = rzv2h_cpg_pll_clk_is_enabled,
>  	.enable = rzv2h_cpg_pll_clk_enable,
> @@ -263,6 +753,10 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>  	if (!pll_clk)
>  		return ERR_PTR(-ENOMEM);
>  
> +	if (core->type == CLK_TYPE_PLLDSI)
> +		priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limits =
> +			core->cfg.pll.limits;
> +
>  	parent_name = __clk_get_name(parent);
>  	init.name = core->name;
>  	init.ops = ops;
> @@ -587,6 +1081,12 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>  	case CLK_TYPE_SMUX:
>  		clk = rzv2h_cpg_mux_clk_register(core, priv);
>  		break;
> +	case CLK_TYPE_PLLDSI:
> +		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops);
> +		break;
> +	case CLK_TYPE_PLLDSI_DIV:
> +		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
> +		break;
>  	default:
>  		goto fail;
>  	}
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index e2053049c299..637803bc1e89 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -22,15 +22,20 @@ struct pll {
>  	unsigned int offset:9;
>  	unsigned int has_clkn:1;
>  	unsigned int instance:2;
> +	const struct rzv2h_pll_limits *limits;
>  };
>  
> -#define PLL_PACK(_offset, _has_clkn, _instance) \
> +#define PLL_PACK_LIMITS(_offset, _has_clkn, _instance, _limits) \
>  	((struct pll){ \
>  		.offset = _offset, \
>  		.has_clkn = _has_clkn, \
> -		.instance = _instance \
> +		.instance = _instance, \
> +		.limits = _limits \
>  	})
>  
> +#define PLL_PACK(_offset, _has_clkn, _instance) \
> +	PLL_PACK_LIMITS(_offset, _has_clkn, _instance, NULL)
> +
>  #define PLLCA55		PLL_PACK(0x60, 1, 0)
>  #define PLLGPU		PLL_PACK(0x120, 1, 0)
>  
> @@ -191,6 +196,8 @@ enum clk_types {
>  	CLK_TYPE_PLL,
>  	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
>  	CLK_TYPE_SMUX,		/* Static Mux */
> +	CLK_TYPE_PLLDSI,	/* PLLDSI */
> +	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
>  };
>  
>  #define DEF_TYPE(_name, _id, _type...) \
> @@ -221,6 +228,14 @@ enum clk_types {
>  		 .num_parents = ARRAY_SIZE(_parent_names), \
>  		 .flag = CLK_SET_RATE_PARENT, \
>  		 .mux_flags = CLK_MUX_HIWORD_MASK)
> +#define DEF_PLLDSI(_name, _id, _parent, _pll_packed) \
> +	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI, .parent = _parent, .cfg.pll = _pll_packed)
> +#define DEF_PLLDSI_DIV(_name, _id, _parent, _ddiv_packed, _dtable) \
> +	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_DIV, \
> +		 .cfg.ddiv = _ddiv_packed, \
> +		 .dtable = _dtable, \
> +		 .parent = _parent, \
> +		 .flag = CLK_SET_RATE_PARENT)
>  
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions
> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
> index 0ebbe2f0b45e..69d8159deee3 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -10,7 +10,9 @@
>  #ifndef __LINUX_CLK_RENESAS_H_
>  #define __LINUX_CLK_RENESAS_H_
>  
> +#include <linux/clk-provider.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>  
>  struct device;
>  struct device_node;
> @@ -32,4 +34,147 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev	NULL
>  #define cpg_mssr_detach_dev	NULL
>  #endif
> +
> +/**
> + * struct rzv2h_pll_limits - PLL parameter constraints
> + *
> + * This structure defines the minimum and maximum allowed values for
> + * various parameters used to configure a PLL. These limits ensure
> + * the PLL operates within valid and stable ranges.
> + *
> + * @fout: Output frequency range (in MHz)
> + * @fout.min: Minimum allowed output frequency
> + * @fout.max: Maximum allowed output frequency
> + *
> + * @fvco: PLL oscillation frequency range (in MHz)
> + * @fvco.min: Minimum allowed VCO frequency
> + * @fvco.max: Maximum allowed VCO frequency
> + *
> + * @m: Main-divider range
> + * @m.min: Minimum main-divider value
> + * @m.max: Maximum main-divider value
> + *
> + * @p: Pre-divider range
> + * @p.min: Minimum pre-divider value
> + * @p.max: Maximum pre-divider value
> + *
> + * @s: Divider range
> + * @s.min: Minimum divider value
> + * @s.max: Maximum divider value
> + *
> + * @k: Delta-sigma modulator range (signed)
> + * @k.min: Minimum delta-sigma value
> + * @k.max: Maximum delta-sigma value
> + */
> +struct rzv2h_pll_limits {
> +	struct {
> +		u32 min;
> +		u32 max;
> +	} fout;
> +
> +	struct {
> +		u32 min;
> +		u32 max;
> +	} fvco;
> +
> +	struct {
> +		u16 min;
> +		u16 max;
> +	} m;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} p;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} s;
> +
> +	struct {
> +		s16 min;
> +		s16 max;
> +	} k;
> +};
> +
> +/**
> + * struct rzv2h_pll_pars - PLL configuration parameters
> + *
> + * This structure contains the configuration parameters for the
> + * Phase-Locked Loop (PLL), used to achieve a specific output frequency.
> + *
> + * @m: Main divider value
> + * @p: Pre-divider value
> + * @s: Output divider value
> + * @k: Delta-sigma modulation value
> + * @freq_millihz: Calculated PLL output frequency in millihertz
> + * @error_millihz: Frequency error from target in millihertz (signed)
> + */
> +struct rzv2h_pll_pars {
> +	u16 m;
> +	u8 p;
> +	u8 s;
> +	s16 k;
> +	u64 freq_millihz;
> +	s64 error_millihz;
> +};
> +
> +/**
> + * struct rzv2h_pll_div_pars - PLL parameters with post-divider
> + *
> + * This structure is used for PLLs that include an additional post-divider
> + * stage after the main PLL block. It contains both the PLL configuration
> + * parameters and the resulting frequency/error values after the divider.
> + *
> + * @pll: Main PLL configuration parameters (see struct rzv2h_pll_pars)
> + *
> + * @div: Post-divider configuration and result
> + * @div.divider_value: Divider applied to the PLL output
> + * @div.freq_millihz: Output frequency after divider in millihertz
> + * @div.error_millihz: Frequency error from target in millihertz (signed)
> + */
> +struct rzv2h_pll_div_pars {
> +	struct rzv2h_pll_pars pll;
> +	struct {
> +		u8 divider_value;
> +		u64 freq_millihz;
> +		s64 error_millihz;
> +	} div;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
> +	static const struct rzv2h_pll_limits (name) = {			\
> +		.fout = { .min = 25 * MEGA, .max = 375 * MEGA },	\
> +		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
> +		.m = { .min = 64, .max = 533 },				\
> +		.p = { .min = 1, .max = 4 },				\
> +		.s = { .min = 0, .max = 6 },				\
> +		.k = { .min = -32768, .max = 32767 },			\
> +	}								\
> +
> +#ifdef CONFIG_CLK_RZV2H
> +bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +			struct rzv2h_pll_pars *pars, u64 freq_millihz);
> +
> +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +			     struct rzv2h_pll_div_pars *pars,
> +			     const u8 *table, u8 table_size, u64 freq_millihz);
> +#else
> +static inline bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +				      struct rzv2h_pll_pars *pars,
> +				      u64 freq_millihz)
> +{
> +	return false;
> +}
> +
> +static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +					   struct rzv2h_pll_div_pars *pars,
> +					   const u8 *table, u8 table_size,
> +					   u64 freq_millihz)
> +{
> +	return false;
> +}
> +#endif
> +
>  #endif

