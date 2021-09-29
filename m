Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECE41C1E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE81A6EA1A;
	Wed, 29 Sep 2021 09:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1906EA1A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=9w6BxHxatv1rOIz0Hq1tHrHZ1FC6Vmc5/lUCi7UqbZM=; 
 b=b6fvu0h2Tps4YrSMKvhe0I10Ee+aWsFG9Ccw6QtErX57WSC/jb7bK9VTpYIsU9P2lOiFTXgxIdwd8IWt+ZuKFEBhdVyGVQP8oLDSeVZYNrxW3VXuCFzG+ELBevl98RW4WDfWzj1jSfPBkIAC1RX/9JVmsY7bctQNZL9bxLA/E38GDaG/uFLD0hVMe8jhoQkI51zivkn40KLs9SWAarw84iJDWBHYmYdFqSEy8WXVJ6p9ZK1kVIoOpQoCYH79BjD45oZNdNPiEEZ2PH+FGaPgUv2aGhhgycjesPp91ISsNFZSuy9s9jfaiA/vsy6PrZmu5jYsm8gduJy4zpI/Fo8H/w==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVWAA-0005uO-Rb; Wed, 29 Sep 2021 11:46:07 +0200
Date: Wed, 29 Sep 2021 10:45:54 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v2 4/4] drm/v3d: add multiple syncobjs support
Message-ID: <ccd80c606778172e9adb8e77435740c8ad310b1a.1632905676.git.mwen@igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vwixumgcsy6gcldy"
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


--vwixumgcsy6gcldy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Using the generic extension from the previous patch, a specific multisync
extension enables more than one in/out binary syncobj per job submission.
Arrays of syncobjs are set in struct drm_v3d_multisync, that also cares
of determining the stage for sync (wait deps) according to the job
queue.

v2:
- subclass the generic extension struct (Daniel)
- simplify adding dependency conditions to make understandable (Iago)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c |   6 +-
 drivers/gpu/drm/v3d/v3d_drv.h |  23 +++--
 drivers/gpu/drm/v3d/v3d_gem.c | 176 ++++++++++++++++++++++++++++++----
 include/uapi/drm/v3d_drm.h    |  49 +++++++++-
 4 files changed, 224 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 3d6b9bcce2f7..bd46396a1ae0 100644
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
@@ -135,9 +138,8 @@ v3d_postclose(struct drm_device *dev, struct drm_file *=
file)
 	struct v3d_file_priv *v3d_priv =3D file->driver_priv;
 	enum v3d_queue q;
=20
-	for (q =3D 0; q < V3D_MAX_QUEUES; q++) {
+	for (q =3D 0; q < V3D_MAX_QUEUES; q++)
 		drm_sched_entity_destroy(&v3d_priv->sched_entity[q]);
-	}
=20
 	v3d_perfmon_close_file(v3d_priv);
 	kfree(v3d_priv);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index b900a050d5e2..b14ff1e96f49 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -19,15 +19,6 @@ struct reset_control;
=20
 #define GMP_GRANULARITY (128 * 1024)
=20
-/* Enum for each of the V3D queues. */
-enum v3d_queue {
-	V3D_BIN,
-	V3D_RENDER,
-	V3D_TFU,
-	V3D_CSD,
-	V3D_CACHE_CLEAN,
-};
-
 #define V3D_MAX_QUEUES (V3D_CACHE_CLEAN + 1)
