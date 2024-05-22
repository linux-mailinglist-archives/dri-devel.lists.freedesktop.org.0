Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773E8CC5C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 19:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C040910E251;
	Wed, 22 May 2024 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qk6HvCIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7AA10E251;
 Wed, 22 May 2024 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716399785; x=1747935785;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8p3awljRbjcTNpRbySi5EhEj7xe+nWPor9mnUslVO10=;
 b=Qk6HvCIXavmCD1xXGS4CRC2l/22opQACTsm2vk3+1hUqPSgm6cwNEdYi
 0alXK5o2XhjvY/VLwEK6DmL87R7493/MMNPord9csDCCBLRPsRfSDpZwP
 DsFsPUJo2Z7dpX2dkczVeP2kPB1q0dV/CXr80c4rAIzCXONyun6JfObyE
 WUlM2VRVzIN/Hk+RqdCzXYqeGNmoCxdqcVLvUG0cNgqqlWJmG/zXD+Z8Y
 VtqdFMsrBqD4KmPwKoYfUUOcOnsCwkLvngbmUEVr6Nb3eTKtQAqaYAL4F
 9APoYoCZEWpuusjf4gwOqYmVlQbc6xHsIweNMu5IJuK6ri5M2OB+jvx28 Q==;
X-CSE-ConnectionGUID: 9oCZO5AwRSiaTVJZZWi9fQ==
X-CSE-MsgGUID: oYML1TSqQU6BrVkMc1/L/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12852675"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12852675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:43:04 -0700
X-CSE-ConnectionGUID: ymAtiJfuQ2uvlpjhYYrZsA==
X-CSE-MsgGUID: GoKisXi2REecHWPP1FoSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33372067"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO [10.245.246.224])
 ([10.245.246.224])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:43:02 -0700
Message-ID: <b5dfb6280aa6a9fd0d2449027b8bf14276f1baab.camel@linux.intel.com>
Subject: Re: [RFC PATCH v3 13/21] drm/exec: Rework contended locking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 22 May 2024 19:42:59 +0200
In-Reply-To: <e0fb45b9-69a8-4e36-a518-30380583fcd2@amd.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-14-thomas.hellstrom@linux.intel.com>
 <fb9efb6b-fd2f-424e-8c9c-8ca590ee714a@amd.com>
 <3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com>
 <e0fb45b9-69a8-4e36-a518-30380583fcd2@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-05-22 at 18:52 +0200, Christian K=C3=B6nig wrote:
> Am 22.05.24 um 16:32 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2024-05-22 at 07:52 +0200, Christian K=C3=B6nig wrote:
> > > Am 21.05.24 um 09:16 schrieb Thomas Hellstr=C3=B6m:
> > > > If contention and backoff occurs during a drm_exec ww
> > > > transaction,
> > > > the contended lock is not locked again until the next orinary
> > > > attempt to lock a dma_resv lock. However, with the introduction
> > > > of
> > > > drm_exec_trylock(), that doesn't work, since the locking of the
> > > > contended lock needs to be a sleeping lock. Neither can we
> > > > ignore
> > > > locking the contended lock during a trylock since that would
> > > > violate
> > > > at least the ww_mutex annotations.
> > > >=20
> > > > So resolve this by actually locking the contended lock during
> > > > drm_exec_retry_on_contention(). However, this introduces a new
> > > > point
> > > > of failure since locking the contended lock may return -EINTR.
> > > >=20
> > > > Hence drm_exec_retry_on_contention() must take an error
> > > > parameter
> > > > and
> > > > also return a value indicating success.
> > > After thinking more about that I have to pretty clearly NAK this.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > I thought we were beyond upfront NAKing in the first reply :/
>=20
> Well my memory could fail me, but I mentioned concerns on this
> approach=20
> before.
>=20
> I was a bit annoyed seeing that again. But could as well be that my=20
> response never got out or that I'm mixing things up.

I haven't seen it at least. Last discussion on this I saw was
here. I didn't see a follow-up on that.

https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.=
camel@linux.intel.com/


>=20
> > > It's an intentional design decision to guarantee that at the
> > > start of
> > > the loop no object is locked.
> > >=20
> > > This is because Sima and I wanted to integrate userptr handling
> > > into
> > > drm_exec as well in the long term.
> > First I agree the interface looks worse with this patch.
> > But I thought generic userptr handling were going to end up as a
> > gpuvm
> > helper (without using GEM objects) as we've discussed previously.
>=20
> We might be talking past each other. That sounds like SVM, e.g. on=20
> demand paging.
>=20
> What I mean is pre-faulting during command submission like radeon,=20
> amdgpu and i915 do for the userptr handling.

