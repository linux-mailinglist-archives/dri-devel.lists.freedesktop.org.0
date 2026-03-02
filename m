Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGDwDDwBpmmfIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:29:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1691E300D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD910E5D2;
	Mon,  2 Mar 2026 21:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSMEpXPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BAB10E5D2;
 Mon,  2 Mar 2026 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772486970; x=1804022970;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=07aJIhDXKQRWkJrUR+usIWWewW9SYLrb5gvHIC47BsQ=;
 b=RSMEpXPeOvQ8+NaHnrFERsoEnOVcwEV0z0c/n096lySEKEWzOZQjDMRt
 3iFShiuWFWcLFBXA7wFKedBWkayKCj4rYjVvSclI+zcG5HTc2pGrV05Xj
 1DGoo93SGhufqfnzGSUljrSt1y/3GliL3JB9byHfiIx1eyi30FkAAVggh
 R0jqNLOmGDMzshZe47NRHBHh3F60saV7bz7FO8JSJldyhdWdIixmzTSa8
 1wjflMSFJZYyXjztZuVDfxOHtI5dcIOImGIa8iPxW9uE0R60ovV2v5r37
 R1gu9SE6wXKq4ap6rNytHNdM0gCoMfFW5xJz10pF6Lhl5icXUTpTNyF/H w==;
X-CSE-ConnectionGUID: TnSDn7ZCTEaBbbIvOt1llQ==
X-CSE-MsgGUID: ycYRP/PbTT6C1CLkrocrLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83847753"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="83847753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:29:29 -0800
X-CSE-ConnectionGUID: Lx2duXLqRJySSZPf1AOGgw==
X-CSE-MsgGUID: 1eKTNmjASpOPxgeT7ayHGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="221941335"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.183])
 ([10.245.244.183])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:29:26 -0800
Message-ID: <d7a0cd033766d2fae1a62e35f5abcd7d701b7c80.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe: Split TLB invalidation into submit and
 wait steps
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, Jason
 Gunthorpe	 <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter	 <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple	 <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Date: Mon, 02 Mar 2026 22:29:22 +0100
In-Reply-To: <aaXfzrTSvRpiX8An@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-4-thomas.hellstrom@linux.intel.com>
 <aaXfzrTSvRpiX8An@lstrano-desk.jf.intel.com>
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
X-Rspamd-Queue-Id: 9B1691E300D
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

