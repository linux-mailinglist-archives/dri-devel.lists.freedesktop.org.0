Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622367073E5
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0549310E2B7;
	Wed, 17 May 2023 21:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E25B10E2B7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:18:44 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DCC363F805;
 Wed, 17 May 2023 23:18:41 +0200 (CEST)
Date: Wed, 17 May 2023 23:18:40 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v11 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
Message-ID: <yrkishznoq5zyyu5mqutnzfx3rsrwq373zij2nzajjhf3yyw4f@bml6t4qjkjj6>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-3-30270e1eeac3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-3-30270e1eeac3@quicinc.com>
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 11:51:12, Jessica Zhang wrote:
> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Seems fine, but folks might request to make int->integer to make it more
clear that it returns the integer part, and/or add the commit body to a
documentation comment.

Similarly I wonder if we should add a constructor too that can be used
in RC table creation and panel drivers.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

- Marijn

> ---
>  include/drm/display/drm_dsc_helper.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index ea99b0b90674..b7956830cab9 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -9,6 +9,7 @@
>  #define DRM_DSC_HELPER_H_
>  
>  #include <drm/display/drm_dsc.h>
> +#include <linux/bug.h>
>  
>  enum drm_dsc_params_kind {
>  	DRM_DSC_1_2_444,
> @@ -26,6 +27,12 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *dsc)
> +{
> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
> +	return dsc->bits_per_pixel >> 4;
> +}
> +
>  static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
>  {
>  	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> 
> -- 
> 2.40.1
> 
