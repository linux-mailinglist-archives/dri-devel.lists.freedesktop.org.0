Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A04E9D82
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E911910E07B;
	Mon, 28 Mar 2022 17:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E59C10E07B;
 Mon, 28 Mar 2022 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488503; x=1680024503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=57nj9ygVgJRSLNHpAL27e7BBQWT/TQR1x+r/hD1p8dU=;
 b=kNTcxVrZdtiCceENaBsXb6tdP65ok054quPxiNtOmSErhkW3tHb0UWqT
 J2Vop975Lt3FTfy5+FQb5nTXU2zhk7zUiuUYc9H6JCaZdAcDqk/neVHUL
 O4NJTU7KLzueOeLk7A2ZczbFgM6ak72D+CFc5NYL7EGsmdkWZd0ftaUb5
 vffpBjp+z/gJ3pd6FQv+Ob/mB/P1XpNbNCh9q0ehvolrTnpW1DYgoiGzs
 tHffxgoXqMJ+oPWmWQJUK/9WRPEx+la8B7n+SmiOm4WQCYt9Rt7CyStD4
 Ed8vfiAQY42+/x8eRov165pLolaJ+DUfLmh1sQgkGW5RZhAkZ1kz7vYDv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="257889886"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="257889886"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="546043286"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga007.jf.intel.com with SMTP; 28 Mar 2022 10:28:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:28:19 +0300
Date: Mon, 28 Mar 2022 20:28:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 03/12] drm/edid: pass a timing pointer to
 is_display_descriptor()
Message-ID: <YkHwM/4Fuvrx/S5b@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <ccc54b45ea628874c0290dd64114da6cefff1819.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccc54b45ea628874c0290dd64114da6cefff1819.1648477901.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 05:34:24PM +0300, Jani Nikula wrote:
> Use struct member access instead of direct offsets to avoid lots of
> casts all over the place.
> 
> Use BUILD_BUG_ON() for sanity check.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13d05062d68c..ded1f019180d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2331,10 +2331,15 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_mode_find_dmt);
>  
> -static bool is_display_descriptor(const u8 d[18], u8 tag)
> +static bool is_display_descriptor(const struct detailed_timing *descriptor, u8 type)
>  {
> -	return d[0] == 0x00 && d[1] == 0x00 &&
> -		d[2] == 0x00 && d[3] == tag;
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), pixel_clock) != 0);
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.pad1) != 2);
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.type) != 3);
> +
> +	return descriptor->pixel_clock == 0 &&
> +		descriptor->data.other_data.pad1 == 0 &&
> +		descriptor->data.other_data.type == type;
>  }
>  
>  static bool is_detailed_timing_descriptor(const u8 d[18])
> @@ -2405,7 +2410,7 @@ is_rb(struct detailed_timing *t, void *data)
>  {
>  	u8 *r = (u8 *)t;
>  
> -	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
> @@ -2431,7 +2436,7 @@ find_gtf2(struct detailed_timing *t, void *data)
>  {
>  	u8 *r = (u8 *)t;
>  
> -	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	if (r[10] == 0x02)
> @@ -2987,7 +2992,7 @@ do_inferred_modes(struct detailed_timing *timing, void *c)
>  	struct detailed_non_pixel *data = &timing->data.other_data;
>  	struct detailed_data_monitor_range *range = &data->data.range;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	closure->modes += drm_dmt_modes_for_range(closure->connector,
> @@ -3067,7 +3072,7 @@ do_established_modes(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure = c;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_EST_TIMINGS))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_EST_TIMINGS))
>  		return;
>  
>  	closure->modes += drm_est3_modes(closure->connector, timing);
> @@ -3122,7 +3127,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
>  	struct edid *edid = closure->edid;
>  	int i;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_STD_MODES))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
>  		return;
>  
>  	for (i = 0; i < 6; i++) {
> @@ -3231,7 +3236,7 @@ do_cvt_mode(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure = c;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_CVT_3BYTE))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_CVT_3BYTE))
>  		return;
>  
>  	closure->modes += drm_cvt_modes(closure->connector, timing);
> @@ -4491,7 +4496,7 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
>  static void
>  monitor_name(struct detailed_timing *t, void *data)
>  {
> -	if (!is_display_descriptor((const u8 *)t, EDID_DETAIL_MONITOR_NAME))
> +	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_NAME))
>  		return;
>  
>  	*(u8 **)data = t->data.other_data.data.str.str;
> @@ -5226,7 +5231,7 @@ void get_monitor_range(struct detailed_timing *timing,
>  	const struct detailed_non_pixel *data = &timing->data.other_data;
>  	const struct detailed_data_monitor_range *range = &data->data.range;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	/*
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
