Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2810A880C5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 14:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4213810E5A2;
	Mon, 14 Apr 2025 12:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GcTC8O6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531DF10E5A2;
 Mon, 14 Apr 2025 12:49:02 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZbnCt1JYcz9tWk;
 Mon, 14 Apr 2025 14:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744634938; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faT4q+fQ4Hn37MPBwMk9K8OzFUqq0CdDFuY4LhelCJo=;
 b=GcTC8O6XiFxnvo5i11DnEUNzsVokGmJSpuYuPw7dEUVOFdFGL20bfDiQ7ZP350hoi2KFO9
 MmfsQ43JbykkJT2etGtPqR7hp00D5kBj2BeoDvdxJ8FRI83wiibMJYunueyjuXZ2cbaPMm
 gSyPIIbMVqd1i7JAhWUSwSyujUWuWkx2mZNyCXdxLZQ8UnR/GIp8cqdvBvEYcHWCBT96fX
 pCDweewVRaxQQF+5sabKV7jgV7t9WWW8bdxSKyb2Y8Pte5xuIkY8Yuy2ss/DQTR+St+bZy
 fpOd0fzbS48oQIdrDz09QRo+DQ8ng1p/vWm1O11mSAghd/maXedn3ff5j/Qoag==
Message-ID: <7c86f63ae8a9d1ad45f768cc4535d277d422dc81.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
From: Philipp Stanner <phasta@mailbox.org>
To: phasta@kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, tvrtko.ursulin@igalia.com,
 dakr@kernel.org,  dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Matthew Wilcox <willy@infradead.org>
Date: Mon, 14 Apr 2025 14:48:54 +0200
In-Reply-To: <4c5d9342b8e2e04c3928ebba003d4f9ab06659b0.camel@mailbox.org>
References: <20250321155852.15162-1-christian.koenig@amd.com>
 <867c3abac8a222fa42921a6725e85fe459bc9d5e.camel@mailbox.org>
 <c2ed3d7e-d5c3-4d74-8365-fdb3f46f6a3a@gmail.com>
 <4c5d9342b8e2e04c3928ebba003d4f9ab06659b0.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 8j8ipn9ahks6aa3g47761d4h5gpa1hbz
