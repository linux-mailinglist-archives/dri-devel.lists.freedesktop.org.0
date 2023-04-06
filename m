Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566EE6D9CD6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E6610E105;
	Thu,  6 Apr 2023 15:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3E310E105
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:58:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pkS09-0007Xj-Pw; Thu, 06 Apr 2023 17:58:17 +0200
Message-ID: <8312fa88a3929b83a8ccdca1a0ab33bef15fa0ae.camel@pengutronix.de>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
From: Lucas Stach <l.stach@pengutronix.de>
To: Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 06 Apr 2023 17:58:16 +0200
In-Reply-To: <3215dfb9-8f7f-625f-44a9-85320cd32019@amd.com>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <c952a63a2c0c7377e1e15b1d06c1a941f3456d60.camel@pengutronix.de>
 <3215dfb9-8f7f-625f-44a9-85320cd32019@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Mittwoch, dem 05.04.2023 um 16:44 -0400 schrieb Luben Tuikov:
> On 2023-04-05 13:44, Lucas Stach wrote:
> > Hi Luben,
> >=20
> > Am Dienstag, dem 04.04.2023 um 00:31 -0400 schrieb Luben Tuikov:
> > > On 2023-03-28 04:54, Lucas Stach wrote:
> > > > Hi Danilo,
> > > >=20
> > > > Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich=
:
> > > > > Hi all,
> > > > >=20
> > > > > Commit df622729ddbf ("drm/scheduler: track GPU active time per en=
tity")=20
> > > > > tries to track the accumulated time that a job was active on the =
GPU=20
> > > > > writing it to the entity through which the job was deployed to th=
e=20
> > > > > scheduler originally. This is done within drm_sched_get_cleanup_j=
ob()=20
> > > > > which fetches a job from the schedulers pending_list.
> > > > >=20
> > > > > Doing this can result in a race condition where the entity is alr=
eady=20
> > > > > freed, but the entity's newly added elapsed_ns field is still acc=
essed=20
> > > > > once the job is fetched from the pending_list.
> > > > >=20
> > > > > After drm_sched_entity_destroy() being called it should be safe t=
o free=20
> > > > > the structure that embeds the entity. However, a job originally h=
anded=20
> > > > > over to the scheduler by this entity might still reside in the=
=20
> > > > > schedulers pending_list for cleanup after drm_sched_entity_destro=
y()=20
> > > > > already being called and the entity being freed. Hence, we can ru=
n into=20
> > > > > a UAF.
> > > > >=20
> > > > Sorry about that, I clearly didn't properly consider this case.
> > > >=20
> > > > > In my case it happened that a job, as explained above, was just p=
icked=20
> > > > > from the schedulers pending_list after the entity was freed due t=
o the=20
> > > > > client application exiting. Meanwhile this freed up memory was al=
ready=20
> > > > > allocated for a subsequent client applications job structure agai=
n.=20
> > > > > Hence, the new jobs memory got corrupted. Luckily, I was able to=
=20
> > > > > reproduce the same corruption over and over again by just using=
=20
> > > > > deqp-runner to run a specific set of VK test cases in parallel.
> > > > >=20
> > > > > Fixing this issue doesn't seem to be very straightforward though =
(unless=20
> > > > > I miss something), which is why I'm writing this mail instead of =
sending=20
> > > > > a fix directly.
> > > > >=20
> > > > > Spontaneously, I see three options to fix it:
> > > > >=20
> > > > > 1. Rather than embedding the entity into driver specific structur=
es=20
> > > > > (e.g. tied to file_priv) we could allocate the entity separately =
and=20
> > > > > reference count it, such that it's only freed up once all jobs th=
at were=20
> > > > > deployed through this entity are fetched from the schedulers pend=
ing list.
> > > > >=20
> > > > My vote is on this or something in similar vain for the long term. =
I
> > > > have some hope to be able to add a GPU scheduling algorithm with a =
bit
> > > > more fairness than the current one sometime in the future, which
> > > > requires execution time tracking on the entities.
> > >=20
> > > Danilo,
> > >=20
> > > Using kref is preferable, i.e. option 1 above.
> > >=20
> > > Lucas, can you shed some light on,
> > >=20
> > > 1. In what way the current FIFO scheduling is unfair, and
> > > 2. shed some details on this "scheduling algorithm with a bit
> > > more fairness than the current one"?=20
> >=20
> > I don't have a specific implementation in mind yet. However the current
> > FIFO algorithm can be very unfair if you have a sparse workload compete
> > with one that generates a lot of jobs without any throttling aside from
> > the entity queue length.
>=20
> Ah, that's interesting, let's see, a "sparse workload compete with one th=
at
> generates a lot of jobs", so basically we have a sparse workload compete
> with a dense workload. So we can represent this with two entities, A, B,
> whose jobs we're going to represent by the entities, names A and B.
> So if we let A be the sparse workload and B the dense workload,
> we have this, wlog,
>=20
>       First/oldest job, .........................., latter/new jobs.
> Subm: A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...
> Time: t0,t1,t2,t3,t4,t5,t6,t7,t8,t9, .....
>=20
> The current FIFO algorithm, would prefer to execute those jobs
> in order of submission, i.e. oldest-ready-first job. Assume
> that all jobs are ready. Then we'll execute them in order.
> This is desirable and fair. We want to execute the jobs
> in the order they were submitted, given also that they are
> ready to be executed. So perhaps we want to execute them like this:
>=20
>       First/oldest job, .........................., latter/new jobs.
> Subm: A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...
> Time: t0,t1,t2,t3,t4,t5,t6,t7,t8,t9, ....
> Exec:          A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, .=
..  =20
>=20
> Any other ordering would starve either A, or B. If we executed the 2nd A
> job at t6 or t7, then that would starve the 3rd/4th job in B, since the 2=
nd A job
> arrives at the same time as that of the 3rd B job, at time t6.
> The time t3-t0 is some delta > 0, some initial scheduler-start up time.
>=20
For simplicity now also assume that all jobs from A take 5ms of GPU
time, while jobs from B take 50ms of GPU time.

> IOW, we don't want to delay a job any more than it should wait--the oldes=
t
> job, which is also ready, should execute next, so that we're fair how
> it executes in real time. We cannot boot B at t6, so that we execute A,
> just because it is sparse, but just arrived.
>=20
> From A's point of view, it shouldn't expect its job execution time distri=
bution
> to be any different than its submission time distribution.
>=20
> Do you think there's a job permutation which offers a fairer scheduling
> than the Exec line above for the Submission line above?
>=20
Yes, if we try to keep some fairness of actual GPU time made available
to each entity by tracking the time spent over a sampling interval, we
would see that at t6 B has already spent 100ms of GPU time, while A has
only spent 5ms, so naturally we would prefer the newly submitted job
from entity A when choosing the next job to schedule.

> > By tracking the actual GPU time consumed by
> > the entities we could implement something with a bit more fairness like
> > deficit round robin (don't pin me on the specific algorithm, as I
> > haven't given it much thought yet).
>=20
> Since there's no preemption, this would be hard to achieve--you're at the=
 mercy
> of the execution time of job A_i for an entity A job i. (Assuming there's=
 no
> preemption as it is the current state of the GPU scheduler.)
>=20
> The only thing you can do, is punish the next job from this entity, A_i+1=
,
> to execute much later. However, you don't know how long A_i+1 would take.=
 If A_i+1
> takes very little time, then you're better off executing it at the next o=
pportune
> time, i.e. when it would normally execute. But such an algorithm, which d=
oesn't
> know a priori the execution time of a job, would punish A_i+1 to execute =
much later.
>=20
> But if A_i+1 takes time as long or longer than A_i, then punishing it to =
execute much
> later, would simply delay it, from an observer's point a view, it wouldn'=
t teach
> the context to submit smaller jobs, so that GPU sharing is more fair.

Without preemption we can't really make the scheduling absolutely fair,
but we can still do better than the simple FIFO. If a entity has taken
up a disproportionate amount of GPU time over the last sampling
interval, we can derate it when picking the next job to schedule to
allow other entities to take up more GPU time in the next sampling
interval.

Regards,
Lucas
