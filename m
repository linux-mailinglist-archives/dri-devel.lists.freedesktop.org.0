Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D7B20D4B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 17:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114810E4F9;
	Mon, 11 Aug 2025 15:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkjgyhv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3B10E4F7;
 Mon, 11 Aug 2025 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754925376; x=1786461376;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GRA8UruL7C31U0Qi7hvdh7lKTtsA/KbEXNjxN8VCpEc=;
 b=gkjgyhv/YS1Ax8mVQvRT6XCWfAjUTHpCAUvMCRzSMAwXe5akKT18nN2O
 jhmV6PzzsblC6xzEWdeHUxe7AXsyR+Bnba6dVRfaP8FHLCHObgslPfSBo
 DgpA0Ku0Sa1apq8MtbgRbFOzrPdGavLdDlzi0KZri/LbpGn72suPOL7Jc
 KixFgNssv9pYNpBboGLXkzjKCyo45IJX3/+2KCaeuYtvboYOVo84EnSTy
 YgB+7E5BFRnM8Aa0yvnVo7jDUgRRAw6lbVHZQGoYjuHYJ7bttPtlWUdZw
 XGKxiODNap1vTels0laaZ+pTNK+At8dE73Uh+bm7RWP8SUfOKlx0khGCc g==;
X-CSE-ConnectionGUID: ZZmYgrq4RPalscxrbYTQbw==
X-CSE-MsgGUID: 4WjdTRMqQQG7ANVVdfheAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68635867"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68635867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 08:16:15 -0700
X-CSE-ConnectionGUID: Ut5T+zOGRiaYdNkFNiifpw==
X-CSE-MsgGUID: wIk+109zQu+LbeXgptT9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165148605"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.228])
 ([10.245.244.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 08:16:13 -0700
Message-ID: <a0bf9d3ab00bf18783c75e453324e232633501f8.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
Date: Mon, 11 Aug 2025 17:16:10 +0200
In-Reply-To: <76b287bf-9698-4df2-ac20-70b178a3a7c1@amd.com>
References: <20250806132838.1831-1-christian.koenig@amd.com>
 <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
 <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
 <be9d451d511f8bc4652d835a2c28fa823aaf05f1.camel@linux.intel.com>
 <76b287bf-9698-4df2-ac20-70b178a3a7c1@amd.com>
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

On Mon, 2025-08-11 at 13:51 +0200, Christian K=C3=B6nig wrote:
> On 07.08.25 18:47, Thomas Hellstr=C3=B6m wrote:
> > > Well it's surprising that even modern CPU do stuff like that.
> > > That
> > > could explain some of the problems we had with uncached mappings
> > > on
> > > ARM and RISC-V.
> >=20
> > Yeah. I agree. Need to double-check with HW people whether that is
> > gone
> > with Panther Lake. Don't have a confirmation yet on that.
>=20
> Going to ask around AMD internally as well.
>=20
> > If it wasn't for the writeback of speculative prefetches we
> > could've
> > settled for only have TTM map the user-space mappings without
> > changing
> > the kernel map, just like the i915 driver does for older GPUS.
>=20
> We should probably come up with a CPU whitelist or blacklist where
> that is actually needed.
>=20
> > > > Second, IIRC vm_insert_pfn_prot() on X86 will override the
> > > > given
> > > > caching mode with the last caching mode set for the kernel
> > > > linear
> > > > map,
> > > > so if you try to set up a write-combined GPU mapping without a
> > > > previous
> > > > call to set_pages_xxxxx it will actually end up cached. see
> > > > track_pfn_insert().
> > >=20
> > > That is exactly the same incorrect assumption I made as well.
> > >=20
> > > It's not the linear mapping where that comes from but a separate
> > > page
> > > attribute table, see /sys/kernel/debug/x86/pat_memtype_list.
> > >=20
> > > Question is why the heck should we do this? I mean we keep an
> > > extra
> > > rb tree around to overwrite something the driver knows in the
> > > first
> > > place?
> > >=20
> > > That is basically just tons of extra overhead for nothing as far
> > > as I
> > > can see.
> >=20
> > IIRC it was PAT people enforcing the x86 documentation that aliased
> > mappings with conflicting caching attributes were not allowed. But
> > it
> > has proven to work at least on those CPUs not suffering from the
> > clean
> > cache-line writeback mentioned above.
>=20
> Makes sense. With the PAT handling even accessing things through
> /dev/mem gives you the right caching.
>=20
> Do you have a list of Intel CPUs where it works?

AFAIK LNL is the only one so far where it doesn't work. I need to get
more information internally.

>=20
> > FWIW If I understand the code correctly, i915 bypasses this by
> > setting
> > up user-space mappings not by vm_insert_pfn_prot() but using
> > apply_to_page_range(), mapping the whole bo.
>=20
> Yeah, that's probably not something we can do. Even filling in 2MiB
> of address space at a time caused performance problems for TTM.

Wasn't that because of repeated calls to vmf_insert_pfn_prot(),
repeating the caching checks and page-table walk all the time?=C2=A0
I think apply_to_page_range() should be pretty fast. Also, to avoid
regressions due to changing the number of prefaulted pages, we could
perhaps honor the MADV_RANDOM and MADV_SEQUENTIAL advises for UMD to
use; one faulting a single page only, one faulting the whole bo, but
also see below:

>=20
> We should probably just drop overriding the attributes in
> vmf_insert_pfn_prot().

I think either solution will see resistance with arch people. We should
probably involve them in the discussion.

Thanks,

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > Thanks for taking a look,
> > > Christian.
> > >=20
> > > >=20
> > > > /Thomas
> > > >=20
> > > >=20
> > > > > ---
> > > > > =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
> > > > > =C2=A01 file changed, 11 insertions(+), 5 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > index baf27c70a419..7487eac29398 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > @@ -38,7 +38,7 @@
> > > > > =C2=A0#include <linux/highmem.h>
> > > > > =C2=A0#include <linux/sched/mm.h>
> > > > > =C2=A0
> > > > > -#ifdef CONFIG_X86
> > > > > +#ifdef CONFIG_X86_32
> > > > > =C2=A0#include <asm/set_memory.h>
> > > > > =C2=A0#endif
> > > > > =C2=A0
> > > > > @@ -46,6 +46,7 @@
> > > > > =C2=A0#include <drm/ttm/ttm_pool.h>
> > > > > =C2=A0#include <drm/ttm/ttm_tt.h>
> > > > > =C2=A0#include <drm/ttm/ttm_bo.h>
> > > > > +#include <drm/drm_cache.h>
> > > > > =C2=A0
> > > > > =C2=A0#include "ttm_module.h"
> > > > > =C2=A0
> > > > > @@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct
> > > > > ttm_pool
> > > > > *pool, enum ttm_caching caching,
> > > > > =C2=A0	struct ttm_pool_dma *dma;
> > > > > =C2=A0	void *vaddr;
> > > > > =C2=A0
> > > > > -#ifdef CONFIG_X86
> > > > > +#ifdef CONFIG_X86_32
> > > > > =C2=A0	/* We don't care that set_pages_wb is inefficient
> > > > > here.
> > > > > This
> > > > > is only
> > > > > =C2=A0	 * used when we have to shrink and CPU overhead is
> > > > > irrelevant then.
> > > > > =C2=A0	 */
> > > > > @@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct
> > > > > ttm_pool
> > > > > *pool, enum ttm_caching caching,
> > > > > =C2=A0/* Apply any cpu-caching deferred during page allocation */
> > > > > =C2=A0static int ttm_pool_apply_caching(struct
> > > > > ttm_pool_alloc_state
> > > > > *alloc)
> > > > > =C2=A0{
> > > > > -#ifdef CONFIG_X86
> > > > > +#ifdef CONFIG_X86_32
> > > > > =C2=A0	unsigned int num_pages =3D alloc->pages - alloc-
> > > > > > caching_divide;
> > > > > =C2=A0
> > > > > =C2=A0	if (!num_pages)
> > > > > @@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct
> > > > > ttm_pool_alloc_state *alloc)
> > > > > =C2=A0	case ttm_uncached:
> > > > > =C2=A0		return set_pages_array_uc(alloc-
> > > > > >caching_divide,
> > > > > num_pages);
> > > > > =C2=A0	}
> > > > > +
> > > > > +#elif defined(CONFIG_X86_64)
> > > > > +	unsigned int num_pages =3D alloc->pages - alloc-
> > > > > > caching_divide;
> > > > > +
> > > > > +	drm_clflush_pages(alloc->caching_divide, num_pages);
> > > > > =C2=A0#endif
> > > > > =C2=A0	alloc->caching_divide =3D alloc->pages;
> > > > > =C2=A0	return 0;
> > > > > @@ -342,7 +348,7 @@ static struct ttm_pool_type
> > > > > *ttm_pool_select_type(struct ttm_pool *pool,
> > > > > =C2=A0	if (pool->use_dma_alloc)
> > > > > =C2=A0		return &pool-
> > > > > >caching[caching].orders[order];
> > > > > =C2=A0
> > > > > -#ifdef CONFIG_X86
> > > > > +#ifdef CONFIG_X86_32
> > > > > =C2=A0	switch (caching) {
> > > > > =C2=A0	case ttm_write_combined:
> > > > > =C2=A0		if (pool->nid !=3D NUMA_NO_NODE)
> > > > > @@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool
> > > > > *pool,
> > > > > struct ttm_tt *tt,
> > > > > =C2=A0	=C2=A0=C2=A0=C2=A0 pool->use_dma_alloc || ttm_tt_is_backed=
_up(tt))
> > > > > =C2=A0		return -EBUSY;
> > > > > =C2=A0
> > > > > -#ifdef CONFIG_X86
> > > > > +#ifdef CONFIG_X86_32
> > > > > =C2=A0	/* Anything returned to the system needs to be
> > > > > cached.
> > > > > */
> > > > > =C2=A0	if (tt->caching !=3D ttm_cached)
> > > > > =C2=A0		set_pages_array_wb(tt->pages, tt-
> > > > > >num_pages);
> > > >=20
> > >=20
> >=20
>=20

