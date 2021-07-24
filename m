Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C393D4970
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 21:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912416E117;
	Sat, 24 Jul 2021 19:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E126E117;
 Sat, 24 Jul 2021 19:11:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10055"; a="191627700"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="191627700"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:03:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="436008850"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:03:46 -0700
Date: Sat, 24 Jul 2021 11:03:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 01/30] drm/i915: fix not reading DSC disable fuse in GLK
Message-ID: <20210724180345.GJ1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-2-lucas.demarchi@intel.com>
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

On Fri, Jul 23, 2021 at 05:10:45PM -0700, Lucas De Marchi wrote:
> We were using GRAPHICS_VER() to handle SKL_DFSM register, which means we
> were not handling GLK correctly since that has GRAPHICS_VER == 9, but
> DISPLAY_VER == 10. Switch the entire branch to check DISPLAY_VER
> which makes it more in line with Bspec.
> 
> Even though the Bspec has an exception for RKL in
> TGL_DFSM_PIPE_D_DISABLE, we don't have to do anything as the bit has
> disable semantic and RKL doesn't have pipe D.
> 
> Bspec: 50075, 7548
> Fixes: 2b5a4562edd0 ("drm/i915/display: Simplify GLK display version tests")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_device_info.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index d5cf5977938a..99b51c292942 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -335,7 +335,7 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
>  			info->pipe_mask &= ~BIT(PIPE_C);
>  			info->cpu_transcoder_mask &= ~BIT(TRANSCODER_C);
>  		}
> -	} else if (HAS_DISPLAY(dev_priv) && GRAPHICS_VER(dev_priv) >= 9) {
> +	} else if (HAS_DISPLAY(dev_priv) && DISPLAY_VER(dev_priv) >= 9) {
>  		u32 dfsm = intel_de_read(dev_priv, SKL_DFSM);
>  
>  		if (dfsm & SKL_DFSM_PIPE_A_DISABLE) {
> @@ -350,7 +350,8 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
>  			info->pipe_mask &= ~BIT(PIPE_C);
>  			info->cpu_transcoder_mask &= ~BIT(TRANSCODER_C);
>  		}
> -		if (GRAPHICS_VER(dev_priv) >= 12 &&
> +
> +		if (DISPLAY_VER(dev_priv) >= 12 &&
>  		    (dfsm & TGL_DFSM_PIPE_D_DISABLE)) {
>  			info->pipe_mask &= ~BIT(PIPE_D);
>  			info->cpu_transcoder_mask &= ~BIT(TRANSCODER_D);
> @@ -362,10 +363,10 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
>  		if (dfsm & SKL_DFSM_DISPLAY_PM_DISABLE)
>  			info->display.has_fbc = 0;
>  
> -		if (GRAPHICS_VER(dev_priv) >= 11 && (dfsm & ICL_DFSM_DMC_DISABLE))
> +		if (DISPLAY_VER(dev_priv) >= 11 && (dfsm & ICL_DFSM_DMC_DISABLE))
>  			info->display.has_dmc = 0;
>  
> -		if (GRAPHICS_VER(dev_priv) >= 10 &&
> +		if (DISPLAY_VER(dev_priv) >= 10 &&
>  		    (dfsm & CNL_DFSM_DISPLAY_DSC_DISABLE))
>  			info->display.has_dsc = 0;
>  	}
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
