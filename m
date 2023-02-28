Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C05C6A5CF5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6FF10E4ED;
	Tue, 28 Feb 2023 16:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A58110E4E2;
 Tue, 28 Feb 2023 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677601207; x=1709137207;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=obuC4pfB4IUn9O4fCst2jPRasz8wImVX78Wr1XFNNik=;
 b=PsoBj2XdeEH2Cpht/JCN1tDDS75t+MfxriCCMVl/949uLatX8S5QrFdL
 IU2d2NfeW0OnUFSOpay+085kNwZgknAVj8Dm4F+QLgpX1kVVAO6X1ELWb
 GfRLQi9yDmkXf5MbrweWGnnCtxn8I99XdVC4kzwP3LWMNfYQ89pUxS052
 HdK9PdHUvdwTS15zqWYH7R0IKsiaZglZzMpC1SHfp2h1DolP1tWH7nIOu
 v++jhn3AgUwLqisO7524NqAXQRG4IIjQf7j4TtOXaqI4fSVXZRmYivP5w
 JDx69DqoaWv6BJFMUEGqaHf36DTIP1jwuiESTjV4uxy/c5xSqODChHp/K g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314603998"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="314603998"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:20:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="704463697"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="704463697"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:20:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 04/10] drm/i915/dsc: stop using interim structure for
 calculated params
