Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B89C411C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE7B10E4D5;
	Mon, 11 Nov 2024 14:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeSK0yUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8921910E4D5;
 Mon, 11 Nov 2024 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731335930; x=1762871930;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7YvaIdYI62qGLY6wKGKspUAXjECXYjN2f//zgSuhHcM=;
 b=EeSK0yUGYCxFFGicL4W+jJa5iaKyUg7/LKBZxDAuHwDZYRWlxImSI2o5
 O9UkSV7zodDCaRkrCcgX9ikfN/d2JIDbyLBPG1RQDQpzp/9WhJHIDgcSM
 C3JCgWoWxOIHfq+Ngvc7Kw9cfM/JW7sD3CjG3xbbVl33+MtyaChxDxCpc
 BN0nI3TPzLhsh8Qm6c9s5yw1j98GIVC72mdzdalKH2NRSIQP3x48GkFhs
 g4U+doscF/fQ2/Gt/wJ1ROxt+zWhd8lGCKA76WBkdjS8MRhQGMVScdiUX
 HPNl0hsF/pnD8TlweOxgQAsdBl9QB+wJVmyn8YYQNtT1S8+KRXOAeQbqo w==;
X-CSE-ConnectionGUID: jM1GWszvRHWmhkIq/ZsiTg==
X-CSE-MsgGUID: waBPM9Q8Tb2473dEkH028Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="42539398"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="42539398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:38:50 -0800
X-CSE-ConnectionGUID: OqiKFhJ7SY+p5sTjBeYyTg==
X-CSE-MsgGUID: 9dBCT5zpTR2Ddtlqt7PeuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="124511358"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.77])
 ([10.245.246.77])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:38:47 -0800
Message-ID: <c87ed16d1a90d94a7381498b4425eb622ea0ff20.camel@linux.intel.com>
Subject: Re: [PATCH v11 2/8] drm/ttm: Add a virtual base class for graphics
 memory backup
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Mon, 11 Nov 2024 15:38:27 +0100
In-Reply-To: <5b424798-832b-4489-b4b4-8dc53ad487cf@amd.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-3-thomas.hellstrom@linux.intel.com>
 <5b424798-832b-4489-b4b4-8dc53ad487cf@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Fri, 2024-11-08 at 15:32 +0100, Christian K=C3=B6nig wrote:
> Am 16.10.24 um 10:55 schrieb Thomas Hellstr=C3=B6m:
> > Initially intended for experimenting with different backup
> > solutions (shmem vs direct swap cache insertion), abstract
> > the backup destination using a virtual base class.
> >=20
> > Also provide a sample implementation for shmem.
>=20
> It feels a bit like overkill to have that abstraction.
>=20
> > While when settling on a preferred backup solution, one could
> > perhaps skip the abstraction, this functionality may actually
> > come in handy for configurable dedicated graphics memory
> > backup to fast nvme files or similar, whithout affecting
> > swap-space. Could indeed be useful for VRAM backup on S4 and
> > other cases.
>=20
> Why would we want to have the flexibility to use different backends?
>=20
> I mean that just sounds like one more thing which can break.

Let me remove it. I took a stab at it some time ago, but didn't think
the small LOC save was worth it, but people will keep wondering why
it's there.

If we add additional backends, (like separate GPU swapout to a user-
provided fd) we can re-add it. Similarly for the direct-insert-to-swap-
cache backend I have if we find out we need it anyway.

