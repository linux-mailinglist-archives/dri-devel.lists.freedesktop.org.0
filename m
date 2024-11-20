Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83389D3958
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F5810E70D;
	Wed, 20 Nov 2024 11:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTWbFVXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5610E70D;
 Wed, 20 Nov 2024 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732101630; x=1763637630;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=txC85dMgL8wgHs+FaSs2etsVzdPBdlc/aqchDrcNHkU=;
 b=kTWbFVXGxUAzlVNNdI1ukK2eXeUm+Y10Q2XB4IaQUCHtIQxNm8EGHrgZ
 eAVV76tmrjIBsAwKAGgvcvR6oDjBgENch3yAvQEE+iDYimrKvkdwJZRV1
 g7HVtaUfDIYTxynOnfAEhWjO4o+io+C0lQmMmtlgs/OjeTlXACrodH6jd
 AVjUXT9YFhpZxxTV5HZluoEy99up+34YBTDZ069aDGUVjAQrEd1fhWcY3
 f1zZww8q41ifn5a6Fig2K+t9qdbfxya+pfmgnteXKPemupDEKp8ViChaZ
 V7WM8o10yrG9yLi5dbpkgbus1++ZkPh5W+pga1uEibZ4bwuovxeOv7Gsf Q==;
X-CSE-ConnectionGUID: JJlQULE7S9+pudhx2v41Jg==
X-CSE-MsgGUID: v95rLxpQSPKaERVOTKlNOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31523610"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="31523610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:20:30 -0800
X-CSE-ConnectionGUID: 4kmraDkJTXOTmA09YcMRoQ==
X-CSE-MsgGUID: TUY90Z7/SWisxV0SZfsrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="89835032"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.14])
 ([10.245.246.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:20:27 -0800
Message-ID: <cf1e39e5182e64910c3bca12c20e7d4271fd2d83.camel@linux.intel.com>
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 20 Nov 2024 12:20:24 +0100
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
>=20

[SNIP]

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

One remaining sligtht concern, though, is that if we repeatedly call -
>writepage() for *each* page in a folio, that might degrade
performance. Not sure if the filesystem is supposed to coalesce such
requests if they happen, or whether things will start to crawl.

Right now we can't really tell, since shmem typically only allocates
single page folios (unless told otherwise, like i915 does), and in
addition shmem writepage() also splits any large folios. I've seen
patches floating around to remove that split, though.

/Thomas
=20
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

