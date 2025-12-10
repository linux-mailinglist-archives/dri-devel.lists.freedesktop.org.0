Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDDCB29E0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB1910E6B6;
	Wed, 10 Dec 2025 09:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="S/pPg+MG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D9510E6B6;
 Wed, 10 Dec 2025 09:58:42 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dRB4Z4bhyz9sSs;
 Wed, 10 Dec 2025 10:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765360718; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0QZBjyN81vOGWNjew5d2wr6KmGOuOrLZFRkD34BVK8=;
 b=S/pPg+MGAqYgLgWr91w/yrh4v5C0M0QEFj5/D4COCm4iL/KfMcUaTYZ3/8Xq6KvhR+GiPU
 Fl6uFfJunKYjpWqpBpSFsndOFccK5/mvMU+HRihPGejlQahO7Cs2/7A5XDdrYd6P/a4WhM
 oZHpjkmf07DmqFlOMLZL6Ieq1G3S83By5qs9uZDtDvru8oecmIxEjY54VstgpnTWpqtVTS
 zGOr4Hd/9MflT32RIrR09P1TOhXxFxqi/dGnT34/mZSuYUO5dUyxPV6UGzfBkw5e2YJvGu
 iCGkPWun3xuwyhFQF+O3NFo2RrU6HlMa97gtfF3yludDvxcTOZRYjDpqgbJU4Q==
Message-ID: <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: phasta@kernel.org, vitaly.prosyak@amd.com,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org, Alex
 Deucher <alexander.deucher@amd.com>,  dakr@kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Date: Wed, 10 Dec 2025 10:58:33 +0100
In-Reply-To: <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
References: <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1c780a0f3a62f0f4e08
X-MBO-RS-META: 4xfuzksaottmifjkfn3gc45qfje3rjk3
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

On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
> On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian K=C3=B6nig wrote:
>=20
> Hey all, apologies for the stream of replies today. I looked into this a
> bit more after finishing up my day job and having several =E2=80=9CWTF=E2=
=80=9D moments.
> Trying to unify from this reply [1].
>=20
> [1] https://patchwork.freedesktop.org/patch/691101/?series=3D158224&rev=
=3D1#comment_1273453=C2=A0
>=20
> > On 12/9/25 14:51, Philipp Stanner wrote:
> >=20

[=E2=80=A6]

> > > >=20
> > > > My educated guess is that drm_sched_stop() inserted the job back in=
to the pending list, but I still have no idea how it is possible that free_=
job is running after the scheduler is stopped.
>=20
> I believe I found your problem, referencing amdgpu/amdgpu_device.c here.
>=20
> 6718=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (job)
> 6719=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ti =3D amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>=20
> Which is after:
>=20
> 6695 skip_hw_reset:
> 6696=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D amdgpu_device_=
sched_resume(&device_list, reset_context, job_signaled);
> 6697=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> 6698=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto reset_unlock;
>=20
> The job is likely added back into this free list here:
>=20
> 6676=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_halt_a=
ctivities(adev, job, reset_context, &device_list,
> 6677=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 hive, need_emergency_restart);
>=20
> So free_job runs and 'job->pasid' explodes.
>=20
> Save off the pasid on the stack at top of this function and I suspect
> your UAF goes away. This won't untangle this hair ball of code but I
> believe this at least prevent explosions.
>=20
> But let=E2=80=99s dig in further=E2=80=94amdgpu_device_halt_activities ca=
lls
> drm_sched_stop (Xe just calls drm_sched_wqueue_stop for reference). This
> function stops the work items, then adds the offending job back to the
> pending list, iterates over each job, removes the CB, leaving the job in
> the pending list. If the CB can be removed, it removes the job from
> pending, maybe calls free_job if it=E2=80=99s not a guilty job, and if it=
 is a
> guilty job, defers the free_job to the timed-out job so it doesn=E2=80=99=
t
> disappear. Like WTF?
>=20
> Oh, it gets better=E2=80=94amdgpu_device_sched_resume calls drm_sched_sta=
rt,
> which iterates over the pending list and reinserts the same CB that
> drm_sched_stop removed, then starts the scheduler. So the guilty job had
> its CB successfully removed, and now it can immediately disappear=E2=80=
=94also
> like WTF?
>=20
> Free_guilty is clearly a hack around the job not being reference
> counted, and it doesn=E2=80=99t even work in some cases. Putting that
> aside, I think calling free_job shouldn=E2=80=99t really ever happen in T=
DR.
> Imagine if drm_sched_job_timedout just took a reference to the job like
> normal kernel code=E2=80=94free_guilty could be dropped, and immediately =
this
> all becomes safe. Likewise, if the run_job work item had a reference to
> the job, which it takes before adding to the pending list and drops
> after it=E2=80=99s done touching it in this function, then run_job and fr=
ee_job
> work items could safely execute in parallel rather than relying on an
> ordered workqueue to keep that part of the code safe.

I can tell you how I design it in our Rust jobqueue:
Drivers create jobs, and in submit_job() the pass ownership over the
job to the jobqueue =E2=80=93 IOW after pushing a job, a driver can't acces=
s it
anymore. In the run_job() callback, the jobqueue either passes the job
back by value (ownership) or borrows the job to the driver so that it
can be copied (this is done so that the JQ can hypothetically do
resubmits).

This way there is no need for refcounting (in Rust / jobqueue).

