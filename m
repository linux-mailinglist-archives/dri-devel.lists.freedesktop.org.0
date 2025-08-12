Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13AB2276A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 14:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743EA10E139;
	Tue, 12 Aug 2025 12:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="f/BqjSP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1510E139
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:52:30 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c1WcW3kZKz9t5q;
 Tue, 12 Aug 2025 14:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1755003147; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/g3fOHjmInDIrwfJJKIrgiMjWZa8IFHSJPj0ybdI2I=;
 b=f/BqjSP61w5nRE8cfjTvnBk3VXxS3xnV8NEmr7bWbaiSUdLgaenhVg47ICsTPn7KHF+RUx
 PHMOeF4nF5ddmOeZOYNvAxPzocBZRaHBYxTomLtl3cyuydXF3JJyPA/4zNQ1Tnm2RPBejw
 yVtLaWCG1HifU3prbUCU8dHR3+Nx4F40GeyDEst1mahnjQicqjcK1Dc4Js4WkkAi9HZ7tb
 UlmbldOVSqxzPQCF9IqQvO83yXuHuFO4mJobYdkZLPTrUpeXW9FTFbb1aGN6tTfN8nF0Pq
 bzIJ/4JmU9zSwYcFNgNf/uVjgFnnBjWEBEAXncPl4x7aNIJ/mtm11/oQv4qIRQ==
Message-ID: <61787d6cdbfbcb8acdd28c9b6ead50dfb0641899.camel@mailbox.org>
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Liu01,
 Tong (Esther)" <Tong.Liu01@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>,  "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "Ba, Gang" <Gang.Ba@amd.com>,  "matthew.schwartz@linux.dev"
 <matthew.schwartz@linux.dev>, "cao, lin" <lin.cao@amd.com>
Date: Tue, 12 Aug 2025 14:52:23 +0200
In-Reply-To: <b1a98f9f-78d4-4dcc-9477-e8529d34dcd7@amd.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
 <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
 <DM4PR12MB613427A4B81ED0A910B530B59028A@DM4PR12MB6134.namprd12.prod.outlook.com>
 <323722ba-257a-4808-b369-5b9e35435fda@amd.com>
 <DM4PR12MB6134C087D13FE3608AC597D5902BA@DM4PR12MB6134.namprd12.prod.outlook.com>
 <b1a98f9f-78d4-4dcc-9477-e8529d34dcd7@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8a9dcfa78f671e39587
X-MBO-RS-META: 8yomwrd3h7hqdzaf5a51o3mxnyy5i9d5
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

On Tue, 2025-08-12 at 08:58 +0200, Christian K=C3=B6nig wrote:
> On 12.08.25 08:37, Liu01, Tong (Esther) wrote:
> > [AMD Official Use Only - AMD Internal Distribution Only]
> >=20
> > Hi Christian,
> >=20
> > If a job is submitted into a stopped entity, in addition to an error lo=
g, it will also cause task to hang and timeout
>=20
> Oh that's really ugly and needs to get fixed.

And we agree that the proposed fix is to stop the driver from
submitting to killed entities, don't we?

P.

>=20
> > , and subsequently generate a call trace since the fence of the submitt=
ed job is not signaled. Moreover, the refcnt of amdgpu will not decrease be=
cause process killing fails, resulting in the inability to unload amdgpu.
> >=20
> > [Tue Aug=C2=A0 5 11:05:20 2025] [drm:amddrm_sched_entity_push_job [amd_=
sched]] *ERROR* Trying to push to a killed entity
> > [Tue Aug=C2=A0 5 11:07:43 2025] INFO: task kworker/u17:0:117 blocked fo=
r more than 122 seconds.
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tai=
nted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OE=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.8.0-45-generic #45-Ubuntu
> > [Tue Aug=C2=A0 5 11:07:43 2025] "echo 0 > /proc/sys/kernel/hung_task_ti=
meout_secs" disables this message.
> > [Tue Aug=C2=A0 5 11:07:43 2025] task:kworker/u17:0=C2=A0=C2=A0 state:D =
stack:0=C2=A0=C2=A0=C2=A0=C2=A0 pid:117=C2=A0=C2=A0 tgid:117=C2=A0=C2=A0 pp=
id:2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags:0x00004000
> > [Tue Aug=C2=A0 5 11:07:43 2025] Workqueue: ttm ttm_bo_delayed_delete [a=
mdttm]
> > [Tue Aug=C2=A0 5 11:07:43 2025] Call Trace:
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 <TASK>
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 __schedule+0x27c/0x6b0
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 schedule+0x33/0x110
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 schedule_timeout+0x157/0x170
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 dma_fence_default_wait+0x1e1/0x22=
0
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ? __pfx_dma_fence_default_wait_cb=
+0x10/0x10
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 dma_fence_wait_timeout+0x116/0x14=
0
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 amddma_resv_wait_timeout+0x7f/0xf=
0 [amdkcl]
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ttm_bo_delayed_delete+0x2a/0xc0 [=
amdttm]
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 process_one_work+0x16f/0x350
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 worker_thread+0x306/0x440
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 kthread+0xf2/0x120
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ret_from_fork+0x47/0x70
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 ret_from_fork_asm+0x1b/0x30
> > [Tue Aug=C2=A0 5 11:07:43 2025]=C2=A0 </TASK>
> >=20
> > Checking vm entity stopped or not in amdgpu_vm_ready() can avoid to sub=
mit job to stopped entity. But as I understand it there still has risk of m=
emory leaks and resource leaks since amdgpu_vm_clear_freed() is skipped dur=
ing killing process. In amdgpu_vm_clear_freed() , it will update page table=
 to remove mappings and free the mapping structures. If this clean up is sk=
