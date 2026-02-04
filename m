Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDY9EN8xg2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:47:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E1E5492
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC30F10E607;
	Wed,  4 Feb 2026 11:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBS6wKU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC5110E121;
 Wed,  4 Feb 2026 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770205658; x=1801741658;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o1SGsfKC7zfKdDVi2+WmhVppxLa0zTkZJFytPRw037o=;
 b=ZBS6wKU00G1CaJv7jy9YDRLBqKct3edcln9YmJV9TDhWPPvUt951FYfr
 mT4R1mm37aE8dO57ZgvdjUeiUouxyr60pKA/PxD4e6+YfqDpY1213OpVK
 Ah2RewDxLpkI+ocxBTBwMEVAs+eRGE4rUmew42/ijy+lx5AfZtBoD0LYN
 TUEYjLMJM62kH0u2bEGaqqZ3A3pLro6/r1jyoiyRMEIFZdlbR6jarEF9N
 k28BXxBor6MtCHlwul3wngdf4oz2RZWf68d4sYKXI3ATI7xJXgNbo8t7A
 c1rx5O32nIBiMyNgt1XoVzCQBvvJFMIEokr8cl5sSek317BXZPTd/Z6pm A==;
X-CSE-ConnectionGUID: mEAuP7oKTWi/iJHkICIH4Q==
X-CSE-MsgGUID: +/5PFLU3Tk+r3ohT0pRIyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71286169"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71286169"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 03:47:38 -0800
X-CSE-ConnectionGUID: qwxQ1Z8ASFOay7+tkmDJpg==
X-CSE-MsgGUID: MKlMS3YCSnq+MQ2H2Rrz8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214322885"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.210])
 ([10.245.245.210])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 03:47:34 -0800
Message-ID: <7d81f9344210986c112d4586608193765e4ca862.camel@linux.intel.com>
Subject: Re: [PATCH v3] mm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig	 <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky	 <leon@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Matthew Brost	
 <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date: Wed, 04 Feb 2026 12:47:32 +0100
In-Reply-To: <2mts4ijet6ezaqmqgzfljiptv6dgqduzhn6sfxvmec257j4beg@tuj322lx3j5y>
References: <20260203143434.16349-1-thomas.hellstrom@linux.intel.com>
 <2mts4ijet6ezaqmqgzfljiptv6dgqduzhn6sfxvmec257j4beg@tuj322lx3j5y>
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
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,kvack.org:email,linux.intel.com:mid,ziepe.ca:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 752E1E5492
X-Rspamd-Action: no action

On Wed, 2026-02-04 at 21:59 +1100, Alistair Popple wrote:
> On 2026-02-04 at 01:34 +1100, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote...
> > If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> > trying to acquire the lock of a device-private folio for migration,
> > to ram, the function will spin until it succeeds grabbing the lock.
> >=20
> > However, if the process holding the lock is depending on a work
> > item to be completed, which is scheduled on the same CPU as the
> > spinning hmm_range_fault(), that work item might be starved and
> > we end up in a livelock / starvation situation which is never
> > resolved.
> >=20
> > This can happen, for example if the process holding the
> > device-private folio lock is stuck in
> > =C2=A0=C2=A0 migrate_device_unmap()->lru_add_drain_all()
> > The lru_add_drain_all() function requires a short work-item
> > to be run on all online cpus to complete.
> >=20
> > A prerequisite for this to happen is:
> > a) Both zone device and system memory folios are considered in
> > =C2=A0=C2=A0 migrate_device_unmap(), so that there is a reason to call
> > =C2=A0=C2=A0 lru_add_drain_all() for a system memory folio while a
> > =C2=A0=C2=A0 folio lock is held on a zone device folio.
> > b) The zone device folio has an initial mapcount > 1 which causes
> > =C2=A0=C2=A0 at least one migration PTE entry insertion to be deferred =
to
> > =C2=A0=C2=A0 try_to_migrate(), which can happen after the call to
> > =C2=A0=C2=A0 lru_add_drain_all().
> > c) No or voluntary only preemption.
> >=20
> > This all seems pretty unlikely to happen, but indeed is hit by
> > the "xe_exec_system_allocator" igt test.
> >=20
> > Resolve this by waiting for the folio to be unlocked if the
> > folio_trylock() fails in the do_swap_page() function.
> >=20
> > Future code improvements might consider moving
> > the lru_add_drain_all() call in migrate_device_unmap() to be
> > called *after* all pages have migration entries inserted.
> > That would eliminate also b) above.
> >=20
> > v2:
> > - Instead of a cond_resched() in the hmm_range_fault() function,
> > =C2=A0 eliminate the problem by waiting for the folio to be unlocked
> > =C2=A0 in do_swap_page() (Alistair Popple, Andrew Morton)
> > v3:
> > - Add a stub migration_entry_wait_on_locked() for the
> > =C2=A0 !CONFIG_MIGRATION case. (Kernel Test Robot)
> >=20
> > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in
> > do_swap_page")
> > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Jason Gunthorpe <jgg@mellanox.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: linux-mm@kvack.org
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v6.15+
> > ---
> > =C2=A0include/linux/migrate.h | 6 ++++++
> > =C2=A0mm/memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3 ++-
> > =C2=A02 files changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index 26ca00c325d9..800ec174b601 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -97,6 +97,12 @@ static inline int set_movable_ops(const struct
> > movable_operations *ops, enum pag
> > =C2=A0	return -ENOSYS;
> > =C2=A0}
> > =C2=A0
> > +static inline void migration_entry_wait_on_locked(softleaf_t
> > entry, spinlock_t *ptl)
> > +	__releases(ptl)
> > +{
> > +	spin_unlock(ptl);
> > +}
> > +
> > =C2=A0#endif /* CONFIG_MIGRATION */
> > =C2=A0
> > =C2=A0#ifdef CONFIG_NUMA_BALANCING
> > diff --git a/mm/memory.c b/mm/memory.c
> > index da360a6eb8a4..ed20da5570d5 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > =C2=A0				unlock_page(vmf->page);
> > =C2=A0				put_page(vmf->page);
> > =C2=A0			} else {
> > -				pte_unmap_unlock(vmf->pte, vmf-
> > >ptl);
> > +				pte_unmap(vmf->pte);
> > +				migration_entry_wait_on_locked(ent
> > ry, vmf->ptl);
>=20
> Code wise this looks fine to me, although it's confusing to see
> migration_entry_wait_on_locked() being called on a non-migration
> entry and
> ideally this would be renamed to something like
> softleaf_entry_wait_on_locked().
>=20
> Regardless though the documentation for
> migration_entry_wait_on_locked() needs
> updating to justify why calling this on device-private entries is
> valid (because
> it's also just waiting for the page to be unlocked). Along with some
> equivalent
> justification for how we know there is a reference on the device-
> private page:
>=20
> 	 * If a migration entry exists for the page the migration
> path must hold
> 	 * a valid reference to the page, and it must take the ptl
> to remove the
> 	 * migration entry. So the page is valid until the ptl is
> dropped.
> =C2=A0
> Which is basically just the page is mapped in the page table,
> therefore it must
> have a reference taken for the mapping and the mapping can't be
> removed while we
> hold the PTL.
>=20
> Thanks.
>=20
> =C2=A0- Alistair

Thanks for reviewing. Let me respin this for a v4 addressing the above.

/Thomas



>=20
> > =C2=A0			}
> > =C2=A0		} else if (softleaf_is_hwpoison(entry)) {
> > =C2=A0			ret =3D VM_FAULT_HWPOISON;
> > --=20
> > 2.52.0
> >=20
