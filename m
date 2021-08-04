Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB60F3E03B2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34286EAA4;
	Wed,  4 Aug 2021 14:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13B6EAA4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=wFWu+f24ECidQbqUjKyr7wAKJ0BTaDb51gmmHruCeGo=; 
 b=AVbmXpkSSiLJmZv4AWEaBpDSJCjob0fmWu8nKE4XvcWYVwxFkuK+kh9XP3vIX3sQO2kvdzzUrY4SBRwgBAYgNUExbFSiA2O9Wqid6NsYvxXuroPNpjUGRSx6EVjHWVlOnDXtLjjPnQpWTr1b+IyEWxzWEe2dH9h6OBdHUSjuH+lS2XElEaOHNTTmCrQTS8szVDuQ5IjRzmaWMI9BhFDTDpKDFwzoGQ3ggHEPo2nj6fpivWPSLY1+tE03+VeZVhwoDCFcIYNHe8BK+cZmNMUJOc2dWxsjiqs76WUk5BzEzrUry8JfD8f8PSF9jNsEg3ZS/mb9HoYbUSHRrdTag7xIpA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mBIDf-0006F6-DW; Wed, 04 Aug 2021 16:50:07 +0200
Date: Wed, 4 Aug 2021 15:49:54 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [RFC PATCH 3/3] drm/v3d: add multiple syncobjs support
Message-ID: <09e0b920838903cccd680241e27070912883b842.1628076510.git.mwen@igalia.com>
References: <cover.1628076510.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="snm43tezymlmr6kt"
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


--snm43tezymlmr6kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Using the generic extension support set in the previous patch, this
patch enables more than one in/out binary syncobj per job submission.
Arrays of syncobjs are set in a specific extension type (multisync)
that also cares of determining the stage for sync (bin/render)
through a flag - when this is the case.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c |   3 +
 drivers/gpu/drm/v3d/v3d_drv.h |  14 +++
 drivers/gpu/drm/v3d/v3d_gem.c | 210 ++++++++++++++++++++++++++++------
 include/uapi/drm/v3d_drm.h    |  38 ++++++
 4 files changed, 231 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 6a0516160bb2..939ca8c833f5 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -96,6 +96,9 @@ static int v3d_get_param_ioctl(struct drm_device *dev, vo=
id *data,
 	case DRM_V3D_PARAM_SUPPORTS_PERFMON:
 		args->value =3D (v3d->ver >=3D 40);
 		return 0;
+	case DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT:
+		args->value =3D 1;
+		return 0;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", args->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 270134779073..a4fdd7539691 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -299,6 +299,20 @@ struct v3d_csd_job {
 	struct drm_v3d_submit_csd args;
 };
=20
+struct v3d_submit_outsync {
+	struct drm_syncobj *syncobj;
+};
+
+struct v3d_submit_ext {
+	u32 flags;
+
+	u32 in_sync_count;
+	u64 in_syncs;
+
+	u32 out_sync_count;
+	struct v3d_submit_outsync *out_syncs;
+};
+
 /**
  * __wait_for - magic wait macro
  *
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 22f3ef9f52d2..52ec52f6340e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -452,9 +452,12 @@ v3d_job_add_deps(struct drm_file *file_priv, struct v3=
d_job *job,
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     struct v3d_job *job, void (*free)(struct kref *ref),
-	     u32 in_sync)
+	     u32 in_sync, struct v3d_submit_ext *se, u32 rcl_sync_flag)
 {
-	int ret;
+	int ret, i;
+	struct drm_v3d_sem __user *handle =3D NULL;
+	struct dma_fence *in_fence =3D NULL;
+	unsigned long index;
=20
 	job->v3d =3D v3d;
 	job->free =3D free;
@@ -465,14 +468,34 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
=20
 	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
=20
-	ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
-	if (ret)
-		goto fail;
+	if (!(se && se->in_sync_count)) {
+		ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
+		if (ret)
+			goto fail;
+	} else if (se && se->in_sync_count && (se->flags & DRM_V3D_IN_SYNC_RCL) =
=3D=3D rcl_sync_flag) {
+		handle =3D u64_to_user_ptr(se->in_syncs);
+
+		for (i =3D 0; i < se->in_sync_count; i++) {
+			struct drm_v3d_sem in;
+
+			ret =3D copy_from_user(&in, handle++, sizeof(in));
+			if (ret) {
+				DRM_DEBUG("Failed to copy wait dep handle.\n");
+				goto fail;
+			}
+
+			ret =3D v3d_job_add_deps(file_priv, job, in.handle, 0);
+			if (ret)
+				goto fail;
+		}
+	}
=20
 	kref_init(&job->refcount);
=20
 	return 0;
 fail:
+	xa_for_each(&job->deps, index, in_fence)
+		dma_fence_put(in_fence);
 	xa_destroy(&job->deps);
 	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
@@ -504,6 +527,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fil=
e *file_priv,
 					 struct v3d_job *job,
 					 struct ww_acquire_ctx *acquire_ctx,
 					 u32 out_sync,
+					 struct v3d_submit_ext *se,
 					 struct dma_fence *done_fence)
 {
 	struct drm_syncobj *sync_out;
@@ -518,6 +542,18 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fi=
le *file_priv,
 	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
=20
 	/* Update the return sync object for the job */
