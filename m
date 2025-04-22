Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2FA95DBB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 08:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152D610E4F8;
	Tue, 22 Apr 2025 06:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="l+I7zL3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DF210E4F8;
 Tue, 22 Apr 2025 06:06:58 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZhWwB01d8z9tPV;
 Tue, 22 Apr 2025 08:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745302010; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1jZD+v9jZ5SL+C90xvRLg9FRt965u7OFTZRywGcFbA=;
 b=l+I7zL3twFrFfIGwtd8JTYCXEeKTzfRSEBubgvNdAg6Bva4cfNd4H6/ZaIyJlkC9qKpW5I
 gE1NbYPrcFZ2F6IR/1+j1AloTnKDqW2iiRTEATYejSo15e2jo/AAjAIiRwwdThYIDjWp9b
 QNzpjqTE8LI4lpelOuUsUAPw09eTBn3BaCob2gxgToBaJodznPdP2HJwGulNzWSuVud2jf
 8SBMP+7uHb5P/UkglxgdD0np2pfg5nO+ghjHOKLSGvdL0lfpvI53DA9nMCM0T+3ywpQb1l
 VMg5e2SkuaOgJo6DyLtgw0uP9jFGDTvUACQDHnyZdMGz2kIw1NM1c/u8T0fkUQ==
Message-ID: <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 08:06:45 +0200
In-Reply-To: <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 64e533af7fffcac7850
X-MBO-RS-META: fdf3e1ef6pt6kftcik8dofmitmo8mc8j
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

On Thu, 2025-04-17 at 17:08 +0100, Tvrtko Ursulin wrote:
>=20
> On 17/04/2025 15:48, Danilo Krummrich wrote:
> > On Thu, Apr 17, 2025 at 03:20:44PM +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 17/04/2025 13:11, Danilo Krummrich wrote:
> > > > On Thu, Apr 17, 2025 at 12:27:29PM +0100, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 17/04/2025 08:45, Philipp Stanner wrote:
> > > > > > On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> > > > >=20
> > > > > Problem exactly is that jobs can outlive the entities and the
> > > > > scheduler,
> > > > > while some userspace may have a dma fence reference to the
> > > > > job via sync
> > > > > file. This new callback would not solve it for xe, but if
> > > > > everything
> > > > > required was reference counted it would.
> > > >=20
> > > > I think you're mixing up the job and the dma_fence here, if a
> > > > job outlives the
> > > > scheduler, it clearly is a bug, always has been.
> > > >=20
> > > > AFAIK, Xe reference counts it's driver specific job structures
> > > > *and* the driver
> > > > specific scheduler structure, such that drm_sched_fini() won't
> > > > be called before
> > > > all jobs have finished.
> > >=20
> > > Yes, sorry, dma fence. But it is not enough to postpone
> > > drm_sched_fini until
> > > the job is not finished. Problem is exported dma fence holds the
> > > pointer to
> > > drm_sched_fence (and so oopses in
> > > drm_sched_fence_get_timeline_name on
> > > fence->sched->name) *after* job had finished and driver was free
> > > to tear
> > > everything down.
> >=20
> > Well, that's a bug in drm_sched_fence then and independent from the
> > other topic.
> > Once the finished fence in a struct drm_sched_fence has been
> > signaled it must
> > live independent of the scheduler.
> >=20
> > The lifetime of the drm_sched_fence is entirely independent from
> > the scheduler
> > itself, as you correctly point out.
>=20
> Connection (re. independent or not) I made was *if* drm_sched would
> be=20
> reference counted, would that satisfy both the requirement to keep=20
> working drm_sched_fence_get_timeline_name and to allow a different=20
> flavour of the memory leak fix.
>=20
> I agree drm_sched_fence_get_timeline_name can also be fixed by
> removing=20
> the fence->sched dereference and losing the (pretty) name.
> Historically=20
> there has been a lot of trouble with those names so maybe that would
> be=20
> acceptable.
>=20
> Revoking s_fence->sched on job completion as an alternative does not=20
> sound feasible.
>=20
> To further complicate matters, I suspect rmmod gpu-sched.ko is also=20
> something which would break exported fences since that would remove
> the=20
> fence ops. But that is solvable by module_get/put().

Is it a common kernel policy to be immune against crazy people just
calling rmmod on central, shared kernel infrastructure?

We cannot protect people from everything, especially from themselves.

>=20
> > Starting to reference count things to keep the whole scheduler etc.
> > alive as
> > long as the drm_sched_fence lives is not the correct solution.
>=20
> To catch up on why if you could dig out the links to past discussions
> it=20
> would be helpful.
>=20
> I repeat how there is a lot of attractiveness to reference counting.=20
> Already mentioned memory leak, s_fence oops, and also not having to=20
> clear job->entity could be useful for things like tracking per entity
> submission stats (imagine CFS like scheduling, generic scheduling DRM
> cgroup controller). So it would be good for me to hear what pitfalls=20
> were identified in this space.

Reference counting does _appear_ attractive, but our (mostly internal)
attempts and discussions revealed that it's not feasable.

There was an RFC by me about it last year, but it was incomplete and
few people reacted:

https://lore.kernel.org/dri-devel/20240903094531.29893-2-pstanner@redhat.co=
m/

When you try to implement refcounting, you quickly discover that it's
not enough if submitted jobs refcount the scheduler.

If the scheduler is refcounted, this means that it can now outlive the
driver. This means that it can continue calling into the driver with
run_job(), free_job(), timedout_job() and so on.

Since this would fire 500 million UAFs, you, hence, now would have to
guard *all* drivers' callbacks in some way against the driver being
unloaded. You might even end up having to refcount thinks like entire
modules, depending on the driver.


