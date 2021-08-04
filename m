Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF843E03AC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D996EA98;
	Wed,  4 Aug 2021 14:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B7E6EA98
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=lKgkdoxuUuTfSLxE8lX6WA/HUDMEHHfrj+hldxfaDd8=; 
 b=AN2/VdhcHyb1LdyOxlJ/9yYwWF+ay6yf/N94RpuN3twvLunwkQmU/4KK1qRdvRq1JAb43+RgvoGAvs8qj0UDd/gbMb/5szIZ0la1v0cSqbYAzojw9icEr7aG/PLitz38OFujtcbuErjXBCPIlIWYouqLlF2IA23brv2JgSuYUdfMXy/ig0GX6ncSyyXdDkW1IVDZartc1Z0gwpv9eiZwYqsx9Fm2TEc6EiDCMHHexpuQrDj0rl9Cjq118sxh4l6PciLA/CDrEOVYc16u/9MQEl+P8h3dwAPMkKleOZashLmsuHAx5izA85Yckpefvz4p/Clu44A8NmcQzA0jZfqI3g==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mBICZ-0006Ac-3Q; Wed, 04 Aug 2021 16:48:59 +0200
Date: Wed, 4 Aug 2021 15:48:46 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [RFC PATCH 1/3] drm/v3d: decouple adding job dependencies from job
 init
Message-ID: <f3939e24993b85306322d46067f5f09804a1f776.1628076510.git.mwen@igalia.com>
References: <cover.1628076510.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="khw7vpglzurfbhof"
Content-Disposition: inline
In-Reply-To: <cover.1628076510.git.mwen@igalia.com>
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


--khw7vpglzurfbhof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prep work to enable multiple syncobj as job dependency.
Also get rid of old checkpatch warnings in the v3d_gem file.
No functional changes.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 5689da118197..944bc4728055 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -417,7 +417,7 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
=20
 	ret =3D drm_gem_dma_resv_wait(file_priv, args->handle,
-					      true, timeout_jiffies);
+				    true, timeout_jiffies);
=20
 	/* Decrement the user's timeout, in case we got interrupted
 	 * such that the ioctl will be restarted.
@@ -435,12 +435,25 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
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
+	return drm_gem_fence_array_add(&job->deps, in_fence);
+}
+
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     struct v3d_job *job, void (*free)(struct kref *ref),
 	     u32 in_sync)
 {
-	struct dma_fence *in_fence =3D NULL;
 	int ret;
=20
 	job->v3d =3D v3d;
@@ -452,11 +465,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fil=
e_priv,
=20
 	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
=20
-	ret =3D drm_syncobj_find_fence(file_priv, in_sync, 0, 0, &in_fence);
-	if (ret =3D=3D -EINVAL)
-		goto fail;
-
-	ret =3D drm_gem_fence_array_add(&job->deps, in_fence);
+	ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
 	if (ret)
 		goto fail;
=20
@@ -503,7 +512,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fil=
e *file_priv,
 	for (i =3D 0; i < job->bo_count; i++) {
 		/* XXX: Use shared fences for read-only objects. */
 		dma_resv_add_excl_fence(job->bo[i]->resv,
-						  job->done_fence);
+					job->done_fence);
 	}
=20
 	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
@@ -924,8 +933,7 @@ v3d_gem_init(struct drm_device *dev)
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


--khw7vpglzurfbhof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEKqM4ACgkQwqF3j0dL
ehwHAw/+Jc+SBSS8c6DoqzEfRSn0A+ISVEvLfChF9qfqoI2O5bfPZ/Xuxh95dpSu
pO7IfxoNElFqtxke412lpfXZK4xhSMbNY6gkqKykQgg4UvgSgkevjgKSUtk3Qqe8
2Tkp+AKF7Rl86EHxm6jviD6cojS+RXv/qk7s/in8UjlPbEUhz+7TlquDj7tbKUwS
czrw1tMKbnbcvJWzdXQgLH7IvWZOP8xpnB62V7mGojzQafuQlyK+x/aeqV2f0efN
zl4pLn4f0oTGDQ0nsOQPU1fHg5VZaS7riNm8tJEb8qRlWh/gh84hqv7AzkbGaY7+
/nOLIY3wocgfL6A874HLc3BvJfVEEmj4kNY/vtvR9xbjQBNyP3OpBT1dBUi4FaKt
mjwXHSRQ8VyRiMkXua7ZtATgl9LvupnnSPAr2HqA8Nh9fi7NnNZaFZ1Noq0pIwbx
TewQ2z+oeCKgzr7OSZIqUX71ng8+/XspuaStHiwFSpF7tsV3V0NAHLe3Aqvu8Apj
VXyHH8Y+MhM6/BjcnIen/TXzhLqQY3YreBNFV2u/E3+7ZF2w/WjoX3FyrDF57hgu
oIuBBwfca7N/qtkDx9Vio9PJGjJHOIMD8nB93fZdbxpUqudesYmQT5WtGIq9wB2A
iS9Ji4WdSBDE3g8XGdpSujC+DFsE/fTFu33Hg3LLAwP/3+Bkq0Y=
=ieUm
-----END PGP SIGNATURE-----

--khw7vpglzurfbhof--
