Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7DF9D386B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 11:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD3B10E6E1;
	Wed, 20 Nov 2024 10:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erOR35J1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20F10E6DB;
 Wed, 20 Nov 2024 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732098862; x=1763634862;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QT7hC0mE1FQH2P3XU2NbQnYJctgveipyZWV7Ihn57SA=;
 b=erOR35J1aLnhUsVNlTUwuTKsnpr6IqGkBVPBGF4eFvQFL1KtdXmz2Ckj
 ddogKZn2XBog1wFlrjL0Op0mRSmiGC1z+j5qZi35NoYsiU1aWr6vG3it5
 J7mech/oyBvKz9M4IifVtk6E6R3IpXQ9lo73hgzRk0licCfuaEPssV+2N
 xZSyLIfycLECu+3aEesjdbWIBUQ0te1tDfnLq8YEsCByhUpl14mWFy3hF
 Pi3cF8llPNdKn4S4nzEEYxkfnWkDyhW87E+UQQfk+BNmN1n3/KLGdy8TQ
 YKC7PhBOpNGNAfvUr5lYYFZgzVR8aFsrGnjcYgUFiZ84XQCIWqE/WJ3oI A==;
X-CSE-ConnectionGUID: rauFMcn/Sd2tDFpXJleEcw==
X-CSE-MsgGUID: TlYjuxKGR3uRE1qbC7UI7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32081746"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32081746"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:34:22 -0800
X-CSE-ConnectionGUID: 2G6mr3wJQwOAhT8psFthJw==
X-CSE-MsgGUID: +EQHXcOCTNaxuW+LRoereA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="90684062"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.14])
 ([10.245.246.14])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:34:20 -0800
Message-ID: <c6150ee393df840af77afc7f370d74a04cfe40f2.camel@linux.intel.com>
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 20 Nov 2024 11:34:16 +0100
In-Reply-To: <22e11191-c52f-4544-a91f-5a53bc78fae9@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
 <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
 <7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com>
 <22e11191-c52f-4544-a91f-5a53bc78fae9@amd.com>
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

On Wed, 2024-11-20 at 10:24 +0100, Christian K=C3=B6nig wrote:
> Am 20.11.24 um 08:58 schrieb Thomas Hellstr=C3=B6m:
> > On Tue, 2024-11-19 at 14:40 +0100, Christian K=C3=B6nig wrote:
> > > [SNIP]
> > > > +
> > > > +/*
> > > > + * Casting from randomized struct file * to struct ttm_backup
> > > > * is
> > > > fine since
> > > > + * struct ttm_backup is never defined nor dereferenced.
> > > > + */
> > > > +static struct file *ttm_backup_to_file(struct ttm_backup
> > > > *backup)
> > > Do I get it right that struct ttm_backup is never really defined?
> > Yes.
> >=20
> > > What
> > > purpose does that have?
> > It's to make the struct ttm_backup opaque to the users of the
> > ttm_backup interface, so that the implementation doesn't have to
> > worry
> > about the user making illegal assumptions about the implementation.
>=20
> That is usually done with a typedef and one of the few cases where=20
> typedefs are actually advised to be used.
>=20

Well wouldn't ttm_backup.h then have to include the declaration of
struct file plus a typedef that would probably raise many eyebrows even
if it's ok to use it there?=C2=A0

Having the header just declare a struct without providing a definition
is the typical way of hiding the implementation and avoid includes, no?

If you insist we can drop the struct ttm_backup * and just use struct
file, but then again if we change the implementation to allow for
backuping to a file or similar that needs to be re-done, so as said
unless you insist I'd rather keep it as is.

