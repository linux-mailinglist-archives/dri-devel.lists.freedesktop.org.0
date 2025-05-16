Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803BAB9DAB
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 15:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642510EABC;
	Fri, 16 May 2025 13:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iVpZ0tlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F74D10EABC;
 Fri, 16 May 2025 13:38:33 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZzSpC6pbsz9stp;
 Fri, 16 May 2025 15:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747402708; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynZX+jbx5PtIxuVuU724rkfw45EIE4frtPVN1GJr46k=;
 b=iVpZ0tlBlEallv4txbYxhGkmlzL44dNeJKdwBISKBcQNS0c7BDWUjCBl0ci2nBMTictYW0
 syCFWVIXq+q8klbInvX7jidz41f3ftltOIEAgIksB1anHcoiCLXYdQMM8zck8iCXG45JA9
 w4llYeIvRnEXL5+2adU1F4VtKZrJr1p1+8StqJLZdVwV6Z4aTMYfNQoDwBJFdJJ/dJrKmf
 qlfBe2XUCRuTFkMKKBkFIPZw1+pXLNVzURYHNP6zDpVlxuftT2sdKCWUuamvrijTjwKRdS
 XcQtKxeKheYbBfns+li0wzgyTITRQBKnJWH2SAVq/kvawjBRr+FH9WzUGNihVg==
Message-ID: <fc617b712c5937c02be89f7ba068ce0de1512027.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 amd-gfx@lists.freedesktop.org
Date: Fri, 16 May 2025 15:38:25 +0200
In-Reply-To: <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
 <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
 <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 2e758a28f01a70e803f
X-MBO-RS-META: pg1d3wzd3foequ5mcryf89tos3ns9hq8
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

