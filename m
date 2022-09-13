Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD65B6EA9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F6610E71B;
	Tue, 13 Sep 2022 13:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC34A10E71B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663077330; x=1694613330;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ixz93xpSCs7vuWvPKIhLQyzF+2ouyWk5uHRWq1KOcfE=;
 b=ezy55t9fhT8rL3SZZqmM5oQipe+F+14Ldhye0sXl+fIq8j2WslV+4o1k
 3IjtTDHpqd5BqcP0Lum6btuhHFzWTFYkkkAVFkoEsWhM3oEJYPYA5LUFY
 Z33nHWstWOeEM9uhf9yOaN3270Ft66yymjntptrKj7zuGm0qOV0uty6l0
 Y6SkTjr2ZOdNoDJK98+S3XECmLPxxfTAAuJkMNp4MkWDOCLXr6lVTQcds
 mw792N2yPGgMmtDej/jMBBrYuZ/Ep/G4pLLV8jrGjdcVc7hyq2EqXKXsa
 htTbBPseKWITgozOcSGNbo/cPr7SB1BR3DPqqbrygU40az1ZXFejrb3PW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="278532512"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="278532512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 06:55:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="646937896"
Received: from baumeish-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.168])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 06:55:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/edid: Split DSC parsing into separate function
In-Reply-To: <20220811054718.2115917-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
 <20220811054718.2115917-3-ankit.k.nautiyal@intel.com>
Date: Tue, 13 Sep 2022 16:55:23 +0300
Message-ID: <87h71b4bw4.fsf@intel.com>
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
Cc: uma.shankar@intel.com, maarten.lankhorst@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Aug 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Move the DSC parsing logic into separate function.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 128 ++++++++++++++++++++-----------------
>  1 file changed, 69 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index cdf10279e1bd..ffff1d08b3a4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5703,6 +5703,73 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
>  	hdmi->y420_dc_modes = dc_mask;
>  }
>  
> +static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
> +			       const u8 *hf_scds)
> +{
> +	u8 dsc_max_slices;
> +	u8 dsc_max_frl_rate;
> +
> +	hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
> +
> +	if (!hdmi_dsc->v_1p2)
> +		return;
> +
> +	hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
> +	hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
> +
> +	if (hf_scds[11] & DRM_EDID_DSC_16BPC)
> +		hdmi_dsc->bpc_supported = 16;
> +	else if (hf_scds[11] & DRM_EDID_DSC_12BPC)
> +		hdmi_dsc->bpc_supported = 12;
> +	else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
> +		hdmi_dsc->bpc_supported = 10;
> +	else
> +		/* Supports min 8 BPC if DSC1.2 is supported*/
> +		hdmi_dsc->bpc_supported = 8;
> +
> +	dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
> +	drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
> +			     &hdmi_dsc->max_frl_rate_per_lane);
> +	hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
> +
> +	dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
> +
> +	switch (dsc_max_slices) {
> +	case 1:
> +		hdmi_dsc->max_slices = 1;
> +		hdmi_dsc->clk_per_slice = 340;
> +		break;
> +	case 2:
> +		hdmi_dsc->max_slices = 2;
> +		hdmi_dsc->clk_per_slice = 340;
> +		break;
> +	case 3:
> +		hdmi_dsc->max_slices = 4;
> +		hdmi_dsc->clk_per_slice = 340;
> +		break;
> +	case 4:
> +		hdmi_dsc->max_slices = 8;
> +		hdmi_dsc->clk_per_slice = 340;
> +		break;
> +	case 5:
> +		hdmi_dsc->max_slices = 8;
> +		hdmi_dsc->clk_per_slice = 400;
> +		break;
> +	case 6:
> +		hdmi_dsc->max_slices = 12;
> +		hdmi_dsc->clk_per_slice = 400;
> +		break;
> +	case 7:
> +		hdmi_dsc->max_slices = 16;
> +		hdmi_dsc->clk_per_slice = 400;
> +		break;
> +	case 0:
> +	default:
> +		hdmi_dsc->max_slices = 0;
> +		hdmi_dsc->clk_per_slice = 0;
> +	}
> +}
> +
>  /* Sink Capability Data Structure */
>  static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  				      const u8 *hf_scds)
> @@ -5749,71 +5816,14 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  
>  	if (hf_scds[7]) {
>  		u8 max_frl_rate;
> -		u8 dsc_max_frl_rate;
> -		u8 dsc_max_slices;
>  		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
>  
>  		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>  		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
>  		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>  				     &hdmi->max_frl_rate_per_lane);
> -		hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
> -
> -		if (hdmi_dsc->v_1p2) {
> -			hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
> -			hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
> -
> -			if (hf_scds[11] & DRM_EDID_DSC_16BPC)
> -				hdmi_dsc->bpc_supported = 16;
> -			else if (hf_scds[11] & DRM_EDID_DSC_12BPC)
> -				hdmi_dsc->bpc_supported = 12;
> -			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
> -				hdmi_dsc->bpc_supported = 10;
> -			else
> -				/* Supports min 8 BPC if DSC1.2 is supported*/
> -				hdmi_dsc->bpc_supported = 8;
> -
> -			dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
> -			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
> -					     &hdmi_dsc->max_frl_rate_per_lane);
> -			hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
> -
> -			dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
> -			switch (dsc_max_slices) {
> -			case 1:
> -				hdmi_dsc->max_slices = 1;
> -				hdmi_dsc->clk_per_slice = 340;
> -				break;
> -			case 2:
> -				hdmi_dsc->max_slices = 2;
> -				hdmi_dsc->clk_per_slice = 340;
> -				break;
> -			case 3:
> -				hdmi_dsc->max_slices = 4;
> -				hdmi_dsc->clk_per_slice = 340;
> -				break;
> -			case 4:
> -				hdmi_dsc->max_slices = 8;
> -				hdmi_dsc->clk_per_slice = 340;
> -				break;
> -			case 5:
> -				hdmi_dsc->max_slices = 8;
> -				hdmi_dsc->clk_per_slice = 400;
> -				break;
> -			case 6:
> -				hdmi_dsc->max_slices = 12;
> -				hdmi_dsc->clk_per_slice = 400;
> -				break;
> -			case 7:
> -				hdmi_dsc->max_slices = 16;
> -				hdmi_dsc->clk_per_slice = 400;
> -				break;
> -			case 0:
> -			default:
> -				hdmi_dsc->max_slices = 0;
> -				hdmi_dsc->clk_per_slice = 0;
> -			}
> -		}
> +
> +		drm_parse_dsc_info(hdmi_dsc, hf_scds);
>  	}
>  
>  	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);

-- 
Jani Nikula, Intel Open Source Graphics Center
