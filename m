Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A879F2E3D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E8C10E583;
	Mon, 16 Dec 2024 10:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrDymyod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ABB10E582;
 Mon, 16 Dec 2024 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734345404; x=1765881404;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eXjfjlX6tkQzfr6zKfizXXMKnZpHOHS+YcuO77yKq/A=;
 b=mrDymyod3/YLdUfvzvKbKdIgjQP2I/k7DAqFxtMIkfrbqzBEcu4SZkmw
 izqcIDTeWuQF06BvIHvX4taUWxt4LshA75CHJYAF8MAQyPFsvcwgcFHF9
 86ZDto1+Ynf/MiiI20Ibqo09dOAEPsT+n5Yn+K1I1r8OV196ewLR8ARDJ
 fcPnaI4ltRTACdLKhMN0q6T0N/ViuWTQ+UYrEdL48CPY1+t53NQ9GCSIt
 KmG4Y+WswWw+CMMtlJkgYeUA0o4gyQogVwJBJ6UwyOFgh7CkZfCH/jecn
 9lESDfRkdRpTXZryvx17QJS+WZzlqZmIUBEFDPSf/Zc247hJuL+BlGU86 Q==;
X-CSE-ConnectionGUID: NmK9PbSJS8KbJCA1rU8b9Q==
X-CSE-MsgGUID: k9+lk7tJQqKuBm+aTzApaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46132806"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="46132806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 02:36:44 -0800
X-CSE-ConnectionGUID: YhMZX1eFRzug0k/roWhrdA==
X-CSE-MsgGUID: D90dOze8Qom+15bw+IMgWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97031208"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.246])
 ([10.245.246.246])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 02:36:23 -0800
Message-ID: <334bb2c9d2ff97caf712f5f8c17b494c63869265.camel@linux.intel.com>
Subject: Re: [PATCH v2 12/29] drm/xe: Add SVM garbage collector
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 16 Dec 2024 11:36:20 +0100
In-Reply-To: <Z1nlWBOgEOMuKbN2@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-13-matthew.brost@intel.com>
 <747e7befa275ac0fcc95dc4e7e7aca27020e8dda.camel@linux.intel.com>
 <Z1nlWBOgEOMuKbN2@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Wed, 2024-12-11 at 11:17 -0800, Matthew Brost wrote:
