Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE300B05AD4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A89610E5B8;
	Tue, 15 Jul 2025 13:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LOtz3Ymd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39610E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:07:58 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bhKHG2KR5z9tCJ;
 Tue, 15 Jul 2025 15:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752584874; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTWWH5E2Iz/0G6SXEyaa4KtSF5ZYYeFT7TdjvFWgkfI=;
 b=LOtz3Ymdcv00LhcKVHLi6cO8dUPV2D3h9KH3AR0Khc+zWk7N8xlncqPT60Mwizymxx+8Ak
 IEV9a3nptIDsUBpQMFbvlaCiyv8t6F0WYMR2+d/X1EXC9Bwrxv5Zpuec4a9Moa5F3RNOmM
 AsKXAtt2Unfm5YG7/ZrrYpyq9AxB78rVgHEv8kDzachzNsoltn3PngUE7CJ2xJ23kaILrh
 LHIYmFvv/rz7ZUfeghn0yg60UfdG5YrHve7XEfd4LocmcQaea93DRCLerZFAEoLOR1Yt1j
 CVgZrNABEI+CtUfqKwRfZkJ+fmQ/fPIHtfdettz59HptBxI5wSKv7WmwWCvduA==
Message-ID: <6562a1df16c4d810542a7c42f10c5471723931ad.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, "cao, lin" <lin.cao@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>, 
 "matthew.brost@intel.com" <matthew.brost@intel.com>
Date: Tue, 15 Jul 2025 15:07:51 +0200
In-Reply-To: <db50d1eb-02ed-465a-b98d-a24caa7829c7@amd.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
 <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
 <PH0PR12MB549781447809324DF9A7E0D6F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <8dc0a31c06d33f45bbcb32d8805579015db91b21.camel@mailbox.org>
 <PH0PR12MB54974724ECC2262A6F00AE18F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <44bdc3fd5628a7db07c64331007509aa39a13df4.camel@mailbox.org>
 <ba4770ce-f70b-4825-aba4-34e13c9b910f@amd.com>
 <564b80a454c5d537071c4e63622982f2d6be5639.camel@mailbox.org>
 <db50d1eb-02ed-465a-b98d-a24caa7829c7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: d1hn46erxqx66qn69peoi8ioypbxwph4
X-MBO-RS-ID: f12edfa853e1e2ce734
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

On Tue, 2025-07-15 at 14:32 +0200, Christian K=C3=B6nig wrote:
> On 15.07.25 14:20, Philipp Stanner wrote:
> > On Tue, 2025-07-15 at 12:52 +0200, Christian K=C3=B6nig wrote:
> > > On 15.07.25 12:27, Philipp Stanner wrote:
> > > > On Tue, 2025-07-15 at 09:51 +0000, cao, lin wrote:
> > > > >=20
> > > > > [AMD Official Use Only - AMD Internal Distribution Only]
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > Hi Philipp,
> > > > >=20
> > > > >=20
> > > > > Thanks for your review, let me try to clarify why I added
> > > > > drm_sched_wakeup() to drm_sched_entity_kill_jobs_work():
> > > > >=20
> > > > >=20
> > > > > When application A submits jobs (a1, a2, a3) and application
> > > > > B
> > > > > submits job b1 with a dependency on a1's scheduled fence, the
> > > > > normal execution flow is (function drm_sched_run_job_work()):
> > > > > 1. a1 gets popped from the entity by the scheduler
> > > > > 2. run_job(a1) executes
> > > > > 3. a1's scheduled fence gets signaled=C2=A0
> > > > > 4. drm_sched_run_job_work() calls drm_sched_run_job_queue()
> > > > > at
> > > > > the end
> > > > > 5. The scheduler wakes up and re-selects entities to pop jobs
> > > > > 6. Since b1's dependency is cleared, the scheduler can select
> > > > > b1
> > > > > and continue the same flow
> > > > >=20
> > > > >=20
> > > > > However, if application A is killed before a1 gets popped by
> > > > > the
> > > > > scheduler, then a1, a2, a3 are killed sequentially by
> > > > > drm_sched_entity_kill_jobs_cb(). During the kill process,
> > > > > their
> > > > > scheduled fences are still signaled, but the kill process
> > > > > itself
> > > > > lacks work_run_job. This means b1's dependency gets cleared,
> > > > > but
> > > > > there's no work_run_job to drive the scheduler to continue
> > > > > running, or we can saystep 4 in the normal flow is missing,
> > > > > and
> > > > > the scheduler enters sleep state, which causes application B
> > > > > to
> > > > > hang.
> > > > > So if we add drm_sched_wakeup() in
> > > > > drm_sched_entity_kill_jobs_work() after
> > > > > drm_sched_fence_scheduled(), the scheduler can be woken up,
> > > > > and
> > > > > application B can continue running after a1's scheduled fence
> > > > > is
> > > > > force signaled.
> > > >=20
> > > > Thanks for the detailed explanation. Makes sense.
> > > > Maybe you can detail in v3 that this "optimization" consists of
> > > > the
> > > > work item not being scheduled.
> > >=20
> > > Yeah, removing this "optimization" would also be a valid solution
> > > to
> > > the problem.
> >=20
> > If you at AMD are willing to work on that that'd be definitely
> > fine.
> > Removing code is usually better than adding code.
>=20
> I fear I won't have time for that before my retirement :)=20

