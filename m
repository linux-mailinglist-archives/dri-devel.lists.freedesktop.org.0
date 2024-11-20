Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7349D3921
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B246310E708;
	Wed, 20 Nov 2024 11:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8kldLcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DDC10E701;
 Wed, 20 Nov 2024 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100869; x=1763636869;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pxvjuXuEg4OWmpLiPQ5y5a9/YGoygAugRAODzv0upLg=;
 b=O8kldLcfqbml3S5zb6pxNjcJrdBO/hT3sb+uMYvRQIS+b0W1E9lkESXB
 3VOd1L5eC4cq0DoVP1FESvmoq1ElvoLV/S661AWlcuCj9Fp8UHhp/4t6T
 KrfZ9nA1mniL0SpoYOR28If+LDMMVYp78vIX2J41UgjjRdyg7Kppgw1MQ
 3Usf7//A2zAlm4pyycW8Zp6UdRNFcT/ByOZl6xJbHqpYEJLyWWvoIa0Wu
 hy/kbcFmLOsDC25SMh2hbw316IQWKqJY9d5nuJaWeW2PUxmwHt5yG0fvr
 rif1SmD4F33BoLGowMzL7oGVXhRGWPWSSC5q3Kl/nK36Ul44Dz075dWiX w==;
X-CSE-ConnectionGUID: pdPRd0/FTrSYc9rEDOarwA==
X-CSE-MsgGUID: ew/e513NSi6BnDoMBYw34g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49682976"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="49682976"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:07:48 -0800
X-CSE-ConnectionGUID: ddpoVKTMRdqNBmTX/eD9qA==
X-CSE-MsgGUID: QICRjk9vRzuC9rbTitAyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="89994704"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.14])
 ([10.245.246.14])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:07:45 -0800
Message-ID: <0bac487f31902822589152d672203eee10824903.camel@linux.intel.com>
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 20 Nov 2024 12:07:42 +0100
In-Reply-To: <560973dd-c125-415b-a1ae-bb3aae8d37b0@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
 <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
 <7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com>
 <22e11191-c52f-4544-a91f-5a53bc78fae9@amd.com>
 <c6150ee393df840af77afc7f370d74a04cfe40f2.camel@linux.intel.com>
 <560973dd-c125-415b-a1ae-bb3aae8d37b0@amd.com>
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

