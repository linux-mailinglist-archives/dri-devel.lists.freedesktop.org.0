Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B074D68970F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306C410E761;
	Fri,  3 Feb 2023 10:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C50F10E75E;
 Fri,  3 Feb 2023 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675420798; x=1706956798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oJpLdX1hVfRUozbEpr5vboZPYaKayGp8D4xLiv5+wkI=;
 b=JBwLxy/4gA2fkUE/dYm+bN3BV8YhVtBMr2BLEnxlleB3plwnHBavNbR1
 iYydcRc70kWqZe0ZjckTq14LcfjR+CFXl9/mhvhzzQee8VBDqM/EUlU0d
 XJhaWImvDI8n3VO9GR6KXkp116syQh2pktGieh2Y9Hify7NIZetGgAa1+
 SSq4wkif1/VcGuIoPkmrZ6vR6EPQPZIlRGLobL70SbFOfNgskbjYqRJmA
 ho2YNH2T9cq1bQ0G3zfBFK7o4kW9ickL0W4dLhS6FY7t7ozEYKgIcddht
 CC5G2kp2IHXmhvjVpP48re+cSJvPFYsy5a/ykwP1kH9Z1DdthPwhXH+gK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330001931"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330001931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 02:39:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="808333248"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="808333248"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga001.fm.intel.com with SMTP; 03 Feb 2023 02:39:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Feb 2023 12:39:53 +0200
Date: Fri, 3 Feb 2023 12:39:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y9zkef5FjtZ7guVS@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203020744.30745-3-joshua@froggi.es>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> Userspace has no way of controlling or knowing the pixel encoding
> currently, so there is no way for it to ever get the right values here.

That applies to a lot of the other values as well (they are
explicitly RGB or YCC). The idea was that this property sets the
infoframe/MSA/SDP value exactly, and other properties should be
added to for use userspace to control the pixel encoding/colorspace
conversion(if desired, or userspace just makes sure to
directly feed in correct kind of data).

> 
> When we do add pixel_encoding control from userspace,we can pick the
> right value for the colorimetry packet based on the
> pixel_encoding + the colorspace.
> 
> Let's deprecate these values, and have one BT.2020 colorspace entry
> that userspace can use.
> 
> Note: _CYCC was effectively 'removed' by this change, but that was not
> possible to be taken advantage of anyway, as there is currently no
> pixel_encoding control so it would not be possible to output
> linear YCbCr.
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> 
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
>  drivers/gpu/drm/drm_connector.c           | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
>  include/drm/drm_connector.h               | 19 ++++++++++---------
>  4 files changed, 29 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> index 0264abe55278..c85860600395 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>  #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
>  #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
>  #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
> +#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
>  
> @@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] = {
>  	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
> -	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] = HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] = HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
>  };
>  
>  #undef C
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 61c29ce74b03..58699ab15a6a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
>  	/* Colorimetry based on IEC 61966-2-5 */
>  	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>  	/* Added as part of Additional Colorimetry Extension in 861.G */
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
> @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>  	/* Colorimetry based on SMPTE RP 431-2 */
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>  	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>  	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>  	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> @@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>  	/* Colorimetry based on IEC 61966-2-5 [33] */
>  	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c9be61d2348e..1aa5dedeec7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
>  		vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
>  		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> +	case DRM_MODE_COLORIMETRY_BT2020:
> +		vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
> +			? DP_COLORIMETRY_BT2020_RGB
> +			: DP_COLORIMETRY_BT2020_YCC;
>  		break;
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>  	switch (conn_state->colorspace) {
>  	case DRM_MODE_COLORIMETRY_SYCC_601:
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> +	case DRM_MODE_COLORIMETRY_BT2020:
>  		return true;
>  	default:
>  		break;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index eb4cc9076e16..42a3cf43168c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
>   *   opYCC601 colorimetry format
>   * @DRM_MODE_COLORIMETRY_OPRGB:
>   *   opRGB colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> - *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> - *   ITU-R BT.2020 R' G' B' colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> + * @DRM_MODE_COLORIMETRY_BT2020:
> + *   ITU-R BT.2020 [R' G' B'] or
> + * 	 ITU-R BT.2020 [Y' C'b C'r] or
> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
> + *   colorimetry format
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>   *   DCI-P3 (SMPTE RP 431-2) colorimetry format
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -420,9 +421,9 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_SYCC_601,
>  	DRM_MODE_COLORIMETRY_OPYCC_601,
>  	DRM_MODE_COLORIMETRY_OPRGB,
> -	DRM_MODE_COLORIMETRY_BT2020_CYCC,
> -	DRM_MODE_COLORIMETRY_BT2020_RGB,
> -	DRM_MODE_COLORIMETRY_BT2020_YCC,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
> +	DRM_MODE_COLORIMETRY_BT2020,
>  	/* Additional Colorimetry extension added as part of CTA 861.G */
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
> -- 
> 2.39.1

-- 
Ville Syrjälä
Intel
