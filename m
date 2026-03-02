Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEefFSsCpmmzIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:33:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE91E3474
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF2810E5C3;
	Mon,  2 Mar 2026 21:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLZR/YEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0BE10E5C3;
 Mon,  2 Mar 2026 21:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772487209; x=1804023209;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LZxIosRq4lQs18rEB7ozia74wMHgUHayh9CXSZmnCV4=;
 b=HLZR/YErVyLvYDQ39EwlQMxd8gbyHRz0ITZm4YUs8SKFtwoY+vBYEg+M
 anse/57aszzyoZ7NmkDVXb0lFq0zdLf6HcIc8qhBUXnTsW6lscHrF2g29
 AOS7jHqE23qfKmlPrZoy+rZtbmgoXt5qBaHmJyKFQTbvkb5aheeQoV2PG
 o7dzI5cG4qIbj332FjiaR10Y/otrncAwqJhI5t8Mq4SmsKfQs0IsBN5hg
 skumHWmi5/NMqoiItspkK+kLB9JrJvizzXgFyilI5cWOUAiWTAAUrcJMi
 i4usQbdGQi01RFnBZV/qp08lVPS7oSYbu60F+uQdHtF8CMzHi5gRGyMid g==;
X-CSE-ConnectionGUID: BMCnpczoRHW3pWJ2LWRvlw==
X-CSE-MsgGUID: MEVzgUDjTkOe5nLFTAZdBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73212884"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73212884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:33:28 -0800
X-CSE-ConnectionGUID: hDgtmLUoS5WeedhE79/wEw==
X-CSE-MsgGUID: e4P3ROA6SbiU7uStVtFT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215370415"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.183])
 ([10.245.244.183])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:33:25 -0800
Message-ID: <3419e00ff2278a63bea5b175894646174dff2ec5.camel@linux.intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/userptr: Defer Waiting for TLB
 invalidation to the second pass if possible
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, Jason
 Gunthorpe	 <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter	 <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple	 <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Date: Mon, 02 Mar 2026 22:33:23 +0100
In-Reply-To: <aaXhp1EhwE275kla@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-5-thomas.hellstrom@linux.intel.com>
 <aaXhp1EhwE275kla@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
