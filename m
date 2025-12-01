Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C1C96501
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7865F10E379;
	Mon,  1 Dec 2025 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="e6N3GKYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEDB10E379;
 Mon,  1 Dec 2025 09:04:42 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKdJN44kpz9tHg;
 Mon,  1 Dec 2025 10:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764579880; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GT4cyPvoCVkuJ2O+F6s8QsdBNvOe42Gb+b9hD3r69co=;
 b=e6N3GKYWxBG2AJxexzXKjjsp3kcr/rZXDwt8LTJufnZMxLEQqjCR4+IRZXKZIRbYsZYxH8
 Z93OxrkUMChRaMWdb9JstVaIs3vMHIGJ3IrBrDiNAHMGLCNMgg9IAzFdWywoYdW2C0MRSS
 oa95zvqThPvxPjWh5/PH1SrVM8mTzgCD53D2MiWQXWjyAbvcl9gNTFvN/zYyS+eMWpvVqt
 okbgmB8pnjGcAa25ilSgN8fDls41rDnIQ2Ms7NpPXtsa6MbVCqLMNmh6QTj/LRJRsQx3BP
 QD2ojTldb8viEZBgNCheTFXaHDADecvvoAram2hjwhv6vcJUgW5dh+6BOQ27iA==
Message-ID: <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, dakr@kernel.org, Matthew Brost
 <matthew.brost@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 01 Dec 2025 10:04:29 +0100
In-Reply-To: <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1fb26bbbf6cc5791222
X-MBO-RS-META: wt3g5coa1z7afkrg4q61pjcp5cbzsypk
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

+Cc Matthew, Danilo, who are also drm/sched maintainers

The get_maintainer script provides you with a list of maintainers.

On Mon, 2025-12-01 at 09:38 +0100, Christian K=C3=B6nig wrote:
> On 11/28/25 19:22, vitaly.prosyak@amd.com=C2=A0wrote:
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >=20
> > Currently drm_sched runs run_job and free_job on the per-scheduler
> > ordered submit workqueue, while timeouts (drm_sched_job_timedout())
> > run on sched->timeout_wq (e.g. amdgpu reset_domain->wq).
> >=20
> > For drivers like amdgpu the reset path entered from timeout_wq may
> > still access the guilty job while free_job, running on submit_wq,
> > frees it. This allows a use-after-free when recovery continues to
> > touch job fields after drm_sched_free_job_work() has called
> > ops->free_job().
> >=20
> > Queue work_free_job on sched->timeout_wq instead of submit_wq, both
> > from __drm_sched_run_free_queue() and drm_sched_wqueue_start(), so	=09
> > timeout/reset and free_job are always serialized on the same
> > workqueue.
> >=20
> > Behavior changes:
> >=20
> > - work_run_job stays on sched->submit_wq (ordered).
> > - work_free_job moves to sched->timeout_wq (timeout/reset queue).
> > - Submission and freeing may now run in parallel on different
> > =C2=A0 workqueues, but all shared state is already protected by
> > =C2=A0 job_list_lock and atomics.
> >=20
> > Pros:
> > - Eliminates reset vs free_job race (no freeing while reset still
> > =C2=A0 uses the job).

It eliminates such a race *in amdgpu*. Other drivers might not have
that problem. I think Intel/Xe is refcounting jobs? Matthew?

> > - Matches the logical model: timeout selects guilty job and recovery,
> > =C2=A0 including freeing, is handled on one queue.
> >=20
> > Cons / considerations:
> > - For users that don=E2=80=99t provide timeout_wq, free_job moves from =
the
> > =C2=A0 per-sched ordered queue to system_wq, which slightly changes
> > =C2=A0 scheduling behaviour but keeps correctness.
>=20
> We should probably avoid that and use a single ordered wq for submit, tim=
eout, free when the driver doesn't provide one.

AFAICS this fix doesn't fix anything for certain at all, because you
just don't know what kind of workqueue the other drivers have passed
for timeout_wq.

>=20
> We should potentially also add a warning/error when the driver supplied w=
q isn't ordered.
>=20
> Apart from that the change looks sane to me and avoid all the hacky worka=
rounds around job lifetime.

I'm not convinced that this is the right path forward.

The fundamental issue here is the gross design problem within drm/sched
that drivers *create* jobs, but the scheduler *frees* them at an
unpredictable point in time.

This entire fix idea seems to circle around the concept of relying yet
again on the scheduler's internal behavior (i.e., when it schedules the
call to free_job()).

I think we discussed that at XDC, but how I see it if drivers have
strange job life time requirements where a job shall outlive
drm_sched's free_job() call, they must solve that with a proper
synchronization mechanism.

The first question would be: what does amdgpu need the job for after
free_job() ran? What do you even need a job for still after there was a
timeout?

And if you really still need its contents, can't you memcpy() the job
or something?

Assuming that it really needs it and that that cannot easily be solved,
I suppose the obvious answer for differing memory life times is
refcounting. So amdgpu could just let drm_sched drop its reference in
free_job(), and from then onward it's amdgpu's problem.

I hope Matthew can educate us on how Xe does it.

AFAIK Nouveau doesn't have that problem, because on timeout we just
terminate the channel.

Would also be interesting to hear whether other driver folks have the
problem of free_job() being racy.

+Cc Boris, Lucas.


P.


>=20
> But removing those workarounds is should probably be a second step.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Cc: Philipp Stanner <phasta@mailbox.org>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Suggested-by: Mathew from Intel during XDC
> > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 81ad40d9582b..1243200d475e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -355,7 +355,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_=
scheduler *sched)
> > =C2=A0static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *=
sched)
> > =C2=A0{
> > =C2=A0	if (!READ_ONCE(sched->pause_submit))
> > -		queue_work(sched->submit_wq, &sched->work_free_job);
> > +		queue_work(sched->timeout_wq, &sched->work_free_job);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -1493,6 +1493,6 @@ void drm_sched_wqueue_start(struct drm_gpu_schedu=
ler *sched)
> > =C2=A0{
> > =C2=A0	WRITE_ONCE(sched->pause_submit, false);
> > =C2=A0	queue_work(sched->submit_wq, &sched->work_run_job);
> > -	queue_work(sched->submit_wq, &sched->work_free_job);
> > +	queue_work(sched->timeout_wq, &sched->work_free_job);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_sched_wqueue_start);
>=20

