Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D641DEBB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 18:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4976E6EC05;
	Thu, 30 Sep 2021 16:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBD86EC05
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=2ozv7YWbPm4LVn6MIVeLKnyhHnr/Nwvk1REtsYtiAjQ=; 
 b=DZL77DP8XgTnp+VJ65dhq8V/tKNkDVRSzMZiRvb4vgoIA71xee5REgzVaNeuiMcgrotqXfkSkNf0/EAIY6F4Y/oEI1g9j7dRu0/2RW3ZSeDk+yDXo6jLBJ9pSs6nNHEMY2DV1RKJSXDMspw9kkEJvK0HdJm2EB9gJe+1ZrGG1waCCsMOZ/jWRQwVNtTfRwAxUwdpig1XPzPfooFRPCUqLWckj2L4moPG/bKksWjpiQ8dKKVhQjw67O2G0yeo29165+xbnpOsYZimBV+OrYN6HhaWeJiI0yC47yKRSmgcfm3ZrNIq6E6eN0d2TuKD0fXPFsS7t/5B4SRj6Z139J0t+g==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVyly-0001UM-AM; Thu, 30 Sep 2021 18:19:02 +0200
Date: Thu, 30 Sep 2021 17:18:50 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v3 3/4] drm/v3d: add generic ioctl extension
Message-ID: <ed53b1cd7e3125b76f18fe3fb995a04393639bc6.1633016479.git.mwen@igalia.com>
References: <cover.1633016479.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nh2hx2rmp2itxbwh"
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


--nh2hx2rmp2itxbwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add support to attach generic extensions on job submission. This patch
is third prep work to enable multiple syncobjs on job submission. With
this work, when the job submission interface needs to be extended to
accomodate a new feature, we will use a generic extension struct where
an id determines the data type to be pointed. The first application is
to enable multiples in/out syncobj (next patch), but the base is
already done for future features. Therefore, to attach a new feature,
a specific extension struct should subclass drm_v3d_extension and
update the list of extensions in a job submission.

v2:
- remove redundant elements to subclass struct (Daniel)

v3:
- add comment for v3d_get_extensions

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
 drivers/gpu/drm/v3d/v3d_gem.c | 74 +++++++++++++++++++++++++++++++++--
 include/uapi/drm/v3d_drm.h    | 31 +++++++++++++++
 3 files changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index c1deab2cf38d..3d6b9bcce2f7 100644
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
@@ -219,7 +218,6 @@ static int v3d_platform_drm_probe(struct platform_devic=
e *pdev)
 	u32 mmu_debug;
 	u32 ident1;
=20
-
 	v3d =3D devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
 	if (IS_ERR(v3d))
 		return PTR_ERR(v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index f932e73fb5c6..93f130fb3a13 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -537,6 +537,36 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fi=
le *file_priv,
 	}
 }