=20
 struct v3d_queue_state {
@@ -294,6 +285,20 @@ struct v3d_csd_job {
 	struct drm_v3d_submit_csd args;
 };
=20
+struct v3d_submit_outsync {
+	struct drm_syncobj *syncobj;
+};
+
+struct v3d_submit_ext {
+	u32 wait_stage;
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
index b912419027f7..e92998d39eaa 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -454,11 +454,12 @@ v3d_job_add_deps(struct drm_file *file_priv, struct v=
3d_job *job,
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     void **container, size_t size, void (*free)(struct kref *ref),
-	     u32 in_sync, enum v3d_queue queue)
+	     u32 in_sync, struct v3d_submit_ext *se, enum v3d_queue queue)
 {
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct v3d_job *job;
-	int ret;
+	bool has_multisync =3D (se && se->in_sync_count);
+	int ret, i;
=20
 	*container =3D kcalloc(1, size, GFP_KERNEL);
 	if (!*container) {
@@ -479,9 +480,28 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fil=
e_priv,
 	if (ret)
 		goto fail;
=20
-	ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
-	if (ret)
-		goto fail_job;
+	if (has_multisync) {
+		if (se->wait_stage =3D=3D queue) {
+			struct drm_v3d_sem __user *handle =3D u64_to_user_ptr(se->in_syncs);
+
+			for (i =3D 0; i < se->in_sync_count; i++) {
+				struct drm_v3d_sem in;
+
+				ret =3D copy_from_user(&in, handle++, sizeof(in));
+				if (ret) {
+					DRM_DEBUG("Failed to copy wait dep handle.\n");
+					goto fail_job;
+				}
+				ret =3D v3d_job_add_deps(file_priv, job, in.handle, 0);
+				if (ret)
+					goto fail_job;
+			}
+		}
+	} else {
+		ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
+		if (ret)
+			goto fail_job;
+	}
=20
 	kref_init(&job->refcount);
=20
@@ -514,6 +534,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fil=
e *file_priv,
 					 struct v3d_job *job,
 					 struct ww_acquire_ctx *acquire_ctx,
 					 u32 out_sync,
+					 struct v3d_submit_ext *se,
 					 struct dma_fence *done_fence)
 {
 	struct drm_syncobj *sync_out;
@@ -528,6 +549,18 @@ v3d_attach_fences_and_unlock_reservation(struct drm_fi=
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
@@ -535,13 +568,107 @@ v3d_attach_fences_and_unlock_reservation(struct drm_=
file *file_priv,
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
 static int
-v3d_get_extensions(struct drm_file *file_priv, u64 ext_handles)
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
+/* Get data for multiple binary semaphores synchronization. Parse syncobj
+ * to be signaled when job completes (out_sync).
+ */
+static int
+v3d_get_multisync_submit_deps(struct drm_file *file_priv,
+			      struct drm_v3d_extension __user *ext,
+			      void *data)
+{
+	struct drm_v3d_multi_sync multisync;
+	struct v3d_submit_ext *se =3D data;
+	int ret;
+
+	ret =3D copy_from_user(&multisync, ext, sizeof(multisync));
+	if (ret)
+		return ret;
+
+	if (multisync.pad)
+		return -EINVAL;
+
+	ret =3D v3d_get_multisync_post_deps(file_priv, data, multisync.out_sync_c=
ount,
+					  multisync.out_syncs);
+	if (ret)
+		return ret;
+
+	se->in_sync_count =3D multisync.in_sync_count;
+	se->in_syncs =3D multisync.in_syncs;
+
+	se->wait_stage =3D multisync.wait_stage;
+
+	return 0;
+}
+
+/* Whenever userspace sets ioctl extensions, parses data according to the
+ * extension id (name). By now, generic ioctl extensions is only used to
+ * support multiple binary semaphores (struct drm_v3d_multi_sync).
+ */
+static int
+v3d_get_extensions(struct drm_file *file_priv,
+		   u64 ext_handles,
+		   void *data)
 {
 	struct drm_v3d_extension __user *user_ext;
+	int ret;
=20
 	user_ext =3D u64_to_user_ptr(ext_handles);
-	while(user_ext) {
+	while (user_ext) {
 		struct drm_v3d_extension ext;
=20
 		if (copy_from_user(&ext, user_ext, sizeof(ext))) {
@@ -550,7 +677,11 @@ v3d_get_extensions(struct drm_file *file_priv, u64 ext=
_handles)
 		}
=20
 		switch (ext.id) {
-		case 0:
+		case DRM_V3D_EXT_ID_MULTI_SYNC:
+			ret =3D v3d_get_multisync_submit_deps(file_priv, user_ext, data);
+			if (ret)
+				return ret;
+			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);
 			return -EINVAL;
@@ -581,6 +712,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
 	struct drm_v3d_submit_cl *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_bin_job *bin =3D NULL;
 	struct v3d_render_job *render;
 	struct v3d_job *clean_job =3D NULL;
@@ -601,7 +733,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv, args->extensions);
+		ret =3D v3d_get_extensions(file_priv, args->extensions, &se);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			return ret;
@@ -609,7 +741,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&render, sizeof(*render),
-			   v3d_render_job_free, args->in_sync_bcl, V3D_RENDER);
+			   v3d_render_job_free, args->in_sync_bcl, &se, V3D_RENDER);
 	if (ret)
 		goto fail;
=20
@@ -619,7 +751,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
=20
 	if (args->bcl_start !=3D args->bcl_end) {
 		ret =3D v3d_job_init(v3d, file_priv, (void *)&bin, sizeof(*bin),
-				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
+				   v3d_job_free, args->in_sync_bcl, &se, V3D_BIN);
 		if (ret)
 			goto fail;
=20
@@ -633,7 +765,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
=20
 	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
 		ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_j=
ob),
-				   v3d_job_free, 0, V3D_CACHE_CLEAN);
+				   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
 		if (ret)
 			goto fail;
=20
@@ -693,6 +825,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 						 last_job,
 						 &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 last_job->done_fence);
=20
 	if (bin)
@@ -711,6 +844,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	v3d_job_cleanup((void *)bin);
 	v3d_job_cleanup((void *)render);
 	v3d_job_cleanup(clean_job);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
@@ -730,6 +864,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_dev *v3d =3D to_v3d_dev(dev);
 	struct drm_v3d_submit_tfu *args =3D data;
+	struct v3d_submit_ext se =3D {0};
 	struct v3d_tfu_job *job;
 	struct ww_acquire_ctx acquire_ctx;
 	int ret =3D 0;
@@ -742,7 +877,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv, args->extensions);
+		ret =3D v3d_get_extensions(file_priv, args->extensions, &se);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			return ret;
@@ -750,7 +885,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
-			   v3d_job_free, args->in_sync, V3D_TFU);
+			   v3d_job_free, args->in_sync, &se, V3D_TFU);
 	if (ret)
 		goto fail;
