Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B660E6032E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 20:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C8C10E932;
	Tue, 18 Oct 2022 18:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813CB10E931;
 Tue, 18 Oct 2022 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666119327; x=1697655327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XVxWHKTYmsupKtUcsjYarv06JNnvlIQ9eNR/iGviVxo=;
 b=DRauzhXahrY0dHWjWKKn/pFGfuJp6bhGEx3x2D+VZ+tVenRXXVBAypkC
 6XXqHDPE4U7o8P8unuyan1MOwUHN5jvXwAocU/Rdf1A/TuZZu7J8blGdU
 rici3NZ40aUTQwAfLlk7cqivJwfd4cQGcqGO/E9KdhU4p8gxTiUo5RJEB
 73IWNnCk5jGussJhEmA9LSB5QeifePwGdzjoO6UxfCNuEWESbknvMfSLa
 Rtm95ozoDDP98v4T2Z1wsf3iDrVJmKfvF5w96hguulyad802azKWiDOOa
 lPmZR3iI9p3SeAAFf1AQsrcuYGk4J2pzoBoPViGv89JYawWG33AF6kPKt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307312534"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="307312534"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 11:44:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="623755779"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="623755779"
Received: from yangli4-mobl2.amr.corp.intel.com (HELO mdnavare-mobl9)
 ([10.209.119.139])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 11:44:00 -0700
Date: Tue, 18 Oct 2022 11:43:55 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm/edid: Parse VRR cap fields from HFVSDB block
Message-ID: <Y07z64J/vSdZBfNI@mdnavare-mobl9>
References: <20221018053148.1798008-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018053148.1798008-1-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 11:01:48AM +0530, Ankit Nautiyal wrote:
> This patch parses HFVSDB fields for VRR capabilities of an
> HDMI2.1 sink and stores the VRR caps in a new structure in
> drm_hdmi_info.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Makes sense to add this VRR info to drm_hdmi_info struct and not combine
with DP VRR info struct in display info since hdmi info has other HDMI
cap info stored here.

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  drivers/gpu/drm/drm_edid.c  | 26 ++++++++++++++++++++++++--
>  include/drm/drm_connector.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 47465b9765f1..bb1f7d899580 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5823,6 +5823,21 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
>  	hdmi->y420_dc_modes = dc_mask;
>  }
>  
> +static void drm_parse_vrr_info(struct drm_hdmi_vrr_cap *hdmi_vrr,
> +			       const u8 *hf_scds)
> +{
> +	if (hf_scds[8] & DRM_EDID_CNMVRR)
> +		hdmi_vrr->cnm_vrr = true;
> +	if (hf_scds[8] & DRM_EDID_CINEMA_VRR)
> +		hdmi_vrr->cinema_vrr = true;
> +	if (hf_scds[8] & DRM_EDID_MDELTA)
> +		hdmi_vrr->m_delta = true;
> +
> +	hdmi_vrr->vrr_min = hf_scds[9] & DRM_EDID_VRR_MIN_MASK;
> +	hdmi_vrr->vrr_max = (hf_scds[9] & DRM_EDID_VRR_MAX_UPPER_MASK) << 2;
> +	hdmi_vrr->vrr_max |= hf_scds[10] & DRM_EDID_VRR_MAX_LOWER_MASK;
> +}
> +
>  static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
>  			       const u8 *hf_scds)
>  {
> @@ -5901,9 +5916,11 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  	struct drm_display_info *display = &connector->display_info;
>  	struct drm_hdmi_info *hdmi = &display->hdmi;
>  	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
> +	struct drm_hdmi_vrr_cap *hdmi_vrr = &hdmi->vrr_cap;
>  	int max_tmds_clock = 0;
>  	u8 max_frl_rate = 0;
>  	bool dsc_support = false;
> +	bool vrr_support = false;
>  
>  	display->has_hdmi_infoframe = true;
>  
> @@ -5949,14 +5966,19 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  
>  	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
>  
> +	if (cea_db_payload_len(hf_scds) >= 8 && hf_scds[8]) {
> +		drm_parse_vrr_info(hdmi_vrr, hf_scds);
> +		vrr_support = true;
> +	}
> +
>  	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
>  		drm_parse_dsc_info(hdmi_dsc, hf_scds);
>  		dsc_support = true;
>  	}
>  
>  	drm_dbg_kms(connector->dev,
> -		    "HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
> -		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
> +		    "HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, VRR support: %s, DSC 1.2 support: %s\n",
> +		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(vrr_support), str_yes_no(dsc_support));
>  }
>  
>  static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b1b2df48d42c..ec6ef71ab5cd 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -219,6 +219,30 @@ struct drm_hdmi_dsc_cap {
>  	u8 total_chunk_kbytes;
>  };
>  
> +
> +/**
> + * struct drm_hdmi_vrr_cap - VRR capabilities of HDMI sink
> + * Describes the VRR support provided by HDMI 2.1 sink.
> + * The information is fetched fom additional HFVSDB blocks defined
> + * for HDMI 2.1.
> + */
> +struct drm_hdmi_vrr_cap {
> +	/** @cnm_vrr: sink supports negative Mvrr values*/
> +	bool cnm_vrr;
> +
> +	/** @cinema_vrr: sink supports fractional and integer media rates < VRRmin*/
> +	bool cinema_vrr;
> +
> +	/** @m_delta: sink can anticipate and compensate for frame-to-frame variation in Mvrr */
> +	bool m_delta;
> +
> +	/** @vrr_min: VRRmin - lowest framerate in Hz that sink can support in VRR */
> +	u8 vrr_min;
> +
> +	/** @vrr_max: VRRmax - highest framerate in Hz that sink can support in VRR */
> +	u16 vrr_max;
> +};
> +
>  /**
>   * struct drm_hdmi_info - runtime information about the connected HDMI sink
>   *
> @@ -259,6 +283,9 @@ struct drm_hdmi_info {
>  
>  	/** @dsc_cap: DSC capabilities of the sink */
>  	struct drm_hdmi_dsc_cap dsc_cap;
> +
> +	/** @vrr_cap: VRR capabilities of the sink */
> +	struct drm_hdmi_vrr_cap vrr_cap;
>  };
>  
>  /**
> -- 
> 2.25.1
> 
