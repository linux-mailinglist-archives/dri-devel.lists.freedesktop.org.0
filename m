Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3FF3C81B2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 11:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A416E1ED;
	Wed, 14 Jul 2021 09:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF87C6E1ED;
 Wed, 14 Jul 2021 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=EAkfvPu9SrBYwm7z7xprk2HMHaJ5MCj4V6gKweZ0s2Q=; 
 b=QjFdt5IOLM9P1rIObXOUMy+CdmbJUd/NNV37TTyLAoAN+UR9WK7KZvXDVsSFs8RVpdwLfPxnIoZlqEK0ktK/K+56BQFFEHD5Gd7aveaRD1dQ5wL2IN8Fc/Hw0WytlSVtaAxHA1yIM7F6OXhrY0cABDFXRghJAqpaUqOlDx7IeT9U1BeVr8Jexumr8fEYquC361bvkxkankqvmTgCuPfZgTC7THcdsOcIySs/HMky1IwpSwmOZfPzdlTZwrTHrmezkeblfxv1TfuKCb/SKCSuKMrBcomD+wfbysrEu8Va+XOSdd0FwG3Eyw3gp15N7Ns7tIbb54AsD2jNBCAh1CXmAA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m3bIV-0004wd-O9; Wed, 14 Jul 2021 11:35:19 +0200
Date: Wed, 14 Jul 2021 10:34:46 +0100
From: Melissa Wen <mwen@igalia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 08/18] drm/v3d: Move drm_sched_job_init to v3d_job_init
Message-ID: <20210714093446.kw4kbamuwwhibomn@mail.igalia.com>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j5esp4ljyr6p2w3k"
Content-Disposition: inline
In-Reply-To: <20210712175352.802687-9-daniel.vetter@ffwll.ch>
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
 Emma Anholt <emma@anholt.net>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--j5esp4ljyr6p2w3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/12, Daniel Vetter wrote:
