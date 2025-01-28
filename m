Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC981A20F91
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 18:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7039810E6E1;
	Tue, 28 Jan 2025 17:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKP5dMqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D7A10E125;
 Tue, 28 Jan 2025 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738085195; x=1769621195;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W9DBThybSjXLFIe6NQiW57zM+AX2YsC54bWGPkMR7e8=;
 b=aKP5dMqCekp5ndYpngiPpjXqtv1vV/Hd+IpvDlMoHf2rFxO9p6SHy9Wt
 gTWQvtZi1Ayq9OcX+QyEyTY6R/cVcHjzJFBjdWyhR7/UZBFS5fRGdO5nA
 4FyLOfYYN50Dd8bn7I0l3aTZx9XSglmaxv1ikS9LY/dNy697pwOmh6D+e
 AGsCSq9NsqCK67469OBWacurxJo0x//B7BWa6AnUXvUIe6YxFCjhs78TV
 VSIf5sTFJ/MnRbuX+BYIBsfVcHbTaclEaYfT2coXcIrDFRSyyCA9cVFZI
 W4YVfzUBZq9q+uVW31wWkcTvvSrwJJ+yqqZ+FcDrDHgs4gCufm56ZAdSW w==;
X-CSE-ConnectionGUID: 4gi3Z+FtSEGaDBZ6OU4OHA==
X-CSE-MsgGUID: WHPgnNdkR9aZmZbmz9MNdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42510656"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="42510656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 09:26:34 -0800
X-CSE-ConnectionGUID: uyMYEAtFT9K4ohjUhkO03g==
X-CSE-MsgGUID: vXqeuv9DS3uY9FSdf2V8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145998742"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.161])
 ([10.245.246.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 09:26:32 -0800
Message-ID: <e6e8571882bde6bf1887039ccc6aee989f395e95.camel@linux.intel.com>
Subject: Re: [PATCH v3 03/30] mm/migrate: Trylock device page in do_swap_page
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 28 Jan 2025 18:26:29 +0100
In-Reply-To: <20241217233348.3519726-4-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-4-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2024-12-17 at 15:33 -0800, Matthew Brost wrote:
> Avoid multiple CPU page faults to the same device page racing by
> trying
> to lock the page in do_swap_page before taking an extra reference to
> the
> page. This prevents scenarios where multiple CPU page faults each
> take
> an extra reference to a device page, which could abort migration in
> folio_migrate_mapping. With the device page being locked in
> do_swap_page, the migrate_vma_* functions need to be updated to avoid
> locking the fault_page argument.
>=20
> Prior to this change, a livelock scenario could occur in Xe's (Intel
> GPU
> DRM driver) SVM implementation if enough threads faulted the same
> device
> page.
>=20
> v3:
> =C2=A0- Put page after unlocking page (Alistair)
> =C2=A0- Warn on spliting a TPH which is fault page (Alistair)
> =C2=A0- Warn on dst page =3D=3D fault page (Alistair)
>=20
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0mm/memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++=
++++---
> =C2=A0mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++----------=
-
> --
> =C2=A02 files changed, 55 insertions(+), 22 deletions(-)
>=20
> diff --git a/mm/memory.c b/mm/memory.c
> index 75c2dfd04f72..ae8b11131dad 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4267,10 +4267,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> =C2=A0			 * Get a page reference while we know the
> page can't be
> =C2=A0			 * freed.
> =C2=A0			 */
> -			get_page(vmf->page);
> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			ret =3D vmf->page->pgmap->ops-
> >migrate_to_ram(vmf);
> -			put_page(vmf->page);
> +			if (trylock_page(vmf->page)) {
> +				get_page(vmf->page);

A couple of questions that I and Matt have been discussing around this
change and that we aren't completely cleare about. Perhaps somebody
else has some input:

1) The livelock occurs because we do a page reference check in
migrate_vma_check_page(). However judging from the documentation it
still uses a page refcount to determine whether it's pinned.=C2=A0

If we were to use folio_maybe_dma_pinned() which uses the pin-count
instead problem would be solved? However if there already is a refcount
that we don't know about, that holder could possibly upgrade it to a
pin-count. Does anybody know why not folio_maybe_dma_pinned() is used?



> +				pte_unmap_unlock(vmf->pte, vmf-
> >ptl);
> +				ret =3D vmf->page->pgmap->ops-
> >migrate_to_ram(vmf);


2) Second question is allocating memory under a page-lock. There
appears to be code avoiding that, arguing that page-locks may be taken
during reclaim. At least unless GFP_NOFS is used. Here we'd allow
GFP_KERNEL allocations under page-locks but can argue that it's only
device_private pages that are safe. Although some drivers do GFP_KERNEL
locks also under ordinary page-locks in migrate_to_ram(), probably
arguing that those pages are taken off LRU. Seems a bit fragile, is
there any known policy regarding this?