+	/* If multiples semaphores is supported */
+	if (se && se->out_sync_count) {
+		for (i =3D 0; i < se->out_sync_count; i++) {
+			drm_syncobj_replace_fence(se->out_syncs[i].syncobj,
+						  done_fence);
+			drm_syncobj_put(se->out_syncs[i].syncobj);
+		}
+		kvfree(se->out_syncs);
+		return;
+	}
+
+	/* Single signal semaphore */
 	sync_out =3D drm_syncobj_find(file_priv, out_sync);
 	if (sync_out) {
 		drm_syncobj_replace_fence(sync_out, done_fence);
@@ -525,11 +561,93 @@ v3d_attach_fences_and_unlock_reservation(struct drm_f=
ile *file_priv,
 	}
 }
=20
+static void
+v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < se->out_sync_count; i++)
+		drm_syncobj_put(se->out_syncs[i].syncobj);
+	kvfree(se->out_syncs);
+}
+
+static int
+v3d_get_multisync_post_deps(struct drm_file *file_priv,
+			    struct v3d_submit_ext *se,
+			    u32 count, u64 handles)
+{
+	struct drm_v3d_sem __user *post_deps;
+	int i, ret;
+
+	se->out_syncs =3D (struct v3d_submit_outsync *)
+			kvmalloc_array(count,
+				       sizeof(struct v3d_submit_outsync),
+				       GFP_KERNEL);
+	if (!se->out_syncs)
+		return -ENOMEM;
+
+	post_deps =3D u64_to_user_ptr(handles);
+
+	for (i =3D 0; i < count; i++) {
+		struct drm_v3d_sem out;
+
+		ret =3D copy_from_user(&out, post_deps++, sizeof(out));
+		if (ret) {
+			DRM_DEBUG("Failed to copy post dep handles\n");
+			goto fail;
+		}
+
+		se->out_syncs[i].syncobj =3D drm_syncobj_find(file_priv,
+							    out.handle);
+		if (!se->out_syncs[i].syncobj) {
+			ret =3D -EINVAL;
+			goto fail;
+		}
+	}
+	se->out_sync_count =3D count;
+
+	return 0;
+
+fail:
+	for (i--; i >=3D 0; i--)
+		drm_syncobj_put(se->out_syncs[i].syncobj);
+	kvfree(se->out_syncs);
+
+	return ret;
+}
+
+static int
+v3d_get_multisync_submit_deps(struct drm_file *file_priv,
+			      struct v3d_submit_ext *se,
+			      u64 ext_data)
+{
+	struct drm_v3d_multi_sync multisync =3D {0};
+	int ret;
+
+	ret =3D copy_from_user(&multisync, u64_to_user_ptr(ext_data),
+			     sizeof(multisync));
+	if (ret)
+		return ret;
+
+	ret =3D v3d_get_multisync_post_deps(file_priv, se, multisync.out_sync_cou=
nt,
+					  multisync.out_syncs);
+	if (ret)
+		return ret;
+
+	se->in_sync_count =3D multisync.in_sync_count;
+	se->in_syncs =3D multisync.in_syncs;
+
+	se->flags =3D multisync.flags;
+
+	return 0;
+}
+
 static int
 v3d_get_extensions(struct drm_file *file_priv,
+		   struct v3d_submit_ext *se,
 		   u32 ext_count, u64 ext_handles)
 {
-	int i;
+	int i, ret;
 	struct drm_v3d_extension __user *handles;
=20
 	if (!ext_count)
@@ -545,7 +663,12 @@ v3d_get_extensions(struct drm_file *file_priv,
 		}
=20
 		switch (ext.id) {
-		case 0:
+		case DRM_V3D_EXT_ID_MULTI_SYNC:
+			ret =3D v3d_get_multisync_submit_deps(file_priv, se,
+							    ext.ext_data);
+			if (ret)
+				return ret;
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
@@ -576,6 +699,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_bin_job *bin =3D NULL;
 	struct v3d_render_job *render;
 	struct v3d_job *clean_job =3D NULL;
@@ -593,7 +717,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv,
+		ret =3D v3d_get_extensions(file_priv, &se,
 					 args->extension_count,
 					 args->extensions);
 		if (ret) {
@@ -603,33 +727,36 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
 	}
=20
 	render =3D kcalloc(1, sizeof(*render), GFP_KERNEL);
-	if (!render)
+	if (!render) {
+		v3d_put_multisync_post_deps(&se);
 		return -ENOMEM;
+	}
=20
 	render->start =3D args->rcl_start;
 	render->end =3D args->rcl_end;
 	INIT_LIST_HEAD(&render->unref_list);
=20
-	ret =3D v3d_job_init(v3d, file_priv, &render->base,
-			   v3d_render_job_free, args->in_sync_rcl);
+	ret =3D v3d_job_init(v3d, file_priv, &render->base, v3d_render_job_free,
+			   args->in_sync_rcl, &se, DRM_V3D_IN_SYNC_RCL);
 	if (ret) {
 		kfree(render);
+		v3d_put_multisync_post_deps(&se);
 		return ret;
 	}
=20
 	if (args->bcl_start !=3D args->bcl_end) {
 		bin =3D kcalloc(1, sizeof(*bin), GFP_KERNEL);
 		if (!bin) {
-			v3d_job_put(&render->base);
-			return -ENOMEM;
+			ret =3D -ENOMEM;
+			goto fail;
 		}
=20
-		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
-				   v3d_job_free, args->in_sync_bcl);
+		ret =3D v3d_job_init(v3d, file_priv, &bin->base, v3d_job_free,
+				   args->in_sync_bcl, &se, 0);
+
 		if (ret) {
-			v3d_job_put(&render->base);
 			kfree(bin);
-			return ret;
+			goto fail;
 		}
=20
 		bin->start =3D args->bcl_start;
@@ -647,7 +774,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail;
 		}
=20
-		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+		ret =3D v3d_job_init(v3d, file_priv, clean_job,
+				   v3d_job_free, 0, 0, 0);
 		if (ret) {
 			kfree(clean_job);
 			clean_job =3D NULL;
@@ -715,6 +843,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 						 last_job,
 						 &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 last_job->done_fence);
=20
 	if (bin)
@@ -735,6 +864,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	v3d_job_put(&render->base);
 	if (clean_job)
 		v3d_job_put(clean_job);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
@@ -755,6 +885,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_tfu *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_tfu_job *job;
 	struct ww_acquire_ctx acquire_ctx;
 	int ret =3D 0;
@@ -767,7 +898,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv,
+		ret =3D v3d_get_extensions(file_priv, &se,
 					 args->extension_count,
 					 args->extensions);
 		if (ret) {
@@ -777,21 +908,24 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
ta,
 	}
=20
 	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
-	if (!job)
+	if (!job) {
+		v3d_put_multisync_post_deps(&se);
 		return -ENOMEM;
+	}
=20
 	ret =3D v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync);
