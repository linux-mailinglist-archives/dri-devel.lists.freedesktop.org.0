Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 432253D5778
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536DD6F918;
	Mon, 26 Jul 2021 10:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060D66E94E;
 Mon, 26 Jul 2021 10:28:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="199393932"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="199393932"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:28:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="498093846"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:28:40 -0700
Date: Mon, 26 Jul 2021 06:28:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 15/30] drm/i915/display: remove explicit CNL
 handling from intel_display_power.c
Message-ID: <YP6OV5prJtzVesUU@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-16-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-16-lucas.demarchi@intel.com>
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

On Fri, Jul 23, 2021 at 05:10:59PM -0700, Lucas De Marchi wrote:
> The only real platform with DISPLAY_VER == 10 is GLK. We don't need to
> handle CNL explicitly in intel_display_power.c.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../drm/i915/display/intel_display_power.c    | 289 ------------------
>  .../drm/i915/display/intel_display_power.h    |   2 -
>  drivers/gpu/drm/i915/i915_reg.h               |  13 -
>  3 files changed, 304 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 81efc77bada0..44aef0c44ab7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -447,17 +447,6 @@ static void hsw_power_well_enable(struct drm_i915_private *dev_priv,
>  
>  	hsw_wait_for_power_well_enable(dev_priv, power_well, false);
>  
> -	/* Display WA #1178: cnl */
> -	if (IS_CANNONLAKE(dev_priv) &&
> -	    pw_idx >= GLK_PW_CTL_IDX_AUX_B &&
> -	    pw_idx <= CNL_PW_CTL_IDX_AUX_F) {
> -		u32 val;
> -
> -		val = intel_de_read(dev_priv, CNL_AUX_ANAOVRD1(pw_idx));
> -		val |= CNL_AUX_ANAOVRD1_ENABLE | CNL_AUX_ANAOVRD1_LDO_BYPASS;
> -		intel_de_write(dev_priv, CNL_AUX_ANAOVRD1(pw_idx), val);
> -	}
> -
>  	if (power_well->desc->hsw.has_fuses) {
>  		enum skl_power_gate pg;
>  
> @@ -2743,63 +2732,6 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
>  	BIT_ULL(POWER_DOMAIN_GMBUS) |			\
>  	BIT_ULL(POWER_DOMAIN_INIT))
>  
> -#define CNL_DISPLAY_POWERWELL_2_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_TRANSCODER_A) |		\
> -	BIT_ULL(POWER_DOMAIN_PIPE_B) |			\
> -	BIT_ULL(POWER_DOMAIN_TRANSCODER_B) |		\
> -	BIT_ULL(POWER_DOMAIN_PIPE_C) |			\
> -	BIT_ULL(POWER_DOMAIN_TRANSCODER_C) |		\
> -	BIT_ULL(POWER_DOMAIN_PIPE_B_PANEL_FITTER) |		\
> -	BIT_ULL(POWER_DOMAIN_PIPE_C_PANEL_FITTER) |		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_B_LANES) |		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_C_LANES) |		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_D_LANES) |		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_F_LANES) |		\
> -	BIT_ULL(POWER_DOMAIN_AUX_B) |                       \
> -	BIT_ULL(POWER_DOMAIN_AUX_C) |			\
> -	BIT_ULL(POWER_DOMAIN_AUX_D) |			\
> -	BIT_ULL(POWER_DOMAIN_AUX_F) |			\
> -	BIT_ULL(POWER_DOMAIN_AUDIO) |			\
> -	BIT_ULL(POWER_DOMAIN_VGA) |				\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_DDI_A_IO_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_A_IO) |		\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_DDI_B_IO_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_B_IO) |		\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_DDI_C_IO_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_C_IO) |		\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_DDI_D_IO_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_D_IO) |		\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_AUX_A_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_AUX_A) |			\
> -	BIT_ULL(POWER_DOMAIN_AUX_IO_A) |		\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_AUX_B_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_AUX_B) |			\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_AUX_C_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_AUX_C) |			\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_AUX_D_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_AUX_D) |			\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_AUX_F_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_AUX_F) |			\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_DDI_F_IO_POWER_DOMAINS (		\
> -	BIT_ULL(POWER_DOMAIN_PORT_DDI_F_IO) |		\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -#define CNL_DISPLAY_DC_OFF_POWER_DOMAINS (		\
> -	CNL_DISPLAY_POWERWELL_2_POWER_DOMAINS |		\
> -	BIT_ULL(POWER_DOMAIN_GT_IRQ) |			\
> -	BIT_ULL(POWER_DOMAIN_MODESET) |			\
> -	BIT_ULL(POWER_DOMAIN_AUX_A) |			\
> -	BIT_ULL(POWER_DOMAIN_INIT))
> -
>  /*
>   * ICL PW_0/PG_0 domains (HW/DMC control):
>   * - PCI
> @@ -3706,148 +3638,6 @@ static const struct i915_power_well_desc glk_power_wells[] = {
>  	},
>  };
>  
> -static const struct i915_power_well_desc cnl_power_wells[] = {
> -	{
> -		.name = "always-on",
> -		.always_on = true,
> -		.domains = POWER_DOMAIN_MASK,
> -		.ops = &i9xx_always_on_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -	},
> -	{
> -		.name = "power well 1",
> -		/* Handled by the DMC firmware */
> -		.always_on = true,
> -		.domains = 0,
> -		.ops = &hsw_power_well_ops,
> -		.id = SKL_DISP_PW_1,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = SKL_PW_CTL_IDX_PW_1,
> -			.hsw.has_fuses = true,
> -		},
> -	},
> -	{
> -		.name = "AUX A",
> -		.domains = CNL_DISPLAY_AUX_A_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = GLK_PW_CTL_IDX_AUX_A,
> -		},
> -	},
> -	{
> -		.name = "AUX B",
> -		.domains = CNL_DISPLAY_AUX_B_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = GLK_PW_CTL_IDX_AUX_B,
> -		},
> -	},
> -	{
> -		.name = "AUX C",
> -		.domains = CNL_DISPLAY_AUX_C_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = GLK_PW_CTL_IDX_AUX_C,
> -		},
> -	},
> -	{
> -		.name = "AUX D",
> -		.domains = CNL_DISPLAY_AUX_D_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = CNL_PW_CTL_IDX_AUX_D,
> -		},
> -	},
> -	{
> -		.name = "DC off",
> -		.domains = CNL_DISPLAY_DC_OFF_POWER_DOMAINS,
> -		.ops = &gen9_dc_off_power_well_ops,
> -		.id = SKL_DISP_DC_OFF,
> -	},
> -	{
> -		.name = "power well 2",
> -		.domains = CNL_DISPLAY_POWERWELL_2_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = SKL_DISP_PW_2,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = SKL_PW_CTL_IDX_PW_2,
> -			.hsw.irq_pipe_mask = BIT(PIPE_B) | BIT(PIPE_C),
> -			.hsw.has_vga = true,
> -			.hsw.has_fuses = true,
> -		},
> -	},
> -	{
> -		.name = "DDI A IO power well",
> -		.domains = CNL_DISPLAY_DDI_A_IO_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = GLK_PW_CTL_IDX_DDI_A,
> -		},
> -	},
> -	{
> -		.name = "DDI B IO power well",
> -		.domains = CNL_DISPLAY_DDI_B_IO_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = SKL_PW_CTL_IDX_DDI_B,
> -		},
> -	},
> -	{
> -		.name = "DDI C IO power well",
> -		.domains = CNL_DISPLAY_DDI_C_IO_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = SKL_PW_CTL_IDX_DDI_C,
> -		},
> -	},
> -	{
> -		.name = "DDI D IO power well",
> -		.domains = CNL_DISPLAY_DDI_D_IO_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = DISP_PW_ID_NONE,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = SKL_PW_CTL_IDX_DDI_D,
> -		},
> -	},
> -	{
> -		.name = "DDI F IO power well",
> -		.domains = CNL_DISPLAY_DDI_F_IO_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = CNL_DISP_PW_DDI_F_IO,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = CNL_PW_CTL_IDX_DDI_F,
> -		},
> -	},
> -	{
> -		.name = "AUX F",
> -		.domains = CNL_DISPLAY_AUX_F_POWER_DOMAINS,
> -		.ops = &hsw_power_well_ops,
> -		.id = CNL_DISP_PW_DDI_F_AUX,
> -		{
> -			.hsw.regs = &hsw_power_well_regs,
> -			.hsw.idx = CNL_PW_CTL_IDX_AUX_F,
> -		},
> -	},
> -};
> -
>  static const struct i915_power_well_ops icl_aux_power_well_ops = {
>  	.sync_hw = hsw_power_well_sync_hw,
>  	.enable = icl_aux_power_well_enable,
> @@ -5147,12 +4937,6 @@ int intel_power_domains_init(struct drm_i915_private *dev_priv)
>  		err = set_power_wells(power_domains, tgl_power_wells);
>  	} else if (DISPLAY_VER(dev_priv) == 11) {
>  		err = set_power_wells(power_domains, icl_power_wells);
> -	} else if (IS_CNL_WITH_PORT_F(dev_priv)) {
> -		err = set_power_wells(power_domains, cnl_power_wells);
> -	} else if (IS_CANNONLAKE(dev_priv)) {
> -		err = set_power_wells_mask(power_domains, cnl_power_wells,
> -					   BIT_ULL(CNL_DISP_PW_DDI_F_IO) |
> -					   BIT_ULL(CNL_DISP_PW_DDI_F_AUX));
>  	} else if (IS_GEMINILAKE(dev_priv)) {
>  		err = set_power_wells(power_domains, glk_power_wells);
>  	} else if (IS_BROXTON(dev_priv)) {
> @@ -5707,75 +5491,6 @@ static void bxt_display_core_uninit(struct drm_i915_private *dev_priv)
>  	usleep_range(10, 30);		/* 10 us delay per Bspec */
>  }
>  
> -static void cnl_display_core_init(struct drm_i915_private *dev_priv, bool resume)
> -{
> -	struct i915_power_domains *power_domains = &dev_priv->power_domains;
> -	struct i915_power_well *well;
> -
> -	gen9_set_dc_state(dev_priv, DC_STATE_DISABLE);
> -
> -	/* 1. Enable PCH Reset Handshake */
> -	intel_pch_reset_handshake(dev_priv, !HAS_PCH_NOP(dev_priv));
> -
> -	if (!HAS_DISPLAY(dev_priv))
> -		return;
> -
> -	/* 2-3. */
> -	intel_combo_phy_init(dev_priv);
> -
> -	/*
> -	 * 4. Enable Power Well 1 (PG1).
> -	 *    The AUX IO power wells will be enabled on demand.
> -	 */
> -	mutex_lock(&power_domains->lock);
> -	well = lookup_power_well(dev_priv, SKL_DISP_PW_1);
> -	intel_power_well_enable(dev_priv, well);
> -	mutex_unlock(&power_domains->lock);
> -
> -	/* 5. Enable CD clock */
> -	intel_cdclk_init_hw(dev_priv);
> -
> -	/* 6. Enable DBUF */
> -	gen9_dbuf_enable(dev_priv);
> -
> -	if (resume && intel_dmc_has_payload(dev_priv))
> -		intel_dmc_load_program(dev_priv);
> -}
> -
> -static void cnl_display_core_uninit(struct drm_i915_private *dev_priv)
> -{
> -	struct i915_power_domains *power_domains = &dev_priv->power_domains;
> -	struct i915_power_well *well;
> -
> -	if (!HAS_DISPLAY(dev_priv))
> -		return;
> -
> -	gen9_disable_dc_states(dev_priv);
> -
> -	/* 1. Disable all display engine functions -> aready done */
> -
> -	/* 2. Disable DBUF */
> -	gen9_dbuf_disable(dev_priv);
> -
> -	/* 3. Disable CD clock */
> -	intel_cdclk_uninit_hw(dev_priv);
> -
> -	/*
> -	 * 4. Disable Power Well 1 (PG1).
> -	 *    The AUX IO power wells are toggled on demand, so they are already
> -	 *    disabled at this point.
> -	 */
> -	mutex_lock(&power_domains->lock);
> -	well = lookup_power_well(dev_priv, SKL_DISP_PW_1);
> -	intel_power_well_disable(dev_priv, well);
> -	mutex_unlock(&power_domains->lock);
> -
> -	usleep_range(10, 30);		/* 10 us delay per Bspec */
> -
> -	/* 5. */
> -	intel_combo_phy_uninit(dev_priv);
> -}
> -
>  struct buddy_page_mask {
>  	u32 page_mask;
>  	u8 type;
> @@ -6120,8 +5835,6 @@ void intel_power_domains_init_hw(struct drm_i915_private *i915, bool resume)
>  
>  	if (DISPLAY_VER(i915) >= 11) {
>  		icl_display_core_init(i915, resume);
> -	} else if (IS_CANNONLAKE(i915)) {
> -		cnl_display_core_init(i915, resume);
>  	} else if (IS_GEMINILAKE(i915) || IS_BROXTON(i915)) {
>  		bxt_display_core_init(i915, resume);
>  	} else if (DISPLAY_VER(i915) == 9) {
> @@ -6281,8 +5994,6 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
>  
>  	if (DISPLAY_VER(i915) >= 11)
>  		icl_display_core_uninit(i915);
> -	else if (IS_CANNONLAKE(i915))
> -		cnl_display_core_uninit(i915);
>  	else if (IS_GEMINILAKE(i915) || IS_BROXTON(i915))
>  		bxt_display_core_uninit(i915);
>  	else if (DISPLAY_VER(i915) == 9)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
> index ad788bbd727d..c79f7ca739d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.h
> @@ -142,8 +142,6 @@ enum i915_power_well_id {
>  	SKL_DISP_PW_MISC_IO,
>  	SKL_DISP_PW_1,
>  	SKL_DISP_PW_2,
> -	CNL_DISP_PW_DDI_F_IO,
> -	CNL_DISP_PW_DDI_F_AUX,
>  	ICL_DISP_PW_3,
>  	SKL_DISP_DC_OFF,
>  	TGL_DISP_PW_TC_COLD_OFF,
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 65596987b156..91e93f3e9649 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9828,19 +9828,6 @@ enum skl_power_gate {
>  	((pw_idx) - ICL_PW_CTL_IDX_PW_1 + SKL_PG1)
>  #define  SKL_FUSE_PG_DIST_STATUS(pg)		(1 << (27 - (pg)))
>  
> -#define _CNL_AUX_REG_IDX(pw_idx)	((pw_idx) - GLK_PW_CTL_IDX_AUX_B)
> -#define _CNL_AUX_ANAOVRD1_B		0x162250
> -#define _CNL_AUX_ANAOVRD1_C		0x162210
> -#define _CNL_AUX_ANAOVRD1_D		0x1622D0
> -#define _CNL_AUX_ANAOVRD1_F		0x162A90
> -#define CNL_AUX_ANAOVRD1(pw_idx)	_MMIO(_PICK(_CNL_AUX_REG_IDX(pw_idx), \
> -						    _CNL_AUX_ANAOVRD1_B, \
> -						    _CNL_AUX_ANAOVRD1_C, \
> -						    _CNL_AUX_ANAOVRD1_D, \
> -						    _CNL_AUX_ANAOVRD1_F))
> -#define   CNL_AUX_ANAOVRD1_ENABLE	(1 << 16)
> -#define   CNL_AUX_ANAOVRD1_LDO_BYPASS	(1 << 23)
> -
>  #define _ICL_AUX_REG_IDX(pw_idx)	((pw_idx) - ICL_PW_CTL_IDX_AUX_A)
>  #define _ICL_AUX_ANAOVRD1_A		0x162398
>  #define _ICL_AUX_ANAOVRD1_B		0x6C398
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
