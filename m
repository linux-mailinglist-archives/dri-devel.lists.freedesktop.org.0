Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D0E9D34EC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 08:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107E110E6B9;
	Wed, 20 Nov 2024 07:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKIlM7py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D3610E04A;
 Wed, 20 Nov 2024 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732089533; x=1763625533;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sO6NTPCd+OrMKNIqrlzSaomqRpd1mFwdPCAj7+Vur0k=;
 b=TKIlM7py45VUAXGe1okHzsI3pHe0yd6C4EqOTVC6pVEpEtTawksD3aUC
 ejgEJspYYyP4jVheSpmcMkWAiBzMHC5SDHpfgR+I9fI/WfKMfNqBlSz80
 /0RcfwSKG2ut24PWHEcI7sQz/SMGahX50Z4aKM9HYGqh6j7ydMpLvZXNT
 BP9DnC7hHaNtbtgnIaDrcYgp186kN2Ya7H2voRyzQEWa07w2OYPCscKA9
 S7XFWYXG+B0SFyTyNyRkm03/40qtYtvRL4RmsS7397DDXEOUCI/f9MSSJ
 Z37BQU/n8V3W8I5K6ehlAy7R+iLawZPYbQwVFOjpMJ7Uz1NOE/OcGWHm5 w==;
X-CSE-ConnectionGUID: K7lSrN91SFmFguxr437O4w==
X-CSE-MsgGUID: BgYyDaUATzGzvG/0M3KcYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32382249"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32382249"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 23:58:53 -0800
X-CSE-ConnectionGUID: uGiU+r5nQ8OQ+1Dcz1yRng==
X-CSE-MsgGUID: fqfUIlIURSKMVP/oBf36CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="89984383"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.14])
 ([10.245.246.14])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 23:58:50 -0800
Message-ID: <7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com>
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 20 Nov 2024 08:58:47 +0100
In-Reply-To: <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
 <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
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

On Tue, 2024-11-19 at 14:40 +0100, Christian K=C3=B6nig wrote:
> Am 15.11.24 um 16:01 schrieb Thomas Hellstr=C3=B6m:
> > Provide a standalone shmem backup implementation.
> > Given the ttm_backup interface, this could
> > later on be extended to providing other backup
> > implementation than shmem, with one use-case being
> > GPU swapout to a user-provided fd.
> >=20
> > v5:
> > - Fix a UAF. (kernel test robot, Dan Carptenter)
> > v6:
> > - Rename ttm_backup_shmem_copy_page() function argument
> > =C2=A0=C2=A0 (Matthew Brost)
> > - Add some missing documentation
> > v8:
> > - Use folio_file_page to get to the page we want to writeback
> > =C2=A0=C2=A0 instead of using the first page of the folio.
> > v13:
> > - Remove the base class abstraction (Christian K=C3=B6nig)
> > - Include ttm_backup_bytes_avail().
> > v14:
> > - Fix kerneldoc for ttm_backup_bytes_avail() (0-day)
> > - Work around casting of __randomize_layout struct pointer (0-day)
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v13
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_backup.c | 204
> > +++++++++++++++++++++++++++++++
> > =C2=A0 include/drm/ttm/ttm_backup.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 =
+++++++++++
> > =C2=A0 3 files changed, 279 insertions(+), 1 deletion(-)
> > =C2=A0 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
> > =C2=A0 create mode 100644 include/drm/ttm/ttm_backup.h
> >=20
> > diff --git a/drivers/gpu/drm/ttm/Makefile
> > b/drivers/gpu/drm/ttm/Makefile
> > index dad298127226..40d07a35293a 100644
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
> > +	ttm_device.o ttm_sys_manager.o ttm_backup.o
> > =C2=A0 ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
> > =C2=A0=20
> > =C2=A0 obj-$(CONFIG_DRM_TTM) +=3D ttm.o
> > diff --git a/drivers/gpu/drm/ttm/ttm_backup.c
> > b/drivers/gpu/drm/ttm/ttm_backup.c
> > new file mode 100644
> > index 000000000000..bf16bb0c594e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> > @@ -0,0 +1,204 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +
> > +#include <drm/ttm/ttm_backup.h>
> > +#include <linux/page-flags.h>
> > +#include <linux/swap.h>
> > +
> > +/*
> > + * Casting from randomized struct file * to struct ttm_backup * is
> > fine since
> > + * struct ttm_backup is never defined nor dereferenced.
> > + */
> > +static struct file *ttm_backup_to_file(struct ttm_backup *backup)
>=20
> Do I get it right that struct ttm_backup is never really defined?