In-Reply-To: <20230228113342.2051425-5-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-5-dmitry.baryshkov@linaro.org>
Date: Tue, 28 Feb 2023 18:19:58 +0200
Message-ID: <87v8jlyd75.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Stop using an interim structure rc_parameters for storing calculated
> params and then setting drm_dsc_config using that structure. Instead put
> calculated params into the struct drm_dsc_config directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 89 +++++------------------
>  1 file changed, 20 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index d5a7e9494b23..1ee8d13c9d64 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -18,17 +18,6 @@
>  #include "intel_qp_tables.h"
>  #include "intel_vdsc.h"
>  
> -struct rc_parameters {
> -	u16 initial_xmit_delay;
> -	u8 first_line_bpg_offset;
> -	u16 initial_offset;
> -	u8 flatness_min_qp;
> -	u8 flatness_max_qp;
> -	u8 rc_quant_incr_limit0;
> -	u8 rc_quant_incr_limit1;
> -	struct drm_dsc_rc_range_parameters rc_range_params[DSC_NUM_BUF_RANGES];
> -};
> -
>  bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
>  {
>  	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> @@ -63,8 +52,7 @@ static bool is_pipe_dsc(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
>  }
>  
>  static void
> -calculate_rc_params(struct rc_parameters *rc,
> -		    struct drm_dsc_config *vdsc_cfg)
> +calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
>  {
>  	int bpc = vdsc_cfg->bits_per_component;
>  	int bpp = vdsc_cfg->bits_per_pixel >> 4;
> @@ -84,54 +72,54 @@ calculate_rc_params(struct rc_parameters *rc,
>  	u32 res, buf_i, bpp_i;
>  
>  	if (vdsc_cfg->slice_height >= 8)
> -		rc->first_line_bpg_offset =
> +		vdsc_cfg->first_line_bpg_offset =
>  			12 + DIV_ROUND_UP((9 * min(34, vdsc_cfg->slice_height - 8)), 100);
>  	else
> -		rc->first_line_bpg_offset = 2 * (vdsc_cfg->slice_height - 1);
> +		vdsc_cfg->first_line_bpg_offset = 2 * (vdsc_cfg->slice_height - 1);
>  
>  	/* Our hw supports only 444 modes as of today */
>  	if (bpp >= 12)
> -		rc->initial_offset = 2048;
> +		vdsc_cfg->initial_offset = 2048;
>  	else if (bpp >= 10)
> -		rc->initial_offset = 5632 - DIV_ROUND_UP(((bpp - 10) * 3584), 2);
> +		vdsc_cfg->initial_offset = 5632 - DIV_ROUND_UP(((bpp - 10) * 3584), 2);
>  	else if (bpp >= 8)
> -		rc->initial_offset = 6144 - DIV_ROUND_UP(((bpp - 8) * 512), 2);
> +		vdsc_cfg->initial_offset = 6144 - DIV_ROUND_UP(((bpp - 8) * 512), 2);
>  	else
> -		rc->initial_offset = 6144;
> +		vdsc_cfg->initial_offset = 6144;
>  
>  	/* initial_xmit_delay = rc_model_size/2/compression_bpp */
> -	rc->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
> +	vdsc_cfg->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
>  
> -	rc->flatness_min_qp = 3 + qp_bpc_modifier;
> -	rc->flatness_max_qp = 12 + qp_bpc_modifier;
> +	vdsc_cfg->flatness_min_qp = 3 + qp_bpc_modifier;
> +	vdsc_cfg->flatness_max_qp = 12 + qp_bpc_modifier;
>  
> -	rc->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
> -	rc->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
> +	vdsc_cfg->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
> +	vdsc_cfg->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
>  
>  	bpp_i  = (2 * (bpp - 6));
>  	for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
>  		/* Read range_minqp and range_max_qp from qp tables */
> -		rc->rc_range_params[buf_i].range_min_qp =
> +		vdsc_cfg->rc_range_params[buf_i].range_min_qp =
>  			intel_lookup_range_min_qp(bpc, buf_i, bpp_i);
> -		rc->rc_range_params[buf_i].range_max_qp =
> +		vdsc_cfg->rc_range_params[buf_i].range_max_qp =
>  			intel_lookup_range_max_qp(bpc, buf_i, bpp_i);
>  
>  		/* Calculate range_bgp_offset */
>  		if (bpp <= 6) {
> -			rc->rc_range_params[buf_i].range_bpg_offset = ofs_und6[buf_i];
> +			vdsc_cfg->rc_range_params[buf_i].range_bpg_offset = ofs_und6[buf_i];
>  		} else if (bpp <= 8) {
>  			res = DIV_ROUND_UP(((bpp - 6) * (ofs_und8[buf_i] - ofs_und6[buf_i])), 2);
> -			rc->rc_range_params[buf_i].range_bpg_offset =
> +			vdsc_cfg->rc_range_params[buf_i].range_bpg_offset =
>  								ofs_und6[buf_i] + res;
>  		} else if (bpp <= 12) {
> -			rc->rc_range_params[buf_i].range_bpg_offset =
> +			vdsc_cfg->rc_range_params[buf_i].range_bpg_offset =
>  								ofs_und8[buf_i];
>  		} else if (bpp <= 15) {
>  			res = DIV_ROUND_UP(((bpp - 12) * (ofs_und15[buf_i] - ofs_und12[buf_i])), 3);
> -			rc->rc_range_params[buf_i].range_bpg_offset =
> +			vdsc_cfg->rc_range_params[buf_i].range_bpg_offset =
>  								ofs_und12[buf_i] + res;
>  		} else {
> -			rc->rc_range_params[buf_i].range_bpg_offset =
> +			vdsc_cfg->rc_range_params[buf_i].range_bpg_offset =
>  								ofs_und15[buf_i];

This would benefit from a temp range_bpg_offset variable, assigned to
vdsc_cfg->rc_range_params[buf_i].range_bpg_offset after the if ladder.

>  		}
>  	}
> @@ -143,9 +131,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>  	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
>  	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
> -	const struct rc_parameters *rc_params;
> -	struct rc_parameters *rc = NULL;
> -	u8 i = 0;
>  	int ret;
>  
>  	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
> @@ -169,43 +154,12 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  	 * parameters
>  	 */
>  	if (DISPLAY_VER(dev_priv) >= 13) {
> -		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
> -		if (!rc)
> -			return -ENOMEM;
> -
> -		calculate_rc_params(rc, vdsc_cfg);
> -		rc_params = rc;
> +		calculate_rc_params(vdsc_cfg);
>  	} else {
>  		ret = drm_dsc_setup_rc_params(vdsc_cfg);
>  		if (ret)
>  			return ret;
>  
> -		goto out;
> -	}
> -
> -	vdsc_cfg->first_line_bpg_offset = rc_params->first_line_bpg_offset;
> -	vdsc_cfg->initial_xmit_delay = rc_params->initial_xmit_delay;
> -	vdsc_cfg->initial_offset = rc_params->initial_offset;
> -	vdsc_cfg->flatness_min_qp = rc_params->flatness_min_qp;
> -	vdsc_cfg->flatness_max_qp = rc_params->flatness_max_qp;
> -	vdsc_cfg->rc_quant_incr_limit0 = rc_params->rc_quant_incr_limit0;
> -	vdsc_cfg->rc_quant_incr_limit1 = rc_params->rc_quant_incr_limit1;
> -
> -	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> -		vdsc_cfg->rc_range_params[i].range_min_qp =
> -			rc_params->rc_range_params[i].range_min_qp;
> -		vdsc_cfg->rc_range_params[i].range_max_qp =
> -			rc_params->rc_range_params[i].range_max_qp;
> -		/*
> -		 * Range BPG Offset uses 2's complement and is only a 6 bits. So
> -		 * mask it to get only 6 bits.
> -		 */
> -		vdsc_cfg->rc_range_params[i].range_bpg_offset =
> -			rc_params->rc_range_params[i].range_bpg_offset &
> -			DSC_RANGE_BPG_OFFSET_MASK;

This masking needs to be added to the loop in
calculate_rc_params(). With the temp variable I suggested above, it
could be done while assigning.

With that fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Also, this is awesome stuff, thanks!

> -	}
> -
> -	if (DISPLAY_VER(dev_priv) < 13) {
>  		if (compressed_bpp == 6 &&
>  		    vdsc_cfg->bits_per_component == 8)
>  			vdsc_cfg->rc_quant_incr_limit1 = 23;
> @@ -215,7 +169,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
>  	}
>  
> -out:
>  	/*
>  	 * BitsPerComponent value determines mux_word_size:
>  	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
> @@ -230,8 +183,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
>  		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
>  
> -	kfree(rc);
> -
>  	return 0;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
