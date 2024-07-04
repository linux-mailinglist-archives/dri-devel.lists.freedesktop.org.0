Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A29927784
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CFC10EAFF;
	Thu,  4 Jul 2024 13:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1uiBZnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0971310EAFD;
 Thu,  4 Jul 2024 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720101209; x=1751637209;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LNh9jndaej19li5D+TsDVoGuqEtLTr7SzCfe6VWWAI8=;
 b=P1uiBZnbi92e/2UBPpQZmLKSUO9br4vWgDwIjJ/sGypj1QivDYrPpo1T
 banNJHGNa52hDvio1MFMhFxzfaTm2AVWAWgc0jy6cVji9pnFwrVw/s1Wx
 RsviXBNOg7/mAD+HkPyVgSIYoubga3IlWbzsoydkoK893tXjyN9ovV0CN
 0JGOnMdBgI96kSfQnufT4HzZbzXbqcr25SReKDrbiMxTmdR+c7/Cp79wg
 KtFz/81DvHDIeee70pgKAkEFbrp9s0jFlBQzSO3uN/Evpe4hSGwavFeEZ
 yzgx7voH8u0WxtyxlSaf+Z6wr2CDmDopYLF4uLpZS17TZzDoYSHbh5EMC g==;
X-CSE-ConnectionGUID: pnnJdW39SMWw+oTAboMgbA==
X-CSE-MsgGUID: 76Fj9LEZQXiv7bOLDcTsSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34828902"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="34828902"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 06:53:29 -0700
X-CSE-ConnectionGUID: Ss7bSDhKQl6+vqpsJ74IlQ==
X-CSE-MsgGUID: gPEdlVapTnus2hedDk+mTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="47343708"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.56])
 ([10.245.245.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 06:53:28 -0700
Message-ID: <fe1c711e273a7699da2115f1161d4deaab2679db.camel@linux.intel.com>
Subject: Re: [PATCH v6 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Thu, 04 Jul 2024 15:53:24 +0200
In-Reply-To: <c49319cf-c110-4743-9a63-4028b6e5aab8@amd.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
 <6e675fdb-7656-46f1-8753-ade66ef9de7b@amd.com>
 <f3bb190b58659b332819e9ab8a4a79df0253dad9.camel@linux.intel.com>
 <c49319cf-c110-4743-9a63-4028b6e5aab8@amd.com>
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

On Thu, 2024-07-04 at 15:13 +0200, Christian K=C3=B6nig wrote:
> Hey Thomas,
>=20
> Am 04.07.24 um 14:41 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Christian,
> >=20
> > On Thu, 2024-07-04 at 11:21 +0200, Christian K=C3=B6nig wrote:
> > > Am 03.07.24 um 17:38 schrieb Thomas Hellstr=C3=B6m:
> > > > To address the problem with hitches moving when bulk move
> > > > sublists are lru-bumped, register the list cursors with the
> > > > ttm_lru_bulk_move structure when traversing its list, and
> > > > when lru-bumping the list, move the cursor hitch to the tail.
> > > > This also means it's mandatory for drivers to call
> > > > ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
> > > > initializing and finalizing the bulk move structure, so add
> > > > those calls to the amdgpu- and xe driver.
> > > >=20
> > > > Compared to v1 this is slightly more code but less fragile
> > > > and hopefully easier to understand.
> > > This is the only patch in the series which I see critical.
> > >=20
> > > I think the final goal when using drm_exec in TTMs eviction path
> > > is
> > > to
> > > keep all evicted (or evicting) BOs locked until we have enough
> > > space.
> > >=20
> > > This means that for bulk move sections on the LRU we would lock
> > > the
> > > first BO and would only drop that lock again if we have gone over
> > > the
> > > full bulk move section and know that all BOs are not valuable for
> > > eviction.
> > >=20
> > > Because of this the issue of having to consider hitches move with
> > > a
> > > bulk
> > > move section on the LRU doesn't even occur because for that a
> > > concurrent
> > > process would need to grab the common lock of the BOs in the bulk
> > > move
> > > section.
> > While I agree that this is something we should strive towards,
> > following the previous discussion I already reworked this patch
> > completely to remove the dual hitches and make it less fragile.
>=20
> Yeah seen that and it indeed makes it much easier to understand
> what's=20
> going on.
>=20
> > After that you mentioned you were ok with the high level approach
> > for
> > these first four patches here:
> >=20
> > https://lists.freedesktop.org/archives/dri-devel/2024-April/450288.html
> >=20
> > So is that not any longer the case?
>=20
> I'm ok with having it as intermediate step, but for that it's a bit
> much=20
> of an hammer.
>=20
> On the other hand having clean ttm_lru_bulk_move_init() and=20
> ttm_lru_bulk_move_fini() calls is probably something we should keep=20
> around anyway.
>=20
> > To recap, the concerns I'm seeing with the "kept common lock"
> > approach
> > are
> >=20
> > a) Since when we release the LRU lock and the common bulk bo lock
> > is
> > not yet locked, a LRU bump may happen and the hitch will go with
> > it. So
> > to avoid that we need to place the hitch *before* then considered
> > resource in the LRU list rather than *after*. Now on the next
> > iteration
> > we need to come up with some way to choose what's really the next
> > resource? If the next resource pointer is the same we already
> > considered, should we assume it might have been freed and re-
> > alloced
> > with the same virtual address?
>=20
> My idea is for the general flow is this:
>=20
> 1. Grab the lru lock
> 2. Grab a reference to the BO after the hitch, eventually trylock the
> BO=20
> or just continue with a prelocked one
> 3. If locking wasn't successfully
> =C2=A0=C2=A0=C2=A0=C2=A0 4. Drop the lru lock
> =C2=A0=C2=A0=C2=A0=C2=A0 5. Block on the BO lock
> =C2=A0=C2=A0=C2=A0=C2=A0 6. Check that this resource/BO is still the one =
the cursor
> points=20
> to, if not drop the lock and restart from #1
> =C2=A0=C2=A0=C2=A0=C2=A0 7. Grab the lru lock
> 8. Advance the cursor.
> 9. Drop the lru lock.
> 10. Try to evict or swap the BO
> 11. Repeat if still not able to allocate memory.
>=20
> The BO could be prelocked if it's part of the currently processed
> bulk=20
> or previously contended and prelocked by drm_exec.
>=20
> And instead of checking if the resource is in the right domain we
> check=20
> if the resource/BO is still the one where the cursor points to.
>=20
> This way we don't care if the resource was reallocated and by
> coincident=20
> ended up right after the cursor hitch again. As long as we still
> point=20
> to the BO we just locked everything is fine.
>=20
> > b) It will be up to the user of the lru traversal to actually
> > guarantee
> > that locks are held across a bulk part, to make the resource
> > traversal
> > reasonably self-contained. In this case the LRU walker, because
> > there's
> > where the bo locking happens.
> > This means that any other code that aims to walk the LRUs for
> > various
> > reasons, and doesn't provide any held lock guarantees, may be
> > subject
> > to unexpected results if someone bumped the LRU.
> > So we would basically tailor the resource iteration here for a
> > single
> > use-case and not make it robust for various use-cases.
>=20
> Yeah, that's also going into a direction I was questioning. Do we
> have=20
> use cases for the resource iterator were we don't lock the BO?

>=20
> If not why don't we integrate all this into the first_resource() and=20
> next_resource() functions instead? Obviously with some helpers in the
> BO=20
> code.

That'd be if we moved this out to a drm-level layer like the work Oak
started for cross-component eviction targeting SVM.

I guess it's also my desire for keeping components separated as much as
possible, but I'm aware others may feel differently about that.

>=20
> > So my suggestion is we keep this until we've come up with a bullet-
> > proof way to sort out a) and b) above and then we can rip it out.
>=20
> Yeah if we can't make progress otherwise that works for me as well.