ipped, the page table entries remain in VRAM pointing to freed buffer objec=
t and mapping structures are allocated but not freed. Please correct me if =
I have any misunderstanding.
>=20
> No your understanding is correct, but that page tables are not cleared is=
 completely harmless.
>=20
> The application is killed and can't submit anything any more. We should j=
ust make sure that we check amdgpu_vm_ready() in the submit path as well.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Kind regards,
> > Esther
> >=20
> > -----Original Message-----
> > From: Koenig, Christian <Christian.Koenig@amd.com>
> > Sent: Monday, August 11, 2025 8:17 PM
> > To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>; dri-devel@lists.freedesk=
top.org
> > Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba, Ga=
ng <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin <lin.cao@amd.com=
>
> > Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submissi=
on during process kill
> >=20
> > Hi Esther,
> >=20
> > but that is harmless and potentially only gives a warning in the system=
 log.
> >=20
> > You could adjust amdgpu_vm_ready() if necessary.
> >=20
> > Regards,
> > Christian.
> >=20
> > On 11.08.25 11:05, Liu01, Tong (Esther) wrote:
> > > [AMD Official Use Only - AMD Internal Distribution Only]
> > >=20
> > > Hi Christian,
> > >=20
> > > The real issue is a race condition during process exit after patch ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D1f02f2044bda1db1fd995bc35961ab075fa7b5a2. This patch changed amdgpu_vm_w=
ait_idle to use drm_sched_entity_flush instead of dma_resv_wait_timeout. He=
re is what happens:
> > >=20
> > > do_exit
> > > =C2=A0=C2=A0=C2=A0 |
> > > =C2=A0=C2=A0=C2=A0 exit_files(tsk) ... amdgpu_flush ... amdgpu_vm_wai=
t_idle ... drm_sched_entity_flush (kills entity)
> > > =C2=A0=C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0 exit_task_work(tsk) ...amdgpu_gem_object_close=C2=
=A0 ...
> > > amdgpu_vm_clear_freed (tries to submit to killed entity)
> > >=20
> > > The entity gets killed in amdgpu_vm_wait_idle(), but amdgpu_vm_clear_=
freed() called by exit_task_work() still tries to submit jobs.
> > >=20
> > > Kind regards,
> > > Esther
> > >=20
> > > -----Original Message-----
> > > From: Koenig, Christian <Christian.Koenig@amd.com>
> > > Sent: Monday, August 11, 2025 4:25 PM
> > > To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>;
> > > dri-devel@lists.freedesktop.org
> > > Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba,
> > > Gang <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin
> > > <lin.cao@amd.com>; cao, lin <lin.cao@amd.com>
> > > Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job
> > > submission during process kill
> > >=20
> > > On 11.08.25 09:20, Liu01 Tong wrote:
> > > > During process kill, drm_sched_entity_flush() will kill the vm
> > > > entities. The following job submissions of this process will fail
> > >=20
> > > Well when the process is killed how can it still make job submissions=
?
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > , and
> > > > the resources of these jobs have not been released, nor have the
> > > > fences=C2=A0 been signalled, causing tasks to hang.
> > > >=20
> > > > Fix by not doing job init when the entity is stopped. And when the
> > > > job is already submitted, free the job resource if the entity is st=
opped.
> > > >=20
> > > > Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
> > > > Signed-off-by: Lin.Cao <lincao12@amd.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
> > > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 5 =
+++++
> > > > =C2=A02 files changed, 12 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > index ac678de7fe5e..1e744b2eb2db 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sche=
d_job *sched_job)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool first;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t submit_ts;
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (entity->stopped) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 DRM_ERROR("Trying to push job to a killed entity\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 schedule_work(&sched_job->work);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_drm_sched_job(sched_job, entit=
y);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc(entity->rq->sched->score)=
;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_ONCE(entity->last_user, curren=
t->group_leader); @@
> > > > -589,12
> > > > +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job
> > > > *sched_job)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Add the entity to the run queue */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 spin_lock(&entity->lock);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (entity->stopped) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&entity-=
>lock);
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_ERROR("Trying to=
 push to a killed entity\n");
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 rq =3D entity->rq;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sched =3D rq->sched;
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index bfea608a7106..c15b17d9ffe3 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *j=
ob,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -ENOENT;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(entity->stopped)) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 pr_err("*ERROR* %s: entity is stopped!\n", __func__);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EINVAL;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!credits)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EINVAL;
> > >=20
> >=20
>=20

