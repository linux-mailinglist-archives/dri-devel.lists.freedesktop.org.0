Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398A41D618
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104E56EB53;
	Thu, 30 Sep 2021 09:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55FD6EB53
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=jFKFmveYVvsuhhmStQ8PEAU+llLIX6AB8sb31MDcl9A=; 
 b=ladj0EO3pDYR03LlH0UPbpd+kXRLpVhxzOuczHqV5+g/mC2o7ySYAXGXeOy5OhCKed7utTzLGPdqFZ4jw8+AtfPyHMqq+qgwJwJyh9A1XLUY4y6Np3fvLEZDHtWiosV+pBJwZsYDFdTD99PXsKHxDbSdeB8zdwDmcGSjjYtEtGhEZOMwVK/lNnkJGPNmUM2G3HSDZ/k5dF6E81khH4SM/CwMPsj/QNPLMR8eIR/W/nTg3x5rTnF49E++DLiO4slGQTwL/6SsbJ6zmwESauxsTzhoi3qNXBvMMUOVqbZA3sQnForY0K6iL4dN5w71T8Oc7Ll17xZvnJ2fNr+t/TGTvQ==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVsB0-0001NZ-9t; Thu, 30 Sep 2021 11:16:26 +0200
Date: Thu, 30 Sep 2021 10:16:08 +0100
From: Melissa Wen <mwen@igalia.com>
To: Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 2/4] drm/v3d: alloc and init job in one shot
Message-ID: <20210930091608.j56uqzumu3nt6zvx@mail.igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
 <9048a84150989bb8719810ea5c987feeb269eccd.1632905676.git.mwen@igalia.com>
 <6307238d163737faf9e5c3591b1725497ce77945.camel@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3dogmklhothau6sp"
Content-Disposition: inline
In-Reply-To: <6307238d163737faf9e5c3591b1725497ce77945.camel@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3dogmklhothau6sp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/30, Iago Toral wrote:
> On Wed, 2021-09-29 at 10:43 +0100, Melissa Wen wrote:
> > Move job memory allocation to v3d_job_init function. This aim to
> > facilitate
> > error handling in job initialization, since cleanup steps are similar
> > for all
> > (struct v3d_job)-based types of job involved in a command submission.
> > To
> > generalize v3d_job_init(), this change takes into account that all
> > job structs
> > have the first element a struct v3d_job (bin, render, tfu, csd) or it
> > is a
> > v3d_job itself (clean_job) for pointer casting.
> >=20
> > Suggested-by: Iago Toral <itoral@igalia.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_gem.c | 115 +++++++++++++-------------------
> > --
> >  1 file changed, 42 insertions(+), 73 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> > b/drivers/gpu/drm/v3d/v3d_gem.c
> > index e60fbc28ef29..9cfa6f8d4357 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -392,6 +392,9 @@ v3d_render_job_free(struct kref *ref)
> > =20
> >  void v3d_job_cleanup(struct v3d_job *job)
> >  {
> > +	if (!job)
> > +		return;
> > +
> >  	drm_sched_job_cleanup(&job->base);
> >  	v3d_job_put(job);
> >  }
> > @@ -450,12 +453,20 @@ v3d_job_add_deps(struct drm_file *file_priv,
> > struct v3d_job *job,
> > =20
> >  static int
> >  v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
> > -	     struct v3d_job *job, void (*free)(struct kref *ref),
> > +	     void **container, size_t size, void (*free)(struct kref
> > *ref),
> >  	     u32 in_sync, enum v3d_queue queue)
> >  {
> >  	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> > +	struct v3d_job *job;
> >  	int ret;
> > =20
> > +	*container =3D kcalloc(1, size, GFP_KERNEL);
> > +	if (!*container) {
> > +		DRM_ERROR("Cannot allocate memory for v3d job.");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	job =3D *container;
> >  	job->v3d =3D v3d;
> >  	job->free =3D free;
> > =20
>=20
> Right below this hunk we have an early return that doesn't jump to
> fail:
>=20
>         ret =3D pm_runtime_get_sync(v3d->drm.dev);
>         if (ret < 0)
>                 return ret;
>=20
>=20
> so we should kfree(*container) and set it to NULL there, right?
oh, yes. I missed it on porting downstream to upstream.
>=20
> > @@ -479,6 +490,9 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file
> > *file_priv,
> >  	drm_sched_job_cleanup(&job->base);
> >  fail:
> >  	pm_runtime_put_autosuspend(v3d->drm.dev);
> > +	kfree(*container);
> > +	*container =3D NULL;
> > +
> >  	return ret;
> >  }
> >=20
>=20
> (...)
>=20
> > @@ -806,29 +789,15 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> > void *data,
> >  		return -EINVAL;
> >  	}
> > =20
> > -	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
> > -	if (!job)
> > -		return -ENOMEM;
> > -
> > -	ret =3D v3d_job_init(v3d, file_priv, &job->base,
> > +	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
> >  			   v3d_job_free, args->in_sync, V3D_CSD);
> > -	if (ret) {
> > -		kfree(job);
> > -		return ret;
> > -	}
> > -
> > -	clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
> > -	if (!clean_job) {
> > -		v3d_job_cleanup(&job->base);
> > -		return -ENOMEM;
> > -	}
> > +	if (ret)
> > +		goto fail;
> >=20
>=20
> For this to work we need to explicitly initialize clean_job to NULL.=20
> Notice that the same applies to the bin and clean jobs in the CL ioctl,
> but in that case we're already initializing them to NULL.
yes, thanks for pointing it out.

