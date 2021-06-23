Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96B3B1A7F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982446E8D8;
	Wed, 23 Jun 2021 12:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA3F6E0E6;
 Wed, 23 Jun 2021 12:50:50 +0000 (UTC)
IronPort-SDR: Iuk2AAT54learJ4rKCx+8+AY7s2gxsD+fW1BIKsPqkYRPjQ6fGFxIQVRZtIS9VhIejIaAd6E08
 Cjlp+TV0XUjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207294468"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207294468"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:50:49 -0700
IronPort-SDR: b38MtDZ3FnbELNUJNBkrxwtq4E/3l8qOxkxI64emgzJHFqLdIFYcYEc8sisV3LgChlviTbgk2H
 WChcuKmWvm1Q==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="623829990"
Received: from asortkjx-mobl.ger.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:50:48 -0700
Message-ID: <c8f4daeaba546d20c63ee4a7fb2c99824a319df9.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/ttm: consider all placements for the page
 alignment
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 23 Jun 2021 14:50:46 +0200
In-Reply-To: <20210623112637.266855-1-matthew.auld@intel.com>
References: <20210623112637.266855-1-matthew.auld@intel.com>
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

On Wed, 2021-06-23 at 12:26 +0100, Matthew Auld wrote:
> Just checking the current region is not enough, if we later migrate
> the
> object somewhere else. For example if the placements are {SMEM,
> LMEM},
> then we might get this wrong. Another idea might be to make the
> page_alignment part of the ttm_place, instead of the BO.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index c5deb8b7227c..5d894bba6430 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -753,6 +753,25 @@ void i915_ttm_bo_destroy(struct
> ttm_buffer_object *bo)
>                 call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
>  }
>  
> +static u64 i915_gem_object_page_size(struct drm_i915_gem_object
> *obj)
> +{
> +       u64 page_size;
> +       int i;
> +
> +       if (!obj->mm.n_placements)
> +               return obj->mm.region->min_page_size;
> +
> +       page_size = 0;
> +       for (i = 0; i < obj->mm.n_placements; i++) {
> +               struct intel_memory_region *mr = obj-
> >mm.placements[i];
> +
> +               page_size = max_t(u64, mr->min_page_size, page_size);
> +       }
> +
> +       GEM_BUG_ON(!page_size);
> +       return page_size;
> +}
> +

I think if at all possible, we really should try to avoid the above.
Could we, just like in your next patch, perhaps set alignment to 0,
indicating that we don't care at the per-object level and something
else, indicating that we care.

Then the manager could use its default if we don't care and the
indicated alignment, even if it's less, if we care at the per object
level? 

/Thomas

>  /**
>   * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem
> object
>   * @mem: The initial memory region for the object.
> @@ -793,7 +812,7 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>         obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>         ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>                           bo_type, &i915_sys_placement,
> -                         mem->min_page_size >> PAGE_SHIFT,
> +                         i915_gem_object_page_size(obj) >>
> PAGE_SHIFT,





>                           true, NULL, NULL, i915_ttm_bo_destroy);
>         if (!ret)
>                 obj->ttm.created = true;


