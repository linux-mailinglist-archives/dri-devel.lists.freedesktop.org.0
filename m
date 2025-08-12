Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF317B224B2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 12:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865E910E0A4;
	Tue, 12 Aug 2025 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7eRq+4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6A10E0A4;
 Tue, 12 Aug 2025 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754994967; x=1786530967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IOfO6TYef8wg7AzHQVYA1EguDQZernCJLIAoecY6xMU=;
 b=O7eRq+4b5lXewKSoXa0artRQ19B+H52348NUuFzwIxrC52wobYENXBki
 M7q+hccu8hZfaEy/oHr608bESmYP7w+o1pRV1lW2kMkslgUOcCXXsd0pL
 cLqZOmb0WuB7IduZae5vxJ3TGVn6hGFlnFNK/qZ+Xt/aOhQeT98OD0pI4
 Tf39nlg65u0dMZPyZrvVG8Yxbyy80TOHedpo7g9ZxVTx5nLrUK68d0EXl
 7YmxYFdQkMDsz2bI5yjLShi3APzVGcVBdtTmllg66+8ZSJ+r8Nqb3PS/C
 BpYNb/GIj8uF3m+74KDfXr0Kbjh2s/vChjEsECrt7JrgzJhasy63Less8 Q==;
X-CSE-ConnectionGUID: tYAKD1yYQ5G+dQi3Hr57GA==
X-CSE-MsgGUID: AXzTJ7XRQ+WvkvTgXbfI4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="61064504"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="61064504"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:36:07 -0700
X-CSE-ConnectionGUID: ORrIYLhaT4G+lasgqGoAMA==
X-CSE-MsgGUID: cL6Jel2rQIyIIaAwHnYmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="171413217"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.79])
 ([10.245.245.79])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:36:05 -0700
Message-ID: <303d5abe-34ca-4ecb-8a9b-8ae7e1bbf2a8@intel.com>
Date: Tue, 12 Aug 2025 11:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com
References: <20250806132838.1831-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250806132838.1831-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/08/2025 14:28, Christian König wrote:
> On some old x86 systems we had the problem that changing the caching flags
> of system memory requires changing the global MTRR/PAT tables.
> 
> But on any modern x86 system (CPUs introduced rughly after 2004) we
> actually don't need that any more and can update the caching flags
> directly in the PTEs of the CPU mapping. It was just never disabled
> because of the fear of regressions.
> 
> We already use the PTE flags for encryption on x86 64bit for quite a while
> and all other supported platforms (Sparc, PowerPC, ARM, MIPS, LONGARCH)
> have never done anything different either.
> 
> So disable the page pool completely for 64bit systems and just insert a
> clflush to be on the safe side so that we never return memory with dirty
> cache lines.
> 
> Testing on a Ryzen 5 and 7 shows that this has absolutely no performance
> impact and of hand the AMD CI can't find a problem either.
> 
> Let's see what the i915 and XE CI systems say to that.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..7487eac29398 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -38,7 +38,7 @@
>   #include <linux/highmem.h>
>   #include <linux/sched/mm.h>
>   
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
>   #include <asm/set_memory.h>
>   #endif
>   
> @@ -46,6 +46,7 @@
>   #include <drm/ttm/ttm_pool.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/ttm/ttm_bo.h>
> +#include <drm/drm_cache.h>
>   
>   #include "ttm_module.h"
>   
> @@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   	struct ttm_pool_dma *dma;
>   	void *vaddr;
>   
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
>   	/* We don't care that set_pages_wb is inefficient here. This is only
>   	 * used when we have to shrink and CPU overhead is irrelevant then.
>   	 */
> @@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   /* Apply any cpu-caching deferred during page allocation */
>   static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
>   {
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
>   	unsigned int num_pages = alloc->pages - alloc->caching_divide;
>   
>   	if (!num_pages)
> @@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
>   	case ttm_uncached:
>   		return set_pages_array_uc(alloc->caching_divide, num_pages);
>   	}
> +
> +#elif defined(CONFIG_X86_64)
> +	unsigned int num_pages = alloc->pages - alloc->caching_divide;
> +
> +	drm_clflush_pages(alloc->caching_divide, num_pages);

Do we now also need manual clflushing for things like swap-in? Or what 
caching type does copy_highpage() in ttm_tt_swapin() use now? Is it not 
wb? If so, is that not one of the nice advantages of using set_pages_* 
where raw kmap will respect the PAT setting?

>   #endif
>   	alloc->caching_divide = alloc->pages;
>   	return 0;
> @@ -342,7 +348,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>   	if (pool->use_dma_alloc)
>   		return &pool->caching[caching].orders[order];
>   
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
>   	switch (caching) {
>   	case ttm_write_combined:
>   		if (pool->nid != NUMA_NO_NODE)
> @@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>   	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
>   		return -EBUSY;
>   
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
>   	/* Anything returned to the system needs to be cached. */
>   	if (tt->caching != ttm_cached)
>   		set_pages_array_wb(tt->pages, tt->num_pages);