You've got fresh, powerful folks like Lin! :)

But either solution is fine. If you just want it fixed, we can merge
the existing approach.

>=20
> > Do you think being afraid of a performance regression is realistic
> > here, though?
>=20
> No, absolutely not. It was just a micro optimization done long ago.
>=20
> On the other hand with the scheduler code base I'm not sure of
> anything any more.

"In my subsystem you have to run as fast as you can just to remain at
the same place", said the Red Queen to Alice.

:)

P.

>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Christian.
> > >=20
> > > > I think that was the piece of the puzzle
> > > > I was missing.
> > > >=20
> > > > I / DRM tools will also include a link to this thread, so I
> > > > think
> > > > that
> > > > will then be sufficient.
> > > >=20
> > > > Thx
> > > > P.
> > > >=20
> > > > >=20
> > > > > Thanks,
> > > > > Lin
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > From:=C2=A0Philipp Stanner <phasta@mailbox.org>
> > > > > Sent:=C2=A0Tuesday, July 15, 2025 17:12
> > > > > To:=C2=A0cao, lin <lin.cao@amd.com>; Koenig, Christian
> > > > > <Christian.Koenig@amd.com>;
> > > > > phasta@kernel.org=C2=A0<phasta@kernel.org>;
> > > > > dri-devel@lists.freedesktop.org=C2=A0<
> > > > > dri-devel@lists.freedesktop.org>
> > > > > Cc:=C2=A0Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> > > > > <Emily.Deng@amd.com>; dakr@kernel.org=C2=A0<dakr@kernel.org>;
> > > > > matthew.brost@intel.com=C2=A0<matthew.brost@intel.com>
> > > > > Subject:=C2=A0Re: [PATCH v2] drm/scheduler: Fix sched hang when
> > > > > killing app with dependent jobs
> > > > >=20
> > > > >=20
> > > > > On Tue, 2025-07-15 at 03:38 +0000, cao, lin wrote:
> > > > > >=20
> > > > > > [AMD Official Use Only - AMD Internal Distribution Only]
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Hi Christian, Philipp,
> > > > > >=20
> > > > > >=20
> > > > > > I modified=C2=A0the commit msg, and I hope it makes more=C2=A0s=
ense:
> > > > > >=20
> > > > > >=20
> > > > > > drm/sched: wake up scheduler when killing jobs to prevent
> > > > > > hang
> > > > >=20
> > > > > nit:
> > > > > s/wake/Wake
> > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > When application A submits jobs (a1, a2, a3) and
> > > > > > application B
> > > > > > submits
> > > > > > job b1 with a dependency on a2's scheduler fence, killing
> > > > > > application A
> > > > > > before run_job(a1) causes drm_sched_entity_kill_jobs_work()
> > > > > > to
> > > > > > force
> > > > > > signal all jobs sequentially. However, the optimization in
> > > > > > drm_sched_entity_add_dependency_cb() waits for the fence to
> > > > > > be
> > > > > > scheduled
> > > > > > by adding a callback (drm_sched_entity_clear_dep) instead
> > > > > > of
> > > > > > immediately
> > > > > > waking up the scheduler. When A is killed before its jobs
> > > > > > can
> > > > > > run, the
> > > > > > callback gets triggered but drm_sched_entity_clear_dep()
> > > > > > only
> > > > > > clears the
> > > > > > dependency without waking up the scheduler, causing the
> > > > > > scheduler to enter
> > > > > > sleep state and application B to hang.
> > > > >=20
> > > > > That now reads as if drm_sched_entity_clear_dep() is supposed
> > > > > to
> > > > > wake
> > > > > up the scheduler. But you add the wakeup to a different
> > > > > function
> > > > > (the
> > > > > work item).
> > > > >=20
> > > > > Also the code actually looks like that:
> > > > >=20
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 xa_erase(&job->dependencies, index);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (f && !dma_fence_add_callback(f, &job-
> > > > > > finish_cb,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > drm_sched_entity_kill_jobs_cb))
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(f);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_WORK(&job->work,
> > > > > drm_sched_entity_kill_jobs_work);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule_work(&job->wo=
rk);
> > > > > }
> > > > >=20
> > > > > So if adding that callback succeeds we.. return immediately
> > > > > but
> > > > > we.. do
> > > > > that for the first dependency, not for all of them?
> > > > >=20
> > > > > Oh boy. That code base. We(tm) should look into pimping that
> > > > > up.
> > > > > Also
> > > > > lacks documentation everywhere.
> > > > >=20
> > > > >=20
> > > > > Anyways. If this solves a bug for you the patch looks fine
> > > > > (i.e.,
> > > > > not
> > > > > potentially harmful) by me and if the tests succeed we can
> > > > > merge
> > > > > it.
> > > > > However, I'd feel better if you could clarify more why that
> > > > > function is
> > > > > the right place to solve the bug.
> > > > >=20
> > > > >=20
> > > > > Thanks,
> > > > > P.
> > > > >=20
> > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Add drm_sched_wakeup() in entity_kill_job_work() to prevent
> > > > > > scheduler
> > > > > > sleep and subsequent application hangs.
> > > > > >=20
> > > > > >=20
> > > > > > v2:
> > > > > > - Move drm_sched_wakeup() to after
> > > > > > drm_sched_fence_scheduled()
> > > > > >=20
> > > > > >=20
> > > > > > Thanks,
> > > > > > Lin
> > > > > >=20
> > > > > >=20
> > > > > > From: Koenig, Christian <Christian.Koenig@amd.com>
> > > > > > Sent: Monday, July 14, 2025 21:39
> > > > > > To: phasta@kernel.org=C2=A0<phasta@kernel.org>; cao, lin
> > > > > > <lin.cao@amd.com>;
> > > > > > dri-devel@lists.freedesktop.org=C2=A0<
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > >=20
> > > > > > Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> > > > > > <Emily.Deng@amd.com>; dakr@kernel.org=C2=A0<dakr@kernel.org>;
> > > > > > matthew.brost@intel.com=C2=A0<matthew.brost@intel.com>
> > > > > > Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when
> > > > > > killing app with dependent jobs
> > > > > >=20
> > > > > > =C2=A0
> > > > > >=20
> > > > > >=20
> > > > > > On 14.07.25 15:27, Philipp Stanner wrote:
> > > > > > > On Mon, 2025-07-14 at 15:08 +0200, Christian K=C3=B6nig wrote=
:
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > On 14.07.25 14:46, Philipp Stanner wrote:
> > > > > > > > > regarding the patch subject: the prefix we use for
> > > > > > > > > the
> > > > > > > > > scheduler
> > > > > > > > > is:
> > > > > > > > > drm/sched:
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
> > > > > > > > >=20
> > > > > > > > > > When Application A submits jobs (a1, a2, a3) and
> > > > > > > > > > application B
> > > > > > > > > > submits
> > > > > > > > >=20
> > > > > > > > > s/Application/application
> > > > > > > > >=20
> > > > > > > > > > job b1 with a dependency on a2's scheduler fence,
> > > > > > > > > > killing
> > > > > > > > > > application A
> > > > > > > > > > before run_job(a1) causes
> > > > > > > > > > drm_sched_entity_kill_jobs_work() to
> > > > > > > > > > force
> > > > > > > > > > signal all jobs sequentially. However, due to
> > > > > > > > > > missing
> > > > > > > > > > work_run_job or
> > > > > > > > > > work_free_job
> > > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > You probably mean "due to the work items work_run_job
> > > > > > > > > and
> > > > > > > > > work_free_job
> > > > > > > > > not being started [=E2=80=A6]".
> > > > > > > > >=20
> > > > > > > > > However, the call you add, drm_sched_wakeup(),
> > > > > > > > > immediately only
> > > > > > > > > triggers work_run_job. It's not clear to me why you
> > > > > > > > > mention
> > > > > > > > > work_free_job, because
> > > > > > > > > drm_sched_entity_kill_jobs_work()
> > > > > > > > > directly
> > > > > > > > > invokes the free_job() callback.
> > > > > > > >=20
> > > > > > > > Yeah the description is rather confusing, took me more
> > > > > > > > than
> > > > > > > > one try
> > > > > > > > to understand what's going on here as well. Let me try
> > > > > > > > to
> > > > > > > > explain it
> > > > > > > > in my words:
> > > > > > > >=20
> > > > > > > > When an application A is killed the pending submissions
> > > > > > > > from it are
> > > > > > > > not executed, but rather torn down by
> > > > > > > > drm_sched_entity_kill_jobs_work().
> > > > > > > >=20
> > > > > > > > If now a submission from application B depends on
> > > > > > > > something
> > > > > > > > application A wanted to do on the same scheduler
> > > > > > > > instance
> > > > > > > > the
> > > > > > > > function drm_sched_entity_add_dependency_cb() would
> > > > > > > > have
> > > > > > > > optimized
> > > > > > > > this dependency and assumed that the scheduler work
> > > > > > > > would
> > > > > > > > already run
> > > > > > > > and try to pick a job.
> > > > > > > >=20
> > > > > > > > But that isn't the case when the submissions from
> > > > > > > > application A are
> > > > > > > > all killed. So make sure to start the scheduler work
> > > > > > > > from
> > > > > > > > drm_sched_entity_kill_jobs_work() to handle that case.
> > > > > > >=20
> > > > > > > Alright, so the bug then depends on B setting a
> > > > > > > dependency on
> > > > > > > A _after_
> > > > > > > A was killed, doesn't it? Because the optimization in
> > > > > > > _add_dependency_cb() can only have an effect after A's
> > > > > > > jobs
> > > > > > > have been
> > > > > > > torn down.
> > > > > >=20
> > > > > > No, application A and application B submit right behind
> > > > > > each
> > > > > > other. Application A is then killed later on.
> > > > > >=20
> > > > > > The optimization in _add_dependency_cb() just waits for As
> > > > > > submission to be handled by the scheduler, but that never
> > > > > > happens because it was killed.
> > > > > >=20
> > > > > > > If there is such a timing order problem, the commit
> > > > > > > message
> > > > > > > should
> > > > > > > mention it.
> > > > > > >=20
> > > > > > > The commit message definitely also needs to mention this
> > > > > > > optimization
> > > > > > > in drm_sched_entity_add_dependency_cb() since it's
> > > > > > > essential
> > > > > > > for
> > > > > > > understanding the bug.
> > > > > >=20
> > > > > > +1
> > > > > >=20
> > > > > > Christian.
> > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > Danke
> > > > > > > P.
> > > > > > >=20
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > > =C2=A0in entity_kill_job_work(), the scheduler enters
> > > > > > > > > > sleep
> > > > > > > > > > state, causing application B hang.
> > > > > > > > >=20
> > > > > > > > > So the issue is that if a1 never ran, the scheduler
> > > > > > > > > will
> > > > > > > > > not
> > > > > > > > > continue
> > > > > > > > > with the jobs of application B, correct?
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Add drm_sched_wakeup() when entity_kill_job_work()
> > > > > > > > > > to
> > > > > > > > > > preventing
> > > > > > > > >=20
> > > > > > > > > s/to preventing/to prevent
> > > > > > > > >=20
> > > > > > > > > > scheduler sleep and subsequent application hangs.
> > > > > > > > > >=20
> > > > > > > > > > v2:
> > > > > > > > > > - Move drm_sched_wakeup() to after
> > > > > > > > > > drm_sched_fence_scheduled()
> > > > > > > > >=20
> > > > > > > > > Changelogs are cool and useful, but move them below
> > > > > > > > > the
> > > > > > > > > Signed-off
> > > > > > > > > area
> > > > > > > > > with another --- please, like so:
> > > > > > > > >=20
> > > > > > > > > Signed-off by: =E2=80=A6
> > > > > > > > > ---
> > > > > > > > > v2:
> > > > > > > > > =E2=80=A6
> > > > > > > > > ---
> > > > > > > > > drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Signed-off-by: Lin.Cao <lincao12@amd.com>
> > > > > > > > >=20
> > > > > > > > > This fixes a bug. Even a racy bug, it seems. So we
> > > > > > > > > need a
> > > > > > > > > Fixes tag
> > > > > > > > > and
> > > > > > > > > put the stable kernel in CC.
> > > > > > > > >=20
> > > > > > > > > Please figure out with git blame, git log and git tag
> > > > > > > > > --
> > > > > > > > > contains
> > > > > > > > > which
> > > > > > > > > commit your patch fixes and which is the oldest
> > > > > > > > > kernel
> > > > > > > > > that
> > > > > > > > > contains
> > > > > > > > > the bug. Then add a Fixes: tag and Cc: the stable
> > > > > > > > > kernel.
> > > > > > > > > You'll
> > > > > > > > > find
> > > > > > > > > lots of examples for that in git log.
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > Thx
> > > > > > > > > P.
> > > > > > > > >=20
> > > > > > > > > > ---
> > > > > > > > > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > > > > > > > > =C2=A01 file changed, 1 insertion(+)
> > > > > > > > > >=20
> > > > > > > > > > diff --git
> > > > > > > > > > a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > index e671aa241720..66f2a43c58fd 100644
> > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > @@ -177,6 +177,7 @@ static void
> > > > > > > > > > drm_sched_entity_kill_jobs_work(struct work_struct
> > > > > > > > > > *wrk)
> > > > > > > > > > =C2=A0=C2=A0 struct drm_sched_job *job =3D container_of=
(wrk,
> > > > > > > > > > typeof(*job), work);
> > > > > > > > > > =C2=A0
> > > > > > > > > > =C2=A0=C2=A0 drm_sched_fence_scheduled(job->s_fence, NU=
LL);
> > > > > > > > > > +=C2=A0 drm_sched_wakeup(job->sched);
> > > > > > > > > > =C2=A0=C2=A0 drm_sched_fence_finished(job->s_fence, -ES=
RCH);
> > > > > > > > > > =C2=A0=C2=A0 WARN_ON(job->s_fence->parent);
> > > > > > > > > > =C2=A0=C2=A0 job->sched->ops->free_job(job);
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > >=20
> > > > > >=20
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20

