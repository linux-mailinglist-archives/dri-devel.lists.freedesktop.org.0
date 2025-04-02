Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B6A7947C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B1D10E8AC;
	Wed,  2 Apr 2025 17:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LIfKwyS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2538210E8AC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743616002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXXj5L8CXKd6//47v5fkd9GCQ4CjR2mhs1VxAmIo2q8=;
 b=LIfKwyS2Q5Z2txkQLm24Mu7HMYYrniqTv3ANHCHZZVS0uAm0rF8Aby10ywc5HQnFy9NL2q
 pcY9cfS3oJtBk+Ss8L8d4/muUQMW0gsgRJ6eMf6zL9G2d4qCluhChCFHhkWdOR2SDwexYE
 dDJUH/TsCk05KPkZMSVcnli4MDYuICw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-ebtiP49xPMO_n_YYxD1MCw-1; Wed,
 02 Apr 2025 13:46:38 -0400
X-MC-Unique: ebtiP49xPMO_n_YYxD1MCw-1
X-Mimecast-MFC-AGG-ID: ebtiP49xPMO_n_YYxD1MCw_1743615996
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C1B281954B3B; Wed,  2 Apr 2025 17:46:35 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.79])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 14ACD180176A; Wed,  2 Apr 2025 17:46:29 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Wed, 02 Apr 2025 19:46:00 +0200
Subject: [PATCH v2 1/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-virtio-gpu-host-page-size-v2-1-0afdc8c16cb9@redhat.com>
References: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
In-Reply-To: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4158; i=slp@redhat.com;
 h=from:subject:message-id; bh=I2eOR3jUqhJHinTIKub5oXsOc1EHxv8i71jQ716NVMo=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBn7XfsNst3djKmtWJqVCUSOntZv87INBB906vOF
 VB3QJqdvQ2JAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ+137AAKCRD0aSeNLwwC
 NfCCEACCM/ixBLpTFUip+uY2d9Wjr9P+RY25n5J/DfdzcEmwRGYhjQsRa/NqFqjkCv55QwBAr5q
 /TnrjEsxeGSzkPnO531RcBeZE2/SgOeQDEFpbkgu2uXbWh8M14K4nEncziNhY5aWXK7swwnpcs2
 DRJYDsXPpUS0pUyHWG/IEsFn33Jc8i54dZ7jQ/4WWSoZhftR8C/3McDcK+J38pXOm/12elvqgqM
 6deAnHYzB+fyWgega9f2hF333u0g4NSRGBZK2cig795fMIQFfqSlsA4ChEya8onDtyowYRHg0cE
 mLpzqWZvRDMA1rder4PiaHRTPNJ5NIbyytjET82anUL87XOqPHTPxHoh4y2XI9jJVHVtJ7NkcM3
 b23MznreOHdjHOMANOIoe6GO2nqFzpR216xK1dblLNapGJDLLKyrJPx0ICr9velnyLgZA8DtP5A
 w/zTZ1UPpTFZ5F/ZIVooEEap8JM2q27EAq8c2CB9NmodCtxUL0Yrf1+bL1L4ROuXcie77GsK/Hn
 64T+3/ASQ2DUuDGFpVHhp5sUGgvmL/oSUXICwQSeAcKU6PBXIlIuc//TN5MFL+YjncmUr3s0i9E
 5CwTbGFV1Z8gH6IXneBxc5ynPyDfLt+dIeM7juxAElcmLz/7R9bojrelBMNAJzrn1m1aeGgGg4i
 l+J36bM55yGlRmQ==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
index 2d88e390feb468bf8783f13d90d0c4759dff0dcf..2e81aeaffdc6924dd88fb0778edef22084526866 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -154,6 +154,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_HOST_PAGE_SIZE,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e7a22b5d4fefa6b754c227a294037..439223b5f7cf8c9a120a28b7b7d57516928112e7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -257,6 +257,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_host_page_size;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -270,6 +271,7 @@ struct virtio_gpu_device {
 	uint32_t num_capsets;
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
+	uint32_t host_page_size;
 
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7dfb2006c561ca13b15d979ddb8bf2d753e35dad..4ab95712434615c2cc35f2ff80d33b40c4212cfb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -123,7 +123,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	struct virtio_gpu_device *vgdev;
 	/* this will expand later */
 	struct virtqueue *vqs[2];
-	u32 num_scanouts, num_capsets;
+	u32 num_scanouts, num_capsets, host_page_size;
 	int ret = 0;
 
 	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
@@ -196,6 +196,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
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
@@ -203,8 +209,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		 vgdev->has_resource_blob ? '+' : '-',
 		 vgdev->has_host_visible ? '+' : '-');
 
-	DRM_INFO("features: %ccontext_init\n",
-		 vgdev->has_context_init ? '+' : '-');
+	DRM_INFO("features: %ccontext_init %chost_page_size\n",
+		 vgdev->has_context_init ? '+' : '-',
+		 vgdev->has_host_page_size ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
 	if (ret) {
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index bf2c9cabd20793e3851e749baadf210341445501..adc264df4e458e9c754936c3015c069e5ee6b899 100644
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
@@ -364,6 +368,7 @@ struct virtio_gpu_config {
 	__le32 events_clear;
 	__le32 num_scanouts;
 	__le32 num_capsets;
+	__le32 host_page_size;
 };
 
 /* simple formats for fbcon/X use */

-- 
2.48.1

