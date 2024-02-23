Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87FA861EF6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D1C10ECE0;
	Fri, 23 Feb 2024 21:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbBJZHvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DE110ECDF;
 Fri, 23 Feb 2024 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708723536; x=1740259536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TspY4Q5sDhjnmmsVYFb9IH1hqnhWjR7pTCgdCJhKRYs=;
 b=VbBJZHvj7+sMiVtECLKp5FCioymiFLGYcpQuI0SS2TNRVNkJ1VF1Ct2u
 UlNTjdDwl1F9kZs3MeXuT59eOltOW4viprBOTUb7MbjiZqPHKLB/KJNSA
 tr/3MOSvVCgcuZSWRFMoq/pn8FWTfoxZ3acfyiu3bMOW6+Vk8WlCSvxJ9
 aSWHeoyqmR4yCHO5zoItV/Nwws4Hsl5zPoarWHxRHXbSfBplB3JLW98Du
 vA3bestt3k/a+umZPpH6gBtQC6d4sM4rF233Tk5kEoaUzlCwYTNy5FsLG
 nzS1/t29Q8ufxi1aMCu26/AzAWd1C9rYh7Bel3AMT02g5hQSh5HDoSVfl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6007277"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6007277"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 13:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="827767898"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="827767898"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 23 Feb 2024 13:25:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Feb 2024 23:25:32 +0200
Date: Fri, 23 Feb 2024 23:25:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH v2 16/21] drm/i915/dp: Allocate/free DP tunnel BW in the
 encoder enable/disable hooks
Message-ID: <ZdkNTH4cNs5RzMPf@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-17-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220211841.448846-17-imre.deak@intel.com>
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

On Tue, Feb 20, 2024 at 11:18:36PM +0200, Imre Deak wrote:
> Allocate and free the DP tunnel BW required by a stream while
> enabling/disabling the stream during a modeset.
> 
> v2:
> - Move the allocation up from encoder hooks to
>   intel_atomic_commit_tail().

Subject should be adjusted to match.

> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com> (v1)
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c     | 1 +
>  drivers/gpu/drm/i915/display/intel_display.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bea4415902044..ed7301808604d 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -54,6 +54,7 @@
>  #include "intel_dp_aux.h"
>  #include "intel_dp_link_training.h"
>  #include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpio_phy.h"
>  #include "intel_dsi.h"
>  #include "intel_fdi.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 20647c97e86fa..445efe0087cde 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7123,6 +7123,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  
>  	intel_commit_modeset_disables(state);
>  
> +	intel_dp_tunnel_atomic_alloc_bw(state);
> +
>  	/* FIXME: Eventually get rid of our crtc->config pointer */
>  	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
>  		crtc->config = new_crtc_state;
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
