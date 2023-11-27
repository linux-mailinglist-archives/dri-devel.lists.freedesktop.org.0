Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B827FA96B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95E10E3E0;
	Mon, 27 Nov 2023 19:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0444910E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qO0E3068RUMYPupr8AluFHQe2TqeU1l4qAr68BXaEN0=; b=bqRAMMsqYXJaFDjq4uxU5SJhBk
 y1zG9UcB3QFnsOtcbnrp+Pui2jI9Frn8lS8wxWRunjSPaB0ga7o/zqiMmjnGxhYUbvYKy69rbpWPr
 DtZDJI5PMhF+ZL+d9U/20PRqhv3ERoyheej2c86QGSEFD0hNnCpp2nfb8OPuDtBeTzSy6OgKQezZP
 rmIEB4L7Cx/9rN7BcWgjEHXFLMKYj1Usl7JdCRqQjVEIEFAEouHzQxXzUDKHjgBtC4r+CySh8W90q
 rZbKgPITHu9ldzabfxWuUyvku/phi472VXoHrkMQzM9TXBYrOxcgBm6anXlB+1WP4nHvy8FJYi6Au
 F07OEjfw==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7gpk-007jiM-NB; Mon, 27 Nov 2023 19:59:53 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/17] drm/v3d: Decouple job allocation from job initiation
Date: Mon, 27 Nov 2023 15:48:24 -0300
Message-ID: <20231127185723.10348-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127185723.10348-2-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to allow the IOCTLs to allocate the job without initiating it.
This will be useful for the CPU job submission IOCTL, as the CPU job has
the need to use information from the user extensions. Currently, the
user extensions are parsed before the job allocation, making it
impossible to fill the CPU job when parsing the user extensions.
Therefore, decouple the job allocation from the job initiation.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 64 ++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 10141dc2820a..148900283c2a 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -135,23 +135,27 @@ void v3d_job_put(struct v3d_job *job)
 	kref_put(&job->refcount, job->free);
 }
 
+static int
+v3d_job_allocate(void **container, size_t size)
+{
+	*container = kcalloc(1, size, GFP_KERNEL);
+	if (!*container) {
+		DRM_ERROR("Cannot allocate memory for V3D job.\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
-	     void **container, size_t size, void (*free)(struct kref *ref),
+	     struct v3d_job *job, void (*free)(struct kref *ref),
 	     u32 in_sync, struct v3d_submit_ext *se, enum v3d_queue queue)
 {
 	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
-	struct v3d_job *job;
 	bool has_multisync = se && (se->flags & DRM_V3D_EXT_ID_MULTI_SYNC);
 	int ret, i;
 
-	*container = kcalloc(1, size, GFP_KERNEL);
-	if (!*container) {
-		DRM_ERROR("Cannot allocate memory for v3d job.");
-		return -ENOMEM;
-	}
-
-	job = *container;
 	job->v3d = v3d;
 	job->free = free;
 	job->file = file_priv;
@@ -159,7 +163,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 1, v3d_priv);
 	if (ret)
-		goto fail;
+		return ret;
 
 	if (has_multisync) {
 		if (se->in_sync_count && se->wait_stage == queue) {
@@ -194,10 +198,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 fail_deps:
 	drm_sched_job_cleanup(&job->base);
-fail:
-	kfree(*container);
-	*container = NULL;
-
 	return ret;
 }
 
@@ -437,7 +437,11 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = v3d_job_init(v3d, file_priv, (void *)&render, sizeof(*render),
+	ret = v3d_job_allocate((void *)&render, sizeof(*render));
+	if (ret)
+		return ret;
+
+	ret = v3d_job_init(v3d, file_priv, &render->base,
 			   v3d_render_job_free, args->in_sync_rcl, &se, V3D_RENDER);
 	if (ret)
 		goto fail;
@@ -447,7 +451,11 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	INIT_LIST_HEAD(&render->unref_list);
 
 	if (args->bcl_start != args->bcl_end) {
-		ret = v3d_job_init(v3d, file_priv, (void *)&bin, sizeof(*bin),
+		ret = v3d_job_allocate((void *)&bin, sizeof(*bin));
+		if (ret)
+			goto fail;
+
+		ret = v3d_job_init(v3d, file_priv, &bin->base,
 				   v3d_job_free, args->in_sync_bcl, &se, V3D_BIN);
 		if (ret)
 			goto fail;
@@ -461,7 +469,11 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
-		ret = v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_job),
+		ret = v3d_job_allocate((void *)&clean_job, sizeof(*clean_job));
+		if (ret)
+			goto fail;
+
+		ret = v3d_job_init(v3d, file_priv, clean_job,
 				   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
 		if (ret)
 			goto fail;
@@ -580,7 +592,11 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
+	ret = v3d_job_allocate((void *)&job, sizeof(*job));
+	if (ret)
+		return ret;
+
+	ret = v3d_job_init(v3d, file_priv, &job->base,
 			   v3d_job_free, args->in_sync, &se, V3D_TFU);
 	if (ret)
 		goto fail;
@@ -683,12 +699,20 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
+	ret = v3d_job_allocate((void *)&job, sizeof(*job));
+	if (ret)
+		return ret;
+
+	ret = v3d_job_init(v3d, file_priv, &job->base,
 			   v3d_job_free, args->in_sync, &se, V3D_CSD);
 	if (ret)
 		goto fail;
 
-	ret = v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_job),
+	ret = v3d_job_allocate((void *)&clean_job, sizeof(*clean_job));
+	if (ret)
+		goto fail;
+
+	ret = v3d_job_init(v3d, file_priv, clean_job,
 			   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
 	if (ret)
 		goto fail;
-- 
2.42.0

