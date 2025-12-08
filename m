Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D79CACE39
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6810E2D5;
	Mon,  8 Dec 2025 10:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PtijsJpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE77B10E2D5;
 Mon,  8 Dec 2025 10:35:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dPz093KKGz9snt;
 Mon,  8 Dec 2025 11:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765190137; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqnvxhxBiEdB7VxuGtLQBL8eYjZgKLbWm3XMKfQgcQI=;
 b=PtijsJpKi4oOt3Ctz4YbuKPnDsip71SbK7XW3JGCgLYRFtklOADW+BZ4Gf0xwU9WN0A0HO
 QZ58IZVbF1NwfHqGYvZcNH6rSmPHI4ZcMhvF3gHBg02g3F6s7iSrpLWTaNmu7e1TIcPkzs
 n6i15814ayS91PabkyWWGWthtvt4IzHkuJLSLS+nE+nz906X7R7CINKRfdm3z/SaWekzhS
 wb0CiYb+R8C6ZcvuEGKAk0lOT1W+fLmI/1F6TETMBSCS0ynaAaYhYa4VrK9JqDytjkU7FL
 0i5/wuTEMiTJ1TYKpg8WXRTrsc+dq20HxBdjJpzfsvbTOyiqkoTOB8R33BFkXw==
Message-ID: <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: phasta@kernel.org, vitaly.prosyak@amd.com,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org, Alex
 Deucher <alexander.deucher@amd.com>,  dakr@kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 08 Dec 2025 11:35:33 +0100
In-Reply-To: <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 01bf69bb3799f80c15c
X-MBO-RS-META: kcdubjqmmaqtnkgix8o7t6mh7eswxrh5
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

On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian K=C3=B6nig wrote:
> > On 12/1/25 10:04, Philipp Stanner wrote:
> > >=20

[=E2=80=A6]

> > > It eliminates such a race *in amdgpu*. Other drivers might not have
> > > that problem. I think Intel/Xe is refcounting jobs? Matthew?
> > >=20
>=20
> We schedule device resets on the same work queue as the job timeout
> queue, as well as operations like VF migrations, since conceptually they
> are quite similar to device resets. In both cases, we have the
> capability to stop all schedulers on the device and prevent any future
> schedules from being created while these processes are ongoing.
>=20
> Putting it all together: when either of these device-wide operations is
> running, we know that no job timeouts will occur and no scheduler
> operations (e.g., run_job, free_job, etc.) will race. I suggest that all
> other drivers requiring device-wide operations follow this approach, as
> it seems to work quite well. In other words, even if free_job is moved
> to the timeout work queue, I=E2=80=99m fairly certain you would still sch=
edule
> device-wide operations on the timeout work queue and still stop all
> schedulers before any device operation touches scheduler or queue state.

Thx for the explanation.

As far as I'm aware, everyone concerned already follows the (by now
officially documented) approach of stopping drm_sched on reset.

We have never really documented very well when and why one should share
the timeout_wq, though.

Someone who thinks he understands that really well should document that
in drm_sched_init_args.

>=20
> Therefore, I don=E2=80=99t believe Xe actually has a problem here.
>=20
> > > > > - Matches the logical model: timeout selects guilty job and recov=
ery,
> > > > > =C2=A0 including freeing, is handled on one queue.
> > > > >=20
> > > > > Cons / considerations:
> > > > > - For users that don=E2=80=99t provide timeout_wq, free_job moves=
 from the
> > > > > =C2=A0 per-sched ordered queue to system_wq, which slightly chang=
es
>=20
> s/system_wq/system_percpu_wq
>=20
> Ok, the system_percpu_wq doesn't actually for timeout_wq as that work
> queue is reclaim unsafe. We probably should just remove that fallback in
> the scheduler.

Which one, exactly?

>=20
> > > > > =C2=A0 scheduling behaviour but keeps correctness.
> > > >=20
> > > > We should probably avoid that and use a single ordered wq for submi=
t, timeout, free when the driver doesn't provide one.
>=20
> Ah, yes agree. I typed the same thing above before reading this.

Why do we even provide a submit_wq?

The timeout_wq I still understand somewhat, since it can help ordering
racing timeouts. But submit?


>=20

[=E2=80=A6]

> > >=20
> > > I'm not convinced that this is the right path forward.
> > >=20
> > > The fundamental issue here is the gross design problem within drm/sch=
ed
> > > that drivers *create* jobs, but the scheduler *frees* them at an
> > > unpredictable point in time.
> >=20
> > Yeah, can't agree more!
> >=20
>=20
> The scheduler doesn=E2=80=99t free jobs; it simply drops a reference coun=
t.

In our discussions, it is astonishing me at times with what naturalness
you make that statement.

Who has ever defined, who has ever documented that this is how the
scheduler is supposed to be used?

Let's look at the docu:

 /** * @free_job: Called once the job's finished fence has been signaled * =
and it's time to clean it up. */ void (*free_job)(struct drm_sched_job *sch=
ed_job);

"it's time to clean it up"


> free_job should be renamed, in my opinion, to reflect this. Once that
> misnomer is fixed, the design actually makes sense.
>=20

How do you know that this is the design idea? Since when do you know?
Why was it never documented? It's kind of important.

>  The scheduler holds
> a reference to the job until its fence signals and until it is removed
> from internal tracking.
>=20

Let's look at tho documentation for drm_sched_job:

 * @entity: the entity to which this job belongs.
 * @cb: the callback for the parent fence in s_fence.
 *
 * A job is created by the driver using drm_sched_job_init(), and
 * should call drm_sched_entity_push_job() once it wants the scheduler
 * to schedule the job.
 */