>=20
> [SNIP]
> > > > + *
> > > > + * Context: If called from reclaim context, the caller needs
> > > > to
> > > > + * assert that the shrinker gfp has __GFP_FS set, to avoid
> > > > + * deadlocking on lock_page(). If @writeback is set to true
> > > > and
> > > > + * called from reclaim context, the caller also needs to
> > > > assert
> > > > + * that the shrinker gfp has __GFP_IO set, since without it,
> > > > + * we're not allowed to start backup IO.
> > > > + *
> > > > + * Return: A handle on success. 0 on failure.
> > > > + * (This is following the swp_entry_t convention).
> > > > + *
> > > > + * Note: This function could be extended to back up a folio
> > > > and
> > > > + * implementations would then split the folio internally if
> > > > needed.
> > > > + * Drawback is that the caller would then have to keep track
> > > > of
> > > > + * the folio size- and usage.
> > > > + */
> > > > +unsigned long
> > > > +ttm_backup_backup_page(struct ttm_backup *backup, struct page
> > > > *page,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t idx=
, gfp_t
> > > > page_gfp,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp)
> > > > +{
> > > > +	struct file *filp =3D ttm_backup_to_file(backup);
> > > > +	struct address_space *mapping =3D filp->f_mapping;
> > > > +	unsigned long handle =3D 0;
> > > > +	struct folio *to_folio;
> > > > +	int ret;
> > > > +
> > > > +	to_folio =3D shmem_read_folio_gfp(mapping, idx,
> > > > alloc_gfp);
> > > > +	if (IS_ERR(to_folio))
> > > > +		return handle;
>=20
> Probably better to explicitly return 0 here.

OK,

>=20
> And BTW why are we using 0 as indication for an error? Couldn't we
> just=20
> use a long as return value and return a proper -errno here?

0 is the swp_entry_t error value which is the convention also used for
the handles, so rather than inventing something new It'd be good to
keep to something that would work even with handles aliased to
swp_entry_t if we'd need to resort to that at some point.

>=20
> > > Just that I sleep better: This can never return a folio larger
> > > than a
> > > page, doesn't it?
> > The interface definitely allows for returning larger folios, but
> > the
> > individual page in the folio is selected by folio_file_page(folio,
> > idx).
>=20
> Ah, yeah completely missed that and was really wondering why that
> would=20
> work.

Thanks,
Thomas

>=20
> >=20
> > /Thomas
> >=20
> >=20
> > > Apart from those background questions looks good to me.
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > +
> > > > +	folio_mark_accessed(to_folio);
> > > > +	folio_lock(to_folio);
> > > > +	folio_mark_dirty(to_folio);
> > > > +	copy_highpage(folio_file_page(to_folio, idx), page);
> > > > +	handle =3D ttm_backup_shmem_idx_to_handle(idx);
> > > > +
> > > > +	if (writeback && !folio_mapped(to_folio) &&
> > > > +	=C2=A0=C2=A0=C2=A0 folio_clear_dirty_for_io(to_folio)) {
> > > > +		struct writeback_control wbc =3D {
> > > > +			.sync_mode =3D WB_SYNC_NONE,
> > > > +			.nr_to_write =3D SWAP_CLUSTER_MAX,
> > > > +			.range_start =3D 0,
> > > > +			.range_end =3D LLONG_MAX,
> > > > +			.for_reclaim =3D 1,
> > > > +		};
> > > > +		folio_set_reclaim(to_folio);
> > > > +		ret =3D mapping->a_ops-
> > > > > writepage(folio_file_page(to_folio, idx), &wbc);
> > > > +		if (!folio_test_writeback(to_folio))
> > > > +			folio_clear_reclaim(to_folio);
> > > > +		/* If writepage succeeds, it unlocks the folio
> > > > */
> > > > +		if (ret)
> > > > +			folio_unlock(to_folio);
>=20
> The code ignores the error and potentially deserves an explanation
> for that.
>=20
> Regards,
> Christian.
>=20
> > > > +	} else {
> > > > +		folio_unlock(to_folio);
> > > > +	}
> > > > +
> > > > +	folio_put(to_folio);
> > > > +
> > > > +	return handle;
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_backup_fini() - Free the struct backup resources after
> > > > last
> > > > use.
> > > > + * @backup: Pointer to the struct backup whose resources to
> > > > free.
> > > > + *
> > > > + * After a call to this function, it's illegal to use the
> > > > @backup
> > > > pointer.
> > > > + */
> > > > +void ttm_backup_fini(struct ttm_backup *backup)
> > > > +{
> > > > +	fput(ttm_backup_to_file(backup));
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_backup_bytes_avail() - Report the approximate number of
> > > > bytes of backup space
> > > > + * left for backup.
> > > > + *
> > > > + * This function is intended also for driver use to indicate
> > > > whether a
> > > > + * backup attempt is meaningful.
> > > > + *
> > > > + * Return: An approximate size of backup space available.
> > > > + */
> > > > +u64 ttm_backup_bytes_avail(void)
> > > > +{
> > > > +	/*
> > > > +	 * The idea behind backing up to shmem is that shmem
> > > > objects may
> > > > +	 * eventually be swapped out. So no point swapping out
> > > > if
> > > > there
> > > > +	 * is no or low swap-space available. But the accuracy
> > > > of
> > > > this
> > > > +	 * number also depends on shmem actually swapping out
> > > > backed-up
> > > > +	 * shmem objects without too much buffering.
> > > > +	 */
> > > > +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
> > > > +
> > > > +/**
> > > > + * ttm_backup_shmem_create() - Create a shmem-based struct
> > > > backup.
> > > > + * @size: The maximum size (in bytes) to back up.
> > > > + *
> > > > + * Create a backup utilizing shmem objects.
> > > > + *
> > > > + * Return: A pointer to a struct ttm_backup on success,
> > > > + * an error pointer on error.
> > > > + */
> > > > +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> > > > +{
> > > > +	struct file *filp;
> > > > +
> > > > +	filp =3D shmem_file_setup("ttm shmem backup", size, 0);
> > > > +
> > > > +	return ttm_file_to_backup(filp);
> > > > +}
> > > > diff --git a/include/drm/ttm/ttm_backup.h
> > > > b/include/drm/ttm/ttm_backup.h
> > > > new file mode 100644
> > > > index 000000000000..20609da7e281
> > > > --- /dev/null
> > > > +++ b/include/drm/ttm/ttm_backup.h
> > > > @@ -0,0 +1,74 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright =C2=A9 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _TTM_BACKUP_H_
> > > > +#define _TTM_BACKUP_H_
> > > > +
> > > > +#include <linux/mm_types.h>
> > > > +#include <linux/shmem_fs.h>
> > > > +
> > > > +struct ttm_backup;
> > > > +
> > > > +/**
> > > > + * ttm_backup_handle_to_page_ptr() - Convert handle to struct
> > > > page
> > > > pointer
> > > > + * @handle: The handle to convert.
> > > > + *
> > > > + * Converts an opaque handle received from the
> > > > + * struct ttm_backoup_ops::backup_page() function to an
> > > > (invalid)
> > > > + * struct page pointer suitable for a struct page array.
> > > > + *
> > > > + * Return: An (invalid) struct page pointer.
> > > > + */
> > > > +static inline struct page *
> > > > +ttm_backup_handle_to_page_ptr(unsigned long handle)
> > > > +{
> > > > +	return (struct page *)(handle << 1 | 1);
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_backup_page_ptr_is_handle() - Whether a struct page
> > > > pointer
> > > > is a handle
> > > > + * @page: The struct page pointer to check.
> > > > + *
> > > > + * Return: true if the struct page pointer is a handld
> > > > returned
> > > > from
> > > > + * ttm_backup_handle_to_page_ptr(). False otherwise.
> > > > + */
> > > > +static inline bool ttm_backup_page_ptr_is_handle(const struct
> > > > page
> > > > *page)
> > > > +{
> > > > +	return (unsigned long)page & 1;
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_backup_page_ptr_to_handle() - Convert a struct page
> > > > pointer
> > > > to a handle
> > > > + * @page: The struct page pointer to convert
> > > > + *
> > > > + * Return: The handle that was previously used in
> > > > + * ttm_backup_handle_to_page_ptr() to obtain a struct page
> > > > pointer, suitable
> > > > + * for use as argument in the struct ttm_backup_ops drop() or
> > > > + * copy_backed_up_page() functions.
> > > > + */
> > > > +static inline unsigned long
> > > > +ttm_backup_page_ptr_to_handle(const struct page *page)
> > > > +{
> > > > +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> > > > +	return (unsigned long)page >> 1;
> > > > +}
> > > > +
> > > > +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t
> > > > handle);
> > > > +
> > > > +int ttm_backup_copy_page(struct ttm_backup *backup, struct
> > > > page
> > > > *dst,
> > > > +			 pgoff_t handle, bool intr);
> > > > +
> > > > +unsigned long
> > > > +ttm_backup_backup_page(struct ttm_backup *backup, struct page
> > > > *page,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t idx=
, gfp_t
> > > > page_gfp,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp);
> > > > +
> > > > +void ttm_backup_fini(struct ttm_backup *backup);
> > > > +
> > > > +u64 ttm_backup_bytes_avail(void);
> > > > +
> > > > +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> > > > +
> > > > +#endif