On Mon, 2026-03-02 at 11:06 -0800, Matthew Brost wrote:
> On Mon, Mar 02, 2026 at 05:32:47PM +0100, Thomas Hellstr=C3=B6m wrote:
> > xe_vm_range_tilemask_tlb_inval() submits TLB invalidation requests
> > to
> > all GTs in a tile mask and then immediately waits for them to
> > complete
> > before returning. This is fine for the existing callers, but a
> > subsequent patch will need to defer the wait in order to overlap
> > TLB
> > invalidations across multiple VMAs.
> >=20
> > Introduce xe_tlb_inval_range_tilemask_submit() and
> > xe_tlb_inval_batch_wait() in xe_tlb_inval.c as the submit and wait
> > halves respectively. The batch of fences is carried in the new
> > xe_tlb_inval_batch structure. Remove
> > xe_vm_range_tilemask_tlb_inval()
> > and convert all three call sites to the new API.
> >=20
>=20
> Mostly nits...
>=20
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_tlb_inval.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 82
> > +++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_tlb_inval.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 6 ++
> > =C2=A0drivers/gpu/drm/xe/xe_tlb_inval_types.h | 14 +++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69 +++------------------
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 9 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> > =C2=A08 files changed, 123 insertions(+), 67 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 002b6c22ad3f..6ea4972c2791 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -19,6 +19,7 @@
> > =C2=A0#include "xe_pt.h"
> > =C2=A0#include "xe_svm.h"
> > =C2=A0#include "xe_tile.h"
> > +#include "xe_tlb_inval.h"
> > =C2=A0#include "xe_ttm_vram_mgr.h"
> > =C2=A0#include "xe_vm.h"
> > =C2=A0#include "xe_vm_types.h"
> > @@ -225,6 +226,7 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range
> > *mmu_range)
> > =C2=A0{
> > =C2=A0	struct xe_vm *vm =3D gpusvm_to_vm(gpusvm);
> > +	struct xe_tlb_inval_batch _batch;
> > =C2=A0	struct xe_device *xe =3D vm->xe;
> > =C2=A0	struct drm_gpusvm_range *r, *first;
> > =C2=A0	struct xe_tile *tile;
> > @@ -276,7 +278,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> > =C2=A0
> > =C2=A0	xe_device_wmb(xe);
> > =C2=A0
> > -	err =3D xe_vm_range_tilemask_tlb_inval(vm, adj_start,
> > adj_end, tile_mask);
> > +	err =3D xe_tlb_inval_range_tilemask_submit(xe, vm->usm.asid,
> > adj_start, adj_end,
> > +						 tile_mask,
> > &_batch);
> > +	xe_tlb_inval_batch_wait(&_batch);
>=20
> No need to call wait on an error but it is harmless.
>=20
> So you could write it like this:
>=20
> if (!WARN_ON_ONCE(err))
> 	xe_tlb_inval_batch_wait(&_batch);

Sure.

>=20
> > =C2=A0	WARN_ON_ONCE(err);
> > =C2=A0
> > =C2=A0range_notifier_event_end:
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index 933f30fb617d..343e37cfe715 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -486,3 +486,85 @@ bool xe_tlb_inval_idle(struct xe_tlb_inval
> > *tlb_inval)
> > =C2=A0	guard(spinlock_irq)(&tlb_inval->pending_lock);
> > =C2=A0	return list_is_singular(&tlb_inval->pending_fences);
> > =C2=A0}
> > +
> > +/**
> > + * xe_tlb_inval_batch_wait() - Wait for all fences in a TLB
> > invalidation batch
> > + * @batch: Batch of TLB invalidation fences to wait on
> > + *
> > + * Waits for every fence in @batch to signal, then resets @batch
> > so it can be
> > + * reused for a subsequent invalidation.
> > + */
> > +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch)
> > +{
> > +	struct xe_tlb_inval_fence *fence =3D &batch->fence[0];
>=20
> Would this be better:
>=20
> s/&batch->fence[0]/batch->fence
>=20
> Personal preference I guess.

Yeah, I typically use the former to make it easier for
the reader to remember we're pointing to the first element of an array.

>=20
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < batch->num_fences; ++i)
> > +		xe_tlb_inval_fence_wait(fence++);
> > +
> > +	batch->num_fences =3D 0;
> > +}
> > +
> > +/**
> > + * xe_tlb_inval_range_tilemask_submit() - Submit TLB invalidations
> > for an
> > + * address range on a tile mask
> > + * @xe: The xe device
> > + * @asid: Address space ID
> > + * @start: start address
> > + * @end: end address
> > + * @tile_mask: mask for which gt's issue tlb invalidation
> > + * @batch: Batch of tlb invalidate fences
> > + *
> > + * Issue a range based TLB invalidation for gt's in tilemask
> > + *
>=20
> Mention no need to wait on batch if this function returns an error?

Sure.

>=20
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> > +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32
> > asid,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 start, u64 end, u8
> > tile_mask,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tlb_inval_batch
> > *batch)
> > +{
> > +	struct xe_tlb_inval_fence *fence =3D &batch->fence[0];
> > +	struct xe_tile *tile;
> > +	u32 fence_id =3D 0;
> > +	u8 id;
> > +	int err;
> > +
> > +	batch->num_fences =3D 0;
> > +	if (!tile_mask)
> > +		return 0;
> > +
> > +	for_each_tile(tile, xe, id) {
> > +		if (!(tile_mask & BIT(id)))
> > +			continue;
> > +
> > +		xe_tlb_inval_fence_init(&tile->primary_gt-
> > >tlb_inval,
> > +					&fence[fence_id], true);
> > +
> > +		err =3D xe_tlb_inval_range(&tile->primary_gt-
> > >tlb_inval,
> > +					 &fence[fence_id], start,
> > end,
> > +					 asid, NULL);
> > +		if (err)
> > +			goto wait;
> > +		++fence_id;
> > +
> > +		if (!tile->media_gt)
> > +			continue;
> > +
> > +		xe_tlb_inval_fence_init(&tile->media_gt-
> > >tlb_inval,
> > +					&fence[fence_id], true);
> > +
> > +		err =3D xe_tlb_inval_range(&tile->media_gt-
> > >tlb_inval,
> > +					 &fence[fence_id], start,
> > end,
> > +					 asid, NULL);
> > +		if (err)
> > +			goto wait;
> > +		++fence_id;
> > +	}
> > +
> > +wait:
> > +	batch->num_fences =3D fence_id;
>=20
> Should 'batch->num_fences' only get set on success?

We need it for the error wait below, after which it gets cleared.

>=20
> > +	if (err)
> > +		xe_tlb_inval_batch_wait(batch);
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index 62089254fa23..a76b7823a5f2 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -45,4 +45,10 @@ void xe_tlb_inval_done_handler(struct
> > xe_tlb_inval *tlb_inval, int seqno);
> > =C2=A0
> > =C2=A0bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
> > =C2=A0
> > +int xe_tlb_inval_range_tilemask_submit(struct xe_device *xe, u32
> > asid,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 start, u64 end, u8
> > tile_mask,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tlb_inval_batch
> > *batch);
> > +
> > +void xe_tlb_inval_batch_wait(struct xe_tlb_inval_batch *batch);
> > +
> > =C2=A0#endif	/* _XE_TLB_INVAL_ */
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index 3b089f90f002..3d1797d186fd 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -9,6 +9,8 @@
> > =C2=A0#include <linux/workqueue.h>
> > =C2=A0#include <linux/dma-fence.h>
> > =C2=A0
> > +#include "xe_device_types.h"
> > +
> > =C2=A0struct drm_suballoc;
> > =C2=A0struct xe_tlb_inval;
> > =C2=A0
> > @@ -132,4 +134,16 @@ struct xe_tlb_inval_fence {
> > =C2=A0	ktime_t inval_time;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct xe_tlb_inval_batch - Batch of TLB invalidation fences
> > + *
> > + * Holds one fence per GT covered by a TLB invalidation request.
> > + */
> > +struct xe_tlb_inval_batch {
> > +	/** @fence: per-GT TLB invalidation fences */
> > +	struct xe_tlb_inval_fence fence[XE_MAX_TILES_PER_DEVICE *
> > XE_MAX_GT_PER_TILE];
> > +	/** @num_fences: number of valid entries in @fence */
> > +	unsigned int num_fences;
> > +};
> > +
> > =C2=A0#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 548b0769b3ef..7f29d2b2972d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3966,66 +3966,6 @@ void xe_vm_unlock(struct xe_vm *vm)
> > =C2=A0	dma_resv_unlock(xe_vm_resv(vm));
> > =C2=A0}
> > =C2=A0
> > -/**
> > - * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on
> > this tilemask for an
> > - * address range
> > - * @vm: The VM
> > - * @start: start address
> > - * @end: end address
> > - * @tile_mask: mask for which gt's issue tlb invalidation
> > - *
> > - * Issue a range based TLB invalidation for gt's in tilemask
> > - *
> > - * Returns 0 for success, negative error code otherwise.
> > - */
> > -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> > -				=C2=A0=C2=A0 u64 end, u8 tile_mask)
> > -{
> > -	struct xe_tlb_inval_fence
> > -		fence[XE_MAX_TILES_PER_DEVICE *
> > XE_MAX_GT_PER_TILE];
> > -	struct xe_tile *tile;
> > -	u32 fence_id =3D 0;
> > -	u8 id;
> > -	int err;
> > -
> > -	if (!tile_mask)
> > -		return 0;
> > -
> > -	for_each_tile(tile, vm->xe, id) {
> > -		if (!(tile_mask & BIT(id)))
> > -			continue;
> > -
> > -		xe_tlb_inval_fence_init(&tile->primary_gt-
> > >tlb_inval,
> > -					&fence[fence_id], true);
> > -
> > -		err =3D xe_tlb_inval_range(&tile->primary_gt-
> > >tlb_inval,
> > -					 &fence[fence_id], start,
> > end,
> > -					 vm->usm.asid, NULL);
> > -		if (err)
> > -			goto wait;
> > -		++fence_id;
> > -
> > -		if (!tile->media_gt)
> > -			continue;
> > -
> > -		xe_tlb_inval_fence_init(&tile->media_gt-
> > >tlb_inval,
> > -					&fence[fence_id], true);
> > -
> > -		err =3D xe_tlb_inval_range(&tile->media_gt-
> > >tlb_inval,
> > -					 &fence[fence_id], start,
> > end,
> > -					 vm->usm.asid, NULL);
> > -		if (err)
> > -			goto wait;
> > -		++fence_id;
> > -	}
> > -
> > -wait:
> > -	for (id =3D 0; id < fence_id; ++id)
> > -		xe_tlb_inval_fence_wait(&fence[id]);
> > -
> > -	return err;
> > -}
> > -
> > =C2=A0/**
> > =C2=A0 * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without
> > a lock
> > =C2=A0 * @vma: VMA to invalidate
> > @@ -4040,6 +3980,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D xe_vma_vm(vma)->xe;
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +	struct xe_tlb_inval_batch _batch;
>=20
> Why not just 'batch'?
>=20
> > =C2=A0	struct xe_tile *tile;
> > =C2=A0	u8 tile_mask =3D 0;
> > =C2=A0	int ret =3D 0;
> > @@ -4080,12 +4021,16 @@ int xe_vm_invalidate_vma(struct xe_vma
> > *vma)
> > =C2=A0
> > =C2=A0	xe_device_wmb(xe);
> > =C2=A0
> > -	ret =3D xe_vm_range_tilemask_tlb_inval(xe_vma_vm(vma),
> > xe_vma_start(vma),
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_end(vma),
> > tile_mask);
> > +	ret =3D xe_tlb_inval_range_tilemask_submit(xe,
> > xe_vma_vm(vma)->usm.asid,
> > +					=09
> > xe_vma_start(vma), xe_vma_end(vma),
> > +						 tile_mask,
> > &_batch);
> > =C2=A0
> > =C2=A0	/* WRITE_ONCE pairs with READ_ONCE in
> > xe_vm_has_valid_gpu_mapping() */
> > =C2=A0	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> > =C2=A0
> > +	if (!ret)
> > +		xe_tlb_inval_batch_wait(&_batch);
> > +
>=20
> Here we skip the wait on error, hence my suggestion to skip waits in
> other code paths or at a minimum make call sematics consistent.=20

