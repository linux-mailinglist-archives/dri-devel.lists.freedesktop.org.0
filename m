Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC82B41C1DF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733E56EA19;
	Wed, 29 Sep 2021 09:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892046EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=4SaYTUPwIrFRDtOUBRkIfihO8eZVOAVw+gyCBoS2eAs=; 
 b=ChFFOPpxrAfkdo+c5IYcRp91w5FRu2haVfhVAe9lAHtYs2vszKgBHipBrZHvBJXNm9FePX7mc32pxVKjr5pNUCte+Vp/1ElOtZpWQ0y4Rm2vRBLfkoxenZqupPklo4tlXMUFf2IKa6+kUpamhAVSuvTVOCPZ6+PLZPsWfDLQSEL8a8n0mPXY1sp5ROluQ1CsLj1c9gJqEO07pfH9rhawZptGSdY05pE2zwdZe0GwTWMKDR01bAg0pjm6mpBYs9XyqfwCB4rx8pckCWKJLG6Me6qU3vpxKT+plLUy6TYjmMathnBu1esF/0qhXMSu2UdUds3AGnkHWEnF+stxvBRzKw==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVW9H-0005pA-Oj; Wed, 29 Sep 2021 11:45:11 +0200
Date: Wed, 29 Sep 2021 10:44:58 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v2 3/4] drm/v3d: add generic ioctl extension
Message-ID: <779e2cc57efd5fbc95f1267e7252de5f092045c5.1632905676.git.mwen@igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nu32tjluo7joiexq"
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


--nu32tjluo7joiexq
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

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
 drivers/gpu/drm/v3d/v3d_gem.c | 71 +++++++++++++++++++++++++++++++++--
 include/uapi/drm/v3d_drm.h    | 31 +++++++++++++++
 3 files changed, 100 insertions(+), 6 deletions(-)

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
index 9cfa6f8d4357..b912419027f7 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -535,6 +535,33 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fi=
le *file_priv,
 	}
 }
=20
+static int
+v3d_get_extensions(struct drm_file *file_priv, u64 ext_handles)
+{
+	struct drm_v3d_extension __user *user_ext;
+
+	user_ext =3D u64_to_user_ptr(ext_handles);
+	while(user_ext) {
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
@@ -563,15 +590,24 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
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
 			   v3d_render_job_free, args->in_sync_bcl, V3D_RENDER);
 	if (ret)
@@ -700,6 +736,19 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *dat=
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
@@ -784,11 +833,27 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
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


--nu32tjluo7joiexq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFUNZoACgkQwqF3j0dL
ehw9QQ/+K2jEBZPGveXqJHNR+sxh08PNkSMKR2O6AyIJ3wmHKWVreoUGe0zVvmz2
/tm6hejQpmEXIaOEkX1eLZQ0wpvWefs2xexdYK6wVqJxLOpDXEpeypnEX5PurE60
zkG1H74pe2FS289dw9NNFnrC59kfLgj7ZMJkySx5peKBG/uHAbsfl3UGj2JRIFml
8MSwbqUOPj7imsdsw1a1RTpCU56VkFJpC5EH0YveFFZLsHgumqULuoVDr5gARzAa
s9NRTYhlk2KFkhJI5Fr0DYeWdMifoK6YKX+TgVj0kacDpmTyIJmNkoFAznKhI0RO
9e05MSALzQ3dW9g1ZNwIoDvsmNbC6QBmFgku3iyplsNSz0XFlIGPb/arpz50ro50
Kgl8Wv4FqSvggqekkhXe1tTBZcNhLY138skXB5ZFe1E0j4NwGaBzpw04OkfGIfvs
eTuyP3EnnpLZa0Qj/KIXgYiMw4DqlDn8jEnrnAmZIHBESZ9ngbHcY2JaD8bVRl6J
MTCjwUnoafLisNybS/qSfW+8yDCpmYDyWB3pKWOfjN2eiXFyqRums2mbKPRRPVvx
JT5vSCQn1ZS96MfW8OjIYQTkKCKCAh9hncKaio6btMbZw0LlgP6qMKGrPP7PKlM9
oJcE+XkzPGyl7jUybizb78bvJnrDehUVnnXMwihDani8XiJaUOE=
=EyMj
-----END PGP SIGNATURE-----

--nu32tjluo7joiexq--