Yes.

> What=20
> purpose does that have?

It's to make the struct ttm_backup opaque to the users of the
ttm_backup interface, so that the implementation doesn't have to worry
about the user making illegal assumptions about the implementation.

> > +{
> > +	return (void *)backup;
> > +}
> > +
> > +static struct ttm_backup *ttm_file_to_backup(struct file *file)
> > +{
> > +	return (void *)file;
> > +}
> > +
> > +/*
> > + * Need to map shmem indices to handle since a handle value
> > + * of 0 means error, following the swp_entry_t convention.
> > + */
> > +static unsigned long ttm_backup_shmem_idx_to_handle(pgoff_t idx)
> > +{
> > +	return (unsigned long)idx + 1;
> > +}
> > +
> > +static pgoff_t ttm_backup_handle_to_shmem_idx(pgoff_t handle)
> > +{
> > +	return handle - 1;
> > +}
> > +
> > +/**
> > + * ttm_backup_drop() - release memory associated with a handle
> > + * @backup: The struct backup pointer used to obtain the handle
> > + * @handle: The handle obtained from the @backup_page function.
> > + */
> > +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle)
> > +{
> > +	loff_t start =3D ttm_backup_handle_to_shmem_idx(handle);
> > +
> > +	start <<=3D PAGE_SHIFT;
> > +	shmem_truncate_range(file_inode(ttm_backup_to_file(backup)
> > ), start,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 start + PAGE_SIZE - 1);
> > +}
> > +
> > +/**
> > + * ttm_backup_copy_page() - Copy the contents of a previously
> > backed
> > + * up page
> > + * @backup: The struct backup pointer used to back up the page.
> > + * @dst: The struct page to copy into.
> > + * @handle: The handle returned when the page was backed up.
> > + * @intr: Try to perform waits interruptable or at least killable.
> > + *
> > + * Return: 0 on success, Negative error code on failure, notably
> > + * -EINTR if @intr was set to true and a signal is pending.
> > + */
> > +int ttm_backup_copy_page(struct ttm_backup *backup, struct page
> > *dst,
> > +			 pgoff_t handle, bool intr)
> > +{
> > +	struct file *filp =3D ttm_backup_to_file(backup);
> > +	struct address_space *mapping =3D filp->f_mapping;
> > +	struct folio *from_folio;
> > +	pgoff_t idx =3D ttm_backup_handle_to_shmem_idx(handle);
> > +
> > +	from_folio =3D shmem_read_folio(mapping, idx);
> > +	if (IS_ERR(from_folio))
> > +		return PTR_ERR(from_folio);
> > +
> > +	copy_highpage(dst, folio_file_page(from_folio, idx));
> > +	folio_put(from_folio);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * ttm_backup_backup_page() - Backup a page
> > + * @backup: The struct backup pointer to use.
> > + * @page: The page to back up.
> > + * @writeback: Whether to perform immediate writeback of the page.
> > + * This may have performance implications.
> > + * @idx: A unique integer for each page and each struct backup.
> > + * This allows the backup implementation to avoid managing
> > + * its address space separately.
> > + * @page_gfp: The gfp value used when the page was allocated.
> > + * This is used for accounting purposes.
> > + * @alloc_gfp: The gpf to be used when allocating memory.
>=20
> Typo: gfp instead of gpf.

Sure.

>=20
> > + *
> > + * Context: If called from reclaim context, the caller needs to
> > + * assert that the shrinker gfp has __GFP_FS set, to avoid
> > + * deadlocking on lock_page(). If @writeback is set to true and
> > + * called from reclaim context, the caller also needs to assert
> > + * that the shrinker gfp has __GFP_IO set, since without it,
> > + * we're not allowed to start backup IO.
> > + *
> > + * Return: A handle on success. 0 on failure.
> > + * (This is following the swp_entry_t convention).
> > + *
> > + * Note: This function could be extended to back up a folio and
> > + * implementations would then split the folio internally if
> > needed.
> > + * Drawback is that the caller would then have to keep track of
> > + * the folio size- and usage.
> > + */
> > +unsigned long
> > +ttm_backup_backup_page(struct ttm_backup *backup, struct page
> > *page,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t idx, gf=
p_t
> > page_gfp,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp)
> > +{
> > +	struct file *filp =3D ttm_backup_to_file(backup);
> > +	struct address_space *mapping =3D filp->f_mapping;
> > +	unsigned long handle =3D 0;
> > +	struct folio *to_folio;
> > +	int ret;
> > +
> > +	to_folio =3D shmem_read_folio_gfp(mapping, idx, alloc_gfp);
> > +	if (IS_ERR(to_folio))
> > +		return handle;
>=20
> Just that I sleep better: This can never return a folio larger than a
> page, doesn't it?

The interface definitely allows for returning larger folios, but the
individual page in the folio is selected by folio_file_page(folio,
idx).

/Thomas


>=20
> Apart from those background questions looks good to me.
>=20
> Regards,
> Christian.
>=20
> > +
> > +	folio_mark_accessed(to_folio);
> > +	folio_lock(to_folio);
> > +	folio_mark_dirty(to_folio);
> > +	copy_highpage(folio_file_page(to_folio, idx), page);
> > +	handle =3D ttm_backup_shmem_idx_to_handle(idx);
> > +
> > +	if (writeback && !folio_mapped(to_folio) &&
> > +	=C2=A0=C2=A0=C2=A0 folio_clear_dirty_for_io(to_folio)) {
> > +		struct writeback_control wbc =3D {
> > +			.sync_mode =3D WB_SYNC_NONE,
> > +			.nr_to_write =3D SWAP_CLUSTER_MAX,
> > +			.range_start =3D 0,
> > +			.range_end =3D LLONG_MAX,
> > +			.for_reclaim =3D 1,
> > +		};
> > +		folio_set_reclaim(to_folio);
> > +		ret =3D mapping->a_ops-
> > >writepage(folio_file_page(to_folio, idx), &wbc);
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
> > +/**
> > + * ttm_backup_fini() - Free the struct backup resources after last
> > use.
> > + * @backup: Pointer to the struct backup whose resources to free.
> > + *
> > + * After a call to this function, it's illegal to use the @backup
> > pointer.
> > + */
> > +void ttm_backup_fini(struct ttm_backup *backup)
> > +{
> > +	fput(ttm_backup_to_file(backup));
> > +}
> > +
> > +/**
> > + * ttm_backup_bytes_avail() - Report the approximate number of
> > bytes of backup space
> > + * left for backup.
> > + *
> > + * This function is intended also for driver use to indicate
> > whether a
> > + * backup attempt is meaningful.
> > + *
> > + * Return: An approximate size of backup space available.
> > + */
> > +u64 ttm_backup_bytes_avail(void)
> > +{
> > +	/*
> > +	 * The idea behind backing up to shmem is that shmem
> > objects may
> > +	 * eventually be swapped out. So no point swapping out if
> > there
> > +	 * is no or low swap-space available. But the accuracy of
> > this
> > +	 * number also depends on shmem actually swapping out
> > backed-up
> > +	 * shmem objects without too much buffering.
> > +	 */
> > +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
> > +}
> > +EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
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
> > +	struct file *filp;
> > +
> > +	filp =3D shmem_file_setup("ttm shmem backup", size, 0);
> > +
> > +	return ttm_file_to_backup(filp);
> > +}
> > diff --git a/include/drm/ttm/ttm_backup.h
> > b/include/drm/ttm/ttm_backup.h
> > new file mode 100644
> > index 000000000000..20609da7e281
> > --- /dev/null
> > +++ b/include/drm/ttm/ttm_backup.h
> > @@ -0,0 +1,74 @@
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
> > +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
> > +
> > +int ttm_backup_copy_page(struct ttm_backup *backup, struct page
> > *dst,
> > +			 pgoff_t handle, bool intr);
> > +
> > +unsigned long
> > +ttm_backup_backup_page(struct ttm_backup *backup, struct page
> > *page,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t idx, gf=
p_t
> > page_gfp,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp);
> > +
> > +void ttm_backup_fini(struct ttm_backup *backup);
> > +
> > +u64 ttm_backup_bytes_avail(void);
> > +
> > +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> > +
> > +#endif
>=20

