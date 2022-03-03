Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7624CBA8F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532610EB63;
	Thu,  3 Mar 2022 09:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB12C10EB67;
 Thu,  3 Mar 2022 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646300627; x=1677836627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zVX50NFdi+VxG/cQmVV62ujoAxENMsgIfq9kHlchIPc=;
 b=fxEGd0NldsTOxJA70P5HAvFi5N8c/7f89Lgddx1XbodqNGYvo1sP+tHf
 7bJO6vfNeiJhh3GNocP3/uHeFovaMblDFQXZmgoX3vtQYkyQyctTR74ZI
 Fn8/+TDPuOiNJ/RqLmxupDW8rQ87GkunAY5zx2zVjipkcLeype1gJ6wYO
 wC/D4a84pzF7Z0h+GylCRkWVOXS4/F0UQsdHVRobsBEnRfQdmrX8/K57i
 gmgvIPp3pkSJK/pl9MqTklZGG7tZw+wq2py52hvFUyTKTFbZOuo6GiaxE
 V6LBTaxfLt4GTudVBYMgJuPxpOCWL9mqoSlLpBhmKdOH23th/iohWytrj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="314346958"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="314346958"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:43:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="551683455"
Received: from bjoseph-mobl.ger.corp.intel.com (HELO localhost) ([10.252.1.89])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:43:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 06/15] drm/i915: enforce min GTT alignment
 for discrete cards
In-Reply-To: <20220218184752.7524-7-ramalingam.c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220218184752.7524-1-ramalingam.c@intel.com>
 <20220218184752.7524-7-ramalingam.c@intel.com>
Date: Thu, 03 Mar 2022 11:43:41 +0200
Message-ID: <87zgm74bhu.fsf@intel.com>
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, lucas.demarchi@intel.com,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 19 Feb 2022, Ramalingam C <ramalingam.c@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 8073438b67c8..6cd518a3277c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -29,6 +29,8 @@
>  #include "i915_selftest.h"
>  #include "i915_vma_resource.h"
>  #include "i915_vma_types.h"
> +#include "i915_params.h"

Do you need this? Avoid includes from includes.

> +#include "intel_memory_region.h"
>  
>  #define I915_GFP_ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
>  
> @@ -223,6 +225,7 @@ struct i915_address_space {
>  	struct device *dma;
>  	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
>  	u64 reserved;		/* size addr space reserved */
> +	u64 min_alignment[INTEL_MEMORY_STOLEN_LOCAL + 1];
>  
>  	unsigned int bind_async_flags;
>  
> @@ -384,6 +387,25 @@ i915_vm_has_scratch_64K(struct i915_address_space *vm)
>  	return vm->scratch_order == get_order(I915_GTT_PAGE_SIZE_64K);
>  }
>  
> +static inline u64 i915_vm_min_alignment(struct i915_address_space *vm,
> +					enum intel_memory_type type)
> +{
> +	/* avoid INTEL_MEMORY_MOCK overflow */
> +	if ((int)type >= ARRAY_SIZE(vm->min_alignment))
> +		type = INTEL_MEMORY_SYSTEM;
> +
> +	return vm->min_alignment[type];
> +}
> +
> +static inline u64 i915_vm_obj_min_alignment(struct i915_address_space *vm,
> +					    struct drm_i915_gem_object  *obj)
> +{
> +	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
> +	enum intel_memory_type type = mr ? mr->type : INTEL_MEMORY_SYSTEM;
> +
> +	return i915_vm_min_alignment(vm, type);
> +}
> +

Is it performance critical that these two functions are inlines, and
warrant including more headers from headers, complicating the
interdependent mess that the gem/gt includes already are?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
