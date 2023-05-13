Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC97019B4
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 22:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D825210E136;
	Sat, 13 May 2023 20:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E629610E136
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 20:43:14 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DD1253F290;
 Sat, 13 May 2023 22:43:11 +0200 (CEST)
Date: Sat, 13 May 2023 22:43:10 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 2/8] drm/i915/dsc: move rc_buf_thresh values to common
 helper
Message-ID: <bo57bsntndvef4l3xtzhh54m6trdouhg253r6aqhbdc33idp6x@5dwgslu6fbm7>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
 <20230504153511.4007320-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504153511.4007320-3-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-04 18:35:05, Dmitry Baryshkov wrote:
> 
> The rc_buf_thresh values are common to all DSC implementations. Move
> them to the common helper together with the code to propagage them to

Propagate*

> the drm_dsc_config.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After right-shifting these values by 6 they are indeed, as promised,
identical to the values used in MSM.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

If a tested-by is relevant in addition to r-b, let me know.  This works
(no regressions) on quite a few MSM devices on my end.
(same question for the other patches)

- Marijn

> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c  | 35 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +---------------
>  include/drm/display/drm_dsc_helper.h      |  1 +
>  3 files changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index c869c6e51e2b..be91abe2cfb2 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -270,6 +270,41 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>  }
>  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>  
> +/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> +static const u16 drm_dsc_rc_buf_thresh[] = {
> +	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> +	7744, 7872, 8000, 8064
> +};
> +
> +/**
> + * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
> + * in accordance with the DSC 1.2 specification.
> + *
> + * @vdsc_cfg: DSC Configuration data partially filled by driver
> + */
> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
> +{
> +	int i;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(drm_dsc_rc_buf_thresh) !=
> +		     DSC_NUM_BUF_RANGES - 1);
> +	BUILD_BUG_ON(ARRAY_SIZE(drm_dsc_rc_buf_thresh) !=
> +		     ARRAY_SIZE(vdsc_cfg->rc_buf_thresh));
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_dsc_rc_buf_thresh); i++)
> +		vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
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
> index 7003ae9f683a..2fd08375bbe3 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -37,12 +37,6 @@ enum COLUMN_INDEX_BPC {
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
> @@ -543,23 +537,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  
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
> -- 
> 2.39.2
> 
