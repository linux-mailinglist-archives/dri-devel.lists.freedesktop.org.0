Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B496409E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3D110E14A;
	Thu, 29 Aug 2024 09:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHT8aLsi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01110E125;
 Thu, 29 Aug 2024 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724925243; x=1756461243;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=47geSmyjfM7AHckx6t+a9jKIJaftbP78ZT86ew9mqiQ=;
 b=dHT8aLsi2HpkyzHz+lhV93m4vMkDp1ITxaIyuXpnsEAcf6n4zQhtpiff
 xsDkeSina+s0Gpy1wRXJMqAlmR0NXUXAZfietf+LEy+LhcvoVvt+EvxYZ
 MpoLwRIPFY/oLIuaZZqQRRq96A8yco3ZtXJ46ywBA17f0mx2R3gQtbkdm
 b4Nv2gUJ+taFZu7ytzuHAYGY0ASjqd4J18Mgaef59aQ/szN6Iyr8cmOrD
 F6FWFJO+PJhRPy4dFutkIDfwjefmtZF7IW7wjze5uh0S0qaE9auY8GqqA
 IOQJiOZk0DkmBY3zvZK0etR3zM0tdL8Yuf43uFBh/YZQXRdIikitu4Tj+ g==;
X-CSE-ConnectionGUID: SE2vXkO6RRyziuZwCaS2ag==
X-CSE-MsgGUID: HRiE5ODVQeSyiP68JYKqqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23369192"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23369192"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:54:03 -0700
X-CSE-ConnectionGUID: mXykeEtiRaG2x9gLmVAUbw==
X-CSE-MsgGUID: hhF0xVzRTESk1aKzNV420w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="67895859"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.46])
 ([10.245.245.46])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:54:00 -0700
Message-ID: <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch, "Paneer Selvam,
 Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Date: Thu, 29 Aug 2024 11:53:58 +0200
In-Reply-To: <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Christian,

On Thu, 2024-08-29 at 11:24 +0200, Christian K=C3=B6nig wrote:
>=20

...

> > > - Unified eviction is required (SVM VRAM and TTM BOs need to be
> > > able to
> > > =C2=A0=C2=A0 evict each other).
> > So core mm handles this by just roughly equally shrinking
> > everything.
> > Seems to work, and it has a pile of object shrinkers, and the page
> > lru is
> > also split into page cache and anon memory.
> >=20
> > I think you need to put in more justification that unified eviction
> > is
> > required than just stating it, because a look at mm/ gives a very
> > well
> > established counterexample.
> >=20
> > > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > > certainly
> > > =C2=A0=C2=A0 require a dma-resv.
> > So from the TTM side we need exhaustive eviction, or at least
> > something a
> > bit more exhaustive than what ttm currently has. Note that i915-gem
> > also
> > never really got to perfect exhaustive eviction, it's just a pile
> > better
> > than ttm right now.
>=20
> Please define what exhaustive eviction should mean? I think I know
> what=20
> it is and I have been pushing TTM into the direction of solving this
> for=20
> years.

We internally refer to exhaustive eviction being a client is always
guaranteed to eventually make progress in obtaining non-pinned vram,
typically by incrementally locking and keeping dma-resvs across a
single validation including validations during buffer object
allocations.

>=20
> The last missing puzzle piece is to use drm_exec for TTM evictions,

and IMO keeping the dma-resv locks grabbed during eviction until at
least one unit of progress (one validation) has succeeded.

> but=20
> apart from that everything should work now.
>=20
>=20
> Regards,
> Christian.

But as Sima pointed out in private communication, exhaustive eviction
is not really needed for faulting to make (crawling) progress.
Watermarks and VRAM trylock shrinking should suffice, since we're
strictly only required to service a single gpu page granule at a time.

However, ordinary bo-based jobs would still like to be able to
completely evict SVM vram. Whether that is important enough to strive
for is ofc up for discussion.

/Thomas