So effectively, with refcounting, you would fix a problem in central
infrastructure (the scheduler) in all users (the driver) =E2=80=93 therefor=
e,
you would not fix the problem at all, but just work around the
scheduler being broken in the drivers. IOW, everything would be exactly
as it is now, where everyone works around the problem in their own way.
Nouveau uses its redundant pending list, Xe refcounts and amdgpu does=E2=80=
=A6=E2=80=A6
IDK, things.


Another problem is the kernel workflow and kernel politics. The
solution I propose here allows for phasing the problem out, first in
Nouveau, then step by step others. It's the only minimalist backward-
compatible solution I can see.


That said, if you have the capacity to look deeper into a refcount
solution, feel free to go for it. But you'd have to find a way to solve
it in a centralized manner, otherwise we could just leave everything
be.


>=20
> > > > Multiple solutions have been discussed already, e.g. just wait
> > > > for the pending
> > > > list to be empty, reference count the scheduler for every
> > > > pending job. Those all
> > > > had significant downsides, which I don't see with this
> > > > proposal.
> > > >=20
> > > > I'm all for better ideas though -- what do you propose?
> > >=20
> > > I think we need to brainstorm both issues and see if there is a
> > > solution
> > > which solves them both, with bonus points for being elegant.
> >=20
> > The problems are not related. As mentioned above, once signaled a
> > drm_sched_fence must not depend on the scheduler any longer.
> >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index 6b72278c4b72..ae3152beca14 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct
> > > > > > > drm_gpu_scheduler
> > > > > > > *sched)
> > > > > > > =C2=A0=C2=A0 =C2=A0 sched->ready =3D false;
> > > > > > > =C2=A0=C2=A0 =C2=A0 kfree(sched->sched_rq);
> > > > > > > =C2=A0=C2=A0 =C2=A0 sched->sched_rq =3D NULL;
> > > > > > > +
> > > > > > > + if (!list_empty(&sched->pending_list))
> > > > > > > + dev_err(sched->dev, "%s: Tearing down scheduler
> > > > > > > while jobs are pending!\n",
> > > > > > > + __func__);
> > > > >=20
> > > > > It isn't fair to add this error since it would out of the
> > > > > blue start firing
> > > > > for everyone expect nouveau, no? Regardless if there is a
> > > > > leak or not.
> > > >=20
> > > > I think it is pretty fair to warn when detecting a guaranteed
> > > > bug, no?
> > > >=20
> > > > If drm_sched_fini() is call while jobs are still on the
> > > > pending_list, they won't
> > > > ever be freed, because all workqueues are stopped.
> > >=20
> > > Is it a guaranteed bug for drivers are aware of the
> > > drm_sched_fini()
> > > limitation and are cleaning up upon themselves?
> >=20
> > How could a driver clean up on itself (unless the driver holds its
> > own list of
> > pending jobs)?
> >=20
> > Once a job is in flight (i.e. it's on the pending_list) we must
> > guarantee that
> > free_job() is called by the scheduler, which it can't do if we call
> > drm_sched_fini() before the pending_list is empty.
> >=20
> > > In other words if you apply the series up to here would it
> > > trigger for
> > > nouveau?
> >=20
> > No, because nouveau does something very stupid, i.e. replicate the
> > pending_list.
>=20
> Ah okay I see it now, it waits for all jobs to finish before calling=20
> drm_sched_fini(). For some reason I did not think it was doing that=20
> given the cover letter starts with how that is a big no-no.
>=20
> > > Reportedly it triggers for the mock scheduler which also has no
> > > leak.
> >=20
> > That sounds impossible. How do you ensure you do *not* leak memory
> > when you tear
> > down the scheduler while it still has pending jobs? Or in other
> > words, who calls
> > free_job() if not the scheduler itself?
>=20
> Well the cover letter says it triggers so it is possible. :)

Where does it say that?

I mean, the warning would trigger if a driver is leaking jobs, which is
clearly a bug (and since a list is leaked, it might then even be a
false-negative in kmemleak).

It's actually quite simple:
   1. jobs are being freed by free_job()
   2. If you call drm_sched_fini(), the work item for free_job() gets
      deactivated.
   3. Depending on the load (race), you leak the jobs.

That's not that much of a problem for hardware schedulers, but firmware
schedulers who tear down scheduler instances all the time could leak
quite some amount of memory over time.

I can't see why a warning print would ever be bad there. Even Christian
wants it.

P.

>=20
> Mock scheduler also tracks the pending jobs itself, but different
> from=20
> nouveau it does not wait for jobs to finish and free worker to
> process=20
> them all, but having stopped the "hw" backend it cancels them and
> calls=20
> the free_job vfunc directly.
>=20
> Going back to the topic of this series, if we go with a solution
> along=20
> the lines of the proposed, I wonder if it would be doable without=20
> mandating that drivers keep a list parallel to pending_list. Instead=20
> have a vfunc DRM scheduler would call to cancel job at a time from
> *its*=20
> pending list. It would go nicely together with
> prepare/run/timedout/free.
>=20
> Would it allow getting rid of the new state machinery and just=20
> cancelling and freeing in one go directly from drm_sched_fini()?
>=20
> Regards,
>=20
> Tvrtko
>=20
> > > Also, I asked in my initial reply if we have a list of which of
> > > the current
> > > drivers suffer from memory leaks. Is it all or some etc.
> >=20
> > Not all, but quite some I think. The last time I looked (which is
> > about a year
> > ago) amdgpu for instance could leak memory when you unbind the
> > driver while
> > enough jobs are in flight.
>=20

