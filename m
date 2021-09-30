Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91D41DEA2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 18:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4416EBFF;
	Thu, 30 Sep 2021 16:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1C86EBFF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=rsetKWk/grAqVDtUuBVGWtwWQ3kofj59txrz8YiuUHs=; 
 b=kc53oG1wbzJnRiXgX02zeu+SmoFHQHje95NyEHdUxz2oThwajwGopOmKgwxko52jYjr8ERC3Q1WC5XL+p9TgV3BQaw8I1IHNqv274UHaxgWx2pcZKoyCBu3gdNReZijfUVzMW2JC9w/lGg/XvUz8P4sTknq6ru/qymY4xqeWCMqvuOY6lhqqauFnwCyieGnrGMRpoDuWmzZ1hofY1yiFScdBRQzMj1aEaOlwJu5KXzNPcWCzwT6ZqYUGjiZdpMMB4XQ1s4DK243aHUebLyuMsRP6bUDhkzj60Z6OiGgFFktCR/fw+/X3XAXOFypPvugrdY5i2Bt0LMDm92Y/o3ZPEQ==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVyih-000151-Bh; Thu, 30 Sep 2021 18:15:39 +0200
Date: Thu, 30 Sep 2021 17:15:22 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v3 1/4] drm/v3d: decouple adding job dependencies steps from
 job init
Message-ID: <825f5fdd540b0aa2eb57bd5ff93c0777808b108c.1633016479.git.mwen@igalia.com>
References: <cover.1633016479.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uhlxmtwzqmmtbmm2"
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


--uhlxmtwzqmmtbmm2
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


--uhlxmtwzqmmtbmm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFV4poACgkQwqF3j0dL
ehxIeRAAnCCjeJppWs0k1INchYQZlJs0RwikAwupjOdy3nbpxbUr8tHn0VLB42NU
mBIhmKtC3y6lLeiSsugeZ8nIHlLf3jLcikG1gdl4T2f+XjCn3IbaLE/MpLpF773M
ghf5xCxvPgXUzi8CS/Q6h+UblTk2poCUCLI1E7HpctliV8zcmHqGiDLpRHLKaxD/
kjegCzfF95QMophnwXx4Sot10z+yOgeY5pSQIvbq7pNafmIP9QmPvLcNLsw90EGI
/29wGN3JGKB0IROBtTeK329cC/fRJqs3+jl30IIRXFx1EoZ8IllkD0ur9xze9lUY
8hrJ8sTG5GlT3aFExXr9hA7RC8OORQmG3FIoedpexsQQ4g12LbaDSnvCIRmr16vB
7yD5f9ElEsgPESLGhO9b74CnNT854hs+7OhdESEiSTgDYpgD82bDXxO43cVnWY03
B/VNo2CMmyVj48WzrfkltVqfFX5lwSnaNi5TEHDWbkak+kI99PgzhCSjdLTfayvX
qiOK/B5gULEsNPf4jVgpcdHnDvW9GQqAVzcdFTuYWnIQvf/5qK/u68wADUufDrl9
iBPdLCmkiv+Ps70e2bIYGnROad0HD2aMDnfgR3xw+W+0CIa96r0gqKXEc9fTZnOu
qIxXyQdMcVkdstmUHaI77z1GIoyIpdRWQbFrYgLXd9y1+LncS6k=
=pWEw
-----END PGP SIGNATURE-----

--uhlxmtwzqmmtbmm2--
