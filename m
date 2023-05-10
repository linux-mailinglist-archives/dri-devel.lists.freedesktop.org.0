Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C756FD66D
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 08:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE2E10E3C3;
	Wed, 10 May 2023 06:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2689310E3C3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 06:01:23 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.225.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 293E9201E6;
 Wed, 10 May 2023 08:01:17 +0200 (CEST)
Date: Wed, 10 May 2023 08:01:15 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v7 1/8] drm/display/dsc: Add flatness and initial scale
 value calculations
Message-ID: <522ab2j4k6q3bdvhtf5h7zxu5ntysgcxgx4hznjyrp7wspealw@itzxkvimaeh7>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-1-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-1-df48a2c54421@quicinc.com>
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-09 15:06:47, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

This ordering is odd: Jessica originally sent the patch, then Dmitry
seems to have sent it as part of his series and added his s-o-b [1], but
now Jessica is sending her original patch again but with Dmitry's
sign-off first.

[1]: https://lore.kernel.org/linux-arm-msm/20230403092313.235320-11-dmitry.baryshkov@linaro.org/

> ---
>  include/drm/display/drm_dsc_helper.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index 0bb0c3afd740..422135a33d65 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -25,5 +25,16 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline void drm_dsc_set_initial_scale_value(struct drm_dsc_config *dsc)

Nit: the other functions are not static inline, and are called "compute"
or "setup" (or "calculate" below) for maths.

The math itself is:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> +{
> +	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> +		(dsc->rc_model_size - dsc->initial_offset);
> +}
> +
> +static inline int drm_dsc_calculate_flatness_det_thresh(struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}
> +
>  #endif /* _DRM_DSC_HELPER_H_ */
>  
> 
> -- 
> 2.40.1
> 
