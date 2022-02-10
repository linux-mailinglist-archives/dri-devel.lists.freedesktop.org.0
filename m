Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7B4B18E3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB2B10E976;
	Thu, 10 Feb 2022 22:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161C010E123;
 Thu, 10 Feb 2022 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644533794; x=1676069794;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=3xS/VES9ixUHexkF7rIyvun2XAL79I6mPxo371lSCPY=;
 b=GDlLm1FLaZ/E8I5ON59MY2WLQhywX9RNUPoVKcg0JsaPuOpRI3N3dZC8
 AXxX02ohWNc95nOq/8h7u8S6lWcXBO20qOCi4kMqhqkoLa4ix+XHg93HN
 RbzcjSCIJRZ0Q4m+LEyGWyhlfCcrAEpw/L/YJm5VqaKl3nC7qg5juzN/6
 AEM7HxLzSKF7FMrCEILTr9axLL9hhzlHmgZDYsipNb85v62RBpTCT8Zm8
 4LRp98FBgkcjwD6D3Mg4s1spSE9O6thWOrh3bRYl2uavdV7nO1QTGbCi6
 fhrXP7Ao9kRDeylzGw+w4LjrxD6ZjhmIX+qouj7Dh69RleQra2dWEv3nk A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="336035070"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="336035070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 14:56:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="526712304"
Received: from jjmurray-mobl.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.209.24.65])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 14:56:33 -0800
Date: Thu, 10 Feb 2022 14:56:13 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>;,
 intel-gfx@lists.freedesktop.org;, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 04/18] drm/i915/guc: Keep iosys_map of
 ads_blob around
Message-ID: <20220210225613.GA4707@msatwood-mobl>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
 <20220208104524.2516209-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220208104524.2516209-5-lucas.demarchi@intel.com>
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

On Tue, Feb 08, 2022 at 02:45:10AM -0800, Lucas De Marchi wrote:
> Convert intel_guc_ads_create() and initialization to use iosys_map
> rather than plain pointer and save it in the guc struct. This will help
> with additional updates to the ads_blob after the
> creation/initialization by abstracting the IO vs system memory.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h     | 4 +++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 6 ++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 697d9d66acef..9b9ba79f7594 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -6,8 +6,9 @@
>  #ifndef _INTEL_GUC_H_
>  #define _INTEL_GUC_H_
>  
> -#include <linux/xarray.h>
>  #include <linux/delay.h>
> +#include <linux/iosys-map.h>
> +#include <linux/xarray.h>
>  
>  #include "intel_uncore.h"
>  #include "intel_guc_fw.h"
> @@ -148,6 +149,7 @@ struct intel_guc {
>  	struct i915_vma *ads_vma;
>  	/** @ads_blob: contents of the GuC ADS */
>  	struct __guc_ads_blob *ads_blob;
> +	struct iosys_map ads_map;
>  	/** @ads_regset_size: size of the save/restore regsets in the ADS */
>  	u32 ads_regset_size;
>  	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index e61150adcbe9..13671b186908 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -624,6 +624,11 @@ int intel_guc_ads_create(struct intel_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
> +		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
> +	else
> +		iosys_map_set_vaddr(&guc->ads_map, guc->ads_blob);
> +
>  	__guc_ads_init(guc);
>  
>  	return 0;
> @@ -645,6 +650,7 @@ void intel_guc_ads_destroy(struct intel_guc *guc)
>  {
>  	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
>  	guc->ads_blob = NULL;
> +	iosys_map_clear(&guc->ads_map);
>  }
>  
>  static void guc_ads_private_data_reset(struct intel_guc *guc)
> -- 
> 2.35.1
> 
