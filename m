Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD5778BCD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 12:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F73A10E096;
	Fri, 11 Aug 2023 10:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9005010E096
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 10:18:34 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMfmh5MdNzCrlH;
 Fri, 11 Aug 2023 18:15:00 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 18:18:30 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <airlied@redhat.com>, <kraxel@redhat.com>, <gurchetansingh@chromium.org>, 
 <olvaffe@gmail.com>, <daniel@ffwll.ch>, <dmitry.osipenko@collabora.com>,
 <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/virtio: Remove unused function declarations
Date: Fri, 11 Aug 2023 18:18:23 +0800
Message-ID: <20230811101823.32344-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit dc5698e80cf7 ("Add virtio gpu driver.") declared but never
implemented virtio_gpu_attach_status_page()/virtio_gpu_detach_status_page()
Also commit 62fb7a5e1096 ("virtio-gpu: add 3d/virgl support")
declared but never implemented virtio_gpu_fence_ack() and
virtio_gpu_dequeue_fence_func().
Commit c84adb304c10 ("drm/virtio: Support virtgpu exported resources")
declared but never implemented virtgpu_gem_prime_get_uuid().

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4126c384286b..8513b671f871 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -344,8 +344,6 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
-int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
-int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output);
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
@@ -394,11 +392,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_fence *fence);
 void virtio_gpu_ctrl_ack(struct virtqueue *vq);
 void virtio_gpu_cursor_ack(struct virtqueue *vq);
-void virtio_gpu_fence_ack(struct virtqueue *vq);
 void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
-void virtio_gpu_dequeue_fence_func(struct work_struct *work);
-
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 int
@@ -465,8 +460,6 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags);
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf);
-int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
-			       uuid_t *uuid);
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
-- 
2.34.1

