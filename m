Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1B3E03B0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631576EAAA;
	Wed,  4 Aug 2021 14:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5B46EAAA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=iZ3tT4JLqa5xYRQsWCcNEVPZmKIalHwkZBlVvNgvKqg=; 
 b=rcolLJqnN/YkHGTmA238piXEyR/dQQ5iQUFaueAZpRArSMfn3qBEr2GDzgAMz7QpxD145bbC+n/r/ci+TKSMVLv81H/e3A20FwtIYmDuCDVkLL+bKjqcrE9Awfmkkd4ZwFUpBtNJlBg0H8jPV4OmfeCaHV4imyq7CUaHVLpsLcPtQkCWllvDjh9aIGkej4+ot3KC/V6wlRho/eAD+sQdu9m1B0aEoKufeR4lMoJ/QmsAAgGmV3fwrl7KFR2VEBLl08jvVuSYoB1VrlXhcp405g+7b1VnMO4yMlsTpZfnTEC6+z/V3eV2URWg8l2EC+vF1Re8p4Ma2hrGY1YoYzAEzA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mBID8-0006D2-Gt; Wed, 04 Aug 2021 16:49:34 +0200
Date: Wed, 4 Aug 2021 15:49:22 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [RFC PATCH 2/3] drm/v3d: add generic ioctl extension
Message-ID: <5691ef8b018c88809e74206b2745954503ba6098.1628076510.git.mwen@igalia.com>
References: <cover.1628076510.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bbgbcl3lq6svpeqf"
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


--bbgbcl3lq6svpeqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add support to attach generic extensions on job submission.
This patch is a second prep work to enable multiple syncobjs on job
submission. With this work, when the job submission interface needs
to be extended to accomodate a new feature, we will use a generic
extension struct where an id determines the data type to be pointed.
The first application is to enable multiples in/out syncobj (next
patch), but the base is already done for future features.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
 drivers/gpu/drm/v3d/v3d_gem.c | 84 ++++++++++++++++++++++++++++++++---
 include/uapi/drm/v3d_drm.h    | 38 +++++++++++++++-
 3 files changed, 115 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 9403c3b36aca..6a0516160bb2 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -83,7 +83,6 @@ static int v3d_get_param_ioctl(struct drm_device *dev, vo=
id *data,
 		return 0;
 	}
=20
-
 	switch (args->param) {
 	case DRM_V3D_PARAM_SUPPORTS_TFU:
 		args->value =3D 1;
@@ -147,7 +146,7 @@ v3d_postclose(struct drm_device *dev, struct drm_file *=
file)
 DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
=20
 /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
- * protection between clients.  Note that render nodes would be be
+ * protection between clients.  Note that render nodes would be
  * able to submit CLs that could access BOs from clients authenticated
  * with the master node.  The TFU doesn't use the GMP, so it would
  * need to stay DRM_AUTH until we do buffer size/offset validation.
@@ -222,7 +221,6 @@ static int v3d_platform_drm_probe(struct platform_devic=
e *pdev)
 	u32 mmu_debug;
 	u32 ident1;
=20
-
 	v3d =3D devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
 	if (IS_ERR(v3d))
 		return PTR_ERR(v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 944bc4728055..22f3ef9f52d2 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -525,6 +525,38 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fi=
le *file_priv,
 	}
 }
