Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHxHE5H/pWl5IwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:22:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216EC1E2957
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B925B10E5D3;
	Mon,  2 Mar 2026 21:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jd88YyJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C1810E5D2;
 Mon,  2 Mar 2026 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772486539; x=1804022539;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=f/e5Tehw6eA5fElB8GaO/rxQQYRpEl9y+pGXhsCpQ1g=;
 b=jd88YyJzWcooP4Zb/hoMr20QstTbT1zFERbdXOYdyqimWlOsW7hwjBWO
 DCs11ZMx4X85i4s6erRI4wkyjPGip6LCOF9LjXEJrxWS1kEM1r2CRJ86q
 DxwnXdPeqxpOZLfz6mbPBC3b0J7oxJ0hep8D028r4gf0cfi3rBQFHd8Ln
 UNYgeGFQROliM29jY3fPok+VrKU0rq7yQ8xyrCH9SXir4khSuOP3lfGHI
 YRtxSMu4fi4QraSl+a79LfkQd5vSimEjpsqsL0XW3mF2T1y5/ZrN5pfEB
 +s8YINciJ4+QRd33RwUh9W3+j88lHCCIUO09E2KU03cYDX7uvjmqyt92D Q==;
X-CSE-ConnectionGUID: SPIxMT9VRUO1q8ERp7h54g==
X-CSE-MsgGUID: NwAB04IHQ52K1ChhMDszkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="98979974"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="98979974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:22:18 -0800
X-CSE-ConnectionGUID: 3vqktu9iSuaSf1gkT18xTA==
X-CSE-MsgGUID: uBWSnj6mTPadCZlUFrcNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214188708"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.183])
 ([10.245.244.183])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:22:16 -0800
Message-ID: <1722945c1b8a99bd9386b82a109e3308197fe914.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/userptr: Convert invalidation to two-pass
 MMU notifier
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, Jason
 Gunthorpe	 <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter	 <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple	 <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Date: Mon, 02 Mar 2026 22:22:13 +0100
In-Reply-To: <aaXdsiRlux/cZ6WC@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-3-thomas.hellstrom@linux.intel.com>
 <aaXdsiRlux/cZ6WC@lstrano-desk.jf.intel.com>
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
X-Rspamd-Queue-Id: 216EC1E2957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action

Hi,

On Mon, 2026-03-02 at 10:57 -0800, Matthew Brost wrote:

Thanks for reviewing,

> On Mon, Mar 02, 2026 at 05:32:46PM +0100, Thomas Hellstr=C3=B6m wrote:
> > In multi-GPU scenarios, asynchronous GPU job latency is a
> > bottleneck if
> > each notifier waits for its own GPU before returning. The two-pass
> > mmu_interval_notifier infrastructure allows deferring the wait to a
> > second pass, so all GPUs can be signalled in the first pass before
> > any of them are waited on.
> >=20
> > Convert the userptr invalidation to use the two-pass model:
> >=20
> > Use invalidate_start as the first pass to mark the VMA for repin
> > and
> > enable software signalling on the VM reservation fences to start
> > any
> > gpu work needed for signaling. Fall back to completing the work
> > synchronously if all fences are already signalled, or if a
> > concurrent
> > invalidation is already using the embedded finish structure.
> >=20
> > Use invalidate_finish as the second pass to wait for the
> > reservation
> > fences to complete, invalidate the GPU TLB in fault mode, and unmap
> > the gpusvm pages.
> >=20
> > Embed a struct mmu_interval_notifier_finish in struct xe_userptr to
> > avoid dynamic allocation in the notifier callback. Use a
> > finish_inuse
> > flag to prevent two concurrent invalidations from using it
> > simultaneously; fall back to the synchronous path for the second
> > caller.
> >=20
>=20
> A couple nits below. Also for clarity, I'd probably rework this
> series...
>=20
> =C2=A0- Move patch #3 to 2nd to patch
> =C2=A0- Squash patch #2, #4 into a single patch, make thia the last patch
>=20
> Let me know what you think on the reordering. I'm looking with the
> series applied and aside from nits below everything in xe_userptr.c
> looks good to me.

We could do that, but unless you insist, I'd like to keep the current
ordering since patch #2 is a very simple example on how to convert and
also since #4 makes the notifier rather complex so it'd be good to
be able to bisect in between those two.

