Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17148551D1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6610E0F9;
	Wed, 14 Feb 2024 18:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehKJYqj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEFD10E067;
 Wed, 14 Feb 2024 18:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707934457; x=1739470457;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dfRaGgauKr6Kr2BWlSjiTp5MBMRjYK7ZQT/d9RzQe1o=;
 b=ehKJYqj0a5DAc3wlSQaE/kG1fyGNYyykn7UQkkIQwVWzM6/mOz1QjQIl
 m+hqt87iBcHepG4l/K3eTfl1AVW7BUjmYRKwLz2Pjgb5z1DSZME/EYe1H
 OhayJGixk3yUE/Xgh6Y++4jLFP5Qc7dtBxtbOnfc/9NTz3IdrXENLfOmD
 KHlT6Gh8KxI5E3UceErrM5U6c+zviNoewJEwxqrrshfIc1VF249mW/7kF
 7CdjgOkt3vQtEiqQnwUWWnUyNC3n+IstDisGWPgEpGbEgRzPL026JSZog
 kjqn7GP2vOArpGITCKzH27P+vD/YA1wc1i2HV/xQ+DxUun5piYOcUISva Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5813087"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="5813087"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369682"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369682"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:14:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Feb 2024 20:14:11 +0200
Date: Wed, 14 Feb 2024 20:14:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 1/6] drm/mst: read sideband messaging cap
Message-ID: <Zc0C80tdnEXPgpLX@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <507901114b7e4f0e4149747c8052747a22fe8ead.1707823736.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <507901114b7e4f0e4149747c8052747a22fe8ead.1707823736.git.jani.nikula@intel.com>
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

On Tue, Feb 13, 2024 at 01:30:56PM +0200, Jani Nikula wrote:
> Amend drm_dp_read_mst_cap() to return an enum, indicating "SST", "SST
> with sideband messaging", or "MST". Modify all call sites to take the
> new return value into account.
> 
> v2:
> - Rename enumerators (Ville)
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
>  include/drm/display/drm_dp_mst_helper.h       | 23 ++++++++++++++++++-
>  4 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 03d528209426..c193be3577f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3608,24 +3608,30 @@ fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
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
> +		return DRM_DP_SST;
>  
>  	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
> -		return false;
> +		return DRM_DP_SST;
> +
> +	if (mstm_cap & DP_MST_CAP)
> +		return DRM_DP_MST;
> +
> +	if (mstm_cap & DP_SINGLE_STREAM_SIDEBAND_MSG)
> +		return DRM_DP_SST_SIDEBAND_MSG;
>  
> -	return mstm_cap & DP_MST_CAP;
> +	return DRM_DP_SST;
>  }
>  EXPORT_SYMBOL(drm_dp_read_mst_cap);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 5045c34a16be..a1c304f451bd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4014,7 +4014,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
>  
>  	return i915->display.params.enable_dp_mst &&
>  		intel_dp_mst_source_support(intel_dp) &&
> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
> +		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
>  }
>  
>  static void
> @@ -4023,7 +4023,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_encoder *encoder =
>  		&dp_to_dig_port(intel_dp)->base;
> -	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
> +	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index 7de7707ec6a8..fb06ee17d9e5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -181,7 +181,7 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>  	if (nouveau_mst) {
>  		mstm = outp->dp.mstm;
>  		if (mstm)
> -			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd);
> +			mstm->can_mst = drm_dp_read_mst_cap(aux, dpcd) == DRM_DP_MST;
>  	}
>  
>  	if (nouveau_dp_has_sink_count(connector, outp)) {
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 9b19d8bd520a..3c9e128c444a 100644
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
> +	 * @DRM_DP_SST: The sink does not support MST nor single stream sideband
> +	 * messaging.
> +	 */
> +	DRM_DP_SST,
> +	/**
> +	 * @DRM_DP_MST: Sink supports MST, more than one stream and single
> +	 * stream sideband messaging.
> +	 */
> +	DRM_DP_MST,
> +	/**
> +	 * @DRM_DP_SST_SIDEBAND_MSG: Sink supports only one stream and single
> +	 * stream sideband messaging.
> +	 */
> +	DRM_DP_SST_SIDEBAND_MSG,
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