=20
@@ -798,6 +933,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 &job->base, &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 job->base.done_fence);
=20
 	v3d_job_put(&job->base);
@@ -806,6 +942,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
=20
 fail:
 	v3d_job_cleanup((void *)job);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
@@ -826,8 +963,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
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
@@ -847,7 +985,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	}
=20
 	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
-		ret =3D v3d_get_extensions(file_priv, args->extensions);
+		ret =3D v3d_get_extensions(file_priv, args->extensions, &se);
 		if (ret) {
 			DRM_DEBUG("Failed to get extensions.\n");
 			return ret;
@@ -855,12 +993,12 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
 	}
=20
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
-			   v3d_job_free, args->in_sync, V3D_CSD);
+			   v3d_job_free, args->in_sync, &se, V3D_CSD);
 	if (ret)
 		goto fail;
=20
 	ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_jo=
b),
-			   v3d_job_free, 0, V3D_CACHE_CLEAN);
+			   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
 	if (ret)
 		goto fail;
=20
@@ -899,6 +1037,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 						 clean_job,
 						 &acquire_ctx,
 						 args->out_sync,
+						 &se,
 						 clean_job->done_fence);
=20
 	v3d_job_put(&job->base);
@@ -913,6 +1052,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *dat=
a,
 fail:
 	v3d_job_cleanup((void *)job);
 	v3d_job_cleanup(clean_job);
+	v3d_put_multisync_post_deps(&se);
=20
 	return ret;
 }
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 55b443ca6c0b..3dfc0af8756a 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -73,6 +73,53 @@ struct drm_v3d_extension {
 	__u32 flags; /* mbz */
 };
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
+/* Enum for each of the V3D queues. */
+enum v3d_queue {
+	V3D_BIN,
+	V3D_RENDER,
+	V3D_TFU,
+	V3D_CSD,
+	V3D_CACHE_CLEAN,
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
+	struct drm_v3d_extension base;
+	/* Array of wait and signal semaphores */
+	__u64 in_syncs;
+	__u64 out_syncs;
+
+	/* Number of entries */
+	__u32 in_sync_count;
+	__u32 out_sync_count;
+
+	/* set the stage (v3d_queue) to sync */
+	__u32 wait_stage;
+
+	__u32 pad; /* mbz */
+};
+
 /**
  * struct drm_v3d_submit_cl - ioctl argument for submitting commands to th=
e 3D
  * engine.
@@ -228,6 +275,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_CSD,
 	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
 	DRM_V3D_PARAM_SUPPORTS_PERFMON,
+	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
 };
=20
 struct drm_v3d_get_param {
@@ -271,7 +319,6 @@ struct drm_v3d_submit_tfu {
=20
 	/* Pointer to an array of ioctl extensions*/
 	__u64 extensions;
-
 };
=20
 /* Submits a compute shader for dispatch.  This job will block on any
--=20
2.30.2


--vwixumgcsy6gcldy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFUNdEACgkQwqF3j0dL
ehyyWQ/+MkijYvcaPN6pKxy3aeMg9ByzeVj36A/cb5yKli3XgG+LrYKWQo7QkWpr
Huh1tHdNU5CXwvOs4K4ui4FppLPi2shim2kXVhnc9jxDBdIq4Jdc+F2iax/K6kuX
8W5INRVBZG1mHfC2A0rW7SBusfCPPhtJNraNyfbD8+wSx/gMNlqbxr7+INR0Bf/3
obNxgCIeFIGvq7mqnCZ0uh7Jlzb2qY2QLD+qsNWC0fa5daFSsHBDZyMFCIaIoFlB
polHFjgglwcEJ8GOCSterW9GSC1XQ/YX89JmFxADsZsPrck/zSmGcT9F2Fn/Q4LO
dWWkadBbAGFb+N8Vb93Bkb7B/HoHbqX+B1A0SiTY2tB62gmC2q6QdPMYMpVeN4iU
UPUu7sNTQ+Y+FaT83qizY9xNSIultXshRwMMo/Cp8rjXaHzOcwRWQ1n/kXIXEoc5
h5wvmfonzBuKBQ+6v9gBwNAM0ajT0J1aZsBRweJ5tCzyZpyEU3mvTGrWek0Kf6zN
sZUJvJ5rMFxhozm345eFGWzJU5SGxjrWc3XGlSbMEFVpfX4H6rs99h1XF2h45enp
3ptnwPj4jJkBskPggvTFbrY1uS3HXCuAfOyroQoFZpcuwws8q4of/IlcrsHm2HQZ
Ys6i4lpuxeib+JpFM7rAIjjn0l/8n0TkL84M21TKCNI1NpFnABg=
=Q8OU
-----END PGP SIGNATURE-----

--vwixumgcsy6gcldy--