Makes sense.

>=20
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index f849e369432b..62f4b6fec0bc 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -240,9 +240,6 @@ struct dma_fence *xe_vm_range_rebind(struct
> > xe_vm *vm,
> > =C2=A0struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range);
> > =C2=A0
> > -int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
> > -				=C2=A0=C2=A0 u64 end, u8 tile_mask);
> > -
> > =C2=A0int xe_vm_invalidate_vma(struct xe_vma *vma);
> > =C2=A0
> > =C2=A0int xe_vm_validate_protected(struct xe_vm *vm);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 95bf53cc29e3..39717026e84f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -12,6 +12,7 @@
> > =C2=A0#include "xe_pat.h"
> > =C2=A0#include "xe_pt.h"
> > =C2=A0#include "xe_svm.h"
> > +#include "xe_tlb_inval.h"
> > =C2=A0
> > =C2=A0struct xe_vmas_in_madvise_range {
> > =C2=A0	u64 addr;
> > @@ -235,13 +236,19 @@ static u8 xe_zap_ptes_in_madvise_range(struct
> > xe_vm *vm, u64 start, u64 end)
> > =C2=A0static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64
> > start, u64 end)
> > =C2=A0{
> > =C2=A0	u8 tile_mask =3D xe_zap_ptes_in_madvise_range(vm, start,
> > end);
> > +	struct xe_tlb_inval_batch batch;
> > +	int err;
> > =C2=A0
> > =C2=A0	if (!tile_mask)
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	xe_device_wmb(vm->xe);
> > =C2=A0
> > -	return xe_vm_range_tilemask_tlb_inval(vm, start, end,
> > tile_mask);
> > +	err =3D xe_tlb_inval_range_tilemask_submit(vm->xe, vm-
> > >usm.asid, start, end,
> > +						 tile_mask,
> > &batch);
> > +	xe_tlb_inval_batch_wait(&batch);
>=20
> No need to wait on error.

Will fix

Thanks,
Thomas



>=20
> > +
> > +	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static bool madvise_args_are_sane(struct xe_device *xe, const
> > struct drm_xe_madvise *args)
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 1f6f7e30e751..de6544165cfa 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -18,6 +18,7 @@
> > =C2=A0#include "xe_device_types.h"
> > =C2=A0#include "xe_pt_types.h"
> > =C2=A0#include "xe_range_fence.h"
> > +#include "xe_tlb_inval_types.h"
> > =C2=A0#include "xe_userptr.h"
> > =C2=A0
> > =C2=A0struct drm_pagemap;
> > --=20
> > 2.53.0
> >=20
