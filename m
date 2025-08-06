Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAEB1CB32
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 19:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784D710E2FD;
	Wed,  6 Aug 2025 17:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kC9BjhyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368510E2F8;
 Wed,  6 Aug 2025 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754502239; x=1786038239;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7MFf4dbnziN4nSbCo3AqRmR+l3LmOXSFj+wnbUlHOt4=;
 b=kC9BjhyJqDR/RzWeA1Pc9SyKd6jjESekD+iOcP/9DuyJ0zQDyzejhja3
 b3u563ye+ENHuLbdE6qcNQBQ3yZcoPwnjGLHe+UXQhWvRzbRaXMj3me+q
 zN/ceA3ZHEfAXtJLQqoqrOv/oAP11WbylPK71gRMdRuHi7a1x0+difUGR
 Rlfv40mgsYnLE/EsfW6MxrjS8q+BKBDQJhz+ZdqWNYKpGHD5gcxj0usBO
 MqMzGn3nHsC1ylnASZMIOm15aIoy1snkHDXnA/NSzuazWVjoXZTjP6Tp7
 zzmDtapBcQrXwhIxFxZHInAIFf28PcxJi4/a+U4BLZGzUoEQ77ayRAFMI A==;
X-CSE-ConnectionGUID: 6oeHZi5jTtG+wauhZBKkNA==
X-CSE-MsgGUID: ZBjKGUMFTTihUe5i9GjsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68278128"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68278128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 10:43:58 -0700
X-CSE-ConnectionGUID: POqkzQiQSPqS2wn5vC1Nvw==
X-CSE-MsgGUID: tXsXoAsiQwqbWecLDL+/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165242784"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.244.159])
 ([10.245.244.159])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 10:43:56 -0700
Message-ID: <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
Date: Wed, 06 Aug 2025 19:43:54 +0200
In-Reply-To: <20250806132838.1831-1-christian.koenig@amd.com>
References: <20250806132838.1831-1-christian.koenig@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

Hi, Christian

On Wed, 2025-08-06 at 15:28 +0200, Christian K=C3=B6nig wrote:
> On some old x86 systems we had the problem that changing the caching
> flags
> of system memory requires changing the global MTRR/PAT tables.
>=20
> But on any modern x86 system (CPUs introduced rughly after 2004) we
> actually don't need that any more and can update the caching flags
> directly in the PTEs of the CPU mapping. It was just never disabled
> because of the fear of regressions.
>=20
> We already use the PTE flags for encryption on x86 64bit for quite a
> while
> and all other supported platforms (Sparc, PowerPC, ARM, MIPS,
> LONGARCH)
> have never done anything different either.

IIRC from my VMWARE days, changing SEV encryption mode of a page still
requires changing all mappings including kernel maps?
__set_memory_enc_pgtable()

>=20
> So disable the page pool completely for 64bit systems and just insert
> a
> clflush to be on the safe side so that we never return memory with
> dirty
> cache lines.
>=20
> Testing on a Ryzen 5 and 7 shows that this has absolutely no
> performance
> impact and of hand the AMD CI can't find a problem either.
>=20
> Let's see what the i915 and XE CI systems say to that.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

I don't think we can do this. First Lunar Lake can in some situations,
just like the old Athlons, write-back clean cache lines which means
writebacks of speculative prefetches may overwrite GPU data. LNL makes
heavy use of non-coherent GPU mappings for performance.

Second, IIRC vm_insert_pfn_prot() on X86 will override the given
caching mode with the last caching mode set for the kernel linear map,
so if you try to set up a write-combined GPU mapping without a previous
call to set_pages_xxxxx it will actually end up cached. see
track_pfn_insert().

/Thomas


> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
> =C2=A01 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..7487eac29398 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -38,7 +38,7 @@
> =C2=A0#include <linux/highmem.h>
> =C2=A0#include <linux/sched/mm.h>
> =C2=A0
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
> =C2=A0#include <asm/set_memory.h>
> =C2=A0#endif
> =C2=A0
> @@ -46,6 +46,7 @@
> =C2=A0#include <drm/ttm/ttm_pool.h>
> =C2=A0#include <drm/ttm/ttm_tt.h>
> =C2=A0#include <drm/ttm/ttm_bo.h>
> +#include <drm/drm_cache.h>
> =C2=A0
> =C2=A0#include "ttm_module.h"
> =C2=A0
> @@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct ttm_pool
> *pool, enum ttm_caching caching,
> =C2=A0	struct ttm_pool_dma *dma;
> =C2=A0	void *vaddr;
> =C2=A0
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
> =C2=A0	/* We don't care that set_pages_wb is inefficient here. This
> is only
> =C2=A0	 * used when we have to shrink and CPU overhead is
> irrelevant then.
> =C2=A0	 */
> @@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct ttm_pool
> *pool, enum ttm_caching caching,
> =C2=A0/* Apply any cpu-caching deferred during page allocation */
> =C2=A0static int ttm_pool_apply_caching(struct ttm_pool_alloc_state
> *alloc)
> =C2=A0{
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
> =C2=A0	unsigned int num_pages =3D alloc->pages - alloc-
> >caching_divide;
> =C2=A0
> =C2=A0	if (!num_pages)
> @@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct
> ttm_pool_alloc_state *alloc)
> =C2=A0	case ttm_uncached:
> =C2=A0		return set_pages_array_uc(alloc->caching_divide,
> num_pages);
> =C2=A0	}
> +
> +#elif defined(CONFIG_X86_64)
> +	unsigned int num_pages =3D alloc->pages - alloc-
> >caching_divide;
> +
> +	drm_clflush_pages(alloc->caching_divide, num_pages);
> =C2=A0#endif
> =C2=A0	alloc->caching_divide =3D alloc->pages;
> =C2=A0	return 0;
> @@ -342,7 +348,7 @@ static struct ttm_pool_type
> *ttm_pool_select_type(struct ttm_pool *pool,
> =C2=A0	if (pool->use_dma_alloc)
> =C2=A0		return &pool->caching[caching].orders[order];
> =C2=A0
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
> =C2=A0	switch (caching) {
> =C2=A0	case ttm_write_combined:
> =C2=A0		if (pool->nid !=3D NUMA_NO_NODE)
> @@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool *pool,
> struct ttm_tt *tt,
> =C2=A0	=C2=A0=C2=A0=C2=A0 pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
> =C2=A0		return -EBUSY;
> =C2=A0
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_X86_32
> =C2=A0	/* Anything returned to the system needs to be cached. */
> =C2=A0	if (tt->caching !=3D ttm_cached)
> =C2=A0		set_pages_array_wb(tt->pages, tt->num_pages);

