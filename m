Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E8B391C0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 04:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E88810E927;
	Thu, 28 Aug 2025 02:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="gRjjmCkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74910E926
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 02:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756348515; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=frfonRDKjHxF2d5+puFPDHQIHhd9SHsxv9/HNMszjlMgvASKHnIa4fK4DWxQ6Vrg9abYXxN2mDnGnB5lgY1QWJ27rmRv8610mlM9p0na+25Jk5dpLkSJwmk/cy7Cp77BX9FGju+qRu5TazqXFHRDYZS6vfL26+/nFM7D5DhdrAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756348515;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+9kWUKIpvaTwL3YgLr5LNgQOSIHL67kPC1I5p1eDb84=; 
 b=oICcBHtRGylpKJzSrg1twT1iYm0dYPsjE0mceq7jDiv00xF1E/cc01vaVDExdhGHmpC9EDmb3WNzO8BbDxF/g9FFHnjWf1PKucr6rWkoVFDbW4xI12dE+tZqxGg8LZ+XUseESM9bVqq5PzkUuy30phc+XUQc1M4jGt5uKCDbloU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756348515; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=+9kWUKIpvaTwL3YgLr5LNgQOSIHL67kPC1I5p1eDb84=;
 b=gRjjmCkruFP6GlCF/v96+dmCiBDtUPbkYm8FxURRYQnHqmfAtDNDWnmNjcthPLnv
 p40xv7e4eJnP+rac4xQ6/n6YRCIzAFdZSRzPjGudYYWu3kG7lpvvzLioXJYr0LH1oyl
 BuiQaDEfXkv2TcBtWbEXO9/Mxe2zuprNEd9sHN7s=
Received: by mx.zohomail.com with SMTPS id 1756348512626816.9721835035102;
 Wed, 27 Aug 2025 19:35:12 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 3/5] drm/panfrost: Introduce JM context for manging job
 resources
Date: Thu, 28 Aug 2025 03:34:06 +0100
Message-ID: <20250828023422.2404784-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
References: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Boris Brezillon <boris.brezillon@collabora.com>

A context described the affinity properties of a job, like the mask of
L2 caches, shader cores and tiler units a job can use, and its priority
within its job slot. Every context must define these properties for the
job slots in the hardware.

Until context creation and destruction and attaching a context ID to
a job submission are exposed to UM, all jobs shall be bound to the
default Panfrost file context, which has medium priorities and lets
a job use any of the above resources.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  19 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 270 +++++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_job.h    |  27 ++-
 4 files changed, 262 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 077525a3ad68..5b164871eb95 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -15,6 +15,7 @@
 #include <drm/gpu_scheduler.h>
 
 #include "panfrost_devfreq.h"
+#include "panfrost_job.h"
 
 struct panfrost_device;
 struct panfrost_mmu;
@@ -22,7 +23,6 @@ struct panfrost_job_slot;
 struct panfrost_job;
 struct panfrost_perfcnt;
 
-#define NUM_JOB_SLOTS 3
 #define MAX_PM_DOMAINS 5
 
 enum panfrost_drv_comp_bits {
@@ -206,7 +206,7 @@ struct panfrost_engine_usage {
 struct panfrost_file_priv {
 	struct panfrost_device *pfdev;
 
-	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
+	struct xarray jm_ctxs;
 
 	struct panfrost_mmu *mmu;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1ea6c509a5d5..398c067457d9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -279,6 +279,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	struct panfrost_file_priv *file_priv = file->driver_priv;
 	struct drm_panfrost_submit *args = data;
 	struct drm_syncobj *sync_out = NULL;
+	struct panfrost_jm_ctx *jm_ctx;
 	struct panfrost_job *job;
 	int ret = 0, slot;
 
@@ -294,10 +295,17 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 			return -ENODEV;
 	}
 
+	/* TODO: Use the default JM context until ctx management IOCTLs are exposed */
+	jm_ctx = panfrost_jm_ctx_from_handle(file, 0);
+	if (!jm_ctx) {
+		ret = -EINVAL;
+		goto out_put_syncout;
+	}
+
 	job = kzalloc(sizeof(*job), GFP_KERNEL);
 	if (!job) {
 		ret = -ENOMEM;
-		goto out_put_syncout;
+		goto out_put_jm_ctx;
 	}
 
 	kref_init(&job->refcount);
@@ -307,12 +315,13 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
 	job->mmu = file_priv->mmu;
+	job->ctx = panfrost_jm_ctx_get(jm_ctx);
 	job->engine_usage = &file_priv->engine_usage;
 
 	slot = panfrost_job_get_slot(job);
 
 	ret = drm_sched_job_init(&job->base,
-				 &file_priv->sched_entity[slot],
+				 &jm_ctx->slots[slot].sched_entity,
 				 1, NULL, file->client_id);
 	if (ret)
 		goto out_put_job;
@@ -338,6 +347,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 		drm_sched_job_cleanup(&job->base);
 out_put_job:
 	panfrost_job_put(job);
+out_put_jm_ctx:
+	panfrost_jm_ctx_put(jm_ctx);
 out_put_syncout:
 	if (sync_out)
 		drm_syncobj_put(sync_out);
@@ -564,7 +575,7 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
 		goto err_free;
 	}
 
-	ret = panfrost_job_open(panfrost_priv);
+	ret = panfrost_job_open(file);
 	if (ret)
 		goto err_job;
 
@@ -583,7 +594,7 @@ panfrost_postclose(struct drm_device *dev, struct drm_file *file)
 	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
 
 	panfrost_perfcnt_close(file);
-	panfrost_job_close(panfrost_priv);
+	panfrost_job_close(file);
 
 	panfrost_mmu_ctx_put(panfrost_priv->mmu);
 	kfree(panfrost_priv);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 82acabb21b27..571bd75d5b40 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-resv.h>
+#include <drm/drm_auth.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/panfrost_drm.h>
 
@@ -22,6 +23,7 @@
 #include "panfrost_mmu.h"
 #include "panfrost_dump.h"
 
+#define MAX_JM_CTX_PER_FILE 128
 #define JOB_TIMEOUT_MS 500
 
 #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
@@ -125,23 +127,6 @@ int panfrost_job_get_slot(struct panfrost_job *job)
 	return 1;
 }
 