X-Rspamd-Queue-Id: B8DE91E3474
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, 2026-03-02 at 11:14 -0800, Matthew Brost wrote:
> On Mon, Mar 02, 2026 at 05:32:48PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Now that the two-pass notifier flow uses xe_vma_userptr_do_inval()
> > for
> > the fence-wait + TLB-invalidate work, extend it to support a
> > further
> > deferred TLB wait:
> >=20
> > - xe_vma_userptr_do_inval(): when the embedded finish handle is
> > free,
> > =C2=A0 submit the TLB invalidation asynchronously
> > (xe_vm_invalidate_vma_submit)
> > =C2=A0 and return &userptr->finish so the mmu_notifier core schedules a
> > third
> > =C2=A0 pass.=C2=A0 When the handle is occupied by a concurrent invalida=
tion,
> > fall
> > =C2=A0 back to the synchronous xe_vm_invalidate_vma() path.
> >=20
> > - xe_vma_userptr_complete_tlb_inval(): new helper called from
> > =C2=A0 invalidate_finish when tlb_inval_submitted is set.=C2=A0 Waits f=
or the
> > =C2=A0 previously submitted batch and unmaps the gpusvm pages.
> >=20
> > xe_vma_userptr_invalidate_finish() dispatches between the two
> > helpers
> > via tlb_inval_submitted, making the three possible flows explicit:
> >=20
> > =C2=A0 pass1 (fences pending)=C2=A0 -> invalidate_finish -> do_inval (s=
ync
> > TLB)
> > =C2=A0 pass1 (fences done)=C2=A0=C2=A0=C2=A0=C2=A0 -> do_inval -> inval=
idate_finish
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -> complete_tlb_inval (deferred TLB)
> > =C2=A0 pass1 (finish occupied) -> do_inval (sync TLB, inline)
> >=20
> > In multi-GPU scenarios this allows TLB flushes to be submitted on
> > all
> > GPUs in one pass before any of them are waited on.
> >=20
> > Also adds xe_vm_invalidate_vma_submit() which submits the TLB range
> > invalidation without blocking, populating a xe_tlb_inval_batch that
> > the caller waits on separately.
> >=20
>=20
> As suggested in patch #2, maybe squash this into patch #2 as some of
> patch #2 is immediately tweaked / rewritten here.=20
>=20
> A couple nits.
>=20
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_userptr.c | 60 +++++++++++++++++++++++++++-=
-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_userptr.h | 18 ++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 38 +++=
+++++++++++++-----
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 ++
> > =C2=A04 files changed, 99 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > b/drivers/gpu/drm/xe/xe_userptr.c
> > index 440b0a79d16f..a62b796afb93 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > @@ -8,6 +8,7 @@
> > =C2=A0
> > =C2=A0#include <linux/mm.h>
> > =C2=A0
> > +#include "xe_tlb_inval.h"
> > =C2=A0#include "xe_trace_bo.h"
> > =C2=A0
> > =C2=A0/**
> > @@ -73,8 +74,8 @@ int xe_vma_userptr_pin_pages(struct
> > xe_userptr_vma *uvma)
> > =C2=A0				=C2=A0=C2=A0=C2=A0 &ctx);
> > =C2=A0}
> > =C2=A0
> > -static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct
> > xe_userptr_vma *uvma,
> > -				=C2=A0=C2=A0=C2=A0 bool is_deferred)
> > +static struct mmu_interval_notifier_finish *
> > +xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma
> > *uvma, bool is_deferred)
> > =C2=A0{
> > =C2=A0	struct xe_userptr *userptr =3D &uvma->userptr;
> > =C2=A0	struct xe_vma *vma =3D &uvma->vma;
> > @@ -84,12 +85,23 @@ static void xe_vma_userptr_do_inval(struct
> > xe_vm *vm, struct xe_userptr_vma *uvm
> > =C2=A0	};
> > =C2=A0	long err;
> > =C2=A0
> > -	err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> > -				=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> > +	err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> > DMA_RESV_USAGE_BOOKKEEP,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
>=20
> Unrelated.

Right, will fix.

>=20
> > =C2=A0	XE_WARN_ON(err <=3D 0);
> > =C2=A0
> > =C2=A0	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > +		if (!userptr->finish_inuse) {
>=20
> Since this is state machiney - should we have asserts on state? That
> typically the approach I take when I write stae machiney code. Self
> documenting plus immediatelt catches misuse.
>=20
> So here an example would be:
>=20
> xe_assert(.., !userptr->tlb_inval_submitted);

Sure. Can take a look at that to see how it turns out.


> =C2=A0
> > +			/*
> > +			 * Defer the TLB wait to an extra pass so
> > the caller
> > +			 * can pipeline TLB flushes across GPUs
> > before waiting
> > +			 * on any of them.
> > +			 */
> > +			userptr->finish_inuse =3D true;
> > +			userptr->tlb_inval_submitted =3D true;
> > +			err =3D xe_vm_invalidate_vma_submit(vma,
> > &userptr->inval_batch);
> > +			XE_WARN_ON(err);
> > +			return &userptr->finish;
> > +		}
> > =C2=A0		err =3D xe_vm_invalidate_vma(vma);
> > =C2=A0		XE_WARN_ON(err);
> > =C2=A0	}
> > @@ -98,6 +110,24 @@ static void xe_vma_userptr_do_inval(struct
> > xe_vm *vm, struct xe_userptr_vma *uvm
> > =C2=A0		userptr->finish_inuse =3D false;
> > =C2=A0	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma-
> > >userptr.pages,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_size(vma) >> PAGE_=
SHIFT,
> > &ctx);
> > +	return NULL;
> > +}
> > +
> > +static void
> > +xe_vma_userptr_complete_tlb_inval(struct xe_vm *vm, struct
> > xe_userptr_vma *uvma)
> > +{
> > +	struct xe_userptr *userptr =3D &uvma->userptr;
> > +	struct xe_vma *vma =3D &uvma->vma;
> > +	struct drm_gpusvm_ctx ctx =3D {
> > +		.in_notifier =3D true,
> > +		.read_only =3D xe_vma_read_only(vma),
> > +	};
> > +
>=20
> xe_svm_assert_in_notifier();

See previous comment on this.

>=20
> State machine asserts could be:
>=20
> xe_assert(..., userptr->tlb_inval_submitted);
> xe_assert(..., userptr->finish_inuse);

Will take a look at this as well.

>=20
> > +	xe_tlb_inval_batch_wait(&userptr->inval_batch);
> > +	userptr->tlb_inval_submitted =3D false;
> > +	userptr->finish_inuse =3D false;
> > +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma-
> > >userptr.pages,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_size(vma) >> PAGE_SHIFT=
,
> > &ctx);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct mmu_interval_notifier_finish *
> > @@ -141,13 +171,11 @@ xe_vma_userptr_invalidate_pass1(struct xe_vm
> > *vm, struct xe_userptr_vma *uvma)
> > =C2=A0	 * If it's already in use, or all fences are already
> > signaled,
> > =C2=A0	 * proceed directly to invalidation without deferring.
> > =C2=A0	 */
> > -	if (signaled || userptr->finish_inuse) {
> > -		xe_vma_userptr_do_inval(vm, uvma, false);
> > -		return NULL;
> > -	}
> > +	if (signaled || userptr->finish_inuse)
> > +		return xe_vma_userptr_do_inval(vm, uvma, false);
> > =C2=A0
> > +	/* Defer: the notifier core will call invalidate_finish
> > once done. */
> > =C2=A0	userptr->finish_inuse =3D true;
> > -
>=20
> Unrelated.

