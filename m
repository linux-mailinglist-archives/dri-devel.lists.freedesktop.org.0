Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7379FF7E8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016D510E3F4;
	Thu,  2 Jan 2025 10:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK6kISwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102A210E3EE;
 Thu,  2 Jan 2025 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735813155; x=1767349155;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W/7kTOzi0habnfyjAFBk883ClykI3K/K8yAZzr9HaCo=;
 b=JK6kISwBGWR7q+oZ3JAi/kkLr7enqcplVG3rhAsZzZoyqM58L4YrKEx3
 JA9VdmO6UlRVhDRS7sn8elaJVntDH+jr59TCe9sY8E24GvgFater3dsg9
 +e/AJ2iF+1aRPMjdqYZGN6znJtndX3EcCJlU38XEqZaSUTtTjUoVGcVtw
 dLdnAwEN3uuNcGTCEh7JzSx7fH8fv2ayCGCfHbRat+fQnYk/+mIkAS8jQ
 w6oomE+7bUVVz54ZIzsPjGEnH7HD2sc9mXp+j72Pfujc9GZVlI2CFAGQF
 wKAKlv5SxRpHfNN1Ut82ZVj0o9FQRYSRIaeYohLamt6T6nMi80aBd04XK g==;
X-CSE-ConnectionGUID: /5gqk1lCSCS70ZanA9tF8g==
X-CSE-MsgGUID: 2vuXzOUTTfWFNCUr6z68qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36200053"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36200053"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:19:14 -0800
X-CSE-ConnectionGUID: Rt3GhKvJROyFYleMgHocHA==
X-CSE-MsgGUID: 5RD97HRMT2KSszwvZeE6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101305709"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:19:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 06/16] drm/i915/mst: split out a helper for figuring
 out the TU
In-Reply-To: <Z3QS_T1bOEaMeFXU@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734643485.git.jani.nikula@intel.com>
 <bde1edd1d6eac9d5e6519cb2e23b07ff6c71b181.1734643485.git.jani.nikula@intel.com>
 <Z3QS_T1bOEaMeFXU@ideak-desk.fi.intel.com>
Date: Thu, 02 Jan 2025 12:19:09 +0200
Message-ID: <87cyh5o6w2.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Dec 19, 2024 at 11:33:55PM +0200, Jani Nikula wrote:
>> Extract intel_dp_mtp_tu_compute_config() for figuring out the TU. Move
>> the link configuration and mst state access to the callers. This will be
>> easier to adapt to 128b/132b SST.
>> 
>> v2: Don't add SST stuff here yet
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 53 ++++++++++++++-------
>>  drivers/gpu/drm/i915/display/intel_dp_mst.h |  7 +++
>>  2 files changed, 42 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index 51f0248084b6..d08824d2fefe 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -209,31 +209,23 @@ static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connec
>>  					    num_joined_pipes);
>>  }
>>  
>> -static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>> -					      struct intel_crtc_state *crtc_state,
>> -					      int max_bpp, int min_bpp,
>> -					      struct link_config_limits *limits,
>> -					      struct drm_connector_state *conn_state,
>> -					      int step, bool dsc)
>> +int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>> +				   struct intel_crtc_state *crtc_state,
>> +				   int max_bpp, int min_bpp,
>> +				   struct drm_connector_state *conn_state,
>> +				   int step, bool dsc)
>>  {
>>  	struct intel_display *display = to_intel_display(intel_dp);
>>  	struct drm_atomic_state *state = crtc_state->uapi.state;
>> -	struct drm_dp_mst_topology_state *mst_state;
>>  	struct intel_connector *connector =
>>  		to_intel_connector(conn_state->connector);
>>  	const struct drm_display_mode *adjusted_mode =
>>  		&crtc_state->hw.adjusted_mode;
>> +	fixed20_12 pbn_div;
>>  	int bpp, slots = -EINVAL;
>>  	int dsc_slice_count = 0;
>>  	int max_dpt_bpp;
>>  
>> -	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
>> -	if (IS_ERR(mst_state))
>> -		return PTR_ERR(mst_state);
>> -
>> -	crtc_state->lane_count = limits->max_lane_count;
>> -	crtc_state->port_clock = limits->max_rate;
>> -
>>  	if (dsc) {
>>  		if (!intel_dp_supports_fec(intel_dp, connector, crtc_state))
>>  			return -EINVAL;
>> @@ -241,8 +233,8 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>>  		crtc_state->fec_enable = !intel_dp_is_uhbr(crtc_state);
>>  	}
>>  
>> -	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
>> -						      crtc_state->lane_count);
>> +	pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
>> +					   crtc_state->lane_count);
>
> Nit: looking this up from drm_dp_mst_topology_state (once SST and MST is
> separated done only in the MST case) instead of recalculating the same
> would be better. Either way:

I don't disagree, but I couldn't figure out a neat way to deduplicate
that just yet. This seemed simpler. I think I'll leave that for future
improvement.

> Reviewed-by: Imre Deak <imre.deak@intel.com>

Thanks,
Jani.

>
>>  
>>  	max_dpt_bpp = intel_dp_mst_max_dpt_bpp(crtc_state, dsc);
>>  	if (max_bpp > max_dpt_bpp) {
>> @@ -302,7 +294,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>>  		pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
>>  							      link_bpp_x16,
>>  							      remote_bw_overhead));
>> -		remote_tu = DIV_ROUND_UP(pbn.full, mst_state->pbn_div.full);
>> +		remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
>>  
>>  		/*
>>  		 * Aligning the TUs ensures that symbols consisting of multiple
>> @@ -320,7 +312,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>>  		 * allocated for the whole path and the TUs allocated for the
>>  		 * first branch device's link also applies here.
>>  		 */
>> -		pbn.full = remote_tu * mst_state->pbn_div.full;
>> +		pbn.full = remote_tu * pbn_div.full;
>>  
>>  		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
>>  		crtc_state->dp_m_n.tu = remote_tu;
>> @@ -355,6 +347,31 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>>  	return 0;
>>  }
>>  
>> +static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>> +					      struct intel_crtc_state *crtc_state,
>> +					      int max_bpp, int min_bpp,
>> +					      struct link_config_limits *limits,
>> +					      struct drm_connector_state *conn_state,
>> +					      int step, bool dsc)
>> +{
>> +	struct drm_atomic_state *state = crtc_state->uapi.state;
>> +	struct drm_dp_mst_topology_state *mst_state;
>> +
>> +	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
>> +	if (IS_ERR(mst_state))
>> +		return PTR_ERR(mst_state);
>> +
>> +	crtc_state->lane_count = limits->max_lane_count;
>> +	crtc_state->port_clock = limits->max_rate;
>> +
>> +	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
>> +						      crtc_state->lane_count);
>> +
>> +	return intel_dp_mtp_tu_compute_config(intel_dp, crtc_state,
>> +					      max_bpp, min_bpp,
>> +					      conn_state, step, dsc);
>> +}
>> +
>>  static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
>>  					  struct intel_crtc_state *crtc_state,
>>  					  struct drm_connector_state *conn_state,
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/drm/i915/display/intel_dp_mst.h
>> index 8343804ce3f8..c6bdc1d190a4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
>> @@ -8,6 +8,7 @@
>>  
>>  #include <linux/types.h>
>>  
>> +struct drm_connector_state;
>>  struct intel_atomic_state;
>>  struct intel_crtc;
>>  struct intel_crtc_state;
>> @@ -30,4 +31,10 @@ bool intel_dp_mst_crtc_needs_modeset(struct intel_atomic_state *state,
>>  void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp);
>>  bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp);
>>  
>> +int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>> +				   struct intel_crtc_state *crtc_state,
>> +				   int max_bpp, int min_bpp,
>> +				   struct drm_connector_state *conn_state,
>> +				   int step, bool dsc);
>> +
>>  #endif /* __INTEL_DP_MST_H__ */
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
