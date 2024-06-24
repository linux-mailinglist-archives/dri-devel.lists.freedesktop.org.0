Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24F914662
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22410E3D3;
	Mon, 24 Jun 2024 09:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aw40VDw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2A210E3D2;
 Mon, 24 Jun 2024 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719221180; x=1750757180;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=25zYuGg9kUu7eRCcB3ofLMXN1LD7bmsMwtKtvW5iWq0=;
 b=Aw40VDw6abQJitRzr0w1UaKAxDgxxSp0vrASzBmxEoaCQ8UcPhulS7pl
 pgLdRKVtIw54FGqNImbfMDV+9eVhiYzdSot4opWsaSqFx+3C2SIA+qCnH
 BfLedGuFh/dTuOiL/PjUILMD482gyDiukaTr1Q9hM0NGFMgZqyQ4nB5ew
 h8AQ4z66cHPDYSBJ4+0q+AafW7xTTEDAvurGerOywaw2/b2zkItZqTWdt
 wPbPiZ/oRUTMMLtIvIoLUhmgGib3j/MU3JjyRaWUmnvAkGORen/u6S5Ah
 BhiqrZTN8GZXQq0GosZ0nCbijur40MchvP6afLYbypceTJMUoD48UI6/j A==;
X-CSE-ConnectionGUID: SHjtEj7ZQXOvx72za7jHrA==
X-CSE-MsgGUID: Agps1GWKSASlT6VZYjcHUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19954546"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="19954546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:26:18 -0700
X-CSE-ConnectionGUID: p3ykGe6/QIaUuanorzfp2A==
X-CSE-MsgGUID: BBU4CMQaTXutrP+s4OhY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43334233"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.144])
 ([10.245.244.144])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:26:17 -0700
Message-ID: <5ea5f9b732906915ea67fe0f3e62f6a8ddfcdd05.camel@linux.intel.com>
Subject: Re: [PATCH v5 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Mon, 24 Jun 2024 11:26:09 +0200
In-Reply-To: <ZnRH73TPv4v3yg4/@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-9-thomas.hellstrom@linux.intel.com>
 <ZnRH73TPv4v3yg4/@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-06-20 at 15:17 +0000, Matthew Brost wrote:
> On Tue, Jun 18, 2024 at 09:18:16AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Initially intended for experimenting with different backup
> > solutions (shmem vs direct swap cache insertion), abstract
> > the backup destination using a virtual base class.
> >=20
> > Also provide a sample implementation for shmem.
> >=20
> > While when settling on a preferred backup solution, one could
> > perhaps skip the abstraction, this functionality may actually
> > come in handy for configurable dedicated graphics memory
> > backup to fast nvme files or similar, whithout affecting
> > swap-space. Could indeed be useful for VRAM backup on S4 and
> > other cases.
> >=20
>=20
> Implementation seemly makes sense and matches other similar usages of
> shmem /
> folio functions I could find in the kernel.
>=20
> A few questions / nits below.
>=20
> > v5:
> > - Fix a UAF. (kernel test robot, Dan Carptenter)
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139
> > +++++++++++++++++++++++++
> > =C2=A0include/drm/ttm/ttm_backup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 136
> > ++++++++++++++++++++++++
> > =C2=A03 files changed, 276 insertions(+), 1 deletion(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > =C2=A0create mode 100644 include/drm/ttm/ttm_backup.h
> >=20
> > diff --git a/drivers/gpu/drm/ttm/Makefile
> > b/drivers/gpu/drm/ttm/Makefile
> > index dad298127226..5e980dd90e41 100644
> > --- a/drivers/gpu/drm/ttm/Makefile
> > +++ b/drivers/gpu/drm/ttm/Makefile
> > @@ -4,7 +4,7 @@
> > =C2=A0
> > =C2=A0ttm-y :=3D ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module=
.o
> > \
> > =C2=A0	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o
> > ttm_pool.o \
> > -	ttm_device.o ttm_sys_manager.o
> > +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
> > =C2=A0ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
> > =C2=A0
> > =C2=A0obj-$(CONFIG_DRM_TTM) +=3D ttm.o
> > diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > new file mode 100644
> > index 000000000000..f5bc47734d71
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
> Can you explain the -1 / +1 usage to handle in this code? Is it to
> test
> that 'pgoff_t i' is indeed just a hint and return a different handle?

It's IIRC because handle '0' has a reserved usage in the code, so
handle becomes file address space + 1.

I need to double-check that so that I don't confuse this with the
swap-space backend.


>=20
> > +	shmem_truncate_range(file_inode(to_backup_shmem(backup)-
> > >filp), handle,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 handle + 1);
> > +}
> > +
> > +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup,
> > struct page *dst,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long handle, bool
> > killable)
>=20
> In the vfunc definition 'killable' is named 'intr'. I'd keep the
> naming
> consistent.

Sure.


>=20
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
>=20
> Does this not need to be after 'folio_lock'?

It's used unlocked in many places in the kernel AFAICT.

>=20
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
> > >writepage(folio_page(to_folio, 0), &wbc);
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
> > index 000000000000..88e8b97a6fdc
> > --- /dev/null
> > +++ b/include/drm/ttm/ttm_backup.h
> > @@ -0,0 +1,136 @@
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
>=20
> The above two are arguments flipped in order compared to function
> definition.

Will fix.

Thanks, Thomas

>=20
> Matt
>=20
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
> > --=20
> > 2.44.0
> >=20

