Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C74CB0182
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 14:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20F410E1D9;
	Tue,  9 Dec 2025 13:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ewzooAR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1B10E1D9;
 Tue,  9 Dec 2025 13:51:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dQgHW33txz9tFm;
 Tue,  9 Dec 2025 14:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765288279; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/D58+FgwQ7ha1x7gzojPmvlIzL0J/30yZVIvPed4ZLc=;
 b=ewzooAR2ZU+uuChdwD7paxtvCKSrji4KtdmquQm/lYZIfApUm3zd70pcMQzfTJLUZBUSjd
 9O9q/vfFcZrTXUPAm+20ZWciLy5jLO6OXoAoVBP08IyKL/2dxZ1+3Xz+tCdhOSJA3fMWIe
 mIOcNS0bIC4sKG6+jZYiMdpm/NKa9f2mUAmFZECu0e6zUEep0oCshb1Ix6ChUOesjNnAeH
 /KOFo4t7MMM/04jLFL5lVBuaUxzyLXh7jNNx3IqBsBb3N0Td2YW9QJBCJVskV01Gp9qQFd
 tb2Kpgp0QgYtd69MEgVHNty2tZ4QWmOBa404A6qQKKeRZ2IzoyjvaCaOoKeTCA==
Message-ID: <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, Lucas
 Stach <l.stach@pengutronix.de>
Date: Tue, 09 Dec 2025 14:51:12 +0100
In-Reply-To: <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
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
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 89njugo75k1e75ptnhtrxyfbx4wcj4c3
X-MBO-RS-ID: 330ef5cb668da8dfd50
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

On Tue, 2025-12-09 at 14:32 +0100, Christian K=C3=B6nig wrote:
> On 12/9/25 12:00, Philipp Stanner wrote:
> > On Mon, 2025-12-08 at 13:39 -0800, Matthew Brost wrote:
> > > On Mon, Dec 08, 2025 at 08:43:03PM +0100, Christian K=C3=B6nig wrote:
> > > > On 12/8/25 20:02, Matthew Brost wrote:
> > > > > On Mon, Dec 08, 2025 at 10:58:42AM -0800, Matthew Brost wrote:
> > > > > > On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote=
:
> > > > > > > On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> > > > > > > > On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian K=C3=B6=
nig wrote:
> > > > > > > > > On 12/1/25 10:04, Philipp Stanner wrote:
> > > > ....
> > > > > > > > > > This entire fix idea seems to circle around the concept=
 of relying yet
