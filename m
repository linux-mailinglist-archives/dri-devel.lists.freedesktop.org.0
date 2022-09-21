Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702515BFA67
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 11:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246B810E8F7;
	Wed, 21 Sep 2022 09:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34E310E827;
 Wed, 21 Sep 2022 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663751597; x=1695287597;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DM80QHp6RwAbqP3sUL9OGTNrV/BpD7+nK2QN2tSI32s=;
 b=Oq4cVmBhWO99YRj+KPFOvpUX5bDv6o7UE+uALWxGwa+3RrQgkKAAonGY
 QUJfEJsh5qtCO5y8fGarjCUswmgUc/4HYxzx6LmtrGKADGOSln7YxW1qy
 1c3LnnHMhWmcysWE6pD0f3K36vMoM7xzRpyONUQ3qlMG4PV9edksdqOxM
 s1xOjGLFzOcIck3h/CXJGRUqiWX/Gf3vzwqyz50NAT1Ga2IDv34bxxfnB
 a/lCWTpbZjycMGiI4N0wRJ7yTUm3b4yNJpHDKpeVpupYuBK5UUKjAohuW
 rlLtWlQONxgg+HDti7E109pM15zth9/0MX8VeV4TuDu70jZayaLQRbQ5a Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="287020988"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="287020988"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 02:13:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="614734630"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO [10.213.205.22])
 ([10.213.205.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 02:13:15 -0700
Message-ID: <578445bc-d804-3f1d-a32d-51cac9460351@linux.intel.com>
Date: Wed, 21 Sep 2022 10:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [RFC v4 03/14] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-4-niranjana.vishwanathapura@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220921070945.27764-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: daniel.vetter@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@intel.com, paulo.r.zanoni@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
> Expose i915_gem_object_max_page_size() function non-static
> which will be used by the vm_bind feature.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 20 +++++++++++++++-----
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>   2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 33673fe7ee0a..3b3ab4abb0a3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -11,14 +11,24 @@
>   #include "pxp/intel_pxp.h"
>   
>   #include "i915_drv.h"
> +#include "i915_gem_context.h"

I can't spot that you are adding any code which would need this? 
I915_GTT_PAGE_SIZE_4K? It is in intel_gtt.h.

>   #include "i915_gem_create.h"
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
>   
> -static u32 object_max_page_size(struct intel_memory_region **placements,
> -				unsigned int n_placements)
> +/**
> + * i915_gem_object_max_page_size() - max of min_page_size of the regions
> + * @placements:  list of regions
> + * @n_placements: number of the placements
> + *
> + * Calculates the max of the min_page_size of a list of placements passed in.
> + *
> + * Return: max of the min_page_size
> + */
> +u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
> +				  unsigned int n_placements)
>   {
> -	u32 max_page_size = 0;
> +	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>   	int i;
>   
>   	for (i = 0; i < n_placements; i++) {
> @@ -28,7 +38,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
>   		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>   	}
>   
> -	GEM_BUG_ON(!max_page_size);
>   	return max_page_size;
>   }
>   
> @@ -99,7 +108,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
>   
>   	i915_gem_flush_free_objects(i915);
>   
> -	size = round_up(size, object_max_page_size(placements, n_placements));
> +	size = round_up(size, i915_gem_object_max_page_size(placements,
> +							    n_placements));
>   	if (size == 0)
>   		return ERR_PTR(-EINVAL);

Because of the changes above this path is now unreachable. I suppose it 
was meant to tell the user "you have supplied no placements"? But then 
GEM_BUG_ON (which you remove) used to be wrong.

Regards,

Tvrtko

>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 7317d4102955..8c97bddad921 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>   }
>   
>   void i915_gem_init__objects(struct drm_i915_private *i915);
> +u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
> +				  unsigned int n_placements);
>   
>   void i915_objects_module_exit(void);
>   int i915_objects_module_init(void);