Do you see any clue anywhere at all that jobs are supposed to be
refcounted? Where is the scheduler's reference (refcount++) taken? That
could maybe even be taken race-free by drm_sched (likely in
drm_sched_entity_push_job()), but I strongly suspect that what you're
hinting at is that the driver (i.e., Xe) takes and frees the refcount
for drm_sched.


>  Transferring ownership via reference counting is
> actually quite common and well understood. The scheduler takes ownership
> of a ref when the job is pushed to the scheduler.

s/takes/should take

Don't get me wrong, I *think* that your design suggestion to refcount
jobs is probably (considering the circumstances we got ourselves into)
correct. I think I would support porting drm_sched to refcounting jobs.

But your way to formulate it as an absolute truth is plainly wrong. It
is not the design reality, many drivers don't just drop a refcount in
free_job; and it's not documented.

Moreover, I think if refcounting jobs were a reality free_job() could
just be deleted very easily, since the scheduler could drop its
refcount whenever it pleases, without calling back into the driver.

>=20
> > > This entire fix idea seems to circle around the concept of relying ye=
t
> > > again on the scheduler's internal behavior (i.e., when it schedules t=
he
> > > call to free_job()).
> > >=20
> > > I think we discussed that at XDC, but how I see it if drivers have
> > > strange job life time requirements where a job shall outlive
> > > drm_sched's free_job() call, they must solve that with a proper
> > > synchronization mechanism.
> >=20
> > Well that is not correct as far as I can see.
> >=20
> > The problem here is rather that the scheduler gives the job as paramete=
r to the timedout_job() callback, but doesn't guarantee that ->free_job() c=
allback isn't called while timedout_job() runs.
> >=20
> > This should be prevented by removing the job in question from the pendi=
ng list (see drm_sched_job_timedout), but for some reason that doesn't seem=
 to work correctly.
> >=20
>=20
> Are you sure this is happening? It doesn=E2=80=99t seem possible, nor hav=
e I
> observed it.

It's impossible, isn't it?

static void drm_sched_job_timedout(struct work_struct *work) { struct drm_g=
pu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat sta=
tus =3D DRM_GPU_SCHED_STAT_RESET; sched =3D container_of(work, struct drm_g=
pu_scheduler, work_tdr.work); /* Protects against concurrent deletion in dr=
m_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job =3D list_=
first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if (=
job) { /* * Remove the bad job so it cannot be freed by a concurrent * &str=
uct drm_sched_backend_ops.free_job. It will be * reinserted after the sched=
uler's work items have been * cancelled, at which point it's safe. */ list_=
del_init(&job->list); spin_unlock(&sched->job_list_lock); status =3D job->s=
ched->ops->timedout_job(job);


   1. scheduler takes list lock
   2. removes job from list
   3. unlocks
   4. calls timedout_job callback


How can free_job_work, through drm_sched_get_finished_job(), get and
free the same job?

The pending_list is probably the one place where we actually lock
consistently and sanely.

I think this needs to be debugged more intensively, Christian.


>=20
> What actually looks like a problem is that in drm_sched_job_timedout,
> free_job can be called. Look at [2]=E2=80=94if you=E2=80=99re using free_=
guilty (Xe
> isn=E2=80=99t, but [2] was Xe trying to do the same thing), this is actua=
lly
> unsafe. The free_guilty code should likely be removed as that definitely
> can explode under the right conditions.

I'm right now not even sure why free_guilty exists, but I don't see how
it's illegal for drm_sched to call free_job in drm_sched_job_timedout?

free_job can be called at any point in time, drivers must expect that.
No lock is being held, and timedout_job already ran. So what's the
problem?

For drivers with additional refcounting it would be even less of a
problem.

>=20
> [2] git format-patch -1 ea2f6a77d0c40
>=20
> > > The first question would be: what does amdgpu need the job for after
> > > free_job() ran? What do you even need a job for still after there was=
 a
> > > timeout?
> >=20
> > No, we just need the job structure alive as long as the timedout_job() =
callback is running.
> >=20
>=20
> Yes, I agree.

As far as I can see that's how it's already implemented? No one can
free that job while timedout_job() is running in
drm_sched_job_timedout().

>=20
> > > And if you really still need its contents, can't you memcpy() the job
> > > or something?
> > >=20
> > > Assuming that it really needs it and that that cannot easily be solve=
d,
> > > I suppose the obvious answer for differing memory life times is
> > > refcounting. So amdgpu could just let drm_sched drop its reference in
> > > free_job(), and from then onward it's amdgpu's problem.
> > >=20
> > > I hope Matthew can educate us on how Xe does it.
> >=20
> > We discussed this on XDC and it was Matthew who brought up that this ca=
n be solved by running timeout and free worker on the same single threaded =
wq.
> >=20
>=20
> No, see my explainations above. This is not my suggestion.
>=20
> > >=20
> > > AFAIK Nouveau doesn't have that problem, because on timeout we just
> > > terminate the channel.
> > >=20
> > > Would also be interesting to hear whether other driver folks have the
> > > problem of free_job() being racy.
> >=20
> > I think that this is still a general problem with the drm scheduler and=
 not driver specific at all.
> >=20
>=20
> Maybe the free_guilty is likely a scheduler problem but I'm not seeing
> an issue aside from that.

I also can't see the bug. I fail to see how drm_sched can free a job
that's currently in use in timedout_job(). If that can happen,
Christian, Vitaly, please point us to where and how. Only then can we
decide on how to fix it properly.


P.


