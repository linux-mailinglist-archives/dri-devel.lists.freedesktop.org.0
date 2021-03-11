Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598C336EC5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7526EB57;
	Thu, 11 Mar 2021 09:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17FF6EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 801401F4600C;
 Thu, 11 Mar 2021 09:25:45 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 3/7] drm/panfrost: Move the mappings collection out of
 panfrost_lookup_bos()
Date: Thu, 11 Mar 2021 10:25:35 +0100
Message-Id: <20210311092539.2405596-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311092539.2405596-1-boris.brezillon@collabora.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So we can re-use it from elsewhere.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 52 ++++++++++++++-----------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 86c1347c6f0e..32e822e00a08 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -108,6 +108,34 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
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
@@ -127,8 +155,6 @@ panfrost_lookup_bos(struct drm_device *dev,
 		  struct drm_panfrost_submit *args,
 		  struct panfrost_job *job)
 {
-	struct panfrost_file_priv *priv = file_priv->driver_priv;
-	struct panfrost_gem_object *bo;
 	unsigned int i;
 	int ret;
 
@@ -143,27 +169,7 @@ panfrost_lookup_bos(struct drm_device *dev,
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
