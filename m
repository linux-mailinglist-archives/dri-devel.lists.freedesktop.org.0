Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59654CB048E
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F6F10E62C;
	Tue,  9 Dec 2025 14:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ItqgDRTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BBC10E62C;
 Tue,  9 Dec 2025 14:28:57 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dQh6t4MXXz9tfC;
 Tue,  9 Dec 2025 15:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765290534; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH+Y9KeknWI8JyVBlC0VzCDXKp47PFORc9ZJs04hGUM=;
 b=ItqgDRTBLdpQvGmuY3+kLXZnjLHuvuY78GzWFaNJ8IE0gYHSLK50WZ0NVormLZYbMroPqo
 faAJcaYBK9bfTyv+OUJrruhPs0+aSAbpvEfjIxxpyIkHK0771vEie0ADkHIJw3K64xA2Ab
 ndcWWl1OXPfgWYh/TqUf5UiWEYPPlwfLpuGI0XYOsvqOXo0M/91bqfI3KvfSAdLqXPjafu
 J8wJfzt0M7nxECeouqVbLRHJPBh6sOqsgDZdd5JETQ/Q3fAAfJj1ZU42xsCxfCGMxelDtQ
 /qwGvYHgPLDNc2DT00w7syi7hfcwEr0ASb6XdvKitrGBDoAYWWBOdYnCjOgXCQ==
Message-ID: <fb93bfa5f32025ce187153d0eeb47c43ec8cec7b.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, Lucas
 Stach <l.stach@pengutronix.de>
Date: Tue, 09 Dec 2025 15:28:49 +0100
In-Reply-To: <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
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
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 4e2b34a21ee5ee42a46
X-MBO-RS-META: 59x7133399ppjrfs4igxfy93x4hgts4a
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

