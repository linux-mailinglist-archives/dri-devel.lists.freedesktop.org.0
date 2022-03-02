Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38FC4CA562
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 13:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3C710EE2C;
	Wed,  2 Mar 2022 12:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D734710EE2A;
 Wed,  2 Mar 2022 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646225926; x=1677761926;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2sojShHFWJBpfTZe48MRTdRksU5WEDnW17smp4kzJQc=;
 b=LAFpDjAlLAPnRG/inOFv+xxtd3cEObPo+vGXaVPZQqD8f7I+/h6P4RcI
 Kx945jLLD7Mnc/VAhLz8H3BeTts7scb4F41kFKzzfglS7rUQ3dXPeomWy
 UP3YroWf9TbY48lEx9ePYkSCxz1M6qjWc0gSzEfXg4I6sQDSqWo+WJJlL
 h/1R+IW0SeH93oiR2fRItDY85m0A+7EgA50EcA7Ax1QfGtOahWEG1Ap20
 GMcJYRCzkUfTA35Q45NCM2kRAveKaM+pbhtpLenQW4SmtNC1ty6OVpO5v
 BL89mDb/GwNcgkQa7+p6jQMBYJFAbjUrosLBkhBKFxcabAckVCFN0k5Rj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253586314"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="253586314"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 04:58:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="576096175"
Received: from ccrisan-mobl3.ger.corp.intel.com (HELO [10.249.254.224])
 ([10.249.254.224])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 04:58:44 -0800
Message-ID: <4f9ed1b444ca8f861b9a8a179790b0287c6ae077.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/4] drm/i915/gem: Extra pages in ttm_tt for ccs data
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Date: Wed, 02 Mar 2022 13:58:42 +0100
In-Reply-To: <20220301215334.20543-4-ramalingam.c@intel.com>
References: <20220301215334.20543-1-ramalingam.c@intel.com>
 <20220301215334.20543-4-ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-03-02 at 03:23 +0530, Ramalingam C wrote:
> On Xe-HP and later devices, we use dedicated compression control
> state (CCS) stored in local memory for each surface, to support the
> 3D and media compression formats.
> 
> The memory required for the CCS of the entire local memory is 1/256
> of
> the local memory size. So before the kernel boot, the required memory
> is reserved for the CCS data and a secure register will be programmed
> with the CCS base address
> 
> So when we allocate a object in local memory we dont need to
> explicitly
> allocate the space for ccs data. But when we evict the obj into the
> smem to hold the compression related data along with the obj we need
> smem space of obj_size + (obj_size/256).
> 
> Hence when we create smem for an obj with lmem placement possibility
> we
> create with the extra space.

Nit: Again imperative wording, 


> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Christian Koenig <christian.koenig@amd.com>
> cc: Hellstrom Thomas <thomas.hellstrom@intel.com>

Reviewed by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 1a8262f5f692..c7a36861c38d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -20,6 +20,7 @@
>  #include "gem/i915_gem_ttm.h"
>  #include "gem/i915_gem_ttm_move.h"
>  #include "gem/i915_gem_ttm_pm.h"
> +#include "gt/intel_gpu_commands.h"
>  
>  #define I915_TTM_PRIO_PURGE     0
>  #define I915_TTM_PRIO_NO_PAGES  1
> @@ -255,12 +256,27 @@ static const struct i915_refct_sgt_ops
> tt_rsgt_ops = {
>         .release = i915_ttm_tt_release
>  };
>  
> +static inline bool
> +i915_gem_object_has_lmem_placement(struct drm_i915_gem_object *obj)
> +{
> +       int i;
> +
> +       for (i = 0; i < obj->mm.n_placements; i++)
> +               if (obj->mm.placements[i]->type ==
> INTEL_MEMORY_LOCAL)
> +                       return true;
> +
> +       return false;
> +}
> +
>  static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object
> *bo,
>                                          uint32_t page_flags)
>  {
> +       struct drm_i915_private *i915 = container_of(bo->bdev,
> typeof(*i915),
> +                                                    bdev);
>         struct ttm_resource_manager *man =
>                 ttm_manager_type(bo->bdev, bo->resource->mem_type);
>         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +       unsigned long ccs_pages = 0;
>         enum ttm_caching caching;
>         struct i915_ttm_tt *i915_tt;
>         int ret;
> @@ -283,7 +299,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct
> ttm_buffer_object *bo,
>                 i915_tt->is_shmem = true;
>         }
>  
> -       ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
> +       if (HAS_FLAT_CCS(i915) &&
> i915_gem_object_has_lmem_placement(obj))
> +               ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
> +                                                    
> NUM_BYTES_PER_CCS_BYTE),
> +                                        PAGE_SIZE);
> +
> +       ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching,
> ccs_pages);
>         if (ret)
>                 goto err_free;
>  


