Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 718747FF699
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21F710E73A;
	Thu, 30 Nov 2023 16:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595E10E736
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nE78RnxMs21nb8+2/mKnuWSjI1uVM/9ma0urIcrNWrc=; b=mUfFbnJrHSHqz2tvzqjH3j3tlr
 7sGzP074fyatzTnP42Q+lfms8DGvVgGMBbv2h/csrvkqxtqZLrvcS4oCsQe8GLgUB14UgjV98TM1O
 b/JhXs+nb+QIjDST7MihFvkIJyezsrk624os/mXzkwn/Zo1y8bd723LfXplclORyPQy1daDDLo5u3
 m1KXwNYlySNFxLNrk6BkJ81eOMu61AKKCh6RGngg/cNje/uPiB0t03oDdVXx5N3pVuiNg0f6AJjkM
 hulQC5KVSVDvAKed3ymm6OiBoDzH0IbUYrfMMDnoTxe463qYnF9U7V/PY8LiWD6cnrJEHEw/GudnY
 6fFcJ9cA==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kAE-008scY-IR; Thu, 30 Nov 2023 17:45:23 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 06/17] drm/v3d: Decouple job allocation from job initiation
Date: Thu, 30 Nov 2023 13:40:29 -0300
Message-ID: <20231130164420.932823-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
References: <20231130164420.932823-2-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
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
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
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