Then I'd say let's go for this and revisit.=C2=A0

So what are the ARs here?
Making sure we have a clean init and fini is something I've thought of
as well.

Related to that, what's your opinion on using DEFINE_CLASS() and
scoped_guard() in TTM for automatic cleanup of the iterator when
leaving the loop scope?

https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/cleanup.h#L=
168

Thanks,
Thomas

>=20
> Regards,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > >=20
> > > > Changes in previous series:
> > > > - Completely rework the functionality
> > > > - Avoid a NULL pointer dereference assigning manager->mem_type
> > > > - Remove some leftover code causing build problems
> > > > v2:
> > > > - For hitch bulk tail moves, store the mem_type in the cursor
> > > > =C2=A0=C2=A0=C2=A0 instead of with the manager.
> > > > v3:
> > > > - Remove leftover mem_type member from change in v2.
> > > > v6:
> > > > - Add some lockdep asserts (Matthew Brost)
> > > > - Avoid NULL pointer dereference (Matthew Brost)
> > > > - No need to check bo->resource before dereferencing
> > > > =C2=A0=C2=A0=C2=A0 bo->bulk_move (Matthew Brost)
> > > >=20
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |=C2=A0 4 ++
> > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 92
> > > > ++++++++++++++++++++++++++
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> > > > =C2=A0=C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 56 ++++++++++------
> > > > =C2=A0=C2=A0 4 files changed, 135 insertions(+), 21 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > index 3abfa66d72a2..97743993d711 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device
> > > > *adev, struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0	if (r)
> > > > =C2=A0=C2=A0=C2=A0		return r;
> > > > =C2=A0=C2=A0=20
> > > > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > > > +
> > > > =C2=A0=C2=A0=C2=A0	vm->is_compute_context =3D false;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	vm->use_cpu_for_update =3D !!(adev-
> > > > > vm_manager.vm_update_mode &
> > > > @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device
> > > > *adev, struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0 error_free_delayed:
> > > > =C2=A0=C2=A0=C2=A0	dma_fence_put(vm->last_tlb_flush);
> > > > =C2=A0=C2=A0=C2=A0	dma_fence_put(vm->last_unlocked);
> > > > +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
> > > > > lru_bulk_move);
> > > > =C2=A0=C2=A0=C2=A0	amdgpu_vm_fini_entities(vm);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	return r;
> > > > @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device
> > > > *adev, struct amdgpu_vm *vm)
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0=20
> > > > +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
> > > > > lru_bulk_move);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /**
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > > > b/drivers/gpu/drm/ttm/ttm_resource.c
> > > > index 9c8b6499edfb..b6a2daac5518 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > > @@ -33,6 +33,53 @@
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <drm/drm_util.h>
> > > > =C2=A0=C2=A0=20
> > > > +/* Detach the cursor from the bulk move list*/
> > > > +static void
> > > > +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor
> > > > *cursor)
> > > > +{
> > > > +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > > > +
> > > > +	cursor->bulk =3D NULL;
> > > > +	list_del_init(&cursor->bulk_link);
> > > > +}
> > > > +
> > > > +/* Move the cursor to the end of the bulk move list it's in */
> > > > +static void ttm_resource_cursor_move_bulk_tail(struct
> > > > ttm_lru_bulk_move *bulk,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > > ttm_resource_cursor *cursor)
> > > > +{
> > > > +	struct ttm_lru_bulk_move_pos *pos;
> > > > +
> > > > +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > > > +
> > > > +	if (WARN_ON_ONCE(bulk !=3D cursor->bulk)) {
> > > > +		list_del_init(&cursor->bulk_link);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	pos =3D &bulk->pos[cursor->mem_type][cursor->priority];
> > > > +	if (pos->last)
> > > > +		list_move(&cursor->hitch.link, &pos->last-
> > > > > lru.link);
> > > > +	ttm_resource_cursor_clear_bulk(cursor);
> > > > +}
> > > > +
> > > > +/* Move all cursors attached to a bulk move to its end */
> > > > +static void ttm_bulk_move_adjust_cursors(struct
> > > > ttm_lru_bulk_move
> > > > *bulk)
> > > > +{
> > > > +	struct ttm_resource_cursor *cursor, *next;
> > > > +
> > > > +	list_for_each_entry_safe(cursor, next, &bulk-
> > > > >cursor_list,
> > > > bulk_link)
> > > > +		ttm_resource_cursor_move_bulk_tail(bulk,
> > > > cursor);
> > > > +}
> > > > +
> > > > +/* Remove a cursor from an empty bulk move list */
> > > > +static void ttm_bulk_move_drop_cursors(struct
> > > > ttm_lru_bulk_move
> > > > *bulk)
> > > > +{
> > > > +	struct ttm_resource_cursor *cursor, *next;
> > > > +
> > > > +	list_for_each_entry_safe(cursor, next, &bulk-
> > > > >cursor_list,
> > > > bulk_link)
> > > > +		ttm_resource_cursor_clear_bulk(cursor);
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * ttm_resource_cursor_fini_locked() - Finalize t=
he LRU list
> > > > cursor usage
> > > > =C2=A0=C2=A0=C2=A0 * @cursor: The struct ttm_resource_cursor to fin=
alize.
> > > > @@ -45,6 +92,7 @@ void ttm_resource_cursor_fini_locked(struct
> > > > ttm_resource_cursor *cursor)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0	lockdep_assert_held(&cursor->man->bdev->lru_lock=
);
> > > > =C2=A0=C2=A0=C2=A0	list_del_init(&cursor->hitch.link);
> > > > +	ttm_resource_cursor_clear_bulk(cursor);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /**
> > > > @@ -73,9 +121,27 @@ void ttm_resource_cursor_fini(struct
> > > > ttm_resource_cursor *cursor)
> > > > =C2=A0=C2=A0 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *=
bulk)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0	memset(bulk, 0, sizeof(*bulk));
> > > > +	INIT_LIST_HEAD(&bulk->cursor_list);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0 EXPORT_SYMBOL(ttm_lru_bulk_move_init);
> > > > =C2=A0=C2=A0=20
> > > > +/**
> > > > + * ttm_lru_bulk_move_fini - finalize a bulk move structure
> > > > + * @bdev: The struct ttm_device
> > > > + * @bulk: the structure to finalize
> > > > + *
> > > > + * Sanity checks that bulk moves don't have any
> > > > + * resources left and hence no cursors attached.
> > > > + */
> > > > +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> > > > +			=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move *bulk)
> > > > +{
> > > > +	spin_lock(&bdev->lru_lock);
> > > > +	ttm_bulk_move_drop_cursors(bulk);
> > > > +	spin_unlock(&bdev->lru_lock);
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
> > > > +
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * ttm_lru_bulk_move_tail - bulk move range of re=
sources to
> > > > the
> > > > LRU tail.
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > @@ -88,6 +154,7 @@ void ttm_lru_bulk_move_tail(struct
> > > > ttm_lru_bulk_move *bulk)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0	unsigned i, j;
> > > > =C2=A0=C2=A0=20
> > > > +	ttm_bulk_move_adjust_cursors(bulk);
> > > > =C2=A0=C2=A0=C2=A0	for (i =3D 0; i < TTM_NUM_MEM_TYPES; ++i) {
> > > > =C2=A0=C2=A0=C2=A0		for (j =3D 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> > > > =C2=A0=C2=A0=C2=A0			struct ttm_lru_bulk_move_pos *pos =3D
> > > > &bulk-
> > > > > pos[i][j];
> > > > @@ -515,6 +582,28 @@ void ttm_resource_manager_debug(struct
> > > > ttm_resource_manager *man,
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0 EXPORT_SYMBOL(ttm_resource_manager_debug);
> > > > =C2=A0=C2=A0=20
> > > > +static void
> > > > +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor
> > > > *cursor,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_lru_item *next_=
lru)
> > > > +{
> > > > +	struct ttm_resource *next =3D
> > > > ttm_lru_item_to_res(next_lru);
> > > > +	struct ttm_lru_bulk_move *bulk =3D NULL;
> > > > +	struct ttm_buffer_object *bo =3D next->bo;
> > > > +
> > > > +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > > > +	bulk =3D bo->bulk_move;
> > > > +
> > > > +	if (cursor->bulk !=3D bulk) {
> > > > +		if (bulk) {
> > > > +			list_move_tail(&cursor->bulk_link,
> > > > &bulk-
> > > > > cursor_list);
> > > > +			cursor->mem_type =3D next->mem_type;
> > > > +		} else {
> > > > +			list_del_init(&cursor->bulk_link);
> > > > +		}
> > > > +		cursor->bulk =3D bulk;
> > > > +	}
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * ttm_resource_manager_first() - Start iterating=
 over the
> > > > resources
> > > > =C2=A0=C2=A0=C2=A0 * of a resource manager
> > > > @@ -535,6 +624,7 @@ ttm_resource_manager_first(struct
> > > > ttm_resource_manager *man,
> > > > =C2=A0=C2=A0=C2=A0	cursor->priority =3D 0;
> > > > =C2=A0=C2=A0=C2=A0	cursor->man =3D man;
> > > > =C2=A0=C2=A0=C2=A0	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH)=
;
> > > > +	INIT_LIST_HEAD(&cursor->bulk_link);
> > > > =C2=A0=C2=A0=C2=A0	list_add(&cursor->hitch.link, &man->lru[cursor-
> > > > > priority]);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	return ttm_resource_manager_next(cursor);
> > > > @@ -559,6 +649,7 @@ ttm_resource_manager_next(struct
> > > > ttm_resource_cursor *cursor)
> > > > =C2=A0=C2=A0=C2=A0		lru =3D &cursor->hitch;
> > > > =C2=A0=C2=A0=C2=A0		list_for_each_entry_continue(lru, &man-
> > > > > lru[cursor->priority], link) {
> > > > =C2=A0=C2=A0=C2=A0			if (ttm_lru_item_is_res(lru)) {
> > > > +				ttm_resource_cursor_check_bulk
> > > > (cur
> > > > sor, lru);
> > > > =C2=A0=C2=A0=C2=A0				list_move(&cursor->hitch.link,
> > > > &lru->link);
> > > > =C2=A0=C2=A0=C2=A0				return
> > > > ttm_lru_item_to_res(lru);
> > > > =C2=A0=C2=A0=C2=A0			}
> > > > @@ -568,6 +659,7 @@ ttm_resource_manager_next(struct
> > > > ttm_resource_cursor *cursor)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		list_move(&cursor->hitch.link, &man-
> > > > >lru[cursor-
> > > > > priority]);
> > > > +		ttm_resource_cursor_clear_bulk(cursor);
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	ttm_resource_cursor_fini_locked(cursor);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 5b166fa03684..0c7e327bc9a2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1335,6 +1335,8 @@ struct xe_vm *xe_vm_create(struct
> > > > xe_device
> > > > *xe, u32 flags)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	INIT_WORK(&vm->destroy_work, vm_destroy_work_fun=
c);
> > > > =C2=A0=C2=A0=20
> > > > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > > > +
> > > > =C2=A0=C2=A0=C2=A0	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> > > > =C2=A0=C2=A0=C2=A0	vm->preempt.min_run_period_ms =3D 10;	/* FIXME: =
Wire
> > > > up
> > > > to uAPI */
> > > > =C2=A0=C2=A0=20
> > > > @@ -1458,6 +1460,7 @@ struct xe_vm *xe_vm_create(struct
> > > > xe_device
> > > > *xe, u32 flags)
> > > > =C2=A0=C2=A0=C2=A0	mutex_destroy(&vm->snap_mutex);
> > > > =C2=A0=C2=A0=C2=A0	for_each_tile(tile, xe, id)
> > > > =C2=A0=C2=A0=C2=A0		xe_range_fence_tree_fini(&vm->rftree[id]);
> > > > +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> > > > =C2=A0=C2=A0=C2=A0	kfree(vm);
> > > > =C2=A0=C2=A0=C2=A0	if (flags & XE_VM_FLAG_LR_MODE)
> > > > =C2=A0=C2=A0=C2=A0		xe_pm_runtime_put(xe);
> > > > @@ -1601,6 +1604,7 @@ static void vm_destroy_work_func(struct
> > > > work_struct *w)
> > > > =C2=A0=C2=A0=C2=A0		XE_WARN_ON(vm->pt_root[id]);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	trace_xe_vm_free(vm);
> > > > +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> > > > =C2=A0=C2=A0=C2=A0	kfree(vm);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > diff --git a/include/drm/ttm/ttm_resource.h
> > > > b/include/drm/ttm/ttm_resource.h
> > > > index 8fac781f641e..571abb4861a6 100644
> > > > --- a/include/drm/ttm/ttm_resource.h
> > > > +++ b/include/drm/ttm/ttm_resource.h
> > > > @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item
> > > > *item)
> > > > =C2=A0=C2=A0=C2=A0	return container_of(item, struct ttm_resource, l=
ru);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > -/**
> > > > - * struct ttm_resource_cursor
> > > > - *
> > > > - * @man: The resource manager currently being iterated over.
> > > > - * @hitch: A hitch list node inserted before the next resource
> > > > - * to iterate over.
> > > > - * @priority: the current priority
> > > > - *
> > > > - * Cursor to iterate over the resources in a manager.
> > > > - */
> > > > -struct ttm_resource_cursor {
> > > > -	struct ttm_resource_manager *man;
> > > > -	struct ttm_lru_item hitch;
> > > > -	unsigned int priority;
> > > > -};
> > > > -
> > > > -void ttm_resource_cursor_fini_locked(struct
> > > > ttm_resource_cursor
> > > > *cursor);
> > > > -
> > > > -void ttm_resource_cursor_fini(struct ttm_resource_cursor
> > > > *cursor);
> > > > -
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * struct ttm_lru_bulk_move_pos
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * struct ttm_lru_bulk_move
> > > > - *
> > > > =C2=A0=C2=A0=C2=A0 * @pos: first/last lru entry for resources in th=
e each
> > > > domain/priority
> > > > + * @cursor_list: The list of cursors currently traversing any
> > > > of
> > > > + * the sublists of @pos. Protected by the ttm device's
> > > > lru_lock.
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0=C2=A0 * Container for the current bulk move state. Sho=
uld be used
> > > > with
> > > > =C2=A0=C2=A0=C2=A0 * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_m=
ove().
> > > > @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0 struct ttm_lru_bulk_move {
> > > > =C2=A0=C2=A0=C2=A0	struct ttm_lru_bulk_move_pos
> > > > pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> > > > +	struct list_head cursor_list;
> > > > =C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=20
> > > > +/**
> > > > + * struct ttm_resource_cursor
> > > > + * @man: The resource manager currently being iterated over
> > > > + * @hitch: A hitch list node inserted before the next resource
> > > > + * to iterate over.
> > > > + * @bulk_link: A list link for the list of cursors traversing
> > > > the
> > > > + * bulk sublist of @bulk. Protected by the ttm device's
> > > > lru_lock.
> > > > + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange
> > > > @hitch is
> > > > + * inserted to. NULL if none. Never dereference this pointer
> > > > since
> > > > + * the struct ttm_lru_bulk_move object pointed to might have
> > > > been
> > > > + * freed. The pointer is only for comparison.
> > > > + * @mem_type: The memory type of the LRU list being traversed.
> > > > + * This field is valid iff @bulk !=3D NULL.
> > > > + * @priority: the current priority
> > > > + *
> > > > + * Cursor to iterate over the resources in a manager.
> > > > + */
> > > > +struct ttm_resource_cursor {
> > > > +	struct ttm_resource_manager *man;
> > > > +	struct ttm_lru_item hitch;
> > > > +	struct list_head bulk_link;
> > > > +	struct ttm_lru_bulk_move *bulk;
> > > > +	unsigned int mem_type;
> > > > +	unsigned int priority;
> > > > +};
> > > > +
> > > > +void ttm_resource_cursor_fini_locked(struct
> > > > ttm_resource_cursor
> > > > *cursor);
> > > > +
> > > > +void ttm_resource_cursor_fini(struct ttm_resource_cursor
> > > > *cursor);
> > > > +
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * struct ttm_kmap_iter_iomap - Specialization fo=
r a struct
> > > > io_mapping +
> > > > =C2=A0=C2=A0=C2=A0 * struct sg_table backed struct ttm_resource.
> > > > @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct
> > > > ttm_resource_manager *man)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *=
bulk);
> > > > =C2=A0=C2=A0 void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *=
bulk);
> > > > +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> > > > +			=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move *bulk);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 void ttm_resource_add_bulk_move(struct ttm_resource *r=
es,
> > > > =C2=A0=C2=A0=C2=A0				struct ttm_buffer_object *bo);
>=20

