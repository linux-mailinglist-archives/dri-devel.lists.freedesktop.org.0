Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5E85185E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEF210E108;
	Mon, 12 Feb 2024 15:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdxUBSe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2310E07F;
 Mon, 12 Feb 2024 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707752790; x=1739288790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WfX1OeIo++ciRg18ZhbvPH5CfPfDwvB05+eESoeALcc=;
 b=HdxUBSe9oiOJpyYbN9tQh8K6OrNLD3GyUXum3mYduKMNnD60jp0qtlZG
 +mzXPS41MN8tu5k1LFmbKAc/txAUNfUZkqh98zMfANR4moYqYHyiq/WrU
 SYsxby/OYFfvpMNt+lbjaOj3/RcsiGCSRTTvhF0uRwisATJCidaClfW/z
 ktDI/matjPNs+RSeWuq449YgR5acU/mXA5pVf0YvBHsFLRcFM3UTzro9d
 JFO4Sfsc/7GMPyGUk6+SA1pL5uT+lEMlySevC+GpKEth8T4dDZ5JBJWX0
 6bRceoKdDHEhXY6VDzqzx6T+tdySRxBg2UaK+550D7aBMK2GIIn11s0Hw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24202564"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="24202564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="825840081"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="825840081"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 12 Feb 2024 07:46:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Feb 2024 17:46:26 +0200
Date: Mon, 12 Feb 2024 17:46:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 2/4] drm/i915/dp: refactor DP MST detection and configuration
Message-ID: <Zco9UijJGIN2ZDHZ@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
 <d789334e1f31ba6eff1c7e2913e6a03cea8227e7.1706882591.git.jani.nikula@intel.com>
 <Zb0PZldnyLe59Vb0@intel.com> <87v86t9020.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v86t9020.fsf@intel.com>
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

On Mon, Feb 12, 2024 at 05:25:43PM +0200, Jani Nikula wrote:
> On Fri, 02 Feb 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Feb 02, 2024 at 04:05:32PM +0200, Jani Nikula wrote:
> >> Currently we've split MST capability detection in two places,
> >> intel_dp_can_mst() and intel_dp_configure_mst(). They check essentially
> >> the same things.
> >> 
> >> Move bulk of the work, including logging, to intel_dp_can_mst() and
> >> rename it intel_dp_mst_detect(). Set intel_dp->is_mst there to avoid
> >> duplicate work.
> >
> > This seems confusing. is_mst is supposed to reflect the state
> > of the topology manager, nothing more.
> 
> We'll, that's still exactly what we're going to set the topology manager
> state to. It's just that now we figure it out just a little earlier, so
> we don't have to duplicate the dpcd reads and logic to two places.

That may be desiresable, but I don't think the current is_mst
flag is really the correct thing to track that. We now set it
somewhere deep down in the detect path wihtout configuring
the mst manager to match, but we clear it much higher up
and there we do assume it 100% matches the state of the topology
manager.

Eg. what happens now if we were previosuly using MST, and now
intel_dp_mst_detect() clears the flag? It looks to me like
we're going to completely forget to call
drm_dp_mst_topology_mgr_set_mst(...,false).

> 
> BR,
> Jani.
> 
> 
> >
> >> 
> >> Rename intel_dp_configure_mst() to intel_dp_mst_configure(), and only
> >> set the topology manager state there.
> >> 
> >> The main functional difference is that the DP_MSTM_CAP DPCD register is
> >> now only read once at detect, unconditionally, and the MST support is
> >> always logged. Everything else should remain the same.
> >> 
> >> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++---------------
> >>  1 file changed, 14 insertions(+), 22 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >> index 7af09f2c008d..e0b8ee6bde79 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -4004,23 +4004,15 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >>  					   intel_dp->downstream_ports) == 0;
> >>  }
> >>  
> >> -static bool
> >> -intel_dp_can_mst(struct intel_dp *intel_dp)
> >> +static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
> >>  {
> >>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> >> +	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
> >>  
> >> -	return i915->display.params.enable_dp_mst &&
> >> +	intel_dp->is_mst = i915->display.params.enable_dp_mst &&
> >>  		intel_dp_mst_source_support(intel_dp) &&
> >> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
> >> -}
> >> -
> >> -static void
> >> -intel_dp_configure_mst(struct intel_dp *intel_dp)
> >> -{
> >> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >> -	struct intel_encoder *encoder =
> >> -		&dp_to_dig_port(intel_dp)->base;
> >> -	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DP_MST_CAPABLE;
> >> +		sink_can_mst;
> >>  
> >>  	drm_dbg_kms(&i915->drm,
> >>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> >> @@ -4029,14 +4021,14 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
> >>  		    str_yes_no(sink_can_mst),
> >>  		    str_yes_no(i915->display.params.enable_dp_mst));
> >>  
> >> -	if (!intel_dp_mst_source_support(intel_dp))
> >> -		return;
> >> -
> >> -	intel_dp->is_mst = sink_can_mst &&
> >> -		i915->display.params.enable_dp_mst;
> >> +	return intel_dp->is_mst;
> >> +}
> >>  
> >> -	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> >> -					intel_dp->is_mst);
> >> +static void intel_dp_mst_configure(struct intel_dp *intel_dp)
> >> +{
> >> +	if (intel_dp_mst_source_support(intel_dp))
> >> +		drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> >> +						intel_dp->is_mst);
> >>  }
> >>  
> >>  static bool
> >> @@ -5387,7 +5379,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
> >>  		connector_status_connected : connector_status_disconnected;
> >>  	}
> >>  
> >> -	if (intel_dp_can_mst(intel_dp))
> >> +	if (intel_dp_mst_detect(intel_dp))
> >>  		return connector_status_connected;
> >>  
> >>  	/* If no HPD, poke DDC gently */
> >> @@ -5706,7 +5698,7 @@ intel_dp_detect(struct drm_connector *connector,
> >>  
> >>  	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
> >>  
> >> -	intel_dp_configure_mst(intel_dp);
> >> +	intel_dp_mst_configure(intel_dp);
> >>  
> >>  	/*
> >>  	 * TODO: Reset link params when switching to MST mode, until MST
> >> -- 
> >> 2.39.2
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
