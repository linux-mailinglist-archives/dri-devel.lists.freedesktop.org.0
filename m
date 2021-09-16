Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0340DB9F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C18D6EDD0;
	Thu, 16 Sep 2021 13:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DF36EDD0;
 Thu, 16 Sep 2021 13:46:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="202063484"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202063484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:46:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="700620639"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO [10.249.254.218])
 ([10.249.254.218])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:46:03 -0700
Message-ID: <eea198e7003983b3bd77b23c2f70cd366afa507f.camel@linux.intel.com>
Subject: Re: [PATCH v3 08/12] drm/i915/ttm: add tt shmem backend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Thu, 16 Sep 2021 15:45:59 +0200
In-Reply-To: <20210915185954.3114858-8-matthew.auld@intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-09-15 at 19:59 +0100, Matthew Auld wrote:
> For cached objects we can allocate our pages directly in shmem. This
> should make it possible(in a later patch) to utilise the existing
> i915-gem shrinker code for such objects. For now this is still
> disabled.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |   8 +
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  14 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 217 ++++++++++++++++++-
> --
>  3 files changed, 209 insertions(+), 30 deletions(-)
> 
> 

...

>  }
> @@ -223,6 +349,10 @@ static bool i915_ttm_eviction_valuable(struct
> ttm_buffer_object *bo,
>  {
>         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>  
> +       if (place->mem_type == TTM_PL_SYSTEM &&
> +           bo->ttm && bo->ttm->page_flags & I915_TTM_TT_SHMEM)
> +               return false;
> +


Should we use ttm_bo_pin() / ttm_bo_unpin() to remove the bo from the
TTM LRU lists when it's SHMEM populated, and change the above to a
GEM_BUG_ON()?


>         /* Will do for now. Our pinned objects are still on TTM's LRU
> lists */
>         return i915_gem_object_evictable(obj);
>  }
> @@ -316,9 +446,11 @@ static void
> i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
>         i915_gem_object_set_cache_coherency(obj, cache_level);
>  }
>  
> -static void i915_ttm_purge(struct drm_i915_gem_object *obj)
> +static void i915_ttm_writeback(struct drm_i915_gem_object *obj)
>  {
>         struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +       struct i915_ttm_tt *i915_tt =
> +               container_of(bo->ttm, typeof(*i915_tt), ttm);
>         struct ttm_operation_ctx ctx = {
>                 .interruptible = true,
>                 .no_wait_gpu = false,
> @@ -326,18 +458,52 @@ static void i915_ttm_purge(struct
> drm_i915_gem_object *obj)
>         struct ttm_placement place = {};
>         int ret;
>  
> -       if (obj->mm.madv == __I915_MADV_PURGED)
> +       if (!bo->ttm || !(bo->ttm->page_flags & I915_TTM_TT_SHMEM))
>                 return;
>  
> -       /* TTM's purge interface. Note that we might be reentering.
> */
> +       i915_tt->backup = true;
>         ret = ttm_bo_validate(bo, &place, &ctx);

It looks like writeback() becomes the backend's primary callback for
shrinking, although for the shmem backend, this is put_pages(), and the
writeback() callback is only called if needed to accelerate shmem's
transfer of pages to the swap cache. It appears like this will break
the shrinker reporting of shrunken pages?

Should we try to do the primary shrinking from the put_pages() callback
instead, like the shmem backend? Although we'd have to allow NULL pages
in put_pages() to account for evicted-to-shmem and adjust other
backends if necessary.



> -       if (!ret) {
> -               obj->write_domain = 0;
> -               obj->read_domains = 0;
> -               i915_ttm_adjust_gem_after_move(obj);
> -               i915_ttm_free_cached_io_st(obj);
> -               obj->mm.madv = __I915_MADV_PURGED;
> +       i915_tt->backup = false;
> +       if (ret)
> +               return;
> +
> +       __shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
> +}
> +