+			   v3d_job_free, args->in_sync, &se, 0);
 	if (ret) {
 		kfree(job);
+		v3d_put_multisync_post_deps(&se);
 		return ret;
 	}
=20
 	job->base.bo =3D kcalloc(ARRAY_SIZE(args->bo_handles),
 			       sizeof(*job->base.bo), GFP_KERNEL);
 	if (!job->base.bo) {
-		v3d_job_put(&job->base);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto fail;
 	}
=20
 	job->args =3D *args;
@@ -833,6 +967,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 &job->base, &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 job->base.done_fence);
=20
 	v3d_job_put(&job->base);
@@ -845,6 +980,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 				    &acquire_ctx);
 fail:
 	v3d_job_put(&job->base);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
@@ -865,8 +1001,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_csd *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_csd_job *job;
-	struct v3d_job *clean_job;
+	struct v3d_job *clean_job =3D NULL;
 	struct ww_acquire_ctx acquire_ctx;
 	int ret;
=20
@@ -883,7 +1020,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv,
+		ret =3D v3d_get_extensions(file_priv, &se,
 					 args->extension_count,
 					 args->extensions);
 		if (ret) {
@@ -893,28 +1030,30 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *d=
ata,
 	}
=20
 	job =3D kcalloc(1, sizeof(*job), GFP_KERNEL);
-	if (!job)
+	if (!job) {
+		v3d_put_multisync_post_deps(&se);
 		return -ENOMEM;
+	}
=20
 	ret =3D v3d_job_init(v3d, file_priv, &job->base, v3d_job_free,
-			   args->in_sync);
+			   args->in_sync, &se, 0);
 	if (ret) {
 		kfree(job);
+		v3d_put_multisync_post_deps(&se);
 		return ret;
 	}
