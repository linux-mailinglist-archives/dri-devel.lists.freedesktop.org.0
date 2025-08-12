Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADFEB22253
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 11:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173CE10E5C5;
	Tue, 12 Aug 2025 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyyWCZ5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679B10E110;
 Tue, 12 Aug 2025 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754989592; x=1786525592;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8gFne/giBY9PSWZwoXTtzxujLwuZ+hsartMmWykWWk0=;
 b=lyyWCZ5wtJCxo5U1F5qwJfgNYWOp5AC/yrWkmDYoZZv5bCcLCcSK8yhg
 fFg+haICm7nCSkM6+Ovc9hCzqvVmU6U/us5nZiy0vMg1UUVERh8vurPm5
 C1ob6e51pHkfEgtAVQkhvlB5OYkmqH6kNAz0uBvf36pN2l6uBxqrQA8kK
 q/zkJLVvp3R1OeuTrafD4liOck4UAQk/OMRlzM/ouelZpsqrl/G+5zeZ6
 PqdiPThtiBn+FCoLcWxNukVjTq/fgBmREB0dB/32fDBwo/2rJseQVRLst
 W4Z2Xm9a7HmoKIJp5qMDmZAccdXyOotT7oTYbiGUKUsMKtEUiWu1xDpn4 A==;
