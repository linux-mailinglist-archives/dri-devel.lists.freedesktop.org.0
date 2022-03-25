Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC94E73BF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B04010E5A4;
	Fri, 25 Mar 2022 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D389810E561;
 Fri, 25 Mar 2022 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648212603; x=1679748603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QzqG8kdQCs2k5fwOtzvJPWENIb5QV5Gcx9G0bjJ7TQM=;
 b=cNNMFAFWcylSWPnSQeunbK1D9wtIsEawkikfV+XA2o+sGrSIvhPD6UXN
 6PXoBkOgklDAo1+Tc8Y1qeDPMzvvKU47/mkOe/7xoLCKA2bMf2v1SQ98W
 e+rP2rVFvQTUGgzd8GJjyZHhvBLm8LU4p/IYw0mnC4rtKo+bJme3V96n3
 kbOQea+I4gllWglAJoDiwP6nQWLoCHwL2FVAVqJBvvc6aOSvKhMB9tWnQ
 z3SUrg0SaL7QdnZbqC8eN/OTHkwMKDKsjhTc+0H+xj8OfD9PWVa7evwaK
 f32Qx/5huJDf/p8gujOEPmw5ANlAp+Uf2NB8BvBRlmuYHhEWRF+CZRFiz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258592628"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258592628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="602041263"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga008.fm.intel.com with SMTP; 25 Mar 2022 05:50:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Mar 2022 14:49:59 +0200
Date: Fri, 25 Mar 2022 14:49:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/9] drm/edid: pass a timing pointer to
 is_display_descriptor()
Message-ID: <Yj26d1dJz5yfjbKJ@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
 <7752b5a00e96b9b6719402487185211937c62c7d.1648210803.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7752b5a00e96b9b6719402487185211937c62c7d.1648210803.git.jani.nikula@intel.com>
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

On Fri, Mar 25, 2022 at 02:25:24PM +0200, Jani Nikula wrote:
> Use struct member access instead of direct offsets to avoid lots of
> casts all over the place.
> 
> Use BUILD_BUG_ON() for sanity check.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 1b552fe54f38..48707eef1dc2 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2331,10 +2331,14 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_mode_find_dmt);
>  
> -static bool is_display_descriptor(const u8 d[18], u8 tag)
> +static bool is_display_descriptor(const struct detailed_timing *timing, u8 type)
>  {
> -	return d[0] == 0x00 && d[1] == 0x00 &&
> -		d[2] == 0x00 && d[3] == tag;
> +	BUILD_BUG_ON(offsetof(typeof(*timing), pixel_clock) != 0);
> +	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.pad1) != 2);
> +	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.type) != 3);
> +
> +	return timing->pixel_clock == 0 && timing->data.other_data.pad1 == 0 &&

This would probably be less confusing if we moved pixel_clock into
pixel_data and just had matching padding bytes/etc. in other_data.

The names of all structs are also rather weird. We should probably
change them to match the spec terminology a bit more closely:
18 byte descriptor,detailed timing descriptor,display descriptor.
But that's a separate topic.

> +		timing->data.other_data.type == type;
>  }
>  
>  static bool is_detailed_timing_descriptor(const u8 d[18])
> @@ -2405,7 +2409,7 @@ is_rb(struct detailed_timing *t, void *data)
>  {
>  	u8 *r = (u8 *)t;
>  
> -	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	if (r[15] & 0x10)
> @@ -2431,7 +2435,7 @@ find_gtf2(struct detailed_timing *t, void *data)
>  {
>  	u8 *r = (u8 *)t;
>  
> -	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	if (r[10] == 0x02)
> @@ -2987,7 +2991,7 @@ do_inferred_modes(struct detailed_timing *timing, void *c)
>  	struct detailed_non_pixel *data = &timing->data.other_data;
>  	struct detailed_data_monitor_range *range = &data->data.range;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
>  	closure->modes += drm_dmt_modes_for_range(closure->connector,
> @@ -3067,7 +3071,7 @@ do_established_modes(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure = c;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_EST_TIMINGS))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_EST_TIMINGS))
>  		return;
>  
>  	closure->modes += drm_est3_modes(closure->connector, timing);
> @@ -3122,7 +3126,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
>  	struct edid *edid = closure->edid;
>  	int i;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_STD_MODES))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
>  		return;
>  
>  	for (i = 0; i < 6; i++) {
> @@ -3231,7 +3235,7 @@ do_cvt_mode(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure = c;
>  
> -	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_CVT_3BYTE))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_CVT_3BYTE))
>  		return;
>  
>  	closure->modes += drm_cvt_modes(closure->connector, timing);
> @@ -4491,7 +4495,7 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
>  static void
>  monitor_name(struct detailed_timing *t, void *data)
>  {
> -	if (!is_display_descriptor((const u8 *)t, EDID_DETAIL_MONITOR_NAME))
> +	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_NAME))
>  		return;
>  
>  	*(u8 **)data = t->data.other_data.data.str.str;
> @@ -5226,7 +5230,7 @@ void get_monitor_range(struct detailed_timing *timing,
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
