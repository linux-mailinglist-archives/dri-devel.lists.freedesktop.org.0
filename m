Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF470B929
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704D910E298;
	Mon, 22 May 2023 09:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8F10E297;
 Mon, 22 May 2023 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684748253; x=1716284253;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WFvO+9FcvlRH0vg9/maiDOK1v6r6UcosEKsoxcaaaxg=;
 b=AR+eR1Ul6Lb/ua2g1PDZbb9vgNVCE5iX5ck9Jd7e2Q6XCASGB0Al/kNi
 iXoYGqdB273Cdlz1OIngnBW20MWX7uRNRwc5sPgX0Na/60V/F5BRihdhx
 aIxgrWSBzhHLRIcpYRETQ+sllyV5gjg3J+9CkNAXCAAZ3Iq8PSEg1u8Ib
 It7h48s6Kq4ALxjJy6IKISMw/1APB29Tk7fZNotlRE+y1ZojdOh8g5aFX
 XOx0ZBCcZqnIOGK5Ik158k3aQl9Hul3e2Rg1+NWdhYaJ21c7UGl3OfZyK
 BpBGkxYkG1i3evCFElyNHmcOOdTzhO17l6dfcZx+KrH77Jmfeo0fyyOLt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="416336686"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="416336686"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="847777256"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="847777256"
Received: from andreipo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.228])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:37:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v12 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
Date: Mon, 22 May 2023 12:37:26 +0300
Message-ID: <875y8kogfd.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 May 2023, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> index fc2104415dcb..753b0034eda7 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>  int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>  
> +static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> +{
> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> +}
> +
> +static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}

kernel-doc? Maybe make them regular functions instead of static inline?

BR,
Jani.

> +
>  #endif /* _DRM_DSC_HELPER_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
