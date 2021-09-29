Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491C41C1D3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4C96EA16;
	Wed, 29 Sep 2021 09:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E106B6EA16
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=C+Ki1XkH8mdedaFBeYvNXxkqzqh1N5v6pJfRmWON7wM=; 
 b=M/3wjsf5nSDwn7qYP7oig3S0GMj8VMUtCr02VmYtgVgyunWTmh8pbUvGX5ZqMt1d2JnQXzAnopqBh1PQQxZsZnabeEt90WG6CG6GHacIV62bzpC+CG03K35TUsgfdwAvmYiVnN59VH61N+9+WvobjNazkA7609VzghKREuONM3E6HgPkYntj6qmuyoQDfZYF7qU5PwhsJUrepkTQ221h/eHKUDU3O13ofCAmhlBANrHNYb3q4UjsuwvYVI3CaI7SBykSjNNJlh9NHCdGcmtoM0+recJ1y9YtubpUEIcrlIN6Fea9OOotHqPTgecGRCNqrY/wJD5Nz3C7yzoAHgtnUA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVW6X-0005cT-7R; Wed, 29 Sep 2021 11:42:21 +0200
Date: Wed, 29 Sep 2021 10:42:09 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v2 1/4] drm/v3d: decouple adding job dependencies steps from
 job init
Message-ID: <825f5fdd540b0aa2eb57bd5ff93c0777808b108c.1632905676.git.mwen@igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="onbiwg2c6a4ejrkv"
Content-Disposition: inline
In-Reply-To: <cover.1632905676.git.mwen@igalia.com>
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


--onbiwg2c6a4ejrkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prep work to enable a job to wait for more than one syncobj before
start. Also get rid of old checkpatch warnings in the v3d_gem file.
No functional changes.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index ead0be8d48a7..e60fbc28ef29 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -416,7 +416,7 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
=20
 	ret =3D drm_gem_dma_resv_wait(file_priv, args->handle,
-					      true, timeout_jiffies);
+				    true, timeout_jiffies);
=20
 	/* Decrement the user's timeout, in case we got interrupted
 	 * such that the ioctl will be restarted.
@@ -434,12 +434,25 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
=20
+static int
+v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
+		 u32 in_sync, u32 point)
+{
+	struct dma_fence *in_fence =3D NULL;
+	int ret;
+
+	ret =3D drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
+	if (ret =3D=3D -EINVAL)
+		return ret;
+
+	return drm_sched_job_add_dependency(&job->base, in_fence);
+}
+
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     struct v3d_job *job, void (*free)(struct kref *ref),
 	     u32 in_sync, enum v3d_queue queue)
 {
-	struct dma_fence *in_fence =3D NULL;
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	int ret;
=20
@@ -455,11 +468,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fil=
e_priv,
 	if (ret)
 		goto fail;
=20
-	ret =3D drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &in_fence);
-	if (ret =3D=3D -EINVAL)
-		goto fail_job;
-
-	ret =3D drm_sched_job_add_dependency(&job->base, in_fence);
+	ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
 	if (ret)
 		goto fail_job;
=20
@@ -499,7 +508,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fil=
e *file_priv,
 	for (i =3D 0; i < job->bo_count; i++) {
 		/* XXX: Use shared fences for read-only objects. */
 		dma_resv_add_excl_fence(job->bo[i]->resv,
-						  job->done_fence);
+					job->done_fence);
 	}
=20
 	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
@@ -903,8 +912,7 @@ v3d_gem_init(struct drm_device *dev)
 	if (!v3d->pt) {
 		drm_mm_takedown(&v3d->mm);
 		dev_err(v3d->drm.dev,
-			"Failed to allocate page tables. "
-			"Please ensure you have CMA enabled.\n");
+			"Failed to allocate page tables. Please ensure you have CMA enabled.\n"=
);
 		return -ENOMEM;
 	}
=20
--=20
2.30.2


--onbiwg2c6a4ejrkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFUNPEACgkQwqF3j0dL
ehzVYA/8D+VXge1DGXXy4VfY3S9UZJBPX5QlD4OchyFAMQ1q7yKC6azPk4KQlJxp
wjnYmcFrgrVLStiYOMA9NeeeNV+FPib+dSJBbni6Onx3WUH4xGlpUh6/ogmtnFBU
9ZXlEMOr4uWXpxucOnHN7bp3CCE7iI5lER43vRujOUnKikHHX6RCPJgkZO9MzQAD
H+x6yCBYAS8S2mn6yYliRBJQckiSHPkORNThcGKnMgNsyJ6hibfRscz5VUNdBkcl
/fxM9z0GEVtUBbAKmUPF3rtt/XPmPsCHYU5OxT7WU7tCkup/AqzVZWg7Y0ubaMNB
sq+RiVlzUvFuaVRRw7Ka7INOf+tbVKWWPGHNw1Pwuz/BeOnGycXrlmEjcM6lywwU
XgZ/e2hWaVxOlXgecpGuMbWlIIoZvQCk8s4XXimYwCV+qGZl7hvuB5gc+mpsDxTJ
0LItTX7Ryj45oUtBT1ptoabO6jcJkcC97y3f/Kw8GUPKlbWRsDPECgjaq+/iFIGv
xXhqsu7+NZVQz4Ufp1tIqv2Um7W4eY0qHPnaFXtq7KeRBEDF9JsfrtxFEhwl75Wr
1LzntmaV6sX07pQFlPlaIoXXPH1kjJwyBjKA96Ydvh9Nr9oOalea1Z9gri5tJ6te
xxFGPnaI15dZUhP/m97Q+h07hgGC+AqMtu+z0w6VwhhQWA1Q5W8=
=bCN3
-----END PGP SIGNATURE-----

--onbiwg2c6a4ejrkv--
