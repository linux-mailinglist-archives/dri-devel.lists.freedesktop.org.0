Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166D497AEA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 10:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA7310ED97;
	Mon, 24 Jan 2022 09:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837B110ED97
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643014919; x=1674550919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ENqEQPaOcYZB2g0fErLLyV8AeSY3LL/J8OOabgIXNdQ=;
 b=Xzn3qipXuCGslcAoHNqspKHuQMN83E80oactCKJwNAFBTr4fknxgLE6M
 OW8u81IRh0aaDY7TsAXoWwuUt8VZanp0CbW1EV7yVYsjg9UxNbLfiq4Kh
 I32/JjzP5X8zSeEOCnqSPn4Gbmi43Zh1R24VlhZLDzZpTX4DKGsBokrHM
 9E+PqFiXjwWAhKCvTbd8uGrzFLSGBcifNdH1J10YxwZjqqpmooBKfylzd
 ws4S/WBjpgzkOEkOsGDFXP3x5lYN1D285K9DM3nHAe2Ih+awDTkULEGZv
 PxZEfbhx6HoAzyXx/ig5/Ln3ynUZFoJ1h6DMEsjkzcgFyq15sZnDhx0S6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270435260"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="270435260"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 01:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519868186"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga007.jf.intel.com with SMTP; 24 Jan 2022 01:01:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Jan 2022 11:01:53 +0200
Date: Mon, 24 Jan 2022 11:01:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 03/16] drm/edid: Split deep color modes between RGB
 and YUV444
Message-ID: <Ye5rAfiJ5Pvk12BR@intel.com>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120151625.594595-4-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 04:16:12PM +0100, Maxime Ripard wrote:
> The current code assumes that the RGB444 and YUV444 formats are the
> same, but the HDMI 2.0 specification states that:
> 
>    The three DC_XXbit bits above only indicate support for RGB 4:4:4 at
>    that pixel size. Support for YCBCR 4:4:4 in Deep Color modes is
>    indicated with the DC_Y444 bit. If DC_Y444 is set, then YCBCR 4:4:4
>    is supported for all modes indicated by the DC_XXbit flags.
> 
> So if we have YUV444 support and any DC_XXbit flag set but the DC_Y444
> flag isn't, we'll assume that we support that deep colour mode for
> YUV444 which breaks the specification.
> 
> In order to fix this, let's split the edid_hdmi_dc_modes field in struct
> drm_display_info into two fields, one for RGB444 and one for YUV444.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Though we seem to be missing clearing of *dc_modes in
drm_reset_display_info()...

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  2 +-
>  drivers/gpu/drm/drm_edid.c                     |  7 ++++---
>  drivers/gpu/drm/i915/display/intel_hdmi.c      |  4 ++--
>  drivers/gpu/drm/radeon/radeon_connectors.c     |  2 +-
>  include/drm/drm_connector.h                    | 12 +++++++++---
>  5 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index c16a2704ced6..f3160b951df3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -175,7 +175,7 @@ int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector)
>  
>  			/* Check if bpc is within clock limit. Try to degrade gracefully otherwise */
>  			if ((bpc == 12) && (mode_clock * 3/2 > max_tmds_clock)) {
> -				if ((connector->display_info.edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_30) &&
> +				if ((connector->display_info.edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30) &&
>  				    (mode_clock * 5/4 <= max_tmds_clock))
>  					bpc = 10;
>  				else
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5085ef08c22d..471b577dca79 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5075,21 +5075,21 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
>  		dc_bpc = 10;
> -		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_30;
> +		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
>  		DRM_DEBUG("%s: HDMI sink does deep color 30.\n",
>  			  connector->name);
>  	}
>  
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
>  		dc_bpc = 12;
> -		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_36;
> +		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
>  		DRM_DEBUG("%s: HDMI sink does deep color 36.\n",
>  			  connector->name);
>  	}
>  
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
>  		dc_bpc = 16;
> -		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_48;
> +		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
>  		DRM_DEBUG("%s: HDMI sink does deep color 48.\n",
>  			  connector->name);
>  	}
> @@ -5106,6 +5106,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  
>  	/* YCRCB444 is optional according to spec. */
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
> +		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
>  		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
>  			  connector->name);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 96e508ddc4af..52f6dc248453 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1912,7 +1912,7 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *connector,
>  		if (ycbcr420_output)
>  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
>  		else
> -			return info->edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_36;
> +			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
>  	case 10:
>  		if (!has_hdmi_sink)
>  			return false;
> @@ -1920,7 +1920,7 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *connector,
>  		if (ycbcr420_output)
>  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
>  		else
> -			return info->edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_30;
> +			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
>  	case 8:
>  		return true;
>  	default:
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 607ad5620bd9..1546abcadacf 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -204,7 +204,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
>  
>  			/* Check if bpc is within clock limit. Try to degrade gracefully otherwise */
>  			if ((bpc == 12) && (mode_clock * 3/2 > max_tmds_clock)) {
> -				if ((connector->display_info.edid_hdmi_dc_modes & DRM_EDID_HDMI_DC_30) &&
> +				if ((connector->display_info.edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30) &&
>  					(mode_clock * 5/4 <= max_tmds_clock))
>  					bpc = 10;
>  				else
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b501d0badaea..eaf0ef5f1843 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -592,10 +592,16 @@ struct drm_display_info {
>  	bool rgb_quant_range_selectable;
>  
>  	/**
> -	 * @edid_hdmi_dc_modes: Mask of supported hdmi deep color modes. Even
> -	 * more stuff redundant with @bus_formats.
> +	 * @edid_hdmi_dc_rgb444_modes: Mask of supported hdmi deep color modes
> +	 * in RGB 4:4:4. Even more stuff redundant with @bus_formats.
>  	 */
> -	u8 edid_hdmi_dc_modes;
> +	u8 edid_hdmi_rgb444_dc_modes;
> +
> +	/**
> +	 * @edid_hdmi_dc_ycbcr444_modes: Mask of supported hdmi deep color
> +	 * modes in YCbCr 4:4:4. Even more stuff redundant with @bus_formats.
> +	 */
> +	u8 edid_hdmi_ycbcr444_dc_modes;
>  
>  	/**
>  	 * @cea_rev: CEA revision of the HDMI sink.
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
