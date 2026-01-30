Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCQLH7XxfGndPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:00:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18BBD906
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B6110EA39;
	Fri, 30 Jan 2026 18:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gB6I7Wum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83DA10EA39;
 Fri, 30 Jan 2026 18:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA34C6001A;
 Fri, 30 Jan 2026 18:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30691C4CEF7;
 Fri, 30 Jan 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1769796014;
 bh=AFVyapZz7+rnLVcwl8jFcNdohlBEAdutFNruQ1aqrP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gB6I7WumOiVus7/WSV+qgJ8RC4GHJIMv0c9/bfPssW0cj2v2O8c2Vr1yOFpxpaIfL
 606t/2u3ouWNJ6bwa1u+fRQUs4MTsPyVqGrH/GnFVGUoyC9tpvjpwO2XIha24hfAd9
 UozEq6LX5GI/tCl7U2fq5VpTpS4xqDqTcHxIavIk=
Date: Fri, 30 Jan 2026 10:00:13 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, linux-mm@kvack.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
In-Reply-To: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: CB18BBD906
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellstr=F6m <thomas.hellstrom@lin=
ux.intel.com> wrote:

> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> trying to acquire the lock of a device-private folio for migration,
> to ram, the function will spin until it succeeds grabbing the lock.
>=20
> However, if the process holding the lock is depending on a work
> item to be completed, which is scheduled on the same CPU as the
> spinning hmm_range_fault(), that work item might be starved and
> we end up in a livelock / starvation situation which is never
> resolved.
>=20
> This can happen, for example if the process holding the
> device-private folio lock is stuck in
>    migrate_device_unmap()->lru_add_drain_all()
> The lru_add_drain_all() function requires a short work-item
> to be run on all online cpus to complete.

This is pretty bad behavior from lru_add_drain_all().

> A prerequisite for this to happen is:
> a) Both zone device and system memory folios are considered in
>    migrate_device_unmap(), so that there is a reason to call
>    lru_add_drain_all() for a system memory folio while a
>    folio lock is held on a zone device folio.
> b) The zone device folio has an initial mapcount > 1 which causes
>    at least one migration PTE entry insertion to be deferred to
>    try_to_migrate(), which can happen after the call to
>    lru_add_drain_all().
> c) No or voluntary only preemption.
>=20
> This all seems pretty unlikely to happen, but indeed is hit by
> the "xe_exec_system_allocator" igt test.
>=20
> Resolve this using a cond_resched() after each iteration in
> hmm_range_fault(). Future code improvements might consider moving
> the lru_add_drain_all() call in migrate_device_unmap() out of the
> folio locked region.
>=20
> Also, hmm_range_fault() can be a very long-running function
> so a cond_resched() at the end of each iteration can be
> motivated even in the absence of an -EBUSY.
>=20
> Fixes: d28c2c9a4877 ("mm/hmm: make full use of walk_page_range()")

Six years ago.

> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -674,6 +674,13 @@ int hmm_range_fault(struct hmm_range *range)
>  			return -EBUSY;
>  		ret =3D walk_page_range(mm, hmm_vma_walk.last, range->end,
>  				      &hmm_walk_ops, &hmm_vma_walk);
> +		/*
> +		 * Conditionally reschedule to let other work items get
> +		 * a chance to unlock device-private pages whose locks
> +		 * we're spinning on.
> +		 */
> +		cond_resched();
> +
>  		/*
>  		 * When -EBUSY is returned the loop restarts with
>  		 * hmm_vma_walk.last set to an address that has not been stored

If the process which is running hmm_range_fault() has
SCHED_FIFO/SHCED_RR then cond_resched() doesn't work.  An explicit
msleep() would be better?