> > > > > > > > > > again on the scheduler's internal behavior (i.e., when =
it schedules the
> > > > > > > > > > call to free_job()).
> > > > > > > > > >=20
> > > > > > > > > > I think we discussed that at XDC, but how I see it if d=
rivers have
> > > > > > > > > > strange job life time requirements where a job shall ou=
tlive
> > > > > > > > > > drm_sched's free_job() call, they must solve that with =
a proper
> > > > > > > > > > synchronization mechanism.
> > > > > > > > >=20
> > > > > > > > > Well that is not correct as far as I can see.
> > > > > > > > >=20
> > > > > > > > > The problem here is rather that the scheduler gives the j=
ob as parameter to the timedout_job() callback, but doesn't guarantee that =
->free_job() callback isn't called while timedout_job() runs.
> > > > > > > > >=20
> > > > > > > > > This should be prevented by removing the job in question =
from the pending list (see drm_sched_job_timedout), but for some reason tha=
t doesn't seem to work correctly.
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Are you sure this is happening? It doesn=E2=80=99t seem pos=
sible, nor have I
> > > > > > > > observed it.
> > > > > > >=20
> > > > > > > It's impossible, isn't it?
> > > > > > >=20
> > > > > > > static void drm_sched_job_timedout(struct work_struct *work) =
{ struct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_=
sched_stat status =3D DRM_GPU_SCHED_STAT_RESET; sched =3D container_of(work=
, struct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent =
deletion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock);=
 job =3D list_first_entry_or_null(&sched->pending_list, struct drm_sched_jo=
b, list); if (job) { /* * Remove the bad job so it cannot be freed by a con=
current * &struct drm_sched_backend_ops.free_job. It will be * reinserted a=
fter the scheduler's work items have been * cancelled, at which point it's =
safe. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); sta=
tus =3D job->sched->ops->timedout_job(job);
> > > > > > >=20
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0 1. scheduler takes list lock
> > > > > > > =C2=A0=C2=A0 2. removes job from list
> > > > > > > =C2=A0=C2=A0 3. unlocks
> > > > > > > =C2=A0=C2=A0 4. calls timedout_job callback
> > > > > > >=20
> > > > > > >=20
> > > > > > > How can free_job_work, through drm_sched_get_finished_job(), =
get and
> > > > > > > free the same job?
> > > > > > >=20
> > > > > >=20
> > > > > > It can't.
> > > >=20
> > > > But exactly that happens somehow. Don't ask me how, I have no idea.
> >=20
> > *Philipp refuses to elaborate and asks Christian*
> >=20
> > How are you so sure about that's what's happening? Anyways, assuming it
> > is true:
>=20
> [=C2=A0 489.134585] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0 489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_=
recover+0x968/0x990 [amdgpu]
> [=C2=A0 489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kwork=
er/u128:0/12
> [=C2=A0 489.158686]=20
> [=C2=A0 489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: =
G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 E=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.16.0-1289896.3.zuul.0ec208edc00d48a9bae171=
9675cb777f #1 PREEMPT(voluntary)=20
> [=C2=A0 489.160285] Tainted: [E]=3DUNSIGNED_MODULE
> [=C2=A0 489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BI=
OS V1.03.B10 04/01/2019
> [=C2=A0 489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [g=
pu_sched]
> [=C2=A0 489.160306] Call Trace:
> [=C2=A0 489.160308]=C2=A0 <TASK>
> [=C2=A0 489.160311]=C2=A0 dump_stack_lvl+0x64/0x80
> [=C2=A0 489.160321]=C2=A0 print_report+0xce/0x630
> [=C2=A0 489.160328]=C2=A0 ? _raw_spin_lock_irqsave+0x86/0xd0
> [=C2=A0 489.160333]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [=C2=A0 489.160337]=C2=A0 ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu=
]
> [=C2=A0 489.161044]=C2=A0 kasan_report+0xb8/0xf0
> [=C2=A0 489.161049]=C2=A0 ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu=
]
> [=C2=A0 489.161756]=C2=A0 amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> [=C2=A0 489.162464]=C2=A0 ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [am=
dgpu]
> [=C2=A0 489.163170]=C2=A0 ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
> [=C2=A0 489.163904]=C2=A0 amdgpu_job_timedout+0x642/0x1400 [amdgpu]
> [=C2=A0 489.164698]=C2=A0 ? __pfx__raw_spin_lock+0x10/0x10
> [=C2=A0 489.164703]=C2=A0 ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
> [=C2=A0 489.165496]=C2=A0 ? _raw_spin_lock+0x75/0xc0
> [=C2=A0 489.165499]=C2=A0 ? __pfx__raw_spin_lock+0x10/0x10
> [=C2=A0 489.165503]=C2=A0 drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]

That doesn't show that it's free_job() who freed the memory.

@Vitaly: Can you reproduce the bug? If yes, adding debug prints
printing the jobs' addresses when allocated and when freed in
free_job() could be a solution.

I repeat, we need more info :)

>=20
> >=20
> > > >=20
> > > > My educated guess is that the job somehow ends up on the pending li=
st again.
> >=20
> > then the obvious question would be: does amdgpu touch the pending_list
> > itself, or does it only ever modify it through proper scheduler APIs?
>=20
> My educated guess is that drm_sched_stop() inserted the job back into the=
 pending list, but I still have no idea how it is possible that free_job is=
 running after the scheduler is stopped.
>=20

And my uneducated guess is that it's happening in amdgpu. It seems a
sched_job lives inside an amdgpu_job. Can the latter be freed at other
places than free_job()?

timedout_job() and free_job() cannot race against each other regarding
jobs. It's locked.

But maybe investigate Matthew's suggestion and look into the guilty
mechanism, too.

> > > >=20
> > > > > >=20
> > > > > > > The pending_list is probably the one place where we actually =
lock
> > > > > > > consistently and sanely.
> > > > > > >=20
> > > > > > > I think this needs to be debugged more intensively, Christian=
.
> > > > > > >=20
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > What actually looks like a problem is that in drm_sched_job=
_timedout,
> > > > > > > > free_job can be called. Look at [2]=E2=80=94if you=E2=80=99=
re using free_guilty (Xe
> > > > > > > > isn=E2=80=99t, but [2] was Xe trying to do the same thing),=
 this is actually
> > > > > > > > unsafe. The free_guilty code should likely be removed as th=
at definitely
> > > > > > > > can explode under the right conditions.
> > > > > > >=20
> > > > > > > I'm right now not even sure why free_guilty exists, but I don=
't see how
> > > > > >=20
> > > > > > I'm sure why free_guilty exists either. If the fence is signale=
d in
> > > > > > timedout job free_job will get scheduled on another work_item.
> > > > > >=20
> > > > > > > it's illegal for drm_sched to call free_job in drm_sched_job_=
timedout?
> > > > > > >=20
> > > > > > > free_job can be called at any point in time, drivers must exp=
ect that.
> > > > > > > No lock is being held, and timedout_job already ran. So what'=
s the
> > > > > > > problem?
> > > > > > >=20
> > > > > > > For drivers with additional refcounting it would be even less=
 of a
> > > > > > > problem.
> > > > > > >=20
> > > > > >=20
> > > > > > No, the scheduler can still reference the job.
> > > > > >=20
> > > > > > 1265=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence =3D =
sched->ops->run_job(sched_job);
> > > > > > 1266=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete_a=
ll(&entity->entity_idle);
> > > > > > 1267=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_=
fence_scheduled(s_fence, fence);
> > > > > > 1268
> > > > > > 1269=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ER=
R_OR_NULL(fence)) {
> > > > > > 1270=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D dma_fence_add_callback(fence,=
 &sched_job->cb,
> > > > > > 1271=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_job_done_cb);
> > > > > > 1272=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r =3D=3D -ENOENT)
> > > > > > 1273=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_sched_job_done(sched_job, fence->error);
> > > > > > 1274=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (r)
> > > > > > 1275=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", =
r);
> > > > > > 1276
> > > > > > 1277=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(fence);
> > > > > > 1278=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > > > > 1279=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_job_done(sched_job, IS_ER=
R(fence) ?
> > > > > > 1280=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 PTR_ERR(fence) : 0);
> > > > > > 1281=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > 1282
> > > > > > 1283=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up(&s=
ched->job_scheduled);
> > > > > > 1284=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_=
run_job_queue(sched);
> > > > > >=20
> > > > > > At line 1269, the run_job work item is interrupted. Timed-out j=
obs run,
> > > > > > call free_job, which performs the final put. Then the run_job w=
ork item
> > > > > > resumes=E2=80=94and boom, UAF. Using the same reasoning, I thin=
k moving free_job
> > > > > > to the timed-out work queue could also cause issues.
> > > > > >=20
> > > > > > If run_job work item took a reference to the job before adding =
it to the
> > > > > > pending list and dropped it after it was done touching it in th=
is
> > > > > > function, then yes, that would be safe. This is an argument for=
 moving
> > > > > > reference counting into the base DRM scheduler class, it would =
make
> > > > >=20
> > > > > typo: s/DRM scheduler class/DRM job class
> > > >=20
> > > > That strongly sounds like re-inventing the scheduler fence.
> > > >=20
> > >=20
> > > Perhaps.
> > >=20
> > > > What if we completely drop the job object? Or merge it into the sch=
eduler fence?
> > > >=20
> > > > The fence has reference counting, proper state transitions and a we=
ll defined lifetime.
> > > >=20
> > > > We would just need ->schedule and ->finished functions instead of -=
>run_job and ->free_job. Those callbacks would then still be called by the =
scheduler in work item context instead of the irq context of the dma_fence =
callbacks.
> > >=20
> > > Yes, definitely no IRQ contexts.
> > >=20
> > > >=20
> > > > The job can then be a void* in the scheduler fence where drivers ca=
n put anything they want and also drivers control the lifetime of that. E.g=
. they can free it during ->schedule as well as during ->finished.
> > > >=20
> > >=20
> > > I think this is a reasonable idea, but it would require major surgery
> > > across the subsystem plus the 11 upstream drivers I=E2=80=99m countin=
g that use
> > > DRM scheduler. This would be a huge coordinated effort.
> > >=20
> > > So I see three options:
> > >=20
> > > 1. Rename free_job to put_job and document usage. Rip out free_guilty=
.
> > > =C2=A0=C2=A0 Likely the easiest and least invasive.
> >=20
> > I think I can live with that. It's work-effort wise the best we can do
> > right now. However, that does need proper documentation.
>=20
> I think that is the worst of all options.
>=20
> It basically says to the driver that the job lifetime problems created by=
 the scheduler is the driver problem and need to be worked around there.
>=20

My POV still mostly is that (with the current design) the driver must
not use jobs after free_job() was invoked. And when that happens is
unpredictable.

To be unfair, we already have strange refcount expectations already.
But I sort of agree that there is no objectively good solution in
sight.

> >=20
> > Let me respin to my documentation series and upstream that soonish,
> > than we can build on top of that.

> >=20
> >=20
> > P.
> >=20
> > >=20
> > > 2. Move reference counting to the base DRM scheduler job object, prov=
ide a
> > > =C2=A0=C2=A0 vfunc for the final job put, and document usage. Medium =
invasive.
>=20
> I strongly think that reference counting the job object just because the =
scheduler needs it is a bad idea.
>=20
> With that we are just moving the hot potato from one side of our mouth to=
 the other without really solving the issue.
>=20
> If a driver like XE needs that for some reason than that is perfectly fin=
e.

Nouveau doesn't need it either.

>=20
> > > 3. Move job (driver) side tracking to the scheduler fence and let it
> > > =C2=A0=C2=A0 control the lifetime. Very invasive.
>=20
> Thinking about it more that is actually not so much of a problem.
>=20
> Let me try to code something together by the end of next week or so.

The hero Gotham needs :)


P.
