Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE35B6EA5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E1210E717;
	Tue, 13 Sep 2022 13:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EACD10E717
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663077304; x=1694613304;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=20mvJURIVaqbD4E2DGWdelUtuxyxiSm4rhlZrroSma0=;
 b=DlpVRIqfipWP+4DceqxT0EQ/qPDHPgAo8AMcEiPFOtJ7PozCGnfL+DgU
 2q0jycloJ7IzqY87rWw4m2P1pw8porjRRheLCGGCIu3uvVsI6guHxx4o8
 k2GXCbg8tSzCAV0KF2EVxJp5WjqTxeo1JckK5Tio+RVU8ce2uhxz961hj
 TLrksYMjwPzgADbmG7Rgh4X8MhMIm3/vSX6GxhA9prlv5Op3rF6jg3jUN
 8KmFSixb+0OOiL7W03FpqCF0bgiQhxUSJ0VInm93ATinG+e9m2EcoXnm9
 07RjjHirmuQizfpbqjD/ZYuAegrqU/HYkOXz3zCifAjlENDKuaIwEHyMP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="298144618"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="298144618"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 06:55:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="678576178"
Received: from baumeish-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 06:54:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/edid: Avoid multiple log lines for HFVSDB parsing
In-Reply-To: <20220811054718.2115917-5-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
 <20220811054718.2115917-5-ankit.k.nautiyal@intel.com>
Date: Tue, 13 Sep 2022 16:54:53 +0300
Message-ID: <87k0674bwy.fsf@intel.com>
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
> Replace multiple log lines with a single log line at the end of
> parsing HF-VSDB. Also use drm_dbg_kms instead of DRM_DBG_KMS, and
> add log for DSC1.2 support.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c9c3a9c8fa26..7a319d570297 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5781,6 +5781,9 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  	struct drm_display_info *display = &connector->display_info;
>  	struct drm_hdmi_info *hdmi = &display->hdmi;
>  	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
> +	u32 max_tmds_clock = 0;

This should be int because display->max_tmds_clock is int. Yes, it's a
change from the current local var, but logging u32 would require %u
instead of %d in the format string anyway, so better just use the right
type.

> +	u8 max_frl_rate = 0;
> +	bool dsc_support = false;
>  
>  	display->has_hdmi_infoframe = true;
>  
> @@ -5800,14 +5803,13 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  	 */
>  
>  	if (hf_scds[5]) {
> -		/* max clock is 5000 KHz times block value */
> -		u32 max_tmds_clock = hf_scds[5] * 5000;
>  		struct drm_scdc *scdc = &hdmi->scdc;
>  
> +		/* max clock is 5000 KHz times block value */
> +		max_tmds_clock = hf_scds[5] * 5000;
> +
>  		if (max_tmds_clock > 340000) {
>  			display->max_tmds_clock = max_tmds_clock;
> -			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
> -				display->max_tmds_clock);

Hmm, the logic for what is logged gets changed.

>  		}
>  
>  		if (scdc->supported) {
> @@ -5820,9 +5822,6 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  	}
>  
>  	if (hf_scds[7]) {
> -		u8 max_frl_rate;
> -
> -		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>  		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
>  		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>  				     &hdmi->max_frl_rate_per_lane);
> @@ -5830,8 +5829,14 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  
>  	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
>  
> -	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])
> +	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
>  		drm_parse_dsc_info(hdmi_dsc, hf_scds);
> +		dsc_support = true;
> +	}
> +
> +	drm_dbg_kms(connector->dev,
> +		    "HF-VSDB: max TMDS clock:%d Khz, HDMI2.1 support:%s, DSC1.2 support:%s\n",

Nitpicks, %d needs int instead of u32, "kHz" not "Khz", "HDMI 2.1" and
"DSC 1.2" with spaces, would prefer a space after ":".

> +		    max_tmds_clock, max_frl_rate ? "yes" : "no", dsc_support ? "yes" : "no");

See str_yes_no().

BR,
Jani.

>  }
>  
>  static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,

-- 
Jani Nikula, Intel Open Source Graphics Center