=20
 	clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
 	if (!clean_job) {
-		v3d_job_put(&job->base);
-		kfree(job);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto fail;
 	}
=20
-	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0);
+	ret =3D v3d_job_init(v3d, file_priv, clean_job,
+			   v3d_job_free, 0, 0, 0);
 	if (ret) {
-		v3d_job_put(&job->base);
 		kfree(clean_job);
-		return ret;
+		goto fail;
 	}
=20
 	job->args =3D *args;
@@ -956,6 +1095,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 						 clean_job,
 						 &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 clean_job->done_fence);
=20
 	v3d_job_put(&job->base);
@@ -969,7 +1109,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 				    &acquire_ctx);
 fail:
 	v3d_job_put(&job->base);
-	v3d_job_put(clean_job);
+	if (clean_job)
+		v3d_job_put(clean_job);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 1f4706010eb5..bbb904c521b4 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -60,6 +60,42 @@ extern "C" {
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION		  0x02
=20
+/* struct drm_v3d_sem - wait/signal semaphore
+ *
+ * If binary semaphore, it only takes syncobj handle and ignores flags and
+ * point fields. Point is defined for timeline syncobj feature.
+ */
+struct drm_v3d_sem {
+	__u32 handle; /* syncobj */
+	/* rsv below, for future uses */
+	__u32 flags;
+	__u64 point;  /* for timeline sem support */
+	__u64 mbz[2]; /* must be zero, rsv */
+};
+
+/**
+ * struct drm_v3d_multi_sync - ioctl extension to add support multiples
+ * syncobjs for commands submission.
+ *
+ * When an extension of DRM_V3D_EXT_ID_MULTI_SYNC id is defined, it points=
 to
+ * this extension to define wait and signal dependencies, instead of single
+ * in/out sync entries on submitting commands. The field flags is used to
+ * determine the stage to set wait dependencies.
+ */
+struct drm_v3d_multi_sync {
+	/* Array of wait and signal semaphores */
+	__u64 in_syncs;
+	__u64 out_syncs;
+
+	/* Number of entries */
+	__u32 in_sync_count;
+	__u32 out_sync_count;
+
+	/* in_sync on render stage */
+	__u32 flags;
+#define DRM_V3D_IN_SYNC_RCL			0x01
+};
+
 /* struct drm_v3d_extension - ioctl extensions
  *
  * Linked-list of generic extensions where the id identify which struct is
@@ -70,6 +106,7 @@ struct drm_v3d_extension {
 	__u64 next;
 	__u64 ext_data;
 	__u32 id;
+#define DRM_V3D_EXT_ID_MULTI_SYNC		0x01
 };
=20
 /**
@@ -228,6 +265,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_CSD,
 	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
 	DRM_V3D_PARAM_SUPPORTS_PERFMON,
+	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
 };
=20
 struct drm_v3d_get_param {
--=20
2.30.2


--snm43tezymlmr6kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEKqRIACgkQwqF3j0dL
ehyOQxAAlOCeTQBnzDQPzPFcaMDJvFlccOgFEELhIOu15ShQ3lN8FXtjI8j9Akly
lg6Jv3pgShkOcBkoM36igWFJjJpcGKcXXwAaoHhPZ+VF2xSX4ZQD41t4+hxQptBe
LEhIcn4oi0wauJSDmtLSNjOO686J7oKobaraBdvqgNQA8zD48E6qjkGGvVlntCEa
hxjDTC27NAn2dDDx8WRfpt2r2SN6Pue3+5AUHeoUUBWbs1ueumgolLSNLf0MkF1W
9HGllschGvkgElbVjkKFpR3MAg03XrtNmlSptaoPK7OO6/ubCs9aJydgFxxqnYBm
AgjnV2l8jScOlBtiOViYnvgf1eeEBjYDHc+XEwO2AtU66SYHyOieN2Cq2xouFS7s
6OHBqyBHkV9GsFGF3ViIjNMIUtWVJouYqeC6bLub2EKNhMJHw3KRR4SquTHyFfeu
cDRfqJoUuJrIyxaka/Gp8BIJyIVDDYBvPSymgNyV223+BUBFGPlthzHaH8YoTKma
ZIKCCRuSJhIYA5fMlHOjGpmDQsq7s5EF3SCRFLJB+Lg7gj0lENthY207NWg/6n5/
bOWNGQ2RxUS6WAhJNMYVEvkCpb24AUVe0u7KFidAUNa9Zp1aFoCm7+S3IA1bGkBm
VDCmNDR54OFwC9LgT2nHdkh300HGUr3NVuUaoK+FNMFG7C/hA0I=
=pYcM
-----END PGP SIGNATURE-----

--snm43tezymlmr6kt--
