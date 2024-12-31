Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E29FF040
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2109410E679;
	Tue, 31 Dec 2024 15:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJWlWHYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44AD10E679;
 Tue, 31 Dec 2024 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735659278; x=1767195278;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=lC2A22uvEJgjtAttmaBRP6mUxiNyK1JpR36KF8OvEyE=;
 b=DJWlWHYJYdKwXGmUc/tkq9z3ZfPAc50BM+n4B9nUUkmBW8TQM5PzB707
 XJqhl1lT8exMdWTEGFrbYZMw/d6IGn1ZQN1jQDlSBm+t5jfOR4TtNHmJW
 Pjnx3BgI1fHrOuwIeO70yc8LTgeknvU1W+5ZXg1dtfONek5ARO3ISAcNO
 oDvbF+qS00OqjmM5gGJmaJkxosTpy6RFoDHEW96Qy0IGIwc1qGv9wfu25
 +8XdI4VLyyvgpxBKBwnjjEd2t4ftqBBduxOOARiZCLKlXnF/PnMJgBLHZ
 SdlPSSuTE3uzflAdy+72FGFFpOnGsKfrw2hFtuvw/PUkMUDcrBj8Pk+70 w==;
X-CSE-ConnectionGUID: Z+sAhH+aTlKuXt1VoR9uQQ==
X-CSE-MsgGUID: 3RwsB/bGRbiW6Y90A098eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35822631"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="35822631"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:34:37 -0800
X-CSE-ConnectionGUID: ZaNa3PbhSzaVJIZWHGXZgQ==
X-CSE-MsgGUID: EY/x4GFzTq2yf8WCiEx/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101578397"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:34:36 -0800
Date: Tue, 31 Dec 2024 17:35:27 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 05/16] drm/i915/mst: remove crtc_state->pbn
Message-ID: <Z3QPP2ITASOfVEOS@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <774e051f77d89fbf8a933659356e67729d8a2a58.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <774e051f77d89fbf8a933659356e67729d8a2a58.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:33:54PM +0200, Jani Nikula wrote:
> The crtc_state->pbn member is only used as a temporary variable within
> mst_stream_find_vcpi_slots_for_bpp(). Remove it as unnecessary.
> 
> Suggested-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 2 --
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        | 3 +--
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index eb9dd1125a4a..16e2bbde76eb 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1160,8 +1160,6 @@ struct intel_crtc_state {
>  
>  	bool double_wide;
>  
> -	int pbn;
> -
>  	struct intel_crtc_scaler_state scaler_state;
>  
>  	/* w/a for waiting 2 vblanks during crtc enable */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index f7b91cf32b5b..51f0248084b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -321,14 +321,13 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		 * first branch device's link also applies here.
>  		 */
>  		pbn.full = remote_tu * mst_state->pbn_div.full;
> -		crtc_state->pbn = dfixed_trunc(pbn);
>  
>  		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
>  		crtc_state->dp_m_n.tu = remote_tu;
>  
>  		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
>  						      connector->port,
> -						      crtc_state->pbn);
> +						      dfixed_trunc(pbn));
>  		if (slots == -EDEADLK)
>  			return slots;
>  
> -- 
> 2.39.5
> 
