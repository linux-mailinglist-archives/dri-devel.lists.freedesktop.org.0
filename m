Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7C3D4918
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 20:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3B734E1;
	Sat, 24 Jul 2021 18:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156BF734E0;
 Sat, 24 Jul 2021 18:14:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10055"; a="212038741"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="212038741"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:14:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="503107340"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:14:36 -0700
Date: Sat, 24 Jul 2021 11:14:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 05/30] drm/i915/display: remove explicit CNL handling
 from intel_color.c
Message-ID: <20210724181435.GM1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-6-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jose Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:49PM -0700, Lucas De Marchi wrote:
> The only real platform with DISPLAY_VER == 10 is GLK, so we don't need
> any checks and supporting code for CNL. For DISPLAY_VER >= 11,
> ilk_load_csc_matrix() is not used, so make it handle GLK only.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index dab892d2251b..afcb4bf3826c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -305,13 +305,12 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
>  				    ilk_csc_postoff_limited_range);
>  	} else if (crtc_state->csc_enable) {
>  		/*
> -		 * On GLK+ both pipe CSC and degamma LUT are controlled
> +		 * On GLK both pipe CSC and degamma LUT are controlled
>  		 * by csc_enable. Hence for the cases where the degama
>  		 * LUT is needed but CSC is not we need to load an
>  		 * identity matrix.
>  		 */
> -		drm_WARN_ON(&dev_priv->drm, !IS_CANNONLAKE(dev_priv) &&
> -			    !IS_GEMINILAKE(dev_priv));
> +		drm_WARN_ON(&dev_priv->drm, !IS_GEMINILAKE(dev_priv));
>  
>  		ilk_update_pipe_csc(crtc, ilk_csc_off_zero,
>  				    ilk_csc_coeff_identity,
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
