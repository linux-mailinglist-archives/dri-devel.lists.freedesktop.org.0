Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BBE178807
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 03:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE0D6EA9E;
	Wed,  4 Mar 2020 02:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9576E115
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 02:06:05 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t24so214092pgj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 18:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFse7JnsXv3KR+/R3AGr964Z+sEknyypfVR8DRZOcHs=;
 b=BplpFU5Z4TwsjocxNeRFGw6Gb1qiXlraqOFk582j8SguyrgAnH2i+bRIeg03ZrDJU7
 55+054sEoszDuB/JpsAzErugDZ71bIhZIRR9sO2kXhB20YZe1pditcJp4NhnHdCN5+un
 AUF/fnAT70q5gTn69kZHC+6+8AUNY+yGyHSxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFse7JnsXv3KR+/R3AGr964Z+sEknyypfVR8DRZOcHs=;
 b=mh/MqkPkedAGNSaGxDkfZwXfCiEK0pR9GsEzwI7YrdTQy3lFT4BIyXix+TsLdearFA
 RlrqEIyD0dnse+ZHNZeLvBlwgVBMykvYMLtC4Bc3i7S9tA4ElgBq3fCANj0UXlHosMVZ
 A/DyK9F+3la8eIVuv3mKV/MxkZFdOvS6PiiFtlc2t8kQ6WfO8h8J/dCIiu5hstfXtLUq
 2GgYF3BTI2EYOeuHU674rpbcKcoQpsZbmeTZTrefb3ATt9CsAfxExbOWXZZP1NrDalcK
 wTKgmH9WKvs8PROaHBPg57PCeUxYrZmvwv/sFLAcYgXsnfYyNWE42GqGgktbJxLBeIhG
 x7Uw==
X-Gm-Message-State: ANhLgQ2c7AWDaBz/yuJkVSkAfrmHjAulUqFYETeCJGnKCE7QOsYmp17U
 8kO5zbjARZm6Rb4e8MxGn4y6mpg5Zy8=
X-Google-Smtp-Source: ADFU+vuBnr7QRm12+1WyjONRW/I61Vivw7gj+OaCTm1fgbAB/NVNEFxKaiiwqTiPsep1h6WtbE5wiA==
X-Received: by 2002:a62:7c17:: with SMTP id x23mr710007pfc.200.1583287565322; 
 Tue, 03 Mar 2020 18:06:05 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id i2sm420145pjs.21.2020.03.03.18.06.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 03 Mar 2020 18:06:04 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/virtio: add case for shmem objects in
 virtio_gpu_cleanup_object(..)
Date: Tue,  3 Mar 2020 18:05:59 -0800
Message-Id: <20200304020559.551-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200304020559.551-1-gurchetansingh@chromium.org>
References: <20200304020559.551-1-gurchetansingh@chromium.org>
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

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c | 32 +++++++++++++++----------
 2 files changed, 20 insertions(+), 14 deletions(-)

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
index 1f8b062bb9eb..0610a2effa40 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -65,21 +65,27 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
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
+
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
-	drm_gem_shmem_free_object(&bo->base.base);
 }
 
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
@@ -110,9 +116,9 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
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
