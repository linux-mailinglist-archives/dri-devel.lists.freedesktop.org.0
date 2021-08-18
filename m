Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF83F0AA4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62A6E8AE;
	Wed, 18 Aug 2021 17:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0D26E8AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=HpPN0yYSGOV52x1q9vonkncQFP1x0VnPO7rT8ElKETo=; 
 b=O5yFsm/D/jOkt4QedwFUxpz57Gd8oAu3G7xDwm7CZwPQsM7WKM7HkXtIUU7v9q+dSLsywG98qnjRZ3X1d24QngXfY6RrguuwC78LZH02d7S4+gJBep5b1aiWFPPkBil+52Zz5h1joSxRJO5E8djEN7CVxftlL8Fs6uahIAiwx1A4g02LAYDH+koja3aC90X4LKm4zig9vI+Od8AdkEG+AXbY8/R8jQOaNYHur0v9IkAGuieKG6LRMEDiwLIvDEafX4F09KshnjJ0XXlw5/Jn+XHCKebYftDVlINM6GZDbAQhHSRaO5T5D25FDoYz0f9gMIhRe5S87FW1VrNql+U7nA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mGPmY-0005Tw-GL; Wed, 18 Aug 2021 19:55:18 +0200
Date: Wed, 18 Aug 2021 18:55:05 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 1/3] drm/v3d: decouple adding job dependencies steps from job
 init
Message-ID: <dfef7bb92ab4b1d2e97c5dab6813b8fdff444f14.1629307160.git.mwen@igalia.com>
References: <cover.1629307160.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kx3hwird4m4b363w"
Content-Disposition: inline
In-Reply-To: <cover.1629307160.git.mwen@igalia.com>
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


--kx3hwird4m4b363w
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
index a3529809d547..593ed2206d74 100644
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
@@ -904,8 +913,7 @@ v3d_gem_init(struct drm_device *dev)
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


--kx3hwird4m4b363w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEdSXkACgkQwqF3j0dL
ehzoBQ//WNE92M74KiC3F4HtPvYKfcWqR/OpRDXLtDXLiIlxk16k4o6xRZnWsQXM
oF2VFtesnw2oD9TZXmOvnyIT2UpTiVp3lJ7jRak89+cSGvkBl14xVvqxItx8UnOH
AWty7lj0C0DNbHl5hS435y2Xj0M6vgMV+J6eL0Y592Qv9yDWZju4UblDAzy9a8Nw
wByiHkAJ/vrxWYItPplvLv/i68ZNVKmykFjLg/DIbR/hHyADVRq0q7AdO0Nd9E4V
wAN9/4i5b7qCjXpniQzZiUS0Msdw9eJJFn09MnvvtIba/5gVaBsou7hdm5foF90D
CnBCIwtBjamXI1kPzl7n+u3XJE/yRLMeqjShgnbJufHaYY+lCUiBrbHDgDHbPFYT
ig+1PIbW2SFwb/vJbRXgXNOhjo+me/i3el/+/7y2q1U3DSbkaS9BuusT7BtV3ER2
iM95vJSAV+BlqE5hzJPLMf+wUwROj8cpxpra7eMeU68mivmGe//IRUFmg9xBhxAB
ZvtWsbIyE3I14VK70/zsgTsNiOGQ4qZodpHecS680aGhO6KC91PaFS0vuDcmjRNk
tge/shklogVS1Y3sOPrIP2DtwfK5BQqPzlYMo+NAIj+QGEHqL9owPF/798WLwdSa
XPUMfCqRN+O705IM/qRy9J2DnSU7P0Sy0C8/cldsfXoa0Jgheg8=
=V5IH
-----END PGP SIGNATURE-----

--kx3hwird4m4b363w--
