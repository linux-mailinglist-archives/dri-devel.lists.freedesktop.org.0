Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E27209710
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 01:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDDF6E852;
	Wed, 24 Jun 2020 23:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DC26E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593040891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wi1znm31qzcMq6s+LEuReOxrOa/3crQuccyoaVP19ws=;
 b=SuNJnLJZSzCNDzLbd77UEinFgelhJ43kYbBP/App4LSag+dRmM6eaerhTB3OUchN2OIgx3
 C8FDHySjIkD7SwCfiSJ51KYy1kNdOO6dGMovbFwJUmOHa+DQpP4tbL4Y5yxl6h+jKdjYzK
 O3hXdmJKFl/sQtCw13d6yH+KzhBiz9w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-_N5ygjjsN02_MCsy5f-I5A-1; Wed, 24 Jun 2020 19:21:29 -0400
X-MC-Unique: _N5ygjjsN02_MCsy5f-I5A-1
Received: by mail-wr1-f72.google.com with SMTP id h28so4724320wrc.18
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wi1znm31qzcMq6s+LEuReOxrOa/3crQuccyoaVP19ws=;
 b=jXwTU9TzwK21J9JVBT1X9MG/d3NbegL9Dum/iCI6f6ypj2FTx2Ru6T+YE8NRYCnSd2
 Th1sVGa8bcuo97fjpZLGKuJ2Ri846IGTk0XvIeJRYWc4tlPDGXm2FsVYRUUOT2+d3tXt
 T7DXIdv1ikG0diCKnfp6nnCh23sDBY1oa9MihILkOr7wS0rRGXbvWPQ5+Zt6j9QF0/Pz
 +IuuZVmNK38YN5wdU7nCU+Cbb3j5fa3GaoH2qwuROhX8mBZ72GbniOhUeSN9NugkoKKn
 wh9lBrWxk/UBTdKMLCyyAMWDkhvN6ZgB6+vyKcDHLKQZ1v3nXSEbDMYTbBuNzobsGd4r
 VvKw==
X-Gm-Message-State: AOAM533vuyC+zSh9JjnjqlXKmFRqGr5/QFliB1G/QATdQe2CzdNcKKID
 gHoPH0FFcKTA8JVpadpcxummfoNbu397/rKEXvNcCH30HpqbTfusOlJ4G29/MI41Lxtj7Si2kER
 TQFO5XJZ4QK1FWR2aHZyYS+MaNUvf
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr30827312wrc.344.1593040887203; 
 Wed, 24 Jun 2020 16:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5ir4N9wbti9tYY2l2bny6BHZhcJVYIhD0t4MJ3ccxojugpKeIyFBm3DZYFEVnjAyCrm+GsQ==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr30827294wrc.344.1593040886954; 
 Wed, 24 Jun 2020 16:21:26 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 e4sm2757194wrt.97.2020.06.24.16.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 16:21:26 -0700 (PDT)
Date: Wed, 24 Jun 2020 19:21:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] virtio: virtio_has_iommu_quirk -> virtio_has_dma_quirk
Message-ID: <20200624232035.704217-3-mst@redhat.com>
References: <20200624232035.704217-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200624232035.704217-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the corresponding feature bit has been renamed,
rename the quirk too - it's about special ways to
do DMA, not necessarily about the IOMMU.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 4 ++--
 drivers/virtio/virtio_ring.c            | 2 +-
 include/linux/virtio_config.h           | 4 ++--
 tools/virtio/linux/virtio_config.h      | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01cd888..e8799ab0c753 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -141,7 +141,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_mem_entry **ents,
 					unsigned int *nents)
 {
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 	struct scatterlist *sg;
 	int si, ret;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9e663a5d9952..53af60d484a4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -599,7 +599,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
@@ -1015,7 +1015,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a1a5c2a91426..34253cb69cb8 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -240,7 +240,7 @@ static inline bool virtqueue_use_indirect(struct virtqueue *_vq,
 
 static bool vring_use_dma_api(struct virtio_device *vdev)
 {
-	if (!virtio_has_iommu_quirk(vdev))
+	if (!virtio_has_dma_quirk(vdev))
 		return true;
 
 	/* Otherwise, we are left to guess. */
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index f2cc2a0df174..3b4eae5ac5e3 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -162,10 +162,10 @@ static inline bool virtio_has_feature(const struct virtio_device *vdev,
 }
 
 /**
- * virtio_has_iommu_quirk - determine whether this device has the iommu quirk
+ * virtio_has_dma_quirk - determine whether this device has the DMA quirk
  * @vdev: the device
  */
-static inline bool virtio_has_iommu_quirk(const struct virtio_device *vdev)
+static inline bool virtio_has_dma_quirk(const struct virtio_device *vdev)
 {
 	/*
 	 * Note the reverse polarity of the quirk feature (compared to most
diff --git a/tools/virtio/linux/virtio_config.h b/tools/virtio/linux/virtio_config.h
index f99ae42668e0..f2640e505c4e 100644
--- a/tools/virtio/linux/virtio_config.h
+++ b/tools/virtio/linux/virtio_config.h
@@ -42,10 +42,10 @@ static inline void __virtio_clear_bit(struct virtio_device *vdev,
 	(__virtio_test_bit((dev), feature))
 
 /**
- * virtio_has_iommu_quirk - determine whether this device has the iommu quirk
+ * virtio_has_dma_quirk - determine whether this device has the DMA quirk
  * @vdev: the device
  */
-static inline bool virtio_has_iommu_quirk(const struct virtio_device *vdev)
+static inline bool virtio_has_dma_quirk(const struct virtio_device *vdev)
 {
 	/*
 	 * Note the reverse polarity of the quirk feature (compared to most
-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
