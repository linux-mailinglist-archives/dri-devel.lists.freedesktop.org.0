Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042AAB09FB6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80C10E939;
	Fri, 18 Jul 2025 09:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HNjVduxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F710E938;
 Fri, 18 Jul 2025 09:31:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bk4Kp272Lz9trL;
 Fri, 18 Jul 2025 11:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752831070; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPIGraXFzaWpw2pUd6/w8T550M679k9Qmn29uZiTE8c=;
 b=HNjVduxmBmEXLt1PIB8E62l/6boLL5+LtJzJNSzxBXmvueBV8Lkx7TMHY/y5bzv6P6DcbE
 hsLMejABbsWoDK1M5BsV2IU15WsCdxWSR9wf47rPuLUakLhQQo6xYrLw0lv4bWJjh88WvO
 XRHSXliS57nVqydiAqzsFmvCLpTiDdkhm08VSGqWKuqL1AwBgPlhqtSPksKesg/QNLrkzs
 UckxRxJmNOLiiBeK6wAcSjHvB1MvWNgFNugyMt2gK1E15b9YXA6QGB3UTGdb5qxobPquII
 /rOjmh5pUvnxdYyHTfHa7/nQjbDIXU2X/5kaa03DvYv/nPicU22/ZjmLzHzG+w==
Message-ID: <3448a6cf097051ea9fbd5beba741b624c831df2c.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org, Philipp Stanner <phasta@kernel.org>
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>
Date: Fri, 18 Jul 2025 11:31:05 +0200
In-Reply-To: <ad66eeac-26d7-4f46-b29c-7b43ce793ea8@igalia.com>
References: <20250716085117.56864-1-tvrtko.ursulin@igalia.com>
 <8e527b62-d968-4bc3-a0dc-491d193c02ce@igalia.com>
 <52d32846-0286-4979-ab2f-c1aa1aa02e20@igalia.com>
 <f535c0bf-225a-40c9-b6a1-5bfbb5ebec0d@igalia.com>
 <b5ff1fba-0e2c-4d02-8b9d-49c3c313e65d@igalia.com>
 <c1c9bb53-399d-4f1a-a6de-8cf354c2e903@igalia.com>
 <ad66eeac-26d7-4f46-b29c-7b43ce793ea8@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: guo67enpcbsknhud7hfape4xxh4e7rcr
X-MBO-RS-ID: e7a70689dee4a6b70da
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

On Fri, 2025-07-18 at 08:13 +0100, Tvrtko Ursulin wrote:
>=20
> On 16/07/2025 21:44, Ma=C3=ADra Canal wrote:
> > Hi Tvrtko,
> >=20
> > On 16/07/25 11:46, Tvrtko Ursulin wrote:
> > >=20
> > > On 16/07/2025 15:30, Ma=C3=ADra Canal wrote:
> > > > Hi Tvrtko,
> > > >=20
> > > > On 16/07/25 10:49, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 16/07/2025 14:31, Ma=C3=ADra Canal wrote:
> > > > > > Hi Tvrtko,
> > > > > >=20
> > > > > > On 16/07/25 05:51, Tvrtko Ursulin wrote:
> > > > > > > Currently the job free work item will lock sched->job_list_lo=
ck=20
> > > > > > > first time
> > > > > > > to see if there are any jobs, free a single job, and then loc=
k=20
> > > > > > > again to
> > > > > > > decide whether to re-queue itself if there are more finished =
jobs.
> > > > > > >=20
> > > > > > > Since drm_sched_get_finished_job() already looks at the secon=
d job=20
> > > > > > > in the
> > > > > > > queue we can simply add the signaled check and have it return=
 the=20