=20
+/* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
+ * according to the extension id (name).
+ */
+static int
+v3d_get_extensions(struct drm_file *file_priv, u64 ext_handles)
+{
+	struct drm_v3d_extension __user *user_ext;
+
+	user_ext =3D u64_to_user_ptr(ext_handles);
+	while (user_ext) {
+		struct drm_v3d_extension ext;
+
+		if (copy_from_user(&ext, user_ext, sizeof(ext))) {
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
+		user_ext =3D u64_to_user_ptr(ext.next);
+	}
+
+	return 0;
+}
+
 /**
  * v3d_submit_cl_ioctl() - Submits a job (frame) to the V3D.
  * @dev: DRM device
@@ -565,15 +595,24 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
=20
 	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
=20
-	if (args->pad !=3D 0)
+	if (args->pad)
 		return -EINVAL;
=20
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
+		ret =3D v3d_get_extensions(file_priv, args->extensions);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			return ret;
+		}
+	}
+
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&render, sizeof(*render),
 			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
 	if (ret)
@@ -702,6 +741,19 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *dat=
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
+		ret =3D v3d_get_extensions(file_priv, args->extensions);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			return ret;
+		}
+	}
+
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
 			   v3d_job_free, args->in_sync, V3D_TFU);
 	if (ret)
@@ -786,11 +838,27 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
=20
 	trace_v3d_submit_csd_ioctl(&v3d->drm, args->cfg[5], args->cfg[6]);
=20
+	if (args->pad)
+		return -EINVAL;
+
 	if (!v3d_has_csd(v3d)) {
 		DRM_DEBUG("Attempting CSD submit on non-CSD hardware\n");
 		return -EINVAL;
 	}
=20
+	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
+		DRM_INFO("invalid flags: %d\n", args->flags);
+		return -EINVAL;
+	}
+
+	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
+		ret =3D v3d_get_extensions(file_priv, args->extensions);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			return ret;
+		}
+	}
+
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
 			   v3d_job_free, args->in_sync, V3D_CSD);
 	if (ret)
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 4104f22fb3d3..55b443ca6c0b 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -58,6 +58,20 @@ extern "C" {
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
+	__u32 id;
+#define DRM_V3D_EXT_ID_MULTI_SYNC		0x01
+	__u32 flags; /* mbz */
+};
=20
 /**
  * struct drm_v3d_submit_cl - ioctl argument for submitting commands to th=
e 3D
@@ -135,12 +149,16 @@ struct drm_v3d_submit_cl {
 	/* Number of BO handles passed in (size is that times 4). */
 	__u32 bo_handle_count;
=20
+	/* DRM_V3D_SUBMIT_* properties */
 	__u32 flags;
=20
 	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
 	__u32 perfmon_id;
=20
 	__u32 pad;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
 };
=20
 /**
@@ -248,6 +266,12 @@ struct drm_v3d_submit_tfu {
 	__u32 in_sync;
 	/* Sync object to signal when the TFU job is done. */
 	__u32 out_sync;
+
+	__u32 flags;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
+
 };
=20
 /* Submits a compute shader for dispatch.  This job will block on any
@@ -276,6 +300,13 @@ struct drm_v3d_submit_csd {
=20
 	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
 	__u32 perfmon_id;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
+
+	__u32 flags;
+
+	__u32 pad;
 };
=20
 enum {
--=20
2.30.2


--nh2hx2rmp2itxbwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFV42kACgkQwqF3j0dL
ehzbmBAAs7ACkCjDBoAcKDx/Py5YEAxRl+S9RBvpddnuX/mkjuO/6B5TRod5xDiP
Gz5h5Kup9PuF1t/cmmaAPZOO4sdutTI/tDGpbrgsMXbHTElrlLOpCw2XHVO2aymF
ASjFwF2EbBVMzxJXCIb7hqSbGMi6+4i+qWNwOYzG7OBoj8djnisdGe8Q9ZSBfL4L
xBvSW6Mg/m3Zul510c1O8zgmFrsEH6YgZU+VVP2lNYcKAmQvfcLsQDpAiHbxROjo
PW6JlEoHseahb83nmtjXWm5p35smitHEs357uCTFWPdebADZp/GNGqxQm0S9pNsk
/RgL9crYx0rkwG0cDj3Vu253MqSs92pP3JFh1hi2r7P8d2FPz+/0suDCW+D+42XX
wl0T6A+NzEA9OeTjqSGC5guo1vSb8MxArCAuG3mFuNc7BJldqS/cSOyg0jxKOjB1
4TaFbxw+8DkmNf+/Mb/PtlwI4AXSD0r90fDms26i/oRReZD8M+lQxDLRl6oabfD1
0fxrt4umTdi6IqFk/axlwFbm4kCUiAxbtgxvRbmNyIA7+4Yn9CKbOaAv7bnhNvBD
R2ch6aROlcPJDRf8SbP8QRXjmMiemWaLndpj0GWwGrjOqJNpuIccGlE4WBG2U3JR
N1LO3pi0tutjTq/+GvBgynNcgrAKyj3yXYZT/pf8Bt+B2pVTz00=
=h2kp
-----END PGP SIGNATURE-----

--nh2hx2rmp2itxbwh--