Maybe the core of the problem is not so much the lack of refcounting,
but the lack of ownership rules. Why even would the driver need the job
still after it got pushed? It should be fire-and-forget.

>=20
> > > >=20
> > >=20
> > > And my uneducated guess is that it's happening in amdgpu. It seems a
> > > sched_job lives inside an amdgpu_job. Can the latter be freed at othe=
r
> > > places than free_job()?
> >=20
> > > >=20

[=E2=80=A6]

> > > > It basically says to the driver that the job lifetime problems crea=
ted by the scheduler is the driver problem and need to be worked around the=
re.
> > > >=20
> > >=20
> > > My POV still mostly is that (with the current design) the driver must
> > > not use jobs after free_job() was invoked. And when that happens is
> > > unpredictable.
> > >=20
>=20
> This is somewhat of an absurd statement from my point of view. I have a
> valid job pointer, then I call another function (see above for an
> example of how drm_sched_start/stop is unsafe) and it disappears behind
> my back.
>=20

The statement is absurd because reality (the code) is absurd. We all
are basically Alice in Wonderland, running as fast as we can just to
remain on the same spot ^_^

What I am stating is not that this is *good*, but this is what it
currently is like. Whether we like it or not.

The misunderstanding you and I might have is that for me jobs having to
be refcounted is not a reality until it's reflected in code,
documentation and, ideally, drivers.

>  The safe way to handle this is to take a local reference before
> doing anything that could make it disappear. That is much more
> reasonable than saying, =E2=80=9Cwe have five things you can do in the
> scheduler, and if you do any of them it isn=E2=80=99t safe to touch the j=
ob
> afterward.=E2=80=9D

Yeah, but that's drm_sched being drm_scheddy. Before I documented it
there were also these implicit refcounting rules in run_job(), where
the driver needs to take the reference for the scheduler for it to be
non-racy.

It also wasn't documented for a long time that drm_sched (through
spsc_queue) will explode if you don't use entities with a single
producer thread.

drm_sched got here because of gross design mistakes, lots of hacks for
few drivers, and, particularly, a strange aversion=C2=B9 against writing
documentation. If Xe came, back in the day, to the conclusion that job
lifetimes are fundamentally broken and that the objectively correct way
to solve this is refcounting, then why wasn't that pushed into
drm_sched back then?

>=20
> > > To be unfair, we already have strange refcount expectations already.
> > > But I sort of agree that there is no objectively good solution in
> > > sight.
> > >=20
> > > > >=20
> > > > > Let me respin to my documentation series and upstream that soonis=
h,
> > > > > than we can build on top of that.
> > >=20
> > > > >=20
> > > > >=20
> > > > > P.
> > > > >=20
> > > > > >=20
> > > > > > 2. Move reference counting to the base DRM scheduler job object=
, provide a
> > > > > > =C2=A0=C2=A0 vfunc for the final job put, and document usage. M=
edium invasive.
> > > >=20
> > > > I strongly think that reference counting the job object just becaus=
e the scheduler needs it is a bad idea.
> > > >=20
> > > > With that we are just moving the hot potato from one side of our mo=
uth to the other without really solving the issue.
> > > >=20
>=20
> See above=E2=80=94I can=E2=80=99t say I agree with this assessment. I thi=
nk the lack of
> reference counting is exactly the problem. I don=E2=80=99t really underst=
and the
> pushback on a very well-understood concept (reference counting) in
> Linux. I would sign up to fix the entire subsystem if we go this route.
>=20
> > > > If a driver like XE needs that for some reason than that is perfect=
ly fine.
> > >=20
> > > Nouveau doesn't need it either.
> > >=20
> > > >=20
> > > > > > 3. Move job (driver) side tracking to the scheduler fence and l=
et it
> > > > > > =C2=A0=C2=A0 control the lifetime. Very invasive.
> > > >=20
> > > > Thinking about it more that is actually not so much of a problem.
> > > >=20
> > > > Let me try to code something together by the end of next week or so=
.
> > >=20
> > > The hero Gotham needs :)
> > >=20
>=20
> Are you sure about this one? I think unless the problems around
> drm_sched_start/stop and free_guilty are fixed, my feeling is this
> entire thing is still badly broken for anyone who wants to use those.
>=20
> To sum up this whole email: I strongly disagree with option #3, but if
> that is the consensus, I will, of course, support the effort.


I would like to discuss those topics with Danilo, too, who returns from
LPC soonish. Also to get some more insights into Nouveau and our use-
cases.

My suggestion is that we pick the conversation up again soonish.
Christmas is around the corner, and I suppose we can't fix this all up
in 2025 anyways, so we might want to give it a fresh re-spin in '26.


Greetings,
P.



[=C2=B9] The strangest aversion in drm_sched, however, is the one against
locking. Locks were only taken when *absolutely* necessary. It's as if
the entire code was designed by some gamers who want to show their
youtube subscribers that they can get 1fps more by changing RAM timings
in the bios.
drm_sched might be the component in the kernel using the most
synchronization mechanisms: Spinlocks, RCU, atomic integers, atomic
instructions, refcounting, READ_ONCE(), just accessing locklessly=E2=80=A6 =
even
Paul McKenney would get wide eyes here. The only thing we're still
missing is seqlocks and rw_locks, but maybe we can add those /s

That's likely sth we can't get repaired at all anymore.