On Fri, 2025-05-16 at 13:10 +0100, Tvrtko Ursulin wrote:
>=20
> On 16/05/2025 12:53, Tvrtko Ursulin wrote:
> >=20
> > On 16/05/2025 08:28, Philipp Stanner wrote:
> > > On Thu, 2025-05-15 at 17:17 +0100, Tvrtko Ursulin wrote:
> > > >=20
> > > > On 15/05/2025 16:00, Christian K=C3=B6nig wrote:
> > > > > Sometimes drivers need to be able to submit multiple jobs
> > > > > which
> > > > > depend on
> > > > > each other to different schedulers at the same time, but
> > > > > using
> > > > > drm_sched_job_add_dependency() can't fail any more after the
> > > > > first
> > > > > job is
> > > > > initialized.
> > > > >=20
> > > > > This function preallocate memory for dependency slots so that
> > > > > no
> > > > > ENOMEM
> > > > > can come later while adding dependencies.
> > > > >=20
> > > > > v2: rework implementation an documentation
> > > > > v3: rework from scratch, use separate function to add
> > > > > preallocated
> > > > > deps
> > >=20
> > > I think we agreed to not put change logs into commit messages
> > > anymore
> > > :)
> > >=20
> > > They aren't useful for any reader. Who needs the changelog
> > > afterwards
> > > can retreive it through the mail thread link that we add.
> > >=20
> > > > >=20
> > > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > ---
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 45
> > > > > ++++++++++++++++++++++++++
> > > > > =C2=A0=C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> > > > > =C2=A0=C2=A0 2 files changed, 49 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index f7118497e47a..b95e7089aa70 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct
> > > > > drm_sched_job
> > > > > *job)
> > > > > =C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0 EXPORT_SYMBOL(drm_sched_job_arm);
> > > > > +/**
> > > > > + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on
> > > > > adding
> > > > > dependencies
> > > > > + * @job: scheduler job where dependencies will be added
> > > > > + * @id: id for the allocated slot
> > > > > +=C2=A0 *
> > > > > + * Sometimes drivers need to be able to submit multiple jobs
> > > > > which
> > > > > depend on
> > > > > + * each other to different schedulers at the same time, but
> > > > > using
> > > > > + * drm_sched_job_add_dependency() can't fail any more after
> > > > > the
> > > > > first job is
> > > > > + * initialized.
> > > > > + *
> > > > > + * This function preallocate memory for a dependency slot so
> > > > > that
> > > > > no ENOMEM can
> > > > > + * come later while adding dependencies. The index of the
> > > > > preallocated slot is
> > > > > + * returned in @id.
> > > > > + *
> > > > > + * Return:
> > > > > + * 0 on success, or an error on failing to expand the array.
> > > > > + */
> > > > > +int drm_sched_job_prealloc_dependency_slot(struct
> > > > > drm_sched_job
> > > > > *job,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 u32 *id)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 return xa_alloc(&job->dependencies, id, NULL,
> > > > > xa_limit_32b, GFP_KERNEL);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
> > > > > +
> > > > > +/**
> > > > > + * drm_sched_job_add_prealloc_dep - add dependency to
> > > > > preallocated
> > > > > slot
> > > > > + * @job: scheduler job where dependencies will be added
> > > > > + * @id: the preallocated slot index
> > > > > + * @fence: the dependency to add
> > > > > + *
> > > > > + * Consumes @fence and adds it to the preallocated slot
> > > > > dependency.
> > > > > + */
> > > > > +void drm_sched_job_add_prealloc_dep(struct drm_sched_job
> > > > > *job, u32
> > > > > id,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct dma_fence *fence)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 fence =3D xa_store(&job->dependencies, id, fe=
nce,
> > > > > GFP_ATOMIC);
> > > >=20
> > > > Add assert that the passed id exists (was preallocated) and is
> > > > NULL?
> > >=20
> > > You
> >=20
> > Hm?
> >=20
> > > >=20
> > > > Also, if someone preallocates and does not consume the slot
> > > > will that
> > > > confuse the iteration in drm_sched_job_dependency()?
> > >=20
> > > drm_sched_job_add_dependency() you mean.
> >=20
> > I was actually thinking of drm_sched_job_dependency() because that=20
> > looked it would skip dependencies upon encountering an unconsumed=20
> > preallocated slot, but yes, drm_sched_job_add_dependency() could
> > explode=20
> > even earlier if adding a normal dependency after preallocating a
> > slot.
> >=20
> > > Yes, it would. All operations simply give you NULL for those
> > > slots. So
> > > seems to me you have to check for NULL wherever a preallocated
> > > slot
> > > might drop out. That would then be a bug.
> > >=20
> > > It's kind of tricky, all that. It's a pity that Wilcox didn't
> > > answer
> > > our questions about the idiomatic way to do it.
> > >=20
> > > Maybe reserving slots with already signaled fences wasn't such a
> > > bad
> > > idea after all?
> > >=20
> > > If we go for the NULL approach, it's probably the only sane way
> > > to then
> > > check for NULL wherever dependencies are accessed :(
> > >=20
> > > Opinions?
> >=20
> > Well if the xarray API returns the NULL consistently the approach
> > from=20
> > this patch is fine I think.
> >=20
> > We just need to add two more checks to the above mentioned
> > functions,=20
>=20
> I need to correct myself, drm_sched_job_dependency() wouldn't be able
> to=20
> just skip NULLs since it relies on NULL for "no more dependencies".
> We=20
> would need to track something like job->max_dependency and terminate
> on=20
> job->last_dependency > job->max_dependency or so.

Agreed, that would have to be fixed.

I believe we should reconsider Christian's first idea [1].

Thinking about it some more:
 * With the NULL version, suddenly the xarray containing only valid
   dependencies can sometimes contain NULL entries.
 * If we could create our own tag, entries could be returned that were
   neither NULL nor valid fences, also requiring checks 'everywhere'.
 * Only the "signaled fence as prealloc reservation" approach is fully
   backwards compatible and will never cause anyone to block after
   later reworks.

So maybe it's actually the best idea?

Sorry for the zigg-zagg. No hard requirements intended from my side,
I'm willing to go with what you guys think.

Just saying, at least now I think that the already-signaled fence seems
the most elegant solution. And since there's a function
(dma_fence_get_stub()) for that, it seems to be in alignment with
official dma_fence rules.


Philipp


[1]https://lore.kernel.org/all/20250318120313.19099-2-christian.koenig@amd.=
com/


>=20
> Regards,
>=20
> Tvrtko
>=20
> > some more unit tests probably to make sure, and that should be fine
> > for=20
> > now.
> >=20
> > On the bikeshedding front I would perhaps suggest:
> >=20
> > =C2=A0=C2=A0- drm_sched_job_preallocate_dependency()
> > =C2=A0=C2=A0- drm_sched_job_replace_dependency()
> >=20
> > Reads a little bit more aligned with the rest of the API and a bit=20
> > easier on the eyes, to my eyes at least.
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
>=20

