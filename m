Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC940F868
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3158A6EC7A;
	Fri, 17 Sep 2021 12:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E0F6EC7A;
 Fri, 17 Sep 2021 12:54:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="202950656"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="202950656"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="453293706"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 17 Sep 2021 05:54:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 15:54:52 +0300
Date: Fri, 17 Sep 2021 15:54:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 05/13] drm/i915/dg2: add DG2+ TRANS_DDI_FUNC_CTL DP
 2.0 128b/132b mode
Message-ID: <YUSQHIR1puK6OHHR@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <260e4da302d47ae50122eb8d517be6ac3ccb15f2.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <260e4da302d47ae50122eb8d517be6ac3ccb15f2.1631191763.git.jani.nikula@intel.com>
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

On Thu, Sep 09, 2021 at 03:51:57PM +0300, Jani Nikula wrote:
> Unfortunately, the DP 2.0 128b/132b DDI mode selection in the register
> conflicts with FDI. Since we have to deal with both meanings in the same
> code, for different platforms, clarify the macro name so we don't
> forget.
> 
> Bspec: 50493
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 6 +++---
>  drivers/gpu/drm/i915/i915_reg.h          | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 23ef291f7b30..2361f48537b5 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -489,7 +489,7 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
>  		if (crtc_state->hdmi_high_tmds_clock_ratio)
>  			temp |= TRANS_DDI_HIGH_TMDS_CHAR_RATE;
>  	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_ANALOG)) {
> -		temp |= TRANS_DDI_MODE_SELECT_FDI;
> +		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
>  		temp |= (crtc_state->fdi_lanes - 1) << 1;
>  	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
>  		temp |= TRANS_DDI_MODE_SELECT_DP_MST;
> @@ -679,7 +679,7 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
>  		ret = false;
>  		break;
>  
> -	case TRANS_DDI_MODE_SELECT_FDI:
> +	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
>  		ret = type == DRM_MODE_CONNECTOR_VGA;
>  		break;
>  
> @@ -3558,7 +3558,7 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
>  		pipe_config->output_types |= BIT(INTEL_OUTPUT_HDMI);
>  		pipe_config->lane_count = 4;
>  		break;
> -	case TRANS_DDI_MODE_SELECT_FDI:
> +	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
>  		pipe_config->output_types |= BIT(INTEL_OUTPUT_ANALOG);
>  		break;
>  	case TRANS_DDI_MODE_SELECT_DP_SST:
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c2853cc005ee..03a94389c514 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -10202,7 +10202,7 @@ enum skl_power_gate {
>  #define  TRANS_DDI_MODE_SELECT_DVI	(1 << 24)
>  #define  TRANS_DDI_MODE_SELECT_DP_SST	(2 << 24)
>  #define  TRANS_DDI_MODE_SELECT_DP_MST	(3 << 24)
> -#define  TRANS_DDI_MODE_SELECT_FDI	(4 << 24)
> +#define  TRANS_DDI_MODE_SELECT_FDI_OR_128B132B	(4 << 24)
>  #define  TRANS_DDI_BPC_MASK		(7 << 20)
>  #define  TRANS_DDI_BPC_8		(0 << 20)
>  #define  TRANS_DDI_BPC_10		(1 << 20)
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
