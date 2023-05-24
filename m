Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207870FE34
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6746510E55F;
	Wed, 24 May 2023 19:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F2110E55F;
 Wed, 24 May 2023 19:05:40 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 722642054C;
 Wed, 24 May 2023 21:05:36 +0200 (CEST)
Date: Wed, 24 May 2023 21:05:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v14 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Message-ID: <7yzn3lyxpdl447c2ujq3yfh37pbnfvv2t2bvrtziie3j3lxt5n@a6znq7ahjr2a>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-1-bafc7be95691@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-1-bafc7be95691@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-24 10:45:14, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 24 ++++++++++++++++++++++++
>  include/drm/display/drm_dsc_helper.h     |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index fc187a8d8873..4efb6236d22c 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -1413,3 +1413,27 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dsc_compute_rc_parameters);
> +
> +/**
> + * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
> + * @dsc: Pointer to DRM DSC config struct
> + *
> + * Return: Calculated initial scale value

Perhaps just drop Calculated from Return:?

> + */
> +u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> +{
> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> +}
> +EXPORT_SYMBOL(drm_dsc_initial_scale_value);
> +
> +/**
> + * drm_dsc_flatness_det_thresh() - Calculate the flatness_det_thresh for the given DSC config

You've written out the word ("flatness det thresh" and "initial scale
value") entirely elsewhere, why the underscores in the doc comment here?

Instead we should have the full meaning here (and in the Return: below),
please correct me if I'm wrong but in VESA DSC v1.2a spec 6.8.5.1
Encoder Flatness Decision I think this variable means "flatness
determination threshold"?  If so, use that in the doc comment :)

(and drop the leading "the", so just "Calculate flatness determination
threshold for the given DSC config")

> + * @dsc: Pointer to DRM DSC config struct
> + *
> + * Return: Calculated flatness det thresh value

Nit: perhaps we can just drop "calculated" here?

- Marijn

> + */
> +u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}
> +EXPORT_SYMBOL(drm_dsc_flatness_det_thresh);
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index fc2104415dcb..71789fb34e17 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -24,6 +24,8 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>  void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> +u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
> +u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
>  
>  #endif /* _DRM_DSC_HELPER_H_ */
>  
> 
> -- 
> 2.40.1
> 