Yes, then we're talking about the same thing.

We discussed in this thread here, started by Dave.

https://lore.kernel.org/dri-devel/CAPM=3D9twPgn+fpbkig0Vhjt=3DcJdHQFbNH_Z=
=3DsRhSZwuvLKhavbA@mail.gmail.com/

I still think the right place is in drm_gpuvm for this sort of stuff.
And I think that's the concluding argument by Sima as well.

In any case, If the planned drm_exec development is to be a full
execbuf helper, I think we need a capable sub-helper for ONLY the ww
transaction locking as well, with support for the various locking
primitives. In particular if we're going to be able to port i915 ww
transaction locking over. There are more uses of the ww locking
transacions than execbuf.

>=20
> For that you need to re-start the whole handling similar to how you
> need=20
> to re-start for the mutex locking when you detect that the page array
> is=20
> stale, the difference is that you are not allowed to hold any resv
> locks=20
> while pre-faulting.
>=20
> That's why it is a requirement that the drm_exec loop starts without
> any=20
> locks held.

But wouldn't you need an outer (userptr) loop and an inner
(ww_transaction) loop for this? Why would we want to re-validate
userptrs on -EDEADLKS?

>=20
> > Anyway if still there would be helpers in drm_exec for some other
> > generic userptr solution, those need to be done before the
> > ww_acquire_ctx_init(). The contended locking here is done after, so
> > I
> > can't really see how these would clash.
>=20
> Yes, that indeed was a problem. The ww_acquire_ctx_init() was=20
> intentionally moved into drm_exec_cleanup() to partially prevent that
> issue.
>=20
> I haven't fully figured out how to do handle everything exactly, but
> at=20
> least in principle it can be made work. With this change here it
> becomes=20
> impossible.
>=20
> > Still, If we need to come up with another solution, I think it's
> > fair
> > we clearly sort out why.
> >=20
> > > I think we should just document that drm_exec_trylock() can't be
> > > used
> > > to
> > > lock the first BO in the loop and explicitly WARN if that's the
> > > case.
> > Unfortunately that's not sufficient for the general use-case. If we
> > want to keep the ttm_bo_vm approach of dropping the mmap lock when
> > there is contention on the bo resv, we need to be able to trylock
> > on
> > first lock.
>=20
> Mhm, why exactly do we still have that dance in the first place?
>=20
> I mean we have sorted out the mmap() and dma_resv() locking order
> long=20
> ago. See dma_resv_lockdep() which is enforcing that.

I explained that in my reply here:

https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.=
camel@linux.intel.com/

We shouldn't be holding the mmap lock when waiting for stuff. In
particular not while waiting for mutexes that may be blocked by gpu
activity.

>=20
> > =C2=A0 Also bo creation is using trylock but might be able to use
> > a sleeping lock there. But if that sleeping lock triggers an -
> > EDEADLK
> > (DEBUG_WW_MUTEX_SLOWPATH) we have the weird situation of
> > referencing an
> > object that never was fully created as a contending object.
>=20
> I wanted to eliminate that as well by not validating the BO during=20
> initialization any more.

>=20
> So bo creation would then be:
>=20
> ttm_bo_init(bo)
>=20
> drm_exec_while_not_all_locked() {
> =C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_prepare_object(bo, 1);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_validate(bo);
> }
>=20
> if (r)
> =C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_put(bo);
>=20
> return r;
>=20
> I have that on a branch here somewhere prepared, but never got the
> time=20
> to clean it up.

Still, bo creation and validation may be part of a ww transaction as
well, like page-table bos (Although those are pre-locked so perhaps not
a good example). But in the general case, I'm not sure this is
sufficient for all use-cases.

/Thomas



