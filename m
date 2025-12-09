Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375DBCAFB58
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 12:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7210E4FF;
	Tue,  9 Dec 2025 11:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z6pdtVMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF9B10E4FF;
 Tue,  9 Dec 2025 11:00:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dQbVZ18P2z9tVB;
 Tue,  9 Dec 2025 12:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765278038; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fG0g1/8AmWmQf3CJIcuo8ZNP+b+s6JIc2CnfuDxmqBI=;
 b=Z6pdtVMUAco+EO5ZF7GDghFO9enwWSYev/fIiMI1i1rAFbF5bdi9hT0F41tPmXWSaMi+bq
 bq31OD4kPB9G3I6hEIZx8ZReH9JOBhIdylGtCyvmo9P133ERhWp/ssB0uZV1hBwC9/v7Gs
 YkASkqiWiphyjLJPczfQ5xYCniv6RwZH+oaW3u1QANM38B6j2SQajmcNCQeCX9Yq9aajLI
 nbN+puQagy+maF7cHsJ+0gnGLWZdtxG2DhJ0kjSxWmRFg2OuoqouO5wpU9p79nXDYpcNou
 JIQJeTSX6ULSje3oWXAtC2ecCv3sqa0mOK9aQKAsRBI0quY8YYKKCquWsiSRAw==
Message-ID: <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: phasta@kernel.org, vitaly.prosyak@amd.com,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org, Alex
 Deucher <alexander.deucher@amd.com>,  dakr@kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Date: Tue, 09 Dec 2025 12:00:27 +0100
In-Reply-To: <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 575cbda8f4277ff7c01
X-MBO-RS-META: or5ntg4cyp68t8ppmqd341pdj3dnj6oy
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

On Mon, 2025-12-08 at 13:39 -0800, Matthew Brost wrote:
> On Mon, Dec 08, 2025 at 08:43:03PM +0100, Christian K=C3=B6nig wrote:
> > On 12/8/25 20:02, Matthew Brost wrote:
> > > On Mon, Dec 08, 2025 at 10:58:42AM -0800, Matthew Brost wrote:
> > > > On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote:
> > > > > On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> > > > > > On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian K=C3=B6nig =
wrote:
> > > > > > > On 12/1/25 10:04, Philipp Stanner wrote:
> > ....
> > > > > > > > This entire fix idea seems to circle around the concept of =
relying yet
> > > > > > > > again on the scheduler's internal behavior (i.e., when it s=
chedules the
> > > > > > > > call to free_job()).
> > > > > > > >=20
> > > > > > > > I think we discussed that at XDC, but how I see it if drive=
rs have
> > > > > > > > strange job life time requirements where a job shall outliv=
e
> > > > > > > > drm_sched's free_job() call, they must solve that with a pr=
oper
> > > > > > > > synchronization mechanism.
> > > > > > >=20
> > > > > > > Well that is not correct as far as I can see.
> > > > > > >=20
> > > > > > > The problem here is rather that the scheduler gives the job a=
s parameter to the timedout_job() callback, but doesn't guarantee that ->fr=
ee_job() callback isn't called while timedout_job() runs.
> > > > > > >=20
> > > > > > > This should be prevented by removing the job in question from=
 the pending list (see drm_sched_job_timedout), but for some reason that do=
