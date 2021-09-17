Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E740F858
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BC56EC76;
	Fri, 17 Sep 2021 12:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F0C6EC74;
 Fri, 17 Sep 2021 12:51:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="222829270"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="222829270"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="483064852"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 17 Sep 2021 05:51:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 15:51:10 +0300
Date: Fri, 17 Sep 2021 15:51:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 11/13] drm/i915/dg2: use 128b/132b transcoder DDI mode
Message-ID: <YUSPPgW7plBMAQiS@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <279bfbd979e0256fae13a5231e07e2f4fb665c07.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279bfbd979e0256fae13a5231e07e2f4fb665c07.1631191763.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Sep 09, 2021 at 03:52:03PM +0300, Jani Nikula wrote:
> 128b/132b has a separate transcoder DDI mode, which also requires the
> MST transport select to be set. Note that we'll use DP MST also for
> single-stream 128b/132b.
> 
> Having the FDI and 128b/132b modes share the register mode value
> complicates things a bit.
> 
> v2:
> - Use HAS_DP20 abstraction for 128b/132b mode (Ville)
> - Use intel_dp_is_uhbr() helper
> 
> Bspec: 50493
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 27 ++++++++++++++++++------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a7b7e4fafcb3..d2b96b2efdfe 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -506,7 +506,10 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
>  		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
>  		temp |= (crtc_state->fdi_lanes - 1) << 1;
>  	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
> -		temp |= TRANS_DDI_MODE_SELECT_DP_MST;
> +		if (intel_dp_is_uhbr(crtc_state))
> +			temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
> +		else
> +			temp |= TRANS_DDI_MODE_SELECT_DP_MST;
>  		temp |= DDI_PORT_WIDTH(crtc_state->lane_count);
>  
>  		if (DISPLAY_VER(dev_priv) >= 12) {
> @@ -694,7 +697,12 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
>  		break;
>  
>  	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
> -		ret = type == DRM_MODE_CONNECTOR_VGA;
> +		if (HAS_DP20(dev_priv))
> +			/* 128b/132b */
> +			ret = false;
> +		else
> +			/* FDI */
> +			ret = type == DRM_MODE_CONNECTOR_VGA;
>  		break;
>  
>  	default:
> @@ -781,8 +789,9 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
>  		if ((tmp & port_mask) != ddi_select)
>  			continue;
>  
> -		if ((tmp & TRANS_DDI_MODE_SELECT_MASK) ==
> -		    TRANS_DDI_MODE_SELECT_DP_MST)
> +		if ((tmp & TRANS_DDI_MODE_SELECT_MASK) == TRANS_DDI_MODE_SELECT_DP_MST ||
> +		    (HAS_DP20(dev_priv) &&
> +		     (tmp & TRANS_DDI_MODE_SELECT_MASK) == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B))
>  			mst_pipe_mask |= BIT(p);
>  
>  		*pipe_mask |= BIT(p);
> @@ -3573,9 +3582,6 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
>  		pipe_config->output_types |= BIT(INTEL_OUTPUT_HDMI);
>  		pipe_config->lane_count = 4;
>  		break;
> -	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
> -		pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
> -		break;
>  	case TRANS_DDI_MODE_SELECT_DP_SST:
>  		if (encoder->type == INTEL_OUTPUT_EDP)
>  			pipe_config->output_types |= BIT(INTEL_OUTPUT_EDP);
> @@ -3604,6 +3610,13 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
>  			pipe_config->infoframes.enable |=
>  				intel_hdmi_infoframes_enabled(encoder, pipe_config);
>  		break;
> +	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
> +		if (!HAS_DP20(dev_priv)) {
> +			/* FDI */
> +			pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
> +			break;
> +		}
> +		fallthrough; /* 128b/132b */
>  	case TRANS_DDI_MODE_SELECT_DP_MST:
>  		pipe_config->output_types |= BIT(INTEL_OUTPUT_DP_MST);
>  		pipe_config->lane_count =
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
