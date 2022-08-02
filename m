Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE4587E5F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 16:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41A811B5D2;
	Tue,  2 Aug 2022 14:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98A112B6E;
 Tue,  2 Aug 2022 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659451792; x=1690987792;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FUs6aGbQb1z3AVJQUMBkO/UO2XcVyeQY4oqI0LlmN4I=;
 b=NFxAyztzOwPL4Tl8c2pRQn7ClNLM2XVIphGlFXhBcpLfMjU1KIuckCWV
 XzHim/JoLWoCcwugWSmY0PIvnzxVvgw8EtQytbswz5x+qVVs7tqVDUkzt
 m28Moa6ttee7wdyIMoEYVPobF4oojGKpXrvK0o5YbTnw5XJDTfdhn5bkP
 e3Aj64F99MMpFB/+2/o59E2meQt6IkenT4DdF5hU+I/cDzsEJJq19NtlC
 /3o/ljX6z06Q50nLM6UrTf3vYxZ4aRUL0WoyGVLcs/aVDqxunMP0ugE1g
 DIUZ+D9gHj7H3WgQq0iZQ6DZSNkez5N606WZv/x5ZC6gFftLHUclpYoqF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="289437317"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="289437317"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:49:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="661654336"
Received: from llaviniu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:49:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/drm_edid: Refactor HFVSDB parsing for DSC1.2
In-Reply-To: <20220722054647.3511645-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220722054647.3511645-1-ankit.k.nautiyal@intel.com>
Date: Tue, 02 Aug 2022 17:49:47 +0300
Message-ID: <87tu6uem44.fsf@intel.com>
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
Cc: uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> DSC capabilities are given in bytes 11-13 of VSDB (i.e. bytes 8-10 of
> SCDS). Since minimum length of Data block is 7, all bytes greater than 7
> must be read only after checking the length of the data block.
>
> This patch adds check for data block length before reading relavant DSC
> bytes. It also corrects min DSC BPC to 8, and minor refactoring for
> better readability, and proper log messages.

I think this patch tries to do too much at once. Please split it up. One
thing per patch.

I think the logging is excessive, and what logging remains should use
drm_dbg_kms() instead of DRM_DEBUG_KMS().

Further comments inline.

>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 124 +++++++++++++++++++++++--------------
>  1 file changed, 77 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bbc25e3b7220..f683a8d5fd31 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5703,12 +5703,58 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
>  	hdmi->y420_dc_modes = dc_mask;
>  }
>  
> +static void drm_parse_dsc_slice_info(u8 dsc_max_slices,
> +				     struct drm_hdmi_dsc_cap *hdmi_dsc)

Arguments should always be in the order: context, destination, source.

> +{
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
>  {
>  	struct drm_display_info *display = &connector->display_info;
>  	struct drm_hdmi_info *hdmi = &display->hdmi;
> +	u8 db_length = hf_scds[0] & 0x1F;

There's cea_db_payload_len() for this, and you can use that directly
instead of caching the value to a local variable.

> +	u8 dsc_max_frl_rate;
> +	u8 dsc_max_slices;

These two are local to a tiny if block and should be declared there.

> +	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
> +
> +	if (db_length < 7 || db_length > 31)
> +		return;

Both cea_db_is_hdmi_forum_vsdb() and cea_db_is_hdmi_forum_scdb() check
the payload is >= 7 bytes before this one even gets called.

There's no reason to not parse the first 31 bytes if the length is > 31
bytes. That condition just breaks future compatibility for no reason.

>  
>  	display->has_hdmi_infoframe = true;
>  
> @@ -5749,17 +5795,25 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  
>  	if (hf_scds[7]) {
>  		u8 max_frl_rate;
> -		u8 dsc_max_frl_rate;
> -		u8 dsc_max_slices;
> -		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
>  
> -		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>  		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
> +		if (max_frl_rate)
> +			DRM_DEBUG_KMS("HDMI2.1 FRL support detected\n");
> +
>  		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>  				     &hdmi->max_frl_rate_per_lane);
> +
> +		drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
> +	}
> +
> +	if (db_length < 11)
> +		return;
> +
> +	if (hf_scds[11]) {

Matter of taste, but I'd probably make these

	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])

and drop the early returns, and add a single (or very few) debug logging
call at the end.

>  		hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
>  
>  		if (hdmi_dsc->v_1p2) {
> +			DRM_DEBUG_KMS("HDMI DSC1.2 support detected\n");
>  			hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
>  			hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
>  
> @@ -5770,52 +5824,28 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
>  				hdmi_dsc->bpc_supported = 10;
>  			else
> -				hdmi_dsc->bpc_supported = 0;
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

Splitting this to a separate function should be a non-functional prep
patch.

BR,
Jani.

> +				/* Supports min 8 BPC if DSC1.2 is supported*/
> +				hdmi_dsc->bpc_supported = 8;
>  		}
>  	}
>  
> -	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
> +	if (db_length < 12)
> +		return;
> +
> +	if (hdmi_dsc->v_1p2 && hf_scds[12]) {
> +		dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
> +		drm_parse_dsc_slice_info(dsc_max_slices, hdmi_dsc);
> +
> +		dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
> +		drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
> +				     &hdmi_dsc->max_frl_rate_per_lane);
> +	}
> +
> +	if (db_length < 13)
> +		return;
> +
> +	if (hdmi_dsc->v_1p2 && hf_scds[13])
> +		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
>  }
>  
>  static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,

-- 
Jani Nikula, Intel Open Source Graphics Center
