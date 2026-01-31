Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP5xCzv8fWkmUwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 13:57:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73903C1DAC
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 13:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C286110E2BD;
	Sat, 31 Jan 2026 12:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7wMLnIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE06B10E1D1;
 Sat, 31 Jan 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769864246; x=1801400246;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sxsW5wz+50vShImzs/QoY5VYxc3tyuMg2yHW1M/0i+g=;
 b=D7wMLnIJnQIGQEw6NubW7YdbqgvE5A9pGTz/QR0gdTDnrhiBG9CGsYu5
 5Lp5D2m3PZ4LbV1pRrCIFqxtFE/ztwXcoJP1L0NSfbRDX7yeBLkTpbbfA
 QF2VgPKPLlrudCAT/vuhiZOIGqy4lL9BQZvrwATQe0ePheR0AvdBvM4Ab
 QWuvCZtgluSx9Z9dO3Ity2SWngENthasoPo/VyqNxJJmiE0zIAvu3MCHQ
 atvVxXFAblTuWFWyK0jAH6nsA6OhCxx5760RivP42vkViS6t0uLZu0QPA
 9MXigy4GzsDivtAiigYWgYnlD3yKyuANHO95fB/RTj5uEfVtfBqNIm8lc g==;
X-CSE-ConnectionGUID: +hSGHPxyRyuOlwCGpIivpg==
X-CSE-MsgGUID: XifKw+BwQhmbqrl7JI25KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74957099"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; d="scan'208";a="74957099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2026 04:57:26 -0800
X-CSE-ConnectionGUID: FydMJpeWQu2IH0N24iDwfg==
X-CSE-MsgGUID: fZSFSQayTragXDLZituEzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; d="scan'208";a="239787386"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.104])
 ([10.245.244.104])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2026 04:57:23 -0800
Message-ID: <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: John Hubbard <jhubbard@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig	 <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky	 <leon@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Sat, 31 Jan 2026 13:57:21 +0100
In-Reply-To: <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 73903C1DAC
X-Rspamd-Action: no action

On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> On 1/30/26 10:00 AM, Andrew Morton wrote:
> > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> ...
> > > This can happen, for example if the process holding the
> > > device-private folio lock is stuck in
> > > =C2=A0=C2=A0 migrate_device_unmap()->lru_add_drain_all()
> > > The lru_add_drain_all() function requires a short work-item
> > > to be run on all online cpus to complete.
> >=20
> > This is pretty bad behavior from lru_add_drain_all().
>=20
> Yes. And also, by code inspection, it seems like other folio_batch
> items (I was going to say pagevecs, heh) can leak in after calling
> lru_add_drain_all(), making things even worse.
>=20
> Maybe we really should be calling lru_cache_disable/enable()
> pairs for migration, even though it looks heavier weight.
>=20
> This diff would address both points, and maybe fix Matthew's issue,
> although I haven't done much real testing on it other than a quick
> run of run_vmtests.sh:

It looks like lru_cache_disable() is using synchronize_rcu_expedited(),
which whould be a huge performance killer?

From the migrate code it looks like it's calling lru_add_drain_all()
once only, because migration is still best effort, so it's accepting
failures if someone adds pages to the per-cpu lru_add structures,
rather than wanting to take the heavy performance loss of
lru_cache_disable().

The problem at hand is also solved if we move the lru_add_drain_all()
out of the page-locked region in migrate_vma_setup(), like if we hit a
system folio not on the LRU, we'd unlock all folios, call
lru_add_drain_all() and retry from start.

But the root cause, even though lru_add_drain_all() is bad-behaving, is
IMHO the trylock spin in hmm_range_fault(). This is relatively recently
introduced to avoid another livelock problem, but there were other
fixes associated with that as well, so might not be strictly necessary.

IIRC he original non-trylocking code in do_swap_page() first took a
reference to the folio, released the page-table lock and then performed
a sleeping folio lock. Problem was that if the folio was already locked
for migration, that additional folio refcount would block migration
(which might not be a big problem considering do_swap_page() might want
to migrate to system ram anyway). @Matt Brost what's your take on this?

