Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54B851065
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C1510EBBC;
	Mon, 12 Feb 2024 10:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fo9DNKFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A130010E0F6;
 Mon, 12 Feb 2024 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707732826; x=1739268826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=b5yCS+oa4RLidNsPnjoIz0El0jlSvCjtFpTobsF8c/k=;
 b=fo9DNKFnhdrevyyYcYHqoj7WGzop9KU2liawJ5LI2AIU2d9GW9XRFGk6
 o8E9y8aa1K001wuIgkAgPiUZDcydgq0yvqO30VxoZDaoKsCuLEP0g2WCq
 W+nD4NPDDt6ij14Zz8EgnaMGuaKm22NDc9BJFdK+2S+xZ794zs/9tlVE3
 b07b/pfqc9d6mWqB3/iab1dwkUUCrfzs+mb1P+UKhikzzaodd2SABLoJ3
 O67e9MDS2HXf4Stoc64RFckdrqoisvXFO73CkIru2dT8Snhk4El9rZjHt
 eoYrF6Uii8G/PpQbx1D4RYN+JT83tH1doExaDmsVrBi1bJaD5OECYEqby Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1581053"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1581053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="7296805"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:13:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, robdclark@gmail.com,
 freedreno@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 quic_jesszhan@quicinc.com, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/dp: add an API to indicate if sink supports VSC SDP
In-Reply-To: <20240210202704.977303-1-quic_abhinavk@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240210202704.977303-1-quic_abhinavk@quicinc.com>
Date: Mon, 12 Feb 2024 12:13:34 +0200
Message-ID: <87il2u9ei9.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Feb 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> From: Paloma Arellano <quic_parellan@quicinc.com>
>
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.
>
> changes in v3:
> 	- fix the commit title prefix to drm/dp
> 	- get rid of redundant !!
> 	- break out this change from series [1] to get acks from drm core
> 	  maintainers
>
> Changes in v2:
> 	- Move VSC SDP support check API from dp_panel.c to
> 	  drm_dp_helper.c
>
> [1]: https://patchwork.freedesktop.org/series/129180/
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index b1ca3a1100da..7a851f92b249 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2916,6 +2916,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>  
> +/**
> + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> + * @aux: DisplayPort AUX channel
> + * @dpcd: DisplayPort configuration data
> + *
> + * Returns true if vsc sdp is supported, else returns false
> + */
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	u8 rx_feature;
> +
> +	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> +		drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +		return false;
> +	}
> +
> +	return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> +		(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);

I guess you could bail out early without further dpcd access with the
dpcd rev check?

BR,
Jani.


> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> +
>  /**
>   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>   * @dpcd: DisplayPort configuration data
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 863b2e7add29..948381b2b0b1 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
>  
>  void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>  			const struct drm_dp_vsc_sdp *vsc);
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);

-- 
Jani Nikula, Intel