> =C2=A0
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_userptr.c | 96 +++++++++++++++++++++++++---=
-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_userptr.h | 14 +++++
> > =C2=A02 files changed, 88 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > b/drivers/gpu/drm/xe/xe_userptr.c
> > index e120323c43bc..440b0a79d16f 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > @@ -73,18 +73,42 @@ int xe_vma_userptr_pin_pages(struct
> > xe_userptr_vma *uvma)
> > =C2=A0				=C2=A0=C2=A0=C2=A0 &ctx);
> > =C2=A0}
> > =C2=A0
> > -static void __vma_userptr_invalidate(struct xe_vm *vm, struct
> > xe_userptr_vma *uvma)
> > +static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct
> > xe_userptr_vma *uvma,
> > +				=C2=A0=C2=A0=C2=A0 bool is_deferred)
> > =C2=A0{
> > =C2=A0	struct xe_userptr *userptr =3D &uvma->userptr;
> > =C2=A0	struct xe_vma *vma =3D &uvma->vma;
> > -	struct dma_resv_iter cursor;
> > -	struct dma_fence *fence;
> > =C2=A0	struct drm_gpusvm_ctx ctx =3D {
> > =C2=A0		.in_notifier =3D true,
> > =C2=A0		.read_only =3D xe_vma_read_only(vma),
> > =C2=A0	};
> > =C2=A0	long err;
> > =C2=A0
>=20
> xe_svm_assert_in_notifier(vm);

This actually reveals a pre-existing bug. Since this code
is called with the notifier lock held in read mode, and
the vm resv held in the userptr invalidation injection.
That assert would hit.


Also drm_gpusvm_unmap_pages() below will assert the same thing, (also
affected by the bug)
but for clarity I agree we might want to have an assert here, but then
it would need to include the other mode as well, and I'd need to update
the locking docs for the two-pass state.

>=20
> > +	err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> > +				=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> > +				=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> > +	XE_WARN_ON(err <=3D 0);
> > +
> > +	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > +		err =3D xe_vm_invalidate_vma(vma);
> > +		XE_WARN_ON(err);
> > +	}
> > +
> > +	if (is_deferred)
> > +		userptr->finish_inuse =3D false;
> > +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma-
> > >userptr.pages,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_size(vma) >> PAGE_SHIFT=
,
> > &ctx);
> > +}
> > +
> > +static struct mmu_interval_notifier_finish *
> > +xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct
> > xe_userptr_vma *uvma)
> > +{
> > +	struct xe_userptr *userptr =3D &uvma->userptr;
> > +	struct xe_vma *vma =3D &uvma->vma;
> > +	struct dma_resv_iter cursor;
> > +	struct dma_fence *fence;
> > +	bool signaled =3D true;
> > +
>=20
> xe_svm_assert_in_notifier(vm);

Same here.

>=20
> > =C2=A0	/*
> > =C2=A0	 * Tell exec and rebind worker they need to repin and
> > rebind this
> > =C2=A0	 * userptr.
> > @@ -105,27 +129,32 @@ static void __vma_userptr_invalidate(struct
> > xe_vm *vm, struct xe_userptr_vma *uv
> > =C2=A0	 */
> > =C2=A0	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> > =C2=A0			=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP);
> > -	dma_resv_for_each_fence_unlocked(&cursor, fence)
> > +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> > =C2=A0		dma_fence_enable_sw_signaling(fence);
> > +		if (signaled && !dma_fence_is_signaled(fence))
> > +			signaled =3D false;
> > +	}
> > =C2=A0	dma_resv_iter_end(&cursor);
> > =C2=A0
> > -	err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> > -				=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> > -				=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> > -	XE_WARN_ON(err <=3D 0);
> > -
> > -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > -		err =3D xe_vm_invalidate_vma(vma);
> > -		XE_WARN_ON(err);
> > +	/*
> > +	 * Only one caller at a time can use the multi-pass state.
> > +	 * If it's already in use, or all fences are already
> > signaled,
> > +	 * proceed directly to invalidation without deferring.
> > +	 */
> > +	if (signaled || userptr->finish_inuse) {
> > +		xe_vma_userptr_do_inval(vm, uvma, false);
> > +		return NULL;
> > =C2=A0	}
> > =C2=A0
> > -	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma-
> > >userptr.pages,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_size(vma) >> PAGE_SHIFT=
,
> > &ctx);
> > +	userptr->finish_inuse =3D true;
> > +
> > +	return &userptr->finish;
> > =C2=A0}
> > =C2=A0
> > -static bool vma_userptr_invalidate(struct mmu_interval_notifier
> > *mni,
> > -				=C2=A0=C2=A0 const struct mmu_notifier_range
> > *range,
> > -				=C2=A0=C2=A0 unsigned long cur_seq)
> > +static bool xe_vma_userptr_invalidate_start(struct
> > mmu_interval_notifier *mni,
> > +					=C2=A0=C2=A0=C2=A0 const struct
> > mmu_notifier_range *range,
> > +					=C2=A0=C2=A0=C2=A0 unsigned long cur_seq,
> > +					=C2=A0=C2=A0=C2=A0 struct
> > mmu_interval_notifier_finish **p_finish)
> > =C2=A0{
> > =C2=A0	struct xe_userptr_vma *uvma =3D container_of(mni,
> > typeof(*uvma), userptr.notifier);
> > =C2=A0	struct xe_vma *vma =3D &uvma->vma;
> > @@ -138,21 +167,40 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> > =C2=A0		return false;
> > =C2=A0
> > =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "NOTIFIER: addr=3D0x%016llx, ran=
ge=3D0x%016llx",
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "NOTIFIER PASS1: addr=3D0x%016ll=
x, range=3D0x%016llx",
> > =C2=A0		xe_vma_start(vma), xe_vma_size(vma));
> > =C2=A0
> > =C2=A0	down_write(&vm->svm.gpusvm.notifier_lock);
> > =C2=A0	mmu_interval_set_seq(mni, cur_seq);
> > =C2=A0
> > -	__vma_userptr_invalidate(vm, uvma);
> > +	*p_finish =3D xe_vma_userptr_invalidate_pass1(vm, uvma);
> > +
> > =C2=A0	up_write(&vm->svm.gpusvm.notifier_lock);
> > -	trace_xe_vma_userptr_invalidate_complete(vma);
> > +	if (!*p_finish)
> > +		trace_xe_vma_userptr_invalidate_complete(vma);
> > =C2=A0
> > =C2=A0	return true;
> > =C2=A0}
> > =C2=A0
> > +static void xe_vma_userptr_invalidate_finish(struct
> > mmu_interval_notifier_finish *finish)
> > +{
> > +	struct xe_userptr_vma *uvma =3D container_of(finish,
> > typeof(*uvma), userptr.finish);
> > +	struct xe_vma *vma =3D &uvma->vma;
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +
> > +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "NOTIFIER PASS2: addr=3D0x%016ll=
x, range=3D0x%016llx",
> > +		xe_vma_start(vma), xe_vma_size(vma));
> > +
> > +	down_write(&vm->svm.gpusvm.notifier_lock);
> > +	xe_vma_userptr_do_inval(vm, uvma, true);
> > +	up_write(&vm->svm.gpusvm.notifier_lock);
> > +	trace_xe_vma_userptr_invalidate_complete(vma);
> > +}
> > +
> > =C2=A0static const struct mmu_interval_notifier_ops
> > vma_userptr_notifier_ops =3D {
> > -	.invalidate =3D vma_userptr_invalidate,
> > +	.invalidate_start =3D xe_vma_userptr_invalidate_start,
> > +	.invalidate_finish =3D xe_vma_userptr_invalidate_finish,
> > =C2=A0};
> > =C2=A0
> > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > @@ -164,6 +212,7 @@ static const struct mmu_interval_notifier_ops
> > vma_userptr_notifier_ops =3D {
> > =C2=A0 */
> > =C2=A0void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
> > =C2=A0{
> > +	static struct mmu_interval_notifier_finish *finish;
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(&uvma->vma);
> > =C2=A0
> > =C2=A0	/* Protect against concurrent userptr pinning */
> > @@ -179,7 +228,10 @@ void xe_vma_userptr_force_invalidate(struct
> > xe_userptr_vma *uvma)
> > =C2=A0	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 uvma-
> > >userptr.pages.notifier_seq))
> > =C2=A0		uvma->userptr.pages.notifier_seq -=3D 2;
> > -	__vma_userptr_invalidate(vm, uvma);
> > +
> > +	finish =3D xe_vma_userptr_invalidate_pass1(vm, uvma);
> > +	if (finish)
> > +		xe_vma_userptr_do_inval(vm, uvma, true);
> > =C2=A0}
> > =C2=A0#endif
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.h
> > b/drivers/gpu/drm/xe/xe_userptr.h
> > index ef801234991e..4f42db61fd62 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.h
> > +++ b/drivers/gpu/drm/xe/xe_userptr.h
> > @@ -57,12 +57,26 @@ struct xe_userptr {
> > =C2=A0	 */
> > =C2=A0	struct mmu_interval_notifier notifier;
> > =C2=A0
> > +	/**
> > +	 * @finish: MMU notifier finish structure for two-pass
> > invalidation.
> > +	 * Embedded here to avoid allocation in the notifier
> > callback.
> > +	 * Protected by @vm::svm.gpusvm.notifier_lock.
> > +	 */
> > +	struct mmu_interval_notifier_finish finish;
> > +	/**
> > +	 * @finish_inuse: Whether @finish is currently in use by
> > an in-progress
> > +	 * two-pass invalidation.
> > +	 * Protected by @vm::svm.gpusvm.notifier_lock.
> > +	 */
> > +	bool finish_inuse;
> > +
> > =C2=A0	/**
> > =C2=A0	 * @initial_bind: user pointer has been bound at least
> > once.
> > =C2=A0	 * write: vm->svm.gpusvm.notifier_lock in read mode and
> > vm->resv held.
> > =C2=A0	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm-
> > >resv held.
> > =C2=A0	 */
> > =C2=A0	bool initial_bind;
> > +
>=20
> Unrelated.

Sure. Will fix.

Thanks,
Thomas



>=20
> Matt
>=20
> > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > =C2=A0	u32 divisor;
> > =C2=A0#endif
> > --=20
> > 2.53.0
> >=20