>=20
> Regards,
> Christian.
>=20
> >=20
> > So the only really working alternative solution I can see is that
> > drm_exec_trylock simply fails if there is a contended lock and we'd
> > need to live with the weird bo creation situation described above.
> >=20
> > /Thomas
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > Cc: Christian K=C3=B6nig<christian.koenig@amd.com>
> > > > Cc: Somalapuram Amaranath<Amaranath.Somalapuram@amd.com>
> > > > Cc: Matthew Brost<matthew.brost@intel.com>
> > > > Cc:<dri-devel@lists.freedesktop.org>
> > > > Signed-off-by: Thomas
> > > > Hellstr=C3=B6m<thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0=C2=A0 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c=C2=A0 | 1=
6 ++++-----
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++--
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +--
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 +--
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c=C2=A0 |=
=C2=A0 8 ++---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdkfd/kfd_svm.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 35
> > > > ++++++++++++++-----
> > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 8 ++---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/msm/msm_gem_submit.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/nouveau/nouveau_uvmm.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/tests/drm_exec_test.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++----
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_gt_pagefault.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +--
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 +++---
> > > > =C2=A0=C2=A0 include/drm/drm_exec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23
> > > > +++++++++---
> > > > =C2=A0=C2=A0 17 files changed, 92 insertions(+), 62 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > > > index e4d4e55c08ad..4a08a692aa1f 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > > > @@ -1152,12 +1152,12 @@ static int reserve_bo_and_vm(struct
> > > > kgd_mem
> > > > *mem,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE=
_WAIT,
> > > > 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&ctx->exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
> > > > -		drm_exec_retry_on_contention(&ctx->exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&ctx->exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(ret))
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_prepare_obj(&ctx->exec, &bo-
> > > > > tbo.base, 1);
> > > > -		drm_exec_retry_on_contention(&ctx->exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&ctx->exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(ret))
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -1199,14 +1199,14 @@ static int
> > > > reserve_bo_and_cond_vms(struct
> > > > kgd_mem *mem,
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0			ret =3D amdgpu_vm_lock_pd(entry->bo_va-
> > > > > base.vm,
> > > > =C2=A0=C2=A0=C2=A0						&ctx->exec,
> > > > 2);
> > > > -			drm_exec_retry_on_contention(&ctx-
> > > > >exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(&ctx-
> > > > > exec, ret);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(ret))
> > > > =C2=A0=C2=A0=C2=A0				goto error;
> > > > =C2=A0=C2=A0=C2=A0			++ctx->n_vms;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_prepare_obj(&ctx->exec, &bo-
> > > > > tbo.base, 1);
> > > > -		drm_exec_retry_on_contention(&ctx->exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&ctx->exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(ret))
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -2619,7 +2619,7 @@ static int
> > > > validate_invalid_user_pages(struct
> > > > amdkfd_process_info *process_info)
> > > > =C2=A0=C2=A0=C2=A0		list_for_each_entry(peer_vm, &process_info-
> > > > > vm_list_head,
> > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 vm_list_node) {
> > > > =C2=A0=C2=A0=C2=A0			ret =3D amdgpu_vm_lock_pd(peer_vm,
> > > > &exec,
> > > > 2);
> > > > -			drm_exec_retry_on_contention(&exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(ret))
> > > > =C2=A0=C2=A0=C2=A0				goto unreserve_out;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > @@ -2631,7 +2631,7 @@ static int
> > > > validate_invalid_user_pages(struct
> > > > amdkfd_process_info *process_info)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0			gobj =3D &mem->bo->tbo.base;
> > > > =C2=A0=C2=A0=C2=A0			ret =3D drm_exec_prepare_obj(&exec,
> > > > gobj,
> > > > 1);
> > > > -			drm_exec_retry_on_contention(&exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(ret))
> > > > =C2=A0=C2=A0=C2=A0				goto unreserve_out;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > @@ -2875,7 +2875,7 @@ int
> > > > amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
> > > > dma_fence __rcu *
> > > > =C2=A0=C2=A0=C2=A0		list_for_each_entry(peer_vm, &process_info-
> > > > > vm_list_head,
> > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 vm_list_node) {
> > > > =C2=A0=C2=A0=C2=A0			ret =3D amdgpu_vm_lock_pd(peer_vm,
> > > > &exec,
> > > > 2);
> > > > -			drm_exec_retry_on_contention(&exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(ret)) {
> > > > =C2=A0=C2=A0=C2=A0				pr_err("Locking VM PD failed,
> > > > ret:
> > > > %d\n", ret);
> > > > =C2=A0=C2=A0=C2=A0				goto ttm_reserve_fail;
> > > > @@ -2891,7 +2891,7 @@ int
> > > > amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
> > > > dma_fence __rcu *
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0			gobj =3D &mem->bo->tbo.base;
> > > > =C2=A0=C2=A0=C2=A0			ret =3D drm_exec_prepare_obj(&exec,
> > > > gobj,
> > > > 1);
> > > > -			drm_exec_retry_on_contention(&exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(ret)) {
> > > > =C2=A0=C2=A0=C2=A0				pr_err("drm_exec_prepare_obj
> > > > failed, ret: %d\n", ret);
> > > > =C2=A0=C2=A0=C2=A0				goto ttm_reserve_fail;
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > index ec888fc6ead8..299e46a6d934 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > @@ -897,7 +897,7 @@ static int amdgpu_cs_parser_bos(struct
> > > > amdgpu_cs_parser *p,
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&p->exec) {
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1
> > > > + p-
> > > > > gang_size);
> > > > -		drm_exec_retry_on_contention(&p->exec);
> > > > +		r =3D drm_exec_retry_on_contention(&p->exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_free_user_pages;
> > > > =C2=A0=C2=A0=20
> > > > @@ -905,7 +905,7 @@ static int amdgpu_cs_parser_bos(struct
> > > > amdgpu_cs_parser *p,
> > > > =C2=A0=C2=A0=C2=A0			/* One fence for TTM and one for each
> > > > CS
> > > > job */
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_prepare_obj(&p->exec, &e-
> > > > >bo-
> > > > > tbo.base,
> > > > =C2=A0=C2=A0=C2=A0						 1 + p-
> > > > > gang_size);
> > > > -			drm_exec_retry_on_contention(&p-
> > > > >exec);
> > > > +			r =3D drm_exec_retry_on_contention(&p-
> > > > >exec,
> > > > r);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0				goto out_free_user_pages;
> > > > =C2=A0=C2=A0=20
> > > > @@ -915,7 +915,7 @@ static int amdgpu_cs_parser_bos(struct
> > > > amdgpu_cs_parser *p,
> > > > =C2=A0=C2=A0=C2=A0		if (p->uf_bo) {
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_prepare_obj(&p->exec, &p-
> > > > > uf_bo->tbo.base,
> > > > =C2=A0=C2=A0=C2=A0						 1 + p-
> > > > > gang_size);
> > > > -			drm_exec_retry_on_contention(&p-
> > > > >exec);
> > > > +			r =3D drm_exec_retry_on_contention(&p-
> > > > >exec,
> > > > r);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0				goto out_free_user_pages;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > > > index cfdf558b48b6..8b2b86c7a6c5 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > > > @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct
> > > > amdgpu_device
> > > > *adev, struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (likely(!r))
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_lock_obj(&exec, &bo-
> > > > > tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r)) {
> > > > =C2=A0=C2=A0=C2=A0			DRM_ERROR("failed to reserve CSA,PD
> > > > BOs:
> > > > err=3D%d\n", r);
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > @@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct
> > > > amdgpu_device *adev, struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (likely(!r))
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_lock_obj(&exec, &bo-
> > > > > tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r)) {
> > > > =C2=A0=C2=A0=C2=A0			DRM_ERROR("failed to reserve CSA,PD
> > > > BOs:
> > > > err=3D%d\n", r);
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > index 67c234bcf89f..17e16c971e21 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > @@ -239,12 +239,12 @@ static void
> > > > amdgpu_gem_object_close(struct
> > > > drm_gem_object *obj,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES,=
 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		r =3D drm_exec_prepare_obj(&exec, &bo->tbo.base=
,
> > > > 1);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_unlock;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_unlock;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct drm_device
> > > > *dev, void *data,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		if (gobj) {
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_lock_obj(&exec, gobj);
> > > > -			drm_exec_retry_on_contention(&exec);
> > > > +			r =3D
> > > > drm_exec_retry_on_contention(&exec,
> > > > r);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0				goto error;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > index 5ca5c47ab54e..1b1a5147606e 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > @@ -1221,12 +1221,12 @@ int amdgpu_mes_ctx_map_meta_data(struct
> > > > amdgpu_device *adev,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		r =3D drm_exec_lock_obj(&exec,
> > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ctx_data-
> > > > >meta_data_obj-
> > > > > tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error_fini_exec;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error_fini_exec;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -1292,12 +1292,12 @@ int
> > > > amdgpu_mes_ctx_unmap_meta_data(struct
> > > > amdgpu_device *adev,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		r =3D drm_exec_lock_obj(&exec,
> > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ctx_data-
> > > > >meta_data_obj-
> > > > > tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_unlock;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_unlock;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
> > > > index e22cb2b5cd92..72b8213e352c 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
> > > > @@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct amdgpu_device
> > > > *adev,
> > > > struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (likely(!r))
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_lock_obj(&exec, &bo-
> > > > > tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct
> > > > amdgpu_device
> > > > *adev, struct amdgpu_fpriv *fpriv)
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (likely(!r))
> > > > =C2=A0=C2=A0=C2=A0			r =3D drm_exec_lock_obj(&exec, &bo-
> > > > > tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> > > > index e01c1c8e64c4..63392ce43945 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> > > > @@ -89,12 +89,12 @@ static int map_ring_data(struct
> > > > amdgpu_device
> > > > *adev, struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, 0, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		r =3D drm_exec_lock_obj(&exec, &bo->tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error_fini_exec;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto error_fini_exec;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -152,12 +152,12 @@ static int unmap_ring_data(struct
> > > > amdgpu_device *adev, struct amdgpu_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, 0, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		r =3D drm_exec_lock_obj(&exec, &bo->tbo.base);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_unlock;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		r =3D drm_exec_retry_on_contention(&exec, r);
> > > > =C2=A0=C2=A0=C2=A0		if (unlikely(r))
> > > > =C2=A0=C2=A0=C2=A0			goto out_unlock;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > > > b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > > > index 386875e6eb96..a3aa7fd22f6a 100644
> > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > > > @@ -1499,7 +1499,7 @@ static int svm_range_reserve_bos(struct
> > > > svm_validate_context *ctx, bool intr)
> > > > =C2=A0=C2=A0=C2=A0			vm =3D drm_priv_to_vm(pdd->drm_priv);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0			r =3D amdgpu_vm_lock_pd(vm, &ctx->exec,
> > > > 2);
> > > > -			drm_exec_retry_on_contention(&ctx-
> > > > >exec);
> > > > +			r =3D drm_exec_retry_on_contention(&ctx-
> > > > > exec, r);
> > > > =C2=A0=C2=A0=C2=A0			if (unlikely(r)) {
> > > > =C2=A0=C2=A0=C2=A0				pr_debug("failed %d to reserve
> > > > bo\n", r);
> > > > =C2=A0=C2=A0=C2=A0				goto unreserve_out;
> > > > diff --git a/drivers/gpu/drm/drm_exec.c
> > > > b/drivers/gpu/drm/drm_exec.c
> > > > index 2da094bdf8a4..3770a5d30213 100644
> > > > --- a/drivers/gpu/drm/drm_exec.c
> > > > +++ b/drivers/gpu/drm/drm_exec.c
> > > > @@ -28,12 +28,12 @@
> > > > =C2=A0=C2=A0=C2=A0 *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WA=
IT);
> > > > =C2=A0=C2=A0=C2=A0 *	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0 *		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> > > > - *		drm_exec_retry_on_contention(&exec);
> > > > + *		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0 *		if (ret)
> > > > =C2=A0=C2=A0=C2=A0 *			goto error;
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0=C2=A0 *		ret =3D drm_exec_prepare_obj(&exec, boB, 1);
> > > > - *		drm_exec_retry_on_contention(&exec);
> > > > + *		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0 *		if (ret)
> > > > =C2=A0=C2=A0=C2=A0 *			goto error;
> > > > =C2=A0=C2=A0=C2=A0 *	}
> > > > @@ -48,7 +48,8 @@
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /* Dummy value used to initially enter the retry loop =
*/
> > > > -#define DRM_EXEC_DUMMY ((void *)~0)
> > > > +#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
> > > > +#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /* Unlock all objects and drop references */
> > > > =C2=A0=C2=A0 static void drm_exec_unlock_all(struct drm_exec *exec)
> > > > @@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec
> > > > *exec)
> > > > =C2=A0=C2=A0=C2=A0		return true;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0=20
> > > > -	drm_exec_unlock_all(exec);
> > > > -	exec->num_objects =3D 0;
> > > > +	exec->contended =3D NULL;
> > > > =C2=A0=C2=A0=C2=A0	return true;
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0 EXPORT_SYMBOL(drm_exec_cleanup);
> > > > @@ -194,6 +194,27 @@ static int drm_exec_lock_contended(struct
> > > > drm_exec *exec)
> > > > =C2=A0=C2=A0=C2=A0	return ret;
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > +/**
> > > > + * drm_exec_handle_contended() - Perform cleanup before a ww
> > > > transaction restart
> > > > + * @exec: Pointer to the drm_exec object.
> > > > + *
> > > > + * Unlocks all held resvs and re-locks the contended object.
> > > > + *
> > > > + * Return: 0 on success, negative error code on failure.
> > > > + */
> > > > +int drm_exec_handle_contended(struct drm_exec *exec)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	drm_exec_unlock_all(exec);
> > > > +	exec->num_objects =3D 0;
> > > > +	ret =3D drm_exec_lock_contended(exec);
> > > > +	exec->contended =3D DRM_EXEC_CONTENDED;
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_exec_handle_contended);
> > > > +
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * drm_exec_lock_obj - lock a GEM object for use
> > > > =C2=A0=C2=A0=C2=A0 * @exec: the drm_exec object with the state
> > > > @@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct drm_exec
> > > > *exec,
> > > > struct drm_gem_object *obj)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0	int ret;
> > > > =C2=A0=C2=A0=20
> > > > -	ret =3D drm_exec_lock_contended(exec);
> > > > -	if (unlikely(ret))
> > > > -		return ret;
> > > > -
> > > > =C2=A0=C2=A0=C2=A0	if (exec->prelocked =3D=3D obj) {
> > > > =C2=A0=C2=A0=C2=A0		drm_gem_object_put(exec->prelocked);
> > > > =C2=A0=C2=A0=C2=A0		exec->prelocked =3D NULL;
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > index f9eb56f24bef..0923d6ae18e2 100644
> > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > @@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct
> > > > drm_gpuvm_exec
> > > > *vm_exec)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_gpuvm_prepare_vm(gpuvm, exec,
> > > > num_fences);
> > > > -		drm_exec_retry_on_contention(exec);
> > > > +		ret =3D drm_exec_retry_on_contention(exec, ret);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			goto err;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_gpuvm_prepare_objects(gpuvm, exec,
> > > > num_fences);
> > > > -		drm_exec_retry_on_contention(exec);
> > > > +		ret =3D drm_exec_retry_on_contention(exec, ret);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			goto err;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		if (vm_exec->extra.fn) {
> > > > =C2=A0=C2=A0=C2=A0			ret =3D vm_exec->extra.fn(vm_exec);
> > > > -			drm_exec_retry_on_contention(exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0			if (ret)
> > > > =C2=A0=C2=A0=C2=A0				goto err;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > @@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct
> > > > drm_gpuvm_exec *vm_exec,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_gpuvm_prepare_range(gpuvm, exec,
> > > > addr,
> > > > range,
> > > > =C2=A0=C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm_exec-
> > > > > num_fences);
> > > > -		drm_exec_retry_on_contention(exec);
> > > > +		ret =3D drm_exec_retry_on_contention(exec, ret);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			goto err;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/imagination/pvr_job.c
> > > > b/drivers/gpu/drm/imagination/pvr_job.c
> > > > index 78c2f3c6dce0..6e0ce6c4576c 100644
> > > > --- a/drivers/gpu/drm/imagination/pvr_job.c
> > > > +++ b/drivers/gpu/drm/imagination/pvr_job.c
> > > > @@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct drm_exec
> > > > *exec, struct pvr_job_data *job_data,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(exec) {
> > > > =C2=A0=C2=A0=C2=A0		int err =3D jobs_lock_all_objs(exec, job_data,
> > > > job_count);
> > > > =C2=A0=C2=A0=20
> > > > -		drm_exec_retry_on_contention(exec);
> > > > +		err =3D drm_exec_retry_on_contention(exec, err);
> > > > =C2=A0=C2=A0=C2=A0		if (err)
> > > > =C2=A0=C2=A0=C2=A0			return err;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index fba78193127d..01992b43ea4b 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -259,7 +259,7 @@ static int submit_lock_objects(struct
> > > > msm_gem_submit *submit)
> > > > =C2=A0=C2=A0=C2=A0		for (unsigned i =3D 0; i < submit->nr_bos; i++)
> > > > {
> > > > =C2=A0=C2=A0=C2=A0			struct drm_gem_object *obj =3D submit-
> > > > > bos[i].obj;
> > > > =C2=A0=C2=A0=C2=A0			ret =3D drm_exec_prepare_obj(&submit-
> > > > >exec,
> > > > obj, 1);
> > > > -			drm_exec_retry_on_contention(&submit-
> > > > > exec);
> > > > +			ret =3D
> > > > drm_exec_retry_on_contention(&submit->exec, ret);
> > > > =C2=A0=C2=A0=C2=A0			if (ret)
> > > > =C2=A0=C2=A0=C2=A0				goto error;
> > > > =C2=A0=C2=A0=C2=A0		}
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > index ee02cd833c5e..0c871634fdfb 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > > @@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct
> > > > nouveau_job *job,
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(exec, vme->flags, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D bind_lock_validate(job, exec, vme-
> > > > > num_fences);
> > > > -		drm_exec_retry_on_contention(exec);
> > > > +		ret =3D drm_exec_retry_on_contention(exec, ret);
> > > > =C2=A0=C2=A0=C2=A0		if (ret) {
> > > > =C2=A0=C2=A0=C2=A0			op =3D list_last_op(&bind_job->ops);
> > > > =C2=A0=C2=A0=C2=A0			goto unwind;
> > > > diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
> > > > b/drivers/gpu/drm/tests/drm_exec_test.c
> > > > index 81f928a429ba..28558fdb08df 100644
> > > > --- a/drivers/gpu/drm/tests/drm_exec_test.c
> > > > +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> > > > @@ -63,7 +63,7 @@ static void test_lock(struct kunit *test)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT=
, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_lock_obj(&exec, &gobj);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		KUNIT_EXPECT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > @@ -83,14 +83,14 @@ static void test_lock_unlock(struct kunit
> > > > *test)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT=
, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_lock_obj(&exec, &gobj);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		KUNIT_EXPECT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		drm_exec_unlock_obj(&exec, &gobj);
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_lock_obj(&exec, &gobj);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		KUNIT_EXPECT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > @@ -110,13 +110,13 @@ static void test_duplicates(struct kunit
> > > > *test)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES,=
 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_lock_obj(&exec, &gobj);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		KUNIT_EXPECT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_lock_obj(&exec, &gobj);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		KUNIT_EXPECT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > @@ -137,7 +137,7 @@ static void test_prepare(struct kunit
> > > > *test)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT=
, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D drm_exec_prepare_obj(&exec, &gobj, 1);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		KUNIT_EXPECT_EQ(test, ret, 0);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 040dd142c49c..20ec1ab1b52d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -200,7 +200,7 @@ static int handle_pagefault(struct xe_gt
> > > > *gt,
> > > > struct pagefault *pf)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, 0, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D xe_pf_begin(&exec, vma, atomic, tile-
> > > > >id);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			goto unlock_dma_resv;
> > > > =C2=A0=C2=A0=20
> > > > @@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt *gt,
> > > > struct
> > > > acc *acc)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, 0, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		ret =3D xe_pf_begin(&exec, vma, true, tile->id)=
;
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		ret =3D drm_exec_retry_on_contention(&exec,
> > > > ret);
> > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index e2ec148c9c33..335524e803e7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -501,7 +501,7 @@ static void preempt_rebind_work_func(struct
> > > > work_struct *w)
> > > > =C2=A0=C2=A0=C2=A0		bool done =3D false;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		err =3D xe_preempt_work_begin(&exec, vm, &done)=
;
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		err =3D drm_exec_retry_on_contention(&exec,
> > > > err);
> > > > =C2=A0=C2=A0=C2=A0		if (err || done) {
> > > > =C2=A0=C2=A0=C2=A0			drm_exec_fini(&exec);
> > > > =C2=A0=C2=A0=C2=A0			if (err &&
> > > > xe_vm_validate_should_retry(&exec, err, &end))
> > > > @@ -1052,7 +1052,7 @@ static void
> > > > xe_vma_destroy_unlocked(struct
> > > > xe_vma *vma)
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_init(&exec, 0, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		err =3D xe_vm_lock_vma(&exec, vma);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		err =3D drm_exec_retry_on_contention(&exec,
> > > > err);
> > > > =C2=A0=C2=A0=C2=A0		if (XE_WARN_ON(err))
> > > > =C2=A0=C2=A0=C2=A0			break;
> > > > =C2=A0=C2=A0=C2=A0	}
> > > > @@ -2148,11 +2148,11 @@ static struct xe_vma *new_vma(struct
> > > > xe_vm
> > > > *vm, struct drm_gpuva_op_map *op,
> > > > =C2=A0=C2=A0=C2=A0			err =3D 0;
> > > > =C2=A0=C2=A0=C2=A0			if (!bo->vm) {
> > > > =C2=A0=C2=A0=C2=A0				err =3D drm_exec_lock_obj(&exec,
> > > > xe_vm_obj(vm));
> > > > -
> > > > 				drm_exec_retry_on_contention(&
> > > > exec);
> > > > +				err =3D
> > > > drm_exec_retry_on_contention(&exec, err);
> > > > =C2=A0=C2=A0=C2=A0			}
> > > > =C2=A0=C2=A0=C2=A0			if (!err) {
> > > > =C2=A0=C2=A0=C2=A0				err =3D drm_exec_lock_obj(&exec,
> > > > &bo->ttm.base);
> > > > -
> > > > 				drm_exec_retry_on_contention(&
> > > > exec);
> > > > +				err =3D
> > > > drm_exec_retry_on_contention(&exec, err);
> > > > =C2=A0=C2=A0=C2=A0			}
> > > > =C2=A0=C2=A0=C2=A0			if (err) {
> > > > =C2=A0=C2=A0=C2=A0				drm_exec_fini(&exec);
> > > > @@ -2884,7 +2884,7 @@ static int
> > > > vm_bind_ioctl_ops_execute(struct
> > > > xe_vm *vm,
> > > > =C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_EXEC_IGNORE_=
DUPLICATES, 0);
> > > > =C2=A0=C2=A0=C2=A0	drm_exec_until_all_locked(&exec) {
> > > > =C2=A0=C2=A0=C2=A0		err =3D vm_bind_ioctl_ops_lock_and_prep(&exec,
> > > > vm,
> > > > vops);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > +		err =3D drm_exec_retry_on_contention(&exec,
> > > > err);
> > > > =C2=A0=C2=A0=C2=A0		if (err)
> > > > =C2=A0=C2=A0=C2=A0			goto unlock;
> > > > =C2=A0=C2=A0=20
> > > > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > > > index aa786b828a0a..fafb40d96e38 100644
> > > > --- a/include/drm/drm_exec.h
> > > > +++ b/include/drm/drm_exec.h
> > > > @@ -51,6 +51,8 @@ struct drm_exec {
> > > > =C2=A0=C2=A0=C2=A0	struct drm_gem_object *prelocked;
> > > > =C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=20
> > > > +int drm_exec_handle_contended(struct drm_exec *exec);
> > > > +
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * drm_exec_obj() - Return the object for a give =
drm_exec
> > > > index
> > > > =C2=A0=C2=A0=C2=A0 * @exec: Pointer to the drm_exec context
> > > > @@ -113,15 +115,26 @@ __PASTE(__drm_exec_,
> > > > __LINE__):						\
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * drm_exec_retry_on_contention - restart the loo=
p to grap
> > > > all
> > > > locks
> > > > =C2=A0=C2=A0=C2=A0 * @exec: drm_exec object
> > > > + * @_ret: The current error status
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0=C2=A0 * Control flow helper to continue when a content=
ion was
> > > > detected
> > > > and we need to
> > > > =C2=A0=C2=A0=C2=A0 * clean up and re-start the loop to prepare all =
GEM
> > > > objects.
> > > > + *
> > > > + * Return: If no loop restart occurred: The error status.
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > -#define
> > > > drm_exec_retry_on_contention(exec)			\
> > > > -	do
> > > > {							\
> > > > -		if
> > > > (unlikely(drm_exec_is_contended(exec)))	\
> > > > -			goto
> > > > *__drm_exec_retry_ptr;		\
> > > > -	} while (0)
> > > > +#define drm_exec_retry_on_contention(exec,
> > > > _ret)			\
> > > > +	({					=09
> > > > =09
> > > > 	\
> > > > +		struct drm_exec *__exec =3D
> > > > (exec);			\
> > > > +		int __ret =3D
> > > > (_ret);					\
> > > > +						=09
> > > > =09
> > > > 	\
> > > > +		if (unlikely(drm_exec_is_contended(__exec)))
> > > > {		\
> > > > +			WARN_ON(__ret !=3D -
> > > > EDEADLK);			\
> > > > +			__ret =3D
> > > > drm_exec_handle_contended(__exec);	\
> > > > +			if
> > > > (!__ret)					\
> > > > +				goto
> > > > *__drm_exec_retry_ptr;		\
> > > > +		}				=09
> > > > =09
> > > > 	\
> > > > +		__ret;				=09
> > > > =09
> > > > 	\
> > > > +	})
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * drm_exec_is_contended - check for contention

