Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7F733768
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 19:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FC010E66F;
	Fri, 16 Jun 2023 17:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F008610E66F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:24:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 561076606F85;
 Fri, 16 Jun 2023 18:24:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686936289;
 bh=OmisbY+HnfoVBHj7IiqsxBDVYNYjawvKTUbrlIDO1jM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YMED8G18grY3BZSKOfMna74XfboFsE4YpYQzgK9neSfyNQpuFcMB4KBC09VIjJSFB
 2OohmpSiv6zjukWK+0JNYzHa7oHHumuHLvaJ5IMR8Er6+R2gzA7wPBckFFKaJCVdJo
 WA6A0ZucIZUikPHe3sRJjxhfjW4tv1L51Sy/+FJ3+xKpQwmPa299IEPnfeSrifovxz
 N5xvY1h4A//2LoC1aFP5oP/m2sMTmTZOCuKNs5qNp00K+uFyuwAljzebe3ofU6H7GF
 xDVwRsKIy3rpWnzfkgUki+3Jne9fyjlN0HSVVNwxWnDUoaheTbnPQw7tfoqlXclJNI
 3UnC4hHOXkghg==
Date: Fri, 16 Jun 2023 19:24:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Message-ID: <20230616192445.1c0ca765@collabora.com>
In-Reply-To: <20230616171248.3228113-1-boris.brezillon@collabora.com>
References: <20230616171248.3228113-1-boris.brezillon@collabora.com>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 19:12:48 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
> from the dependency array that was waited upon before
> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> so we're basically waiting for all dependencies except one.
>=20
> In theory, this wait shouldn't be needed because resources should have
> their users registered to the dma_resv object, thus guaranteeing that
> future jobs wanting to access these resources wait on all the previous
> users (depending on the access type, of course). But we want to keep
> these explicit waits in the kill entity path just in case.
>=20
> Let's make sure we keep all dependencies in the array in
> drm_sched_job_dependency(), so we can iterate over the array and wait
> in drm_sched_entity_kill_jobs_cb().
>=20
> We make sure we wait on drm_sched_fence::finished if we were
> originally asked to wait on drm_sched_fence::scheduled. In that case,
> we assume the intent was to delegate the wait to the firmware/GPU or
> rely on the pipelining done at the entity/scheduler level, but when
> killing jobs, we really want to wait for completion not just scheduling.
>=20
> v5:
> - Flag deps on which we should only wait for the scheduled event
>   at insertion time.
>=20
> v4:
> - Fix commit message
> - Fix a use-after-free bug
>=20
> v3:
> - Always wait for drm_sched_fence::finished fences in
>   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
>=20
> v2:
> - Don't evict deps in drm_sched_job_dependency()
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Sarah Walker <sarah.walker@imgtec.com>
> Cc: Donald Robson <donald.robson@imgtec.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> ---
> Hello Christian,
>=20
> It turns out the approach you suggested just moves the complexity to
> the insertion path, and it actually makes the 'should we replace or
> drop fence' test a bit more tedious. We might end up with less
> duplicates if some drivers start mixing scheduled/finished fences, but
> I doubt this will be the case in practice, and I'm not sure it's worth
> the extra complexity.
>=20
> Let me know what you think.
>=20
> Regards,
>=20
> Boris
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 29 ++++++++++++--
>  drivers/gpu/drm/scheduler/sched_main.c   | 50 +++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              |  7 ++++
>  3 files changed, 80 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 68e807ae136a..ffdee2544f42 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -176,13 +176,14 @@ static void drm_sched_entity_kill_jobs_cb(struct dm=
a_fence *f,
>  {
>  	struct drm_sched_job *job =3D container_of(cb, struct drm_sched_job,
>  						 finish_cb);
> +	unsigned long index;
>  	int r;
> =20
>  	dma_fence_put(f);
> =20
>  	/* Wait for all dependencies to avoid data corruptions */
> -	while (!xa_empty(&job->dependencies)) {
> -		f =3D xa_erase(&job->dependencies, job->last_dependency++);
> +	xa_for_each(&job->dependencies, index, f) {
> +		xa_erase(&job->dependencies, index);
>  		r =3D dma_fence_add_callback(f, &job->finish_cb,
>  					   drm_sched_entity_kill_jobs_cb);
>  		if (!r)
> @@ -415,8 +416,28 @@ static struct dma_fence *
>  drm_sched_job_dependency(struct drm_sched_job *job,
>  			 struct drm_sched_entity *entity)
>  {
> -	if (!xa_empty(&job->dependencies))
> -		return xa_erase(&job->dependencies, job->last_dependency++);
> +	struct dma_fence *f;
> +
> +	/* We keep the fence around, so we can iterate over all dependencies
> +	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
> +	 * before killing the job.
> +	 */
> +	f =3D xa_load(&job->dependencies, job->last_dependency);
> +	if (f) {
> +		/* If the entry is flagged as 'wait-for-scheduled', we are
> +		 * dealing with a drm_sched_fence and we want to wait for
> +		 * the scheduled event only.
> +		 */
> +		if (xa_get_mark(&job->dependencies, job->last_dependency,
> +				DRM_SCHED_DEP_WAIT_FOR_SCHEDULED)) {
> +			struct drm_sched_fence *s_fence =3D to_drm_sched_fence(f);
> +
> +			f =3D &s_fence->scheduled;
> +		}
> +
> +		job->last_dependency++;
> +		return dma_fence_get(f);
> +	}
> =20
>  	if (job->sched->ops->prepare_job)
>  		return job->sched->ops->prepare_job(job, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 394010a60821..8ac207cbd713 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -691,6 +691,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>  				 struct dma_fence *fence)
>  {
> +	bool fence_wait_for_scheduled =3D false;
> +	struct drm_sched_fence *s_fence;
>  	struct dma_fence *entry;
>  	unsigned long index;
>  	u32 id =3D 0;
> @@ -699,20 +701,64 @@ int drm_sched_job_add_dependency(struct drm_sched_j=
ob *job,
>  	if (!fence)
>  		return 0;
> =20
> +	s_fence =3D to_drm_sched_fence(fence);
> +	if (s_fence && fence =3D=3D &s_fence->scheduled) {
> +		/* Make sure the finished fence hasn't been destroyed. */
> +		fence =3D dma_fence_get_rcu(&s_fence->finished);
> +		if (WARN_ON(!fence))
> +			return -EINVAL;
> +
> +		/* Release the scheduled fence ref, now that we have a
> +		 * ref on the finished fence.
> +		 */
> +		dma_fence_put(&s_fence->scheduled);
> +
> +		/* Waiting for scheduled event only. */
> +		fence_wait_for_scheduled =3D true;
> +	}
> +
>  	/* Deduplicate if we already depend on a fence from the same context.
>  	 * This lets the size of the array of deps scale with the number of
>  	 * engines involved, rather than the number of BOs.
>  	 */
>  	xa_for_each(&job->dependencies, index, entry) {
> +		bool entry_wait_for_scheduled, fence_is_later;
> +
>  		if (entry->context !=3D fence->context)
>  			continue;
> =20
> -		if (dma_fence_is_later(fence, entry)) {
> +		entry_wait_for_scheduled =3D xa_get_mark(&job->dependencies,
> +						       index,
> +						       DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);
> +		fence_is_later =3D dma_fence_is_later(fence, entry);
> +
> +		/*
> +		 * We can replace entry by fence when:
> +		 * - fence is after entry and both are waiting on scheduled
> +		 * - fence is after entry and both are waiting on finished
> +		 * - fence is after entry, entry is waiting on scheduled and fence on =
finished
> +		 *
> +		 * We can keep entry and drop fence when:
> +		 * - fence is before entry and both are waiting on scheduled
> +		 * - fence is before entry and both are waiting on finished
> +		 * - fence is before entry, fence is waiting on scheduled and entry on=
 finished
> +		 *
> +		 * In all other situations, we can't guarantee the order and have to d=
uplicate.
> +		 */
> +		if (fence_is_later && entry_wait_for_scheduled >=3D fence_wait_for_sch=
eduled) {
>  			dma_fence_put(entry);
>  			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> -		} else {
> +			if (fence_wait_for_scheduled) {
> +				xa_set_mark(&job->dependencies, index,
> +					    DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);
> +			}
> +		} else if (!fence_is_later &&
> +			   entry_wait_for_scheduled <=3D fence_wait_for_scheduled) {
>  			dma_fence_put(fence);
> +		} else {
> +			continue;
>  		}
> +
>  		return 0;
>  	}

Forgot to flag wait-for-scheduled in the insertion path:

        ret =3D xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_=
KERNEL);
	if (ret !=3D 0)
		dma_fence_put(fence);
	else if (fence_wait_for_scheduled)
		xa_set_mark(&job->dependencies, index, DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);

	return ret;

> =20
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e95b4837e5a3..fbdb01242997 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -262,6 +262,13 @@ struct drm_sched_rq {
>  	struct rb_root_cached		rb_tree_root;
>  };
> =20
> +/*
> + * Used to flag dependency entries that are backed by drm_sched_fence ob=
ject
> + * and on which we should only wait for the scheduled events.
> + * For internal use only.
> + */
> +#define DRM_SCHED_DEP_WAIT_FOR_SCHEDULED	XA_MARK_1
> +
>  /**
>   * struct drm_sched_fence - fences corresponding to the scheduling of a =
job.
>   */

