Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA899732D52
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80F610E5AB;
	Fri, 16 Jun 2023 10:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5710E5AB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:19:54 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B82D6606F7B;
 Fri, 16 Jun 2023 11:19:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686910791;
 bh=FjzNN6Pqp29wF2GUYvMjc3FE930n1LCmT6ZlOZCUpis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VloDWUamhg75Ld7u6F/v5cy2BJdgE9B3uS79+vE0SL0dU/IH3efhr/n++QjYtMMHP
 wRBakT8PYVh2ULKs4I3NLOHP1RvYOmfAEoe6tIW+zENJoGJvK9bDTzqJGUtF3kIJvA
 rXwlT8qwEfGIqhFqXmEyGhIl397yttqRcevzMyLln9qqFRqOhwu6SjtoM3PVs/7ka4
 3o/fgrgZ3uXPv1wuL0Qkvgt1ex88vOGLmG/HREOmsBmoGINGqOrOj6VtKXRaeI+EM7
 RNP7zPdnf32Y6i2QRSjzezeYzgQ3GXtkm9HOfeoag2dHqHQlfcLYtqZOqzFMb81gf9
 usHcgFZNX/Clg==
Date: Fri, 16 Jun 2023 12:19:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Message-ID: <20230616121948.3de5669d@collabora.com>
In-Reply-To: <20230613092845.2166940-1-boris.brezillon@collabora.com>
References: <20230613092845.2166940-1-boris.brezillon@collabora.com>
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

On Tue, 13 Jun 2023 11:28:45 +0200
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
> We also make sure we wait on drm_sched_fence::finished if we were asked
> to wait on drm_sched_fence::scheduled, but the intent was probably to
> delegate the wait to the GPU, but we want resources to be completely
> idle when killing jobs.
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
>  drivers/gpu/drm/scheduler/sched_entity.c | 28 ++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 68e807ae136a..bc1bc3d47f7f 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -176,13 +176,24 @@ static void drm_sched_entity_kill_jobs_cb(struct dm=
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
> +		struct drm_sched_fence *s_fence =3D to_drm_sched_fence(f);
> +
> +		/* Make sure we wait for the finished fence here, so we can
> +		 * guarantee that any job we depend on that is still accessing
> +		 * resources is done before we signal this job finished fence
> +		 * and unblock further accesses on those resources.
> +		 */
> +		if (s_fence && f =3D=3D &s_fence->scheduled)
> +			f =3D &s_fence->finished;

Oops. There's a use-after-free+leak bug here: when switching from
scheduled to finished fence, we need to grab a ref on the finished
fence and release the one we had on the scheduled fence.

Sending a v4 to fix that.

> +
> +		xa_erase(&job->dependencies, index);
>  		r =3D dma_fence_add_callback(f, &job->finish_cb,
>  					   drm_sched_entity_kill_jobs_cb);
>  		if (!r)
> @@ -415,8 +426,17 @@ static struct dma_fence *
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
> +		job->last_dependency++;
> +		return dma_fence_get(f);
> +	}
> =20
>  	if (job->sched->ops->prepare_job)
>  		return job->sched->ops->prepare_job(job, entity);

