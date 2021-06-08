Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47539EFD2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCC56EB03;
	Tue,  8 Jun 2021 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3E6EB03;
 Tue,  8 Jun 2021 07:40:05 +0000 (UTC)
IronPort-SDR: Kxc1Ou8zh4VOgBueZmKXmCkYtzEeo8cMFIgaa/0nsldF83NH8CsPO3/DVxgrkpk/UypNmODLvc
 wZU9lWUA7iKA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204605927"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204605927"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:40:02 -0700
IronPort-SDR: GgfC07aVKe5jpiWdewHbG0l49J8VZfusRbVuC7rhtHqhL2HWwnlRkSqmt6wjC35bO22ci3rUQo
 JHfRHAfzqUyg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="413296834"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:40:01 -0700
Message-ID: <b741db2d0b50b634a995d6f7bbfbf70b35818850.camel@linux.intel.com>
Subject: Re: [PATCH 5/6] drm/i915/ttm: switch over to ttm_buddy_man
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 09:39:58 +0200
In-Reply-To: <20210607182210.99036-6-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-6-matthew.auld@intel.com>
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
> Move back to the buddy allocator for managing device local memory,
> and
> restore the lost mock selftests. Keep around the range manager
> related
> bits, since we likely need this for managing stolen at some point.
> For
> stolen we also don't need to reserve anything so no need to support a
> generic reserve interface.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  26 +--
>  drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-----
>  drivers/gpu/drm/i915/intel_memory_region.h    |  17 --
>  drivers/gpu/drm/i915/intel_region_ttm.c       | 100 +++--------
>  .../drm/i915/selftests/intel_memory_region.c  | 170 ++++++++++++----
> --
> 

...

>  
>  static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> @@ -661,20 +661,8 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>         static struct lock_class_key lock_class;
>         struct drm_i915_private *i915 = mem->i915;
>         enum ttm_bo_type bo_type;
> -       size_t alignment = 0;
>         int ret;
>  
> -       /* Adjust alignment to GPU- and CPU huge page sizes. */
> -
> -       if (mem->is_range_manager) {
> -               if (size >= SZ_1G)
> -                       alignment = SZ_1G >> PAGE_SHIFT;
> -               else if (size >= SZ_2M)
> -                       alignment = SZ_2M >> PAGE_SHIFT;
> -               else if (size >= SZ_64K)
> -                       alignment = SZ_64K >> PAGE_SHIFT;
> -       }
> -
>         drm_gem_private_object_init(&i915->drm, &obj->base, size);
>         i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class,
> flags);
>         i915_gem_object_init_memory_region(obj, mem);
> @@ -696,7 +684,7 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>          */
>         obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>         ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> -                         bo_type, &i915_sys_placement, alignment,
> +                         bo_type, &i915_sys_placement, PAGE_SIZE,

Actually just realized that the alignment is specified in PAGE_SIZE
units, so above should be s/PAGE_SIZE/1/. Might need to check that the
buddy TTM interface gets this right as well.