I'm also not sure a folio refcount should block migration after the
introduction of pinned (like in pin_user_pages) pages. Rather perhaps a
folio pin-count should block migration and in that case do_swap_page()
can definitely do a sleeping folio lock and the problem is gone.

But it looks like an AR for us to try to check how bad
lru_cache_disable() really is. And perhaps compare with an
unconditional lru_add_drain_all() at migration start.

Does anybody know who would be able to tell whether a page refcount
still should block migration (like today) or whether that could
actually be relaxed to a page pincount?

Thanks,
Thomas

>=20
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..3c55a766dd33 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -570,7 +570,6 @@ static unsigned long
> migrate_device_unmap(unsigned long *src_pfns,
> =C2=A0	struct folio *fault_folio =3D fault_page ?
> =C2=A0		page_folio(fault_page) : NULL;
> =C2=A0	unsigned long i, restore =3D 0;
> -	bool allow_drain =3D true;
> =C2=A0	unsigned long unmapped =3D 0;
> =C2=A0
> =C2=A0	lru_add_drain();
> @@ -595,12 +594,6 @@ static unsigned long
> migrate_device_unmap(unsigned long *src_pfns,
> =C2=A0
> =C2=A0		/* ZONE_DEVICE folios are not on LRU */
> =C2=A0		if (!folio_is_zone_device(folio)) {
> -			if (!folio_test_lru(folio) && allow_drain) {
> -				/* Drain CPU's lru cache */
> -				lru_add_drain_all();
> -				allow_drain =3D false;
> -			}
> -
> =C2=A0			if (!folio_isolate_lru(folio)) {
> =C2=A0				src_pfns[i] &=3D ~MIGRATE_PFN_MIGRATE;
> =C2=A0				restore++;
> @@ -759,11 +752,15 @@ int migrate_vma_setup(struct migrate_vma *args)
> =C2=A0	args->cpages =3D 0;
> =C2=A0	args->npages =3D 0;
> =C2=A0
> +	lru_cache_disable();
> +
> =C2=A0	migrate_vma_collect(args);
> =C2=A0
> =C2=A0	if (args->cpages)
> =C2=A0		migrate_vma_unmap(args);
> =C2=A0
> +	lru_cache_enable();
> +
> =C2=A0	/*
> =C2=A0	 * At this point pages are locked and unmapped, and thus
> they have
> =C2=A0	 * stable content and can safely be copied to destination
> memory that
> @@ -1395,6 +1392,8 @@ int migrate_device_range(unsigned long
> *src_pfns, unsigned long start,
> =C2=A0{
> =C2=A0	unsigned long i, j, pfn;
> =C2=A0
> +	lru_cache_disable();
> +
> =C2=A0	for (pfn =3D start, i =3D 0; i < npages; pfn++, i++) {
> =C2=A0		struct page *page =3D pfn_to_page(pfn);
> =C2=A0		struct folio *folio =3D page_folio(page);
> @@ -1413,6 +1412,8 @@ int migrate_device_range(unsigned long
> *src_pfns, unsigned long start,
> =C2=A0
> =C2=A0	migrate_device_unmap(src_pfns, npages, NULL);
> =C2=A0
> +	lru_cache_enable();
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(migrate_device_range);
> @@ -1429,6 +1430,8 @@ int migrate_device_pfns(unsigned long
> *src_pfns, unsigned long npages)
> =C2=A0{
> =C2=A0	unsigned long i, j;
> =C2=A0
> +	lru_cache_disable();
> +
> =C2=A0	for (i =3D 0; i < npages; i++) {
> =C2=A0		struct page *page =3D pfn_to_page(src_pfns[i]);
> =C2=A0		struct folio *folio =3D page_folio(page);
> @@ -1446,6 +1449,8 @@ int migrate_device_pfns(unsigned long
> *src_pfns, unsigned long npages)
> =C2=A0
> =C2=A0	migrate_device_unmap(src_pfns, npages, NULL);
> =C2=A0
> +	lru_cache_enable();
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(migrate_device_pfns);
>=20
>=20
>=20
>=20
> thanks,
