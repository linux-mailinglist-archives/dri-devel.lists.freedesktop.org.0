Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F5233DEA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079356E9A1;
	Fri, 31 Jul 2020 04:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F376E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-f8pvF-TlNLarEeSVwFTvig-1; Fri, 31 Jul 2020 00:05:55 -0400
X-MC-Unique: f8pvF-TlNLarEeSVwFTvig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F244F107ACCA;
 Fri, 31 Jul 2020 04:05:53 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8592B100238C;
 Fri, 31 Jul 2020 04:05:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/49] drm/vmwgfx/ttm: switch gmrid allocator to new init
 paths.
Date: Fri, 31 Jul 2020 14:04:42 +1000
Message-Id: <20200731040520.3701599-12-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 17 ++++-------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index e11c20150ff6..5ee5aa0aaa6a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -894,14 +894,10 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	 *  slots as well as the bo size.
 	 */
 	dev_priv->has_gmr = true;
-	dev_priv->bdev.man[VMW_PL_GMR].func = &vmw_gmrid_manager_func;
-	dev_priv->bdev.man[VMW_PL_GMR].available_caching = TTM_PL_FLAG_CACHED;
-	dev_priv->bdev.man[VMW_PL_GMR].default_caching = TTM_PL_FLAG_CACHED;
 	/* TODO: This is most likely not correct */
-	dev_priv->bdev.man[VMW_PL_GMR].use_tt = true;
 	if (((dev_priv->capabilities & (SVGA_CAP_GMR | SVGA_CAP_GMR2)) == 0) ||
-	    refuse_dma || ttm_bo_init_mm(&dev_priv->bdev, VMW_PL_GMR,
-					 VMW_PL_GMR) != 0) {
+	    refuse_dma ||
+	    vmw_gmrid_man_init(dev_priv, VMW_PL_GMR) != 0) {
 		DRM_INFO("No GMR memory available. "
 			 "Graphics memory resources are very limited.\n");
 		dev_priv->has_gmr = false;
@@ -909,13 +905,8 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 
 	if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS && !refuse_dma) {
 		dev_priv->has_mob = true;
-		dev_priv->bdev.man[VMW_PL_MOB].func = &vmw_gmrid_manager_func;
-		dev_priv->bdev.man[VMW_PL_MOB].available_caching = TTM_PL_FLAG_CACHED;
-		dev_priv->bdev.man[VMW_PL_MOB].default_caching = TTM_PL_FLAG_CACHED;
-		/* TODO: This is most likely not correct */
-		dev_priv->bdev.man[VMW_PL_MOB].use_tt = true;
-		if (ttm_bo_init_mm(&dev_priv->bdev, VMW_PL_MOB,
-				   VMW_PL_MOB) != 0) {
+
+		if (vmw_gmrid_man_init(dev_priv, VMW_PL_MOB) != 0) {
 			DRM_INFO("No MOB memory available. "
 				 "3D will be disabled.\n");
 			dev_priv->has_mob = false;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 10b681725a53..8f319dd6cdb4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1221,7 +1221,7 @@ int vmw_overlay_num_free_overlays(struct vmw_private *dev_priv);
  * GMR Id manager
  */
 
-extern const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
+int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type);
 
 /**
  * Prime - vmwgfx_prime.c
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 4a76fc7114ad..e79d2c8abad2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -94,22 +94,28 @@ static void vmw_gmrid_man_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static int vmw_gmrid_man_init(struct ttm_mem_type_manager *man,
-			      unsigned long p_size)
+static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
+
+int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 {
-	struct vmw_private *dev_priv =
-		container_of(man->bdev, struct vmw_private, bdev);
+	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
 	struct vmwgfx_gmrid_man *gman =
 		kzalloc(sizeof(*gman), GFP_KERNEL);
 
 	if (unlikely(!gman))
 		return -ENOMEM;
 
+	man->func = &vmw_gmrid_manager_func;
+	man->available_caching = TTM_PL_FLAG_CACHED;
+	man->default_caching = TTM_PL_FLAG_CACHED;
+	/* TODO: This is most likely not correct */
+	man->use_tt = true;
+	ttm_bo_init_mm_base(&dev_priv->bdev, man, 0);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
 
-	switch (p_size) {
+	switch (type) {
 	case VMW_PL_GMR:
 		gman->max_gmr_ids = dev_priv->max_gmr_ids;
 		gman->max_gmr_pages = dev_priv->max_gmr_pages;
@@ -143,8 +149,7 @@ static void vmw_gmrid_man_debug(struct ttm_mem_type_manager *man,
 	drm_printf(printer, "No debug info available for the GMR id manager\n");
 }
 
-const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
-	.init = vmw_gmrid_man_init,
+static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
 	.takedown = vmw_gmrid_man_takedown,
 	.get_node = vmw_gmrid_man_get_node,
 	.put_node = vmw_gmrid_man_put_node,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
