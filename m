Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA241E210
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C3D6EC50;
	Thu, 30 Sep 2021 19:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668526EC4B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 19:10:01 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A35221F451E8;
 Thu, 30 Sep 2021 20:09:59 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 2/8] drm/panfrost: Move the mappings collection out of
 panfrost_lookup_bos()
Date: Thu, 30 Sep 2021 21:09:48 +0200
Message-Id: <20210930190954.1525933-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930190954.1525933-1-boris.brezillon@collabora.com>
References: <20210930190954.1525933-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

So we can re-use it from elsewhere.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 53 ++++++++++++++-----------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 40e4a4db3ab1..b131da3c9399 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -118,6 +118,34 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	return 0;
 }
 
+static int
+panfrost_get_job_mappings(struct drm_file *file_priv, struct panfrost_job *job)
+{
+	struct panfrost_file_priv *priv = file_priv->driver_priv;
+	unsigned int i;
+
+	job->mappings = kvmalloc_array(job->bo_count,
+				       sizeof(*job->mappings),
+				       GFP_KERNEL | __GFP_ZERO);
+	if (!job->mappings)
+		return -ENOMEM;
+
+	for (i = 0; i < job->bo_count; i++) {
+		struct panfrost_gem_mapping *mapping;
+		struct panfrost_gem_object *bo;
+
+		bo = to_panfrost_bo(job->bos[i]);
+		mapping = panfrost_gem_mapping_get(bo, priv);
+		if (!mapping)
+			return -EINVAL;
+
+		atomic_inc(&bo->gpu_usecount);
+		job->mappings[i] = mapping;
+	}
+
+	return 0;
+}
+
 /**
  * panfrost_lookup_bos() - Sets up job->bo[] with the GEM objects
  * referenced by the job.
@@ -137,9 +165,6 @@ panfrost_lookup_bos(struct drm_device *dev,
 		  struct drm_panfrost_submit *args,
 		  struct panfrost_job *job)
 {
-	struct panfrost_file_priv *priv = file_priv->driver_priv;
-	struct panfrost_gem_object *bo;
-	unsigned int i;
 	int ret;
 
 	job->bo_count = args->bo_handle_count;
@@ -153,27 +178,7 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	job->mappings = kvmalloc_array(job->bo_count,
-				       sizeof(struct panfrost_gem_mapping *),
-				       GFP_KERNEL | __GFP_ZERO);
-	if (!job->mappings)
-		return -ENOMEM;
-
-	for (i = 0; i < job->bo_count; i++) {
-		struct panfrost_gem_mapping *mapping;
-
-		bo = to_panfrost_bo(job->bos[i]);
-		mapping = panfrost_gem_mapping_get(bo, priv);
-		if (!mapping) {
-			ret = -EINVAL;
-			break;
-		}
-
-		atomic_inc(&bo->gpu_usecount);
-		job->mappings[i] = mapping;
-	}
-
-	return ret;
+	return panfrost_get_job_mappings(file_priv, job);
 }
 
 /**
-- 
2.31.1

