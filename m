Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F73D4914
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 20:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FF1734D7;
	Sat, 24 Jul 2021 18:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A97734D6;
 Sat, 24 Jul 2021 18:12:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10055"; a="192315128"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="192315128"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:12:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="433963780"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:12:09 -0700
Date: Sat, 24 Jul 2021 11:12:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 04/30] drm/i915/display: remove explicit CNL handling
 from intel_cdclk.c
Message-ID: <20210724181207.GL1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-5-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jose Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:48PM -0700, Lucas De Marchi wrote:
> The only real platform with DISPLAY_VER == 10 is GLK, so we don't need
> any checks and supporting code for CNL. Remove code and rename
> functions/macros accordingly.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 72 +++++-----------------
>  drivers/gpu/drm/i915/i915_reg.h            |  4 +-
>  2 files changed, 18 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index ff35c29508d5..34fa4130d5c4 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1195,17 +1195,6 @@ static const struct intel_cdclk_vals glk_cdclk_table[] = {
>  	{}
>  };
>  
> -static const struct intel_cdclk_vals cnl_cdclk_table[] = {
> -	{ .refclk = 19200, .cdclk = 168000, .divider = 4, .ratio = 35 },
> -	{ .refclk = 19200, .cdclk = 336000, .divider = 2, .ratio = 35 },
> -	{ .refclk = 19200, .cdclk = 528000, .divider = 2, .ratio = 55 },
> -
> -	{ .refclk = 24000, .cdclk = 168000, .divider = 4, .ratio = 28 },
> -	{ .refclk = 24000, .cdclk = 336000, .divider = 2, .ratio = 28 },
> -	{ .refclk = 24000, .cdclk = 528000, .divider = 2, .ratio = 44 },
> -	{}
> -};
> -
>  static const struct intel_cdclk_vals icl_cdclk_table[] = {
>  	{ .refclk = 19200, .cdclk = 172800, .divider = 2, .ratio = 18 },
>  	{ .refclk = 19200, .cdclk = 192000, .divider = 2, .ratio = 20 },
> @@ -1339,16 +1328,6 @@ static u8 bxt_calc_voltage_level(int cdclk)
>  	return DIV_ROUND_UP(cdclk, 25000);
>  }
>  
> -static u8 cnl_calc_voltage_level(int cdclk)
> -{
> -	if (cdclk > 336000)
> -		return 2;
> -	else if (cdclk > 168000)
> -		return 1;
> -	else
> -		return 0;
> -}
> -
>  static u8 icl_calc_voltage_level(int cdclk)
>  {
>  	if (cdclk > 556800)
> @@ -1383,15 +1362,6 @@ static u8 tgl_calc_voltage_level(int cdclk)
>  		return 0;
>  }
>  
> -static void cnl_readout_refclk(struct drm_i915_private *dev_priv,
> -			       struct intel_cdclk_config *cdclk_config)
> -{
> -	if (intel_de_read(dev_priv, SKL_DSSM) & CNL_DSSM_CDCLK_PLL_REFCLK_24MHz)
> -		cdclk_config->ref = 24000;
> -	else
> -		cdclk_config->ref = 19200;
> -}
> -
>  static void icl_readout_refclk(struct drm_i915_private *dev_priv,
>  			       struct intel_cdclk_config *cdclk_config)
>  {
> @@ -1422,8 +1392,6 @@ static void bxt_de_pll_readout(struct drm_i915_private *dev_priv,
>  		cdclk_config->ref = 38400;
>  	else if (DISPLAY_VER(dev_priv) >= 11)
>  		icl_readout_refclk(dev_priv, cdclk_config);
> -	else if (IS_CANNONLAKE(dev_priv))
> -		cnl_readout_refclk(dev_priv, cdclk_config);
>  	else
>  		cdclk_config->ref = 19200;
>  
> @@ -1439,11 +1407,11 @@ static void bxt_de_pll_readout(struct drm_i915_private *dev_priv,
>  	}
>  
>  	/*
> -	 * CNL+ have the ratio directly in the PLL enable register, gen9lp had
> -	 * it in a separate PLL control register.
> +	 * DISPLAY_VER >= 11 have the ratio directly in the PLL enable register,
> +	 * gen9lp had it in a separate PLL control register.
>  	 */
> -	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
> -		ratio = val & CNL_CDCLK_PLL_RATIO_MASK;
> +	if (DISPLAY_VER(dev_priv) >= 11)
> +		ratio = val & ICL_CDCLK_PLL_RATIO_MASK;
>  	else
>  		ratio = intel_de_read(dev_priv, BXT_DE_PLL_CTL) & BXT_DE_PLL_RATIO_MASK;
>  
> @@ -1530,7 +1498,7 @@ static void bxt_de_pll_enable(struct drm_i915_private *dev_priv, int vco)
>  	dev_priv->cdclk.hw.vco = vco;
>  }
>  
> -static void cnl_cdclk_pll_disable(struct drm_i915_private *dev_priv)
> +static void icl_cdclk_pll_disable(struct drm_i915_private *dev_priv)
>  {
>  	intel_de_rmw(dev_priv, BXT_DE_PLL_ENABLE,
>  		     BXT_DE_PLL_PLL_ENABLE, 0);
> @@ -1542,12 +1510,12 @@ static void cnl_cdclk_pll_disable(struct drm_i915_private *dev_priv)
>  	dev_priv->cdclk.hw.vco = 0;
>  }
>  
> -static void cnl_cdclk_pll_enable(struct drm_i915_private *dev_priv, int vco)
> +static void icl_cdclk_pll_enable(struct drm_i915_private *dev_priv, int vco)
>  {
>  	int ratio = DIV_ROUND_CLOSEST(vco, dev_priv->cdclk.hw.ref);
>  	u32 val;
>  
> -	val = CNL_CDCLK_PLL_RATIO(ratio);
> +	val = ICL_CDCLK_PLL_RATIO(ratio);
>  	intel_de_write(dev_priv, BXT_DE_PLL_ENABLE, val);
>  
>  	val |= BXT_DE_PLL_PLL_ENABLE;
> @@ -1566,7 +1534,7 @@ static void adlp_cdclk_pll_crawl(struct drm_i915_private *dev_priv, int vco)
>  	u32 val;
>  
>  	/* Write PLL ratio without disabling */
> -	val = CNL_CDCLK_PLL_RATIO(ratio) | BXT_DE_PLL_PLL_ENABLE;
> +	val = ICL_CDCLK_PLL_RATIO(ratio) | BXT_DE_PLL_PLL_ENABLE;
>  	intel_de_write(dev_priv, BXT_DE_PLL_ENABLE, val);
>  
>  	/* Submit freq change request */
> @@ -1635,7 +1603,7 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
>  	int ret;
>  
>  	/* Inform power controller of upcoming frequency change. */
> -	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
> +	if (DISPLAY_VER(dev_priv) >= 11)
>  		ret = skl_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
>  					SKL_CDCLK_PREPARE_FOR_CHANGE,
>  					SKL_CDCLK_READY_FOR_CHANGE,
> @@ -1659,13 +1627,13 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
>  	if (HAS_CDCLK_CRAWL(dev_priv) && dev_priv->cdclk.hw.vco > 0 && vco > 0) {
>  		if (dev_priv->cdclk.hw.vco != vco)
>  			adlp_cdclk_pll_crawl(dev_priv, vco);
> -	} else if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) {
> +	} else if (DISPLAY_VER(dev_priv) >= 11) {
>  		if (dev_priv->cdclk.hw.vco != 0 &&
>  		    dev_priv->cdclk.hw.vco != vco)
> -			cnl_cdclk_pll_disable(dev_priv);
> +			icl_cdclk_pll_disable(dev_priv);
>  
>  		if (dev_priv->cdclk.hw.vco != vco)
> -			cnl_cdclk_pll_enable(dev_priv, vco);
> +			icl_cdclk_pll_enable(dev_priv, vco);
>  	} else {
>  		if (dev_priv->cdclk.hw.vco != 0 &&
>  		    dev_priv->cdclk.hw.vco != vco)
> @@ -1691,7 +1659,7 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
>  	if (pipe != INVALID_PIPE)
>  		intel_wait_for_vblank(dev_priv, pipe);
>  
> -	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) {
> +	if (DISPLAY_VER(dev_priv) >= 11) {
>  		ret = sandybridge_pcode_write(dev_priv, SKL_PCODE_CDCLK_CONTROL,
>  					      cdclk_config->voltage_level);
>  	} else {
> @@ -1716,7 +1684,7 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
>  
>  	intel_update_cdclk(dev_priv);
>  
> -	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
> +	if (DISPLAY_VER(dev_priv) >= 11)
>  		/*
>  		 * Can't read out the voltage level :(
>  		 * Let's just assume everything is as expected.
> @@ -2125,7 +2093,7 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>  	    crtc_state->port_clock >= 540000 &&
>  	    crtc_state->lane_count == 4) {
>  		if (DISPLAY_VER(dev_priv) == 10) {
> -			/* Display WA #1145: glk,cnl */
> +			/* Display WA #1145: glk */
>  			min_cdclk = max(316800, min_cdclk);
>  		} else if (DISPLAY_VER(dev_priv) == 9 || IS_BROADWELL(dev_priv)) {
>  			/* Display WA #1144: skl,bxt */
> @@ -2246,7 +2214,7 @@ static int intel_compute_min_cdclk(struct intel_cdclk_state *cdclk_state)
>  
>  /*
>   * Account for port clock min voltage level requirements.
> - * This only really does something on CNL+ but can be
> + * This only really does something on DISPLA_VER >= 11 but can be
>   * called on earlier platforms as well.
>   *
>   * Note that this functions assumes that 0 is
> @@ -2660,8 +2628,6 @@ void intel_update_max_cdclk(struct drm_i915_private *dev_priv)
>  			dev_priv->max_cdclk_freq = 648000;
>  		else
>  			dev_priv->max_cdclk_freq = 652800;
> -	} else if (IS_CANNONLAKE(dev_priv)) {
> -		dev_priv->max_cdclk_freq = 528000;
>  	} else if (IS_GEMINILAKE(dev_priv)) {
>  		dev_priv->max_cdclk_freq = 316800;
>  	} else if (IS_BROXTON(dev_priv)) {
> @@ -2925,12 +2891,6 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
>  		dev_priv->display.modeset_calc_cdclk = bxt_modeset_calc_cdclk;
>  		dev_priv->display.calc_voltage_level = icl_calc_voltage_level;
>  		dev_priv->cdclk.table = icl_cdclk_table;
> -	} else if (IS_CANNONLAKE(dev_priv)) {
> -		dev_priv->display.bw_calc_min_cdclk = skl_bw_calc_min_cdclk;
> -		dev_priv->display.set_cdclk = bxt_set_cdclk;
> -		dev_priv->display.modeset_calc_cdclk = bxt_modeset_calc_cdclk;
> -		dev_priv->display.calc_voltage_level = cnl_calc_voltage_level;
> -		dev_priv->cdclk.table = cnl_cdclk_table;
>  	} else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv)) {
>  		dev_priv->display.bw_calc_min_cdclk = skl_bw_calc_min_cdclk;
>  		dev_priv->display.set_cdclk = bxt_set_cdclk;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 8e1392028184..6a894ffd91e1 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -11016,8 +11016,8 @@ enum skl_power_gate {
>  #define   BXT_DE_PLL_LOCK		(1 << 30)
>  #define   BXT_DE_PLL_FREQ_REQ		(1 << 23)
>  #define   BXT_DE_PLL_FREQ_REQ_ACK	(1 << 22)
> -#define   CNL_CDCLK_PLL_RATIO(x)	(x)
> -#define   CNL_CDCLK_PLL_RATIO_MASK	0xff
> +#define   ICL_CDCLK_PLL_RATIO(x)	(x)
> +#define   ICL_CDCLK_PLL_RATIO_MASK	0xff

We could take this opportunity to switch to REG_GENMASK, REG_FIELD_PREP
here.  Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  /* GEN9 DC */
>  #define DC_STATE_EN			_MMIO(0x45504)
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
