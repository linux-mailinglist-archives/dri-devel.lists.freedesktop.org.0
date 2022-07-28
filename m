Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A695847F1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 00:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246810E8F7;
	Thu, 28 Jul 2022 22:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7B0113F1D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659045954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=euZx/SQe2yHV3CiDDtxNmZWBbm4QMeS2RXInUMDOAqU=;
 b=HUgg+VMxYfUcKzZU3w9spc7kxQvSnrxauNV92IuOMnJhmLrdA0viOwXY2YlTg/6icy5PmY
 4iT8wnEX9KJdA6GmJWT/j5I45ZIhJo7k4fIBcTcgibgLhAXEoSA2FM2uePWsLiw9dCelhH
 dxI/HdF3cPOfVqpdM/AlvR4y+/vQ/4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-TPm2dwFYOJizJLozVZIGCA-1; Thu, 28 Jul 2022 18:05:48 -0400
X-MC-Unique: TPm2dwFYOJizJLozVZIGCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D362381078F;
 Thu, 28 Jul 2022 22:05:48 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B60E40C1288;
 Thu, 28 Jul 2022 22:05:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [RFC] drm/nouveau/ttm: Stop calling into swiotlb
Date: Thu, 28 Jul 2022 18:05:44 -0400
Message-Id: <20220728220545.163763-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per the request of some of the DMA folks, some of the swiotlb helpers are
being sunset in favor of better alternatives that don't involve layer
mixing. Since it seems like we can actually replace the one thing we use
swiotlb for pretty easily, e.g. checking whether or not we are capable of
coherent allocations using is_swiotlb_active().

So, let's do this by replacing is_swiotlb_active() with our own
nouveau_drm_use_coherent_gpu_mapping() helper.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>
---

Hey! This is the patch that I came up with, but as the folks involved
with this thread can probably tell I'm not entirely sure this is
correct?

Also, someone more knowledgeable about mm with nouveau should probably
verify this as well

 drivers/gpu/drm/nouveau/nouveau_ttm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 85f1f5a0fe5d..ab7ccba1d601 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -24,7 +24,6 @@
  */
 
 #include <linux/limits.h>
-#include <linux/swiotlb.h>
 
 #include <drm/ttm/ttm_range_manager.h>
 
@@ -241,7 +240,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	struct nvkm_pci *pci = device->pci;
 	struct nvif_mmu *mmu = &drm->client.mmu;
 	struct drm_device *dev = drm->dev;
-	bool need_swiotlb = false;
 	int typei, ret;
 
 	ret = nouveau_ttm_init_host(drm, 0);
@@ -276,14 +274,11 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 		drm->agp.cma = pci->agp.cma;
 	}
 
-#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active(dev->dev);
-#endif
-
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
-				  dev->anon_inode->i_mapping,
-				  dev->vma_offset_manager, need_swiotlb,
-				  drm->client.mmu.dmabits <= 32);
+			      dev->anon_inode->i_mapping,
+			      dev->vma_offset_manager,
+			      nouveau_drm_use_coherent_gpu_mapping(drm),
+			      drm->client.mmu.dmabits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
-- 
2.35.3

