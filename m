Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1FCB03FD1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 15:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA910E495;
	Mon, 14 Jul 2025 13:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lyFe9vU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E6610E495
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:27:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bgjmD49vzz9sFF;
 Mon, 14 Jul 2025 15:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752499644; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GqjNFq5UnwoJNmHyGSYalsed7UYh3ix3zRIjtKsQr8=;
 b=lyFe9vU3FQTtWJZNLvfFH+8nXOyorqhY9OupZ6GoFLsiyaCtvqOjUsMORQ70fJXaFmg8j3
 y68qbMYEojWq3Crbw9FS9s1MeC2Ta5BpXrkiTXqY/NU+1ZmpfGOnDfimsxtX5/JWz3pY7A
 D2fYmqx5xS+IZyap+0j2Ax6AwNRwU9TNenEB3T95iiwKjA9xaPKqNrJ3jKz/o/zqt5zJRt
 atBAwegIyGgtBq4Cd2x4dQ49hmqRqXglUHuuAts7TgzsoTZUr3zjuD0DX1cif2mU7xKcgK
 +EmOvgFEElg1bCsc4B5NJ1Dq8gzcuMKhx8bcKWjBdkhhHV+5cl/cUKGQ3Ixpxg==
Message-ID: <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, "Lin.Cao" <lincao12@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, dakr@kernel.org, 
 matthew.brost@intel.com
Date: Mon, 14 Jul 2025 15:27:21 +0200
In-Reply-To: <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: wen9gdd8qjkdujrw5agxbeybwkcy9pp8
X-MBO-RS-ID: 86d5a2640cccc8daba9
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

On Mon, 2025-07-14 at 15:08 +0200, Christian K=C3=B6nig wrote:
>=20
>=20
> On 14.07.25 14:46, Philipp Stanner wrote:
> > regarding the patch subject: the prefix we use for the scheduler
> > is:
> > drm/sched:
> >=20
> >=20
> > On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
> >=20
> > > When Application A submits jobs (a1, a2, a3) and application B
> > > submits
> >=20
> > s/Application/application
> >=20
> > > job b1 with a dependency on a2's scheduler fence, killing
> > > application A
> > > before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
> > > force
> > > signal all jobs sequentially. However, due to missing
> > > work_run_job or
> > > work_free_job
> > >=20
> >=20
> > You probably mean "due to the work items work_run_job and
> > work_free_job
> > not being started [=E2=80=A6]".
> >=20
> > However, the call you add, drm_sched_wakeup(), immediately only
> > triggers work_run_job. It's not clear to me why you mention
> > work_free_job, because drm_sched_entity_kill_jobs_work() directly
> > invokes the free_job() callback.
>=20
> Yeah the description is rather confusing, took me more than one try
> to understand what's going on here as well. Let me try to explain it
> in my words:
>=20
> When an application A is killed the pending submissions from it are
> not executed, but rather torn down by
> drm_sched_entity_kill_jobs_work().
>=20
> If now a submission from application B depends on something
> application A wanted to do on the same scheduler instance the
> function drm_sched_entity_add_dependency_cb() would have optimized
> this dependency and assumed that the scheduler work would already run
> and try to pick a job.
>=20
> But that isn't the case when the submissions from application A are
> all killed. So make sure to start the scheduler work from
> drm_sched_entity_kill_jobs_work() to handle that case.

Alright, so the bug then depends on B setting a dependency on A _after_
A was killed, doesn't it? Because the optimization in
_add_dependency_cb() can only have an effect after A's jobs have been
torn down.

If there is such a timing order problem, the commit message should
mention it.

The commit message definitely also needs to mention this optimization
in drm_sched_entity_add_dependency_cb() since it's essential for
understanding the bug.


Danke
P.


>=20
> Regards,
> Christian.
>=20
> >=20
> > > =C2=A0in entity_kill_job_work(), the scheduler enters sleep
> > > state, causing application B hang.
> >=20
> > So the issue is that if a1 never ran, the scheduler will not
> > continue
> > with the jobs of application B, correct?
> >=20
> > >=20
> > > Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> >=20
> > s/to preventing/to prevent
> >=20
> > > scheduler sleep and subsequent application hangs.
> > >=20
> > > v2:
> > > - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
> >=20
> > Changelogs are cool and useful, but move them below the Signed-off
> > area
> > with another --- please, like so:
> >=20
> > Signed-off by: =E2=80=A6
> > ---
> > v2:
> > =E2=80=A6
> > ---
> > drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> >=20
> >=20
> > >=20
> > > Signed-off-by: Lin.Cao <lincao12@amd.com>
> >=20
> > This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag
> > and
> > put the stable kernel in CC.
> >=20
> > Please figure out with git blame, git log and git tag --contains
> > which
> > commit your patch fixes and which is the oldest kernel that
> > contains
> > the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll
> > find
> > lots of examples for that in git log.
> >=20
> >=20
> > Thx
> > P.
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index e671aa241720..66f2a43c58fd 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -177,6 +177,7 @@ static void
> > > drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
> > > =C2=A0	struct drm_sched_job *job =3D container_of(wrk,
> > > typeof(*job), work);
> > > =C2=A0
> > > =C2=A0	drm_sched_fence_scheduled(job->s_fence, NULL);
> > > +	drm_sched_wakeup(job->sched);
> > > =C2=A0	drm_sched_fence_finished(job->s_fence, -ESRCH);
> > > =C2=A0	WARN_ON(job->s_fence->parent);
> > > =C2=A0	job->sched->ops->free_job(job);
> >=20
>=20