esn't seem to work correctly.
> > > > > > >=20
> > > > > >=20
> > > > > > Are you sure this is happening? It doesn=E2=80=99t seem possibl=
e, nor have I
> > > > > > observed it.
> > > > >=20
> > > > > It's impossible, isn't it?
> > > > >=20
> > > > > static void drm_sched_job_timedout(struct work_struct *work) { st=
ruct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sche=
d_stat status =3D DRM_GPU_SCHED_STAT_RESET; sched =3D container_of(work, st=
ruct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent dele=
tion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job=
 =3D list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, l=
ist); if (job) { /* * Remove the bad job so it cannot be freed by a concurr=
ent * &struct drm_sched_backend_ops.free_job. It will be * reinserted after=
 the scheduler's work items have been * cancelled, at which point it's safe=
. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); status =
=3D job->sched->ops->timedout_job(job);
> > > > >=20
> > > > >=20
> > > > > =C2=A0=C2=A0 1. scheduler takes list lock
> > > > > =C2=A0=C2=A0 2. removes job from list
> > > > > =C2=A0=C2=A0 3. unlocks
> > > > > =C2=A0=C2=A0 4. calls timedout_job callback
> > > > >=20
> > > > >=20
> > > > > How can free_job_work, through drm_sched_get_finished_job(), get =
and
> > > > > free the same job?
> > > > >=20
> > > >=20
> > > > It can't.
> >=20
> > But exactly that happens somehow. Don't ask me how, I have no idea.

*Philipp refuses to elaborate and asks Christian*

How are you so sure about that's what's happening? Anyways, assuming it
is true:

> >=20
> > My educated guess is that the job somehow ends up on the pending list a=
gain.

then the obvious question would be: does amdgpu touch the pending_list
itself, or does it only ever modify it through proper scheduler APIs?

> >=20
> > > >=20
> > > > > The pending_list is probably the one place where we actually lock
> > > > > consistently and sanely.
> > > > >=20
> > > > > I think this needs to be debugged more intensively, Christian.
> > > > >=20
> > > > >=20
> > > > > >=20
> > > > > > What actually looks like a problem is that in drm_sched_job_tim=
edout,
> > > > > > free_job can be called. Look at [2]=E2=80=94if you=E2=80=99re u=
sing free_guilty (Xe
> > > > > > isn=E2=80=99t, but [2] was Xe trying to do the same thing), thi=
s is actually
> > > > > > unsafe. The free_guilty code should likely be removed as that d=
efinitely
> > > > > > can explode under the right conditions.
> > > > >=20
> > > > > I'm right now not even sure why free_guilty exists, but I don't s=
ee how
> > > >=20
> > > > I'm sure why free_guilty exists either. If the fence is signaled in
> > > > timedout job free_job will get scheduled on another work_item.
> > > >=20
> > > > > it's illegal for drm_sched to call free_job in drm_sched_job_time=
dout?
> > > > >=20
> > > > > free_job can be called at any point in time, drivers must expect =
that.
> > > > > No lock is being held, and timedout_job already ran. So what's th=
e
> > > > > problem?
> > > > >=20
> > > > > For drivers with additional refcounting it would be even less of =
a
> > > > > problem.
> > > > >=20
> > > >=20
> > > > No, the scheduler can still reference the job.
> > > >=20
> > > > 1265=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence =3D sche=
d->ops->run_job(sched_job);
> > > > 1266=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete_all(&=
entity->entity_idle);
> > > > 1267=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fenc=
e_scheduled(s_fence, fence);
> > > > 1268
> > > > 1269=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ERR_OR=
_NULL(fence)) {
> > > > 1270=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D dma_fence_add_callback(fence, &sche=
d_job->cb,
> > > > 1271=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_job_done_cb);
> > > > 1272=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r =3D=3D -ENOENT)
> > > > 1273=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 drm_sched_job_done(sched_job, fence->error);
> > > > 1274=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (r)
> > > > 1275=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > > > 1276
> > > > 1277=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(fence);
> > > > 1278=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > > 1279=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_job_done(sched_job, IS_ERR(fenc=
e) ?
> > > > 1280=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PT=
R_ERR(fence) : 0);
> > > > 1281=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > 1282
> > > > 1283=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up(&sched=
->job_scheduled);
> > > > 1284=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_run_=
job_queue(sched);
> > > >=20
> > > > At line 1269, the run_job work item is interrupted. Timed-out jobs =
run,
> > > > call free_job, which performs the final put. Then the run_job work =
item
> > > > resumes=E2=80=94and boom, UAF. Using the same reasoning, I think mo=
ving free_job
> > > > to the timed-out work queue could also cause issues.
> > > >=20
> > > > If run_job work item took a reference to the job before adding it t=
o the
> > > > pending list and dropped it after it was done touching it in this
> > > > function, then yes, that would be safe. This is an argument for mov=
ing
> > > > reference counting into the base DRM scheduler class, it would make
> > >=20
> > > typo: s/DRM scheduler class/DRM job class
> >=20
> > That strongly sounds like re-inventing the scheduler fence.
> >=20
>=20
> Perhaps.
>=20
> > What if we completely drop the job object? Or merge it into the schedul=
er fence?
> >=20
> > The fence has reference counting, proper state transitions and a well d=
efined lifetime.
> >=20
> > We would just need ->schedule and ->finished functions instead of ->run=
_job and ->free_job. Those callbacks would then still be called by the sche=
duler in work item context instead of the irq context of the dma_fence call=
backs.
>=20
> Yes, definitely no IRQ contexts.
>=20
> >=20
> > The job can then be a void* in the scheduler fence where drivers can pu=
t anything they want and also drivers control the lifetime of that. E.g. th=
ey can free it during ->schedule as well as during ->finished.
> >=20
>=20
> I think this is a reasonable idea, but it would require major surgery
> across the subsystem plus the 11 upstream drivers I=E2=80=99m counting th=
at use
> DRM scheduler. This would be a huge coordinated effort.
>=20
> So I see three options:
>=20
> 1. Rename free_job to put_job and document usage. Rip out free_guilty.
> =C2=A0=C2=A0 Likely the easiest and least invasive.

I think I can live with that. It's work-effort wise the best we can do
right now. However, that does need proper documentation.

Let me respin to my documentation series and upstream that soonish,
than we can build on top of that.


P.

>=20
> 2. Move reference counting to the base DRM scheduler job object, provide =
a
> =C2=A0=C2=A0 vfunc for the final job put, and document usage. Medium inva=
sive.
>=20
> 3. Move job (driver) side tracking to the scheduler fence and let it
> =C2=A0=C2=A0 control the lifetime. Very invasive.
>=20
> I=E2=80=99ll support any option, but my personal bandwidth to dive into
> something like #3 just isn=E2=80=99t there (of course, I can help review
> scheduler changes and fix up Xe, etc.).
>=20
> Matt
>=20
> > Christian.
> >=20
> > >=20
> > > Matt
> > >=20
> > > > ownership clear rather than relying on ordered work queues to keep
> > > > everything safe.
> > > >=20
> > > > > >=20
> > > > > > [2] git format-patch -1 ea2f6a77d0c40
> > > > > >=20
> > > > > > > > The first question would be: what does amdgpu need the job =
for after
> > > > > > > > free_job() ran? What do you even need a job for still after=
 there was a
> > > > > > > > timeout?
> > > > > > >=20
> > > > > > > No, we just need the job structure alive as long as the timed=
out_job() callback is running.
> > > > > > >=20
> > > > > >=20
> > > > > > Yes, I agree.
> > > > >=20
> > > > > As far as I can see that's how it's already implemented? No one c=
an
> > > > > free that job while timedout_job() is running in
> > > > > drm_sched_job_timedout().
> > > > >=20
> > > >=20
> > > > See above, free guility is still problematic.
> > > > =C2=A0
> > > > > >=20
> > > > > > > > And if you really still need its contents, can't you memcpy=
() the job
> > > > > > > > or something?
> > > > > > > >=20
> > > > > > > > Assuming that it really needs it and that that cannot easil=
y be solved,
> > > > > > > > I suppose the obvious answer for differing memory life time=
s is
> > > > > > > > refcounting. So amdgpu could just let drm_sched drop its re=
ference in
> > > > > > > > free_job(), and from then onward it's amdgpu's problem.
> > > > > > > >=20
> > > > > > > > I hope Matthew can educate us on how Xe does it.
> > > > > > >=20
> > > > > > > We discussed this on XDC and it was Matthew who brought up th=
at this can be solved by running timeout and free worker on the same single=
 threaded wq.
> > > > > > >=20
> > > > > >=20
> > > > > > No, see my explainations above. This is not my suggestion.
> > > > > >=20
> > > > > > > >=20
> > > > > > > > AFAIK Nouveau doesn't have that problem, because on timeout=
 we just
> > > > > > > > terminate the channel.
> > > > > > > >=20
> > > > > > > > Would also be interesting to hear whether other driver folk=
s have the
> > > > > > > > problem of free_job() being racy.
> > > > > > >=20
> > > > > > > I think that this is still a general problem with the drm sch=
eduler and not driver specific at all.
> > > > > > >=20
> > > > > >=20
> > > > > > Maybe the free_guilty is likely a scheduler problem but I'm not=
 seeing
> > > > > > an issue aside from that.
> > > > >=20
> > > > > I also can't see the bug. I fail to see how drm_sched can free a =
job
> > > > > that's currently in use in timedout_job(). If that can happen,
> > > > > Christian, Vitaly, please point us to where and how. Only then ca=
n we
> > > > > decide on how to fix it properly.
> > > > >=20
> > > >=20
> > > > Again see above.
> > > >=20
> > > > Matt
> > > >=20
> > > > >=20
> > > > > P.
> > > > >=20
> > > > >=20
> >=20

