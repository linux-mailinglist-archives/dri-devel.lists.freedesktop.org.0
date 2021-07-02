Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D762E3B9D6A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 10:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DEC6E051;
	Fri,  2 Jul 2021 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B856E043;
 Fri,  2 Jul 2021 08:16:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208516122"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="208516122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 01:16:22 -0700
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="482214388"
Received: from flast-mobl.ger.corp.intel.com (HELO localhost) ([10.252.43.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 01:16:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 45/53] drm/i915/dg2: Update modeset sequences
In-Reply-To: <20210701202427.1547543-46-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-46-matthew.d.roper@intel.com>
Date: Fri, 02 Jul 2021 11:16:18 +0300
Message-ID: <875yxtqgfh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Jul 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> DG2 has some changes to the expected modesetting sequences when compared
> to gen12.  Adjust our driver logic accordingly.  Although the DP
> sequence is pretty similar to TGL's, there are some steps that change,
> so let's split the handling for that out into a separate function.
>
> Bspec: 54128
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 135 +++++++++++++++++++++--
>  1 file changed, 127 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index ade03cf41caa..5499a2975a0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -172,14 +172,22 @@ void intel_wait_ddi_buf_idle(struct drm_i915_private *dev_priv,
>  static void intel_wait_ddi_buf_active(struct drm_i915_private *dev_priv,
>  				      enum port port)
>  {
> +	int ret;
> +
>  	/* Wait > 518 usecs for DDI_BUF_CTL to be non idle */
>  	if (DISPLAY_VER(dev_priv) < 10) {
>  		usleep_range(518, 1000);
>  		return;
>  	}
>  
> -	if (wait_for_us(!(intel_de_read(dev_priv, DDI_BUF_CTL(port)) &
> -			  DDI_BUF_IS_IDLE), 500))
> +	if (IS_DG2(dev_priv))
> +		ret = wait_for_us(!(intel_de_read(dev_priv, DDI_BUF_CTL(port)) &
> +				    DDI_BUF_IS_IDLE), 1200);
> +	else
> +		ret = wait_for_us(!(intel_de_read(dev_priv, DDI_BUF_CTL(port)) &
> +				    DDI_BUF_IS_IDLE), 500);

Nitpick, this should really parametetrized the delay, 500 vs. 1200, not
add duplicate the code.

BR,
Jani.

> +
> +	if (ret)
>  		drm_err(&dev_priv->drm, "Timeout waiting for DDI BUF %c to get active\n",
>  			port_name(port));
>  }
> @@ -2207,7 +2215,7 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
>  		ddi_clk_needed = false;
>  	}
>  
> -	if (ddi_clk_needed || !encoder->disable_clock ||
> +	if (ddi_clk_needed || !encoder->is_clock_enabled ||
>  	    !encoder->is_clock_enabled(encoder))
>  		return;
>  
> @@ -2488,6 +2496,116 @@ static void intel_ddi_mso_configure(const struct intel_crtc_state *crtc_state)
>  		     OVERLAP_PIXELS_MASK, dss1);
>  }
>  
> +static void dg2_ddi_pre_enable_dp(struct intel_atomic_state *state,
> +				  struct intel_encoder *encoder,
> +				  const struct intel_crtc_state *crtc_state,
> +				  const struct drm_connector_state *conn_state)
> +{
> +	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	int level = intel_ddi_dp_level(intel_dp);
> +
> +	intel_dp_set_link_params(intel_dp, crtc_state->port_clock,
> +				 crtc_state->lane_count);
> +
> +	/*
> +	 * 1. Enable Power Wells
> +	 *
> +	 * This was handled at the beginning of intel_atomic_commit_tail(),
> +	 * before we called down into this function.
> +	 */
> +
> +	/* 2. Enable Panel Power if PPS is required */
> +	intel_pps_on(intel_dp);
> +
> +	/*
> +	 * 3. Enable the port PLL.
> +	 */
> +	intel_ddi_enable_clock(encoder, crtc_state);
> +
> +	/* 4. Enable IO power */
> +	if (!intel_phy_is_tc(dev_priv, phy) ||
> +	    dig_port->tc_mode != TC_PORT_TBT_ALT)
> +		dig_port->ddi_io_wakeref = intel_display_power_get(dev_priv,
> +								   dig_port->ddi_io_power_domain);
> +
> +	/*
> +	 * 5. The rest of the below are substeps under the bspec's "Enable and
> +	 * Train Display Port" step.  Note that steps that are specific to
> +	 * MST will be handled by intel_mst_pre_enable_dp() before/after it
> +	 * calls into this function.  Also intel_mst_pre_enable_dp() only calls
> +	 * us when active_mst_links==0, so any steps designated for "single
> +	 * stream or multi-stream master transcoder" can just be performed
> +	 * unconditionally here.
> +	 */
> +
> +	/*
> +	 * 5.a Configure Transcoder Clock Select to direct the Port clock to the
> +	 * Transcoder.
> +	 */
> +	intel_ddi_enable_pipe_clock(encoder, crtc_state);
> +
> +	/* 5.b Not relevant to i915 for now */
> +
> +	/*
> +	 * 5.c Configure TRANS_DDI_FUNC_CTL DDI Select, DDI Mode Select & MST
> +	 * Transport Select
> +	 */
> +	intel_ddi_config_transcoder_func(encoder, crtc_state);
> +
> +	/*
> +	 * 5.d Configure & enable DP_TP_CTL with link training pattern 1
> +	 * selected
> +	 *
> +	 * This will be handled by the intel_dp_start_link_train() farther
> +	 * down this function.
> +	 */
> +
> +	/* 5.e Configure voltage swing and related IO settings */
> +	intel_snps_phy_ddi_vswing_sequence(encoder, level);
> +
> +	/*
> +	 * 5.f Configure and enable DDI_BUF_CTL
> +	 * 5.g Wait for DDI_BUF_CTL DDI Idle Status = 0b (Not Idle), timeout
> +	 *     after 1200 us.
> +	 *
> +	 * We only configure what the register value will be here.  Actual
> +	 * enabling happens during link training farther down.
> +	 */
> +	intel_ddi_init_dp_buf_reg(encoder, crtc_state);
> +
> +	if (!is_mst)
> +		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
> +
> +	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
> +	/*
> +	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
> +	 * in the FEC_CONFIGURATION register to 1 before initiating link
> +	 * training
> +	 */
> +	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
> +
> +	/*
> +	 * 5.h Follow DisplayPort specification training sequence (see notes for
> +	 *     failure handling)
> +	 * 5.i If DisplayPort multi-stream - Set DP_TP_CTL link training to Idle
> +	 *     Pattern, wait for 5 idle patterns (DP_TP_STATUS Min_Idles_Sent)
> +	 *     (timeout after 800 us)
> +	 */
> +	intel_dp_start_link_train(intel_dp, crtc_state);
> +
> +	/* 5.j Set DP_TP_CTL link training to Normal */
> +	if (!is_trans_port_sync_mode(crtc_state))
> +		intel_dp_stop_link_train(intel_dp, crtc_state);
> +
> +	/* 5.k Configure and enable FEC if needed */
> +	intel_ddi_enable_fec(encoder, crtc_state);
> +	intel_dsc_enable(encoder, crtc_state);
> +}
> +
>  static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  				  struct intel_encoder *encoder,
>  				  const struct intel_crtc_state *crtc_state,
> @@ -2573,10 +2691,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	 */
>  
>  	/* 7.e Configure voltage swing and related IO settings */
> -	if (IS_DG2(dev_priv))
> -		intel_snps_phy_ddi_vswing_sequence(encoder, level);
> -	else
> -		tgl_ddi_vswing_sequence(encoder, crtc_state, level);
> +	tgl_ddi_vswing_sequence(encoder, crtc_state, level);
>  
>  	/*
>  	 * 7.f Combo PHY: Configure PORT_CL_DW10 Static Power Down to power up
> @@ -2708,7 +2823,9 @@ static void intel_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  {
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>  
> -	if (DISPLAY_VER(dev_priv) >= 12)
> +	if (IS_DG2(dev_priv))
> +		dg2_ddi_pre_enable_dp(state, encoder, crtc_state, conn_state);
> +	else if (DISPLAY_VER(dev_priv) >= 12)
>  		tgl_ddi_pre_enable_dp(state, encoder, crtc_state, conn_state);
>  	else
>  		hsw_ddi_pre_enable_dp(state, encoder, crtc_state, conn_state);
> @@ -4634,6 +4751,8 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
>  	encoder->pipe_mask = ~0;
>  
>  	if (IS_DG2(dev_priv)) {
> +		encoder->enable_clock = intel_mpllb_enable;
> +		encoder->disable_clock = intel_mpllb_disable;
>  		encoder->get_config = dg2_ddi_get_config;
>  	} else if (IS_ALDERLAKE_S(dev_priv)) {
>  		encoder->enable_clock = adls_ddi_enable_clock;

-- 
Jani Nikula, Intel Open Source Graphics Center
