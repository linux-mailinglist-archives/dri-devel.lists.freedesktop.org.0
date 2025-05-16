Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317DAB968E
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88910E9A5;
	Fri, 16 May 2025 07:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bAnlNFe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1664A10E9A5;
 Fri, 16 May 2025 07:28:46 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZzJbW1VgNz9stM;
 Fri, 16 May 2025 09:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747380519; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orENF73Xi5Yr7JxnHNFVGOeZ3oFYGeGfA38jWLh4UA4=;
 b=bAnlNFe/eXprU433znu6uOvFBglvBtH5NHYg1FqZfumXqhkCPAG6BCQ/MlmgIYwd2gvsEg
 4yAApdwKum+NaOtq6PBhqEi7UpoDTEWCmj0hxSL8BoC8dWCwnW+H1qLdC2T4SE9AaeUbd6
 BxudHr8c9Y0Oik5OPczDVR8+zlXhaifA6p1sgDB59m/izKAtoyjWG1LkeFU/0Goah3yk86
 6wo9r/NZWB2WqLs0RpQQRhwPzLPj9soDRVX8yGRA44SmiEZeCzljpEgMhIXRaS4uchktg3
 9Gc2NGWnyYm0ffdm5VBWF10CmcCYZYl2LVVerk1gxG9Q3EoXNxsjFt97GworlA==
Message-ID: <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,  dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Date: Fri, 16 May 2025 09:28:37 +0200
In-Reply-To: <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: s549f7b19mahrq91839xep4hk3d16ye9
X-MBO-RS-ID: 14e9d31f9e02eb17f78
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

On Thu, 2025-05-15 at 17:17 +0100, Tvrtko Ursulin wrote:
>=20
> On 15/05/2025 16:00, Christian K=C3=B6nig wrote:
> > Sometimes drivers need to be able to submit multiple jobs which
> > depend on
> > each other to different schedulers at the same time, but using
> > drm_sched_job_add_dependency() can't fail any more after the first
> > job is
> > initialized.
> >=20
> > This function preallocate memory for dependency slots so that no
> > ENOMEM
> > can come later while adding dependencies.
> >=20
> > v2: rework implementation an documentation
> > v3: rework from scratch, use separate function to add preallocated
> > deps

I think we agreed to not put change logs into commit messages anymore
:)

They aren't useful for any reader. Who needs the changelog afterwards
can retreive it through the mail thread link that we add.

> >=20
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 45
> > ++++++++++++++++++++++++++
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> > =C2=A0 2 files changed, 49 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index f7118497e47a..b95e7089aa70 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct drm_sched_job
> > *job)
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_job_arm);
> > =C2=A0=20
> > +/**
> > + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on adding
> > dependencies
> > + * @job: scheduler job where dependencies will be added
> > + * @id: id for the allocated slot
> > +=C2=A0 *
> > + * Sometimes drivers need to be able to submit multiple jobs which
> > depend on
> > + * each other to different schedulers at the same time, but using
> > + * drm_sched_job_add_dependency() can't fail any more after the
> > first job is
> > + * initialized.
> > + *
> > + * This function preallocate memory for a dependency slot so that
> > no ENOMEM can
> > + * come later while adding dependencies. The index of the
> > preallocated slot is
> > + * returned in @id.
> > + *
> > + * Return:
> > + * 0 on success, or an error on failing to expand the array.
> > + */
> > +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job
> > *job,
> > +					=C2=A0=C2=A0 u32 *id)
> > +{
> > +	return xa_alloc(&job->dependencies, id, NULL,
> > xa_limit_32b, GFP_KERNEL);
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
> > +
> > +/**
> > + * drm_sched_job_add_prealloc_dep - add dependency to preallocated
> > slot
> > + * @job: scheduler job where dependencies will be added
> > + * @id: the preallocated slot index
> > + * @fence: the dependency to add
> > + *
> > + * Consumes @fence and adds it to the preallocated slot
> > dependency.
> > + */
> > +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32
> > id,
> > +				=C2=A0=C2=A0=C2=A0 struct dma_fence *fence)
> > +{
> > +	fence =3D xa_store(&job->dependencies, id, fence,
> > GFP_ATOMIC);
>=20
> Add assert that the passed id exists (was preallocated) and is NULL?

You=20

>=20
> Also, if someone preallocates and does not consume the slot will that
> confuse the iteration in drm_sched_job_dependency()?

drm_sched_job_add_dependency() you mean.

Yes, it would. All operations simply give you NULL for those slots. So
seems to me you have to check for NULL wherever a preallocated slot
might drop out. That would then be a bug.

It's kind of tricky, all that. It's a pity that Wilcox didn't answer
our questions about the idiomatic way to do it.

Maybe reserving slots with already signaled fences wasn't such a bad
idea after all?

If we go for the NULL approach, it's probably the only sane way to then
check for NULL wherever dependencies are accessed :(

Opinions?

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > +	/*
> > +	 * Be defensive just in case driver messed it up and used
> > preallocated
> > +	 * slot twice.
> > +	 */
> > +	if (WARN_ON(fence))
> > +		dma_fence_put(fence);
> > +}
> > +EXPORT_SYMBOL(drm_sched_job_add_prealloc_dep);
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_job_add_dependency - adds the fence as a job
> > dependency
> > =C2=A0=C2=A0 * @job: scheduler job to add the dependencies to
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index d860db087ea5..0286e0934317 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -632,6 +632,10 @@ int drm_sched_job_init(struct drm_sched_job
> > *job,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *o=
wner);
> > =C2=A0 void drm_sched_job_arm(struct drm_sched_job *job);
> > =C2=A0 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> > +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job
> > *job,
> > +					=C2=A0=C2=A0 u32 *id);
> > +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32
> > id,
> > +				=C2=A0=C2=A0=C2=A0 struct dma_fence *fence);
> > =C2=A0 int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > =C2=A0=C2=A0				 struct dma_fence *fence);
> > =C2=A0 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job
> > *job,
>=20