-static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
-					u32 requirements,
-					int js)
-{
-	u64 affinity;
-
-	/*
-	 * Use all cores for now.
-	 * Eventually we may need to support tiler only jobs and h/w with
-	 * multiple (2) coherent core groups
-	 */
-	affinity = pfdev->features.shader_present;
-
-	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(affinity));
-	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(affinity));
-}
-
 static u32
 panfrost_get_job_chain_flag(const struct panfrost_job *job)
 {
@@ -198,6 +183,7 @@ panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
 static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 {
 	struct panfrost_device *pfdev = job->pfdev;
+	struct panfrost_js_ctx *js_ctx = &job->ctx->slots[js];
 	unsigned int subslot;
 	u32 cfg;
 	u64 jc_head = job->jc;
@@ -218,11 +204,15 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
 	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
 
-	panfrost_job_write_affinity(pfdev, job->requirements, js);
+	job_write(pfdev, JS_AFFINITY_NEXT_LO(js), lower_32_bits(js_ctx->affinity));
+	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), upper_32_bits(js_ctx->affinity));
+
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_XAFFINITY))
+		job_write(pfdev, JS_XAFFINITY_NEXT(js), js_ctx->xaffinity);
 
 	/* start MMU, medium priority, cache clean/flush on end, clean/flush on
 	 * start */
-	cfg |= JS_CONFIG_THREAD_PRI(8) |
+	cfg |= js_ctx->config |
 		JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
 		JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE |
 		panfrost_get_job_chain_flag(job);
@@ -359,6 +349,7 @@ static void panfrost_job_cleanup(struct kref *ref)
 		kvfree(job->bos);
 	}
 
+	panfrost_jm_ctx_put(job->ctx);
 	kfree(job);
 }
 
@@ -917,39 +908,229 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
 	destroy_workqueue(pfdev->reset.wq);
 }
 
