Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197A791C2A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 19:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B89410E3C3;
	Mon,  4 Sep 2023 17:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCEA10E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rFF2cvRQpWk4qr6kCxWTLND/sRV4ctfuwxD55Rzr4zY=; b=VSA6mfkojkYw0GE+kZPckuUJOG
 SqdLiZKMjKP3CAyz4QXfu8CT2JXCR/Bk4dVGG+7AedOZpt6mTEo4f83D3/CMtevTqLuKJsni153aX
 b/3i1fENZ7eo/IkpsOddJK+NvsAHg2NWZtEHwx9XioHTTE1Bw9evgNRCB1YGoQ3A1udL8GreBWwHG
 Utvs1NLVOQzSH/FJgfXi5mbVoi/iGNBdlqULorCksVA+Mg1TSLsodQpbyFjMPWSHOOYwyQvnupeZK
 s5BLr5fqFsQAu3Hx0YdPf/kcGeSrZtrWPA+aqfyeDpciP3QO1NFaT82JNeav8WccCkrAOFZ9Gjh2w
 t9fZKQYg==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdDjQ-0028nB-Ln; Mon, 04 Sep 2023 19:51:25 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/17] drm/v3d: Add a CPU job submission
Date: Mon,  4 Sep 2023 14:38:55 -0300
Message-ID: <20230904175019.1172713-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904175019.1172713-1-mcanal@igalia.com>
References: <20230904175019.1172713-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

Create a new type of job, a CPU job. A CPU job is a type of job that
performs operations that requires CPU intervention. The overall idea is
to use user extensions to enable different types of CPU job, allowing the
CPU job to perform different operations according to the type of user
externsion. The user extension ID identify the type of CPU job that must
be dealt.

Having a CPU job is interesting for synchronization purposes as a CPU
job has a queue like any other V3D job and can be synchoronized by the
multisync extension.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c    |  4 ++
 drivers/gpu/drm/v3d/v3d_drv.h    | 13 +++++-
 drivers/gpu/drm/v3d/v3d_sched.c  | 40 ++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 79 ++++++++++++++++++++++++++++++++
 include/uapi/drm/v3d_drm.h       | 17 +++++++
 5 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index ffbbe9d527d3..6f6ef5af2bd0 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -90,6 +90,9 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 	case DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT:
 		args->value = 1;
 		return 0;
+	case DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE:
+		args->value = 1;
+		return 0;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", args->param);
 		return -EINVAL;
@@ -156,6 +159,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_CREATE, v3d_perfmon_create_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_DESTROY, v3d_perfmon_destroy_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDER_ALLOW | DRM_AUTH),
 };
 
 static const struct drm_driver v3d_drm_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 722a627e0a6e..2a3f3beb272c 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -19,7 +19,7 @@ struct reset_control;
 
 #define GMP_GRANULARITY (128 * 1024)
 
-#define V3D_MAX_QUEUES (V3D_CACHE_CLEAN + 1)
+#define V3D_MAX_QUEUES (V3D_CPU + 1)
 
 struct v3d_queue_state {
 	struct drm_gpu_scheduler sched;
@@ -106,6 +106,7 @@ struct v3d_dev {
 	struct v3d_render_job *render_job;
 	struct v3d_tfu_job *tfu_job;
 	struct v3d_csd_job *csd_job;
+	struct v3d_cpu_job *cpu_job;
 
 	struct v3d_queue_state queue[V3D_MAX_QUEUES];
 
@@ -285,6 +286,14 @@ struct v3d_csd_job {
 	struct drm_v3d_submit_csd args;
 };
 
+enum v3d_cpu_job_type {};
+
+struct v3d_cpu_job {
+	struct v3d_job base;
+
+	enum v3d_cpu_job_type job_type;
+};
+
 struct v3d_submit_outsync {
 	struct drm_syncobj *syncobj;
 };
@@ -387,6 +396,8 @@ int v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv);
 int v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv);
+int v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
 
 /* v3d_irq.c */
 int v3d_irq_init(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5c..88c483da360c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -54,6 +54,12 @@ to_csd_job(struct drm_sched_job *sched_job)
 	return container_of(sched_job, struct v3d_csd_job, base.base);
 }
 
+static struct v3d_cpu_job *
+to_cpu_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct v3d_cpu_job, base.base);
+}
+
 static void
 v3d_sched_job_free(struct drm_sched_job *sched_job)
 {
@@ -241,6 +247,26 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	return fence;
 }
 
+static struct dma_fence *
+v3d_cpu_job_run(struct drm_sched_job *sched_job)
+{
+	struct v3d_cpu_job *job = to_cpu_job(sched_job);
+	struct v3d_dev *v3d = job->base.v3d;
+
+	void (*v3d_cpu_job_fn[])(struct v3d_cpu_job *job) = { };
+
+	v3d->cpu_job = job;
+
+	if (job->job_type >= ARRAY_SIZE(v3d_cpu_job_fn)) {
+		DRM_DEBUG_DRIVER("Unknown CPU job: %d\n", job->job_type);
+		return NULL;
+	}
+
+	v3d_cpu_job_fn[job->job_type](job);
+
+	return NULL;
+}
+
 static struct dma_fence *
 v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 {
@@ -379,6 +405,12 @@ static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
 	.free_job = v3d_sched_job_free
 };
 
