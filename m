Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959828473B0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C9310F070;
	Fri,  2 Feb 2024 15:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/K8ngeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B3E10F070
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706889074; x=1738425074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eWNOQA7mfYQmwIzowP6/gBXGktVGpJPq7cEjV0GP57E=;
 b=h/K8ngeYi9108hWJytHPz0mVfzSwJgNZ3pJtPjzqWaCaNt39khAa7+5R
 ch5jZ5ESIPFqIa+5Wue/M0hjgp7ayNVFb/XraoObe/r1PzQLDfkWSy9Oi
 PCI6U56I/ZuJdHidTI50ouq92pq8wfUaARTgWCouMbREPm6zTXjPs0HG8
 xTuF2zaVKutMTJGx2Sazqhe6ZSqrPn7YN9flR5DH2JyorC+GJJNN0kL+V
 Din8yRGU7FOR7HupS8mdQxk9ehSfCyLefKxbrysOp37dGZ736NbnhutGg
 b2DFxafm8fqneYBKtF6KQgHfqNipeelljESH7IDEXIo71ifD67KnUkeFr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="358359"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="358359"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823241934"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823241934"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 07:51:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Feb 2024 17:51:02 +0200
Date: Fri, 2 Feb 2024 17:51:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 2/4] drm/i915/dp: refactor DP MST detection and configuration
Message-ID: <Zb0PZldnyLe59Vb0@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
 <d789334e1f31ba6eff1c7e2913e6a03cea8227e7.1706882591.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d789334e1f31ba6eff1c7e2913e6a03cea8227e7.1706882591.git.jani.nikula@intel.com>
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

On Fri, Feb 02, 2024 at 04:05:32PM +0200, Jani Nikula wrote:
> Currently we've split MST capability detection in two places,
> intel_dp_can_mst() and intel_dp_configure_mst(). They check essentially
> the same things.
> 
> Move bulk of the work, including logging, to intel_dp_can_mst() and
> rename it intel_dp_mst_detect(). Set intel_dp->is_mst there to avoid
> duplicate work.

This seems confusing. is_mst is supposed to reflect the state
of the topology manager, nothing more.

> 
> Rename intel_dp_configure_mst() to intel_dp_mst_configure(), and only
> set the topology manager state there.
> 
> The main functional difference is that the DP_MSTM_CAP DPCD register is
> now only read once at detect, unconditionally, and the MST support is
> always logged. Everything else should remain the same.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++---------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7af09f2c008d..e0b8ee6bde79 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4004,23 +4004,15 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  					   intel_dp->downstream_ports) == 0;
>  }
>  
> -static bool
> -intel_dp_can_mst(struct intel_dp *intel_dp)
> +static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
>  
> -	return i915->display.params.enable_dp_mst &&
> +	intel_dp->is_mst = i915->display.params.enable_dp_mst &&
>  		intel_dp_mst_source_support(intel_dp) &&
> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
> -}
> -
> -static void
> -intel_dp_configure_mst(struct intel_dp *intel_dp)
> -{
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	struct intel_encoder *encoder =
> -		&dp_to_dig_port(intel_dp)->base;
> -	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
> +		sink_can_mst;
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> @@ -4029,14 +4021,14 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  		    str_yes_no(sink_can_mst),
>  		    str_yes_no(i915->display.params.enable_dp_mst));
>  
> -	if (!intel_dp_mst_source_support(intel_dp))
> -		return;
> -
> -	intel_dp->is_mst = sink_can_mst &&
> -		i915->display.params.enable_dp_mst;
> +	return intel_dp->is_mst;
> +}
>  
> -	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> -					intel_dp->is_mst);
> +static void intel_dp_mst_configure(struct intel_dp *intel_dp)
> +{
> +	if (intel_dp_mst_source_support(intel_dp))
> +		drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> +						intel_dp->is_mst);
>  }
>  
>  static bool
> @@ -5387,7 +5379,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>  		connector_status_connected : connector_status_disconnected;
>  	}
>  
> -	if (intel_dp_can_mst(intel_dp))
> +	if (intel_dp_mst_detect(intel_dp))
>  		return connector_status_connected;
>  
>  	/* If no HPD, poke DDC gently */
> @@ -5706,7 +5698,7 @@ intel_dp_detect(struct drm_connector *connector,
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
