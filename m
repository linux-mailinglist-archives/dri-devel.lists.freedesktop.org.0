Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40541DEB5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 18:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB2B6EC04;
	Thu, 30 Sep 2021 16:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656D6EC04
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=K0LZd2ZPeijOyOhZy4Q4sWXj0J+ArauTPYuuJNoczsc=; 
 b=TJnLBGl6Iid5y49yYORHYMfTchf+EWaQYfvkDC4MPQpbnHFMp9/v/Z2bX7Ffrgqo3cmix7oXpSvLf15Lxj4sGTVHKRdM5nSYq+WoHOy4ku1rjUAApvKMbNMgivDph4HaBywKnqvVxKblba92Go4aj9d96i4D0skW+3u4zi27HqWRpOueLrD2zmr5dg2U8Umy4NfOhgCzM5dFQAvgkqZHWLU6oBgpyuTJn7qJ1DQkZ5pF6dJcf/YEJPs/gVEmkBK3ducXr8b6A5YIIW4SnYAu7d4xhiTVK+9WfZTPKulS59K86AN+SwlKh6VpsBrEEhZB9qlaSvswFSSvMSYp8QAJAg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVykq-0001LN-La; Thu, 30 Sep 2021 18:17:52 +0200
Date: Thu, 30 Sep 2021 17:17:39 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v3 2/4] drm/v3d: alloc and init job in one shot
Message-ID: <4d12e07bd334d2cddb51cabd359e99edde595619.1633016479.git.mwen@igalia.com>
References: <cover.1633016479.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3ifo4a4ga7j3qjoq"
Content-Disposition: inline
In-Reply-To: <cover.1633016479.git.mwen@igalia.com>
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


--3ifo4a4ga7j3qjoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Move job memory allocation to v3d_job_init function. This aim to facilitate
error handling in job initialization, since cleanup steps are similar for a=
ll
(struct v3d_job)-based types of job involved in a command submission. To
generalize v3d_job_init(), this change takes into account that all job stru=
cts
have the first element a struct v3d_job (bin, render, tfu, csd) or it is a
v3d_job itself (clean_job) for pointer casting.

v3:
- explicitly init job as NULL (Iago)
- fix pm failure handling on v3_job_init (Iago)

Suggested-by: Iago Toral <itoral@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 135 +++++++++++++---------------------
 1 file changed, 53 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index e60fbc28ef29..f932e73fb5c6 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -392,6 +392,9 @@ v3d_render_job_free(struct kref *ref)
=20
 void v3d_job_cleanup(struct v3d_job *job)
 {
+	if (!job)
+		return;
+
 	drm_sched_job_cleanup(&job->base);
 	v3d_job_put(job);
 }
@@ -450,35 +453,48 @@ v3d_job_add_deps(struct drm_file *file_priv, struct v=
3d_job *job,
=20
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
-	     struct v3d_job *job, void (*free)(struct kref *ref),
+	     void **container, size_t size, void (*free)(struct kref *ref),
 	     u32 in_sync, enum v3d_queue queue)
 {
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
+	struct v3d_job *job;
 	int ret;
=20
+	*container =3D kcalloc(1, size, GFP_KERNEL);
+	if (!*container) {
+		DRM_ERROR("Cannot allocate memory for v3d job.");
+		return -ENOMEM;
+	}
+
+	job =3D *container;
 	job->v3d =3D v3d;
 	job->free =3D free;
=20
 	ret =3D pm_runtime_get_sync(v3d->drm.dev);
 	if (ret < 0)
-		return ret;
+		goto fail;
=20
 	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
 	if (ret)
-		goto fail;
+		goto fail_job;
=20
 	ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
 	if (ret)
-		goto fail_job;
+		goto fail_deps;
=20
 	kref_init(&job->refcount);
=20
 	return 0;
-fail_job:
+
+fail_deps:
 	drm_sched_job_cleanup(&job->base);
-fail:
+fail_job:
 	pm_runtime_put_autosuspend(v3d->drm.dev);
+fail:
+	kfree(*container);
+	*container =3D NULL;
+
 	return ret;
 }
=20
@@ -541,7 +557,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args =3D data;
 	struct v3d_bin_job *bin =3D NULL;
-	struct v3d_render_job *render;
+	struct v3d_render_job *render =3D NULL;
 	struct v3d_job *clean_job =3D NULL;
 	struct v3d_job *last_job;
 	struct ww_acquire_ctx acquire_ctx;
@@ -558,35 +574,20 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
 		return -EINVAL;
 	}
=20
-	render =3D kcalloc(1, sizeof(*render), GFP_KERNEL);
-	if (!render)
-		return -ENOMEM;
+	ret =3D v3d_job_init(v3d, file_priv, (void *)&render, sizeof(*render),
+			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
+	if (ret)
+		goto fail;
=20
 	render->start =3D args->rcl_start;
 	render->end =3D args->rcl_end;
 	INIT_LIST_HEAD(&render->unref_list);
=20
-	ret =3D v3d_job_init(v3d, file_priv, &render->base,
-			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
-	if (ret) {
-		kfree(render);
-		return ret;
-	}
-
 	if (args->bcl_start !=3D args->bcl_end) {
-		bin =3D kcalloc(1, sizeof(*bin), GFP_KERNEL);
-		if (!bin) {
-			v3d_job_cleanup(&render->base);
-			return -ENOMEM;
-		}
-
-		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
+		ret =3D v3d_job_init(v3d, file_priv, (void *)&bin, sizeof(*bin),
 				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
-		if (ret) {
-			v3d_job_cleanup(&render->base);
-			kfree(bin);
-			return ret;
-		}
+		if (ret)
+			goto fail;
=20
 		bin->start =3D args->bcl_start;
 		bin->end =3D args->bcl_end;
@@ -597,18 +598,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
-		clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
-		if (!clean_job) {
-			ret =3D -ENOMEM;
-			goto fail;
-		}
-
-		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CAC=
HE_CLEAN);
-		if (ret) {
-			kfree(clean_job);
-			clean_job =3D NULL;
+		ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_j=
ob),
+				   v3d_job_free, 0, V3D_CACHE_CLEAN);
+		if (ret)
 			goto fail;
-		}
=20
 		last_job =3D clean_job;
 	} else {
@@ -681,11 +674,9 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	drm_gem_unlock_reservations(last_job->bo,
 				    last_job->bo_count, &acquire_ctx);
 fail:
-	if (bin)
-		v3d_job_cleanup(&bin->base);
-	v3d_job_cleanup(&render->base);
-	if (clean_job)
-		v3d_job_cleanup(clean_job);
+	v3d_job_cleanup((void *)bin);
+	v3d_job_cleanup((void *)render);
+	v3d_job_cleanup(clean_job);
=20
 	return ret;
 }