Melissa
>=20
> > -	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0,
> > V3D_CACHE_CLEAN);
> > -	if (ret) {
> > -		v3d_job_cleanup(&job->base);
> > -		kfree(clean_job);
> > -		return ret;
> > -	}
> > +	ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job,
> > sizeof(*clean_job),
> > +			   v3d_job_free, 0, V3D_CACHE_CLEAN);
> > +	if (ret)
> > +		goto fail;
> > =20
> >  	job->args =3D *args;
> > =20
> > @@ -877,7 +846,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void
> > *data,
> >  	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
> >  				    &acquire_ctx);
> >  fail:
> > -	v3d_job_cleanup(&job->base);
> > +	v3d_job_cleanup((void *)job);
> >  	v3d_job_cleanup(clean_job);
> > =20
> >  	return ret;
>=20

--3dogmklhothau6sp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFVgFQACgkQwqF3j0dL
ehxPNQ//ZM5mok0j7lUG+VVsFe7Ph7oA5MN2cudRjdRaOjexNh8Cq9UIK8m5n2lk
Ci/xttu4DjfNf5qFRklAhlFWwJMC6vzg+G/p5y6SJImaBCWXfr4XXwhYtqn0fTPo
5202bCWPo2brEq3NJAMMaosODpqmrNQnB5/eHf7W9HZ7ylDsZkEUHB4hMLoHrS5X
3Nie9XNVc+I+XXlgyS7tDTtTCe4zX9N13GQwiFMVqcoAqOIhBtVgX3a06M7ecNgk
CuB+N6hMYmuSlJ2VDr5pFkANlVOg9O50GgoRf9WzLi2E7cR0U0k+Z9It225jZ01I
/euIZBPUoFVriVM15fDQW+nEk7k9qhUdSX7RPjEGdn02GIztHVAgqRGMT86evaNp
4iArPjEJbVBjTDO4z4qoO4Gi9kluRIf5bp7CYqXhafIGYe5J3UmMDsVqhKn6/eX7
rd+ra0i7wRYK8oyx1r1Y/63CoGDjIya4lrVb+br+e+ou+8yLkP6IeOayuPNX8dFX
ctAbpXbvbHjOAHsayfbveyRbJ+HPjmjrqzVKrRJ+AcMu7XpARFs+aGhgzTJW1aHH
zpTiOMcJLCPugCtyvRBulPJm5u7hx+7JF/ghcn/bx8mlneVkzolfHr6UkbY1sIo/
ETr3VP8kFDTnxA2fS/WSB3SQx7UWv7ijZ+8Kekvm9+jxA3MyXrA=
=GMbw
-----END PGP SIGNATURE-----

--3dogmklhothau6sp--
