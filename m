Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F73C81CB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 11:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A196E1EC;
	Wed, 14 Jul 2021 09:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD156E1EC;
 Wed, 14 Jul 2021 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=UeOKaFnfCyozR8sxjMRQ+L5EFUyZH6NbwmGrDGZNJr4=; 
 b=RyrQbUsqLI29NT9+ffmiwDbb0k2S1gD6y4Kpc9jIdzQv9RH3pmqrYJIqrBqHM0YXsfDNS+zmkymyLEI/WX1V1kCcyYdbwb/yuTUSvNQSgtR3c80i5bTNnOYmpSH/s/WZ6LMwOU9EyerK1KI2riGMLx+Cjb7GLRUl5AoQTxPa7xfZLSbuquJ2WcRYdJ+juzXVfhhtYWv47HQMT/3PmWudc7aq7YajtV+Z6ndejvEn6+Gc5B5zrjaG0faVrAVP5USwN26eH4pyEevLAPQcmfWQPgbb1cUZgGft74xCV+YqsprqtjkV0zdsWLJrl34Hs91rFJf00urADLJKgtZGNzpBJg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m3bKa-00059e-MV; Wed, 14 Jul 2021 11:37:28 +0200
Date: Wed, 14 Jul 2021 10:37:11 +0100
From: Melissa Wen <mwen@igalia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 09/18] drm/v3d: Use scheduler dependency handling
Message-ID: <20210714093711.4cuqwfsq46vqnghi@mail.igalia.com>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3s4cgzbpt6t6h4on"
Content-Disposition: inline
In-Reply-To: <20210712175352.802687-10-daniel.vetter@ffwll.ch>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Cc : Emma Anholt" <emma@anholt.net>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3s4cgzbpt6t6h4on
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/12, Daniel Vetter wrote:
> With the prep work out of the way this isn't tricky anymore.
>=20
> Aside: The chaining of the various jobs is a bit awkward, with the
> possibility of failure in bad places. I think with the
> drm_sched_job_init/arm split and maybe preloading the
> job->dependencies xarray this should be fixable.
>=20
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Cc: Emma Anholt <emma@anholt.net>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.h   |  5 -----
>  drivers/gpu/drm/v3d/v3d_gem.c   | 25 ++++++++-----------------
>  drivers/gpu/drm/v3d/v3d_sched.c | 29 +----------------------------
>  3 files changed, 9 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 1d870261eaac..f80f4ff1f7aa 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -192,11 +192,6 @@ struct v3d_job {
>  	struct drm_gem_object **bo;
>  	u32 bo_count;
> =20
> -	/* Array of struct dma_fence * to block on before submitting this job.
> -	 */
> -	struct xarray deps;
> -	unsigned long last_dep;
> -
>  	/* v3d fence to be signaled by IRQ handler when the job is complete. */
>  	struct dma_fence *irq_fence;
> =20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5eccd3658938..42b07ffbea5e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -257,8 +257,8 @@ v3d_lock_bo_reservations(struct v3d_job *job,
>  		return ret;
> =20
>  	for (i =3D 0; i < job->bo_count; i++) {
> -		ret =3D drm_gem_fence_array_add_implicit(&job->deps,
> -						       job->bo[i], true);
> +		ret =3D drm_sched_job_await_implicit(&job->base,
> +						   job->bo[i], true);
>  		if (ret) {
>  			drm_gem_unlock_reservations(job->bo, job->bo_count,
>  						    acquire_ctx);
> @@ -354,8 +354,6 @@ static void
>  v3d_job_free(struct kref *ref)
>  {
>  	struct v3d_job *job =3D container_of(ref, struct v3d_job, refcount);
> -	unsigned long index;
> -	struct dma_fence *fence;
>  	int i;
> =20
>  	for (i =3D 0; i < job->bo_count; i++) {
> @@ -364,11 +362,6 @@ v3d_job_free(struct kref *ref)
>  	}
>  	kvfree(job->bo);
> =20
> -	xa_for_each(&job->deps, index, fence) {
> -		dma_fence_put(fence);
> -	}
> -	xa_destroy(&job->deps);
> -
>  	dma_fence_put(job->irq_fence);
>  	dma_fence_put(job->done_fence);
> =20
> @@ -452,7 +445,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
>  	if (ret < 0)
>  		return ret;
> =20
> -	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
>  	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
>  				 v3d_priv);
>  	if (ret)
> @@ -462,7 +454,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
>  	if (ret =3D=3D -EINVAL)
>  		goto fail_job;
> =20
> -	ret =3D drm_gem_fence_array_add(&job->deps, in_fence);
> +	ret =3D drm_sched_job_await_fence(&job->base, in_fence);
>  	if (ret)
>  		goto fail_job;
> =20
> @@ -472,7 +464,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
>  fail_job:
>  	drm_sched_job_cleanup(&job->base);
>  fail:
> -	xa_destroy(&job->deps);
>  	pm_runtime_put_autosuspend(v3d->drm.dev);
>  	return ret;
>  }
> @@ -619,8 +610,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  	if (bin) {
>  		v3d_push_job(&bin->base);
> =20
> -		ret =3D drm_gem_fence_array_add(&render->base.deps,
> -					      dma_fence_get(bin->base.done_fence));
> +		ret =3D drm_sched_job_await_fence(&render->base.base,
> +						dma_fence_get(bin->base.done_fence));
>  		if (ret)
>  			goto fail_unreserve;
>  	}
> @@ -630,7 +621,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  	if (clean_job) {
>  		struct dma_fence *render_fence =3D
>  			dma_fence_get(render->base.done_fence);
> -		ret =3D drm_gem_fence_array_add(&clean_job->deps, render_fence);
> +		ret =3D drm_sched_job_await_fence(&clean_job->base, render_fence);
>  		if (ret)
>  			goto fail_unreserve;
>  		v3d_push_job(clean_job);
> @@ -820,8 +811,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
>  	mutex_lock(&v3d->sched_lock);
>  	v3d_push_job(&job->base);
> =20
> -	ret =3D drm_gem_fence_array_add(&clean_job->deps,
> -				      dma_fence_get(job->base.done_fence));
> +	ret =3D drm_sched_job_await_fence(&clean_job->base,
> +					dma_fence_get(job->base.done_fence));
>  	if (ret)
>  		goto fail_unreserve;
> =20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index 3f352d73af9c..f0de584f452c 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -13,7 +13,7 @@
>   * jobs when bulk background jobs are queued up, we submit a new job
>   * to the HW only when it has completed the last one, instead of
>   * filling up the CT[01]Q FIFOs with jobs.  Similarly, we use
> - * v3d_job_dependency() to manage the dependency between bin and
> + * drm_sched_job_await_fence() to manage the dependency between bin and
>   * render, instead of having the clients submit jobs using the HW's
>   * semaphores to interlock between them.
>   */
> @@ -62,28 +62,6 @@ v3d_sched_job_free(struct drm_sched_job *sched_job)
>  	v3d_job_cleanup(job);
>  }
> =20
> -/*
> - * Returns the fences that the job depends on, one by one.
> - *
> - * If placed in the scheduler's .dependency method, the corresponding
> - * .run_job won't be called until all of them have been signaled.
> - */
> -static struct dma_fence *
> -v3d_job_dependency(struct drm_sched_job *sched_job,
> -		   struct drm_sched_entity *s_entity)
> -{
> -	struct v3d_job *job =3D to_v3d_job(sched_job);
> -
> -	/* XXX: Wait on a fence for switching the GMP if necessary,
> -	 * and then do so.
> -	 */
> -
> -	if (!xa_empty(&job->deps))
> -		return xa_erase(&job->deps, job->last_dep++);
> -
> -	return NULL;
> -}
> -
>  static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_bin_job *job =3D to_bin_job(sched_job);
> @@ -356,35 +334,30 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_jo=
b)
>  }
> =20
>  static const struct drm_sched_backend_ops v3d_bin_sched_ops =3D {
> -	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_bin_job_run,
>  	.timedout_job =3D v3d_bin_job_timedout,
>  	.free_job =3D v3d_sched_job_free,
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_render_sched_ops =3D {
> -	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_render_job_run,
>  	.timedout_job =3D v3d_render_job_timedout,
>  	.free_job =3D v3d_sched_job_free,
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_tfu_sched_ops =3D {
> -	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_tfu_job_run,
>  	.timedout_job =3D v3d_generic_job_timedout,
>  	.free_job =3D v3d_sched_job_free,
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_csd_sched_ops =3D {
> -	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_csd_job_run,
>  	.timedout_job =3D v3d_csd_job_timedout,
>  	.free_job =3D v3d_sched_job_free
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops =3D {
> -	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_cache_clean_job_run,
>  	.timedout_job =3D v3d_generic_job_timedout,
>  	.free_job =3D v3d_sched_job_free
Also here.

Reviewed-by: Melissa Wen <mwen@igalia.com>
> --=20
> 2.32.0
>=20

--3s4cgzbpt6t6h4on
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmDusEcACgkQwqF3j0dL
ehyFwRAAlIiEo+IGe4rh45AAmZWyLjjnuct0ArvLpmLESDJS4q0gycZwM5XzCJG3
Lk9Wsu8ocNwpa9wUVajAX3ITDwoWCVo8Y2tdposQWfXi8evQmfKePPl40b20tg19
E5+KYQ7wOrG/mUa/CPqTv1/3BBWBwB6bguq02PYi0Y3OZUZm+2MGusEuLKfW8ieQ
I0zzwjKTdJCVcCW1H5YDN6C26T64IkBYkRbXcdP2PWwy3hj/VSBOBS1vGhawUM5i
Mx4e+ZHO7SPJH7GEHF2RxrGO3f/HnWyLujvzKt7M5pbCu4LF9yFN8B85xTS67NPv
e+mCs6pAxPl+FwJwRPnyT0oq2IO/qztth+EoDsH8c5TfHyuJYcGAuXE3dhpJ2EMC
g87f/CO4a0hqtGGncYSih7kSUq2i2b3js2svIO+msTe607j6/DCrJ0o5OduMJX0l
T8Qv85MK5VxmBR0NDrRoomjMLafuBMb70rlGFrV/lW+SZhQdxAeVYn8ydkvTX+/y
UYqpw9t20tsg85LVWp8bds807/4ZTFSG+sh1/w9sVPwuxv+LcPK9L50SZTzj14oE
rEot1bz+I5wXiFM/Mx5PVBkXTe4PtjxmsV42MLPO5nuqT/aJfQjS0kIhIFyFPrnd
vOGzm5DHZYHN+2FJWzCSv6WQGF/yF923Z18BaFpBZU/AH4MFEis=
=2/BO
-----END PGP SIGNATURE-----

--3s4cgzbpt6t6h4on--
