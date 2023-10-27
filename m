Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BB67D9502
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 12:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2C10E06B;
	Fri, 27 Oct 2023 10:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FA510E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 10:17:14 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 05CD66607323;
 Fri, 27 Oct 2023 11:17:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698401832;
 bh=2h8hk+SQ97qcKzY02tCntLAoEaBdkKes8TAJBPX/Uj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ErfVJwGAnO2hO4OkegUAKLtpqFYWkjDqnddlPSvnpIFamep4gtL60EGBkSx8EJTsu
 ZQxH6txqnHo+ZW9GARjHI1pbHt+LXE0TUuxbv80dM+PJD2ZmwfX/i1Dhjt2ZRSeKi8
 WP5ExKAozI8lWlluGq58It5jnDVLlj4NSCDomyn1T/G3vMRCb01NWi3wCdcHqe2JLT
 4bgiHPaR4XHUAt65b07czsn9aPIDXFOtgiPXXd3caz877q2uuewF1FIWACmh6MsDub
 c29CD7PTT0QYt2c6MWUNedaVoJYljfrxXvi9gj3AGb1NBuubV3rNKfpzF5aCvapDk8
 654dIpS8I1U8Q==
Date: Fri, 27 Oct 2023 12:17:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027121707.414810d6@collabora.com>
In-Reply-To: <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
 <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
 <20231027102237.0cdb85af@collabora.com>
 <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Fri, 27 Oct 2023 11:06:44 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 27.10.23 um 10:22 schrieb Boris Brezillon:
> > On Fri, 27 Oct 2023 09:44:13 +0200
> > Christian K=C3=B6nig<christian.koenig@amd.com>  wrote:
> > =20
> >> Am 27.10.23 um 09:39 schrieb Boris Brezillon: =20
> >>> On Fri, 27 Oct 2023 09:35:01 +0200
> >>> Christian K=C3=B6nig<christian.koenig@amd.com>   wrote:
> >>>    =20
> >>>> Am 27.10.23 um 09:32 schrieb Boris Brezillon: =20
> >>>>> On Fri, 27 Oct 2023 09:22:12 +0200
> >>>>> Christian K=C3=B6nig<christian.koenig@amd.com>   wrote:
> >>>>>       =20
> >>>>>>> +
> >>>>>>> +	/**
> >>>>>>> +	 * @update_job_credits: Called once the scheduler is considerin=
g this
> >>>>>>> +	 * job for execution.
> >>>>>>> +	 *
> >>>>>>> +	 * Drivers may use this to update the job's submission credits,=
 which is
> >>>>>>> +	 * useful to e.g. deduct the number of native fences which have=
 been
> >>>>>>> +	 * signaled meanwhile.
> >>>>>>> +	 *
> >>>>>>> +	 * The callback must either return the new number of submission=
 credits
> >>>>>>> +	 * for the given job, or zero if no update is required.
> >>>>>>> +	 *
> >>>>>>> +	 * This callback is optional.
> >>>>>>> +	 */
> >>>>>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job); =20
> >>>>>> Why do we need an extra callback for this?
> >>>>>>
> >>>>>> Just document that prepare_job() is allowed to reduce the number of
> >>>>>> credits the job might need.
> >>>>> ->prepare_job() is called only once if the returned fence is NULL, =
but =20
> >>>>> we need this credit-update to happen every time a job is considered=
 for
> >>>>> execution by the scheduler. =20
> >>>> But the job is only considered for execution once. How do you see th=
at
> >>>> this is called multiple times? =20
> >>> Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
> >>> will go look for another entity that has a job ready for execution, a=
nd
> >>> get back to this entity later, and test drm_sched_can_queue() again.
> >>> Basically, any time drm_sched_can_queue() is called, the job credits
> >>> update should happen, so we have an accurate view of how many credits
> >>> this job needs. =20
> >> Well, that is the handling which I already rejected because it creates
> >> unfairness between processes. When you consider the credits needed
> >> *before* scheduling jobs with a lower credit count are always preferred
> >> over jobs with a higher credit count. =20
> > My bad, it doesn't pick another entity when an entity with a
> > ready job that doesn't fit the queue is found, it just bails out from
> > drm_sched_rq_select_entity_rr() and returns NULL (AKA: no ready entity
> > found). But we still want to update the job credits before checking if
> > the job fits or not (next time this entity is tested). =20
>=20
> Why? I only see a few possibility here:
>=20
> 1. You need to wait for submissions to the same scheduler to finish=20
> before the one you want to push to the ring.
>  =C2=A0=C2=A0=C2=A0 This case can be avoided by trying to cast the depend=
ency fences to=20
> drm_sched_fences and looking if they are already scheduled.
>=20
> 2. You need to wait for submissions to a different scheduler instance=20
> and in this case you should probably return that as dependency instead.

It's already described as a dependency, but native dependency waits are
deferred to the FW (we wait on scheduled to run the job, not finished).
The thing is, after ->prepare_job() returned NULL (no non-native deps
remaining), and before ->run_job() gets called, there might be several
of these native deps that get signaled, and we're still considering
job->submission_credits as unchanged, when each of these signalled
fence could have reduced the job credits, potentially allowing it to be
submitted sooner.

>=20
> So to me it looks like when prepare_job() is called because it is=20
> selected as next job for submission you should already know how many=20
> credits it needs.

You know how many credits it needs when ->prepare_job() is called, but
if this number is too high, the entity will not be picked, and next
time it's checked, you'll still consider the job credits at the time
->prepare_job() was called, which might differ from the current job
credits (signalled native fences might have been signalled in the
meantime, and they could be evicted).

>=20
> >> What you can do is to look at the credits of a job *after* it was pick=
ed
> >> up for scheduling so that you can scheduler more jobs. =20
> > Sure, but then you might further delay your job if something made it
> > smaller (ie. native fences got signaled) between ->prepare_job() and
> > drm_sched_can_queue(). And any new drm_sched_can_queue() test would
> > just see the old credits value.
> >
> > Out of curiosity, what are you worried about with this optional =20
> > ->update_job_credits() call in the drm_sched_can_queue() path? Is the =
=20
> > if (sched->update_job_credits) overhead considered too high for drivers
> > that don't need it? =20
>=20
> Since the dma_fences are also used for resource management the scheduler=
=20
> is vital for correct system operation.
>=20
> We had massively problems because people tried to over-optimize the=20
> dma_fence handling which lead to very hard to narrow down memory=20
> corruptions.
>=20
> So for every change you come up here you need to have a very very good=20
> justification. And just saving a bit size of your ring buffer is=20
> certainly not one of them.

I fail to see how calling ->update_job_credits() changes the scheduler
behavior or how it relates to the sort memory corruption you're
referring to. And yes, we can live with the overhead of making jobs
slightly bigger than they actually are, thus potentially delaying their
execution. It's just that I don't quite understand the rational behind
this conservatism, as I don't really see what negative impact this extra
->update_job_credits() call in the credit checking path has, other than
the slight overhead of an if-check for drivers that don't need it.

Regards,

Boris
