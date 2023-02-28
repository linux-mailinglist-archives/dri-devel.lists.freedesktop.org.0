Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9F6A5CB3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20BD10E4E6;
	Tue, 28 Feb 2023 16:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4010E02E;
 Tue, 28 Feb 2023 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677600171; x=1709136171;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uJ6b+0/zHOeAkP5Hg4XcILPc1vZObbE90DrMyXpviNQ=;
 b=Lb0M3fIU2J8d8qDcWro9AzRXxciA5mhNkBo93F873Eh2j7lorvzOBzou
 ew6cb7qAnmT8gu08Mba9SMTTn27tcKgNjR6lA8Lx3+h+LoeEPhvaC2LLN
 gTyzcUBS0DgW74JK0B9tf5gnJjuOnVj2z1CF4xO/EoHQ9WviHXvoWsq8k
 PxXUgKFmtlIvj9Hq96kDSBlYALCnMSXii3+6MrnXuC0N75F5nnWNWIaEJ
 vVCu9QmNck78Oq0pbdBNEvNzlT2w9FwTeWj2KAbHiCld0lgl4u7WJxdYk
 L3ayhyx8ig7W5JY6Fm7S4+xguL+rvbJ0Pyl1zF9lqzchNxdGlTP+MoCYU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="398954708"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="398954708"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:02:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="798101078"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="798101078"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:01:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 02/10] drm/i915/dsc: move rc_buf_thresh values to common
 helper
In-Reply-To: <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
Date: Tue, 28 Feb 2023 18:01:54 +0200
Message-ID: <871qm9zslp.fsf@intel.com>
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
> The rc_buf_thresh values are common to all DSC implementations. Move
> them to the common helper together with the code to propagage them to
> the drm_dsc_config.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 37 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +--------------
>  include/drm/display/drm_dsc_helper.h      |  1 +
>  3 files changed, 39 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index c869c6e51e2b..ab8679c158b5 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -270,6 +270,43 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>  }
>  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>  
> +/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> +const u16 drm_dsc_rc_buf_thresh[] = {
> +	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> +	7744, 7872, 8000, 8064
> +};
> +EXPORT_SYMBOL(drm_dsc_rc_buf_thresh);
> +
> +/**
> + * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
> + * in accordance with the DSC 1.2 specification.
> + *
> + * @vdsc_cfg: DSC Configuration data partially filled by driver
> + */
> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
> +{
> +	int i = 0;
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> +		/*
> +		 * six 0s are appended to the lsb of each threshold value
> +		 * internally in h/w.
> +		 * Only 8 bits are allowed for programming RcBufThreshold
> +		 */

Not sure how appropriate the hardware references are, maybe clean it up
a bit.

With that, and +static and -export mentioned earlier,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +		vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
> +	}
> +
> +	/*
> +	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
> +	 * as per C Model
> +	 */
> +	if (vdsc_cfg->bits_per_pixel == 6 << 4) {
> +		vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
> +		vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
> +
>  /**
>   * drm_dsc_compute_rc_parameters() - Write rate control
>   * parameters to the dsc configuration defined in
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index d080741fd0b3..b4faab4c8fb3 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -36,12 +36,6 @@ enum COLUMN_INDEX_BPC {
>  	MAX_COLUMN_INDEX
>  };
>  
> -/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> -static const u16 rc_buf_thresh[] = {
> -	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> -	7744, 7872, 8000, 8064
> -};
> -
>  struct rc_parameters {
>  	u16 initial_xmit_delay;
>  	u8 first_line_bpg_offset;
> @@ -474,23 +468,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  	vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
>  	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
>  
> -	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> -		/*
> -		 * six 0s are appended to the lsb of each threshold value
> -		 * internally in h/w.
> -		 * Only 8 bits are allowed for programming RcBufThreshold
> -		 */
> -		vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
> -	}
> -
> -	/*
> -	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
> -	 * as per C Model
> -	 */
> -	if (compressed_bpp == 6) {
> -		vdsc_cfg->rc_buf_thresh[12] = 0x7C;
> -		vdsc_cfg->rc_buf_thresh[13] = 0x7D;
> -	}
> +	drm_dsc_set_rc_buf_thresh(vdsc_cfg);
>  
>  	/*
>  	 * From XE_LPD onwards we supports compression bpps in steps of 1
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 8b41edbbabab..706ba1d34742 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  			      const struct drm_dsc_config *dsc_cfg);
> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
>  #endif /* _DRM_DSC_HELPER_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