-int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
+int panfrost_job_open(struct drm_file *file)
 {
+	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
 	struct panfrost_device *pfdev = panfrost_priv->pfdev;
+	int ret;
+
+	struct drm_panfrost_jm_ctx_create default_jm_ctx = {
+		/* Fragment queue */
+		.slots[0] = {
+			.flags = PANFROST_JS_FLAG_ENABLED,
+			.priority = PANFROST_JM_CTX_PRIORITY_MEDIUM,
+			.tiler_mask = 0,
+			.l2_mask = pfdev->features.l2_present,
+			.core_mask = pfdev->features.shader_present,
+		},
+		/* Vertex/tiler/compute queue */
+		.slots[1] = {
+			.flags = PANFROST_JS_FLAG_ENABLED,
+			.priority = PANFROST_JM_CTX_PRIORITY_MEDIUM,
+			.tiler_mask = pfdev->features.tiler_present,
+			.l2_mask = pfdev->features.l2_present,
+			.core_mask = pfdev->features.shader_present,
+		},
+	};
+
+	xa_init_flags(&panfrost_priv->jm_ctxs, XA_FLAGS_ALLOC);
+
+	ret = panfrost_jm_ctx_create(file, &default_jm_ctx);
+	if (ret)
+		return ret;
+
+	/* We expect the default context to be assigned handle 0. */
+	if (WARN_ON(default_jm_ctx.handle))
+		return -EINVAL;
+
+	return 0;
+}
+
+void panfrost_job_close(struct drm_file *file)
+{
+	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
+	struct panfrost_jm_ctx *jm_ctx;
+	unsigned long i;
+
+	xa_for_each(&panfrost_priv->jm_ctxs, i, jm_ctx)
+		panfrost_jm_ctx_destroy(file, i);
+
+	xa_destroy(&panfrost_priv->jm_ctxs);
+}
+
+int panfrost_job_is_idle(struct panfrost_device *pfdev)
+{
 	struct panfrost_job_slot *js = pfdev->js;
-	struct drm_gpu_scheduler *sched;
-	int ret, i;
+	int i;
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
-		sched = &js->queue[i].sched;
-		ret = drm_sched_entity_init(&panfrost_priv->sched_entity[i],
-					    DRM_SCHED_PRIORITY_NORMAL, &sched,
-					    1, NULL);
-		if (WARN_ON(ret))
-			return ret;
+		/* If there are any jobs in the HW queue, we're not idle */
+		if (atomic_read(&js->queue[i].sched.credit_count))
+			return false;
+	}
+
+	return true;
+}
+
+static void panfrost_jm_ctx_release(struct kref *kref)
+{
+	struct panfrost_jm_ctx *jm_ctx = container_of(kref, struct panfrost_jm_ctx, refcnt);
+
+	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++)
+		drm_sched_entity_destroy(&jm_ctx->slots[i].sched_entity);
+
+	kfree(jm_ctx);
+}
+
+void
+panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx)
+{
+	if (jm_ctx)
+		kref_put(&jm_ctx->refcnt, panfrost_jm_ctx_release);
+}
+
+struct panfrost_jm_ctx *
+panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx)
+{
+	if (jm_ctx)
+		kref_get(&jm_ctx->refcnt);
+
+	return jm_ctx;
+}
+
+struct panfrost_jm_ctx *
+panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle)
+{
+	struct panfrost_file_priv *priv = file->driver_priv;
+	struct panfrost_jm_ctx *jm_ctx;
+
+	xa_lock(&priv->jm_ctxs);
+	jm_ctx = panfrost_jm_ctx_get(xa_load(&priv->jm_ctxs, handle));
+	xa_unlock(&priv->jm_ctxs);
+
+	return jm_ctx;
+}
+
+static int jm_ctx_prio_to_drm_sched_prio(struct drm_file *file,
+					 enum drm_panfrost_jm_ctx_priority in,
+					 enum drm_sched_priority *out)
+{
+	switch (in) {
+	case PANFROST_JM_CTX_PRIORITY_LOW:
+		*out = DRM_SCHED_PRIORITY_LOW;
+		return 0;
+	case PANFROST_JM_CTX_PRIORITY_MEDIUM:
+		*out = DRM_SCHED_PRIORITY_NORMAL;
+		return 0;
+	case PANFROST_JM_CTX_PRIORITY_HIGH:
+		/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
+		if (!capable(CAP_SYS_NICE) && !drm_is_current_master(file))
+			return -EACCES;
+
+		*out = DRM_SCHED_PRIORITY_HIGH;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+#define PANFROST_JS_VALID_FLAGS PANFROST_JS_FLAG_ENABLED
+
+int panfrost_jm_ctx_create(struct drm_file *file,
+			   struct drm_panfrost_jm_ctx_create *args)
+{
+	struct panfrost_file_priv *priv = file->driver_priv;
+	struct panfrost_device *pfdev = priv->pfdev;
+	struct panfrost_jm_ctx *jm_ctx;
+	int ret;
+
+	if (args->pad != 0)
+		return -EINVAL;
+
+	jm_ctx = kzalloc(sizeof(*jm_ctx), GFP_KERNEL);
+	if (!jm_ctx)
+		return -ENOMEM;
+
+	kref_init(&jm_ctx->refcnt);
+
+	for (u32 i = 0; i < ARRAY_SIZE(args->slots); i++) {
+		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
+		const struct drm_panfrost_js_ctx_info *js_info = &args->slots[i];
+		struct panfrost_js_ctx *js_ctx = &jm_ctx->slots[i];
+		enum drm_sched_priority sched_prio;
+
+		if (js_info->flags & ~PANFROST_JS_VALID_FLAGS)
+			goto err_put_jm_ctx;
+
+		if (!(js_info->flags & PANFROST_JS_FLAG_ENABLED))
+			continue;
+
+		ret = jm_ctx_prio_to_drm_sched_prio(file, js_info->priority, &sched_prio);
+		if (ret)
+			goto err_put_jm_ctx;
+
+		if (js_info->core_mask & ~pfdev->features.shader_present)
+			goto err_put_jm_ctx;
+
+		if (js_info->tiler_mask & ~pfdev->features.tiler_present)
+			goto err_put_jm_ctx;
+
+		if (js_info->l2_mask & ~pfdev->features.l2_present)
+			goto err_put_jm_ctx;
+
+		js_ctx->affinity = js_info->core_mask;
+		js_ctx->config = JS_CONFIG_THREAD_PRI(js_info->priority);
+
+		if (panfrost_has_hw_feature(pfdev, HW_FEATURE_XAFFINITY)) {
+			js_ctx->xaffinity = JS_XAFFINITY_ENABLE |
+					    JS_XAFFINITY_TILER_MASK(js_info->tiler_mask) |
+					    JS_XAFFINITY_L2_MASK(js_info->l2_mask);
+		}
+
+		ret = drm_sched_entity_init(&js_ctx->sched_entity, sched_prio,
+					    &sched, 1, NULL);
+		if (ret)
+			goto err_put_jm_ctx;
+
+		js_ctx->enabled = true;
 	}
+
+	ret = xa_alloc(&priv->jm_ctxs, &args->handle, jm_ctx,
+		       XA_LIMIT(0, MAX_JM_CTX_PER_FILE), GFP_KERNEL);
+	if (ret)
+		goto err_put_jm_ctx;
+
 	return 0;
+
+err_put_jm_ctx:
+	panfrost_jm_ctx_put(jm_ctx);
+	return ret;
 }
 
-void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
+int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
 {
-	struct panfrost_device *pfdev = panfrost_priv->pfdev;
-	int i;
+	struct panfrost_file_priv *priv = file->driver_priv;
+	struct panfrost_device *pfdev = priv->pfdev;
+	struct panfrost_jm_ctx *jm_ctx;
 
-	for (i = 0; i < NUM_JOB_SLOTS; i++)
-		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
+	jm_ctx = xa_erase(&priv->jm_ctxs, handle);
+	if (!jm_ctx)
+		return -EINVAL;
+
+	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
+		if (jm_ctx->slots[i].enabled)
+			drm_sched_entity_destroy(&jm_ctx->slots[i].sched_entity);
+	}
 
 	/* Kill in-flight jobs */
 	spin_lock(&pfdev->js->job_lock);
-	for (i = 0; i < NUM_JOB_SLOTS; i++) {
-		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
-		int j;
+	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
+		struct drm_sched_entity *entity = &jm_ctx->slots[i].sched_entity;
+
+		if (!jm_ctx->slots[i].enabled)
+			continue;
 
-		for (j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
+		for (int j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
 			struct panfrost_job *job = pfdev->jobs[i][j];
 			u32 cmd;
 
@@ -980,18 +1161,7 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 		}
 	}
 	spin_unlock(&pfdev->js->job_lock);
-}
-
-int panfrost_job_is_idle(struct panfrost_device *pfdev)
-{
-	struct panfrost_job_slot *js = pfdev->js;
-	int i;
-
-	for (i = 0; i < NUM_JOB_SLOTS; i++) {
-		/* If there are any jobs in the HW queue, we're not idle */
-		if (atomic_read(&js->queue[i].sched.credit_count))
-			return false;
-	}
 
-	return true;
+	panfrost_jm_ctx_put(jm_ctx);
+	return 0;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index ec581b97852b..caf394e070f4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -18,6 +18,7 @@ struct panfrost_job {
 
 	struct panfrost_device *pfdev;
 	struct panfrost_mmu *mmu;
+	struct panfrost_jm_ctx *ctx;
 
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
@@ -39,10 +40,32 @@ struct panfrost_job {
 	u64 start_cycles;
 };
 
+struct panfrost_js_ctx {
+	struct drm_sched_entity sched_entity;
+	u32 config;
+	u32 xaffinity;
+	u64 affinity;
+	bool enabled;
+};
+
+#define NUM_JOB_SLOTS 3
+
+struct panfrost_jm_ctx {
+	struct kref refcnt;
+	struct panfrost_js_ctx slots[NUM_JOB_SLOTS];
+};
+
+int panfrost_jm_ctx_create(struct drm_file *file,
+			   struct drm_panfrost_jm_ctx_create *args);
+int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle);
+void panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx);
+struct panfrost_jm_ctx *panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx);
+struct panfrost_jm_ctx *panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle);
+
 int panfrost_job_init(struct panfrost_device *pfdev);
 void panfrost_job_fini(struct panfrost_device *pfdev);
-int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
-void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
+int panfrost_job_open(struct drm_file *file);
+void panfrost_job_close(struct drm_file *file);
 int panfrost_job_get_slot(struct panfrost_job *job);
 int panfrost_job_push(struct panfrost_job *job);
 void panfrost_job_put(struct panfrost_job *job);
-- 
2.50.0

