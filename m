Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5A25251D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2B76E9DE;
	Wed, 26 Aug 2020 01:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41C06E9DD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:44:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-vC_e7qjaNiq76TTssw_wjw-1; Tue, 25 Aug 2020 21:44:53 -0400
X-MC-Unique: vC_e7qjaNiq76TTssw_wjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 626071074642;
 Wed, 26 Aug 2020 01:44:52 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E974D60FC2;
 Wed, 26 Aug 2020 01:44:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/23] drm/nouveau/ttm: use driver bind/unbind/destroy
 functions.
Date: Wed, 26 Aug 2020 11:44:13 +1000
Message-Id: <20200826014428.828392-9-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: gmail.com
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 45 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_sgdma.c | 54 ++++++-------------------
 drivers/gpu/drm/nouveau/nouveau_ttm.h   |  3 ++
 3 files changed, 60 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 9e6425a0cb3f..f16401feb965 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -668,6 +668,34 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *bo, uint32_t page_flags)
 	return nouveau_sgdma_create_ttm(bo, page_flags);
 }
 
+static int
+nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
+		    struct ttm_resource *reg)
+{
+#if IS_ENABLED(CONFIG_AGP)
+	struct nouveau_drm *drm = nouveau_bdev(bdev);
+
+	if (drm->agp.bridge) {
+		return ttm_agp_bind(bdev, ttm, reg);
+	}
+#endif
+	return nouveau_sgdma_bind(bdev, ttm, reg);
+}
+
+static void
+nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
+{
+#if IS_ENABLED(CONFIG_AGP)
+	struct nouveau_drm *drm = nouveau_bdev(bdev);
+
+	if (drm->agp.bridge) {
+		ttm_agp_unbind(bdev, ttm);
+		return;
+	}
+#endif
+	nouveau_sgdma_unbind(bdev, ttm);
+}
+
 static void
 nouveau_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
 {
@@ -1296,6 +1324,20 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 	ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
 }
 
+static void
+nouveau_ttm_tt_destroy(struct ttm_bo_device *bdev,
+		       struct ttm_tt *ttm)
+{
+#if IS_ENABLED(CONFIG_AGP)
+	struct nouveau_drm *drm = nouveau_bdev(bdev);
+	if (drm->agp.bridge) {
+		ttm_agp_destroy(bdev, ttm);
+		return;
+	}
+#endif
+	nouveau_sgdma_destroy(bdev, ttm);
+}
+
 void
 nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool exclusive)
 {
@@ -1311,6 +1353,9 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_create = &nouveau_ttm_tt_create,
 	.ttm_tt_populate = &nouveau_ttm_tt_populate,
 	.ttm_tt_unpopulate = &nouveau_ttm_tt_unpopulate,
+	.ttm_tt_bind = &nouveau_ttm_tt_bind,
+	.ttm_tt_unbind = &nouveau_ttm_tt_unbind,
+	.ttm_tt_destroy = &nouveau_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = nouveau_bo_evict_flags,
 	.move_notify = nouveau_bo_move_ntfy,
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 6000c650b105..05e542254e1f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -14,7 +14,7 @@ struct nouveau_sgdma_be {
 	struct nouveau_mem *mem;
 };
 
-static void
+void
 nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
@@ -25,10 +25,11 @@ nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 	}
 }
 
-static int
-nv04_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *reg)
+int
+nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *reg)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
+	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	int ret;
 
@@ -36,65 +37,34 @@ nv04_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resou
 	if (ret)
 		return ret;
 
-	ret = nouveau_mem_map(mem, &mem->cli->vmm.vmm, &mem->vma[0]);
-	if (ret) {
-		nouveau_mem_fini(mem);
-		return ret;
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+		ret = nouveau_mem_map(mem, &mem->cli->vmm.vmm, &mem->vma[0]);
+		if (ret) {
+			nouveau_mem_fini(mem);
+			return ret;
+		}
 	}
 
 	nvbe->mem = mem;
 	return 0;
 }
 
-static void
-nv04_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
+void
+nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 	nouveau_mem_fini(nvbe->mem);
 }
 
-static struct ttm_backend_func nv04_sgdma_backend = {
-	.bind			= nv04_sgdma_bind,
-	.unbind			= nv04_sgdma_unbind,
-	.destroy		= nouveau_sgdma_destroy
-};
-
-static int
-nv50_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *reg)
-{
-	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
-	struct nouveau_mem *mem = nouveau_mem(reg);
-	int ret;
-
-	ret = nouveau_mem_host(reg, &nvbe->ttm);
-	if (ret)
-		return ret;
-
-	nvbe->mem = mem;
-	return 0;
-}
-
-static struct ttm_backend_func nv50_sgdma_backend = {
-	.bind			= nv50_sgdma_bind,
-	.unbind			= nv04_sgdma_unbind,
-	.destroy		= nouveau_sgdma_destroy
-};
-
 struct ttm_tt *
 nouveau_sgdma_create_ttm(struct ttm_buffer_object *bo, uint32_t page_flags)
 {
-	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_sgdma_be *nvbe;
 
 	nvbe = kzalloc(sizeof(*nvbe), GFP_KERNEL);
 	if (!nvbe)
 		return NULL;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA)
-		nvbe->ttm.ttm.func = &nv04_sgdma_backend;
-	else
-		nvbe->ttm.ttm.func = &nv50_sgdma_backend;
-
 	if (ttm_dma_tt_init(&nvbe->ttm, bo, page_flags)) {
 		kfree(nvbe);
 		return NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.h b/drivers/gpu/drm/nouveau/nouveau_ttm.h
index eaf25461cd91..69552049bb96 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.h
@@ -22,4 +22,7 @@ int  nouveau_ttm_mmap(struct file *, struct vm_area_struct *);
 int  nouveau_ttm_global_init(struct nouveau_drm *);
 void nouveau_ttm_global_release(struct nouveau_drm *);
 
+int nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *reg);
+void nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
+void nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
