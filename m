Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B613F0AAF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B168984D;
	Wed, 18 Aug 2021 17:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C0A8984D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=+0QgH5NObiOnfqnNqW0ewiUhulYvP7NK3apzKFfrtqk=; 
 b=f+Qm5k7Q3j8+luGSaxy4TJmMz2OLnGER/HHwV0wK8wUg3GeHnvumOXg5uZUNU4AmO/FkViJwJFXjWLGlg5QKOaPTV14ebGAyWBdgEIUDIk27A1od753vMT1o5YNDil3vlIej7TEe55atjhXgAazcMzGUD6RSALk9tAtYMEglXbMyoB+i+aekY7LMTg7eAwWpWy/nTmry7qoo3tmurmr2OiyNhHMFfEufFJyQtmEAgORqre//ydQeirFOz1qQnxMBF2JZQZaPjepgo5p914u6F43ZdKHCAdtpaFzUX2yVJnzZAq+e4q8RZCkDoAxC52VznJTvswTVSxuHLwXegB8ArA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mGPpB-0005mY-J6; Wed, 18 Aug 2021 19:58:01 +0200
Date: Wed, 18 Aug 2021 18:57:50 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 3/3] drm/v3d: add multiple syncobjs support
Message-ID: <dbe78028cd28b41e513e614ec07438a19b4697a6.1629307160.git.mwen@igalia.com>
References: <cover.1629307160.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tf7iv5v2qaysrtyn"
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


--tf7iv5v2qaysrtyn
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
 drivers/gpu/drm/v3d/v3d_gem.c | 209 +++++++++++++++++++++++++++-------
 include/uapi/drm/v3d_drm.h    |  38 +++++++
 4 files changed, 226 insertions(+), 38 deletions(-)

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
index b900a050d5e2..544c60404a0f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -294,6 +294,20 @@ struct v3d_csd_job {
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
index e254919b6c5e..e7aabe1a0e11 100644
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
@@ -451,10 +454,11 @@ v3d_job_add_deps(struct drm_file *file_priv, struct v=
3d_job *job,
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     struct v3d_job *job, void (*free)(struct kref *ref),
-	     u32 in_sync, enum v3d_queue queue)
+	     u32 in_sync, struct v3d_submit_ext *se, enum v3d_queue queue)
 {
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
-	int ret;
+	bool has_multinsync =3D (se && se->in_sync_count);
+	int ret, i;
=20
 	job->v3d =3D v3d;
 	job->free =3D free;
@@ -463,14 +467,30 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
 	if (ret < 0)
 		return ret;
=20
-	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 v3d_priv);
+	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue], v3=
d_priv);
 	if (ret)
 		goto fail;
=20
-	ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
-	if (ret)
-		goto fail_job;
+	if (has_multinsync && (se->flags =3D=3D (queue =3D=3D V3D_RENDER))) {
+		struct drm_v3d_sem __user *handle =3D u64_to_user_ptr(se->in_syncs);
+
+		for (i =3D 0; i < se->in_sync_count; i++) {
+			struct drm_v3d_sem in;
+
+			ret =3D copy_from_user(&in, handle++, sizeof(in));
+			if (ret) {
+				DRM_DEBUG("Failed to copy wait dep handle.\n");
+				goto fail_job;
+			}
+			ret =3D v3d_job_add_deps(file_priv, job, in.handle, 0);
+			if (ret)
+				goto fail_job;
+		}
+	} else if (!has_multinsync) {
+		ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
+		if (ret)
+			goto fail_job;
+	}
=20
 	kref_init(&job->refcount);
=20
@@ -500,6 +520,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fil=
e *file_priv,
 					 struct v3d_job *job,
 					 struct ww_acquire_ctx *acquire_ctx,
 					 u32 out_sync,
+					 struct v3d_submit_ext *se,
 					 struct dma_fence *done_fence)
 {
 	struct drm_syncobj *sync_out;
@@ -514,6 +535,18 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fi=
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
@@ -521,11 +554,93 @@ v3d_attach_fences_and_unlock_reservation(struct drm_f=
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
@@ -541,7 +656,12 @@ v3d_get_extensions(struct drm_file *file_priv,
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
@@ -572,6 +692,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_bin_job *bin =3D NULL;
 	struct v3d_render_job *render;
 	struct v3d_job *clean_job =3D NULL;
@@ -589,7 +710,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv,
+		ret =3D v3d_get_extensions(file_priv, &se,
 					 args->extension_count,
 					 args->extensions);
 		if (ret) {
@@ -599,33 +720,35 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
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
-			   v3d_render_job_free, args->in_sync_rcl, V3D_RENDER);
+	ret =3D v3d_job_init(v3d, file_priv, &render->base, v3d_render_job_free,
+			   args->in_sync_rcl, &se, V3D_RENDER);
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
 		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
-				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
+				   v3d_job_free, args->in_sync_bcl, &se, V3D_BIN);
 		if (ret) {
-			v3d_job_put(&render->base);
 			kfree(bin);
-			return ret;
+			goto fail;
 		}
=20
 		bin->start =3D args->bcl_start;
@@ -643,7 +766,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 			goto fail;
 		}
=20
-		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CAC=
HE_CLEAN);
+		ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, 0, V3D_=
CACHE_CLEAN);
 		if (ret) {
 			kfree(clean_job);
 			clean_job =3D NULL;
@@ -706,6 +829,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 						 last_job,
 						 &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 last_job->done_fence);
