Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974177FF692
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7EC10E733;
	Thu, 30 Nov 2023 16:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E7910E732
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pbxcQ8iWwdrbRajbi0maiBflYX/Xs059SsiwpGRI+fU=; b=h0gaOUS0Wn2np5k8gUCki/Xs9u
 qBd68voX3jxPkJg8ppd/dYwIBNa4lP6FcMbmu/kC3GEvIWuTrUM3K3avB546gfJni2vW0VDbm/ZbK
 S6zRwZeAEAptfsCDrKhbFxNcDs40InQaBmX69T3rWE6uImYaGuyb4+D7O7bPvvWWLqRvrmyzpyHh1
 U0UycSH+TU3crWz9mTuZcxja7rdA0teRRICMX6KhQBqDPcHkYS5m8uV/aOFGKBK6+kqrQJqD4I17T
 +vqZFsIY2PVILgbEO3cMbLtkWtVj84A/Sf9etuhuFk5iJ2jItxDS09jhbUlO9Q5PN1fGWSngyOYLR
 BU9nf6iQ==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8k9y-008scY-DW; Thu, 30 Nov 2023 17:45:07 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 02/17] drm/v3d: Move wait BO ioctl to the v3d_bo file
Date: Thu, 30 Nov 2023 13:40:25 -0300
Message-ID: <20231130164420.932823-4-mcanal@igalia.com>
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

From: Melissa Wen <mwen@igalia.com>

IOCTLs related to BO operations reside on the file v3d_bo.c. The wait BO
ioctl is the only IOCTL regarding BOs that is placed in a different file.
So, move it to the v3d_bo.c file.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h |  4 ++--
 drivers/gpu/drm/v3d/v3d_gem.c | 33 ---------------------------------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 8b3229a37c6d..357a0da7e16a 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -233,3 +233,36 @@ int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
 	drm_gem_object_put(gem_obj);
 	return 0;
 }
+
+int
+v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
+		  struct drm_file *file_priv)
+{
+	int ret;
+	struct drm_v3d_wait_bo *args = data;
+	ktime_t start = ktime_get();
+	u64 delta_ns;
+	unsigned long timeout_jiffies =
+		nsecs_to_jiffies_timeout(args->timeout_ns);
+
+	if (args->pad != 0)
+		return -EINVAL;
+
+	ret = drm_gem_dma_resv_wait(file_priv, args->handle,
+				    true, timeout_jiffies);
+
+	/* Decrement the user's timeout, in case we got interrupted
+	 * such that the ioctl will be restarted.
+	 */
+	delta_ns = ktime_to_ns(ktime_sub(ktime_get(), start));
+	if (delta_ns < args->timeout_ns)
+		args->timeout_ns -= delta_ns;
+	else
+		args->timeout_ns = 0;
+
+	/* Asked to wait beyond the jiffie/scheduler precision? */
+	if (ret == -ETIME && args->timeout_ns)
+		ret = -EAGAIN;
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index d8b392494eba..fc04372d5cbd 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -385,6 +385,8 @@ int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv);
 int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv);
+int v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv);
 struct drm_gem_object *v3d_prime_import_sg_table(struct drm_device *dev,
 						 struct dma_buf_attachment *attach,
 						 struct sg_table *sgt);
@@ -405,8 +407,6 @@ int v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv);
 int v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv);
-int v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
-		      struct drm_file *file_priv);
 void v3d_job_cleanup(struct v3d_job *job);
 void v3d_job_put(struct v3d_job *job);
 void v3d_reset(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 9d2ac23c29e3..26f62a48d226 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -363,39 +363,6 @@ void v3d_job_put(struct v3d_job *job)
 	kref_put(&job->refcount, job->free);
 }
 
-int
-v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
-		  struct drm_file *file_priv)
-{
-	int ret;
-	struct drm_v3d_wait_bo *args = data;
-	ktime_t start = ktime_get();
-	u64 delta_ns;
-	unsigned long timeout_jiffies =
-		nsecs_to_jiffies_timeout(args->timeout_ns);
-
-	if (args->pad != 0)
-		return -EINVAL;
-
-	ret = drm_gem_dma_resv_wait(file_priv, args->handle,
-				    true, timeout_jiffies);
-
-	/* Decrement the user's timeout, in case we got interrupted
-	 * such that the ioctl will be restarted.
-	 */
-	delta_ns = ktime_to_ns(ktime_sub(ktime_get(), start));
-	if (delta_ns < args->timeout_ns)
-		args->timeout_ns -= delta_ns;
-	else
-		args->timeout_ns = 0;
-
-	/* Asked to wait beyond the jiffie/scheduler precision? */
-	if (ret == -ETIME && args->timeout_ns)
-		ret = -EAGAIN;
-
-	return ret;
-}
-
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     void **container, size_t size, void (*free)(struct kref *ref),
-- 
2.42.0

