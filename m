Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0507B1581
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4319E10E073;
	Thu, 28 Sep 2023 08:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1E410E5DF;
 Thu, 28 Sep 2023 08:02:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 592E56607334;
 Thu, 28 Sep 2023 09:02:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695888132;
 bh=wtSvbBg7dSoKzotAOBIKINqHbjGklkqiIUx8Cl+V2A8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQ6vYvJg+aQuemvFFrLDmYhFH/f4cONeNnRqCRNrjZk19PmfETKzkQutSdJq3QfG7
 TAyGLyg3y9M88IropVuJ+Qs8DpfzCMSL/DkjLc2vgN/pf5hbYvu62E5U9wHZu0k8Gu
 zFMNoHBFLkE9pd8yu9kXJh7cr3xgWu0OhfLo4znHtCF5mpD6/ASuWwoK3ULKcuLyZt
 DWlbwGmdWTKwSMxw42xwRS8P2F0s7lR0FLN9wXglv4ue2ATK9OfWOeLwacZb9Ibdxq
 5lhYI3TBEyY2Idd9D8CqH+xf0QtBe1fmGd/lmyfzPMp0m9XvgbB7KodAPDDLBGFUIq
 MJePaFhjEO5Bg==
Date: Thu, 28 Sep 2023 10:02:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Message-ID: <20230928100209.37df66f3@collabora.com>
In-Reply-To: <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sep 2023 13:54:38 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 26.09.23 um 09:11 schrieb Boris Brezillon:
> > On Mon, 25 Sep 2023 19:55:21 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Am 25.09.23 um 14:55 schrieb Boris Brezillon: =20
> >>> +The imagination team, who's probably interested too.
> >>>
> >>> On Mon, 25 Sep 2023 00:43:06 +0200
> >>> Danilo Krummrich <dakr@redhat.com> wrote:
> >>>    =20
> >>>> Currently, job flow control is implemented simply by limiting the am=
ount
> >>>> of jobs in flight. Therefore, a scheduler is initialized with a
> >>>> submission limit that corresponds to a certain amount of jobs.
> >>>>
> >>>> This implies that for each job drivers need to account for the maxim=
um
> >>>> job size possible in order to not overflow the ring buffer.
> >>>>
> >>>> However, there are drivers, such as Nouveau, where the job size has a
> >>>> rather large range. For such drivers it can easily happen that job
> >>>> submissions not even filling the ring by 1% can block subsequent
> >>>> submissions, which, in the worst case, can lead to the ring run dry.
> >>>>
> >>>> In order to overcome this issue, allow for tracking the actual job s=
ize
> >>>> instead of the amount job jobs. Therefore, add a field to track a jo=
b's
> >>>> submission units, which represents the amount of units a job contrib=
utes
> >>>> to the scheduler's submission limit. =20
> >>> As mentioned earlier, this might allow some simplifications in the
> >>> PowerVR driver where we do flow-control using a dma_fence returned
> >>> through ->prepare_job(). The only thing that'd be missing is a way to
> >>> dynamically query the size of a job (a new hook?), instead of having =
the
> >>> size fixed at creation time, because PVR jobs embed native fence wait=
s,
> >>> and the number of native fences will decrease if some of these fences
> >>> are signalled before ->run_job() is called, thus reducing the job siz=
e. =20
> >> Exactly that is a little bit questionable since it allows for the devi=
ce
> >> to postpone jobs infinitely.
> >>
> >> It would be good if the scheduler is able to validate if it's ever able
> >> to run the job when it is pushed into the entity. =20
> > Yes, we do that already. We check that the immutable part of the job
> > (everything that's not a native fence wait) fits in the ringbuf. =20
>=20
> Yeah, but thinking more about it there might be really bad side effects.=
=20
> We shouldn't use a callback nor job credits because it might badly=20
> influence fairness between entities.
>=20
> In other words when one entity submits always large jobs and another one=
=20
> always small ones then the scheduler would prefer the one which submits=20
> the smaller ones because they are easier to fit into the ring buffer.

Yeah, I was assuming SINGLE_ENTITY sched policy here. As soon as we
have a ring buffer that's shared by several entities it becomes tricky
to be fair if the job sizes are dynamic. In the multi-entity case, the
->prepare_job()+dma_fence approach addresses the problem, because the
first job to call ->prepare_job() and add its fence to the list of jobs
waiting for ringbuf space will also be the first one to be checked when
some space is freed, and if there's still not enough space, we won't
test other jobs coming after in the list.

>=20
> What we can do is the follow:
> 1. The scheduler has some initial credits it can use to push jobs.
> 2. Each scheduler fence (and *not* the job) has a credits field of how=20
> much it will use.

When are the credits assigned to the scheduler fence? As said earlier,
on PowerVR, we might start with N credits when the job is queued, and
(N - M) when it gets submitted, so we need a hook to force a
recalculation every time the scheduler is considering the job for
submission.

> 3. After letting a a job run the credits of it's fence are subtracted=20
> from the available credits of the scheduler.

Uh, what happens if the job you picked make the scheduler
available credits pass under zero? I guess that's relying on the
fact you only expose half of the ring buffer capacity, thus enforcing
that a job is never bigger than half the ring buffer. The latter is
acceptable, but the fact your utilization is then half the maximum
capacity is not great IMHO.

> 4. The scheduler can keep running jobs as long as it has a positive=20
> credit count.

Why not just check that 'next_job_credits < available_credits', and
force the scheduler to go to sleep if that's not the case. When it's
woken up because the parent fence of some previous job is signaled, we
re-evaluate the condition, and go back to sleep if we still don't have
enough credits. In the PowerVR case, I'd need a wait to recalculate the
number of credits every time the condition is re-evaluated, but that's
just a matter of adding an optional hook to force the re-calculation.

> 5. When the credit count becomes negative it goes to sleep until a=20
> scheduler fence signals and the count becomes positive again.
>=20
> This way jobs are handled equally, you can still push jobs up to at=20
> least halve your ring buffer size

I think that's the aspect I'm not fond of. I don't see why we'd want to
keep half of the ring buffer unused. I mean, there might be good
reasons to do so, if, for instance, the same ring buffer is used for
some high-priority commands sent by the kernel or something like that.
But it looks like a driver-specific decision to not fully use the ring
buffer.

> and you should be able to handle your=20
> PowerVR case by calculating the credits you actually used in your=20
> run_job() callback.

Hm, ideally the credits adjustment should happen every time the
scheduler is considering a job for submission (every time it got
unblocked because available credits got increased), otherwise you might
wait longer than strictly needed if some native fences got signaled in
the meantime.