> > > > > > > presence
> > > > > > > of more jobs to be freed to the caller. That way the work ite=
m=20
> > > > > > > does not
> > > > > > > have to lock the list again and repeat the signaled check.
> > > > > > >=20
> > > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > > Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > > > ---
> > > > > > > v2:
> > > > > > > =C2=A0 * Improve commit text and kerneldoc. (Philipp)
> > > > > > > =C2=A0 * Rename run free work helper. (Philipp)
> > > > > > >=20
> > > > > > > v3:
> > > > > > > =C2=A0 * Rebase on top of Maira's changes.
> > > > > > > ---
> > > > > > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 53 +++++++++=
=20
> > > > > > > +----------------
> > > > > > > =C2=A0 1 file changed, 21 insertions(+), 32 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers=
/gpu/=20
> > > > > > > drm/ scheduler/sched_main.c
> > > > > > > index e2cda28a1af4..5a550fd76bf0 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -349,34 +349,13 @@ static void drm_sched_run_job_queue(str=
uct=20
> > > > > > > drm_gpu_scheduler *sched)
> > > > > > > =C2=A0 }
> > > > > > > =C2=A0 /**
> > > > > > > - * __drm_sched_run_free_queue - enqueue free-job work
> > > > > > > - * @sched: scheduler instance
> > > > > > > - */
> > > > > > > -static void __drm_sched_run_free_queue(struct drm_gpu_schedu=
ler=20
> > > > > > > *sched)
> > > > > > > -{
> > > > > > > -=C2=A0=C2=A0=C2=A0 if (!READ_ONCE(sched->pause_submit))
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue_work(sched-=
>submit_wq, &sched->work_free_job);
> > > > > > > -}
> > > > > > > -
> > > > > > > -/**
> > > > > > > - * drm_sched_run_free_queue - enqueue free-job work if ready
> > > > > > > + * drm_sched_run_free_queue - enqueue free-job work
> > > > > > > =C2=A0=C2=A0 * @sched: scheduler instance
> > > > > > > =C2=A0=C2=A0 */
> > > > > > > =C2=A0 static void drm_sched_run_free_queue(struct drm_gpu_sc=
heduler=20
> > > > > > > *sched)
> > > > > > > =C2=A0 {
> > > > > > > -=C2=A0=C2=A0=C2=A0 struct drm_sched_job *job;
> > > > > > > -
> > > > > > > -=C2=A0=C2=A0=C2=A0 job =3D list_first_entry_or_null(&sched->=
pending_list,
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_sched_job, list);
> > > > > > > -=C2=A0=C2=A0=C2=A0 if (job && dma_fence_is_signaled(&job->s_=
fence->finished))
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_sched_run_f=
ree_queue(sched);
> > > > > >=20
> > > > > > I believe we'd still need this chunk for DRM_GPU_SCHED_STAT_NO_=
HANG
> > > > > > (check the comment in drm_sched_job_reinsert_on_false_timeout()=
). How
> > > > >=20
> > > > > You mean the "is there a signaled job in the list check" is neede=
d=20
> > > > > for drm_sched_job_reinsert_on_false_timeout()? Hmm why? Worst cas=
e=20
> > > > > is a false positive wakeup on the free worker, no?
> > > >=20
> > > > Correct me if I'm mistaken, we would also have a false positive wak=
e-up
> > > > on the run_job worker, which I believe it could be problematic in t=
he
> > > > cases that we skipped the reset because the job is still running.
> > >=20
> > > Run job worker exits when it sees no free credits so I don't think=
=20
> > > there is a problem. What am I missing?
> > >=20
> >=20
> > I was the one missing the code in `drm_sched_can_queue()`. Sorry for th=
e
> > misleading comments. This is:
> >=20
> > Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> No worries, and thanks!
>=20
> Philipp - are you okay with this version? V2 was done to address your
> feedback so that should be good now.

Was just giving it another spin when you wrote. (a [PATCH v3] would've
been neat for identification, though =E2=80=93 I almost pulled the wrong pa=
tch
from the archive *wink*)

LGTM, improves things, can be merged.

However, we had to merge Lin Cao's bug fix [1] recently. That one is
now in drm-misc-fixes, and your patch should go to drm-misc-next. This
would cause a conflict once the two branches meet.

So I suggest that we wait with this non-urgent patch until drm-misc-
fixes / Linus's -rc gets merged into drm-misc-next, and then we apply
it. Should be next week or the week after AFAIK.

Unless somebody has a better idea, of course?

Remind me in case I forget.


P.

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/15f77764e90a713=
ee3916ca424757688e4f565b9


>=20
> Regards,
>=20
> Tvrtko
>=20