Thanks,
Thomas


> +				unlock_page(vmf->page);
> +				put_page(vmf->page);
> +			} else {
> +				pte_unmap_unlock(vmf->pte, vmf-
> >ptl);
> +			}
> =C2=A0		} else if (is_hwpoison_entry(entry)) {
> =C2=A0			ret =3D VM_FAULT_HWPOISON;
> =C2=A0		} else if (is_pte_marker_entry(entry)) {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 19960743f927..3470357d9bae 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =C2=A0				=C2=A0=C2=A0 struct mm_walk *walk)
> =C2=A0{
> =C2=A0	struct migrate_vma *migrate =3D walk->private;
> +	struct folio *fault_folio =3D migrate->fault_page ?
> +		page_folio(migrate->fault_page) : NULL;
> =C2=A0	struct vm_area_struct *vma =3D walk->vma;
> =C2=A0	struct mm_struct *mm =3D vma->vm_mm;
> =C2=A0	unsigned long addr =3D start, unmapped =3D 0;
> @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =C2=A0
> =C2=A0			folio_get(folio);
> =C2=A0			spin_unlock(ptl);
> +			/* FIXME support THP */
> +			if (WARN_ON_ONCE(fault_folio =3D=3D folio))
> +				return
> migrate_vma_collect_skip(start, end,
> +								walk
> );
> =C2=A0			if (unlikely(!folio_trylock(folio)))
> =C2=A0				return
> migrate_vma_collect_skip(start, end,
> =C2=A0								walk
> );
> =C2=A0			ret =3D split_folio(folio);
> -			folio_unlock(folio);
> +			if (fault_folio !=3D folio)
> +				folio_unlock(folio);
> =C2=A0			folio_put(folio);
> =C2=A0			if (ret)
> =C2=A0				return
> migrate_vma_collect_skip(start, end,
> @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =C2=A0		 * optimisation to avoid walking the rmap later with
> =C2=A0		 * try_to_migrate().
> =C2=A0		 */
> -		if (folio_trylock(folio)) {
> +		if (fault_folio =3D=3D folio || folio_trylock(folio)) {
> =C2=A0			bool anon_exclusive;
> =C2=A0			pte_t swp_pte;
> =C2=A0
> @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =C2=A0
> =C2=A0				if
> (folio_try_share_anon_rmap_pte(folio, page)) {
> =C2=A0					set_pte_at(mm, addr, ptep,
> pte);
> -					folio_unlock(folio);
> +					if (fault_folio !=3D folio)
> +						folio_unlock(folio);
> =C2=A0					folio_put(folio);
> =C2=A0					mpfn =3D 0;
> =C2=A0					goto next;
> @@ -363,6 +371,8 @@ static unsigned long
> migrate_device_unmap(unsigned long *src_pfns,
> =C2=A0					=C2=A0 unsigned long npages,
> =C2=A0					=C2=A0 struct page *fault_page)
> =C2=A0{
> +	struct folio *fault_folio =3D fault_page ?
> +		page_folio(fault_page) : NULL;
> =C2=A0	unsigned long i, restore =3D 0;
> =C2=A0	bool allow_drain =3D true;
> =C2=A0	unsigned long unmapped =3D 0;
> @@ -427,7 +437,8 @@ static unsigned long
> migrate_device_unmap(unsigned long *src_pfns,
> =C2=A0		remove_migration_ptes(folio, folio, 0);
> =C2=A0
> =C2=A0		src_pfns[i] =3D 0;
> -		folio_unlock(folio);
> +		if (fault_folio !=3D folio)
> +			folio_unlock(folio);
> =C2=A0		folio_put(folio);
> =C2=A0		restore--;
> =C2=A0	}
> @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> =C2=A0		return -EINVAL;
> =C2=A0	if (args->fault_page && !is_device_private_page(args-
> >fault_page))
> =C2=A0		return -EINVAL;
> +	if (args->fault_page && !PageLocked(args->fault_page))
> +		return -EINVAL;
> =C2=A0
> =C2=A0	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> =C2=A0	args->cpages =3D 0;
> @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma
> *migrate)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(migrate_vma_pages);
> =C2=A0
> -/*
> - * migrate_device_finalize() - complete page migration
> - * @src_pfns: src_pfns returned from migrate_device_range()
> - * @dst_pfns: array of pfns allocated by the driver to migrate
> memory to
> - * @npages: number of pages in the range
> - *
> - * Completes migration of the page by removing special migration
> entries.
> - * Drivers must ensure copying of page data is complete and visible
> to the CPU
> - * before calling this.
> - */
> -void migrate_device_finalize(unsigned long *src_pfns,
> -			unsigned long *dst_pfns, unsigned long
> npages)
> +static void __migrate_device_finalize(unsigned long *src_pfns,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *dst_pfns,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *fault_page)
> =C2=A0{
> +	struct folio *fault_folio =3D fault_page ?
> +		page_folio(fault_page) : NULL;
> =C2=A0	unsigned long i;
> =C2=A0
> =C2=A0	for (i =3D 0; i < npages; i++) {
> @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long
> *src_pfns,
> =C2=A0
> =C2=A0		if (!page) {
> =C2=A0			if (dst) {
> +				WARN_ON_ONCE(fault_folio =3D=3D dst);
> =C2=A0				folio_unlock(dst);
> =C2=A0				folio_put(dst);
> =C2=A0			}
> @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long
> *src_pfns,
> =C2=A0
> =C2=A0		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> =C2=A0			if (dst) {
> +				WARN_ON_ONCE(fault_folio =3D=3D dst);
> =C2=A0				folio_unlock(dst);
> =C2=A0				folio_put(dst);
> =C2=A0			}
> @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long
> *src_pfns,
> =C2=A0		}
> =C2=A0
> =C2=A0		remove_migration_ptes(src, dst, 0);
> -		folio_unlock(src);
> +		if (fault_folio !=3D src)
> +			folio_unlock(src);
> =C2=A0
> =C2=A0		if (folio_is_zone_device(src))
> =C2=A0			folio_put(src);
> @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long
> *src_pfns,
> =C2=A0			folio_putback_lru(src);
> =C2=A0
> =C2=A0		if (dst !=3D src) {
> +			WARN_ON_ONCE(fault_folio =3D=3D dst);
> =C2=A0			folio_unlock(dst);
> =C2=A0			if (folio_is_zone_device(dst))
> =C2=A0				folio_put(dst);
> @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long
> *src_pfns,
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> +
> +/*
> + * migrate_device_finalize() - complete page migration
> + * @src_pfns: src_pfns returned from migrate_device_range()
> + * @dst_pfns: array of pfns allocated by the driver to migrate
> memory to
> + * @npages: number of pages in the range
> + *
> + * Completes migration of the page by removing special migration
> entries.
> + * Drivers must ensure copying of page data is complete and visible
> to the CPU
> + * before calling this.
> + */
> +void migrate_device_finalize(unsigned long *src_pfns,
> +			unsigned long *dst_pfns, unsigned long
> npages)
> +{
> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages,
> NULL);
> +}
> =C2=A0EXPORT_SYMBOL(migrate_device_finalize);
> =C2=A0
> =C2=A0/**
> @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> =C2=A0 */
> =C2=A0void migrate_vma_finalize(struct migrate_vma *migrate)
> =C2=A0{
> -	migrate_device_finalize(migrate->src, migrate->dst, migrate-
> >npages);
> +	__migrate_device_finalize(migrate->src, migrate->dst,
> migrate->npages,
> +				=C2=A0 migrate->fault_page);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(migrate_vma_finalize);
> =C2=A0