X-MBO-RS-ID: 29596a4485cf1dbd468
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-04-09 at 16:04 +0200, Philipp Stanner wrote:
> +Cc Matthew
>=20
> On Wed, 2025-04-09 at 15:55 +0200, Christian K=C3=B6nig wrote:
> > Am 09.04.25 um 12:28 schrieb Philipp Stanner:
> > > On Fri, 2025-03-21 at 16:58 +0100, Christian K=C3=B6nig wrote:
> > > > Sometimes drivers need to be able to submit multiple jobs which
> > > > depend on
> > > > each other to different schedulers at the same time, but using
> > > > drm_sched_job_add_dependency() can't fail any more after the
> > > > first
> > > > job is
> > > > initialized.
> > > >=20
> > > > This function preallocate memory for dependency slots so that
> > > > no
> > > > ENOMEM
> > > > can come later while adding dependencies.
> > > >=20
> > > > v2: rework implementation an documentation
> > > >=20
> > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 44
> > > > ++++++++++++++++++++++++--
> > > > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > > > =C2=A02 files changed, 43 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 4d4219fbe49d..ee3701f346b2 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -852,6 +852,39 @@ void drm_sched_job_arm(struct
> > > > drm_sched_job
> > > > *job)
> > > > =C2=A0}
> > > > =C2=A0EXPORT_SYMBOL(drm_sched_job_arm);
> > > > =C2=A0
> > > > +/**
> > > > + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on
> > > > adding
> > > > dependencies
> > > > + * @job: scheduler job where dependencies will be added
> > > > + * @num_deps: number of dependencies to preallocate slots for
> > > > +=C2=A0 *
> > > > + * Sometimes drivers need to be able to submit multiple jobs
> > > > which
> > > > depend on
> > > > + * each other to different schedulers at the same time, but
> > > > using
> > > > + * drm_sched_job_add_dependency() can't fail any more after
> > > > the
> > > > first job is
> > > > + * initialized.
> > > > + *
> > > > + * This function preallocate memory for dependency slots so
> > > > that
> > > > no
> > > > ENOMEM can
> > > > + * come later while adding dependencies.
> > > > + *
> > > > + * Return:
> > > > + * 0 on success, or an error on failing to expand the array.
> > > > + */
> > > > +int drm_sched_job_prealloc_dependency_slots(struct
> > > > drm_sched_job
> > > > *job,
> > > > +					=C2=A0=C2=A0=C2=A0 unsigned int
> > > > num_deps)
> > > > +{
> > > > +	u32 id =3D 0;
> > > > +	int ret;
> > > > +
> > > > +	while (num_deps--) {
> > > > +		ret =3D xa_alloc(&job->dependencies, &id,
> > > > XA_ZERO_ENTRY,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xa_limit_32b, GFP_KERNEL);
> > > I've had some time to re-read the xarray documentation and I
> > > think
> > > that
> > > this is what xa_reserve() was born for. The Book of
> > > Documentation/core-
> > > api/xarray.rst sayeth:
> > >=20
> > > "Sometimes you need to ensure that a subsequent call to
> > > xa_store()
> > > will not need to allocate memory.=C2=A0 The xa_reserve() function
> > > will store a reserved entry at the indicated index.=C2=A0 Users of th=
e
> > > normal API will see this entry as containing ``NULL``."
> > >=20
> > > That's far better, this way we don't have to use that more or
> > > less
> > > xarray-internal flag.

I've tried to look through the code and think it through=E2=80=A6

> >=20
> > Yeah I have seen that as well. The reason why I didn't followed
> > this
> > route was that I wasn't sure if I then need to check for NULL
> > entries
> > while iterating over the XA.

AFAICS, when you use xa_reserve(), xa_load() and xa_for_each() will
return NULL for the reserved entries =E2=80=93 therefore potentially blowin=
g up
the scheduler without NULL checks, when someone uses the new prealloc
function without actually filling in the dependencies later.
At least the documentation says so:

"The xa_reserve() function will store a reserved entry at the indicated
index.  Users of the normal API will see this entry as containing
``NULL``."

So that's definitely not a good idea.


BUT the same seems to be the case for xa_alloc(=E2=80=A6, XA_ZERO_ENTRY, =
=E2=80=A6)?

xa_load() will *definitely* return NULL, since it utilizes
xa_zero_to_null(). We have one use, in sched_entity.c. That use should
only ever evaluate a valid dependency, so can't realistically speaking
be NULL.

So the more interesting question is how, xa_for_each(), our main work
horse, behaves. It uses xa_find(), which uses xas_find(), which=E2=80=A6 se=
ems
to be OK?

xa_find()'s docu says:
"* Return: The entry, if found, otherwise %NULL."

???

I agree we should aim for documenting that better. It could also make
sense to _consider_ changing xa_for_each() so that it doesn't return
reserved entries, but only 'used' entries.


P.


> >=20
> > Additional to that I couldn't figure out of hand how to determine a
> > the next free index slot.
> >=20
> > Have you found any example how to use that? I mean the
> > documentation
> > could certainly be improved a bit.
>=20
> Maybe Matthew can help us out here?
>=20
> Matthew, what would be the idiomatic way to do this, and can we help
> out with improving the Xarray's documentation?
>=20
> Thx,
> P.
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > >=20
> > >=20
> > > > +		if (ret !=3D 0)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
> > > > +
> > > > =C2=A0/**
> > > > =C2=A0 * drm_sched_job_add_dependency - adds the fence as a job
> > > > dependency
> > > > =C2=A0 * @job: scheduler job to add the dependencies to
> > > > @@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct
> > > > drm_sched_job *job,
> > > > =C2=A0	 * engines involved, rather than the number of BOs.
> > > > =C2=A0	 */
> > > > =C2=A0	xa_for_each(&job->dependencies, index, entry) {
> > > > -		if (entry->context !=3D fence->context)
> > > > +		if (xa_is_zero(entry)) {
> > > > +			/*
> > > > +			 * Reserved entries must not alloc
> > > > memory,
> > > > but let's
> > > > +			 * use GFP_ATOMIC just to be on the
> > > > defensive side.
> > > > +			*/
> > > > +			xa_store(&job->dependencies, index,
> > > > fence,
> > > > GFP_ATOMIC);
> > > And regarding this =E2=80=93 it can actually never happen, but you
> > > provide
> > > ATOMIC just to be sure?
> > >=20
> > > I think it would be better if we'd just run into an obvious bug
> > > here
> > > instead, so like a deadlock with GFP_KERNEL.
> > >=20
> > > That's how we do it with pointers that cannot be NULL, too. If
> > > the
> > > impossible were to happen and it were NULL, we'd crash.
> > >=20
> > > P.
> > >=20
> > > > +		} else if (entry->context !=3D fence->context) {
> > > > =C2=A0			continue;
> > > > -
> > > > -		if (dma_fence_is_later(fence, entry)) {
> > > > +		} else if (dma_fence_is_later(fence, entry)) {
> > > > =C2=A0			dma_fence_put(entry);
> > > > =C2=A0			xa_store(&job->dependencies, index,
> > > > fence,
> > > > GFP_KERNEL);
> > > > =C2=A0		} else {
> > > > diff --git a/include/drm/gpu_scheduler.h
> > > > b/include/drm/gpu_scheduler.h
> > > > index 1a7e377d4cbb..916e820b27ff 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job
> > > > *job,
> > > > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *own=
er);
> > > > =C2=A0void drm_sched_job_arm(struct drm_sched_job *job);
> > > > =C2=A0void drm_sched_entity_push_job(struct drm_sched_job
> > > > *sched_job);
> > > > +int drm_sched_job_prealloc_dependency_slots(struct
> > > > drm_sched_job
> > > > *job,
> > > > +					=C2=A0=C2=A0=C2=A0 unsigned int
> > > > num_deps);
> > > > =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > > > =C2=A0				 struct dma_fence *fence);
> > > > =C2=A0int drm_sched_job_add_syncobj_dependency(struct drm_sched_job
> > > > *job,
> >=20
>=20

