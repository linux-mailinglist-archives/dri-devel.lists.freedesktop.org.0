Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D17179D55
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 02:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681666E8C6;
	Thu,  5 Mar 2020 01:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B2D6E8C6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 01:32:20 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l8so1755868pjy.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 17:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1eb+5r10f2ohvFVrLfPM8mKQ0JfDUpw0fB6ef1fuic=;
 b=Wgw/Pz4j/eVvtEORxO5FLdM/x3lx5DG3wUWvQ4fA3UC2Bre4HfuSjWeSjEG5A6ZBFe
 Njdp8t1lpweU6+eFU8KSVq70z1EeIk9Z4cDHg5MsuqakFInve8u8xuDjF8mkt2L6FGQG
 3dg5VSrsJAnqct81qzk7k5J3z06Z5Mlp83gwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1eb+5r10f2ohvFVrLfPM8mKQ0JfDUpw0fB6ef1fuic=;
 b=WCxXWS8bgnP87B+1RSzld76Tc5jiLFfbBhvPFPDkfZiu8UAqDt4n+RkcmAXDB7q+dR
 Q6KFiyA61JquXfPIFyAznhvVFCrvaLTpFw7l4iVcdDNDEZ/Uw+7pd2QVunQtwvJomMQA
 LpTFRTpDoRxHCCIjsYcycV1gCknrk3ofVu8DrrjtpnQiNaz54okLZzExEbKiHhP8bgTp
 JmkMwsB/+vqDmnpuhXB6jjSofn9qkVljOEGx0wMnbJpE0A0LG162cLKg2A32iIzl8oNN
 uqMlvLQV9hFx+TxmxlR5XQYSIo0GvcvPzGEu/7pMrIwprDESTLtBLYaKd/J1nHYo5njs
 r2Tw==
X-Gm-Message-State: ANhLgQ2YNh7/6eHjfnGOJVz2V4iV3ZrGwCu47u6TRE8lTzYVjjCpLpru
 a8lW7tuGqUtt2vqss05jkB6kNMj+HVI=
X-Google-Smtp-Source: ADFU+vutuzvqs+jv9kVmuDsZEZgSlHE9TBTVvPs7owt3ZNcol/2m/7m2tNEKeHzVh9EZr9fK+FoASg==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr5827152pjp.108.1583371939610; 
 Wed, 04 Mar 2020 17:32:19 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id x9sm4763478pfa.60.2020.03.04.17.32.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 04 Mar 2020 17:32:19 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/virtio: add case for shmem objects in
 virtio_gpu_cleanup_object(..)
Date: Wed,  4 Mar 2020 17:32:12 -0800
Message-Id: <20200305013212.130640-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305013212.130640-1-gurchetansingh@chromium.org>
References: <20200305013212.130640-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can be reused for hostmem objects.

v2: move virtio_gpu_is_shmem() check to virtio_gpu_cleanup_object()
v3: use-after free fix

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c | 33 ++++++++++++++-----------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 8e2027da6cce..c1824bdf2418 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -371,7 +371,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
-bool virtio_gpu_is_shmem(struct drm_gem_object *obj);
+bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 /* virtgpu_prime.c */
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 1f8b062bb9eb..cc65e8b3ec8b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -65,21 +65,26 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
-	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
-	if (shmem->pages) {
-		if (shmem->mapped) {
-			dma_unmap_sg(vgdev->vdev->dev.parent,
-				     shmem->pages->sgl, shmem->mapped,
-				     DMA_TO_DEVICE);
-			shmem->mapped = 0;
+	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
+	if (virtio_gpu_is_shmem(bo)) {
+		struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
+
+		if (shmem->pages) {
+			if (shmem->mapped) {
+				dma_unmap_sg(vgdev->vdev->dev.parent,
+					     shmem->pages->sgl, shmem->mapped,
+					     DMA_TO_DEVICE);
+				shmem->mapped = 0;
+			}
+
+			sg_free_table(shmem->pages);
+			shmem->pages = NULL;
+			drm_gem_shmem_unpin(&bo->base.base);
 		}
-		sg_free_table(shmem->pages);
-		shmem->pages = NULL;
-		drm_gem_shmem_unpin(&bo->base.base);
+
+		drm_gem_shmem_free_object(&bo->base.base);
 	}
-	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
-	drm_gem_shmem_free_object(&bo->base.base);
 }
 
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
@@ -110,9 +115,9 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.mmap = drm_gem_shmem_mmap,
 };
 
-bool virtio_gpu_is_shmem(struct drm_gem_object *obj)
+bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
 {
-	return obj->funcs == &virtio_gpu_shmem_funcs;
+	return bo->base.base.funcs == &virtio_gpu_shmem_funcs;
 }
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