>=20
> > Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
> > eviction is going to win because the shrinkers can only trylock
> > dma_resv.
> > So this part works. It actually works so well on the system memory
> > side
> > that if we're not careful we can trigger oom, because we're too
> > good at
> > getting at all the memory.
> >=20
> > SVM VRAM allocations otoh do not need exhaustive evictions. Or at
> > least I
> > don't see why, because the idea is that thanks to gpu and cpu page
> > faults,
> > you can always get out of a pinch by just trashing everything for a
> > while
> > and migrating the handfull of available pages a lot.
> >=20
> > > - Likely allocation size is 2M which makes of size of BO (872)
> > > =C2=A0=C2=A0 acceptable per allocation (872 / 2M =3D=3D .0004158).
> > >=20
> > > With this, using TTM BO for VRAM backing store seems to be an
> > > obvious
> > > choice as it allows leveraging of the TTM eviction code.
> > Except it requires that you hold dma_resv, which brings in all
> > kinds of
> > pain. And for eviction we really don't need a lot of
> > synchronization, so a
> > lot of that locking is not needed, unlike the case where we have a
> > cpu
> > fault, where we absolutely need mmap_lock and all that to make sure
> > we
> > fault in the right page.
> >=20
> > But for eviction we only need to throw out some pages, if we're not
> > entirely precise with picking the right ones (or have no idea into
> > which
> > vma they're all currently mapped into) it doesn't matter. That's
> > why
> > migrate_device_pages doesn't care about any of that at all, it
> > doesn't
> > need to by design. But by bo backing memory you drag in all that
> > stuff
> > that's causing headacheds for eviction.
> >=20
> > The only thing migration tries to do is remove all pte, and if that
> > succeeds, move the page. Specialized for the gpusvm case, looking
> > at mm/
> > code as cheat sheet, we need roughly:
> >=20
> > - reverse mapping structure like anon_vma. Except gpusvm can assume
> > that
> > =C2=A0=C2=A0 there's currently only one gpu side mapping, so we can jus=
t
> > stuff the
> > =C2=A0=C2=A0 gpusvm an va_address into the page, and protect it with th=
e page
> > lock.
> >=20
> > - we need pagetable locks, so that we can manipulate pagetables
> > (well
> > =C2=A0=C2=A0 specifically make ptes invalid) without taking any other l=
ocks.
> >=20
> > - everyone else inserting or removing ptes for svm mappings also
> > needs to
> > =C2=A0=C2=A0 lock the page, or we have races. This might be the
> > hmm_range_fault races
> > =C2=A0=C2=A0 you're seeing when allowing vram pages, since I don't thin=
k
> > there's
> > =C2=A0=C2=A0 anything else stopping the page lookup otherwise from
> > succeeding.
> >=20
> > - we might also need to stuff migrate ptes into the gpu side, like
> > the cpu
> > =C2=A0=C2=A0 does, to hold up refaults before the migration has finishe=
d. But
> > I think
> > =C2=A0=C2=A0 those are only needed for anon memory in sram because ther=
e's no
> > other
> > =C2=A0=C2=A0 way to find the right page than swap pte entries, of which
> > migration
> > =C2=A0=C2=A0 entries are a special case.
> >=20
> > - core code also expects us to handle the page refcount correctly
> > for svm
> > =C2=A0=C2=A0 device memory, so we can't free the pages like normal bo p=
ages
> > either
> > =C2=A0=C2=A0 directly to drm_buddy.
> >=20
> > Now typing this all up will look an awful lot like what you have,
> > with the
> > dma_resv lock serving as the page lock and the pagetable lock. The
> > only
> > reason is that these locks are much smaller and nest within all the
> > other
> > stuff going on and so avoid the inversion issues.
> >=20
> > So one annoying part is that this is a lot of pointlessly looking
> > typing.
> > The other is that it's full of races, because core mm really is
> > yolo all
> > the way down. So lots of ways you lock the wrong page and fun stuff
> > like
> > that, but the few cases that matter work:
> >=20
> > - svm fault handling with hmm_range fault retries with mmu
> > notifiers. Note
> > =C2=A0=C2=A0 that we need to have vram pages locked and the notifier re=
trie
> > needs to
> > =C2=A0=C2=A0 be under the pagetable lock, or there's room to escape. At=
 least
> > that's
> > =C2=A0=C2=A0 what I came up with last time I thought it all through.
> >=20
> > - migrate_to_ram: it will hold a page reference which we know was
> > the
> > =C2=A0=C2=A0 valid vram page when the cpu pte was locked, but it might =
not be
> > it
> > =C2=A0=C2=A0 anymore. So we have to lock the page and check whether it'=
s
> > still gpu
> > =C2=A0=C2=A0 mapped, and if not retry the entire fault since most likey
> > another
> > =C2=A0=C2=A0 migrate_to_ram has succeed meanwhile in parallel.
> >=20
> > - for eviction we don't care, we might actually be migrating a page
> > no one
> > =C2=A0=C2=A0 even wants anymore.
> >=20
> > Now I think you can get all this done with the dma_resv lock and
> > maybe the
> > bo refcount. But it does involve a tremendous amount of headaches
> > and
> > impendence mismatch, because that's not how page faults and
> > migrations
> > work in core mm.
> >=20
> > Cheers, Sima
> >=20
> > > Current migration policy is migrate any SVM range greater than or
> > > equal
> > > to 64k once.
> > >=20
> > > [1]https://patchwork.freedesktop.org/series/133643/
> > >=20
> > > Signed-off-by: Matthew Brostmatthew.brost@intel.com
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_svm.c | 81
> > > ++++++++++++++++++++++++++++++++++++-
> > > =C2=A0 drivers/gpu/drm/xe/xe_svm.h |=C2=A0 1 +
> > > =C2=A0 2 files changed, 81 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 4372c02a341f..fd8987e0a506 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0 static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range
> > > *range)
> > > =C2=A0 {
> > > +	struct drm_gpusvm_ctx ctx =3D {};
> > > =C2=A0=C2=A0	struct dma_fence *fence;
> > > =C2=A0=20
> > > +	/* Evict any pages holding references to vram allocation
> > > */
> > > +	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
> > > +		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm,
> > > &range->base, &ctx);
> > > +
> > > =C2=A0=C2=A0	xe_vm_lock(vm, false);
> > > =C2=A0=C2=A0	fence =3D xe_vm_range_unbind(vm, range);
> > > =C2=A0=C2=A0	xe_vm_unlock(vm);
> > > @@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct
> > > xe_svm_range *range,
> > > =C2=A0=C2=A0	return (range->tile_present & ~range->tile_invalidated)
> > > & BIT(tile->id);
> > > =C2=A0 }
> > > =C2=A0=20
> > > +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> > > +{
> > > +	return &tile->mem.vram;
> > > +}
> > > +
> > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > > xe_tile *tile,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range
> > > *range,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_gpusvm_ctx *ctx)
> > > +{
> > > +	struct xe_mem_region *mr =3D tile_to_mr(tile);
> > > +	struct drm_buddy_block *block;
> > > +	struct list_head *blocks;
> > > +	struct xe_bo *bo;
> > > +	ktime_t end =3D 0;
> > > +	int err;
> > > +
> > > +retry:
> > > +	xe_vm_lock(vm, false);
> > > +	bo =3D xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > > >base.va.end -
> > > +			=C2=A0 range->base.va.start,
> > > ttm_bo_type_device,
> > > +			=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +			=C2=A0 XE_BO_FLAG_SYSTEM_ALLOC |
> > > XE_BO_FLAG_SKIP_CLEAR);
> > > +	xe_vm_unlock(vm);
> > > +	if (IS_ERR(bo)) {
> > > +		err =3D PTR_ERR(bo);
> > > +		if (xe_vm_validate_should_retry(NULL, err,
> > > &end))
> > > +			goto retry;
> > > +		return bo;
> > > +	}
> > > +
> > > +	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > > >blocks;
> > > +	list_for_each_entry(block, blocks, link)
> > > +		block->private =3D mr;
> > > +
> > > +	/*
> > > +	 * Take ref because as soon as
> > > drm_gpusvm_migrate_to_vram succeeds the
> > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > +	 */
> > > +	xe_bo_get(bo);
> > > +
> > > +	err =3D drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm,
> > > &range->base,
> > > +					 bo, ctx);
> > > +	if (err) {
> > > +		xe_bo_put(bo);	/* Local ref */
> > > +		xe_bo_put(bo);	/* Creation ref */
> > > +		return ERR_PTR(err);
> > > +	}
> > > +
> > > +	return bo;
> > > +}
> > > +
> > > =C2=A0 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
> > > *vma,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64
> > > fault_addr,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic)
> > > =C2=A0 {
> > > -	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> > > xe_vma_read_only(vma), };
> > > +	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> > > xe_vma_read_only(vma),
> > > +		.vram_possible =3D IS_DGFX(vm->xe), };
> > > =C2=A0=C2=A0	struct xe_svm_range *range;
> > > =C2=A0=C2=A0	struct drm_gpusvm_range *r;
> > > =C2=A0=C2=A0	struct drm_exec exec;
> > > =C2=A0=C2=A0	struct dma_fence *fence;
> > > +	struct xe_bo *bo =3D NULL;
> > > =C2=A0=C2=A0	ktime_t end =3D 0;
> > > =C2=A0=C2=A0	int err;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	lockdep_assert_held_write(&vm->lock);
> > > =C2=A0=20
> > > =C2=A0 retry:
> > > +	xe_bo_put(bo);
> > > +	bo =3D NULL;
> > > +
> > > =C2=A0=C2=A0	/* Always process UNMAPs first so view SVM ranges is
> > > current */
> > > =C2=A0=C2=A0	err =3D xe_svm_garbage_collector(vm);
> > > =C2=A0=C2=A0	if (err)
> > > @@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm, struct xe_vma *vma,
> > > =C2=A0=C2=A0	if (xe_svm_range_is_valid(range, tile))
> > > =C2=A0=C2=A0		return 0;
> > > =C2=A0=20
> > > +	/* XXX: Add migration policy, for now migrate range once
> > > */
> > > +	if (IS_DGFX(vm->xe) && !range->migrated &&
> > > +	=C2=A0=C2=A0=C2=A0 range->base.flags.migrate_vram &&
> > > +	=C2=A0=C2=A0=C2=A0 (range->base.va.end - range->base.va.start) >=3D
> > > SZ_64K) {
> > > +		range->migrated =3D true;
> > > +
> > > +		bo =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > +		if (IS_ERR(bo)) {
> > > +			drm_info(&vm->xe->drm,
> > > +				 "VRAM allocation failed,
> > > falling back to retrying, asid=3D%u, errno %ld\n",
> > > +				 vm->usm.asid, PTR_ERR(bo));
> > > +			bo =3D NULL;
> > > +			goto retry;
> > > +		}
> > > +	}
> > > +
> > > =C2=A0=C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > &ctx);
> > > =C2=A0=C2=A0	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner w=
here
> > > CPU mappings have change */
> > > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
> > > @@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > > =C2=A0=C2=A0	dma_fence_put(fence);
> > > =C2=A0=20
> > > =C2=A0 err_out:
> > > +	xe_bo_put(bo);
> > > +
> > > =C2=A0=C2=A0	return err;
> > > =C2=A0 }
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > index 8b72e91cc37d..3f432483a230 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -18,6 +18,7 @@ struct xe_svm_range {
> > > =C2=A0=C2=A0	struct list_head garbage_collector_link;
> > > =C2=A0=C2=A0	u8 tile_present;
> > > =C2=A0=C2=A0	u8 tile_invalidated;
> > > +	u8 migrated	:1;
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region
> > > *mr);
> > > --=20
> > > 2.34.1
> > >=20

