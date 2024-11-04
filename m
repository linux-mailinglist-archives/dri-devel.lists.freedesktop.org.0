Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76B9BBD96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 19:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717E310E0A4;
	Mon,  4 Nov 2024 18:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sk9K3nSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E940610E0A4;
 Mon,  4 Nov 2024 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730746757; x=1762282757;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8tx4lKpNHvIXWI9RwcQMQe/dm+HUovGbZUZV/OK0ceQ=;
 b=Sk9K3nSydeLg0i81OajVofFI5qfFSO9t/aM2CXZ1inXTg4fNSbnoGQdn
 x4xn1mBrLA3SUa5enst+JlkHCMoxAYx5hDqTJx5junACnau3xL0tWpVFl
 okl+bgDrsXRDkzoWRHp/+jxPXOzA6vkNykgu41FETZSo+pEYkXSIzOskz
 osoVXxHh2oLKiq6rE1HOtZJJILVxX/fVmyU4lVHZ0WIMUcZUmO9oT+s0H
 HtXW18eLtLaiYo9g1Yg2HuCx7dLlwB2pfq2sCFDmBNX/3wHre9AqcTeq8
 w842W7hZpOSv4Qkh8t/R6C0+BVzwUkbGRox8l2IJF3UlvSbEHNKy23InE Q==;
X-CSE-ConnectionGUID: 4bgdkceVSiaUL2TRa/ht0g==
X-CSE-MsgGUID: vnv0YyF4T/Gd0QVS6SXnnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="47968641"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="47968641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:59:16 -0800
X-CSE-ConnectionGUID: FgIqwR8eSqSu7eEUNnbwnw==
X-CSE-MsgGUID: gsGOiYDGRGaMZNE2J3sFfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="83270401"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.28])
 ([10.245.246.28])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:59:13 -0800
Message-ID: <4acf3ea6edd0a856c5614d25b5a54d6a1c3f6194.camel@linux.intel.com>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 04 Nov 2024 19:59:10 +0100
In-Reply-To: <ZykCmAJEUIv+nzwz@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <4162aad194d52983035a7e2a5453e394ff84fb11.camel@linux.intel.com>
 <ZykCmAJEUIv+nzwz@lstrano-desk.jf.intel.com>
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

