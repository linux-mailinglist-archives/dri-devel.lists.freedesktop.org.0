Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB49FF03E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0610E67A;
	Tue, 31 Dec 2024 15:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuEgZj3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA77D10E666;
 Tue, 31 Dec 2024 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735659215; x=1767195215;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=cuTMMJDC8vXDLSjf80li/K7AIauXwvyt5QBb5POZ2ec=;
 b=CuEgZj3+5Vqnt1SkQPxBnc+fmV3Ct5K8aQyfwYAJD7JeKQbvplriqAmL
 HvR9FOesAD5HYJ/G5JMd/2Gf1m7LUhhdJVjaA5c9pCJudQGS7yIYrP2zU
 dtYTC1sURHOLzrJ6bE8mmUSCAVQsQFOv66cwkpVXn78QAKxvWZJQnCqDn
 IDjx7+tKpzjx0WfO+ciRoZSXM0rtEykDqNXqgsFBXU75todK0jg5UF7vC
 ynGxZX5Kwme93tYESViXh2ngEQ0j/jRhF3nWRuI1YFtPQub2rYnPjZBRm
 brx50nlwI8S+kN1QJnoON2/P4e0A5eY0Pwx4LFlyChNJ3XLsD0jflBs4n Q==;
X-CSE-ConnectionGUID: AuFjAtPMRKahf6JrSSibgA==
X-CSE-MsgGUID: PDf3gKUPTtGbQPzK5wZRFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="39619409"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="39619409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:33:35 -0800
X-CSE-ConnectionGUID: aVrpXSS0RryMtpgjd4iflQ==
X-CSE-MsgGUID: re5kwQ6US7uPO0lt8jBthA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101248131"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:33:33 -0800
Date: Tue, 31 Dec 2024 17:34:24 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 04/16] drm/i915/mst: change return value of
 mst_stream_find_vcpi_slots_for_bpp()
Message-ID: <Z3QPAJCpNB6pLGet@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <5c5db1f5bdbb90e896d4ac792586d2af6c60c68c.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c5db1f5bdbb90e896d4ac792586d2af6c60c68c.1734643485.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2024 at 11:33:53PM +0200, Jani Nikula wrote:
> The callers of mst_stream_find_vcpi_slots_for_bpp() don't need the
> returned slots for anything. On the contrary, they need to jump through
> hoops to just distinguish between success and failure. Just return 0
> instead of slots from mst_stream_find_vcpi_slots_for_bpp() for success,
> and simplify the callers.
> 
> There's a pointless ret local variable that we can drop in the process.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 52 +++++++--------------
>  1 file changed, 18 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index f52f9c968adb..f7b91cf32b5b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -226,7 +226,6 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  	int bpp, slots = -EINVAL;
>  	int dsc_slice_count = 0;
>  	int max_dpt_bpp;
> -	int ret = 0;
>  
>  	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
>  	if (IS_ERR(mst_state))
> @@ -340,23 +339,21 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		}
>  	}
>  
> -	/* We failed to find a proper bpp/timeslots, return error */
> -	if (ret)
> -		slots = ret;
> -
>  	if (slots < 0) {
>  		drm_dbg_kms(display->drm, "failed finding vcpi slots:%d\n",
>  			    slots);
> -	} else {
> -		if (!dsc)
> -			crtc_state->pipe_bpp = bpp;
> -		else
> -			crtc_state->dsc.compressed_bpp_x16 = fxp_q4_from_int(bpp);
> -		drm_dbg_kms(display->drm, "Got %d slots for pipe bpp %d dsc %d\n",
> -			    slots, bpp, dsc);
> +		return slots;
>  	}
>  
> -	return slots;
> +	if (!dsc)
> +		crtc_state->pipe_bpp = bpp;
> +	else
> +		crtc_state->dsc.compressed_bpp_x16 = fxp_q4_from_int(bpp);
> +
> +	drm_dbg_kms(display->drm, "Got %d slots for pipe bpp %d dsc %d\n",
> +		    slots, bpp, dsc);
> +
> +	return 0;
>  }
>  
>  static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
> @@ -364,22 +361,15 @@ static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
>  					  struct drm_connector_state *conn_state,
>  					  struct link_config_limits *limits)
>  {
> -	int slots = -EINVAL;
> -
>  	/*
>  	 * FIXME: allocate the BW according to link_bpp, which in the case of
>  	 * YUV420 is only half of the pipe bpp value.
>  	 */
> -	slots = mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state,
> -						   fxp_q4_to_int(limits->link.max_bpp_x16),
> -						   fxp_q4_to_int(limits->link.min_bpp_x16),
> -						   limits,
> -						   conn_state, 2 * 3, false);
> -
> -	if (slots < 0)
> -		return slots;
> -
> -	return 0;
> +	return mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state,
> +						  fxp_q4_to_int(limits->link.max_bpp_x16),
> +						  fxp_q4_to_int(limits->link.min_bpp_x16),
> +						  limits,
> +						  conn_state, 2 * 3, false);
>  }
>  
>  static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
> @@ -389,7 +379,6 @@ static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> -	int slots = -EINVAL;
>  	int i, num_bpc;
>  	u8 dsc_bpc[3] = {};
>  	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
> @@ -451,14 +440,9 @@ static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
>  	min_compressed_bpp = intel_dp_dsc_nearest_valid_bpp(display, min_compressed_bpp,
>  							    crtc_state->pipe_bpp);
>  
> -	slots = mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state, max_compressed_bpp,
> -						   min_compressed_bpp, limits,
> -						   conn_state, 1, true);
> -
> -	if (slots < 0)
> -		return slots;
> -
> -	return 0;
> +	return mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state, max_compressed_bpp,
> +						  min_compressed_bpp, limits,
> +						  conn_state, 1, true);
>  }
>  
>  static int mst_stream_update_slots(struct intel_dp *intel_dp,
> -- 
> 2.39.5
> 
