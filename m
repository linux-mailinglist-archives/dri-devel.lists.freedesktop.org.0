Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513D84739F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EBD10F08A;
	Fri,  2 Feb 2024 15:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkkAcFBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 15:46:29 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5E110F08A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706888789; x=1738424789;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a6X3r+4XgQNaw9+YCalBkz237jZyhW2vqzaq6a5Tjg8=;
 b=lkkAcFBE9xwAUYDXT+lXDL0qkPpjNFiHUzmbZ8VEZTdIhbpHIZdB8/MO
 NH7QdAdiJf9hZmV/mf3zFJH3oydFCpWafgcDwpaE+RZTzeI6jARrffJq4
 gJptPmeGhFkVujk49KlgUQL56pTU+6Rd0rpyKDw66JDsEej3RbrolNuRK
 phHVLWqbQAnfXzArwNEzTfdA8IrXmAhj0rZtLtJbHdJz5pRh2IohB5kZe
 LDAsgm1Gykvfdtze78RTMa4rjdKgU1PNJ8l/ZHBcwI+8uoR0tph7TJdNm
 SAQDokfCIq3jfKxMaKF8ZAQXGKEsf4GRxL4Osl7ElZTlBISCV1pMcxZn7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="357414"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="357414"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823241199"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823241199"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 07:46:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Feb 2024 17:46:25 +0200
Date: Fri, 2 Feb 2024 17:46:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 1/4] drm/mst: read sideband messaging cap
Message-ID: <Zb0OUd5NPMxOwaIb@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
 <6c846638f986eed60395ce0fa8f41e21a61ce045.1706882590.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c846638f986eed60395ce0fa8f41e21a61ce045.1706882590.git.jani.nikula@intel.com>
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

On Fri, Feb 02, 2024 at 04:05:31PM +0200, Jani Nikula wrote:
> Amend drm_dp_read_mst_cap() to return an enum, indicating "none",
> "sideband messaging", or "mst". Modify all call sites to take the new
> return value into account.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
>  include/drm/display/drm_dp_mst_helper.h       | 23 ++++++++++++++++++-
>  4 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index f7c6b60629c2..a68a6c8a2495 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3603,24 +3603,30 @@ fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
>  EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
>  
>  /**
> - * drm_dp_read_mst_cap() - check whether or not a sink supports MST
> + * drm_dp_read_mst_cap() - Read the sink's MST mode capability
>   * @aux: The DP AUX channel to use
>   * @dpcd: A cached copy of the DPCD capabilities for this sink
>   *
> - * Returns: %True if the sink supports MST, %false otherwise
> + * Returns: enum drm_dp_mst_mode to indicate MST mode capability
>   */
> -bool drm_dp_read_mst_cap(struct drm_dp_aux *aux,
> -			 const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
> +					 const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	u8 mstm_cap;
>  
>  	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
> -		return false;
> +		return DP_MST_NONE;
>  
>  	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
> -		return false;
> +		return DP_MST_NONE;
> +
> +	if (mstm_cap & DP_MST_CAP)
> +		return DP_MST_CAPABLE;
> +
> +	if (mstm_cap & DP_SINGLE_STREAM_SIDEBAND_MSG)
> +		return DP_MST_SIDEBAND_MSG;
>  
> -	return mstm_cap & DP_MST_CAP;
> +	return DP_MST_NONE;
>  }
>  EXPORT_SYMBOL(drm_dp_read_mst_cap);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ab415f41924d..7af09f2c008d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4011,7 +4011,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
>  
>  	return i915->display.params.enable_dp_mst &&
>  		intel_dp_mst_source_support(intel_dp) &&
> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
> +		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
>  }
>  
>  static void
> @@ -4020,7 +4020,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_encoder *encoder =
>  		&dp_to_dig_port(intel_dp)->base;
> -	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
> +	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index 7de7707ec6a8..d180d22dbab0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -181,7 +181,7 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>  	if (nouveau_mst) {
>  		mstm = outp->dp.mstm;
>  		if (mstm)
> -			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd);
> +			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd) == DP_MST_CAPABLE;
>  	}
>  
>  	if (nouveau_dp_has_sink_count(connector, outp)) {
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 9b19d8bd520a..db48016b2aed 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -818,7 +818,28 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  
>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
>  
> -bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +/**
> + * enum drm_dp_mst_mode - sink's MST mode capability
> + */
> +enum drm_dp_mst_mode {
> +	/**
> +	 * @DP_MST_NONE: The sink does not support MST nor single stream
> +	 * sideband messaging.
> +	 */
> +	DP_MST_NONE,
> +	/**
> +	 * @DP_MST_CAPABLE: Sink supports MST, more than one stream and single
> +	 * stream sideband messaging.
> +	 */
> +	DP_MST_CAPABLE,
> +	/**
> +	 * @DP_MST_SIDEBAND_MSG: Sink supports only one stream and single stream
> +	 * sideband messaging.
> +	 */
> +	DP_MST_SIDEBAND_MSG,

Maybe these should have DRM_DP_ namespace or something so we don't
confuse them with the DP spec derived stuff?

Also wondering if these should rather be named like so:
- SST
- MST
- SST_SIDEBAND_MSG

> +};
> +
> +enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state);
>  
>  int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