On Wed, 2024-11-20 at 11:50 +0100, Christian K=C3=B6nig wrote:
> Am 20.11.24 um 11:34 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2024-11-20 at 10:24 +0100, Christian K=C3=B6nig wrote:
> > > Am 20.11.24 um 08:58 schrieb Thomas Hellstr=C3=B6m:
> > > > On Tue, 2024-11-19 at 14:40 +0100, Christian K=C3=B6nig wrote:
> > > > > [SNIP]
> > > > > > +
> > > > > > +/*
> > > > > > + * Casting from randomized struct file * to struct
> > > > > > ttm_backup
> > > > > > * is
> > > > > > fine since
> > > > > > + * struct ttm_backup is never defined nor dereferenced.
> > > > > > + */
> > > > > > +static struct file *ttm_backup_to_file(struct ttm_backup
> > > > > > *backup)
> > > > > Do I get it right that struct ttm_backup is never really
> > > > > defined?
> > > > Yes.
> > > >=20
> > > > > What
> > > > > purpose does that have?
> > > > It's to make the struct ttm_backup opaque to the users of the
> > > > ttm_backup interface, so that the implementation doesn't have
> > > > to
> > > > worry
> > > > about the user making illegal assumptions about the
> > > > implementation.
> > > That is usually done with a typedef and one of the few cases
> > > where
> > > typedefs are actually advised to be used.
> > >=20
> > Well wouldn't ttm_backup.h then have to include the declaration of
> > struct file plus a typedef that would probably raise many eyebrows
> > even
> > if it's ok to use it there?
>=20
> No, what you do is something like this:
>=20
> typedef struct ttm_backup *ttm_backup;
>=20
> Then struct ttm_backup is either never defined or only inside your C=20
> file but not the header.
>=20
> > Having the header just declare a struct without providing a
> > definition
> > is the typical way of hiding the implementation and avoid includes,
> > no?
> >=20
> > If you insist we can drop the struct ttm_backup * and just use
> > struct
> > file, but then again if we change the implementation to allow for
> > backuping to a file or similar that needs to be re-done, so as said
> > unless you insist I'd rather keep it as is.
>=20
> Abstracting that is ok, I was just wondering about why you do it like
> this.
>=20
> >=20
> > > [SNIP]
> > > > > > + *
> > > > > > + * Context: If called from reclaim context, the caller
> > > > > > needs
> > > > > > to
> > > > > > + * assert that the shrinker gfp has __GFP_FS set, to avoid
> > > > > > + * deadlocking on lock_page(). If @writeback is set to
> > > > > > true
> > > > > > and
> > > > > > + * called from reclaim context, the caller also needs to
> > > > > > assert
> > > > > > + * that the shrinker gfp has __GFP_IO set, since without
> > > > > > it,
> > > > > > + * we're not allowed to start backup IO.
> > > > > > + *
> > > > > > + * Return: A handle on success. 0 on failure.
> > > > > > + * (This is following the swp_entry_t convention).
> > > > > > + *
> > > > > > + * Note: This function could be extended to back up a
> > > > > > folio
> > > > > > and
> > > > > > + * implementations would then split the folio internally
> > > > > > if
> > > > > > needed.
> > > > > > + * Drawback is that the caller would then have to keep
> > > > > > track
> > > > > > of
> > > > > > + * the folio size- and usage.
> > > > > > + */
> > > > > > +unsigned long
> > > > > > +ttm_backup_backup_page(struct ttm_backup *backup, struct
> > > > > > page
> > > > > > *page,
> > > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t=
 idx, gfp_t
> > > > > > page_gfp,
> > > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp)
> > > > > > +{
> > > > > > +	struct file *filp =3D ttm_backup_to_file(backup);
> > > > > > +	struct address_space *mapping =3D filp->f_mapping;
> > > > > > +	unsigned long handle =3D 0;
> > > > > > +	struct folio *to_folio;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	to_folio =3D shmem_read_folio_gfp(mapping, idx,
> > > > > > alloc_gfp);
> > > > > > +	if (IS_ERR(to_folio))
> > > > > > +		return handle;
> > > Probably better to explicitly return 0 here.
> > OK,
> >=20
> > > And BTW why are we using 0 as indication for an error? Couldn't
> > > we
> > > just
> > > use a long as return value and return a proper -errno here?
> > 0 is the swp_entry_t error value which is the convention also used
> > for
> > the handles, so rather than inventing something new It'd be good to
> > keep to something that would work even with handles aliased to
> > swp_entry_t if we'd need to resort to that at some point.
>=20
> Uff, yeah but that is an implementation detail of the swap subsystem=20
> caused by how we store the swapped out entries inside CPU PTEs.
>=20
> I would strongly try to avoid that here. Was already wondering why we
> use long as return value and s64.

That is true, The background here is that the initial implementation
allowed for direct insertion into the swap cache, and then the handles
returned would be (unsigned long)swp_entry_t, and the interface was
kept to allow for such a change should it be necessary.

But yeah I guess a logical consequence of removing support for
alternative backup backends would be to drop explicit support for that.

So I can change that to s64 np.

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > > > > Just that I sleep better: This can never return a folio
> > > > > larger
> > > > > than a
> > > > > page, doesn't it?
> > > > The interface definitely allows for returning larger folios,
> > > > but
> > > > the
> > > > individual page in the folio is selected by
> > > > folio_file_page(folio,
> > > > idx).
> > > Ah, yeah completely missed that and was really wondering why that
> > > would
> > > work.
> > Thanks,
> > Thomas
> >=20
> > > > /Thomas
> > > >=20
> > > >=20
> > > > > Apart from those background questions looks good to me.
> > > > >=20
> > > > > Regards,
> > > > > Christian.
> > > > >=20
> > > > > > +
> > > > > > +	folio_mark_accessed(to_folio);
> > > > > > +	folio_lock(to_folio);
> > > > > > +	folio_mark_dirty(to_folio);
> > > > > > +	copy_highpage(folio_file_page(to_folio, idx),
> > > > > > page);
> > > > > > +	handle =3D ttm_backup_shmem_idx_to_handle(idx);
> > > > > > +
> > > > > > +	if (writeback && !folio_mapped(to_folio) &&
> > > > > > +	=C2=A0=C2=A0=C2=A0 folio_clear_dirty_for_io(to_folio)) {
> > > > > > +		struct writeback_control wbc =3D {
> > > > > > +			.sync_mode =3D WB_SYNC_NONE,
> > > > > > +			.nr_to_write =3D SWAP_CLUSTER_MAX,
> > > > > > +			.range_start =3D 0,
> > > > > > +			.range_end =3D LLONG_MAX,
> > > > > > +			.for_reclaim =3D 1,
> > > > > > +		};
> > > > > > +		folio_set_reclaim(to_folio);
> > > > > > +		ret =3D mapping->a_ops-
> > > > > > > writepage(folio_file_page(to_folio, idx), &wbc);
> > > > > > +		if (!folio_test_writeback(to_folio))
> > > > > > +			folio_clear_reclaim(to_folio);
> > > > > > +		/* If writepage succeeds, it unlocks the
> > > > > > folio
> > > > > > */
> > > > > > +		if (ret)
> > > > > > +			folio_unlock(to_folio);
> > > The code ignores the error and potentially deserves an
> > > explanation
> > > for that.
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > > > +	} else {
> > > > > > +		folio_unlock(to_folio);
> > > > > > +	}
> > > > > > +
> > > > > > +	folio_put(to_folio);
> > > > > > +
> > > > > > +	return handle;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_backup_fini() - Free the struct backup resources
> > > > > > after
> > > > > > last
> > > > > > use.
> > > > > > + * @backup: Pointer to the struct backup whose resources
> > > > > > to
> > > > > > free.
> > > > > > + *
> > > > > > + * After a call to this function, it's illegal to use the
> > > > > > @backup
> > > > > > pointer.
> > > > > > + */
> > > > > > +void ttm_backup_fini(struct ttm_backup *backup)
> > > > > > +{
> > > > > > +	fput(ttm_backup_to_file(backup));
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_backup_bytes_avail() - Report the approximate
> > > > > > number of
> > > > > > bytes of backup space
> > > > > > + * left for backup.
> > > > > > + *
> > > > > > + * This function is intended also for driver use to
> > > > > > indicate
> > > > > > whether a
> > > > > > + * backup attempt is meaningful.
> > > > > > + *
> > > > > > + * Return: An approximate size of backup space available.
> > > > > > + */
> > > > > > +u64 ttm_backup_bytes_avail(void)
> > > > > > +{
> > > > > > +	/*
> > > > > > +	 * The idea behind backing up to shmem is that
> > > > > > shmem
> > > > > > objects may
> > > > > > +	 * eventually be swapped out. So no point swapping
> > > > > > out
> > > > > > if
> > > > > > there
> > > > > > +	 * is no or low swap-space available. But the
> > > > > > accuracy
> > > > > > of
> > > > > > this
> > > > > > +	 * number also depends on shmem actually swapping
> > > > > > out
> > > > > > backed-up
> > > > > > +	 * shmem objects without too much buffering.
> > > > > > +	 */
> > > > > > +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_backup_shmem_create() - Create a shmem-based struct
> > > > > > backup.
> > > > > > + * @size: The maximum size (in bytes) to back up.
> > > > > > + *
> > > > > > + * Create a backup utilizing shmem objects.
> > > > > > + *
> > > > > > + * Return: A pointer to a struct ttm_backup on success,
> > > > > > + * an error pointer on error.
> > > > > > + */
> > > > > > +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> > > > > > +{
> > > > > > +	struct file *filp;
> > > > > > +
> > > > > > +	filp =3D shmem_file_setup("ttm shmem backup", size,
> > > > > > 0);
> > > > > > +
> > > > > > +	return ttm_file_to_backup(filp);
> > > > > > +}
> > > > > > diff --git a/include/drm/ttm/ttm_backup.h
> > > > > > b/include/drm/ttm/ttm_backup.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..20609da7e281
> > > > > > --- /dev/null
> > > > > > +++ b/include/drm/ttm/ttm_backup.h
> > > > > > @@ -0,0 +1,74 @@
> > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > +/*
> > > > > > + * Copyright =C2=A9 2024 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef _TTM_BACKUP_H_
> > > > > > +#define _TTM_BACKUP_H_
> > > > > > +
> > > > > > +#include <linux/mm_types.h>
> > > > > > +#include <linux/shmem_fs.h>
> > > > > > +
> > > > > > +struct ttm_backup;
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_backup_handle_to_page_ptr() - Convert handle to
> > > > > > struct
> > > > > > page
> > > > > > pointer
> > > > > > + * @handle: The handle to convert.
> > > > > > + *
> > > > > > + * Converts an opaque handle received from the
> > > > > > + * struct ttm_backoup_ops::backup_page() function to an
> > > > > > (invalid)
> > > > > > + * struct page pointer suitable for a struct page array.
> > > > > > + *
> > > > > > + * Return: An (invalid) struct page pointer.
> > > > > > + */
> > > > > > +static inline struct page *
> > > > > > +ttm_backup_handle_to_page_ptr(unsigned long handle)
> > > > > > +{
> > > > > > +	return (struct page *)(handle << 1 | 1);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_backup_page_ptr_is_handle() - Whether a struct page
> > > > > > pointer
> > > > > > is a handle
> > > > > > + * @page: The struct page pointer to check.
> > > > > > + *
> > > > > > + * Return: true if the struct page pointer is a handld
> > > > > > returned
> > > > > > from
> > > > > > + * ttm_backup_handle_to_page_ptr(). False otherwise.
> > > > > > + */
> > > > > > +static inline bool ttm_backup_page_ptr_is_handle(const
> > > > > > struct
> > > > > > page
> > > > > > *page)
> > > > > > +{
> > > > > > +	return (unsigned long)page & 1;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_backup_page_ptr_to_handle() - Convert a struct page
> > > > > > pointer
> > > > > > to a handle
> > > > > > + * @page: The struct page pointer to convert
> > > > > > + *
> > > > > > + * Return: The handle that was previously used in
> > > > > > + * ttm_backup_handle_to_page_ptr() to obtain a struct page
> > > > > > pointer, suitable
> > > > > > + * for use as argument in the struct ttm_backup_ops drop()
> > > > > > or
> > > > > > + * copy_backed_up_page() functions.
> > > > > > + */
> > > > > > +static inline unsigned long
> > > > > > +ttm_backup_page_ptr_to_handle(const struct page *page)
> > > > > > +{
> > > > > > +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> > > > > > +	return (unsigned long)page >> 1;
> > > > > > +}
> > > > > > +
> > > > > > +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t
> > > > > > handle);
> > > > > > +
> > > > > > +int ttm_backup_copy_page(struct ttm_backup *backup, struct
> > > > > > page
> > > > > > *dst,
> > > > > > +			 pgoff_t handle, bool intr);
> > > > > > +
> > > > > > +unsigned long
> > > > > > +ttm_backup_backup_page(struct ttm_backup *backup, struct
> > > > > > page
> > > > > > *page,
> > > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool writeback, pgoff_t=
 idx, gfp_t
> > > > > > page_gfp,
> > > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t alloc_gfp);
> > > > > > +
> > > > > > +void ttm_backup_fini(struct ttm_backup *backup);
> > > > > > +
> > > > > > +u64 ttm_backup_bytes_avail(void);
> > > > > > +
> > > > > > +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> > > > > > +
> > > > > > +#endif
>=20

