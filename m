Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A63D5830
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 13:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722F6FD83;
	Mon, 26 Jul 2021 11:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F186FD83;
 Mon, 26 Jul 2021 11:00:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="211927653"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="211927653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:00:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="664631771"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:00:55 -0700
Date: Mon, 26 Jul 2021 07:00:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 08/30] drm/i915/display: remove explicit CNL
 handling from intel_ddi.c
Message-ID: <YP6V5Vuz4quDQJaM@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-9-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-9-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:52PM -0700, Lucas De Marchi wrote:
> The only real platform with DISPLAY_VER == 10 is GLK. We don't need to
> handle CNL explicitly in intel_ddi.c.
> 
> Remove code and rename functions/macros accordingly to use ICL prefix.
> There's one leftover reference to cnl that comes from the struct
> intel_ddi_buf_trans. This will be renamed later when we get rid of the
> additional CNL tables.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 254 ++---------------------
>  1 file changed, 20 insertions(+), 234 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 26a3aa73fcc4..8367462842fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -822,7 +822,7 @@ bool intel_ddi_get_hw_state(struct intel_encoder *encoder,
>  static enum intel_display_power_domain
>  intel_ddi_main_link_aux_domain(struct intel_digital_port *dig_port)
>  {
> -	/* CNL+ HW requires corresponding AUX IOs to be powered up for PSR with
> +	/* ICL+ HW requires corresponding AUX IOs to be powered up for PSR with
>  	 * DC states enabled at the same time, while for driver initiated AUX
>  	 * transfers we need the same AUX IOs to be powered but with DC states
>  	 * disabled. Accordingly use the AUX power domain here which leaves DC
> @@ -1017,126 +1017,6 @@ static u8 intel_ddi_dp_preemph_max(struct intel_dp *intel_dp)
>  	return DP_TRAIN_PRE_EMPH_LEVEL_3;
>  }
>  
> -static void cnl_ddi_vswing_program(struct intel_encoder *encoder,
> -				   const struct intel_crtc_state *crtc_state,
> -				   int level)
> -{
> -	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> -	const struct intel_ddi_buf_trans *ddi_translations;
> -	enum port port = encoder->port;
> -	int n_entries, ln;
> -	u32 val;
> -
> -	ddi_translations = encoder->get_buf_trans(encoder, crtc_state, &n_entries);
> -	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
> -		return;
> -	if (drm_WARN_ON_ONCE(&dev_priv->drm, level >= n_entries))
> -		level = n_entries - 1;
> -
> -	/* Set PORT_TX_DW5 Scaling Mode Sel to 010b. */
> -	val = intel_de_read(dev_priv, CNL_PORT_TX_DW5_LN0(port));
> -	val &= ~SCALING_MODE_SEL_MASK;
> -	val |= SCALING_MODE_SEL(2);
> -	intel_de_write(dev_priv, CNL_PORT_TX_DW5_GRP(port), val);
> -
> -	/* Program PORT_TX_DW2 */
> -	val = intel_de_read(dev_priv, CNL_PORT_TX_DW2_LN0(port));
> -	val &= ~(SWING_SEL_LOWER_MASK | SWING_SEL_UPPER_MASK |
> -		 RCOMP_SCALAR_MASK);
> -	val |= SWING_SEL_UPPER(ddi_translations->entries[level].cnl.dw2_swing_sel);
> -	val |= SWING_SEL_LOWER(ddi_translations->entries[level].cnl.dw2_swing_sel);
> -	/* Rcomp scalar is fixed as 0x98 for every table entry */
> -	val |= RCOMP_SCALAR(0x98);
> -	intel_de_write(dev_priv, CNL_PORT_TX_DW2_GRP(port), val);
> -
> -	/* Program PORT_TX_DW4 */
> -	/* We cannot write to GRP. It would overrite individual loadgen */
> -	for (ln = 0; ln < 4; ln++) {
> -		val = intel_de_read(dev_priv, CNL_PORT_TX_DW4_LN(ln, port));
> -		val &= ~(POST_CURSOR_1_MASK | POST_CURSOR_2_MASK |
> -			 CURSOR_COEFF_MASK);
> -		val |= POST_CURSOR_1(ddi_translations->entries[level].cnl.dw4_post_cursor_1);
> -		val |= POST_CURSOR_2(ddi_translations->entries[level].cnl.dw4_post_cursor_2);
> -		val |= CURSOR_COEFF(ddi_translations->entries[level].cnl.dw4_cursor_coeff);
> -		intel_de_write(dev_priv, CNL_PORT_TX_DW4_LN(ln, port), val);
> -	}
> -
> -	/* Program PORT_TX_DW5 */
> -	/* All DW5 values are fixed for every table entry */
> -	val = intel_de_read(dev_priv, CNL_PORT_TX_DW5_LN0(port));
> -	val &= ~RTERM_SELECT_MASK;
> -	val |= RTERM_SELECT(6);
> -	val |= TAP3_DISABLE;
> -	intel_de_write(dev_priv, CNL_PORT_TX_DW5_GRP(port), val);
> -
> -	/* Program PORT_TX_DW7 */
> -	val = intel_de_read(dev_priv, CNL_PORT_TX_DW7_LN0(port));
> -	val &= ~N_SCALAR_MASK;
> -	val |= N_SCALAR(ddi_translations->entries[level].cnl.dw7_n_scalar);
> -	intel_de_write(dev_priv, CNL_PORT_TX_DW7_GRP(port), val);
> -}
> -
> -static void cnl_ddi_vswing_sequence(struct intel_encoder *encoder,
> -				    const struct intel_crtc_state *crtc_state,
> -				    int level)
> -{
> -	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> -	enum port port = encoder->port;
> -	int width, rate, ln;
> -	u32 val;
> -
> -	width = crtc_state->lane_count;
> -	rate = crtc_state->port_clock;
> -
> -	/*
> -	 * 1. If port type is eDP or DP,
> -	 * set PORT_PCS_DW1 cmnkeeper_enable to 1b,
> -	 * else clear to 0b.
> -	 */
> -	val = intel_de_read(dev_priv, CNL_PORT_PCS_DW1_LN0(port));
> -	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
> -		val &= ~COMMON_KEEPER_EN;
> -	else
> -		val |= COMMON_KEEPER_EN;
> -	intel_de_write(dev_priv, CNL_PORT_PCS_DW1_GRP(port), val);
> -
> -	/* 2. Program loadgen select */
> -	/*
> -	 * Program PORT_TX_DW4_LN depending on Bit rate and used lanes
> -	 * <= 6 GHz and 4 lanes (LN0=0, LN1=1, LN2=1, LN3=1)
> -	 * <= 6 GHz and 1,2 lanes (LN0=0, LN1=1, LN2=1, LN3=0)
> -	 * > 6 GHz (LN0=0, LN1=0, LN2=0, LN3=0)
> -	 */
> -	for (ln = 0; ln <= 3; ln++) {
> -		val = intel_de_read(dev_priv, CNL_PORT_TX_DW4_LN(ln, port));
> -		val &= ~LOADGEN_SELECT;
> -
> -		if ((rate <= 600000 && width == 4 && ln >= 1)  ||
> -		    (rate <= 600000 && width < 4 && (ln == 1 || ln == 2))) {
> -			val |= LOADGEN_SELECT;
> -		}
> -		intel_de_write(dev_priv, CNL_PORT_TX_DW4_LN(ln, port), val);
> -	}
> -
> -	/* 3. Set PORT_CL_DW5 SUS Clock Config to 11b */
> -	val = intel_de_read(dev_priv, CNL_PORT_CL1CM_DW5);
> -	val |= SUS_CLOCK_CONFIG;
> -	intel_de_write(dev_priv, CNL_PORT_CL1CM_DW5, val);
> -
> -	/* 4. Clear training enable to change swing values */
> -	val = intel_de_read(dev_priv, CNL_PORT_TX_DW5_LN0(port));
> -	val &= ~TX_TRAINING_EN;
> -	intel_de_write(dev_priv, CNL_PORT_TX_DW5_GRP(port), val);
> -
> -	/* 5. Program swing and de-emphasis */
> -	cnl_ddi_vswing_program(encoder, crtc_state, level);
> -
> -	/* 6. Set training enable to trigger update */
> -	val = intel_de_read(dev_priv, CNL_PORT_TX_DW5_LN0(port));
> -	val |= TX_TRAINING_EN;
> -	intel_de_write(dev_priv, CNL_PORT_TX_DW5_GRP(port), val);
> -}
> -
>  static void icl_ddi_combo_vswing_program(struct intel_encoder *encoder,
>  					 const struct intel_crtc_state *crtc_state,
>  					 int level)
> @@ -1515,16 +1395,6 @@ icl_set_signal_levels(struct intel_dp *intel_dp,
>  	icl_ddi_vswing_sequence(encoder, crtc_state, level);
>  }
>  
> -static void
> -cnl_set_signal_levels(struct intel_dp *intel_dp,
> -		      const struct intel_crtc_state *crtc_state)
> -{
> -	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> -	int level = intel_ddi_dp_level(intel_dp);
> -
> -	cnl_ddi_vswing_sequence(encoder, crtc_state, level);
> -}
> -
>  static void
>  bxt_set_signal_levels(struct intel_dp *intel_dp,
>  		      const struct intel_crtc_state *crtc_state)
> @@ -1560,7 +1430,7 @@ hsw_set_signal_levels(struct intel_dp *intel_dp,
>  	intel_de_posting_read(dev_priv, DDI_BUF_CTL(port));
>  }
>  
> -static void _cnl_ddi_enable_clock(struct drm_i915_private *i915, i915_reg_t reg,
> +static void _icl_ddi_enable_clock(struct drm_i915_private *i915, i915_reg_t reg,
>  				  u32 clk_sel_mask, u32 clk_sel, u32 clk_off)
>  {
>  	mutex_lock(&i915->dpll.lock);
> @@ -1576,7 +1446,7 @@ static void _cnl_ddi_enable_clock(struct drm_i915_private *i915, i915_reg_t reg,
>  	mutex_unlock(&i915->dpll.lock);
>  }
>  
> -static void _cnl_ddi_disable_clock(struct drm_i915_private *i915, i915_reg_t reg,
> +static void _icl_ddi_disable_clock(struct drm_i915_private *i915, i915_reg_t reg,
>  				   u32 clk_off)
>  {
>  	mutex_lock(&i915->dpll.lock);
> @@ -1586,14 +1456,14 @@ static void _cnl_ddi_disable_clock(struct drm_i915_private *i915, i915_reg_t reg
>  	mutex_unlock(&i915->dpll.lock);
>  }
>  
> -static bool _cnl_ddi_is_clock_enabled(struct drm_i915_private *i915, i915_reg_t reg,
> +static bool _icl_ddi_is_clock_enabled(struct drm_i915_private *i915, i915_reg_t reg,
>  				      u32 clk_off)
>  {
>  	return !(intel_de_read(i915, reg) & clk_off);
>  }
>  
>  static struct intel_shared_dpll *
> -_cnl_ddi_get_pll(struct drm_i915_private *i915, i915_reg_t reg,
> +_icl_ddi_get_pll(struct drm_i915_private *i915, i915_reg_t reg,
>  		 u32 clk_sel_mask, u32 clk_sel_shift)
>  {
>  	enum intel_dpll_id id;
> @@ -1613,7 +1483,7 @@ static void adls_ddi_enable_clock(struct intel_encoder *encoder,
>  	if (drm_WARN_ON(&i915->drm, !pll))
>  		return;
>  
> -	_cnl_ddi_enable_clock(i915, ADLS_DPCLKA_CFGCR(phy),
> +	_icl_ddi_enable_clock(i915, ADLS_DPCLKA_CFGCR(phy),
>  			      ADLS_DPCLKA_CFGCR_DDI_CLK_SEL_MASK(phy),
>  			      pll->info->id << ADLS_DPCLKA_CFGCR_DDI_SHIFT(phy),
>  			      ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
> @@ -1624,7 +1494,7 @@ static void adls_ddi_disable_clock(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	_cnl_ddi_disable_clock(i915, ADLS_DPCLKA_CFGCR(phy),
> +	_icl_ddi_disable_clock(i915, ADLS_DPCLKA_CFGCR(phy),
>  			       ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1633,7 +1503,7 @@ static bool adls_ddi_is_clock_enabled(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_is_clock_enabled(i915, ADLS_DPCLKA_CFGCR(phy),
> +	return _icl_ddi_is_clock_enabled(i915, ADLS_DPCLKA_CFGCR(phy),
>  					 ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1642,7 +1512,7 @@ static struct intel_shared_dpll *adls_ddi_get_pll(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_get_pll(i915, ADLS_DPCLKA_CFGCR(phy),
> +	return _icl_ddi_get_pll(i915, ADLS_DPCLKA_CFGCR(phy),
>  				ADLS_DPCLKA_CFGCR_DDI_CLK_SEL_MASK(phy),
>  				ADLS_DPCLKA_CFGCR_DDI_SHIFT(phy));
>  }
> @@ -1657,7 +1527,7 @@ static void rkl_ddi_enable_clock(struct intel_encoder *encoder,
>  	if (drm_WARN_ON(&i915->drm, !pll))
>  		return;
>  
> -	_cnl_ddi_enable_clock(i915, ICL_DPCLKA_CFGCR0,
> +	_icl_ddi_enable_clock(i915, ICL_DPCLKA_CFGCR0,
>  			      RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy),
>  			      RKL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll->info->id, phy),
>  			      RKL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
> @@ -1668,7 +1538,7 @@ static void rkl_ddi_disable_clock(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	_cnl_ddi_disable_clock(i915, ICL_DPCLKA_CFGCR0,
> +	_icl_ddi_disable_clock(i915, ICL_DPCLKA_CFGCR0,
>  			       RKL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1677,7 +1547,7 @@ static bool rkl_ddi_is_clock_enabled(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_is_clock_enabled(i915, ICL_DPCLKA_CFGCR0,
> +	return _icl_ddi_is_clock_enabled(i915, ICL_DPCLKA_CFGCR0,
>  					 RKL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1686,7 +1556,7 @@ static struct intel_shared_dpll *rkl_ddi_get_pll(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_get_pll(i915, ICL_DPCLKA_CFGCR0,
> +	return _icl_ddi_get_pll(i915, ICL_DPCLKA_CFGCR0,
>  				RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy),
>  				RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy));
>  }
> @@ -1710,7 +1580,7 @@ static void dg1_ddi_enable_clock(struct intel_encoder *encoder,
>  			(pll->info->id >= DPLL_ID_DG1_DPLL2 && phy < PHY_C)))
>  		return;
>  
> -	_cnl_ddi_enable_clock(i915, DG1_DPCLKA_CFGCR0(phy),
> +	_icl_ddi_enable_clock(i915, DG1_DPCLKA_CFGCR0(phy),
>  			      DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy),
>  			      DG1_DPCLKA_CFGCR0_DDI_CLK_SEL(pll->info->id, phy),
>  			      DG1_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
> @@ -1721,7 +1591,7 @@ static void dg1_ddi_disable_clock(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	_cnl_ddi_disable_clock(i915, DG1_DPCLKA_CFGCR0(phy),
> +	_icl_ddi_disable_clock(i915, DG1_DPCLKA_CFGCR0(phy),
>  			       DG1_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1730,7 +1600,7 @@ static bool dg1_ddi_is_clock_enabled(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_is_clock_enabled(i915, DG1_DPCLKA_CFGCR0(phy),
> +	return _icl_ddi_is_clock_enabled(i915, DG1_DPCLKA_CFGCR0(phy),
>  					 DG1_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1767,7 +1637,7 @@ static void icl_ddi_combo_enable_clock(struct intel_encoder *encoder,
>  	if (drm_WARN_ON(&i915->drm, !pll))
>  		return;
>  
> -	_cnl_ddi_enable_clock(i915, ICL_DPCLKA_CFGCR0,
> +	_icl_ddi_enable_clock(i915, ICL_DPCLKA_CFGCR0,
>  			      ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy),
>  			      ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll->info->id, phy),
>  			      ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
> @@ -1778,7 +1648,7 @@ static void icl_ddi_combo_disable_clock(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	_cnl_ddi_disable_clock(i915, ICL_DPCLKA_CFGCR0,
> +	_icl_ddi_disable_clock(i915, ICL_DPCLKA_CFGCR0,
>  			       ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1787,7 +1657,7 @@ static bool icl_ddi_combo_is_clock_enabled(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_is_clock_enabled(i915, ICL_DPCLKA_CFGCR0,
> +	return _icl_ddi_is_clock_enabled(i915, ICL_DPCLKA_CFGCR0,
>  					 ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy));
>  }
>  
> @@ -1796,7 +1666,7 @@ struct intel_shared_dpll *icl_ddi_combo_get_pll(struct intel_encoder *encoder)
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
>  	enum phy phy = intel_port_to_phy(i915, encoder->port);
>  
> -	return _cnl_ddi_get_pll(i915, ICL_DPCLKA_CFGCR0,
> +	return _icl_ddi_get_pll(i915, ICL_DPCLKA_CFGCR0,
>  				ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy),
>  				ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy));
>  }
> @@ -1929,50 +1799,6 @@ static struct intel_shared_dpll *icl_ddi_tc_get_pll(struct intel_encoder *encode
>  	return intel_get_shared_dpll_by_id(i915, id);
>  }
>  
> -static void cnl_ddi_enable_clock(struct intel_encoder *encoder,
> -				 const struct intel_crtc_state *crtc_state)
> -{
> -	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> -	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
> -	enum port port = encoder->port;
> -
> -	if (drm_WARN_ON(&i915->drm, !pll))
> -		return;
> -
> -	_cnl_ddi_enable_clock(i915, DPCLKA_CFGCR0,
> -			      DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(port),
> -			      DPCLKA_CFGCR0_DDI_CLK_SEL(pll->info->id, port),
> -			      DPCLKA_CFGCR0_DDI_CLK_OFF(port));
> -}
> -
> -static void cnl_ddi_disable_clock(struct intel_encoder *encoder)
> -{
> -	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> -	enum port port = encoder->port;
> -
> -	_cnl_ddi_disable_clock(i915, DPCLKA_CFGCR0,
> -			       DPCLKA_CFGCR0_DDI_CLK_OFF(port));
> -}
> -
> -static bool cnl_ddi_is_clock_enabled(struct intel_encoder *encoder)
> -{
> -	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> -	enum port port = encoder->port;
> -
> -	return _cnl_ddi_is_clock_enabled(i915, DPCLKA_CFGCR0,
> -					 DPCLKA_CFGCR0_DDI_CLK_OFF(port));
> -}
> -
> -static struct intel_shared_dpll *cnl_ddi_get_pll(struct intel_encoder *encoder)
> -{
> -	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> -	enum port port = encoder->port;
> -
> -	return _cnl_ddi_get_pll(i915, DPCLKA_CFGCR0,
> -				DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(port),
> -				DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(port));
> -}
> -
>  static struct intel_shared_dpll *bxt_ddi_get_pll(struct intel_encoder *encoder)
>  {
>  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> @@ -2657,8 +2483,6 @@ static void hsw_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  
>  	if (DISPLAY_VER(dev_priv) >= 11)
>  		icl_ddi_vswing_sequence(encoder, crtc_state, level);
> -	else if (IS_CANNONLAKE(dev_priv))
> -		cnl_ddi_vswing_sequence(encoder, crtc_state, level);
>  	else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
>  		bxt_ddi_vswing_sequence(encoder, crtc_state, level);
>  	else
> @@ -3105,8 +2929,6 @@ static void intel_enable_ddi_hdmi(struct intel_atomic_state *state,
>  		tgl_ddi_vswing_sequence(encoder, crtc_state, level);
>  	else if (DISPLAY_VER(dev_priv) == 11)
>  		icl_ddi_vswing_sequence(encoder, crtc_state, level);
> -	else if (IS_CANNONLAKE(dev_priv))
> -		cnl_ddi_vswing_sequence(encoder, crtc_state, level);
>  	else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
>  		bxt_ddi_vswing_sequence(encoder, crtc_state, level);
>  	else
> @@ -3470,8 +3292,6 @@ void intel_ddi_compute_min_voltage_level(struct drm_i915_private *dev_priv,
>  		crtc_state->min_voltage_level = 3;
>  	else if (DISPLAY_VER(dev_priv) >= 11 && crtc_state->port_clock > 594000)
>  		crtc_state->min_voltage_level = 1;
> -	else if (IS_CANNONLAKE(dev_priv) && crtc_state->port_clock > 594000)
> -		crtc_state->min_voltage_level = 2;
>  }
>  
>  static enum transcoder bdw_transcoder_master_readout(struct drm_i915_private *dev_priv,
> @@ -3812,13 +3632,6 @@ static void icl_ddi_tc_get_config(struct intel_encoder *encoder,
>  	intel_ddi_get_config(encoder, crtc_state);
>  }
>  
> -static void cnl_ddi_get_config(struct intel_encoder *encoder,
> -			       struct intel_crtc_state *crtc_state)
> -{
> -	intel_ddi_get_clock(encoder, crtc_state, cnl_ddi_get_pll(encoder));
> -	intel_ddi_get_config(encoder, crtc_state);
> -}
> -
>  static void bxt_ddi_get_config(struct intel_encoder *encoder,
>  			       struct intel_crtc_state *crtc_state)
>  {
> @@ -4069,8 +3882,6 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
>  		dig_port->dp.set_signal_levels = tgl_set_signal_levels;
>  	else if (DISPLAY_VER(dev_priv) >= 11)
>  		dig_port->dp.set_signal_levels = icl_set_signal_levels;
> -	else if (IS_CANNONLAKE(dev_priv))
> -		dig_port->dp.set_signal_levels = cnl_set_signal_levels;
>  	else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
>  		dig_port->dp.set_signal_levels = bxt_set_signal_levels;
>  	else
> @@ -4317,15 +4128,6 @@ static bool intel_ddi_a_force_4_lanes(struct intel_digital_port *dig_port)
>  	if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
>  		return true;
>  
> -	/* Cannonlake: Most of SKUs don't support DDI_E, and the only
> -	 *             one who does also have a full A/E split called
> -	 *             DDI_F what makes DDI_E useless. However for this
> -	 *             case let's trust VBT info.
> -	 */
> -	if (IS_CANNONLAKE(dev_priv) &&
> -	    !intel_bios_is_port_present(dev_priv, PORT_E))
> -		return true;
> -
>  	return false;
>  }
>  
> @@ -4430,15 +4232,6 @@ static enum hpd_pin ehl_hpd_pin(struct drm_i915_private *dev_priv,
>  	return HPD_PORT_A + port - PORT_A;
>  }
>  
> -static enum hpd_pin cnl_hpd_pin(struct drm_i915_private *dev_priv,
> -				enum port port)
> -{
> -	if (port == PORT_F)
> -		return HPD_PORT_E;
> -
> -	return HPD_PORT_A + port - PORT_A;
> -}
> -
>  static enum hpd_pin skl_hpd_pin(struct drm_i915_private *dev_priv, enum port port)
>  {
>  	if (HAS_PCH_TGP(dev_priv))
> @@ -4645,11 +4438,6 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
>  			encoder->is_clock_enabled = icl_ddi_combo_is_clock_enabled;
>  			encoder->get_config = icl_ddi_combo_get_config;
>  		}
> -	} else if (IS_CANNONLAKE(dev_priv)) {
> -		encoder->enable_clock = cnl_ddi_enable_clock;
> -		encoder->disable_clock = cnl_ddi_disable_clock;
> -		encoder->is_clock_enabled = cnl_ddi_is_clock_enabled;
> -		encoder->get_config = cnl_ddi_get_config;
>  	} else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv)) {
>  		/* BXT/GLK have fixed PLL->port mapping */
>  		encoder->get_config = bxt_ddi_get_config;
> @@ -4679,8 +4467,6 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
>  		encoder->hpd_pin = ehl_hpd_pin(dev_priv, port);
>  	else if (DISPLAY_VER(dev_priv) == 11)
>  		encoder->hpd_pin = icl_hpd_pin(dev_priv, port);
> -	else if (IS_CANNONLAKE(dev_priv))
> -		encoder->hpd_pin = cnl_hpd_pin(dev_priv, port);
>  	else if (DISPLAY_VER(dev_priv) == 9 && !IS_BROXTON(dev_priv))
>  		encoder->hpd_pin = skl_hpd_pin(dev_priv, port);
>  	else
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
