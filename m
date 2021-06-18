Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F683ACC8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CCB6EA09;
	Fri, 18 Jun 2021 13:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7C6EA09;
 Fri, 18 Jun 2021 13:44:24 +0000 (UTC)
IronPort-SDR: yxEEwlM1itU5BakruY1nRumZmT/PPds/a2yLkb/dZt/qRHGqWhJfxe9MOpj0rzMpd8amjEFhFC
 EyWFgBpUru4A==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="267698951"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="267698951"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:44:23 -0700
IronPort-SDR: WPjJrZev67LxkfwPgucuda8GEBs/hZSnZPmabUZ2Z6M21oXtSVjlQ/vWQdydxq2tyAFqc3z60b
 yqLCIioCeFnA==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="638160330"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.60])
 ([10.249.254.60])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:44:22 -0700
Subject: Re: [PATCH 2/2] drm/i915: add back the avail tracking
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210618133150.700375-1-matthew.auld@intel.com>
 <20210618133150.700375-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <fc9d656c-ec77-8522-8cd5-3ec492b8f236@linux.intel.com>
Date: Fri, 18 Jun 2021 15:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618133150.700375-2-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/18/21 3:31 PM, Matthew Auld wrote:
> Looks like it got lost along the way, so add it back. This is needed for
> the region query uAPI where we need to report an accurate available size
> for lmem.

Hmm. How is this uAPI intended to work in a multi-client environment 
where the returned value can be nothing but a snapshot of the current 
state, that can't be relied upon?

> This time around let's push it directly into the allocator, which
> simplifies things, like not having to care about internal fragmentation,
> or having to remember to track things for all possible interfaces that
> might want to allocate or reserve pages.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_buddy.c             |  6 ++++++
>   drivers/gpu/drm/i915/i915_buddy.h             |  1 +
>   drivers/gpu/drm/i915/i915_debugfs.c           |  5 +++--
>   drivers/gpu/drm/i915/i915_query.c             |  2 +-
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++++
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  2 ++
>   drivers/gpu/drm/i915/intel_memory_region.c    |  8 ++++++++
>   drivers/gpu/drm/i915/intel_memory_region.h    |  4 ++++
>   8 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
> index 29dd7d0310c1..27cd2487a18f 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.c
> +++ b/drivers/gpu/drm/i915/i915_buddy.c
> @@ -80,6 +80,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>   	size = round_down(size, chunk_size);
>   
>   	mm->size = size;
> +	mm->avail = size;
>   	mm->chunk_size = chunk_size;
>   	mm->max_order = ilog2(size) - ilog2(chunk_size);
>   
> @@ -159,6 +160,8 @@ void i915_buddy_fini(struct i915_buddy_mm *mm)
>   		i915_block_free(mm, mm->roots[i]);
>   	}
>   
> +	GEM_WARN_ON(mm->avail != mm->size);
> +
>   	kfree(mm->roots);
>   	kfree(mm->free_list);
>   	kmem_cache_destroy(mm->slab_blocks);
> @@ -235,6 +238,7 @@ void i915_buddy_free(struct i915_buddy_mm *mm,
>   		     struct i915_buddy_block *block)
>   {
>   	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
> +	mm->avail += i915_buddy_block_size(mm, block);
>   	__i915_buddy_free(mm, block);
>   }
>   
> @@ -288,6 +292,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
>   	}
>   
>   	mark_allocated(block);
> +	mm->avail -= i915_buddy_block_size(mm, block);
>   	kmemleak_update_trace(block);
>   	return block;
>   
> @@ -373,6 +378,7 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>   			}
>   
>   			mark_allocated(block);
> +			mm->avail -= i915_buddy_block_size(mm, block);
>   			list_add_tail(&block->link, &allocated);
>   			continue;
>   		}
> diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
> index 37f8c42071d1..feb7c1bb6244 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.h
> +++ b/drivers/gpu/drm/i915/i915_buddy.h
> @@ -70,6 +70,7 @@ struct i915_buddy_mm {
>   	/* Must be at least PAGE_SIZE */
>   	u64 chunk_size;
>   	u64 size;
> +	u64 avail;
>   };
>   
>   static inline u64
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index cc745751ac53..4765f220469e 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -246,8 +246,9 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
>   		   atomic_read(&i915->mm.free_count),
>   		   i915->mm.shrink_memory);
>   	for_each_memory_region(mr, i915, id)
> -		seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
> -			   mr->name, &mr->total, &mr->avail);
> +		seq_printf(m, "%s: total:%pa, available:%llu bytes\n",
> +			   mr->name, &mr->total,
> +			   intel_memory_region_get_avail(mr));
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index e49da36c62fb..f10dcea94ac9 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -465,7 +465,7 @@ static int query_memregion_info(struct drm_i915_private *i915,
>   		info.region.memory_class = mr->type;
>   		info.region.memory_instance = mr->instance;
>   		info.probed_size = mr->total;
> -		info.unallocated_size = mr->avail;
> +		info.unallocated_size = intel_memory_region_get_avail(mr);
>   
>   		if (__copy_to_user(info_ptr, &info, sizeof(info)))
>   			return -EFAULT;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index fc7ad5c035b8..562d11edc5e4 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -246,3 +246,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   	return ret;
>   }
>   
> +/**
> + * i915_ttm_buddy_man_avail - Get the currently available size
> + * @man: The buddy allocator ttm manager
> + *
> + * Return: The available size in bytes
> + */
> +u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man)
> +{
> +	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
> +	struct i915_buddy_mm *mm = &bman->mm;
> +
> +	return mm->avail;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index 26026213e20a..39f5b1a4c3e7 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -53,4 +53,6 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev,
>   int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   			       u64 start, u64 size);
>   
> +u64 i915_ttm_buddy_man_get_avail(struct ttm_resource_manager *man);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index df59f884d37c..269cbb60e233 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -132,6 +132,14 @@ void intel_memory_region_set_name(struct intel_memory_region *mem,
>   	va_end(ap);
>   }
>   
> +u64 intel_memory_region_get_avail(struct intel_memory_region *mr)
> +{
> +	if (mr->type == INTEL_MEMORY_LOCAL)
> +		return i915_ttm_buddy_man_get_avail(mr->region_private);
> +
> +	return mr->avail;
> +}

Perhaps a kerneldoc comment here as well?


> +
>   static void __intel_memory_region_destroy(struct kref *kref)
>   {
>   	struct intel_memory_region *mem =
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index 2be8433d373a..6f7a073d5a70 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -74,6 +74,7 @@ struct intel_memory_region {
>   	resource_size_t io_start;
>   	resource_size_t min_page_size;
>   	resource_size_t total;
> +	/* Do not access directly. Use the accessor instead. */
>   	resource_size_t avail;
>   
>   	u16 type;
> @@ -125,4 +126,7 @@ intel_memory_region_set_name(struct intel_memory_region *mem,
>   int intel_memory_region_reserve(struct intel_memory_region *mem,
>   				resource_size_t offset,
>   				resource_size_t size);
> +
> +u64 intel_memory_region_get_avail(struct intel_memory_region *mem);
> +
>   #endif

Otherwise code itself looks good to me.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



