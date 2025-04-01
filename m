Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44FA77781
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0685B10E528;
	Tue,  1 Apr 2025 09:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzZhNNUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15CE10E527;
 Tue,  1 Apr 2025 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499133; x=1775035133;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=S3+pOJoUuUOEkrcjFFOuXEmEJU8uMeYFcgKG22k7/t4=;
 b=hzZhNNUut3c3m6CrUwZNz0IBkE0RLrrQH89zBXUFV/y46QzaM7m98oQg
 zoGG4B1hxshIlYJfxi7HOXSulZhdc9W73j1/V3x7toAP6/cCbvEiQGacE
 4fE4G1NyzrFEG9Vm/bG/NxrUgut5BHcPrhX2V7tdaUP/pAUYT5ZOkNJ2R
 L7U6H/pKi58YzhqhhmiUhLLqrwStgyD5CCi2pq1ecBNxT1B4ch4rhx4NY
 75kl4ANQcNXSGGwzBfA5FurhBM2i0JNRKcpY6R11XBFGuObMDL6UAuhh/
 S4FcxhH3VMBbNPbyXYkIozd9r3cHtRASAzyIo9wX5KFK5nqA+t7Ol8rpU g==;
X-CSE-ConnectionGUID: mPcfZ8qfSgqEOYpA6jjbSA==
X-CSE-MsgGUID: aQCzSERRTxaCjGN1rg8pbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43960438"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="43960438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:18:53 -0700
X-CSE-ConnectionGUID: l62pIIDVTpKQjS29hPejPw==
X-CSE-MsgGUID: h1upR25NRkGMXNeVbsnwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131541390"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:18:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, stable@vger.kernel.org
Cc: Wayne Lin <Wayne.Lin@amd.com>, Jerry Zuo <jerry.zuo@amd.com>, Zaeem
 Mohamed <zaeem.mohamed@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 cascardo@igalia.com, imre.deak@intel.com
Subject: Re: [PATCH 6.12] drm/amd/display: Don't write DP_MSTM_CTRL after LT
In-Reply-To: <20250331145819.682274-1-cascardo@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331145819.682274-1-cascardo@igalia.com>
Date: Tue, 01 Apr 2025 12:18:46 +0300
Message-ID: <87zfh02qa1.fsf@intel.com>
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

On Mon, 31 Mar 2025, Thadeu Lima de Souza Cascardo <cascardo@igalia.com> wrote:
> From: Wayne Lin <Wayne.Lin@amd.com>
>
> [ Upstream commit bc068194f548ef1f230d96c4398046bf59165992 ]
>
> [Why]
> Observe after suspend/resme, we can't light up mst monitors under specific
> mst hub.

This is already at stable backport stage, but it would really be helpful
to log *which* specific mst hub we're talking about here. Now the
information is lost in time, at least to outsiders.

BR,
Jani.



> The reason is that driver still writes DPCD DP_MSTM_CTRL after LT.
> It's forbidden even we write the same value for that dpcd register.
>
> [How]
> We already resume the mst branch device dpcd settings during
> resume_mst_branch_status(). Leverage drm_dp_mst_topology_queue_probe() to
> only probe the topology, not calling drm_dp_mst_topology_mgr_resume() which
> will set DP_MSTM_CTRL as well.
>
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d9a3917d207e..c4c6538eabae 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3231,8 +3231,7 @@ static int dm_resume(void *handle)
>  	struct dm_atomic_state *dm_state = to_dm_atomic_state(dm->atomic_obj.state);
>  	enum dc_connection_type new_connection_type = dc_connection_none;
>  	struct dc_state *dc_state;
> -	int i, r, j, ret;
> -	bool need_hotplug = false;
> +	int i, r, j;
>  	struct dc_commit_streams_params commit_params = {};
>  
>  	if (dm->dc->caps.ips_support) {
> @@ -3427,23 +3426,16 @@ static int dm_resume(void *handle)
>  		    aconnector->mst_root)
>  			continue;
>  
> -		ret = drm_dp_mst_topology_mgr_resume(&aconnector->mst_mgr, true);
> -
> -		if (ret < 0) {
> -			dm_helpers_dp_mst_stop_top_mgr(aconnector->dc_link->ctx,
> -					aconnector->dc_link);
> -			need_hotplug = true;
> -		}
> +		drm_dp_mst_topology_queue_probe(&aconnector->mst_mgr);
>  	}
>  	drm_connector_list_iter_end(&iter);
>  
> -	if (need_hotplug)
> -		drm_kms_helper_hotplug_event(ddev);
> -
>  	amdgpu_dm_irq_resume_late(adev);
>  
>  	amdgpu_dm_smu_write_watermarks_table(adev);
>  
> +	drm_kms_helper_hotplug_event(ddev);
> +
>  	return 0;
>  }

-- 
Jani Nikula, Intel
