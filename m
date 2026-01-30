Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dvk3DPoMfWkxQAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:56:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D161BE475
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C47810E378;
	Fri, 30 Jan 2026 19:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEFvxzVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30E610E378;
 Fri, 30 Jan 2026 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769802997; x=1801338997;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=worejeHHsq1ziRWfoviB7RGwOnlqO7vcDzzLdGwlVXo=;
 b=eEFvxzVP5oCUpmlFwep7mf7IGCEVFJkTSXZ0kqJ592SDNnbVBc9wX+cF
 MXOzibCPs0PXMlMxE1D24JfsUwZRBNaeAn2E58QPtrOdgTgjp7g2UyBtk
 kHRopSJn+o4eG5vXUbJb1Iacvabc661vrtDu2RyWahI2luiBBNWFerqov
 ErOKvtnv08WAO7Cp54/Er4YQh1kzA4jaFwTqazWY1CUHm58sxg+btHOR/
 OtwgQeE0TdCyISOn8S2pkEk1JbRuxGF8BP/FBwCfCD4YxGIZHoEHhSP8o
 Sgte8FauKoEKhCjKz83l8safgBufZU0aQyfs5WS2G8nBJug+HBsuugDVi Q==;
X-CSE-ConnectionGUID: ehhou1ugSKO4uksqipqdVw==
X-CSE-MsgGUID: 91CjBeoARoqDgeDkW4M4wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70776050"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70776050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:56:37 -0800
X-CSE-ConnectionGUID: nM5QeG7ATpaADUZTOayMgQ==
X-CSE-MsgGUID: 9tIorAgaQku43phLFmJqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208735691"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.13])
 ([10.245.244.13])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:56:33 -0800
Message-ID: <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig	 <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky	 <leon@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Fri, 30 Jan 2026 20:56:31 +0100
In-Reply-To: <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 7D161BE475
X-Rspamd-Action: no action

On Fri, 2026-01-30 at 10:00 -0800, Andrew Morton wrote:
> On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
>=20
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
>=20
> This is pretty bad behavior from lru_add_drain_all().
>=20
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
> > Resolve this using a cond_resched() after each iteration in
> > hmm_range_fault(). Future code improvements might consider moving
> > the lru_add_drain_all() call in migrate_device_unmap() out of the
> > folio locked region.
> >=20
> > Also, hmm_range_fault() can be a very long-running function
> > so a cond_resched() at the end of each iteration can be
> > motivated even in the absence of an -EBUSY.
> >=20
> > Fixes: d28c2c9a4877 ("mm/hmm: make full use of walk_page_range()")
>=20
> Six years ago.

Yeah, although unlikely to have been hit due to our multi-device
migration code might have been the first instance of all those
prerequisites to be fulfilled.

>=20
> > --- a/mm/hmm.c
> > +++ b/mm/hmm.c
> > @@ -674,6 +674,13 @@ int hmm_range_fault(struct hmm_range *range)
> > =C2=A0			return -EBUSY;
> > =C2=A0		ret =3D walk_page_range(mm, hmm_vma_walk.last,
> > range->end,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &hmm_walk_ops,
> > &hmm_vma_walk);
> > +		/*
> > +		 * Conditionally reschedule to let other work
> > items get
> > +		 * a chance to unlock device-private pages whose
> > locks
> > +		 * we're spinning on.
> > +		 */
> > +		cond_resched();
> > +
> > =C2=A0		/*
> > =C2=A0		 * When -EBUSY is returned the loop restarts with
> > =C2=A0		 * hmm_vma_walk.last set to an address that has
> > not been stored
>=20
> If the process which is running hmm_range_fault() has
> SCHED_FIFO/SHCED_RR then cond_resched() doesn't work.=C2=A0 An explicit
> msleep() would be better?

Unfortunately hmm_range_fault() is typically called from a gpu
pagefault handler and it's crucial to get the gpu up and running again
as fast as possible.

Is there a way we could test for the cases where cond_resched() doesn't
work and in that case instead call sched_yield(), at least on -EBUSY
errors?

Thanks,
Thomas