On Mon, 2024-11-04 at 09:21 -0800, Matthew Brost wrote:
> On Mon, Nov 04, 2024 at 04:25:38PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> >=20
> > Continued review.
> >=20
> > >=20
> > > +/**
> > > + * struct drm_gpusvm_zdd - GPU SVM zone device data
> > > + *
> > > + * @refcount: Reference count for the zdd
> > > + * @destroy_work: Work structure for asynchronous zdd
> > > destruction
> > > + * @devmem_allocation: device memory allocation
> > > + * @device_private_page_owner: Device private pages owner
> > > + *
> > > + * This structure serves as a generic wrapper installed in
> > > + * page->zone_device_data. It provides infrastructure for
> > > looking up
> > > a device
> > > + * memory allocation upon CPU page fault and asynchronously
> > > releasing device
> > > + * memory once the CPU has no page references. Asynchronous
> > > release
> > > is useful
> > > + * because CPU page references can be dropped in IRQ contexts,
> > > while
> > > releasing
> > > + * device memory likely requires sleeping locks.
> > > + */
> > > +struct drm_gpusvm_zdd {
> > > +	struct kref refcount;
> > > +	struct work_struct destroy_work;
> > > +	struct drm_gpusvm_devmem *devmem_allocation;
> > > +	void *device_private_page_owner;
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_destroy_work_func - Work function for
> > > destroying a
> > > zdd
> >=20
> > NIT: Even if the above kerneldoc format works, I keep trying to
> > enforce
> > using () after function names and function-like macros, like
> > described
> > here: https://docs.kernel.org/doc-guide/kernel-doc.html=C2=A0Could we
> > update? Also that doc calls for using "Return:" instead of
> > "Returns:".
> >=20
> >=20
>=20
> Will fix up. Thanks for the ref.
>=20
> > > + * @w: Pointer to the work_struct
> > > + *
> > > + * This function releases device memory, puts GPU SVM range, and
> > > frees zdd.
> > > + */
> > > +static void drm_gpusvm_zdd_destroy_work_func(struct work_struct
> > > *w)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D
> > > +		container_of(w, struct drm_gpusvm_zdd,
> > > destroy_work);
> > > +	const struct drm_gpusvm_devmem_ops *ops =3D zdd-
> > > > devmem_allocation ?
> > > +		zdd->devmem_allocation->ops : NULL;
> > > +
> > > +	if (zdd->devmem_allocation && ops->devmem_release)
> > > +		ops->devmem_release(zdd->devmem_allocation);
> > > +	kfree(zdd);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_alloc - Allocate a zdd structure.
> > > + * @device_private_page_owner: Device private pages owner
> > > + *
> > > + * This function allocates and initializes a new zdd structure.
> > > It
> > > sets up the
> > > + * reference count and initializes the destroy work.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated zdd on success, ERR_PTR() on
> > > failure.
> > > + */
> > > +static struct drm_gpusvm_zdd *
> > > +drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd;
> > > +
> > > +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> > > +	if (!zdd)
> > > +		return NULL;
> > > +
> > > +	kref_init(&zdd->refcount);
> > > +	INIT_WORK(&zdd->destroy_work,
> > > drm_gpusvm_zdd_destroy_work_func);
> > > +	zdd->devmem_allocation =3D NULL;
> > > +	zdd->device_private_page_owner =3D
> > > device_private_page_owner;
> > > +
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_get - Get a reference to a zdd structure.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function increments the reference count of the provided
> > > zdd
> > > structure.
> > > + *
> > > + * Returns: Pointer to the zdd structure.
> > > + */
> > > +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct
> > > drm_gpusvm_zdd *zdd)
> > > +{
> > > +	kref_get(&zdd->refcount);
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_destroy - Destroy a zdd structure.
> > > + * @ref: Pointer to the reference count structure.
> > > + *
> > > + * This function queues the destroy_work of the zdd for
> > > asynchronous
> > > destruction.
> > > + */
> > > +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D
> > > +		container_of(ref, struct drm_gpusvm_zdd,
> > > refcount);
> > > +
> > > +	if (zdd->devmem_allocation)
> > > +		WRITE_ONCE(zdd->devmem_allocation->detached,
> > > true);
> > > +	schedule_work(&zdd->destroy_work);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_put - Put a zdd reference.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function decrements the reference count of the provided
> > > zdd
> > > structure
> > > + * and schedules its destruction if the count drops to zero.
> > > + */
> > > +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> > > +{
> > > +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> > > +}
> >=20
> > As mentioned earlier, I think the above drm_gpusvm_zdd functions
> > should
> > move to drm_pagemap.c. I don't think they are used in drm_gpusvm
> > other
> > than to, at get_pages time, ensure all device private pages are
> > from
> > the same pagemap?
> >=20
>=20
> The are used in __drm_gpusvm_migrate_to_ram to find devmem_allocation
> and
> associated ops.
>=20
> Also in drm_gpusvm_migrate_to_ram to find the size and
> device_private_page_owner.
>=20
> I think the placement here is correct for now but open to shuffling
> this around
> in the future if this makes sense.

Yeah I was thinking with the split in the multi-device series, (which
is yet to be posted, though, the drm_pagemap op (*populate_mm)() would
in effect handle all migration to vram, and the dev_pagemap op would
handle migration to ram, and the ranges would no longer keep track of
the vram allocations.

This means that no low-level migration function would take drm_gpusvm
as an argument (well drm_gpusvm_range_evict() would, but that would, as
we discussed before probably want to evict *all* device private pages,
so that it would likely need to be implemented with hmm_range_fault()?

So this was mostly trying to avoid future shuffling around, but agree
it depends on dev_pagemap patches.

>=20
> > > +
> > > +/**
> > > + * drm_gpusvm_range_find - Find GPU SVM range from GPU SVM
> > > notifier
> > > + * @notifier: Pointer to the GPU SVM notifier structure.
> > > + * @start: Start address of the range
> > > + * @end: End address of the range
> > > + *
> > > + * Return: A pointer to the drm_gpusvm_range if found or NULL
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64
> > > start, u64 end)
> > > +{
> > > +	return range_iter_first(&notifier->root, start, end -
> > > 1);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_range_safe - Safely iterate over GPU SVM
> > > ranges in a notifier
> > > + * @range__: Iterator variable for the ranges
> > > + * @next__: Iterator variable for the ranges temporay storage
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the range
> > > + * @end__: End address of the range
> > > + *
> > > + * This macro is used to iterate over GPU SVM ranges in a
> > > notifier
> > > while
> > > + * removing ranges from it.
> > > + */
> > > +#define drm_gpusvm_for_each_range_safe(range__, next__,
> > > notifier__,
> > > start__, end__)	\
> > > +	for ((range__) =3D drm_gpusvm_range_find((notifier__),
> > > (start__), (end__)),	\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (next__) =3D
> > > __drm_gpusvm_range_next(range__);				\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) && (range__->va.start <
> > > (end__));				\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) =3D (next__), (next__) =3D
> > > __drm_gpusvm_range_next(range__))
> > > +
> > > +/**
> > > + * __drm_gpusvm_notifier_next - get the next drm_gpusvm_notifier
> > > in
> > > the list
> > > + * @notifier: a pointer to the current drm_gpusvm_notifier
> > > + *
> > > + * Return: A pointer to the next drm_gpusvm_notifier if
> > > available,
> > > or NULL if
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the current notif=
ier is the last one or if the input
> > > notifier is
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> > > +{
> > > +	if (notifier && !list_is_last(&notifier->rb.entry,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &notifier->gpusvm-
> > > > notifier_list))
> > > +		return list_next_entry(notifier, rb.entry);
> >=20
> > Why aren't we using notifier_iter_next() here? Then the linked list
> > could be skipped.
> >=20
>=20
> I shamlessly copied this from GPU VM. I think the list is useful for
> faster
> iteration and safe removal of items while walking.

We
havehttps://elixir.bootlin.com/linux/v6.12-rc6/source/include/linux/interva=
l_tree_generic.h#L24

to relate to. Now GPUVM can't use the generic version since it needs
u64 intervals. These trees need unsigned long only so it should be ok.
And safe removal, isn't that possible to implement without the list?
Then it's really only the linked list as a perf optimization I guess,
but we have a lot of those pending...



>=20
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_notifier - Iterate over GPU SVM notifiers
> > > in
> > > a gpusvm
> > > + * @notifier__: Iterator variable for the notifiers
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the notifier
> > > + * @end__: End address of the notifier
> > > + *
> > > + * This macro is used to iterate over GPU SVM notifiers in a
> > > gpusvm.
> > > + */
> > > +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__,
> > > start__,
> > > end__)		\
> > > +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)-
> > > >root,
> > > (start__), (end__) - 1);	\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) && (notifier__->interval.star=
t <
> > > (end__));			\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) =3D
> > > __drm_gpusvm_notifier_next(notifier__))
> > > +
> >=20
> > Looks like end__ is not honored except for the first iteration.
> > Relates
> > to the above question.
> >=20
>=20
> Again shameless copy from GPU VM... Missing what the problem is. The
> condition
> to break the loop is:
>=20
> '(notifier__) && (notifier__->interval.start < (end__)'

Ah yes, you're right. I missed that.