X-CSE-ConnectionGUID: rsiZ6jCPQSiHAp4C3p9HGQ==
X-CSE-MsgGUID: GnOmmofVQ9W+MflwM4jrqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67860068"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67860068"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 02:06:31 -0700
X-CSE-ConnectionGUID: NAHuCiBMSNGpX4wmc77csA==
X-CSE-MsgGUID: NENKvorPTfKN9BlUl1AVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="197148858"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.68])
 ([10.245.245.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 02:06:28 -0700
Message-ID: <f35bafa3c62e5f541c4f5d65f5682a0360496dde.camel@linux.intel.com>
Subject: Re: [RFC PATCH 6/6] drm/xe: Implement two pass MMU notifiers for SVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, Jason
 Gunthorpe	 <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter	 <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 linux-mm@kvack.org, 	linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 11:06:26 +0200
In-Reply-To: <aJpWkig5z8tbeQDo@lstrano-desk.jf.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-7-thomas.hellstrom@linux.intel.com>
 <aJpWkig5z8tbeQDo@lstrano-desk.jf.intel.com>
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

On Mon, 2025-08-11 at 13:46 -0700, Matthew Brost wrote:
> On Sat, Aug 09, 2025 at 03:51:37PM +0200, Thomas Hellstr=C3=B6m wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> >=20
> > Implement two-pass MMU notifiers for SVM, enabling multiple VMs or
> > devices with GPU mappings to pipeline costly TLB invalidations by
> > issuing them in the first pass and waiting for completion in the
> > second.
> >=20
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_gpusvm.c |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0 | 74 ++++++++++++++++++++++++++=
++++--
> > ----
> > =C2=A02 files changed, 63 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index 92dc7d2bd6cf..f153df1bc862 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -413,7 +413,7 @@ drm_gpusvm_notifier_invalidate_twopass(struct
> > mmu_interval_notifier *mni,
> > =C2=A0 * drm_gpusvm_notifier_ops - MMU interval notifier operations for
> > GPU SVM
> > =C2=A0 */
> > =C2=A0static const struct mmu_interval_notifier_ops
> > drm_gpusvm_notifier_ops =3D {
> > -	.invalidate_twopass =3D
> > drm_gpusvm_notifier_invalidate_twopass,
> > +	.invalidate_multipass =3D
> > drm_gpusvm_notifier_invalidate_twopass,
>=20
> This should be in patch #2.

Yup. My bad fixing up for the interface change in patch 1. Sorry for
that.
/Thomas


>=20
> Matt
>=20
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 82a598c8d56e..5728394806ca 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -144,15 +144,8 @@ xe_svm_range_notifier_event_begin(struct xe_vm
> > *vm, struct drm_gpusvm_range *r,
> > =C2=A0	 * invalidations spanning multiple ranges.
> > =C2=A0	 */
> > =C2=A0	for_each_tile(tile, xe, id)
> > -		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> > +		if (xe_pt_zap_ptes_range(tile, vm, range))
> > =C2=A0			tile_mask |=3D BIT(id);
> > -			/*
> > -			 * WRITE_ONCE pairs with READ_ONCE in
> > -			 * xe_vm_has_valid_gpu_mapping()
> > -			 */
> > -			WRITE_ONCE(range->tile_invalidated,
> > -				=C2=A0=C2=A0 range->tile_invalidated |
> > BIT(id));
> > -		}
> > =C2=A0
> > =C2=A0	return tile_mask;
> > =C2=A0}
> > @@ -161,16 +154,60 @@ static void
> > =C2=A0xe_svm_range_notifier_event_end(struct xe_vm *vm, struct
> > drm_gpusvm_range *r,
> > =C2=A0				const struct mmu_notifier_range
> > *mmu_range)
> > =C2=A0{
> > +	struct xe_svm_range *range =3D to_xe_range(r);
> > =C2=A0	struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D true, };
> > =C2=A0
> > =C2=A0	xe_svm_assert_in_notifier(vm);
> > =C2=A0
> > +	/*
> > +	 * WRITE_ONCE pairs with READ_ONCE in
> > xe_vm_has_valid_gpu_mapping()
> > +	 */
> > +	WRITE_ONCE(range->tile_invalidated, range->tile_present);
> > +
> > =C2=A0	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > =C2=A0	if (!xe_vm_is_closed(vm) && mmu_range->event =3D=3D
> > MMU_NOTIFY_UNMAP)
> > =C2=A0		xe_svm_garbage_collector_add_range(vm,
> > to_xe_range(r),
> > =C2=A0						=C2=A0=C2=A0 mmu_range);
> > =C2=A0}
> > =C2=A0
> > +struct xe_svm_invalidate_pass {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct drm_gpusvm_notifier *notifier;
> > +#define XE_SVM_INVALIDATE_FENCE_COUNT	\
> > +	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE)
> > +	struct xe_gt_tlb_invalidation_fence
> > fences[XE_SVM_INVALIDATE_FENCE_COUNT];
> > +	struct mmu_interval_notifier_pass p;
> > +};
> > +
> > +static struct mmu_interval_notifier_pass *
> > +xe_svm_invalidate_second(struct mmu_interval_notifier_pass *p,
> > +			 const struct mmu_notifier_range
> > *mmu_range,
> > +			 unsigned long cur_seq)
> > +{
> > +	struct xe_svm_invalidate_pass *pass =3D container_of(p,
> > typeof(*pass), p);
> > +	struct drm_gpusvm *gpusvm =3D pass->gpusvm;
> > +	struct drm_gpusvm_notifier *notifier =3D pass->notifier;
> > +	struct drm_gpusvm_range *r =3D NULL;
> > +	struct xe_vm *vm =3D gpusvm_to_vm(gpusvm);
> > +	u64 adj_start =3D mmu_range->start, adj_end =3D mmu_range-
> > >end;
> > +	int id;
> > +
> > +	/* Adjust invalidation to notifier boundaries */
> > +	adj_start =3D max(drm_gpusvm_notifier_start(notifier),
> > adj_start);
> > +	adj_end =3D min(drm_gpusvm_notifier_end(notifier), adj_end);
> > +
> > +	for (id =3D 0; id < XE_SVM_INVALIDATE_FENCE_COUNT; ++id)
> > +		xe_gt_tlb_invalidation_fence_wait(&pass-
> > >fences[id]);
> > +
> > +	drm_gpusvm_in_notifier_lock(gpusvm);
> > +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > +		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > +	drm_gpusvm_in_notifier_unlock(gpusvm);
> > +
> > +	kfree(pass);
> > +	return NULL;
> > +}
> > +
> > =C2=A0static void xe_svm_invalidate_twopass(struct drm_gpusvm *gpusvm,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> > *notifier,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > mmu_notifier_range *mmu_range,
> > @@ -179,6 +216,8 @@ static void xe_svm_invalidate_twopass(struct
> > drm_gpusvm *gpusvm,
> > =C2=A0	struct xe_vm *vm =3D gpusvm_to_vm(gpusvm);
> > =C2=A0	struct xe_device *xe =3D vm->xe;
> > =C2=A0	struct drm_gpusvm_range *r, *first;
> > +	struct xe_svm_invalidate_pass *pass =3D NULL;
> > +	struct xe_gt_tlb_invalidation_fence *fences =3D NULL;
> > =C2=A0	u64 adj_start =3D mmu_range->start, adj_end =3D mmu_range-
> > >end;
> > =C2=A0	u8 tile_mask =3D 0;
> > =C2=A0	long err;
> > @@ -226,14 +265,25 @@ static void xe_svm_invalidate_twopass(struct
> > drm_gpusvm *gpusvm,
> > =C2=A0
> > =C2=A0	xe_device_wmb(xe);
> > =C2=A0
> > -	err =3D xe_vm_range_tilemask_tlb_invalidation(vm, NULL,
> > adj_start,
> > +	pass =3D kzalloc(sizeof(*pass), GFP_NOWAIT);
> > +	if (pass) {
> > +		pass->gpusvm =3D gpusvm;
> > +		pass->notifier =3D notifier;
> > +		pass->p.pass =3D xe_svm_invalidate_second;
> > +		fences =3D pass->fences;
> > +		*p =3D &pass->p;
> > +	}
> > +
> > +	err =3D xe_vm_range_tilemask_tlb_invalidation(vm, fences,
> > adj_start,
> > =C2=A0						=C2=A0=C2=A0=C2=A0 adj_end,
> > tile_mask);
> > =C2=A0	WARN_ON_ONCE(err);
> > =C2=A0
> > =C2=A0range_notifier_event_end:
> > -	r =3D first;
> > -	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> > -		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> > +	if (!pass) {
> > +		r =3D first;
> > +		drm_gpusvm_for_each_range(r, notifier, adj_start,
> > adj_end)
> > +			xe_svm_range_notifier_event_end(vm, r,
> > mmu_range);
> > +	}
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > --=20
> > 2.50.1
> >=20