=20
+static int
+v3d_get_extensions(struct drm_file *file_priv,
+		   u32 ext_count, u64 ext_handles)
+{
+	int i;
+	struct drm_v3d_extension __user *handles;
+
+	if (!ext_count)
+		return 0;
+
+	handles	=3D u64_to_user_ptr(ext_handles);
+	for (i =3D 0; i < ext_count; i++) {
+		struct drm_v3d_extension ext;
+
+		if (copy_from_user(&ext, handles, sizeof(ext))) {
+			DRM_DEBUG("Failed to copy submit extension\n");
+			return -EFAULT;
+		}
+
+		switch (ext.id) {
+		case 0:
+		default:
+			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
+			return -EINVAL;
+		}
+
+		handles =3D u64_to_user_ptr(ext.next);
+	}
+
+	return 0;
+}
+
 /**
  * v3d_submit_cl_ioctl() - Submits a job (frame) to the V3D.
  * @dev: DRM device
@@ -553,15 +585,23 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
=20
 	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
=20
-	if (args->pad !=3D 0)
-		return -EINVAL;
-
-	if (args->flags !=3D 0 &&
-	    args->flags !=3D DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
+	if (args->flags &&
+	    args->flags & ~(DRM_V3D_SUBMIT_CL_FLUSH_CACHE |
+			    DRM_V3D_SUBMIT_EXTENSION)) {
 		DRM_INFO("invalid flags: %d\n", args->flags);
 		return -EINVAL;
 	}
=20
+	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
+		ret =3D v3d_get_extensions(file_priv,
+					 args->extension_count,
+					 args->extensions);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			return ret;
+		}
+	}
+
 	render =3D kcalloc(1, sizeof(*render), GFP_KERNEL);
 	if (!render)
 		return -ENOMEM;
@@ -721,6 +761,21 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *dat=
a,
=20
 	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
=20
+	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
+		DRM_DEBUG("invalid flags: %d\n", args->flags);
+		return -EINVAL;
+	}
+
+	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
+		ret =3D v3d_get_extensions(file_priv,
+					 args->extension_count,
+					 args->extensions);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			return ret;
+		}
+	}
+
 	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
 	if (!job)
 		return -ENOMEM;
@@ -822,12 +877,27 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
 		return -EINVAL;
 	}
=20
+	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
+		DRM_INFO("invalid flags: %d\n", args->flags);
+		return -EINVAL;
+	}
+
+	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
+		ret =3D v3d_get_extensions(file_priv,
+					 args->extension_count,
+					 args->extensions);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			return ret;
+		}
+	}
+
 	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
 	if (!job)
 		return -ENOMEM;
=20
-	ret =3D v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+	ret =3D v3d_job_init(v3d, file_priv, &job->base, v3d_job_free,
+			   args->in_sync);
 	if (ret) {
 		kfree(job);
 		return ret;
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 4104f22fb3d3..1f4706010eb5 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -58,6 +58,19 @@ extern "C" {
 						   struct drm_v3d_perfmon_get_values)
=20
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
+#define DRM_V3D_SUBMIT_EXTENSION		  0x02
+
+/* struct drm_v3d_extension - ioctl extensions
+ *
+ * Linked-list of generic extensions where the id identify which struct is
+ * pointed by ext_data. Therefore, DRM_V3D_EXT_ID_* is used on id to ident=
ify
+ * the extension type.
+ */
+struct drm_v3d_extension {
+	__u64 next;
+	__u64 ext_data;
+	__u32 id;
+};
=20
 /**
  * struct drm_v3d_submit_cl - ioctl argument for submitting commands to th=
e 3D
@@ -135,12 +148,17 @@ struct drm_v3d_submit_cl {
 	/* Number of BO handles passed in (size is that times 4). */
 	__u32 bo_handle_count;
=20
+	/* DRM_V3D_SUBMIT_* properties */
 	__u32 flags;
=20
 	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
 	__u32 perfmon_id;
=20
-	__u32 pad;
+	/* Number of extensions*/
+	__u32 extension_count;
+
+	/* Pointer to a list of ioctl extensions*/
+	__u64 extensions;
 };
=20
 /**
@@ -248,6 +266,15 @@ struct drm_v3d_submit_tfu {
 	__u32 in_sync;
 	/* Sync object to signal when the TFU job is done. */
 	__u32 out_sync;
+
+	/* Number of extensions*/
+	__u32 extension_count;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
+
+	/* DRM_V3D_SUBMIT_* properties */
+	__u32 flags;
 };
=20
 /* Submits a compute shader for dispatch.  This job will block on any
@@ -276,6 +303,15 @@ struct drm_v3d_submit_csd {
=20
 	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
 	__u32 perfmon_id;
+
+	/* DRM_V3D_SUBMIT_* properties */
+	__u32 flags;
+
+	/* Number of extensions*/
+	__u32 extension_count;
+
+	/* Pointer to a list of ioctl extensions*/
+	__u64 extensions;
 };
=20
 enum {
--=20
2.30.2


--bbgbcl3lq6svpeqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEKqPEACgkQwqF3j0dL
ehwPuQ//Wp6eBe/c/UGLpR7Xra9Q+AsE9NtjgfcR4jQZnpxiJsO5iCrSoT8xjC5/
6orDP+HAdeMx+utcohvaHOTc1pbU8flezxXVgAwJzEeX+uVsmKliywJiJ7u4+rLC
Cpj3ZFuhd8YGhWfIx5Fy6tzOVPzJ6ISVhRJPS5WW76XkxSO/DLFfFfN5UCcizCHy
PzAYAmdeU96nXfySWOt7mEskLvvkmEPd4ga3Gah3y1EcAaXY6YsTjxjLv+cv2Grz
FpEeOq1GoYTvkluHgPw8Yg4kRHRKfbrptExD9w4qk9xsB/hdj2e1fRYG46VGTfqD
dHULcjVCIe/LDnvemKXZdyoVpIEMzdNmEJQ64KjHIhEAhVRZ9iIi70CNQs01xfEn
ANwtewiKCpb3w63wwASdwtj/TrvcHYqNeg1eitg2qcfiKWbnp9QZCd/y2l91V60c
mIDZx7gUIjvVePVF8/KoL7pavpoAODXW7W/abV6l7Lbqn7WJrvCd0V3bDBbWZSqq
3PkGSlYnqjPoPCqkSYHA3sDRsvmic7G9m3zdQ4BPsdee2VYzVAEPyDdCBnMwv6PA
+37eZUdEVSUTjzNwv7qlplkQrj0mS2hH+dJxKYVRKG4CabDKA/RtsKu0ymAW+/uA
oq8tWvfDj/mRGTmvdQ/Hibzrjs1tZJOQVNKiFqUZdS2M9eRTyvw=
=mD08
-----END PGP SIGNATURE-----

--bbgbcl3lq6svpeqf--