+static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
+	.run_job = v3d_cpu_job_run,
+	.timedout_job = v3d_generic_job_timedout,
+	.free_job = v3d_sched_job_free
+};
+
 int
 v3d_sched_init(struct v3d_dev *v3d)
 {
@@ -429,6 +461,14 @@ v3d_sched_init(struct v3d_dev *v3d)
 			goto fail;
 	}
 
+	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
+			     &v3d_cpu_sched_ops,
+			     1, job_hang_limit,
+			     msecs_to_jiffies(hang_limit_ms), NULL,
+			     NULL, "v3d_cpu", v3d->drm.dev);
+	if (ret)
+		goto fail;
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index dff4525e6fde..40880b758071 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -760,3 +760,82 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+/**
+ * v3d_submit_cpu_ioctl() - Submits a CPU job to the V3D.
+ * @dev: DRM device
+ * @data: ioctl argument
+ * @file_priv: DRM file for this fd
+ *
+ * Userspace specifies the CPU job type and data required to perform its
+ * operations through the drm_v3d_extension struct.
+ */
+int
+v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
+		     struct drm_file *file_priv)
+{
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+	struct drm_v3d_submit_cpu *args = data;
+	struct v3d_submit_ext se = {0};
+	struct v3d_cpu_job *cpu_job = NULL;
+	struct ww_acquire_ctx acquire_ctx;
+	int ret;
+
+	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
+		DRM_INFO("invalid flags: %d\n", args->flags);
+		return -EINVAL;
+	}
+
+	ret = v3d_job_allocate((void *)&cpu_job, sizeof(*cpu_job));
+	if (ret)
+		return ret;
+
+	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
+		ret = v3d_get_extensions(file_priv, args->extensions, &se);
+		if (ret) {
+			DRM_DEBUG("Failed to get extensions.\n");
+			goto fail;
+		}
+	}
+
+	/* Every CPU job must have a CPU job user extension */
+	if (!cpu_job->job_type) {
+		DRM_DEBUG("CPU job must have a CPU job user extension.\n");
+		goto fail;
+	}
+
+	ret = v3d_job_init(v3d, file_priv, (void *)&cpu_job, sizeof(*cpu_job),
+			   v3d_job_free, 0, &se, V3D_CPU);
+	if (ret)
+		goto fail;
+
+	if (args->bo_handle_count) {
+		ret = v3d_lookup_bos(dev, file_priv, &cpu_job->base,
+				     args->bo_handles, args->bo_handle_count);
+		if (ret)
+			goto fail;
+
+		ret = v3d_lock_bo_reservations(&cpu_job->base, &acquire_ctx);
+		if (ret)
+			goto fail;
+	}
+
+	mutex_lock(&v3d->sched_lock);
+	v3d_push_job(&cpu_job->base);
+	mutex_unlock(&v3d->sched_lock);
+
+	v3d_attach_fences_and_unlock_reservation(file_priv,
+						 &cpu_job->base,
+						 &acquire_ctx, 0,
+						 NULL, cpu_job->base.done_fence);
+
+	v3d_job_put((void *)cpu_job);
+
+	return 0;
+
+fail:
+	v3d_job_cleanup((void *)cpu_job);
+	v3d_put_multisync_post_deps(&se);
+
+	return ret;
+}
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 3dfc0af8756a..d63044ebd5e0 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -41,6 +41,7 @@ extern "C" {
 #define DRM_V3D_PERFMON_CREATE                    0x08
 #define DRM_V3D_PERFMON_DESTROY                   0x09
 #define DRM_V3D_PERFMON_GET_VALUES                0x0a
+#define DRM_V3D_SUBMIT_CPU                        0x0b
 
 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -56,6 +57,7 @@ extern "C" {
 						   struct drm_v3d_perfmon_destroy)
 #define DRM_IOCTL_V3D_PERFMON_GET_VALUES  DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_VALUES, \
 						   struct drm_v3d_perfmon_get_values)
+#define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION		  0x02
@@ -93,6 +95,7 @@ enum v3d_queue {
 	V3D_TFU,
 	V3D_CSD,
 	V3D_CACHE_CLEAN,
+	V3D_CPU,
 };
 
 /**
@@ -276,6 +279,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
 	DRM_V3D_PARAM_SUPPORTS_PERFMON,
 	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
+	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
 };
 
 struct drm_v3d_get_param {
@@ -356,6 +360,19 @@ struct drm_v3d_submit_csd {
 	__u32 pad;
 };
 
+struct drm_v3d_submit_cpu {
+	/* Pointer to a u32 array of the BOs that are referenced by the job. */
+	__u64 bo_handles;
+
+	/* Number of BO handles passed in (size is that times 4). */
+	__u32 bo_handle_count;
+
+	__u32 flags;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
+};
+
 enum {
 	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
 	V3D_PERFCNT_FEP_VALID_PRIMS,
-- 
2.41.0

