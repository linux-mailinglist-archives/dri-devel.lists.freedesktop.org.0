Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07023B309
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538B26E3F0;
	Tue,  4 Aug 2020 02:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6546E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-MglDgZtsMWGjKocFTs-9Vw-1; Mon, 03 Aug 2020 22:58:25 -0400
X-MC-Unique: MglDgZtsMWGjKocFTs-9Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465C818FF662;
 Tue,  4 Aug 2020 02:58:24 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99EB990E76;
 Tue,  4 Aug 2020 02:58:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 42/59] drm/vmwgfx/ttm: use wrapper to access memory manager
Date: Tue,  4 Aug 2020 12:56:15 +1000
Message-Id: <20200804025632.3868079-43-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 23 +++++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  4 ++--
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index f368a9cc0c2a..6ed92f38b54b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -634,7 +634,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 	ret = ttm_range_man_init(&dev_priv->bdev, man,
 				 dev_priv->vram_size >> PAGE_SHIFT);
 #endif
-	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
+	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
 	return ret;
 }
 
@@ -644,7 +644,7 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 	vmw_thp_fini(dev_priv);
 #else
 	ttm_bo_man_fini(&dev_priv->bdev,
-			    &dev_priv->bdev.man[TTM_PL_VRAM]);
+			ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM));
 #endif
 }
 
@@ -887,7 +887,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		DRM_ERROR("Failed initializing TTM buffer object driver.\n");
 		goto out_no_bdev;
 	}
-	dev_priv->bdev.man[TTM_PL_SYSTEM].available_caching =
+	ttm_manager_type(&dev_priv->bdev, TTM_PL_SYSTEM)->available_caching =
 		TTM_PL_FLAG_CACHED;
 
 	/*
@@ -1194,10 +1194,12 @@ static void vmw_master_drop(struct drm_device *dev,
  */
 static void __vmw_svga_enable(struct vmw_private *dev_priv)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+
 	spin_lock(&dev_priv->svga_lock);
-	if (!dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
+	if (!man->use_type) {
 		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
-		dev_priv->bdev.man[TTM_PL_VRAM].use_type = true;
+		man->use_type = true;
 	}
 	spin_unlock(&dev_priv->svga_lock);
 }
@@ -1223,9 +1225,11 @@ void vmw_svga_enable(struct vmw_private *dev_priv)
  */
 static void __vmw_svga_disable(struct vmw_private *dev_priv)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
+
 	spin_lock(&dev_priv->svga_lock);
-	if (dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
-		dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
+	if (man->use_type) {
+		man->use_type = false;
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
@@ -1242,6 +1246,7 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
  */
 void vmw_svga_disable(struct vmw_private *dev_priv)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 	/*
 	 * Disabling SVGA will turn off device modesetting capabilities, so
 	 * notify KMS about that so that it doesn't cache atomic state that
@@ -1257,8 +1262,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	spin_lock(&dev_priv->svga_lock);
-	if (dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
-		dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
+	if (man->use_type) {
+		man->use_type = false;
 		spin_unlock(&dev_priv->svga_lock);
 		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index ec1b5bb01a93..54c85a59dd8b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -98,7 +98,7 @@ static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman =
 		kzalloc(sizeof(*gman), GFP_KERNEL);
 
@@ -135,7 +135,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 
 void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman =
 		(struct vmwgfx_gmrid_man *)man->priv;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 548f152b9963..720a24214c74 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -117,7 +117,7 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
 
 int vmw_thp_init(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 	struct vmw_thp_manager *rman;
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
@@ -137,7 +137,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 
 void vmw_thp_fini(struct vmw_private *dev_priv)
 {
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
 	struct drm_mm *mm = &rman->mm;
 	int ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