@@ -705,28 +696,22 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
 {
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct drm_v3d_submit_tfu *args =3D data;
-	struct v3d_tfu_job *job;
+	struct v3d_tfu_job *job =3D NULL;
 	struct ww_acquire_ctx acquire_ctx;
 	int ret =3D 0;
=20
 	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
=20
-	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
-	if (!job)
-		return -ENOMEM;
-
-	ret =3D v3d_job_init(v3d, file_priv, &job->base,
+	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
 			   v3d_job_free, args->in_sync, V3D_TFU);
-	if (ret) {
-		kfree(job);
-		return ret;
-	}
+	if (ret)
+		goto fail;
=20
 	job->base.bo =3D kcalloc(ARRAY_SIZE(args->bo_handles),
 			       sizeof(*job->base.bo), GFP_KERNEL);
 	if (!job->base.bo) {
-		v3d_job_cleanup(&job->base);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto fail;
 	}
=20
 	job->args =3D *args;
@@ -773,7 +758,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	return 0;
=20
 fail:
-	v3d_job_cleanup(&job->base);
+	v3d_job_cleanup((void *)job);
=20
 	return ret;
 }
@@ -794,8 +779,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_csd *args =3D data;
-	struct v3d_csd_job *job;
-	struct v3d_job *clean_job;
+	struct v3d_csd_job *job =3D NULL;
+	struct v3d_job *clean_job =3D NULL;
 	struct ww_acquire_ctx acquire_ctx;
 	int ret;
=20
@@ -806,29 +791,15 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
 		return -EINVAL;
 	}
=20
-	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
-	if (!job)
-		return -ENOMEM;
-
-	ret =3D v3d_job_init(v3d, file_priv, &job->base,
+	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
 			   v3d_job_free, args->in_sync, V3D_CSD);
-	if (ret) {
-		kfree(job);
-		return ret;
-	}
-
-	clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
-	if (!clean_job) {
-		v3d_job_cleanup(&job->base);
-		return -ENOMEM;
-	}
+	if (ret)
+		goto fail;
=20
-	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACH=
E_CLEAN);
-	if (ret) {
-		v3d_job_cleanup(&job->base);
-		kfree(clean_job);
-		return ret;
-	}
+	ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_jo=
b),
+			   v3d_job_free, 0, V3D_CACHE_CLEAN);
+	if (ret)
+		goto fail;
=20
 	job->args =3D *args;
=20
@@ -877,7 +848,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
 				    &acquire_ctx);
 fail:
-	v3d_job_cleanup(&job->base);
+	v3d_job_cleanup((void *)job);
 	v3d_job_cleanup(clean_job);
=20
 	return ret;
--=20
2.30.2


--3ifo4a4ga7j3qjoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFV4yMACgkQwqF3j0dL
ehwocw//T0e0THkAnJ8m938rO2T9RNXExgtF/pAhx22kuekAJfdbJegNFhgNaG40
yUGMIBXFoETwSYJTLolRRXzZtpyd1MGpLHsAJj8w2IzBr7SULbB1lPFDTQRHrfqz
h/IVzDQndv7ANfSsiCjtOhwo/3nFcD3GaRZy+axm0lm83kfD5pjlfjQa0nubB/Uh
JXkFHIiI7zjLwu3j1+zDsRviBKsygXP0aSLjIiRURHNKrdsal0Oh6WGKtICBWTBM
iCb8dhMUS/lqueSXwCRD9J3CDZwkAxT6pyYELAcopcZ4BhlWavvPGanQLhkbbo72
AGrD3GdjaxPrrJMHd/dOBG6X1Ve7YoQN4wswHDU5ofO9IBNTv1VBTUbMX8MeYCyI
dtLb6iS5iHtUEj6NXye5pdBvKiajHK/soagIflUsviuTtOWUEAFPeABsNG2jXg4j
GxtEc9s7BWoaG5lj6ilD5l8SDfc9h7lfxPggc6AC9hfYyKDArkzOPlFUDafGyZpI
yMCF42/Zz/a7gK6/hRtS+3WI1e9zM2bumPxgQs55653Rx5qBpbofrXqDayRPTcTV
vV0FwgCVu5iALLI7g/ZAVPNLSsp3rA8qwUe5U9di4AUb9BfB4D6V3ZvIOkWHdzan
BLfoTtvVTUPzNYyD2RVaYVvv5hgz9ovEwE7/OougLaSmolZuvf0=
=BASZ
-----END PGP SIGNATURE-----

--3ifo4a4ga7j3qjoq--
