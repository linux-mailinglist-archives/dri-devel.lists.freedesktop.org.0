Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14287386A3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8FF10E494;
	Wed, 21 Jun 2023 14:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BA010E494
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:18:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C28E6606F94;
 Wed, 21 Jun 2023 15:18:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687357091;
 bh=OU6ErLWoVViuJCLZ8kmduE3ULMZk2XC9Oor77rzzcCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JEkFvGaEx8JUT1lLFZZ+bNAYJ0PD1c5Xw/mgb3CO36tIYwscvcvLbJL/wMd8N4mLr
 CrzrLsSV1ppvvwQ1kn4Eh8Pto6GMgDvbj/yDTdyqJ3BETlMa716S7AGLvEcvBDdMNY
 RUyhigVOKd2UDntsLj707N67ZXgc9xt4cCWWxeg6fcYP1JI+EAekhsbWsKd3s/0V1w
 C2d2Ro2c4DHr2L8Qy5C1/R9NJTE7nHKwe7/+4o3DC0PmkcD+uYPfiLHQ5BCo1Xar2W
 cjGNW6KmguPv8ZPkJTMk6usSXuQjH6cWKF9cxqyHJtvAPTxi1wphBZHAbhJAu5O06/
 k6TW8+mK+yU2g==
Date: Wed, 21 Jun 2023 16:18:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v6] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Message-ID: <20230621161808.24262cdd@collabora.com>
In-Reply-To: <dca9af00-271b-168d-c5f5-e6a662be38dc@amd.com>
References: <20230619071921.3465992-1-boris.brezillon@collabora.com>
 <dca9af00-271b-168d-c5f5-e6a662be38dc@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Donald Robson <donald.robson@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Luben,

On Wed, 21 Jun 2023 09:56:40 -0400
Luben Tuikov <luben.tuikov@amd.com> wrote:

> On 2023-06-19 03:19, Boris Brezillon wrote:
> > drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
> > from the dependency array that was waited upon before
> > drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> > so we're basically waiting for all dependencies except one.
> >=20
> > In theory, this wait shouldn't be needed because resources should have
> > their users registered to the dma_resv object, thus guaranteeing that
> > future jobs wanting to access these resources wait on all the previous
> > users (depending on the access type, of course). But we want to keep
> > these explicit waits in the kill entity path just in case.
> >=20
> > Let's make sure we keep all dependencies in the array in
> > drm_sched_job_dependency(), so we can iterate over the array and wait
> > in drm_sched_entity_kill_jobs_cb().
> >=20
> > We also make sure we wait on drm_sched_fence::finished if we were
> > originally asked to wait on drm_sched_fence::scheduled. In that case,
> > we assume the intent was to delegate the wait to the firmware/GPU or
> > rely on the pipelining done at the entity/scheduler level, but when
> > killing jobs, we really want to wait for completion not just scheduling.
> >=20
> > v6:
> > - Back to v4 implementation
> > - Add Christian's R-b
> >=20
> > v5:
> > - Flag deps on which we should only wait for the scheduled event
> >   at insertion time
> >=20
> > v4:
> > - Fix commit message
> > - Fix a use-after-free bug
> >=20
> > v3:
> > - Always wait for drm_sched_fence::finished fences in
> >   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
> >=20
> > v2:
> > - Don't evict deps in drm_sched_job_dependency() =20
>=20
> Hmm, why is this in reverse chronological order?
> It's very confusing.

Dunno, that's how I've always ordered things, and quick look at some
dri-devel patches [1][2] makes me think I'm not the only one to start
from the latest submission.

[1]https://lkml.org/lkml/2023/6/19/941
[2]https://lore.kernel.org/dri-devel/cover.1686729444.git.Sandor.yu@nxp.com=
/T/#t

>=20
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Suggested-by: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Reviewed-by: "Christian K=C3=B6nig" <christian.koenig@amd.com> =20
>=20
> These three lines would usually come after the CCs.

Again, I think I've always inserted those tags before the Cc, but I can
re-order things if you prefer. Let me know if you want me to send a v7
addressing the Cc+changelog ordering.

Regards,

Boris

>=20
> Regards,
> Luben
>=20
> > Cc: Frank Binns <frank.binns@imgtec.com>
> > Cc: Sarah Walker <sarah.walker@imgtec.com>
> > Cc: Donald Robson <donald.robson@imgtec.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 41 +++++++++++++++++++-----
> >  1 file changed, 33 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 68e807ae136a..ec41d82d0141 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -176,16 +176,32 @@ static void drm_sched_entity_kill_jobs_cb(struct =
dma_fence *f,
> >  {
> >  	struct drm_sched_job *job =3D container_of(cb, struct drm_sched_job,
> >  						 finish_cb);
> > -	int r;
> > +	unsigned long index;
> > =20
> >  	dma_fence_put(f);
> > =20
> >  	/* Wait for all dependencies to avoid data corruptions */
> > -	while (!xa_empty(&job->dependencies)) {
> > -		f =3D xa_erase(&job->dependencies, job->last_dependency++);
> > -		r =3D dma_fence_add_callback(f, &job->finish_cb,
> > -					   drm_sched_entity_kill_jobs_cb);
> > -		if (!r)
> > +	xa_for_each(&job->dependencies, index, f) {
> > +		struct drm_sched_fence *s_fence =3D to_drm_sched_fence(f);
> > +
> > +		if (s_fence && f =3D=3D &s_fence->scheduled) {
> > +			/* The dependencies array had a reference on the scheduled
> > +			 * fence, and the finished fence refcount might have
> > +			 * dropped to zero. Use dma_fence_get_rcu() so we get
> > +			 * a NULL fence in that case.
> > +			 */
> > +			f =3D dma_fence_get_rcu(&s_fence->finished);
> > +
> > +			/* Now that we have a reference on the finished fence,
> > +			 * we can release the reference the dependencies array
> > +			 * had on the scheduled fence.
> > +			 */
> > +			dma_fence_put(&s_fence->scheduled);
> > +		}
> > +
> > +		xa_erase(&job->dependencies, index);
> > +		if (f && !dma_fence_add_callback(f, &job->finish_cb,
> > +						 drm_sched_entity_kill_jobs_cb))
> >  			return;
> > =20
> >  		dma_fence_put(f);
> > @@ -415,8 +431,17 @@ static struct dma_fence *
> >  drm_sched_job_dependency(struct drm_sched_job *job,
> >  			 struct drm_sched_entity *entity)
> >  {
> > -	if (!xa_empty(&job->dependencies))
> > -		return xa_erase(&job->dependencies, job->last_dependency++);
> > +	struct dma_fence *f;
> > +
> > +	/* We keep the fence around, so we can iterate over all dependencies
> > +	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
> > +	 * before killing the job.
> > +	 */
> > +	f =3D xa_load(&job->dependencies, job->last_dependency);
> > +	if (f) {
> > +		job->last_dependency++;
> > +		return dma_fence_get(f);
> > +	}
> > =20
> >  	if (job->sched->ops->prepare_job)
> >  		return job->sched->ops->prepare_job(job, entity); =20
>=20