Will fix.

>=20
> > =C2=A0	return &userptr->finish;
> > =C2=A0}
> > =C2=A0
> > @@ -193,7 +221,15 @@ static void
> > xe_vma_userptr_invalidate_finish(struct
> > mmu_interval_notifier_finish
> > =C2=A0		xe_vma_start(vma), xe_vma_size(vma));
> > =C2=A0
> > =C2=A0	down_write(&vm->svm.gpusvm.notifier_lock);
> > -	xe_vma_userptr_do_inval(vm, uvma, true);
> > +	/*
> > +	 * If a TLB invalidation was previously submitted
> > (deferred from the
> > +	 * synchronous pass1 fallback), wait for it and unmap
> > pages.
> > +	 * Otherwise, fences have now completed: invalidate the
> > TLB and unmap.
> > +	 */
> > +	if (uvma->userptr.tlb_inval_submitted)
> > +		xe_vma_userptr_complete_tlb_inval(vm, uvma);
> > +	else
> > +		xe_vma_userptr_do_inval(vm, uvma, true);
> > =C2=A0	up_write(&vm->svm.gpusvm.notifier_lock);
> > =C2=A0	trace_xe_vma_userptr_invalidate_complete(vma);
> > =C2=A0}
> > @@ -231,7 +267,9 @@ void xe_vma_userptr_force_invalidate(struct
> > xe_userptr_vma *uvma)
> > =C2=A0
> > =C2=A0	finish =3D xe_vma_userptr_invalidate_pass1(vm, uvma);
> > =C2=A0	if (finish)
> > -		xe_vma_userptr_do_inval(vm, uvma, true);
> > +		finish =3D xe_vma_userptr_do_inval(vm, uvma, true);
> > +	if (finish)
> > +		xe_vma_userptr_complete_tlb_inval(vm, uvma);
> > =C2=A0}
> > =C2=A0#endif
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.h
> > b/drivers/gpu/drm/xe/xe_userptr.h
> > index 4f42db61fd62..7477009651c2 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.h
> > +++ b/drivers/gpu/drm/xe/xe_userptr.h
> > @@ -14,6 +14,8 @@
> > =C2=A0
> > =C2=A0#include <drm/drm_gpusvm.h>
> > =C2=A0
> > +#include "xe_tlb_inval_types.h"
> > +
> > =C2=A0struct xe_vm;
> > =C2=A0struct xe_vma;
> > =C2=A0struct xe_userptr_vma;
> > @@ -63,6 +65,15 @@ struct xe_userptr {
> > =C2=A0	 * Protected by @vm::svm.gpusvm.notifier_lock.
> > =C2=A0	 */
> > =C2=A0	struct mmu_interval_notifier_finish finish;
> > +
> > +	/**
> > +	 * @inval_batch: TLB invalidation batch for deferred
> > completion.
> > +	 * Stores an in-flight TLB invalidation submitted during a
> > two-pass
> > +	 * notifier so the wait can be deferred to a subsequent
> > pass, allowing
> > +	 * multiple GPUs to be signalled before any of them are
> > waited on.
> > +	 * Protected by @vm::svm.gpusvm.notifier_lock.
>=20
> In write mode?

Yeah, This one and the one below will look a bit more complicated if we
want to keep the invalidation injection. Will update.

>=20
> > +	 */
> > +	struct xe_tlb_inval_batch inval_batch;
> > =C2=A0	/**
> > =C2=A0	 * @finish_inuse: Whether @finish is currently in use by
> > an in-progress
> > =C2=A0	 * two-pass invalidation.
> > @@ -70,6 +81,13 @@ struct xe_userptr {
> > =C2=A0	 */
> > =C2=A0	bool finish_inuse;
> > =C2=A0
> > +	/**
> > +	 * @tlb_inval_submitted: Whether a TLB invalidation has
> > been submitted
> > +	 * via @inval_batch and is pending completion.=C2=A0 When set,
> > the next pass
> > +	 * must call xe_tlb_inval_batch_wait() before reusing
> > @inval_batch.
> > +	 * Protected by @vm::svm.gpusvm.notifier_lock.
>=20
> In write mode?
>=20
> Matt

Thanks,
Thomas


>=20
> > +	 */
> > +	bool tlb_inval_submitted;
> > =C2=A0	/**
> > =C2=A0	 * @initial_bind: user pointer has been bound at least
> > once.
> > =C2=A0	 * write: vm->svm.gpusvm.notifier_lock in read mode and
> > vm->resv held.
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 7f29d2b2972d..fdad9329dfb4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3967,20 +3967,23 @@ void xe_vm_unlock(struct xe_vm *vm)
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > - * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without
> > a lock
> > + * xe_vm_invalidate_vma_submit - Submit a job to invalidate GPU
> > mappings for
> > + * VMA.
> > =C2=A0 * @vma: VMA to invalidate
> > + * @batch: TLB invalidation batch to populate; caller must later
> > call
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_tlb_inval_batch_=
wait() on it to wait for completion
> > =C2=A0 *
> > =C2=A0 * Walks a list of page tables leaves which it memset the entries
> > owned by this
> > - * VMA to zero, invalidates the TLBs, and block until TLBs
> > invalidation is
> > - * complete.
> > + * VMA to zero, invalidates the TLBs, but doesn't block waiting
> > for TLB flush
> > + * to complete, but instead populates @batch which can be waited
> > on using
> > + * xe_tlb_inval_batch_wait().
> > =C2=A0 *
> > =C2=A0 * Returns 0 for success, negative error code otherwise.
> > =C2=A0 */
> > -int xe_vm_invalidate_vma(struct xe_vma *vma)
> > +int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct
> > xe_tlb_inval_batch *batch)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D xe_vma_vm(vma)->xe;
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > -	struct xe_tlb_inval_batch _batch;
> > =C2=A0	struct xe_tile *tile;
> > =C2=A0	u8 tile_mask =3D 0;
> > =C2=A0	int ret =3D 0;
> > @@ -4023,14 +4026,33 @@ int xe_vm_invalidate_vma(struct xe_vma
> > *vma)
> > =C2=A0
> > =C2=A0	ret =3D xe_tlb_inval_range_tilemask_submit(xe,
> > xe_vma_vm(vma)->usm.asid,
> > =C2=A0					=09
> > xe_vma_start(vma), xe_vma_end(vma),
> > -						 tile_mask,
> > &_batch);
> > +						 tile_mask,
> > batch);
> > =C2=A0
> > =C2=A0	/* WRITE_ONCE pairs with READ_ONCE in
> > xe_vm_has_valid_gpu_mapping() */
> > =C2=A0	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without
> > a lock
> > + * @vma: VMA to invalidate
> > + *
> > + * Walks a list of page tables leaves which it memset the entries
> > owned by this
> > + * VMA to zero, invalidates the TLBs, and block until TLBs
> > invalidation is
> > + * complete.
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> > +int xe_vm_invalidate_vma(struct xe_vma *vma)
> > +{
> > +	struct xe_tlb_inval_batch batch;
> > +	int ret;
> > =C2=A0
> > -	if (!ret)
> > -		xe_tlb_inval_batch_wait(&_batch);
> > +	ret =3D xe_vm_invalidate_vma_submit(vma, &batch);
> > +	if (ret)
> > +		return ret;
> > =C2=A0
> > +	xe_tlb_inval_batch_wait(&batch);
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index 62f4b6fec0bc..0bc7ed23eeae 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -242,6 +242,8 @@ struct dma_fence *xe_vm_range_unbind(struct
> > xe_vm *vm,
> > =C2=A0
> > =C2=A0int xe_vm_invalidate_vma(struct xe_vma *vma);
> > =C2=A0
> > +int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct
> > xe_tlb_inval_batch *batch);
> > +
> > =C2=A0int xe_vm_validate_protected(struct xe_vm *vm);
> > =C2=A0
> > =C2=A0static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> > --=20
> > 2.53.0
> >=20
