Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB45B1DBF0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C67B10E0E9;
	Thu,  7 Aug 2025 16:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZRNSqaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3410E0E9;
 Thu,  7 Aug 2025 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754585274; x=1786121274;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ux/ln8AmTV4/dNgNp8FmkMcayM7lkTU5scnzdbSbxKc=;
 b=EZRNSqaUpCHguc3o9hmHJMqQtyM8DOANO7SMi/HmOIjSCrI6qChMNCVV
 IZKrHbHBrooPI5ttjLSRzSUPkS+0swLLGXUtKHpR5Sj6ItCu3R4ejZv+H
 wN8sHQuHJVkpChpCDnl6XPAI52QA6XjfCxvIBMLCwjJl6PrC2z9e38nxz
 O9545LD2FP/cPZKgJZqqsKkWGryQDxihL7zdhv7KOvCmObC+dh0qTO71z
 g2nl5YNeAAoYm75/lwA4+L6GOAf4Yk/VT2yePSARMWm2NlQpnKZ+5oUvY
 ybMvMJYqxJyrtx2Qr+5ZUEuyZeMt5RYPTT504pSmw5t0KH0zg4rFfGZrk w==;
X-CSE-ConnectionGUID: yCZVyayFSNi0d7/oQcN2tA==
X-CSE-MsgGUID: R3uNCDEhSXKXEX4USlq71g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57062715"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="57062715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:47:54 -0700
X-CSE-ConnectionGUID: IGpEWrBKQgu+xzgjVJajkQ==
X-CSE-MsgGUID: I6jnVRcMRnmUTMOJcp55tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="202273791"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:47:52 -0700
Message-ID: <be9d451d511f8bc4652d835a2c28fa823aaf05f1.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
Date: Thu, 07 Aug 2025 18:47:49 +0200
In-Reply-To: <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
References: <20250806132838.1831-1-christian.koenig@amd.com>
 <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
 <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
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

On Thu, 2025-08-07 at 11:53 +0200, Christian K=C3=B6nig wrote:
> On 06.08.25 19:43, Thomas Hellstr=C3=B6m wrote:
> > Hi, Christian
> >=20
> > On Wed, 2025-08-06 at 15:28 +0200, Christian K=C3=B6nig wrote:
> > > On some old x86 systems we had the problem that changing the
> > > caching
> > > flags
> > > of system memory requires changing the global MTRR/PAT tables.
> > >=20
> > > But on any modern x86 system (CPUs introduced rughly after 2004)
> > > we
> > > actually don't need that any more and can update the caching
> > > flags
> > > directly in the PTEs of the CPU mapping. It was just never
> > > disabled
> > > because of the fear of regressions.
> > >=20
> > > We already use the PTE flags for encryption on x86 64bit for
> > > quite a
> > > while
> > > and all other supported platforms (Sparc, PowerPC, ARM, MIPS,
> > > LONGARCH)
> > > have never done anything different either.
> >=20
> > IIRC from my VMWARE days, changing SEV encryption mode of a page
> > still
> > requires changing all mappings including kernel maps?
> > __set_memory_enc_pgtable()
>=20
> IIRC both Intel and AMD sacrifice a bit in the page address for that,
> e.g. for encryption the most significant bit is used to indicate if a
> page is encrypted or not.
>=20
> I'm not aware that we need to change all kernel mappings for
> encryption, but could be that the hypervisor somehow depends on that.
>=20
> > >=20
> > > So disable the page pool completely for 64bit systems and just
> > > insert
> > > a
> > > clflush to be on the safe side so that we never return memory
> > > with
> > > dirty
> > > cache lines.
> > >=20
> > > Testing on a Ryzen 5 and 7 shows that this has absolutely no
> > > performance
> > > impact and of hand the AMD CI can't find a problem either.
> > >=20
> > > Let's see what the i915 and XE CI systems say to that.
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >=20
> > I don't think we can do this. First Lunar Lake can in some
> > situations,
> > just like the old Athlons, write-back clean cache lines which means
> > writebacks of speculative prefetches may overwrite GPU data.
>=20
> So a speculative prefetch because of on an access to an adjacent page
> could causes the cache line to be fetched and then written back
> without any change to it?

Exactly.=20

>=20
> Well it's surprising that even modern CPU do stuff like that. That
> could explain some of the problems we had with uncached mappings on
> ARM and RISC-V.

Yeah. I agree. Need to double-check with HW people whether that is gone
with Panther Lake. Don't have a confirmation yet on that.=20

>=20
> > LNL makes heavy use of non-coherent GPU mappings for performance.
>=20
> That is even more surprising. At least on modern Ryzens that doesn't
> seem to have much performance impact any more at all.
>=20
> I mean non-cached mappings where original introduced to avoid the
> extra overhead of going over the front side bus, but that design is
> long gone.

With LNL it's possible to set up GPU mapping to make the accesses
coherent with CPU but that's quite slow. A tradeoff in HW design.

If it wasn't for the writeback of speculative prefetches we could've
settled for only have TTM map the user-space mappings without changing
the kernel map, just like the i915 driver does for older GPUS.

