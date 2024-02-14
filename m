Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFF855233
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E065610E255;
	Wed, 14 Feb 2024 18:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQAS4Tcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D7D10E10B;
 Wed, 14 Feb 2024 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707935646; x=1739471646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EQ0xDwuo/RkXpGN9r1rKB4Vc6sneeedzoXvTR9OBMWg=;
 b=EQAS4Tcx2Dgqiu3m3hhFZ6I27jDM8duscUHPji/1QUfidNG6TwGEOC94
 3piOFKmEjH4aS5w5xzNNHdsjrIAjxKXsmhiIzmBDrvN1iQD+HVQxWqveM
 XSk2JiCcZquwfyYEs7WuVoYmk/rejfzIaPfCgiPLinGSYVb50iWiWjka3
 jN6+Qz5F8J3csVUKrky+5uyw0xhLX2eKnckaSAr7ud7pSsHEhGm0dskTx
 vA6sh97rpO6pl8B9xUEL8L+ayXnngrw6kBXNyYt/6Zcg9b4YpdqolEY4P
 kwQHyhISIxm44oAPvohuDqAShmaILSHDYCDXSqAmzec4c9ONLv8TsU/qD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1872573"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1872573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369704"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369704"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:34:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Feb 2024 20:34:01 +0200
Date: Wed, 14 Feb 2024 20:34:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 4/6] drm/i915/mst: use the MST mode detected previously
Message-ID: <Zc0HmRxIj4ePnh4I@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <4fb849117a31940a3fbc26287c09ee3928e91991.1707823736.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fb849117a31940a3fbc26287c09ee3928e91991.1707823736.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 13, 2024 at 01:30:59PM +0200, Jani Nikula wrote:
> Drop the duplicate read of DP_MSTM_CAP DPCD register, and the duplicate
> logic for choosing MST mode, and store the chosen mode in struct
> intel_dp. Rename intel_dp_configure_mst() to intel_dp_mst_configure()
> while at it.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 23 ++++++++-----------
>  2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 01eb6e4e6049..4a8440a3a812 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1780,6 +1780,7 @@ struct intel_dp {
>  
>  	bool is_mst;
>  	int active_mst_links;
> +	enum drm_dp_mst_mode mst_detect;
>  
>  	/* connector directly attached - won't be use for modeset in mst world */
>  	struct intel_connector *attached_connector;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 007cb2a04e38..72e91322e310 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4039,11 +4039,10 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
>  	enum drm_dp_mst_mode sink_mst_mode;
> -	enum drm_dp_mst_mode mst_detect;
>  
>  	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
>  
> -	mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
> +	intel_dp->mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
> @@ -4051,25 +4050,23 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
>  		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
>  		    intel_dp_mst_mode_str(sink_mst_mode),
>  		    str_yes_no(i915->display.params.enable_dp_mst),
> -		    intel_dp_mst_mode_str(mst_detect));
> +		    intel_dp_mst_mode_str(intel_dp->mst_detect));
>  
> -	return mst_detect != DRM_DP_SST;
> +	return intel_dp->mst_detect != DRM_DP_SST;
>  }
>  
>  static void
> -intel_dp_configure_mst(struct intel_dp *intel_dp)
> +intel_dp_mst_configure(struct intel_dp *intel_dp)
>  {
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
> -
>  	if (!intel_dp_mst_source_support(intel_dp))
>  		return;

I was wondering if we even need that, but it looks to be just a
check to see if we actually initialized the mst_mgt or not.
We should probably rename it or something... Or perhaps we could
tweak the topology manager a bit so we wouldn't need to check...

>  
> -	intel_dp->is_mst = sink_can_mst &&
> -		i915->display.params.enable_dp_mst;
> +	intel_dp->is_mst = intel_dp->mst_detect != DRM_DP_SST;
> +
> +	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
>  
> -	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> -					intel_dp->is_mst);
> +	/* Avoid stale info on the next detect cycle. */
> +	intel_dp->mst_detect = DRM_DP_SST;

Hmm. Not sure I like having ephemeral stuff like this in intel_dp,
but I guess the alternative would be plumb it up from detect_dpcd()
by hand, which might not be super pretty either. Oh well.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  }
>  
>  static bool
> @@ -5739,7 +5736,7 @@ intel_dp_detect(struct drm_connector *connector,
>  
>  	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
>  
> -	intel_dp_configure_mst(intel_dp);
> +	intel_dp_mst_configure(intel_dp);
>  
>  	/*
>  	 * TODO: Reset link params when switching to MST mode, until MST
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
