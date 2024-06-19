Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6C90E572
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 10:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EB910EB03;
	Wed, 19 Jun 2024 08:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeTDie3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD6310EAFB;
 Wed, 19 Jun 2024 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718785470; x=1750321470;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SIIYwm288/xEQf6IrXwUe8ZRaOBoTpuRUC9jH0nEdUQ=;
 b=BeTDie3fpx2q/ksoozmxtOk/dHAz0gNMx30W+GcOc6I3QdSoCGgV0OO5
 Dp5JIvvX5mWzCg3Fg/3gNIvJS44BmBMFmA31oXvgUplNMjER53Knqlcg4
 69PqJrvcjkLt0ay4CN0h6YN54na+J9beM7K3mu92H7YtWtoIsLmA9fal7
 yDUqYiMij0xHJQ9E1Dk5xnu6AigPQbmMe+gQIs26qJazd9CcmtrkrCxEl
 QrdXn2/4WHpjOhOaZhiM1YROH0hrpMoCELEk7hfXqczfghdzLmMUw2ES7
 X1Z+iPN+UGUUtJbt7F7ea6+Ycq5Rufl+q4oftpOUAVZc7zHyIxHJAjPQl w==;
X-CSE-ConnectionGUID: HH0LJmD6TEKfkNmlD2stHw==
X-CSE-MsgGUID: a8VvUr5jRzCfP8MjFG7H6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15850191"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="15850191"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 01:24:29 -0700
X-CSE-ConnectionGUID: CT1voG0yQECCclmmQPhcmw==
X-CSE-MsgGUID: cvyj7TIpSvuTL819YFZqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="46271189"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 01:24:28 -0700
Message-ID: <074e7b0a09e6304b8ea520560e1476717e1f3655.camel@linux.intel.com>
Subject: Re: [PATCH v5 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Wed, 19 Jun 2024 10:24:25 +0200
In-Reply-To: <ZnJSZlUPs0ohKsHn@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-5-thomas.hellstrom@linux.intel.com>
 <ZnJSZlUPs0ohKsHn@DUT025-TGLU.fm.intel.com>
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

On Wed, 2024-06-19 at 03:37 +0000, Matthew Brost wrote:
> On Tue, Jun 18, 2024 at 09:18:12AM +0200, Thomas Hellstr=C3=B6m wrote:
>=20
> Ugh, replying to correct version again...
>=20
> > To address the problem with hitches moving when bulk move
> > sublists are lru-bumped, register the list cursors with the
> > ttm_lru_bulk_move structure when traversing its list, and
> > when lru-bumping the list, move the cursor hitch to the tail.
>=20
> - So the hitch moves to the tail (last) which points to the next item
> in
> =C2=A0 the LRU list
> - Then bulk is moved which is from first -> last to the end of the
> LRU
> =C2=A0 list
> - Now the hitch remains in the correct position in the list (i.e. it
> =C2=A0 didn't move with the bulk)
>=20
> Did I get that right?

Yes, correct.

>=20
> > This also means it's mandatory for drivers to call
> > ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
> > initializing and finalizing the bulk move structure, so add
> > those calls to the amdgpu- and xe driver.
> >=20
> > Compared to v1 this is slightly more code but less fragile
> > and hopefully easier to understand.
> >=20
> > Changes in previous series:
> > - Completely rework the functionality
> > - Avoid a NULL pointer dereference assigning manager->mem_type
> > - Remove some leftover code causing build problems
> > v2:
> > - For hitch bulk tail moves, store the mem_type in the cursor
> > =C2=A0 instead of with the manager.
> > v3:
> > - Remove leftover mem_type member from change in v2.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |=C2=A0 4 ++
> > =C2=A0drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=C2=A0 | 89
> > ++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> > =C2=A0include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 56 ++++++++++------
> > =C2=A04 files changed, 132 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index 3abfa66d72a2..97743993d711 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device
> > *adev, struct amdgpu_vm *vm,
> > =C2=A0	if (r)
> > =C2=A0		return r;
> > =C2=A0
> > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > +
> > =C2=A0	vm->is_compute_context =3D false;
> > =C2=A0
> > =C2=A0	vm->use_cpu_for_update =3D !!(adev-
> > >vm_manager.vm_update_mode &
> > @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device
> > *adev, struct amdgpu_vm *vm,
> > =C2=A0error_free_delayed:
> > =C2=A0	dma_fence_put(vm->last_tlb_flush);
> > =C2=A0	dma_fence_put(vm->last_unlocked);
> > +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
> > >lru_bulk_move);
> > =C2=A0	amdgpu_vm_fini_entities(vm);
> > =C2=A0
> > =C2=A0	return r;
> > @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device
> > *adev, struct amdgpu_vm *vm)
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
> > >lru_bulk_move);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index 9c8b6499edfb..a03090683e79 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -33,6 +33,49 @@
> > =C2=A0
> > =C2=A0#include <drm/drm_util.h>
> > =C2=A0
> > +/* Detach the cursor from the bulk move list*/
> > +static void
> > +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
> > +{
>=20
> A lockdep annotation wouldn't hurt here.

Will add.

>=20
> > +	cursor->bulk =3D NULL;
> > +	list_del_init(&cursor->bulk_link);
> > +}
> > +
> > +/* Move the cursor to the end of the bulk move list it's in */
> > +static void ttm_resource_cursor_move_bulk_tail(struct
> > ttm_lru_bulk_move *bulk,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > ttm_resource_cursor *cursor)
> > +{
> > +	struct ttm_lru_bulk_move_pos *pos;
> > +
>=20
> A lockdep annotation wouldn't hurt here too.

+1!

>=20
> > +	if (WARN_ON_ONCE(bulk !=3D cursor->bulk)) {
> > +		list_del_init(&cursor->bulk_link);
> > +		return;
> > +	}
> > +
> > +	pos =3D &bulk->pos[cursor->mem_type][cursor->priority];
> > +	if (pos)
>=20
> 'if (pos->last)'?
>=20
> As 'if (pos)' is going to always be true given you are using the
> address
> of operator (&) on an instantiated struct ttm_lru_bulk_move_pos.

Good catch! I'll fix that up.

>=20
> > +		list_move(&cursor->hitch.link, &pos->last-
> > >lru.link);
>=20
> This should be list_move_tail, right? So last->next =3D=3D hitch.
>=20
> As the code is last->prev =3D=3D hitch which means the hitch would be
> included in the bulk move, right?

It's the other way around right? list_move(a, b) will insert a as b-
>next, which is what we want.

>=20
> > +	ttm_resource_cursor_clear_bulk(cursor);
> > +}
> > +
> > +/* Move all cursors attached to a bulk move to its end */
> > +static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move
> > *bulk)
> > +{
> > +	struct ttm_resource_cursor *cursor, *next;
> > +
> > +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list,
> > bulk_link)
> > +		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
> > +}
> > +
> > +/* Remove a cursor from an empty bulk move list */
> > +static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move
> > *bulk)
> > +{
> > +	struct ttm_resource_cursor *cursor, *next;
> > +
> > +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list,
> > bulk_link)
> > +		ttm_resource_cursor_clear_bulk(cursor);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_resource_cursor_fini_locked() - Finalize the LRU list
> > cursor usage
> > =C2=A0 * @cursor: The struct ttm_resource_cursor to finalize.
> > @@ -45,6 +88,7 @@ void ttm_resource_cursor_fini_locked(struct
> > ttm_resource_cursor *cursor)
> > =C2=A0{
> > =C2=A0	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > =C2=A0	list_del_init(&cursor->hitch.link);
> > +	ttm_resource_cursor_clear_bulk(cursor);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -73,9 +117,27 @@ void ttm_resource_cursor_fini(struct
> > ttm_resource_cursor *cursor)
> > =C2=A0void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
> > =C2=A0{
> > =C2=A0	memset(bulk, 0, sizeof(*bulk));
> > +	INIT_LIST_HEAD(&bulk->cursor_list);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_lru_bulk_move_init);
> > =C2=A0
> > +/**
> > + * ttm_lru_bulk_move_fini - finalize a bulk move structure
> > + * @bdev: The struct ttm_device
> > + * @bulk: the structure to finalize
> > + *
> > + * Sanity checks that bulk moves don't have any
> > + * resources left and hence no cursors attached.
> > + */
> > +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> > +			=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move *bulk)
> > +{
> > +	spin_lock(&bdev->lru_lock);
> > +	ttm_bulk_move_drop_cursors(bulk);
> > +	spin_unlock(&bdev->lru_lock);
> > +}
> > +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_lru_bulk_move_tail - bulk move range of resources to the
> > LRU tail.
> > =C2=A0 *
> > @@ -88,6 +150,7 @@ void ttm_lru_bulk_move_tail(struct
> > ttm_lru_bulk_move *bulk)
> > =C2=A0{
> > =C2=A0	unsigned i, j;
> > =C2=A0
> > +	ttm_bulk_move_adjust_cursors(bulk);
> > =C2=A0	for (i =3D 0; i < TTM_NUM_MEM_TYPES; ++i) {
> > =C2=A0		for (j =3D 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> > =C2=A0			struct ttm_lru_bulk_move_pos *pos =3D &bulk-
> > >pos[i][j];
> > @@ -515,6 +578,29 @@ void ttm_resource_manager_debug(struct
> > ttm_resource_manager *man,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_resource_manager_debug);
> > =C2=A0
> > +static void
> > +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_lru_item *next_lru)
> > +{
> > +	struct ttm_resource *next =3D ttm_lru_item_to_res(next_lru);
> > +	struct ttm_lru_bulk_move *bulk =3D NULL;
> > +	struct ttm_buffer_object *bo =3D next->bo;
> > +
> > +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > +	if (bo && bo->resource =3D=3D next)
> > +		bulk =3D bo->bulk_move;
>=20
>=20
> Can you explain what the above if statement is doing, struggling a
> bit
> here. Is this a weird case where the LRU item (struct ttm_resource)
> is
> fully (1st condition) or partially (2nd condition) detached from a
> BO?

Yeah, this is a weird corner case where the resource is handed over to
a ghost object, and the lock protection is not clearly specified. From
my reading of the code, at least bo->resource is not protected by the
LRU lock when clearing, but bo->bulk_move is, so given that, perhaps
the test is indeed unnecessary.

>=20
> > +
> > +	if (cursor->bulk !=3D bulk) {
> > +		if (bulk) {
> > +			list_move_tail(&cursor->bulk_link, &bulk-
> > >cursor_list);
> > +			cursor->mem_type =3D next->mem_type;
> > +		} else {
> > +			list_del_init(&cursor->bulk_link);
> > +		}
> > +		cursor->bulk =3D bulk;
> > +	}
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_resource_manager_first() - Start iterating over the
> > resources
> > =C2=A0 * of a resource manager
> > @@ -535,6 +621,7 @@ ttm_resource_manager_first(struct
> > ttm_resource_manager *man,
> > =C2=A0	cursor->priority =3D 0;
> > =C2=A0	cursor->man =3D man;
> > =C2=A0	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> > +	INIT_LIST_HEAD(&cursor->bulk_link);
> > =C2=A0	list_add(&cursor->hitch.link, &man->lru[cursor-
> > >priority]);
> > =C2=A0
> > =C2=A0	return ttm_resource_manager_next(cursor);
> > @@ -559,6 +646,7 @@ ttm_resource_manager_next(struct
> > ttm_resource_cursor *cursor)
> > =C2=A0		lru =3D &cursor->hitch;
> > =C2=A0		list_for_each_entry_continue(lru, &man-
> > >lru[cursor->priority], link) {
> > =C2=A0			if (ttm_lru_item_is_res(lru)) {
> > +				ttm_resource_cursor_check_bulk(cur
> > sor, lru);
> > =C2=A0				list_move(&cursor->hitch.link,
> > &lru->link);
>=20
> Sorry noticing this here from a different patch. Shouldn't this be
> list_move_tail so if the LRU can't be evicted we don't pick it again?

Same as above.

>=20
> Matt
>=20
> > =C2=A0				return ttm_lru_item_to_res(lru);
> > =C2=A0			}
> > @@ -568,6 +656,7 @@ ttm_resource_manager_next(struct
> > ttm_resource_cursor *cursor)
> > =C2=A0			break;
> > =C2=A0
> > =C2=A0		list_move(&cursor->hitch.link, &man->lru[cursor-
> > >priority]);
> > +		ttm_resource_cursor_clear_bulk(cursor);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ttm_resource_cursor_fini_locked(cursor);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 61d4d95a5377..226da3c74f9c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1339,6 +1339,8 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> > =C2=A0
> > =C2=A0	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > =C2=A0
> > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > +
> > =C2=A0	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> > =C2=A0	vm->preempt.min_run_period_ms =3D 10;	/* FIXME: Wire up
> > to uAPI */
> > =C2=A0
> > @@ -1462,6 +1464,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> > =C2=A0	mutex_destroy(&vm->snap_mutex);
> > =C2=A0	for_each_tile(tile, xe, id)
> > =C2=A0		xe_range_fence_tree_fini(&vm->rftree[id]);
> > +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> > =C2=A0	kfree(vm);
> > =C2=A0	if (flags & XE_VM_FLAG_LR_MODE)
> > =C2=A0		xe_pm_runtime_put(xe);
> > @@ -1605,6 +1608,7 @@ static void vm_destroy_work_func(struct
> > work_struct *w)
> > =C2=A0		XE_WARN_ON(vm->pt_root[id]);
> > =C2=A0
> > =C2=A0	trace_xe_vm_free(vm);
> > +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> > =C2=A0	kfree(vm);
> > =C2=A0}
> > =C2=A0
> > diff --git a/include/drm/ttm/ttm_resource.h
> > b/include/drm/ttm/ttm_resource.h
> > index 8fac781f641e..571abb4861a6 100644
> > --- a/include/drm/ttm/ttm_resource.h
> > +++ b/include/drm/ttm/ttm_resource.h
> > @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
> > =C2=A0	return container_of(item, struct ttm_resource, lru);
> > =C2=A0}
> > =C2=A0
> > -/**
> > - * struct ttm_resource_cursor
> > - *
> > - * @man: The resource manager currently being iterated over.
> > - * @hitch: A hitch list node inserted before the next resource
> > - * to iterate over.
> > - * @priority: the current priority
> > - *
> > - * Cursor to iterate over the resources in a manager.
> > - */
> > -struct ttm_resource_cursor {
> > -	struct ttm_resource_manager *man;
> > -	struct ttm_lru_item hitch;
> > -	unsigned int priority;
> > -};
> > -
> > -void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
> > *cursor);
> > -
> > -void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> > -
> > =C2=A0/**
> > =C2=A0 * struct ttm_lru_bulk_move_pos
> > =C2=A0 *
> > @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * struct ttm_lru_bulk_move
> > - *
> > =C2=A0 * @pos: first/last lru entry for resources in the each
> > domain/priority
> > + * @cursor_list: The list of cursors currently traversing any of
> > + * the sublists of @pos. Protected by the ttm device's lru_lock.
> > =C2=A0 *
> > =C2=A0 * Container for the current bulk move state. Should be used with
> > =C2=A0 * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> > @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
> > =C2=A0 */
> > =C2=A0struct ttm_lru_bulk_move {
> > =C2=A0	struct ttm_lru_bulk_move_pos
> > pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> > +	struct list_head cursor_list;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct ttm_resource_cursor
> > + * @man: The resource manager currently being iterated over
> > + * @hitch: A hitch list node inserted before the next resource
> > + * to iterate over.
> > + * @bulk_link: A list link for the list of cursors traversing the
> > + * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
> > + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange
> > @hitch is
> > + * inserted to. NULL if none. Never dereference this pointer since
> > + * the struct ttm_lru_bulk_move object pointed to might have been
> > + * freed. The pointer is only for comparison.
> > + * @mem_type: The memory type of the LRU list being traversed.
> > + * This field is valid iff @bulk !=3D NULL.
> > + * @priority: the current priority
> > + *
> > + * Cursor to iterate over the resources in a manager.
> > + */
> > +struct ttm_resource_cursor {
> > +	struct ttm_resource_manager *man;
> > +	struct ttm_lru_item hitch;
> > +	struct list_head bulk_link;
> > +	struct ttm_lru_bulk_move *bulk;
> > +	unsigned int mem_type;
> > +	unsigned int priority;
> > +};
> > +
> > +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
> > *cursor);
> > +
> > +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> > +
> > =C2=A0/**
> > =C2=A0 * struct ttm_kmap_iter_iomap - Specialization for a struct
> > io_mapping +
> > =C2=A0 * struct sg_table backed struct ttm_resource.
> > @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct
> > ttm_resource_manager *man)
> > =C2=A0
> > =C2=A0void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
> > =C2=A0void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> > +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> > +			=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move *bulk);
> > =C2=A0
> > =C2=A0void ttm_resource_add_bulk_move(struct ttm_resource *res,
> > =C2=A0				struct ttm_buffer_object *bo);
> > --=20
> > 2.44.0
> >=20