=20
 	if (bin)
@@ -721,11 +845,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
 	drm_gem_unlock_reservations(last_job->bo,
 				    last_job->bo_count, &acquire_ctx);
 fail:
-	if (bin)
-		v3d_job_cleanup(&bin->base);
+	v3d_job_cleanup(&bin->base);
 	v3d_job_cleanup(&render->base);
-	if (clean_job)
-		v3d_job_cleanup(clean_job);
+	v3d_job_cleanup(clean_job);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
@@ -745,6 +868,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct drm_v3d_submit_tfu *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_tfu_job *job;
 	struct ww_acquire_ctx acquire_ctx;
 	int ret =3D 0;
@@ -757,7 +881,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv,
+		ret =3D v3d_get_extensions(file_priv, &se,
 					 args->extension_count,
 					 args->extensions);
 		if (ret) {
@@ -767,21 +891,24 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *da=
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
-			   v3d_job_free, args->in_sync, V3D_TFU);
+			   v3d_job_free, args->in_sync, &se, V3D_TFU);
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
@@ -821,6 +948,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 &job->base, &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 job->base.done_fence);
=20
 	v3d_job_put(&job->base);
@@ -829,6 +957,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
=20
 fail:
 	v3d_job_cleanup(&job->base);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
@@ -849,8 +978,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
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
@@ -867,7 +997,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv,
+		ret =3D v3d_get_extensions(file_priv, &se,
 					 args->extension_count,
 					 args->extensions);
 		if (ret) {
@@ -877,28 +1007,29 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *d=
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
 	ret =3D v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync, V3D_CSD);
+			   v3d_job_free, args->in_sync, &se, V3D_CSD);
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
-	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACH=
E_CLEAN);
+	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, 0, V3D_C=
ACHE_CLEAN);
 	if (ret) {
-		v3d_job_put(&job->base);
 		kfree(clean_job);
-		return ret;
+		goto fail;
 	}
=20
 	job->args =3D *args;
@@ -936,6 +1067,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 						 clean_job,
 						 &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 clean_job->done_fence);
=20
 	v3d_job_put(&job->base);
@@ -950,6 +1082,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 fail:
 	v3d_job_cleanup(&job->base);
 	v3d_job_cleanup(clean_job);
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


--tf7iv5v2qaysrtyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEdSh0ACgkQwqF3j0dL
ehw0fQ//ctArHphgrQK+eYh7s6hrfLPZGW2Q0E9YI3XkNjrmL5fQ3T4y+192tlwD
Kki29HoAA2n5+VERlhGYQAlbKux0qFDC5/7BMPcA9acub1vPRSNoFve8HSCWhsct
yygshHx5NK9frCQx+0plFamNlhmEf5IPS1RQqK++h1p/HRt64uh0FTHzpXjh+MV6
ew9qpI+m3B26JVbC9mMFlSjJ1pW63JCkLVQDEgGi1dYGs85ThQ1mF4IVYd5S7830
wpWXCD3OYU1qRIQ3V6JDPPuAXuSq4/3tAsTIXZchAft7l0C5En0jFPfMeiaATUF8
wXj+xjXgYBGnyZREXSqJHaMVIji/U2LV3yIA6JC9Z9XHjZMCan3RtVbSfIb3tPWy
Yo04tqjDAxgoml+dsGairkZnLoX+I6hg+1WQvPgiJ+n1YFxNvUZ1fp7y5XcdxGYA
vjb+Um5JViBfjt8JRHvJ6rHz2r0RXyEQSLtXcxn2jkH1GvxX1JUC0Q/gMdRo6MfW
VHRoN+oyREYeJ1lR/igYxlcvIk1TYKfypofpczVmsVT+12L6BpMtJMUcGZxnKeZK
02wUM9H3VFOzzcSx1EyGZSA9UQflc3bioxxQb1LEYVNA+Rix7bA8H/SFAsjEff+p
EM2rW7FfoHn+q+/00wY4y/EFrJOC2kmCWJQ7s84Z3Y5UjugZ3xU=
=lgxl
-----END PGP SIGNATURE-----

--tf7iv5v2qaysrtyn--