> Prep work for using the scheduler dependency handling. We need to call
> drm_sched_job_init earlier so we can use the new drm_sched_job_await*
> functions for dependency handling here.
>=20
> v2: Slightly better commit message and rebase to include the
> drm_sched_job_arm() call (Emma).
>=20
> v3: Cleanup jobs under construction correctly (Emma)
>=20
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Emma Anholt <emma@anholt.net>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.h   |  1 +
>  drivers/gpu/drm/v3d/v3d_gem.c   | 88 ++++++++++++++-------------------
>  drivers/gpu/drm/v3d/v3d_sched.c | 15 +++---
>  3 files changed, 44 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 8a390738d65b..1d870261eaac 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -332,6 +332,7 @@ int v3d_submit_csd_ioctl(struct drm_device *dev, void=
 *data,
>  			 struct drm_file *file_priv);
>  int v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
>  		      struct drm_file *file_priv);
> +void v3d_job_cleanup(struct v3d_job *job);
>  void v3d_job_put(struct v3d_job *job);
>  void v3d_reset(struct v3d_dev *v3d);
>  void v3d_invalidate_caches(struct v3d_dev *v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 69ac20e11b09..5eccd3658938 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -392,6 +392,12 @@ v3d_render_job_free(struct kref *ref)
>  	v3d_job_free(ref);
>  }
> =20
> +void v3d_job_cleanup(struct v3d_job *job)
> +{
> +	drm_sched_job_cleanup(&job->base);
> +	v3d_job_put(job);
> +}
> +
>  void v3d_job_put(struct v3d_job *job)
>  {
>  	kref_put(&job->refcount, job->free);
> @@ -433,9 +439,10 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
>  static int
>  v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>  	     struct v3d_job *job, void (*free)(struct kref *ref),
> -	     u32 in_sync)
> +	     u32 in_sync, enum v3d_queue queue)
>  {
>  	struct dma_fence *in_fence =3D NULL;
> +	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
>  	int ret;
> =20
>  	job->v3d =3D v3d;
> @@ -446,35 +453,33 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *=
file_priv,
>  		return ret;
> =20
>  	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
> +	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
> +				 v3d_priv);
> +	if (ret)
> +		goto fail;
> =20
>  	ret =3D drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &in_fence);
>  	if (ret =3D=3D -EINVAL)
> -		goto fail;
> +		goto fail_job;
> =20
>  	ret =3D drm_gem_fence_array_add(&job->deps, in_fence);
>  	if (ret)
> -		goto fail;
> +		goto fail_job;
> =20
>  	kref_init(&job->refcount);
> =20
>  	return 0;
> +fail_job:
> +	drm_sched_job_cleanup(&job->base);
>  fail:
>  	xa_destroy(&job->deps);
>  	pm_runtime_put_autosuspend(v3d->drm.dev);
>  	return ret;
>  }
> =20
> -static int
> -v3d_push_job(struct v3d_file_priv *v3d_priv,
> -	     struct v3d_job *job, enum v3d_queue queue)
> +static void
> +v3d_push_job(struct v3d_job *job)
>  {
> -	int ret;
> -
> -	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
> -				 v3d_priv);
> -	if (ret)
> -		return ret;
> -
>  	drm_sched_job_arm(&job->base);
> =20
>  	job->done_fence =3D dma_fence_get(&job->base.s_fence->finished);
> @@ -483,8 +488,6 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>  	kref_get(&job->refcount);
> =20
>  	drm_sched_entity_push_job(&job->base);
> -
> -	return 0;
>  }
> =20
>  static void
> @@ -530,7 +533,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		    struct drm_file *file_priv)
>  {
>  	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> -	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
>  	struct drm_v3d_submit_cl *args =3D data;
>  	struct v3d_bin_job *bin =3D NULL;
>  	struct v3d_render_job *render;
> @@ -556,7 +558,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  	INIT_LIST_HEAD(&render->unref_list);
> =20
>  	ret =3D v3d_job_init(v3d, file_priv, &render->base,
> -			   v3d_render_job_free, args->in_sync_rcl);
> +			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
>  	if (ret) {
>  		kfree(render);
>  		return ret;
> @@ -570,7 +572,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		}
> =20
>  		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
> -				   v3d_job_free, args->in_sync_bcl);
> +				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
>  		if (ret) {
>  			v3d_job_put(&render->base);
>  			kfree(bin);
> @@ -592,7 +594,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  			goto fail;
>  		}
> =20
> -		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
> +		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_C=
ACHE_CLEAN);
>  		if (ret) {
>  			kfree(clean_job);
>  			clean_job =3D NULL;
> @@ -615,9 +617,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
> =20
>  	mutex_lock(&v3d->sched_lock);
>  	if (bin) {
> -		ret =3D v3d_push_job(v3d_priv, &bin->base, V3D_BIN);
> -		if (ret)
> -			goto fail_unreserve;
> +		v3d_push_job(&bin->base);
> =20
>  		ret =3D drm_gem_fence_array_add(&render->base.deps,
>  					      dma_fence_get(bin->base.done_fence));
> @@ -625,9 +625,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  			goto fail_unreserve;
>  	}
> =20
> -	ret =3D v3d_push_job(v3d_priv, &render->base, V3D_RENDER);
> -	if (ret)
> -		goto fail_unreserve;
> +	v3d_push_job(&render->base);
> =20
>  	if (clean_job) {
>  		struct dma_fence *render_fence =3D
> @@ -635,9 +633,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		ret =3D drm_gem_fence_array_add(&clean_job->deps, render_fence);
>  		if (ret)
>  			goto fail_unreserve;
> -		ret =3D v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
> -		if (ret)
> -			goto fail_unreserve;
> +		v3d_push_job(clean_job);
>  	}
> =20
>  	mutex_unlock(&v3d->sched_lock);
> @@ -662,10 +658,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *d=
ata,
>  				    last_job->bo_count, &acquire_ctx);
>  fail:
>  	if (bin)
> -		v3d_job_put(&bin->base);
> -	v3d_job_put(&render->base);
> +		v3d_job_cleanup(&bin->base);
> +	v3d_job_cleanup(&render->base);
>  	if (clean_job)
> -		v3d_job_put(clean_job);
> +		v3d_job_cleanup(clean_job);
> =20
>  	return ret;
>  }
> @@ -684,7 +680,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
>  		     struct drm_file *file_priv)
>  {
>  	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> -	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
>  	struct drm_v3d_submit_tfu *args =3D data;
>  	struct v3d_tfu_job *job;
>  	struct ww_acquire_ctx acquire_ctx;
> @@ -697,7 +692,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
>  		return -ENOMEM;
> =20
>  	ret =3D v3d_job_init(v3d, file_priv, &job->base,
> -			   v3d_job_free, args->in_sync);
> +			   v3d_job_free, args->in_sync, V3D_TFU);
>  	if (ret) {
>  		kfree(job);
>  		return ret;
> @@ -741,9 +736,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
>  		goto fail;
> =20
>  	mutex_lock(&v3d->sched_lock);
> -	ret =3D v3d_push_job(v3d_priv, &job->base, V3D_TFU);
> -	if (ret)
> -		goto fail_unreserve;
> +	v3d_push_job(&job->base);
>  	mutex_unlock(&v3d->sched_lock);
> =20
>  	v3d_attach_fences_and_unlock_reservation(file_priv,
> @@ -755,12 +748,8 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *d=
ata,
> =20
>  	return 0;
> =20
> -fail_unreserve:
> -	mutex_unlock(&v3d->sched_lock);
> -	drm_gem_unlock_reservations(job->base.bo, job->base.bo_count,
> -				    &acquire_ctx);
>  fail:
> -	v3d_job_put(&job->base);
> +	v3d_job_cleanup(&job->base);
> =20
>  	return ret;
>  }
> @@ -779,7 +768,6 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
>  		     struct drm_file *file_priv)
>  {
>  	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> -	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
>  	struct drm_v3d_submit_csd *args =3D data;
>  	struct v3d_csd_job *job;
>  	struct v3d_job *clean_job;
> @@ -798,7 +786,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
>  		return -ENOMEM;
> =20
>  	ret =3D v3d_job_init(v3d, file_priv, &job->base,
> -			   v3d_job_free, args->in_sync);
> +			   v3d_job_free, args->in_sync, V3D_CSD);
>  	if (ret) {
>  		kfree(job);
>  		return ret;
> @@ -811,7 +799,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
>  		return -ENOMEM;
>  	}
> =20
> -	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
> +	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CA=
CHE_CLEAN);
>  	if (ret) {
>  		v3d_job_put(&job->base);
>  		kfree(clean_job);
> @@ -830,18 +818,14 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *=
data,
>  		goto fail;
> =20
>  	mutex_lock(&v3d->sched_lock);
> -	ret =3D v3d_push_job(v3d_priv, &job->base, V3D_CSD);
> -	if (ret)
> -		goto fail_unreserve;
> +	v3d_push_job(&job->base);
> =20
>  	ret =3D drm_gem_fence_array_add(&clean_job->deps,
>  				      dma_fence_get(job->base.done_fence));
>  	if (ret)
>  		goto fail_unreserve;
> =20
> -	ret =3D v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
> -	if (ret)
> -		goto fail_unreserve;
> +	v3d_push_job(clean_job);
>  	mutex_unlock(&v3d->sched_lock);
> =20
>  	v3d_attach_fences_and_unlock_reservation(file_priv,
> @@ -860,8 +844,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
>  	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
>  				    &acquire_ctx);
>  fail:
> -	v3d_job_put(&job->base);
> -	v3d_job_put(clean_job);
> +	v3d_job_cleanup(&job->base);
> +	v3d_job_cleanup(clean_job);
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index a39bdd5cfc4f..3f352d73af9c 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -55,12 +55,11 @@ to_csd_job(struct drm_sched_job *sched_job)
>  }
> =20
>  static void
> -v3d_job_free(struct drm_sched_job *sched_job)
> +v3d_sched_job_free(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_job *job =3D to_v3d_job(sched_job);
> =20
> -	drm_sched_job_cleanup(sched_job);
> -	v3d_job_put(job);
> +	v3d_job_cleanup(job);
>  }
> =20
>  /*
> @@ -360,35 +359,35 @@ static const struct drm_sched_backend_ops v3d_bin_s=
ched_ops =3D {
>  	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_bin_job_run,
>  	.timedout_job =3D v3d_bin_job_timedout,
> -	.free_job =3D v3d_job_free,
> +	.free_job =3D v3d_sched_job_free,
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_render_sched_ops =3D {
>  	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_render_job_run,
>  	.timedout_job =3D v3d_render_job_timedout,
> -	.free_job =3D v3d_job_free,
> +	.free_job =3D v3d_sched_job_free,
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_tfu_sched_ops =3D {
>  	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_tfu_job_run,
>  	.timedout_job =3D v3d_generic_job_timedout,
> -	.free_job =3D v3d_job_free,
> +	.free_job =3D v3d_sched_job_free,
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_csd_sched_ops =3D {
>  	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_csd_job_run,
>  	.timedout_job =3D v3d_csd_job_timedout,
> -	.free_job =3D v3d_job_free
> +	.free_job =3D v3d_sched_job_free
>  };
> =20
>  static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops =3D {
>  	.dependency =3D v3d_job_dependency,
>  	.run_job =3D v3d_cache_clean_job_run,
>  	.timedout_job =3D v3d_generic_job_timedout,
> -	.free_job =3D v3d_job_free
> +	.free_job =3D v3d_sched_job_free
>  };
Hi Daniel,

lgtm too.

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks,
Melissa
> =20
>  int
> --=20
> 2.32.0
>=20

--j5esp4ljyr6p2w3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmDur7EACgkQwqF3j0dL
ehytQRAAloX7cbbHwKPJj8Ew0xKb4GMttYxydf2Dfy2NrIEXnLtibxBzZLsCrGMQ
a/qXHx/XBt3KuWZVZcJy5QjMpjsBEE6GnKxDHzlpt/iyYiiLSCr0BcNcWWn+60TP
FbKuvroeAI7nRCxFageRIH03jqdlTSBNA9ZR6SJTleogf3k+x/LG85Ek0t73jYRO
XYBpLvL7wpRF+yMisilQ18UBdvDRpqgXevrERB9DXsUmXVWBkOBuGOkgckK2f4H5
nQRONnw7636t5AullXnkXA+f1scX+ey0rmK9VK9o6lyfw11G9U3tH6uEMHtfO2sG
uUhtjtoEFi1vZ22G7j5hzoOMKE1aRNTWgDtdU+/w3+tECn5QnsPLw/9+Lv2Ysmrm
1pFM7Neb+LdFL4e890yZhK0AEGFcOt2miZNWQ16x981riL8vD9wxMQQJotWEid7l
XzCAoBPE/VybPJzx67zXF9YxLHWHhP4IdTgthx3pQFjJH8k0Lj7RUpmw/Mxq9/eN
iS0PUDKKnUIYdjwk2bZ2ptEg3IbAYfIGdegytNu3mzmelR2pfCwcxar2cyZluDZR
AXEL0QOAJgU88f6KCUZNAaRvRoIO5VsvoTDzzVEEEumgYVqvtDPEZOh5vKm46KRl
ofQrem4NHFshUmAWuOPDY9dfeKReULmucayamSaFbwTmY1mKqC0=
=+N/y
-----END PGP SIGNATURE-----

--j5esp4ljyr6p2w3k--