On Tue, 2025-12-09 at 15:19 +0100, Christian K=C3=B6nig wrote:
> On 12/9/25 14:51, Philipp Stanner wrote:
> ...
> > > > > > > > > How can free_job_work, through drm_sched_get_finished_job=
(), get and
> > > > > > > > > free the same job?
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > It can't.
> > > > > >=20
> > > > > > But exactly that happens somehow. Don't ask me how, I have no i=
dea.
> > > >=20
> > > > *Philipp refuses to elaborate and asks Christian*
> > > >=20
> > > > How are you so sure about that's what's happening? Anyways, assumin=
g it
> > > > is true:
> > >=20
> > > [=C2=A0 489.134585] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [=C2=A0 489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_=
gpu_recover+0x968/0x990 [amdgpu]
> > > [=C2=A0 489.151339] Read of size 4 at addr ffff88a0d5f4214c by task k=
worker/u128:0/12
> > > [=C2=A0 489.158686]=20
> > > [=C2=A0 489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Taint=
ed: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 E=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.16.0-1289896.3.zuul.0ec208edc00d48a9=
bae1719675cb777f #1 PREEMPT(voluntary)=20
> > > [=C2=A0 489.160285] Tainted: [E]=3DUNSIGNED_MODULE
> > > [=C2=A0 489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T=
, BIOS V1.03.B10 04/01/2019
> > > [=C2=A0 489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedou=
t [gpu_sched]
> > > [=C2=A0 489.160306] Call Trace:
> > > [=C2=A0 489.160308]=C2=A0 <TASK>
> > > [=C2=A0 489.160311]=C2=A0 dump_stack_lvl+0x64/0x80
> > > [=C2=A0 489.160321]=C2=A0 print_report+0xce/0x630
> > > [=C2=A0 489.160328]=C2=A0 ? _raw_spin_lock_irqsave+0x86/0xd0
> > > [=C2=A0 489.160333]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> > > [=C2=A0 489.160337]=C2=A0 ? amdgpu_device_gpu_recover+0x968/0x990 [am=
dgpu]
> > > [=C2=A0 489.161044]=C2=A0 kasan_report+0xb8/0xf0
> > > [=C2=A0 489.161049]=C2=A0 ? amdgpu_device_gpu_recover+0x968/0x990 [am=
dgpu]
> > > [=C2=A0 489.161756]=C2=A0 amdgpu_device_gpu_recover+0x968/0x990 [amdg=
pu]
> > > [=C2=A0 489.162464]=C2=A0 ? __pfx_amdgpu_device_gpu_recover+0x10/0x10=
 [amdgpu]
> > > [=C2=A0 489.163170]=C2=A0 ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
> > > [=C2=A0 489.163904]=C2=A0 amdgpu_job_timedout+0x642/0x1400 [amdgpu]
> > > [=C2=A0 489.164698]=C2=A0 ? __pfx__raw_spin_lock+0x10/0x10
> > > [=C2=A0 489.164703]=C2=A0 ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdg=
pu]
> > > [=C2=A0 489.165496]=C2=A0 ? _raw_spin_lock+0x75/0xc0
> > > [=C2=A0 489.165499]=C2=A0 ? __pfx__raw_spin_lock+0x10/0x10
> > > [=C2=A0 489.165503]=C2=A0 drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sch=
ed]
> >=20
> > That doesn't show that it's free_job() who freed the memory.
>=20
> [=C2=A0 489.405936] Freed by task 2501:
> [=C2=A0 489.409175]=C2=A0 kasan_save_stack+0x20/0x40
> [=C2=A0 489.413122]=C2=A0 kasan_save_track+0x14/0x30
> [=C2=A0 489.417064]=C2=A0 kasan_save_free_info+0x3b/0x60
> [=C2=A0 489.421355]=C2=A0 __kasan_slab_free+0x37/0x50
> [=C2=A0 489.425384]=C2=A0 kfree+0x1fe/0x3f0
> [=C2=A0 489.428547]=C2=A0 drm_sched_free_job_work+0x50e/0x930 [gpu_sched]
> [=C2=A0 489.434326]=C2=A0 process_one_work+0x679/0xff0

The time stamp shows that this free here took place after the UAF
occurred :D


> =C2=A0
> > @Vitaly: Can you reproduce the bug? If yes, adding debug prints
> > printing the jobs' addresses when allocated and when freed in
> > free_job() could be a solution.
>=20
> We can reproduce this pretty reliable in our CI now.
>=20
> > I repeat, we need more info :)
> >=20
> > >=20
> > > >=20
> > > > > >=20
> > > > > > My educated guess is that the job somehow ends up on the pendin=
g list again.
> > > >=20
> > > > then the obvious question would be: does amdgpu touch the pending_l=
ist
> > > > itself, or does it only ever modify it through proper scheduler API=
s?
> > >=20
> > > My educated guess is that drm_sched_stop() inserted the job back into=
 the pending list, but I still have no idea how it is possible that free_jo=
b is running after the scheduler is stopped.
> > >=20
> >=20
> > And my uneducated guess is that it's happening in amdgpu. It seems a
> > sched_job lives inside an amdgpu_job. Can the latter be freed at other
> > places than free_job()?
>=20
> Nope, except for error handling during creation and initialization.
>=20
> > timedout_job() and free_job() cannot race against each other regarding
> > jobs. It's locked.
> >=20
> > But maybe investigate Matthew's suggestion and look into the guilty
> > mechanism, too.
>=20
> That looks just like a leftover from earlier attempts to fix the same pro=
blem.
>=20
> I mean look at the git history of how often that problem came up...

If that's the case, then we don't want to yet add another solution to a
problem we don't fully understand and which, apparently, only occurs in
amdgpu today.

What we need is an analysis of what's happening. Only then can we
decide what to do.

Just switching the workqueues without such good justification receives
a NACK from me; also because of the unforseeable consequences =E2=80=93
free_job() is invoked extremely frequently, timedout_job() very rarely.
Drivers will not expect that their timeout_wq will be flooded with so
many work items. That could very certainly change behavior, cause
performance regressions and so on.


P.



