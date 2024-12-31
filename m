Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6204F9FF034
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D7F10E2A4;
	Tue, 31 Dec 2024 15:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQGDYS6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F34F10E0F2;
 Tue, 31 Dec 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735658802; x=1767194802;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=JnHNTfh7Br/xw02pmwXyEIrhoZNlr+ZgztbKgYTUWQs=;
 b=MQGDYS6KNgbaN78uCfTCS3DJaE8bQj8eRwUA6FPSXFQfkyqRXku2/+3M
 vLwEeSGuKYJx4wue/GgxzCi581BwTpHp0Ld22J/3aq6AgkBMaGFvUld/3
 nVLbwMg6Qw0dK8XWemcZLEjBccQzPdAAVfC4pebxsXhFaTi8G2f5E6CM5
 gpyFRvd02iE4ATzY3H15/jZcgSk8EQQ6Q7ynqZpGupSNZm2Rl09w74Mw1
 YvobAIQsvKSoeM6dOxP9GcHwAVQJ1l8DWi2Jt4PCfN0FvWifrDSQakPvq
 eD+NE+b4qSmWm5Fb3GW+Naq+WhTUtAoIeNY7iEDqsNBO8aX/1Nmz+p268 A==;
X-CSE-ConnectionGUID: o40685uyTbWTYhWO3wEd8Q==
X-CSE-MsgGUID: r2ZulgDBSkev+vsFmzcNiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="38770699"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="38770699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:26:42 -0800
X-CSE-ConnectionGUID: n8Xamx7KSQ26B8Y9tdsxWQ==
X-CSE-MsgGUID: LR0H5Wp6S02l9xHucrlVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="131905442"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:26:40 -0800
Date: Tue, 31 Dec 2024 17:27:31 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/16] drm/i915/mst: drop connector parameter from
 intel_dp_mst_compute_m_n()
Message-ID: <Z3QNY9eK7sKl5njf@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <d775bd84208f4739ff178305162fc9b32f165acc.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d775bd84208f4739ff178305162fc9b32f165acc.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:33:52PM +0200, Jani Nikula wrote:
> intel_dp_mst_compute_m_n() doesn't need the connector. Remove the
> parameter.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 50426ba5bdeb..f52f9c968adb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -167,7 +167,6 @@ static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
>  }
>  
>  static void intel_dp_mst_compute_m_n(const struct intel_crtc_state *crtc_state,
> -				     const struct intel_connector *connector,
>  				     int overhead,
>  				     int bpp_x16,
>  				     struct intel_link_m_n *m_n)
> @@ -282,7 +281,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>  							      true, dsc_slice_count, link_bpp_x16);
>  
> -		intel_dp_mst_compute_m_n(crtc_state, connector,
> +		intel_dp_mst_compute_m_n(crtc_state,
>  					 local_bw_overhead,
>  					 link_bpp_x16,
>  					 &crtc_state->dp_m_n);
> -- 
> 2.39.5
> 
