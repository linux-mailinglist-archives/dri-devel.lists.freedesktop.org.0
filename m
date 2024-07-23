Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325793A02F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 13:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7C110E581;
	Tue, 23 Jul 2024 11:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MQEeJgez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F3010E581
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721735371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQW7PzkgTK5bZ57HfJLbFbPh4lNQWanF14yylB62UJM=;
 b=MQEeJgezLDD53cVCPC/Wcacms81wMtzljrASu9pADJpoX41w3INquLoz9LnfManSBmDtdu
 pk7uoy9VHNsyroTO71LF3DBcGjFfUeXvU606zW8k70fxfu3Lr0BTfSvq8+pCf5PNu3/5bM
 5Pfr7tFcvpPQq4feqjJdGoscUUlG8Nk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-oLoHgXnNPlyMEFX5TBBORQ-1; Tue,
 23 Jul 2024 07:49:26 -0400
X-MC-Unique: oLoHgXnNPlyMEFX5TBBORQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3FD9E1955D48; Tue, 23 Jul 2024 11:49:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.104])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 78209195605A; Tue, 23 Jul 2024 11:49:20 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: gurchetansingh@chromium.org, tzimmermann@suse.de, mripard@kernel.org,
 olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Sergio Lopez <slp@redhat.com>
Subject: [PATCH 1/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
Date: Tue, 23 Jul 2024 07:49:13 -0400
Message-ID: <20240723114914.53677-2-slp@redhat.com>
In-Reply-To: <20240723114914.53677-1-slp@redhat.com>
References: <20240723114914.53677-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

Introduce a new feature, HOST_PAGE_SIZE, that indicates the host
provides its page size as a value in virtio_gpu_config.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h |  2 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 13 ++++++++++---
 include/uapi/linux/virtio_gpu.h      |  5 +++++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 188e126383c2..026fc061db6d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -149,6 +149,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_HOST_PAGE_SIZE,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index bb7d86a0c6a1..5ce795deb1eb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -249,6 +249,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_host_page_size;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -262,6 +263,7 @@ struct virtio_gpu_device {
 	uint32_t num_capsets;
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
+	uint32_t host_page_size;
 
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5a3b5aaed1f3..11cccc3ca560 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -124,7 +124,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	struct virtio_gpu_device *vgdev;
 	/* this will expand later */
 	struct virtqueue *vqs[2];
-	u32 num_scanouts, num_capsets;
+	u32 num_scanouts, num_capsets, host_page_size;
 	int ret = 0;
 
 	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
@@ -197,6 +197,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CONTEXT_INIT)) {
 		vgdev->has_context_init = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_HOST_PAGE_SIZE)) {
+		vgdev->has_host_page_size = true;
+		virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
+				host_page_size, &host_page_size);
+		vgdev->host_page_size = host_page_size;
+	}
 
 	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
 		 vgdev->has_virgl_3d    ? '+' : '-',
@@ -204,8 +210,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		 vgdev->has_resource_blob ? '+' : '-',
 		 vgdev->has_host_visible ? '+' : '-');
 
-	DRM_INFO("features: %ccontext_init\n",
-		 vgdev->has_context_init ? '+' : '-');
+	DRM_INFO("features: %ccontext_init %chost_page_size\n",
+		 vgdev->has_context_init ? '+' : '-',
+		 vgdev->has_host_page_size ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0e21f3998108..120e41bf83a5 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -64,6 +64,10 @@
  * context_init and multiple timelines
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
+/*
+ * Config struct contains host page size
+ */
+#define VIRTIO_GPU_F_HOST_PAGE_SIZE      5
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -363,6 +367,7 @@ struct virtio_gpu_config {
 	__le32 events_clear;
 	__le32 num_scanouts;
 	__le32 num_capsets;
+	__le32 host_page_size;
 };
 
 /* simple formats for fbcon/X use */
-- 
2.45.2