>=20
> > > +/**
> > > + * drm_gpusvm_for_each_notifier_safe - Safely iterate over GPU
> > > SVM
> > > notifiers in a gpusvm
> > > + * @notifier__: Iterator variable for the notifiers
> > > + * @next__: Iterator variable for the notifiers temporay storage
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the notifier
> > > + * @end__: End address of the notifier
> > > + *
> > > + * This macro is used to iterate over GPU SVM notifiers in a
> > > gpusvm
> > > while
> > > + * removing notifiers from it.
> > > + */
> > > +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__,
> > > gpusvm__, start__, end__)	\
> > > +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)-
> > > >root,
> > > (start__), (end__) - 1),	\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (next__) =3D
> > > __drm_gpusvm_notifier_next(notifier__);				\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) && (notifier__->interval.star=
t <
> > > (end__));			\
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) =3D (next__), (next__) =3D
> > > __drm_gpusvm_notifier_next(notifier__))
> >=20
> > Same here.
> >=20
>=20
> Alsp present:
>=20
> =C2=A0(notifier__) && (notifier__->interval.start < (end__)
>=20
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_invalidate - Invalidate a GPU SVM
> > > notifier.
> > > + * @mni: Pointer to the mmu_interval_notifier structure.
> > > + * @mmu_range: Pointer to the mmu_notifier_range structure.
> > > + * @cur_seq: Current sequence number.
> > > + *
> > > + * This function serves as a generic MMU notifier for GPU SVM.
> > > It
> > > sets the MMU
> > > + * notifier sequence number and calls the driver invalidate
> > > vfunc
> > > under
> > > + * gpusvm->notifier_lock.
> > > + *
> > > + * Returns:
> > > + * true if the operation succeeds, false otherwise.
> > > + */
> > > +static bool
> > > +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier
> > > *mni,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_ra=
nge
> > > *mmu_range,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cur_seq)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier =3D
> > > +		container_of(mni, typeof(*notifier), notifier);
> > > +	struct drm_gpusvm *gpusvm =3D notifier->gpusvm;
> > > +
> > > +	if (!mmu_notifier_range_blockable(mmu_range))
> > > +		return false;
> > > +
> > > +	down_write(&gpusvm->notifier_lock);
> > > +	mmu_interval_set_seq(mni, cur_seq);
> > > +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> > > +	up_write(&gpusvm->notifier_lock);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_ops - MMU interval notifier operations
> > > for
> > > GPU SVM
> > > + */
> > > +static const struct mmu_interval_notifier_ops
> > > drm_gpusvm_notifier_ops =3D {
> > > +	.invalidate =3D drm_gpusvm_notifier_invalidate,
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_init - Initialize the GPU SVM.
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + * @name: Name of the GPU SVM.
> > > + * @drm: Pointer to the DRM device structure.
> > > + * @mm: Pointer to the mm_struct for the address space.
> > > + * @device_private_page_owner: Device private pages owner.
> > > + * @mm_start: Start address of GPU SVM.
> > > + * @mm_range: Range of the GPU SVM.
> > > + * @notifier_size: Size of individual notifiers.
> > > + * @ops: Pointer to the operations structure for GPU SVM.
> > > + * @chunk_sizes: Pointer to the array of chunk sizes used in
> > > range
> > > allocation.
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Entries should be powers of 2 in descending
> > > order
> > > with last
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 entry being SZ_4K.
> > > + * @num_chunks: Number of chunks.
> > > + *
> > > + * This function initializes the GPU SVM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, a negative error code on failure.
> > > + */
> > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > +		=C2=A0=C2=A0=C2=A0 const char *name, struct drm_device *drm,
> > > +		=C2=A0=C2=A0=C2=A0 struct mm_struct *mm, void
> > > *device_private_page_owner,
> > > +		=C2=A0=C2=A0=C2=A0 u64 mm_start, u64 mm_range, u64
> > > notifier_size,
> > > +		=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ops *ops,
> > > +		=C2=A0=C2=A0=C2=A0 const u64 *chunk_sizes, int num_chunks)
> > > +{
> > > +	if (!ops->invalidate || !num_chunks)
> > > +		return -EINVAL;
> > > +
> > > +	gpusvm->name =3D name;
> > > +	gpusvm->drm =3D drm;
> > > +	gpusvm->mm =3D mm;
> > > +	gpusvm->device_private_page_owner =3D
> > > device_private_page_owner;
> > > +	gpusvm->mm_start =3D mm_start;
> > > +	gpusvm->mm_range =3D mm_range;
> > > +	gpusvm->notifier_size =3D notifier_size;
> > > +	gpusvm->ops =3D ops;
> > > +	gpusvm->chunk_sizes =3D chunk_sizes;
> > > +	gpusvm->num_chunks =3D num_chunks;
> > > +
> > > +	mmgrab(mm);
> > > +	gpusvm->root =3D RB_ROOT_CACHED;
> > > +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> > > +
> > > +	init_rwsem(&gpusvm->notifier_lock);
> > > +
> > > +	fs_reclaim_acquire(GFP_KERNEL);
> > > +	might_lock(&gpusvm->notifier_lock);
> > > +	fs_reclaim_release(GFP_KERNEL);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_find - Find GPU SVM notifier
> > > + * @gpusvm__: Pointer to the GPU SVM structure
> > > + * @fault_addr__: Fault address
> > > + *
> > > + * This macro finds the GPU SVM notifier associated with the
> > > fault
> > > address.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> > > + */
> > > +#define drm_gpusvm_notifier_find(gpusvm__,
> > > fault_addr__)	\
> > > +	notifier_iter_first(&(gpusvm__)->root,
> > > (fault_addr__),	\
> > > +			=C2=A0=C2=A0=C2=A0 (fault_addr__ + 1))
> > > +
> > > +/**
> > > + * to_drm_gpusvm_notifier - retrieve the container struct for a
> > > given rbtree node
> > > + * @node__: a pointer to the rbtree node embedded within a
> > > drm_gpusvm_notifier struct
> > > + *
> > > + * Return: A pointer to the containing drm_gpusvm_notifier
> > > structure.
> > > + */
> > > +#define
> > > to_drm_gpusvm_notifier(__node)				\
> > > +	container_of((__node), struct drm_gpusvm_notifier,
> > > rb.node)
> > > +
> >=20
> > There appears to be a number of function-like macros in the code,
> > which
> > look like they can be converted to functions. Linux prefers
> > functions
> > over macros when possible:
> >=20
> > https://www.kernel.org/doc/html/v5.8/process/coding-style.html#macros-e=
nums-and-rtl
> >=20
>=20
> Will convert all macros to functions if possible. Again thanks for
> ref.
>=20
> >=20
> > > +/**
> > > + * drm_gpusvm_notifier_insert - Insert GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function inserts the GPU SVM notifier into the GPU SVM
> > > RB
> > > tree and list.
> > > + */
> > > +static void drm_gpusvm_notifier_insert(struct drm_gpusvm
> > > *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	struct rb_node *node;
> > > +	struct list_head *head;
> > > +
> > > +	notifier_insert(notifier, &gpusvm->root);
> > > +
> > > +	node =3D rb_prev(&notifier->rb.node);
> > > +	if (node)
> > > +		head =3D &(to_drm_gpusvm_notifier(node))-
> > > >rb.entry;
> > > +	else
> > > +		head =3D &gpusvm->notifier_list;
> > > +
> > > +	list_add(&notifier->rb.entry, head);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_remove - Remove GPU SVM notifier
> > > + * @gpusvm__: Pointer to the GPU SVM tructure
> > > + * @notifier__: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This macro removes the GPU SVM notifier from the GPU SVM RB
> > > tree
> > > and list.
> > > + */
> > > +#define drm_gpusvm_notifier_remove(gpusvm__,
> > > notifier__)	\
> > > +	notifier_remove((notifier__), &(gpusvm__)-
> > > >root);	\
> > > +	list_del(&(notifier__)->rb.entry)
> >=20
> > Unless this can be made a function, Pls use
> > do { } while (0)
> >=20
>=20
> I think it can be made a function or otherwise yea will use do { }
> while (0).
>=20
> >=20
> > > +
> > > +/**
> > > + * drm_gpusvm_fini - Finalize the GPU SVM.
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + *
> > > + * This function finalizes the GPU SVM by cleaning up any
> > > remaining
> > > ranges and
> > > + * notifiers, and dropping a reference to struct MM.
> > > + */
> > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier, *next;
> > > +
> > > +	drm_gpusvm_for_each_notifier_safe(notifier, next,
> > > gpusvm, 0,
> > > LONG_MAX) {
> > > +		struct drm_gpusvm_range *range, *__next;
> > > +
> > > +		/*
> > > +		 * Remove notifier first to avoid racing with
> > > any
> > > invalidation
> > > +		 */
> > > +		mmu_interval_notifier_remove(&notifier-
> > > >notifier);
> > > +		notifier->flags.removed =3D true;
> > > +
> > > +		drm_gpusvm_for_each_range_safe(range, __next,
> > > notifier, 0,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LONG_MAX)
> > > +			drm_gpusvm_range_remove(gpusvm, range);
> > > +	}
> > > +
> > > +	mmdrop(gpusvm->mm);
> > > +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_alloc - Allocate GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + *
> > > + * This function allocates and initializes the GPU SVM notifier
> > > structure.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated GPU SVM notifier on success,
> > > ERR_PTR()
> > > on failure.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, u64
> > > fault_addr)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	if (gpusvm->ops->notifier_alloc)
> > > +		notifier =3D gpusvm->ops->notifier_alloc();
> > > +	else
> > > +		notifier =3D kzalloc(sizeof(*notifier),
> > > GFP_KERNEL);
> > > +
> > > +	if (!notifier)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	notifier->gpusvm =3D gpusvm;
> > > +	notifier->interval.start =3D ALIGN_DOWN(fault_addr,
> > > gpusvm-
> > > > notifier_size);
> > > +	notifier->interval.end =3D ALIGN(fault_addr + 1, gpusvm-
> > > > notifier_size);
> > > +	INIT_LIST_HEAD(&notifier->rb.entry);
> > > +	notifier->root =3D RB_ROOT_CACHED;
> > > +	INIT_LIST_HEAD(&notifier->range_list);
> > > +
> > > +	return notifier;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_free - Free GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function frees the GPU SVM notifier structure.
> > > + */
> > > +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> > > +
> > > +	if (gpusvm->ops->notifier_free)
> > > +		gpusvm->ops->notifier_free(notifier);
> > > +	else
> > > +		kfree(notifier);
> > > +}
> > > +
> > > +/**
> > > + * to_drm_gpusvm_range - retrieve the container struct for a
> > > given
> > > rbtree node
> > > + * @node__: a pointer to the rbtree node embedded within a
> > > drm_gpusvm_range struct
> > > + *
> > > + * Return: A pointer to the containing drm_gpusvm_range
> > > structure.
> > > + */
> > > +#define to_drm_gpusvm_range(node__)	\
> > > +	container_of((node__), struct drm_gpusvm_range, rb.node)
> > > +
> > > +/**
> > > + * drm_gpusvm_range_insert - Insert GPU SVM range
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function inserts the GPU SVM range into the notifier RB
> > > tree
> > > and list.
> > > + */
> > > +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier
> > > *notifier,
> > > +				=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	struct rb_node *node;
> > > +	struct list_head *head;
> > > +
> > > +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> > > +	range_insert(range, &notifier->root);
> > > +
> > > +	node =3D rb_prev(&range->rb.node);
> > > +	if (node)
> > > +		head =3D &(to_drm_gpusvm_range(node))->rb.entry;
> > > +	else
> > > +		head =3D &notifier->range_list;
> > > +
> > > +	list_add(&range->rb.entry, head);
> > > +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> > > +}
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_remove - Remove GPU SVM range
> > > + * @notifier__: Pointer to the GPU SVM notifier structure
> > > + * @range__: Pointer to the GPU SVM range structure
> > > + *
> > > + * This macro removes the GPU SVM range from the notifier RB
> > > tree
> > > and list.
> > > + */
> > > +#define __drm_gpusvm_range_remove(notifier__,
> > > range__)		\
> > > +	range_remove((range__), &(notifier__)-
> > > >root);		\
> > > +	list_del(&(range__)->rb.entry)
> >=20
> > Same thing as for the notifier rb tree. And do we need the linked
> > list?
> >=20
>=20
> Same answer.
>=20
> >=20
> > > +
> > > +/**
> > > + * drm_gpusvm_range_alloc - Allocate GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @fault_addr: Fault address
> > > + * @chunk_size: Chunk size
> > > + * @migrate_devmem: Flag indicating whether to migrate device
> > > memory
> > > + *
> > > + * This function allocates and initializes the GPU SVM range
> > > structure.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated GPU SVM range on success, ERR_PTR()
> > > on
> > > failure.
> > > + */
> > > +static struct drm_gpusvm_range *
> > > +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier *n=
otifier,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 fault_addr, u64 chunk_siz=
e, bool
> > > migrate_devmem)
> > > +{
> > > +	struct drm_gpusvm_range *range;
> > > +
> > > +	if (gpusvm->ops->range_alloc)
> > > +		range =3D gpusvm->ops->range_alloc(gpusvm);
> > > +	else
> > > +		range =3D kzalloc(sizeof(*range), GFP_KERNEL);
> > > +
> > > +	if (!range)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	kref_init(&range->refcount);
> > > +	range->gpusvm =3D gpusvm;
> > > +	range->notifier =3D notifier;
> > > +	range->va.start =3D ALIGN_DOWN(fault_addr, chunk_size);
> > > +	range->va.end =3D ALIGN(fault_addr + 1, chunk_size);
> > > +	INIT_LIST_HEAD(&range->rb.entry);
> > > +	range->notifier_seq =3D LONG_MAX;
> > > +	range->flags.migrate_devmem =3D migrate_devmem ? 1 : 0;
> > > +
> > > +	return range;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_check_pages - Check pages
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @start: Start address
> > > + * @end: End address
> > > + *
> > > + * Check if pages between start and end have been faulted in on
> > > the
> > > CPU. Use to
> > > + * prevent migration of pages without CPU backing store.
> > > + *
> > > + * Returns:
> > > + * True if pages have been faulted into CPU, False otherwise
> > > + */
> > > +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > > *notifier,
> > > +				=C2=A0=C2=A0 u64 start, u64 end)
> > > +{
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D 0,
> > > +		.notifier =3D &notifier->notifier,
> > > +		.start =3D start,
> > > +		.end =3D end,
> > > +		.dev_private_owner =3D gpusvm-
> > > > device_private_page_owner,
> > > +	};
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns;
> > > +	unsigned long npages =3D npages_in_range(start, end);
> > > +	int err, i;
> > > +
> > > +	mmap_assert_locked(gpusvm->mm);
> > > +
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> > > GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return false;
> > > +
> > > +	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(&notifier-
> > > > notifier);
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +
> > > +	while (true) {
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		if (err =3D=3D -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(&notifier->notifier);
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	for (i =3D 0; i < npages;) {
> > > +		if (!(pfns[i] & HMM_PFN_VALID)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_free;
> > > +		}
> > > +		i +=3D 0x1 << hmm_pfn_to_map_order(pfns[i]);
> > > +	}
> > > +
> > > +err_free:
> > > +	kvfree(pfns);
> > > +	return err ? false : true;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_chunk_size - Determine chunk size for GPU
> > > SVM
> > > range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @vas: Pointer to the virtual memory area structure
> > > + * @fault_addr: Fault address
> > > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > > + * @check_pages: Flag indicating whether to check pages
> > > + *
> > > + * This function determines the chunk size for the GPU SVM range
> > > based on the
> > > + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges,
> > > and
> > > the virtual
> > > + * memory area boundaries.
> > > + *
> > > + * Returns:
> > > + * Chunk size on success, LONG_MAX on failure.
> > > + */
> > > +static u64 drm_gpusvm_range_chunk_size(struct drm_gpusvm
> > > *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > drm_gpusvm_notifier
> > > *notifier,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct
> > > *vas,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 fault_addr, u64
> > > gpuva_start,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 gpuva_end, bool
> > > check_pages)
> > > +{
> > > +	u64 start, end;
> > > +	int i =3D 0;
> > > +
> > > +retry:
> > > +	for (; i < gpusvm->num_chunks; ++i) {
> > > +		start =3D ALIGN_DOWN(fault_addr, gpusvm-
> > > > chunk_sizes[i]);
> > > +		end =3D ALIGN(fault_addr + 1, gpusvm-
> > > >chunk_sizes[i]);
> > > +
> > > +		if (start >=3D vas->vm_start && end <=3D vas->vm_end
> > > &&
> > > +		=C2=A0=C2=A0=C2=A0 start >=3D notifier->interval.start &&
> > > +		=C2=A0=C2=A0=C2=A0 end <=3D notifier->interval.end &&
> > > +		=C2=A0=C2=A0=C2=A0 start >=3D gpuva_start && end <=3D gpuva_end)
> > > +			break;
> > > +	}
> > > +
> > > +	if (i =3D=3D gpusvm->num_chunks)
> > > +		return LONG_MAX;
> > > +
> > > +	/*
> > > +	 * If allocation more than page, ensure not to overlap
> > > with
> > > existing
> > > +	 * ranges.
> > > +	 */
> > > +	if (end - start !=3D SZ_4K) {
> > > +		struct drm_gpusvm_range *range;
> > > +
> > > +		range =3D drm_gpusvm_range_find(notifier, start,
> > > end);
> > > +		if (range) {
> > > +			++i;
> > > +			goto retry;
> > > +		}
> > > +
> > > +		/*
> > > +		 * XXX: Only create range on pages CPU has
> > > faulted
> > > in. Without
> > > +		 * this check, or prefault, on BMG
> > > 'xe_exec_system_allocator --r
> > > +		 * process-many-malloc' fails. In the failure
> > > case,
> > > each process
> > > +		 * mallocs 16k but the CPU VMA is ~128k which
> > > results in 64k SVM
> > > +		 * ranges. When migrating the SVM ranges, some
> > > processes fail in
> > > +		 * drm_gpusvm_migrate_to_devmem with
> > > 'migrate.cpages
> > > !=3D npages'
> > > +		 * and then upon drm_gpusvm_range_get_pages
> > > device
> > > pages from
> > > +		 * other processes are collected + faulted in
> > > which
> > > creates all
> > > +		 * sorts of problems. Unsure exactly how this
> > > happening, also
> > > +		 * problem goes away if
> > > 'xe_exec_system_allocator --
> > > r
> > > +		 * process-many-malloc' mallocs at least 64k at
> > > a
> > > time.
> > > +		 */
> >=20
> > Needs to be figured out. I think even in the system allocator case,
> > if
> > a user uses malloc() to allocate a GPU only buffer we'd need to
> > support
> > that?
> >=20
>=20
> I'm not understanding this comment but I do agree what is going on
> here needs to
> be figured out.

What I meant was let's say the user mallocs a big buffer to be used by
the gpu only, and hence should ideally be in device memory, but it's
never faulted by the CPU. I guess my question should be reformulated,
what would happen then? Wouldn't it remain in system ram forever?

>=20
> This comment is actually a bit stale - I think the above test case
> will pass now
> if ctx.check_pages is false with a retry loop triggered in GPU fault
> handler
> because of mixed pages. However it does appear the test case still
> finds device
> pages in hmm_range_fault mapped into a different process which I
> think should be
> impossible. Wondering if there is hmm / mm core bug here my test case
> hits? Let
> me page this information back and dig in here to see if I can explain
> what is
> going on better. Will take sometime but should be able to focus on
> this during
> the week
>=20
> Also I think leaving in the check_pages option is a good thing. A
> call then can
> choose between 2 things:
>=20
> 1. Only create GPU mappings for CPU pages faulted in (ctx.check_pages
> =3D true)
> 2. create GPU mappings for a VMA and fault in CPU pages
> (ctx.check_pages =3D
> false)
> =C2=A0
> If we support 2, then I think xe_svm_copy needs to be updated to
> clear VRAM for
> pages which the CPU has not faulted in.
>=20
> >=20
> > > +		if (check_pages &&
> > > +		=C2=A0=C2=A0=C2=A0 !drm_gpusvm_check_pages(gpusvm, notifier,
> > > start,
> > > end)) {
> > > +			++i;
> > > +			goto retry;
> > > +		}
> > > +	}
> > > +
> > > +	return end - start;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_find_or_insert - Find or insert GPU SVM
> > > range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function finds or inserts a newly allocated a GPU SVM
> > > range
> > > based on the
> > > + * fault address. Caller must hold a lock to protect range
> > > lookup
> > > and insertion.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM range on success, ERR_PTR() on
> > > failure.
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64
> > > fault_addr,
> > > +				u64 gpuva_start, u64 gpuva_end,
> > > +				const struct drm_gpusvm_ctx
> > > *ctx)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +	struct drm_gpusvm_range *range;
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	struct vm_area_struct *vas;
> > > +	bool notifier_alloc =3D false;
> > > +	u64 chunk_size;
> > > +	int err;
> > > +	bool migrate_devmem;
> > > +
> > > +	if (fault_addr < gpusvm->mm_start ||
> > > +	=C2=A0=C2=A0=C2=A0 fault_addr > gpusvm->mm_start + gpusvm->mm_range=
) {
> >=20
> > return ERR_PTR(-EINVAL)?
> >=20
>=20
> Sure.
> =C2=A0
> > > +		err =3D -EINVAL;
> > > +		goto err_out;
> > > +	}
> > > +
> > > +	if (!mmget_not_zero(mm)) {
> > > +		err =3D -EFAULT;
> > > +		goto err_out;
>=20
> And here too.
>=20
> > > +	}
> > > +
> > > +	notifier =3D drm_gpusvm_notifier_find(gpusvm, fault_addr);
> > > +	if (!notifier) {
> > > +		notifier =3D drm_gpusvm_notifier_alloc(gpusvm,
> > > fault_addr);
> > > +		if (IS_ERR(notifier)) {
> > > +			err =3D PTR_ERR(notifier);
> > > +			goto err_mmunlock;
> > > +		}
> > > +		notifier_alloc =3D true;
> > > +		err =3D mmu_interval_notifier_insert(&notifier-
> > > > notifier,
> > > +						=C2=A0=C2=A0 mm, notifier-
> > > > interval.start,
> > > +						=C2=A0=C2=A0 notifier-
> > > > interval.end -
> > > +						=C2=A0=C2=A0 notifier-
> > > > interval.start,
> > > +						=C2=A0=C2=A0
> > > &drm_gpusvm_notifier_ops);
> > > +		if (err)
> > > +			goto err_notifier;
> > > +	}
> > > +
> > > +	mmap_read_lock(mm);
> > > +
> > > +	vas =3D vma_lookup(mm, fault_addr);
> > > +	if (!vas) {
> > > +		err =3D -ENOENT;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> > > +		err =3D -EPERM;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	range =3D drm_gpusvm_range_find(notifier, fault_addr,
> > > fault_addr + 1);
> > > +	if (range)
> > > +		goto out_mmunlock;
> > > +	/*
> > > +	 * XXX: Short-circuiting migration based on
> > > migrate_vma_*
> > > current
> > > +	 * limitations. If/when migrate_vma_* add more support,
> > > this
> > > logic will
> > > +	 * have to change.
> > > +	 */
> > > +	migrate_devmem =3D ctx->devmem_possible &&
> > > +		vma_is_anonymous(vas) &&
> > > !is_vm_hugetlb_page(vas);
> > > +
> > > +	chunk_size =3D drm_gpusvm_range_chunk_size(gpusvm,
> > > notifier,
> > > vas,
> > > +						 fault_addr,
> > > gpuva_start,
> > > +						 gpuva_end,
> > > migrate_devmem &&
> > > +						 ctx-
> > > >check_pages);
> > > +	if (chunk_size =3D=3D LONG_MAX) {
> > > +		err =3D -EINVAL;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	range =3D drm_gpusvm_range_alloc(gpusvm, notifier,
> > > fault_addr,
> > > chunk_size,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migrate_devmem);
> > > +	if (IS_ERR(range)) {
> > > +		err =3D PTR_ERR(range);
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	drm_gpusvm_range_insert(notifier, range);
> > > +	if (notifier_alloc)
> > > +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> > > +
> > > +out_mmunlock:
> > > +	mmap_read_unlock(mm);
> > > +	mmput(mm);
> > > +
> > > +	return range;
> > > +
> > > +err_notifier_remove:
> > > +	mmap_read_unlock(mm);
> > > +	if (notifier_alloc)
> > > +		mmu_interval_notifier_remove(&notifier-
> > > >notifier);
> > > +err_notifier:
> > > +	if (notifier_alloc)
> > > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > > +err_mmunlock:
> > > +	mmput(mm);
> > > +err_out:
> > > +	return ERR_PTR(err);
> > > +}
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_unmap_pages - Unmap pages associated with
> > > a
> > > GPU SVM range (internal)
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @npages: Number of pages to unmap
> > > + *
> > > + * This function unmap pages associated with a GPU SVM range.
> > > Assumes and
> > > + * asserts correct locking is in place when called.
> > > + */
> > > +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +					=C2=A0=C2=A0 struct
> > > drm_gpusvm_range
> > > *range,
> > > +					=C2=A0=C2=A0 unsigned long npages)
> > > +{
> > > +	unsigned long i, j;
> > > +	struct drm_pagemap *dpagemap =3D range->dpagemap;
> > > +	struct device *dev =3D gpusvm->drm->dev;
> > > +
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	if (range->flags.has_dma_mapping) {
> > > +		for (i =3D 0, j =3D 0; i < npages; j++) {
> > > +			struct drm_pagemap_dma_addr *addr =3D
> > > &range-
> > > > dma_addr[j];
> > > +
> > > +			if (addr->proto =3D=3D
> > > DRM_INTERCONNECT_SYSTEM)
> > > {
> > > +				dma_unmap_page(dev,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->addr,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > > addr-
> > > > order,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->dir);
> > > +			} else if (dpagemap && dpagemap->ops-
> > > > unmap_dma) {
> > > +				dpagemap->ops-
> > > >unmap_dma(dpagemap,
> > > +							 dev,
> > > +							 *addr);
> > > +			}
> > > +			i +=3D 1 << addr->order;
> > > +		}
> > > +		range->flags.has_devmem_pages =3D false;
> > > +		range->flags.has_dma_mapping =3D false;
> > > +		range->dpagemap =3D NULL;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_free_pages - Free pages associated with a
> > > GPU
> > > SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function free pages associated with a GPU SVM range.
> >=20
> > Frees the dma address array
> >=20
>=20
> Yes.
> =C2=A0
> >=20
> > > + */
> > > +static void drm_gpusvm_range_free_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +					struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	if (range->dma_addr) {
> > > +		kvfree(range->dma_addr);
> > > +		range->dma_addr =3D NULL;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_remove - Remove GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range to be removed
> > > + *
> > > + * This function removes the specified GPU SVM range and also
> > > removes the parent
> > > + * GPU SVM notifier if no more ranges remain in the notifier.
> > > The
> > > caller must
> > > + * hold a lock to protect range and notifier removal.
> > > + */
> > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range)
> > > +{
> > > +	unsigned long npages =3D npages_in_range(range->va.start,
> > > range->va.end);
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	notifier =3D drm_gpusvm_notifier_find(gpusvm, range-
> > > > va.start);
> > > +	if (WARN_ON_ONCE(!notifier))
> > > +		return;
> > > +
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> > > +	drm_gpusvm_range_free_pages(gpusvm, range);
> > > +	__drm_gpusvm_range_remove(notifier, range);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +
> > > +	drm_gpusvm_range_put(range);
> > > +
> > > +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> > > +		if (!notifier->flags.removed)
> > > +			mmu_interval_notifier_remove(&notifier-
> > > > notifier);
> > > +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> > > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_get - Get a reference to GPU SVM range
> > > + * @range: Pointer to the GPU SVM range
> > > + *
> > > + * This function increments the reference count of the specified
> > > GPU
> > > SVM range.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM range.
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> > > +{
> > > +	kref_get(&range->refcount);
> > > +
> > > +	return range;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_destroy - Destroy GPU SVM range
> > > + * @refcount: Pointer to the reference counter embedded in the
> > > GPU
> > > SVM range
> > > + *
> > > + * This function destroys the specified GPU SVM range when its
> > > reference count
> > > + * reaches zero. If a custom range-free function is provided, it
> > > is
> > > invoked to
> > > + * free the range; otherwise, the range is deallocated using
> > > kfree().
> > > + */
> > > +static void drm_gpusvm_range_destroy(struct kref *refcount)
> > > +{
> > > +	struct drm_gpusvm_range *range =3D
> > > +		container_of(refcount, struct drm_gpusvm_range,
> > > refcount);
> > > +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> > > +
> > > +	if (gpusvm->ops->range_free)
> > > +		gpusvm->ops->range_free(range);
> > > +	else
> > > +		kfree(range);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_put - Put a reference to GPU SVM range
> > > + * @range: Pointer to the GPU SVM range
> > > + *
> > > + * This function decrements the reference count of the specified
> > > GPU
> > > SVM range
> > > + * and frees it when the count reaches zero.
> > > + */
> > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> > > +{
> > > +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_pages_valid - GPU SVM range pages valid
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function determines if a GPU SVM range pages are valid.
> > > Expected be
> > > + * called holding gpusvm->notifier_lock and as the last step
> > > before
> > > commiting a
> > > + * GPU binding.
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM range has valid pages, False otherwise
> > > + */
> > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	return range->flags.has_devmem_pages || range-
> > > > flags.has_dma_mapping;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_pages_valid_unlocked - GPU SVM range pages
> > > valid
> > > unlocked
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function determines if a GPU SVM range pages are valid.
> > > Expected be
> > > + * called without holding gpusvm->notifier_lock.
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM range has valid pages, False otherwise
> > > + */
> > > +static bool
> > > +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	bool pages_valid;
> > > +
> > > +	if (!range->dma_addr)
> > > +		return false;
> > > +
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	pages_valid =3D drm_gpusvm_range_pages_valid(gpusvm,
> > > range);
> > > +	if (!pages_valid)
> > > +		drm_gpusvm_range_free_pages(gpusvm, range);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +
> > > +	return pages_valid;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_get_pages - Get pages for a GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function gets pages for a GPU SVM range and ensures they
> > > are
> > > mapped for
> > > + * DMA access.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *ran=
ge,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx =
*ctx)
> > > +{
> > > +	struct mmu_interval_notifier *notifier =3D &range-
> > > >notifier-
> > > > notifier;
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D HMM_PFN_REQ_FAULT | (ctx-
> > > >read_only
> > > ? 0 :
> > > +			HMM_PFN_REQ_WRITE),
> > > +		.notifier =3D notifier,
> > > +		.start =3D range->va.start,
> > > +		.end =3D range->va.end,
> > > +		.dev_private_owner =3D gpusvm-
> > > > device_private_page_owner,
> > > +	};
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	struct drm_gpusvm_zdd *zdd;
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long i, j;
> > > +	unsigned long npages =3D npages_in_range(range->va.start,
> > > range->va.end);
> > > +	unsigned long num_dma_mapped;
> > > +	unsigned int order =3D 0;
> > > +	unsigned long *pfns;
> > > +	struct page **pages;
> > > +	int err =3D 0;
> > > +	struct dev_pagemap *pagemap;
> > > +	struct drm_pagemap *dpagemap;
> > > +
> > > +retry:
> > > +	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm,
> > > range))
> > > +		goto set_seqno;
> > > +
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> > > GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return -ENOMEM;
> > > +
> > > +	if (!mmget_not_zero(mm)) {
> > > +		err =3D -EFAULT;
> > > +		goto err_out;
> > > +	}
> > > +
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +	while (true) {
> > > +		mmap_read_lock(mm);
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		mmap_read_unlock(mm);
> > > +
> > > +		if (err =3D=3D -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	mmput(mm);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	pages =3D (struct page **)pfns;
> > > +map_pages:
> > > +	/*
> > > +	 * Perform all dma mappings under the notifier lock to
> > > not
> > > +	 * access freed pages. A notifier will either block on
> > > +	 * the notifier lock or unmap dma.
> > > +	 */
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	if (mmu_interval_read_retry(notifier,
> > > hmm_range.notifier_seq)) {
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +		goto retry;
> > > +	}
> > > +
> > > +	if (!range->dma_addr) {
> > > +		/* Unlock and restart mapping to allocate
> > > memory. */
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +		range->dma_addr =3D kvmalloc_array(npages,
> > > sizeof(*range->dma_addr),
> > > +						 GFP_KERNEL);
> > > +		if (!range->dma_addr) {
> > > +			err =3D -ENOMEM;
> > > +			goto err_free;
> > > +		}
> > > +		goto map_pages;
> > > +	}
> > > +
> > > +	zdd =3D NULL;
> > > +	num_dma_mapped =3D 0;
> > > +	for (i =3D 0, j =3D 0; i < npages; ++j) {
> > > +		struct page *page =3D hmm_pfn_to_page(pfns[i]);
> > > +
> > > +		order =3D hmm_pfn_to_map_order(pfns[i]);
> > > +		if (is_device_private_page(page) ||
> > > is_device_coherent_page(page)) {
> > > +			if (zdd !=3D page->zone_device_data && i >
> > > 0)
> > > {
> > > +				err =3D -EOPNOTSUPP;
> > > +				goto err_unmap;
> > > +			}
> > > +			zdd =3D page->zone_device_data;
> > > +			if (pagemap !=3D page->pgmap) {
> > > +				if (i > 0) {
> > > +					err =3D -EOPNOTSUPP;
> > > +					goto err_unmap;
> > > +				}
> > > +
> > > +				pagemap =3D page->pgmap;
> > > +				dpagemap =3D zdd-
> > > >devmem_allocation-
> > > > dpagemap;
> > > +				if (drm_WARN_ON(gpusvm->drm,
> > > !dpagemap)) {
> > > +					/*
> > > +					 * Raced. This is not
> > > supposed to happen
> > > +					 * since
> > > hmm_range_fault()
> > > should've migrated
> > > +					 * this page to system.
> > > +					 */
> > > +					err =3D -EAGAIN;
> > > +					goto err_unmap;
> > > +				}
> > > +			}
> > > +			range->dma_addr[j] =3D
> > > +				dpagemap->ops->map_dma(dpagemap,
> > > gpusvm->drm->dev,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page,
> > > order,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > DMA_BIDIRECTIONAL);
> > > +			if (dma_mapping_error(gpusvm->drm->dev,
> > > range->dma_addr[j].addr)) {
> > > +				err =3D -EFAULT;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			pages[i] =3D page;
> > > +		} else {
> > > +			dma_addr_t addr;
> > > +
> > > +			if (is_zone_device_page(page) || zdd) {
> > > +				err =3D -EOPNOTSUPP;
> >=20
> > I suppose before merging we want to support mixed ranges since
> > migration is best effort only, or what are the plans here?
> >=20
>=20
> I'd say initial merge no mixed support given that adds complexity and
> the
> current code is very stable - i.e., get in a simple and stable
> baseline and then
> build complexity on top incrementally. I have a lot perf optimization
> I'd like
> to get in but omitting for now to stick to the aforementioned plan.
>=20
> Longtern I think a drm_gpusvm_ctx argument will control if we want
> mixed
> mappings within a range.

OK.

> =C2=A0
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			addr =3D dma_map_page(gpusvm->drm->dev,
> > > +					=C2=A0=C2=A0=C2=A0 page, 0,
> > > +					=C2=A0=C2=A0=C2=A0 PAGE_SIZE << order,
> > > +					=C2=A0=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> > > +			if (dma_mapping_error(gpusvm->drm->dev,
> > > addr)) {
> > > +				err =3D -EFAULT;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			range->dma_addr[j] =3D
> > > drm_pagemap_dma_addr_encode
> > > +				(addr, DRM_INTERCONNECT_SYSTEM,
> > > order,
> > > +				 DMA_BIDIRECTIONAL);
> > > +		}
> > > +		i +=3D 1 << order;
> > > +		num_dma_mapped =3D i;
> > > +	}
> > > +
> > > +	range->flags.has_dma_mapping =3D true;
> > > +	if (zdd) {
> > > +		range->flags.has_devmem_pages =3D true;
> > > +		range->dpagemap =3D dpagemap;
> > > +	}
> > > +
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +	kvfree(pfns);
> > > +set_seqno:
> > > +	range->notifier_seq =3D hmm_range.notifier_seq;
> > > +
> > > +	return 0;
> > > +
> > > +err_unmap:
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range,
> > > num_dma_mapped);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +err_free:
> > > +	kvfree(pfns);
> > > +err_out:
> > > +	if (err =3D=3D -EAGAIN)
> > > +		goto retry;
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a
> > > GPU
> > > SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function unmaps pages associated with a GPU SVM range.
> > > If
> > > @in_notifier
> > > + * is set, it is assumed that gpusvm->notifier_lock is held in
> > > write
> > > mode; if it
> > > + * is clear, it acquires gpusvm->notifier_lock in read mode.
> > > Must be
> > > called on
> > > + * each GPU SVM range attached to notifier in gpusvm->ops-
> > > > invalidate for IOMMU
> > > + * security model.
> > > + */
> > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > +				=C2=A0 struct drm_gpusvm_range
> > > *range,
> > > +				=C2=A0 const struct drm_gpusvm_ctx
> > > *ctx)
> > > +{
> > > +	unsigned long npages =3D npages_in_range(range->va.start,
> > > range->va.end);
> > > +
> > > +	if (ctx->in_notifier)
> > > +		lockdep_assert_held_write(&gpusvm-
> > > >notifier_lock);
> > > +	else
> > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > +
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> > > +
> > > +	if (!ctx->in_notifier)
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +}
> >=20
> > NIT: Separate functions for locked / unlocked makes life easier for
> > static code analyzers.
> >=20
>=20
> Willl do.
>=20
> >=20
> > Section below I think should belong to drm_pagemap.c
> >=20
>=20
> Diagree. See my comments on zdd above. Also
> drm_gpusvm_migration_put_pages uses
> migration pfns which definitely should not be in drm_pagemap.c.

Like mentioned above, with upcoming populate_mm() moving to being a
drm_pagemap op, and none of the low level migration helpers taking
drm_gpusvm as an argument, I think it makes sense, but if you rather
want to look at shuffling things around when that is in place,
that's ok. Agree, though that anything needing struct drm_gpusvm should
*not* be in drm_pagemap.c

Thanks,
Thomas



> =C2=A0
> > > +
> > > +/**
> > > + * drm_gpusvm_migration_put_page - Put a migration page
> > > + * @page: Pointer to the page to put
> > > + *
> > > + * This function unlocks and puts a page.
> > > + */
> > > +static void drm_gpusvm_migration_put_page(struct page *page)
> >=20
> > _unlock_put_page()?
> >=20
> > > +{
> > > +	unlock_page(page);
> > > +	put_page(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migration_put_pages - Put migration pages
> > > + * @npages: Number of pages
> > > + * @migrate_pfn: Array of migrate page frame numbers
> > > + *
> > > + * This function puts an array of pages.
> > > + */
> > > +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> > > +					=C2=A0=C2=A0 unsigned long
> > > *migrate_pfn)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		if (!migrate_pfn[i])
> > > +			continue;
> > > +
> > > +		drm_gpusvm_migration_put_page(migrate_pfn_to_pag
> > > e(mi
> > > grate_pfn[i]));
> > > +		migrate_pfn[i] =3D 0;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_get_devmem_page - Get a reference to a device
> > > memory
> > > page
> > > + * @page: Pointer to the page
> > > + * @zdd: Pointer to the GPU SVM zone device data
> > > + *
> > > + * This function associates the given page with the specified
> > > GPU
> > > SVM zone
> > > + * device data and initializes it for zone device usage.
> > > + */
> > > +static void drm_gpusvm_get_devmem_page(struct page *page,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_zdd *zdd)
> > > +{
> > > +	page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> > > +	zone_device_page_init(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU
> > > SVM
> > > migration
> > > + * @dev: The device for which the pages are being mapped
> > > + * @dma_addr: Array to store DMA addresses corresponding to
> > > mapped
> > > pages
> > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > + * @npages: Number of pages to map
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function maps pages of memory for migration usage in GPU
> > > SVM. It
> > > + * iterates over each page frame number provided in
> > > @migrate_pfn,
> > > maps the
> > > + * corresponding page, and stores the DMA address in the
> > > provided
> > > @dma_addr
> > > + * array.
> > > + *
> > > + * Return: 0 on success, -EFAULT if an error occurs during
> > > mapping.
> > > + */
> > > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > +					dma_addr_t *dma_addr,
> > > +					long unsigned int
> > > *migrate_pfn,
> > > +					unsigned long npages,
> > > +					enum dma_data_direction
> > > dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > +			return -EFAULT;
> > > +
> > > +		dma_addr[i] =3D dma_map_page(dev, page, 0,
> > > PAGE_SIZE,
> > > dir);
> > > +		if (dma_mapping_error(dev, dma_addr[i]))
> > > +			return -EFAULT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> >=20
> > TBC'd
> >=20
>=20
> Thanks for the comments!
>=20
> Matt
>=20
> > /Thomas
> >=20