> On Tue, Nov 19, 2024 at 03:45:33PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > > Add basic SVM garbage collector which can destroy an SVM range
> > > upon
> > > an
> > > MMU UNMAP event.
> > >=20
> > > v2:
> > > =C2=A0- Flush garbage collector in xe_svm_close
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 87
> > > +++++++++++++++++++++++++++++++-
> > > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++
> > > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 5 ++
> > > =C2=A04 files changed, 95 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index a9addaea316d..9c2f44cba166 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -30,6 +30,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> > > =C2=A0	if (!range)
> > > =C2=A0		return ERR_PTR(-ENOMEM);
> > > =C2=A0
> > > +	INIT_LIST_HEAD(&range->garbage_collector_link);
> > > =C2=A0	xe_vm_get(gpusvm_to_vm(gpusvm));
> > > =C2=A0
> > > =C2=A0	return &range->base;
> > > @@ -46,6 +47,24 @@ static struct xe_svm_range *to_xe_range(struct
> > > drm_gpusvm_range *r)
> > > =C2=A0	return container_of(r, struct xe_svm_range, base);
> > > =C2=A0}
> > > =C2=A0
> > > +static void
> > > +xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct
> > > xe_svm_range *range,
> > > +				=C2=A0=C2=A0 const struct
> > > mmu_notifier_range
> > > *mmu_range)
> > > +{
> > > +	struct xe_device *xe =3D vm->xe;
> > > +
> > > +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> > > +
> > > +	spin_lock(&vm->svm.garbage_collector.lock);
> > > +	if (list_empty(&range->garbage_collector_link))
> > > +		list_add_tail(&range->garbage_collector_link,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm-
> > > > svm.garbage_collector.range_list);
> > > +	spin_unlock(&vm->svm.garbage_collector.lock);
> > > +
> > > +	queue_work(xe_device_get_root_tile(xe)->primary_gt-
> > > > usm.pf_wq,
> > > +		=C2=A0=C2=A0 &vm->svm.garbage_collector.work);
> > > +}
> > > +
> > > =C2=A0static u8
> > > =C2=A0xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> > > drm_gpusvm_range *r,
> > > =C2=A0				=C2=A0 const struct
> > > mmu_notifier_range
> > > *mmu_range,
> > > @@ -88,7 +107,9 @@ xe_svm_range_notifier_event_end(struct xe_vm
> > > *vm,
> > > struct drm_gpusvm_range *r,
> > > =C2=A0	struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D true, };
> > > =C2=A0
> > > =C2=A0	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > > -	/* TODO: Add range to garbage collector */
> > > +	if (mmu_range->event =3D=3D MMU_NOTIFY_UNMAP)
> > > +		xe_svm_garbage_collector_add_range(vm,
> > > to_xe_range(r),
> > > +						=C2=A0=C2=A0 mmu_range);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > > @@ -184,6 +205,58 @@ static void xe_svm_invalidate(struct
> > > drm_gpusvm
> > > *gpusvm,
> > > =C2=A0		xe_svm_range_notifier_event_end(vm, r,
> > > mmu_range);
> > > =C2=A0}
> > > =C2=A0
> > > +static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range
> > > *range)
> > > +{
> > > +	/* TODO: Do unbind */
> > > +
> > > +	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int xe_svm_garbage_collector(struct xe_vm *vm)
> > > +{
> > > +	struct xe_svm_range *range, *next;
> > > +	int err;
> > > +
> > > +	lockdep_assert_held_write(&vm->lock);
> > > +
> > > +	if (xe_vm_is_closed_or_banned(vm))
> > > +		return -ENOENT;
> > > +
> > > +	spin_lock(&vm->svm.garbage_collector.lock);
> > > +	list_for_each_entry_safe(range, next,
> > > +				 &vm-
> > > > svm.garbage_collector.range_list,
> > > +				 garbage_collector_link) {
> > > +		list_del(&range->garbage_collector_link);
> > > +		spin_unlock(&vm->svm.garbage_collector.lock);
> >=20
> > This looks broken, what if someone removed the "next" entry here?
> > You probably want to use list_next_entry_or_null();
> >=20
>=20
> Yea, let me fix this loop structure.
>=20
> > > +
> > > +		err =3D __xe_svm_garbage_collector(vm, range);
> > > +		if (err) {
> > > +			drm_warn(&vm->xe->drm,
> > > +				 "Garbage collection failed:
> > > %d\n",
> > > err);
> > > +			xe_vm_kill(vm, true);
> > > +			return err;
> > > +		}
> > > +
> > > +		spin_lock(&vm->svm.garbage_collector.lock);
> > > +	}
> > > +	spin_unlock(&vm->svm.garbage_collector.lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_svm_garbage_collector_work_func(struct
> > > work_struct
> > > *w)
> > > +{
> > > +	struct xe_vm *vm =3D container_of(w, struct xe_vm,
> > > +					svm.garbage_collector.wo
> > > rk);
> > > +
> > > +	down_write(&vm->lock);
> > > +	xe_svm_garbage_collector(vm);
> > > +	up_write(&vm->lock);
> > > +}
> > > +
> > > =C2=A0static const struct drm_gpusvm_ops gpusvm_ops =3D {
> > > =C2=A0	.range_alloc =3D xe_svm_range_alloc,
> > > =C2=A0	.range_free =3D xe_svm_range_free,
> > > @@ -198,6 +271,11 @@ static const u64 fault_chunk_sizes[] =3D {
> > > =C2=A0
> > > =C2=A0int xe_svm_init(struct xe_vm *vm)
> > > =C2=A0{
> > > +	spin_lock_init(&vm->svm.garbage_collector.lock);
> > > +	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> > > +	INIT_WORK(&vm->svm.garbage_collector.work,
> > > +		=C2=A0 xe_svm_garbage_collector_work_func);
> > > +
> > > =C2=A0	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm-
> > > >xe-
> > > > drm,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, NULL, 0, v=
m->size,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_512M, &gpusvm_ops,
> > > fault_chunk_sizes,
> > > @@ -211,6 +289,8 @@ void xe_svm_close(struct xe_vm *vm)
> > > =C2=A0	/* Flush running notifiers making xe_vm_close() visable
> > > */
> > > =C2=A0	xe_svm_notifier_lock(vm);
> > > =C2=A0	xe_svm_notifier_unlock(vm);
> > > +
> > > +	flush_work(&vm->svm.garbage_collector.work);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0void xe_svm_fini(struct xe_vm *vm)
> > > @@ -241,7 +321,10 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0	lockdep_assert_held_write(&vm->lock);
> > > =C2=A0
> > > =C2=A0retry:
> > > -	/* TODO: Run garbage collector */
> > > +	/* Always process UNMAPs first so view SVM ranges is
> > > current
> > > */
> > > +	err =3D xe_svm_garbage_collector(vm);
> > > +	if (err)
> > > +		return err;
> > > =C2=A0
> > > =C2=A0	r =3D drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> > > fault_addr,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0 xe_vma_start(vma),
> > > xe_vma_end(vma),
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > index ee0bd1ae655b..06d90d0f71a6 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -17,6 +17,7 @@ struct xe_vma;
> > > =C2=A0
> > > =C2=A0struct xe_svm_range {
> > > =C2=A0	struct drm_gpusvm_range base;
> > > +	struct list_head garbage_collector_link;
> > > =C2=A0	u8 tile_present;
> > > =C2=A0	u8 tile_invalidated;
> > > =C2=A0};
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 63aa0a25d3b7..399cbbdbddd5 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3071,6 +3071,10 @@ int xe_vm_bind_ioctl(struct drm_device
> > > *dev,
> > > void *data, struct drm_file *file)
> > > =C2=A0		goto put_exec_queue;
> > > =C2=A0	}
> > > =C2=A0
> > > +	/* Ensure all UNMAPs visable */
> > > +	if (xe_vm_in_fault_mode(vm))
> > > +		flush_work(&vm->svm.garbage_collector.work);
> >=20
> > Hmm, what is someone added an UNMAP here?
> >=20
>=20
> What we really trying to guard to against is user space doing
> something
> like this:
>=20
> addr =3D malloc();
> gpu access
> free(addr)
> bind_bo(addr);
>=20
> We want to make sure all SVM mappings from the GPU access have
> processed
> the UNMAP events from the 'free(addr)'. So I think the code is fine
> as
> is - we just want to make sure UNMAP events prior to the IOCTL are
> processed.

But the notion of "prior" only exists in the presence of some form of
synchronization, like a lock. Let's say another thread calls a free
either

a) before the flush_work
b) racing with the flush_work
c) after the flush_work

Is there any difference WRT correctness and how do we differentiate?

I don't think it's clear what this flush_work actually protects
against.

Thanks,
Thomas




>=20
> Matt
>=20
> =C2=A0
> > Thanks,
> > Thomas
> >=20
> > > +
> > > =C2=A0	err =3D down_write_killable(&vm->lock);
> > > =C2=A0	if (err)
> > > =C2=A0		goto put_vm;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index b736e53779d2..2eae3575c409 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -146,6 +146,11 @@ struct xe_vm {
> > > =C2=A0	struct {
> > > =C2=A0		/** @svm.gpusvm: base GPUSVM used to track fault
> > > allocations */
> > > =C2=A0		struct drm_gpusvm gpusvm;
> > > +		struct {
> > > +			spinlock_t lock;
> > > +			struct list_head range_list;
> > > +			struct work_struct work;
> > > +		} garbage_collector;
> > > =C2=A0	} svm;
> > > =C2=A0
> > > =C2=A0	struct xe_device *xe;
> >=20

