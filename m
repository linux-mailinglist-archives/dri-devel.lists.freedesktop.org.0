Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F449B0C0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4386910F100;
	Tue, 25 Jan 2022 09:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49510F0FF;
 Tue, 25 Jan 2022 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643104373; x=1674640373;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y4cSrdusBXOcY/M0QlCwtkrc385TYGUyfX+EBLiaOx8=;
 b=GelVHQgopThF923FBqcRCxunwMdBf7nf1pjz0b7eNFNxVvlO6Mk8/lpy
 pJlSGlnGHytfWvOBwe0sttsZmliyJkC1DnRGhTaq4hEspkc4Y3Cfv6g2G
 5pdYmvpBIC8f3Yfa4ooG7SEkxiVcojt5WQRlW89YgqKA/rZRWUSV9uPgG
 k0HJ4+zasVFXObJFJpI9PmH7jvsLqzSiEznvozVofWPgvUR4vuUvw1i+4
 kOJ1VIhlOT+OWy/NW6UW1zYQxdYUupNe/OZPSshviR07quJUzmAwmm/Tx
 POn55q6X5nCzrOLzgATCsI6ciGIjrlX+fKY4l7SJxjm1fWoujwWftfgNA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270711943"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="270711943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:52:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="534659777"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:52:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/drm_edid: Add helper to get max FRL rate for an
 HDMI sink
In-Reply-To: <20220125085801.1025521-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
 <20220125085801.1025521-3-ankit.k.nautiyal@intel.com>
Date: Tue, 25 Jan 2022 11:52:35 +0200
Message-ID: <87czkg16sc.fsf@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Move the common function for getting the max FRL rate for an HDMI sink,
> from intel_dp.c to drm/drm_edid.

The subject prefix should be "drm/edid:"

But I'm not sure these functions belong in drm_edid.c though. If you see
a function prefixed drm_hdmi_, this is not where you'd expect to find
it. Not sure what the right place should be though.

Please split this to two patches, adding the helpers in drm and using
them in i915. It's generally easier to manage that way if there's no
other reason to keep the changes together.

>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c              | 38 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 19 ++++---------
>  include/drm/drm_edid.h                  |  2 ++
>  3 files changed, 45 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index eb61a1a92dc0..75b538b4c87f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6176,3 +6176,41 @@ void drm_update_tile_info(struct drm_connector *connector,
>  		connector->tile_group = NULL;
>  	}
>  }
> +
> +/**
> + * drm_hdmi_sink_max_frl - get the max frl rate from HDMI2.1 sink
> + * @connector - connector with HDMI2.1 sink

Do you need to first make sure it's a HDMI 2.1 sink? That's what the
documentation makes you believe.

> + *
> + * RETURNS:
> + * max frl rate supported by the HDMI2.1 sink, 0 if FRL not supported
> + */
> +int drm_hdmi_sink_max_frl(struct drm_connector *connector)
> +{
> +	int max_lanes = connector->display_info.hdmi.max_lanes;
> +	int rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
> +
> +	return max_lanes * rate_per_lane;
> +}
> +EXPORT_SYMBOL(drm_hdmi_sink_max_frl);
> +
> +/**
> + * drm_hdmi_sink_dsc_max_frl - get the max frl rate from HDMI2.1 sink
> + * with DSC1.2 compression.
> + * @connector - connector with HDMI2.1 sink

Ditto.

> + *
> + * RETURNS:
> + * max frl rate supported by the HDMI2.1 sink with DSC1.2, 0 if FRL not supported
> + */
> +int drm_hdmi_sink_dsc_max_frl(struct drm_connector *connector)
> +{
> +	int max_dsc_lanes, dsc_rate_per_lane;
> +
> +	if (!connector->display_info.hdmi.dsc_cap.v_1p2)
> +		return 0;
> +
> +	max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
> +	dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
> +
> +	return max_dsc_lanes * dsc_rate_per_lane;
> +}
> +EXPORT_SYMBOL(drm_hdmi_sink_dsc_max_frl);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4d4579a301f6..f7fe7de7e553 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2190,22 +2190,13 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
>  {
>  	struct intel_connector *intel_connector = intel_dp->attached_connector;
>  	struct drm_connector *connector = &intel_connector->base;
> -	int max_frl_rate;
> -	int max_lanes, rate_per_lane;
> -	int max_dsc_lanes, dsc_rate_per_lane;
> +	int max_frl = drm_hdmi_sink_max_frl(connector);
> +	int dsc_max_frl = drm_hdmi_sink_dsc_max_frl(connector);
>  
> -	max_lanes = connector->display_info.hdmi.max_lanes;
> -	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
> -	max_frl_rate = max_lanes * rate_per_lane;
> +	if (dsc_max_frl)
> +		return min(max_frl, dsc_max_frl);
>  
> -	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
> -		max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
> -		dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
> -		if (max_dsc_lanes && dsc_rate_per_lane)
> -			max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
> -	}
> -
> -	return max_frl_rate;
> +	return max_frl;
>  }
>  
>  static bool
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 18f6c700f6d0..5003e1254c44 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -592,6 +592,8 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  			      u8 video_code);
>  const u8 *drm_find_edid_extension(const struct edid *edid,
>  				  int ext_id, int *ext_index);
> +int drm_hdmi_sink_max_frl(struct drm_connector *connector);
> +int drm_hdmi_sink_dsc_max_frl(struct drm_connector *connector);
>  
>  
>  #endif /* __DRM_EDID_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