>=20
> > Second, IIRC vm_insert_pfn_prot() on X86 will override the given
> > caching mode with the last caching mode set for the kernel linear
> > map,
> > so if you try to set up a write-combined GPU mapping without a
> > previous
> > call to set_pages_xxxxx it will actually end up cached. see
> > track_pfn_insert().
>=20
> That is exactly the same incorrect assumption I made as well.
>=20
> It's not the linear mapping where that comes from but a separate page
> attribute table, see /sys/kernel/debug/x86/pat_memtype_list.
>=20
> Question is why the heck should we do this? I mean we keep an extra
> rb tree around to overwrite something the driver knows in the first
> place?
>=20
> That is basically just tons of extra overhead for nothing as far as I
> can see.

IIRC it was PAT people enforcing the x86 documentation that aliased
mappings with conflicting caching attributes were not allowed. But it
has proven to work at least on those CPUs not suffering from the clean
cache-line writeback mentioned above.

FWIW If I understand the code correctly, i915 bypasses this by setting
up user-space mappings not by vm_insert_pfn_prot() but using
apply_to_page_range(), mapping the whole bo.

/Thomas


>=20
> Thanks for taking a look,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
> > > =C2=A01 file changed, 11 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index baf27c70a419..7487eac29398 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -38,7 +38,7 @@
> > > =C2=A0#include <linux/highmem.h>
> > > =C2=A0#include <linux/sched/mm.h>
> > > =C2=A0
> > > -#ifdef CONFIG_X86
> > > +#ifdef CONFIG_X86_32
> > > =C2=A0#include <asm/set_memory.h>
> > > =C2=A0#endif
> > > =C2=A0
> > > @@ -46,6 +46,7 @@
> > > =C2=A0#include <drm/ttm/ttm_pool.h>
> > > =C2=A0#include <drm/ttm/ttm_tt.h>
> > > =C2=A0#include <drm/ttm/ttm_bo.h>
> > > +#include <drm/drm_cache.h>
> > > =C2=A0
> > > =C2=A0#include "ttm_module.h"
> > > =C2=A0
> > > @@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct
> > > ttm_pool
> > > *pool, enum ttm_caching caching,
> > > =C2=A0	struct ttm_pool_dma *dma;
> > > =C2=A0	void *vaddr;
> > > =C2=A0
> > > -#ifdef CONFIG_X86
> > > +#ifdef CONFIG_X86_32
> > > =C2=A0	/* We don't care that set_pages_wb is inefficient here.
> > > This
> > > is only
> > > =C2=A0	 * used when we have to shrink and CPU overhead is
> > > irrelevant then.
> > > =C2=A0	 */
> > > @@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct
> > > ttm_pool
> > > *pool, enum ttm_caching caching,
> > > =C2=A0/* Apply any cpu-caching deferred during page allocation */
> > > =C2=A0static int ttm_pool_apply_caching(struct ttm_pool_alloc_state
> > > *alloc)
> > > =C2=A0{
> > > -#ifdef CONFIG_X86
> > > +#ifdef CONFIG_X86_32
> > > =C2=A0	unsigned int num_pages =3D alloc->pages - alloc-
> > > > caching_divide;
> > > =C2=A0
> > > =C2=A0	if (!num_pages)
> > > @@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct
> > > ttm_pool_alloc_state *alloc)
> > > =C2=A0	case ttm_uncached:
> > > =C2=A0		return set_pages_array_uc(alloc->caching_divide,
> > > num_pages);
> > > =C2=A0	}
> > > +
> > > +#elif defined(CONFIG_X86_64)
> > > +	unsigned int num_pages =3D alloc->pages - alloc-
> > > > caching_divide;
> > > +
> > > +	drm_clflush_pages(alloc->caching_divide, num_pages);
> > > =C2=A0#endif
> > > =C2=A0	alloc->caching_divide =3D alloc->pages;
> > > =C2=A0	return 0;
> > > @@ -342,7 +348,7 @@ static struct ttm_pool_type
> > > *ttm_pool_select_type(struct ttm_pool *pool,
> > > =C2=A0	if (pool->use_dma_alloc)
> > > =C2=A0		return &pool->caching[caching].orders[order];
> > > =C2=A0
> > > -#ifdef CONFIG_X86
> > > +#ifdef CONFIG_X86_32
> > > =C2=A0	switch (caching) {
> > > =C2=A0	case ttm_write_combined:
> > > =C2=A0		if (pool->nid !=3D NUMA_NO_NODE)
> > > @@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool *pool,
> > > struct ttm_tt *tt,
> > > =C2=A0	=C2=A0=C2=A0=C2=A0 pool->use_dma_alloc || ttm_tt_is_backed_up(=
tt))
> > > =C2=A0		return -EBUSY;
> > > =C2=A0
> > > -#ifdef CONFIG_X86
> > > +#ifdef CONFIG_X86_32
> > > =C2=A0	/* Anything returned to the system needs to be cached.
> > > */
> > > =C2=A0	if (tt->caching !=3D ttm_cached)
> > > =C2=A0		set_pages_array_wb(tt->pages, tt->num_pages);
> >=20
>=20

