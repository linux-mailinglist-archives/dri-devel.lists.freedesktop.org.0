Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FFF41C1DA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300F6E196;
	Wed, 29 Sep 2021 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9DF6E196
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=HUYVChEukauTNtPXxlt2PVhRTy6vQdrzOiZiwiYtCnQ=; 
 b=OLZ3jMR9ikZKoJqim79zwuGLfe2q/4kPtg1QITHehrnt5o+2pwvUgKtmusgMZY5ZffQahyXqSgnnHWFcm2Cqnx/dG1nCN12yna+5WqZqldtAQChUU5xWGsRUoVfquKqffjffG3iOePDAp51cYhnhPQhpcQp811qezOOv9On09dl06eQcYvKXkJeAG99usouH6Cl2aBESY5geQSi23scUlTQ1gPGHPK546k5WnUMVSkEK4n487cHcnzubZtVXoGTQbqVadLeo6mRSCJLhLvkmxjcdcC2o01LDdpq2uRngmI8l8vBf0KXIH+ymibM3jkA4yyegb07fKyEAogAmk3P8EQ==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVW8K-0005mp-1d; Wed, 29 Sep 2021 11:44:12 +0200
Date: Wed, 29 Sep 2021 10:43:59 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v2 2/4] drm/v3d: alloc and init job in one shot
Message-ID: <9048a84150989bb8719810ea5c987feeb269eccd.1632905676.git.mwen@igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y2r4hbdizemzgj2s"
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


--y2r4hbdizemzgj2s
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

Suggested-by: Iago Toral <itoral@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 115 +++++++++++++---------------------
 1 file changed, 42 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index e60fbc28ef29..9cfa6f8d4357 100644
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
@@ -450,12 +453,20 @@ v3d_job_add_deps(struct drm_file *file_priv, struct v=
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
@@ -479,6 +490,9 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file=
_priv,
 	drm_sched_job_cleanup(&job->base);
 fail:
 	pm_runtime_put_autosuspend(v3d->drm.dev);
+	kfree(*container);
+	*container =3D NULL;
+
 	return ret;
 }
=20
@@ -558,35 +572,20 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
 		return -EINVAL;
 	}
=20
-	render =3D kcalloc(1, sizeof(*render), GFP_KERNEL);
-	if (!render)
-		return -ENOMEM;
+	ret =3D v3d_job_init(v3d, file_priv, (void *)&render, sizeof(*render),
+			   v3d_render_job_free, args->in_sync_bcl, V3D_RENDER);
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
@@ -597,18 +596,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
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
@@ -681,11 +672,9 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
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
@@ -711,22 +700,16 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
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
@@ -773,7 +756,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	return 0;
=20
 fail:
-	v3d_job_cleanup(&job->base);
+	v3d_job_cleanup((void *)job);
=20
 	return ret;
 }
@@ -806,29 +789,15 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
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
@@ -877,7 +846,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
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


--y2r4hbdizemzgj2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFUNV8ACgkQwqF3j0dL
ehzN0g/8DQ9ztpfs+ucaeOOp2wdWhXndwjuwGC7sTF45/2pDsOX+c6YP0TaAKVJ9
YsqBF6qWXXkrFmkskTzfr/A1xYLKrF+TtG5DYTj2vkkkSbW5Sl4XfaU+2JPn+4ar
zC71LQNg/tQ/qAQ79Oxqt/mMHiQxKkhPT+d799vBOqMUaFOOV7Oj9phVhDZ2kD+x
QUWaZICWFxfjPP4zaJ8PArbWGYu1rkbWXMYAtgWp/h+ZMt2KcCApfNZJx/wuecLe
PR9Juhkqmj1syKGgZStZGjGC9lgGXdHXDavbvWOnLDb9pDRY/vr/pl87NvdS0qQB
GDnDcovJ3hIUT8AUGSp0mkpgEzuYn73ifvu9Pq++uGNgsxUlJW0V0vIPww6u1D0b
N8pJnoGcY/R9IizSXGH4ZNbJEvPq174k2RxOuP7CN1yIBZuSSEhBsMwTbT+JBHdD
kE2/OuJ/nNBwkyaAscAhZedJJ54SCQvzNb74Ufs38PcnRKqW+9/MUiEsRF5fWU3P
0REIZ443Tqwu5CprjPv/en61B4+xzKUCBaaQGL243Tij2Sm48X/qwYnXV5GV2FL9
mAQR/Qxpv1METUtupY5ZpnAYT03WkSXwVSSWIh503HcmGnwXQYprBNhDLVrc99bX
h8rA8jzLCPFfukZ7KFrkY85dvB/OG5RWRPIYlczYb5XuklB6Tq0=
=IndM
-----END PGP SIGNATURE-----

--y2r4hbdizemzgj2s--
