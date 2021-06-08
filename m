Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B0039EFD6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041A26EB0F;
	Tue,  8 Jun 2021 07:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38F6EB0D;
 Tue,  8 Jun 2021 07:41:08 +0000 (UTC)
IronPort-SDR: sKvOhhDHfl2w93GgNfnAAzx9xLjEHyBOIVDHNnzEQjxDwj7cmLCpRXjRnW53Ic2j9rdZ65lxZG
 YAQtRwJhmXYg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226133050"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226133050"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:41:07 -0700
IronPort-SDR: kHVD6k15MeVjNlcHfoQ9wTGzp2A44FP/+b3mePK8bR38cDihlrygJzfgsRjVxvYH0TTbhWotfN
 G6R4INcEIPBg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="418809532"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:41:05 -0700
Message-ID: <f0f8cbfa1aafdb26ce122ed7c3bd62022a06f35b.camel@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/i915/ttm: restore min_page_size behaviour
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 09:41:03 +0200
In-Reply-To: <20210607182210.99036-7-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
> We now have bo->page_alignment which perfectly describes what we need
> if
> we have min page size restrictions for lmem. We can also drop the
> flag
> here, since this is the default behaviour for all objects.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 3 +--
>  drivers/gpu/drm/i915/intel_memory_region.h   | 3 +--
>  drivers/gpu/drm/i915/intel_region_ttm.c      | 2 +-
>  drivers/gpu/drm/i915/selftests/mock_region.c | 2 +-
>  4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 3f5624f36afc..eda6c258ea92 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -684,9 +684,8 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>          */
>         obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>         ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> -                         bo_type, &i915_sys_placement, PAGE_SIZE,
> +                         bo_type, &i915_sys_placement, mem-
> >min_page_size,

Page size units here as well.

>                           true, NULL, NULL, i915_ttm_bo_destroy);
> -
>         if (!ret)
>                 obj->ttm.created = true;
>  
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h
> b/drivers/gpu/drm/i915/intel_memory_region.h
> index b04fb22726d9..2be8433d373a 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -40,8 +40,7 @@ enum intel_region_id {
>  #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
>  #define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
>  
> -#define I915_ALLOC_MIN_PAGE_SIZE  BIT(0)
> -#define I915_ALLOC_CONTIGUOUS     BIT(1)
> +#define I915_ALLOC_CONTIGUOUS     BIT(0)
>  
>  #define for_each_memory_region(mr, i915, id) \
>         for (id = 0; id < ARRAY_SIZE((i915)->mm.regions); id++) \
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
> b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 23af995f7b67..59fa78225852 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -153,7 +153,7 @@ intel_region_ttm_node_alloc(struct
> intel_memory_region *mem,
>         int ret;
>  
>         mock_bo.base.size = size;
> -       mock_bo.page_alignment = PAGE_SIZE;
> +       mock_bo.page_alignment = mem->min_page_size;

And here.

>         place.flags = flags;
>  
>         ret = man->func->alloc(man, &mock_bo, &place, &res);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c
> b/drivers/gpu/drm/i915/selftests/mock_region.c
> index d3e4e6573cb9..6ce0f9dacad7 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_region.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_region.c
> @@ -28,7 +28,7 @@ static int mock_region_get_pages(struct
> drm_i915_gem_object *obj)
>         struct sg_table *pages;
>         int err;
>  
> -       flags = I915_ALLOC_MIN_PAGE_SIZE;
> +       flags = 0;
>         if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
>                 flags |= TTM_PL_FLAG_CONTIGUOUS;
>  