>=20
> On the other hand it's really nice that we now use folios instead of
> pages.
>=20
> > v5:
> > - Fix a UAF. (kernel test robot, Dan Carptenter)
> > v6:
> > - Rename ttm_backup_shmem_copy_page() function argument
> > =C2=A0=C2=A0 (Matthew Brost)
> > - Add some missing documentation
> > v8:
> > - Use folio_file_page to get to the page we want to writeback
> > =C2=A0=C2=A0 instead of using the first page of the folio.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v7
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139
> > +++++++++++++++++++++++++
> > =C2=A0 include/drm/ttm/ttm_backup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 137
> > ++++++++++++++++++++++++
> > =C2=A0 3 files changed, 277 insertions(+), 1 deletion(-)
> > =C2=A0 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > =C2=A0 create mode 100644 include/drm/ttm/ttm_backup.h
> >=20
> > diff --git a/drivers/gpu/drm/ttm/Makefile
> > b/drivers/gpu/drm/ttm/Makefile
> > index dad298127226..5e980dd90e41 100644
> > --- a/drivers/gpu/drm/ttm/Makefile
> > +++ b/drivers/gpu/drm/ttm/Makefile
> > @@ -4,7 +4,7 @@
> > =C2=A0=20
> > =C2=A0 ttm-y :=3D ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_modul=
e.o
> > \
> > =C2=A0=C2=A0	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o
> > ttm_pool.o \
> > -	ttm_device.o ttm_sys_manager.o
> > +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
> > =C2=A0 ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
> > =C2=A0=20
> > =C2=A0 obj-$(CONFIG_DRM_TTM) +=3D ttm.o
> > diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > new file mode 100644
> > index 000000000000..cfe4140cc59d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > @@ -0,0 +1,139 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +
> > +#include <drm/ttm/ttm_backup.h>
> > +#include <linux/page-flags.h>
> > +
> > +/**
> > + * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
> > + * @backup: The base struct ttm_backup
> > + * @filp: The associated shmem object
> > + */
> > +struct ttm_backup_shmem {
> > +	struct ttm_backup backup;
> > +	struct file *filp;
> > +};
> > +
> > +static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup
> > *backup)
> > +{
> > +	return container_of(backup, struct ttm_backup_shmem,
> > backup);
> > +}
> > +
> > +static void ttm_backup_shmem_drop(struct ttm_backup *backup,
> > unsigned long handle)
> > +{
> > +	handle -=3D 1;
>=20
> Why that? I've seen that multiple times in this patch but can't find
> a=20
> good explanation for it.

It's a mapping from backup interface handles to shmem offsets. Needed
because interface handle =3D=3D 0 means error (which is inherited from
swp_entry_t).

/Thomas


>=20
> Regards,
> Christian.
>=20
> > +	shmem_truncate_range(file_inode(to_backup_shmem(backup)-
> > >filp), handle,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 handle + 1);
>=20
>=20
> > +}
> > +
> > +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup,
> > struct page *dst,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long handle, bool
> > intr)
> > +{
> > +	struct file *filp =3D to_backup_shmem(backup)->filp;
> > +	struct address_space *mapping =3D filp->f_mapping;
> > +	struct folio *from_folio;
> > +
> > +	handle -=3D 1;
> > +	from_folio =3D shmem_read_folio(mapping, handle);
> > +	if (IS_ERR(from_folio))
> > +		return PTR_ERR(from_folio);
> > +
> > +	/* Note: Use drm_memcpy_from_wc? */
> > +	copy_highpage(dst, folio_file_page(from_folio, handle));
> > +	folio_put(from_folio);
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned long
> > +ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct
> > page *page,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t i, gfp_t
> > page_gfp,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp)
> > +{
> > +	struct file *filp =3D to_backup_shmem(backup)->filp;
> > +	struct address_space *mapping =3D filp->f_mapping;
> > +	unsigned long handle =3D 0;
> > +	struct folio *to_folio;
> > +	int ret;
> > +
> > +	to_folio =3D shmem_read_folio_gfp(mapping, i, alloc_gfp);
> > +	if (IS_ERR(to_folio))
> > +		return handle;
> > +
> > +	folio_mark_accessed(to_folio);
> > +	folio_lock(to_folio);
> > +	folio_mark_dirty(to_folio);
> > +	copy_highpage(folio_file_page(to_folio, i), page);
> > +	handle =3D i + 1;
> > +
> > +	if (writeback && !folio_mapped(to_folio) &&
> > folio_clear_dirty_for_io(to_folio)) {
> > +		struct writeback_control wbc =3D {
> > +			.sync_mode =3D WB_SYNC_NONE,
> > +			.nr_to_write =3D SWAP_CLUSTER_MAX,
> > +			.range_start =3D 0,
> > +			.range_end =3D LLONG_MAX,
> > +			.for_reclaim =3D 1,
> > +		};
> > +		folio_set_reclaim(to_folio);
> > +		ret =3D mapping->a_ops-
> > >writepage(folio_file_page(to_folio, i), &wbc);
> > +		if (!folio_test_writeback(to_folio))
> > +			folio_clear_reclaim(to_folio);
> > +		/* If writepage succeeds, it unlocks the folio */
> > +		if (ret)
> > +			folio_unlock(to_folio);
> > +	} else {
> > +		folio_unlock(to_folio);
> > +	}
> > +
> > +	folio_put(to_folio);
> > +
> > +	return handle;
> > +}
> > +
> > +static void ttm_backup_shmem_fini(struct ttm_backup *backup)
> > +{
> > +	struct ttm_backup_shmem *sbackup =3D
> > to_backup_shmem(backup);
> > +
> > +	fput(sbackup->filp);
> > +	kfree(sbackup);
> > +}
> > +
> > +static const struct ttm_backup_ops ttm_backup_shmem_ops =3D {
> > +	.drop =3D ttm_backup_shmem_drop,
> > +	.copy_backed_up_page =3D ttm_backup_shmem_copy_page,
> > +	.backup_page =3D ttm_backup_shmem_backup_page,
> > +	.fini =3D ttm_backup_shmem_fini,
> > +};
> > +
> > +/**
> > + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> > + * @size: The maximum size (in bytes) to back up.
> > + *
> > + * Create a backup utilizing shmem objects.
> > + *
> > + * Return: A pointer to a struct ttm_backup on success,
> > + * an error pointer on error.
> > + */
> > +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> > +{
> > +	struct ttm_backup_shmem *sbackup =3D
> > +		kzalloc(sizeof(*sbackup), GFP_KERNEL |
> > __GFP_ACCOUNT);
> > +	struct file *filp;
> > +
> > +	if (!sbackup)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	filp =3D shmem_file_setup("ttm shmem backup", size, 0);
> > +	if (IS_ERR(filp)) {
> > +		kfree(sbackup);
> > +		return ERR_CAST(filp);
> > +	}
> > +
> > +	sbackup->filp =3D filp;
> > +	sbackup->backup.ops =3D &ttm_backup_shmem_ops;
> > +
> > +	return &sbackup->backup;
> > +}
> > +EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
> > diff --git a/include/drm/ttm/ttm_backup.h
> > b/include/drm/ttm/ttm_backup.h
> > new file mode 100644
> > index 000000000000..5f8c7d3069ef
> > --- /dev/null
> > +++ b/include/drm/ttm/ttm_backup.h
> > @@ -0,0 +1,137 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _TTM_BACKUP_H_
> > +#define _TTM_BACKUP_H_
> > +
> > +#include <linux/mm_types.h>
> > +#include <linux/shmem_fs.h>
> > +
> > +struct ttm_backup;
> > +
> > +/**
> > + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page
> > pointer
> > + * @handle: The handle to convert.
> > + *
> > + * Converts an opaque handle received from the
> > + * struct ttm_backoup_ops::backup_page() function to an (invalid)
> > + * struct page pointer suitable for a struct page array.
> > + *
> > + * Return: An (invalid) struct page pointer.
> > + */
> > +static inline struct page *
> > +ttm_backup_handle_to_page_ptr(unsigned long handle)
> > +{
> > +	return (struct page *)(handle << 1 | 1);
> > +}
> > +
> > +/**
> > + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer
> > is a handle
> > + * @page: The struct page pointer to check.
> > + *
> > + * Return: true if the struct page pointer is a handld returned
> > from
> > + * ttm_backup_handle_to_page_ptr(). False otherwise.
> > + */
> > +static inline bool ttm_backup_page_ptr_is_handle(const struct page
> > *page)
> > +{
> > +	return (unsigned long)page & 1;
> > +}
> > +
> > +/**
> > + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer
> > to a handle
> > + * @page: The struct page pointer to convert
> > + *
> > + * Return: The handle that was previously used in
> > + * ttm_backup_handle_to_page_ptr() to obtain a struct page
> > pointer, suitable
> > + * for use as argument in the struct ttm_backup_ops drop() or
> > + * copy_backed_up_page() functions.
> > + */
> > +static inline unsigned long
> > +ttm_backup_page_ptr_to_handle(const struct page *page)
> > +{
> > +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> > +	return (unsigned long)page >> 1;
> > +}
> > +
> > +/** struct ttm_backup_ops - A struct ttm_backup backend operations
> > */
> > +struct ttm_backup_ops {
> > +	/**
> > +	 * drop - release memory associated with a handle
> > +	 * @backup: The struct backup pointer used to obtain the
> > handle
> > +	 * @handle: The handle obtained from the @backup_page
> > function.
> > +	 */
> > +	void (*drop)(struct ttm_backup *backup, unsigned long
> > handle);
> > +
> > +	/**
> > +	 * copy_backed_up_page - Copy the contents of a previously
> > backed
> > +	 * up page
> > +	 * @backup: The struct backup pointer used to back up the
> > page.
> > +	 * @dst: The struct page to copy into.
> > +	 * @handle: The handle returned when the page was backed
> > up.
> > +	 * @intr: Try to perform waits interruptable or at least
> > killable.
> > +	 *
> > +	 * Return: 0 on success, Negative error code on failure,
> > notably
> > +	 * -EINTR if @intr was set to true and a signal is
> > pending.
> > +	 */
> > +	int (*copy_backed_up_page)(struct ttm_backup *backup,
> > struct page *dst,
> > +				=C2=A0=C2=A0 unsigned long handle, bool
> > intr);
> > +
> > +	/**
> > +	 * backup_page - Backup a page
> > +	 * @backup: The struct backup pointer to use.
> > +	 * @page: The page to back up.
> > +	 * @writeback: Whether to perform immediate writeback of
> > the page.
> > +	 * This may have performance implications.
> > +	 * @i: A unique integer for each page and each struct
> > backup.
> > +	 * This is a hint allowing the backup backend to avoid
> > managing
> > +	 * its address space separately.
> > +	 * @page_gfp: The gfp value used when the page was
> > allocated.
> > +	 * This is used for accounting purposes.
> > +	 * @alloc_gfp: The gpf to be used when the backend needs
> > to allocaete
> > +	 * memory.
> > +	 *
> > +	 * Return: A handle on success. 0 on failure.
> > +	 * (This is following the swp_entry_t convention).
> > +	 *
> > +	 * Note: This function could be extended to back up a
> > folio and
> > +	 * backends would then split the folio internally if
> > needed.
> > +	 * Drawback is that the caller would then have to keep
> > track of
> > +	 * the folio size- and usage.
> > +	 */
> > +	unsigned long (*backup_page)(struct ttm_backup *backup,
> > struct page *page,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t i,
> > gfp_t page_gfp,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp);
> > +	/**
> > +	 * fini - Free the struct backup resources after last use.
> > +	 * @backup: Pointer to the struct backup whose resources
> > to free.
> > +	 *
> > +	 * After a call to @fini, it's illegal to use the @backup
> > pointer.
> > +	 */
> > +	void (*fini)(struct ttm_backup *backup);
> > +};
> > +
> > +/**
> > + * struct ttm_backup - Abstract a backup backend.
> > + * @ops: The operations as described above.
> > + *
> > + * The struct ttm_backup is intended to be subclassed by the
> > + * backend implementation.
> > + */
> > +struct ttm_backup {
> > +	const struct ttm_backup_ops *ops;
> > +};
> > +
> > +/**
> > + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> > + * @size: The maximum size (in bytes) to back up.
> > + *
> > + * Create a backup utilizing shmem objects.
> > + *
> > + * Return: A pointer to a struct ttm_backup on success,
> > + * an error pointer on error.
> > + */
> > +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> > +
> > +#endif
>=20

