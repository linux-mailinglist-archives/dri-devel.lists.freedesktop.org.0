Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399046BC30
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 14:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1DE6EA43;
	Tue,  7 Dec 2021 13:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912356EA43;
 Tue,  7 Dec 2021 13:10:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237797568"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="237797568"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 05:10:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="502585172"
Received: from dhussain-mobl.ger.corp.intel.com (HELO [10.213.195.7])
 ([10.213.195.7])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 05:10:14 -0800
Message-ID: <1a8431eb-566d-ac2b-85b7-31c590ec84ff@linux.intel.com>
Date: Tue, 7 Dec 2021 13:10:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH v9 2/8] drm/i915/ttm: add tt shmem backend
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211018091055.1998191-1-matthew.auld@intel.com>
 <20211018091055.1998191-2-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211018091055.1998191-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/10/2021 10:10, Matthew Auld wrote:
> For cached objects we can allocate our pages directly in shmem. This
> should make it possible(in a later patch) to utilise the existing
> i915-gem shrinker code for such objects. For now this is still disabled.
> 
> v2(Thomas):
>    - Add optional try_to_writeback hook for objects. Importantly we need
>      to check if the object is even still shrinkable; in between us
>      dropping the shrinker LRU lock and acquiring the object lock it could for
>      example have been moved. Also we need to differentiate between
>      "lazy" shrinking and the immediate writeback mode. Also later we need to
>      handle objects which don't even have mm.pages, so bundling this into
>      put_pages() would require somehow handling that edge case, hence
>      just letting the ttm backend handle everything in try_to_writeback
>      doesn't seem too bad.
> v3(Thomas):
>    - Likely a bad idea to touch the object from the unpopulate hook,
>      since it's not possible to hold a reference, without also creating
>      circular dependency, so likely this is too fragile. For now just
>      ensure we at least mark the pages as dirty/accessed when called from the
>      shrinker on WILLNEED objects.
>    - s/try_to_writeback/shrinker_release_pages, since this can do more
>      than just writeback.
>    - Get rid of do_backup boolean and just set the SWAPPED flag prior to
>      calling unpopulate.
>    - Keep shmem_tt as lowest priority for the TTM LRU bo_swapout walk, since
>      these just get skipped anyway. We can try to come up with something
>      better later.
> v4(Thomas):
>    - s/PCI_DMA/DMA/. Also drop NO_KERNEL_MAPPING and NO_WARN, which
>      apparently doesn't do anything with streaming mappings.
>    - Just pass along the error for ->truncate, and assume nothing.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Oak Zeng <oak.zeng@intel.com>

[snip]

> -static void try_to_writeback(struct drm_i915_gem_object *obj,
> -			     unsigned int flags)
> +static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
>   {
> +	if (obj->ops->shrinker_release_pages)
> +		return obj->ops->shrinker_release_pages(obj,
> +							flags & I915_SHRINK_WRITEBACK);

I have a high level question about how does this new vfunc fit with the existing code.

Because I notice in the implementation (i915_ttm_shrinker_release_pages) it ends up doing:
...

        switch (obj->mm.madv) {
        case I915_MADV_DONTNEED:
                return i915_ttm_purge(obj);
        case __I915_MADV_PURGED:
                return 0;
        }

... and then...

        if (should_writeback)
                __shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);

Which on a glance looks like a possible conceptual duplication of the concepts in this very function (try_to_writeback):

> +
>   	switch (obj->mm.madv) {
>   	case I915_MADV_DONTNEED:
>   		i915_gem_object_truncate(obj);
> -		return;
> +		return 0;
>   	case __I915_MADV_PURGED:
> -		return;
> +		return 0;
>   	}
>   
>   	if (flags & I915_SHRINK_WRITEBACK)
>   		i915_gem_object_writeback(obj);

So question is this the final design or some futher tidy is possible/planned?

Background to my question is that I will float a patch which proposes to remove writeback altogether. There are reports from the fields that it causes deadlocks and looking at 2d6692e642e7 ("drm/i915: Start writeback from the shrinker") and its history it seems like it was a known risk.

Apart from the code organisation questions, on the practical level - do you need writeback from the TTM backend or while I am proposing to remove it from the "legacy" paths, I can propose removing it from the TTM flow as well?

Regards,

Tvrtko
