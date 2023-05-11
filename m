Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB36FF183
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 14:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416510E0A6;
	Thu, 11 May 2023 12:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8110E0A6;
 Thu, 11 May 2023 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683808255; x=1715344255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=M5r4I8zzSsceCqKbpdOjv0skHgUUayzExsp2nd1tp4U=;
 b=fdqC+ahOGOCLEJyuZWRM1UkEwzkX62q/vIOcyW/To1qyu6grvOs8hUbu
 VOgdgJ7fpG+sp8ZukySBBNXQOONo+7X4QIxs6fQdLTVtbhM9CrFGgzROt
 hwYoXkJb9c5jtKxnwlVKec99eyunQikkApuoU1o49ICpwEXKbeWcWcy/6
 agmyYV/u/JTdgScBchIiQeDOTnuD65+wUZ57HW+yZ3bALG0tB0JbXksun
 89aOdk6MzLXwJQWJui3quFUl+12cL1xGh8HGNZ0ZXtwLcJKmHR3/6gdgq
 A25plN23YeqprOaGgg+Dd0jcU8brrDATxcx8Dy5P5p/cSXPIBxBaPsgmG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347955794"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347955794"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811575114"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="811575114"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga002.fm.intel.com with SMTP; 11 May 2023 05:30:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 May 2023 15:30:49 +0300
Date: Thu, 11 May 2023 15:30:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v9 1/8] drm/display/dsc: Add flatness and initial scale
 value calculations
Message-ID: <ZFzf-firnfYKwmy1@intel.com>
References: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v9-1-87daeaec2c0a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329-rfc-msm-dsc-helper-v9-1-87daeaec2c0a@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 03:54:41PM -0700, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
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
> +{
> +	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> +		(dsc->rc_model_size - dsc->initial_offset);
> +}

I would suggest using pure functions whenever possible. Makes it much
easier to reason about the code when you know there are no side effects.

> +
> +static inline int drm_dsc_calculate_flatness_det_thresh(struct drm_dsc_config *dsc)

'dsc' can be const. The word "calculate" seems pretty much redundant.

> +{
> +	return 2 << (dsc->bits_per_component - 8);
> +}
> +
>  #endif /* _DRM_DSC_HELPER_H_ */
>  
> 
> -- 
> 2.40.1

-- 
Ville Syrjälä
Intel
