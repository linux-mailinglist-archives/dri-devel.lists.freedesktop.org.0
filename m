Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1ED4C99B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5863F10E8F0;
	Wed,  2 Mar 2022 00:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A84810E8EE;
 Wed,  2 Mar 2022 00:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646179652; x=1677715652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZgIUAEICMaQHlQLTPkhxYEg5vyjsC5nMHf3XOhyOORU=;
 b=l9kxtqgtj7eu8Wt95979SX8BzxkRq2Sqq4s/eAJtC59/8956PqhXwDiK
 IDEwwcBT+b1CmMQ8394vEZOCK7KDREMUj8nUU3IskAAv3VZfDSnCUhhal
 iJZsX9PU2V1Kk2JWIwH5Yd1s5UU+erSvEtZcPUKUgBRi55LQ0qYJX8OyQ
 aWVtKIyqpyeQ6sw+nBmtkUex0FAQ4EW8u115zXjBluIsfuIkKZrIVoEZv
 fiiZLe4sQMnCfFHEB2ZOny7RMFcFZ5bh5KevQMmrCJZ8NOFI0VVwZUcui
 zcqCbBSncbCLtWBLEfrgGzSlwlhFnGnNMrtFFpOGRs1jf9c45+00eTArw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="313991050"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="313991050"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:07:30 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="493313735"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:07:13 -0800
Date: Tue, 1 Mar 2022 16:07:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 13/13] drm/i915/xehpsdv: Move render/compute engine
 reset domains related workarounds
Message-ID: <Yh61L2GuBCseBY0g@mdroper-desk1.amr.corp.intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
 <20220301231549.1817978-14-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301231549.1817978-14-matthew.d.roper@intel.com>
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
Cc: Srinivasan Shanmugam <srinivasan.s@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 03:15:49PM -0800, Matt Roper wrote:
> From: Srinivasan Shanmugam <srinivasan.s@intel.com>
> 
> Registers that exist in the shared render/compute reset domain need to
> be placed on an engine workaround list to ensure that they are properly
> re-applied whenever an RCS or CCS engine is reset.  We have a number of
> workarounds (updating registers MLTICTXCTL, L3SQCREG1_CCS0,
> GEN12_MERT_MOD_CTRL, and GEN12_GAMCNTRL_CTRL) that are incorrectly
> implemented on the 'gt' workaround list and need to be moved
> accordingly.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.s@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 26 ++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 0b9435d62808..c014b40d2e9f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1343,12 +1343,6 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_1409757795:xehpsdv */
>  	wa_write_or(wal, SCCGCTL94DC, CG3DDISURB);
>  
> -	/* Wa_18011725039:xehpsdv */
> -	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
> -		wa_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> -		wa_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
> -	}
> -
>  	/* Wa_16011155590:xehpsdv */
>  	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>  		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> @@ -1385,19 +1379,12 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  			    GAMTLBVEBOX0_CLKGATE_DIS);
>  	}
>  
> -	/* Wa_14012362059:xehpsdv */
> -	wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> -
>  	/* Wa_16012725990:xehpsdv */
>  	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_FOREVER))
>  		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE, VFUNIT_CLKGATE_DIS);
>  
>  	/* Wa_14011060649:xehpsdv */
>  	wa_14011060649(gt, wal);
> -
> -	/* Wa_14014368820:xehpsdv */
> -	wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> -		    GLOBAL_INVALIDATION_MODE);
>  }
>  
>  static void
> @@ -2617,6 +2604,19 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		/* Wa_14010449647:xehpsdv */
>  		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
>  			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
> +
> +		/* Wa_18011725039:xehpsdv */
> +		if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
> +			wa_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> +			wa_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
> +		}
> +
> +		/* Wa_14012362059:xehpsdv */
> +		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +
> +		/* Wa_14014368820:xehpsdv */
> +		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> +				GLOBAL_INVALIDATION_MODE);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
