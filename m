Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0533B00F4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 12:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275E6E47A;
	Tue, 22 Jun 2021 10:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77366E0DD;
 Tue, 22 Jun 2021 10:07:37 +0000 (UTC)
IronPort-SDR: HVqPe6tMGnIS8s67xqhFPR6ptB2H7+nxG6+4l3Cjki5vsfdBLbAHaoBwmtPyl0hnJAgmo8z17D
 1jLxyA+Gs2Ww==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206844589"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="206844589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 03:07:35 -0700
IronPort-SDR: suGCEBjZczJBBpC3tr04hYCkQYalzuz7eKBXLe388us1v7BklKiEMgwEfDtyZlDZcAokYQeYtk
 3Usoxc1mvPow==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="623416908"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.95])
 ([10.249.254.95])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 03:07:34 -0700
Subject: Re: [Intel-gfx] [PATCH v7 2/3] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
 <20210622093418.153400-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMWG4tGSHDGzuKw+qC5D-PoXzfDJa_QCdwpn=p20fkC4Q@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <81eff799-996d-cf3d-c734-94d0beacd475@linux.intel.com>
Date: Tue, 22 Jun 2021 12:07:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMWG4tGSHDGzuKw+qC5D-PoXzfDJa_QCdwpn=p20fkC4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/21 11:44 AM, Matthew Auld wrote:
> On Tue, 22 Jun 2021 at 10:34, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> After a TTM move or object init we need to update the i915 gem flags and
>> caching settings to reflect the new placement. Currently caching settings
>> are not changed during the lifetime of an object, although that might
>> change moving forward if we run into performance issues or issues with
>> WC system page allocations.
>> Also introduce gpu_binds_iomem() and cpu_maps_iomem() to clean up the
>> various ways we previously used to detect this.
>> Finally, initialize the TTM object reserved to be able to update
>> flags and caching before anyone else gets hold of the object.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>> v6:
>> - Rebase on accelerated ttm moves.
>> ---
> <snip>
>
>> @@ -775,14 +845,13 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>          i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
>>          i915_gem_object_init_memory_region(obj, mem);
>>          i915_gem_object_make_unshrinkable(obj);
>> -       obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
>> -       obj->mem_flags |= I915_BO_FLAG_IOMEM;
>> -       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>>          INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
>>          mutex_init(&obj->ttm.get_io_page.lock);
>>          bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
>>                  ttm_bo_type_kernel;
>>
>> +       obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>> +
>>          /*
>>           * If this function fails, it will call the destructor, but
>>           * our caller still owns the object. So no freeing in the
>> @@ -790,14 +859,16 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>           * Similarly, in delayed_destroy, we can't call ttm_bo_put()
>>           * until successful initialization.
>>           */
>> -       obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>> -       ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>> -                         bo_type, &i915_sys_placement,
>> -                         mem->min_page_size >> PAGE_SHIFT,
>> -                         true, NULL, NULL, i915_ttm_bo_destroy);
>> -       if (!ret)
>> -               obj->ttm.created = true;
>> -
>> -       /* i915 wants -ENXIO when out of memory region space. */
>> -       return i915_ttm_err_to_gem(ret);
>> +       ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
>> +                                  bo_type, &i915_sys_placement, 1,
> mem->min_page_size >> PAGE_SHIFT? Although just realised that looks
> iffy since it only considers the current region, when it should
> consider all future placements. I wonder if it makes sense to make
> page_alignment part of ttm_place? Anyway, it doesn't matter for this
> series.

Good catch. Yes completely agree it should be part of ttm_place. But 
extending ttm_place and audit all drivers to always clear unused parts 
of ttm_place is a big task.

But it's also the case that the region manager is allowed to enforce an 
alignment, unknown to us here, so we might want to take that approach to 
begin with?

/Thomas


