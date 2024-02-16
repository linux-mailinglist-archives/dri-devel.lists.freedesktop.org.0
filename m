Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30965857959
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7369A10E1C1;
	Fri, 16 Feb 2024 09:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9JY2yn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBF210E187;
 Fri, 16 Feb 2024 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708077124; x=1739613124;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1DmYPShGc1WqUllF/gBgHGJAcAVWQWXf2YSAvLKPay0=;
 b=c9JY2yn4aIqQXuMhK47puFQnbOrYO7GPCZliex8X34k7QMZ+ypIMo7xQ
 HR0ifF53J9uQDmXMJCjl3DINRTTD3QGZW+QzU8RuUGlqmq4E9TebCs+6z
 mwUhQZjWeEVbMFKG47hq5t4Xo4ESCkfgEv/TfOsUCMiH7ZSNY2r0qqLnA
 eZoEYiHC1UuLQ3GAfbev2ONpGDdoMuJzPgCEvtMCndAAXVlZpR/OL8Is5
 lblJKPTF0OfAjd6dyxOMHrWy20s8NnP/7O42TBJT2YKG1O9jmY8zzyrMU
 NwmnneuZ9RlBuGwGTKo1g6Po2SX8kV6ddKeDtLI9aIRyxDdu7k+apxV36 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13305123"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="13305123"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935815479"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="935815479"
Received: from pshishpo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.79])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:51:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, robdclark@gmail.com,
 freedreno@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
In-Reply-To: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
Date: Fri, 16 Feb 2024 11:51:54 +0200
Message-ID: <87eddc4tz9.fsf@intel.com>
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

On Thu, 15 Feb 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
> Lets move this to drm_dp_helper to achieve this.
>
> changes in v2:
> 	- rebased on top of drm-tip
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 78 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 71 +---------------------
>  include/drm/display/drm_dp_helper.h     |  3 +
>  3 files changed, 83 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 8d6ce46471ae..6c91f400ecb1 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2913,6 +2913,84 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>  
> +/**
> + * drm_dp_vsc_sdp_pack() - pack a given vsc sdp into generic dp_sdp
> + * @vsc: vsc sdp initialized according to its purpose as defined in
> + *       table 2-118 - table 2-120 in DP 1.4a specification
> + * @sdp: valid handle to the generic dp_sdp which will be packed
> + * @size: valid size of the passed sdp handle
> + *
> + * Returns length of sdp on success and error code on failure
> + */
> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> +			    struct dp_sdp *sdp, size_t size)
> +{
> +	size_t length = sizeof(struct dp_sdp);
> +
> +	if (size < length)
> +		return -ENOSPC;
> +
> +	memset(sdp, 0, size);
> +
> +	/*
> +	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
> +	 * VSC SDP Header Bytes
> +	 */
> +	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
> +	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
> +	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
> +	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
> +
> +	if (vsc->revision == 0x6) {
> +		sdp->db[0] = 1;
> +		sdp->db[3] = 1;
> +	}
> +
> +	/*
> +	 * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
> +	 * Format as per DP 1.4a spec and DP 2.0 respectively.
> +	 */
> +	if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
> +		goto out;
> +
> +	/* VSC SDP Payload for DB16 through DB18 */
> +	/* Pixel Encoding and Colorimetry Formats  */
> +	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
> +	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
> +
> +	switch (vsc->bpc) {
> +	case 6:
> +		/* 6bpc: 0x0 */
> +		break;
> +	case 8:
> +		sdp->db[17] = 0x1; /* DB17[3:0] */
> +		break;
> +	case 10:
> +		sdp->db[17] = 0x2;
> +		break;
> +	case 12:
> +		sdp->db[17] = 0x3;
> +		break;
> +	case 16:
> +		sdp->db[17] = 0x4;
> +		break;
> +	default:
> +		WARN(1, "Missing case %d\n", vsc->bpc);
> +		return -EINVAL;
> +	}
> +
> +	/* Dynamic Range and Component Bit Depth */
> +	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
> +		sdp->db[17] |= 0x80;  /* DB17[7] */
> +
> +	/* Content Type */
> +	sdp->db[18] = vsc->content_type & 0x7;
> +
> +out:
> +	return length;
> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_pack);
> +
>  /**
>   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>   * @dpcd: DisplayPort configuration data
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 217196196e50..a9458df475e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4089,73 +4089,6 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>  	return false;
>  }
>  
> -static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> -				     struct dp_sdp *sdp, size_t size)
> -{
> -	size_t length = sizeof(struct dp_sdp);
> -
> -	if (size < length)
> -		return -ENOSPC;
> -
> -	memset(sdp, 0, size);
> -
> -	/*
> -	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
> -	 * VSC SDP Header Bytes
> -	 */
> -	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
> -	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
> -	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
> -	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
> -
> -	if (vsc->revision == 0x6) {
> -		sdp->db[0] = 1;
> -		sdp->db[3] = 1;
> -	}
> -
> -	/*
> -	 * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
> -	 * Format as per DP 1.4a spec and DP 2.0 respectively.
> -	 */
> -	if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
> -		goto out;
> -
> -	/* VSC SDP Payload for DB16 through DB18 */
> -	/* Pixel Encoding and Colorimetry Formats  */
> -	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
> -	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
> -
> -	switch (vsc->bpc) {
> -	case 6:
> -		/* 6bpc: 0x0 */
> -		break;
> -	case 8:
> -		sdp->db[17] = 0x1; /* DB17[3:0] */
> -		break;
> -	case 10:
> -		sdp->db[17] = 0x2;
> -		break;
> -	case 12:
> -		sdp->db[17] = 0x3;
> -		break;
> -	case 16:
> -		sdp->db[17] = 0x4;
> -		break;
> -	default:
> -		MISSING_CASE(vsc->bpc);
> -		break;
> -	}
> -	/* Dynamic Range and Component Bit Depth */
> -	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
> -		sdp->db[17] |= 0x80;  /* DB17[7] */
> -
> -	/* Content Type */
> -	sdp->db[18] = vsc->content_type & 0x7;
> -
> -out:
> -	return length;
> -}
> -
>  static ssize_t
>  intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>  					 const struct hdmi_drm_infoframe *drm_infoframe,
> @@ -4248,8 +4181,8 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>  
>  	switch (type) {
>  	case DP_SDP_VSC:
> -		len = intel_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
> -					    sizeof(sdp));
> +		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
> +					  sizeof(sdp));
>  		break;
>  	case HDMI_PACKET_TYPE_GAMUT_METADATA:
>  		len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d02014a87f12..8474504d4c88 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -812,4 +812,7 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  		       int bpp_x16, unsigned long flags);
>  int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>  
> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> +			    struct dp_sdp *sdp, size_t size);
> +
>  #endif /* _DRM_DP_HELPER_H_ */

-- 
Jani Nikula, Intel
