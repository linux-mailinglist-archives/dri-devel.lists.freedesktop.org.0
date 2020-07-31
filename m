Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BD233DFF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AD16E9B5;
	Fri, 31 Jul 2020 04:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400906E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-OnOBxfHQP7mazKC7ys4iFg-1; Fri, 31 Jul 2020 00:06:39 -0400
X-MC-Unique: OnOBxfHQP7mazKC7ys4iFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7021F10059AC;
 Fri, 31 Jul 2020 04:06:38 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03CBF100238C;
 Fri, 31 Jul 2020 04:06:36 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 32/49] drm/vmwgfx/ttm: use wrapper to access memory manager
Date: Fri, 31 Jul 2020 14:05:03 +1000
Message-Id: <20200731040520.3701599-33-airlied@gmail.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 21 ++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  4 ++--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index b27f8b3699cf..dff6990ff9ed 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -634,7 +634,7 @@ static int vmw_init_vram_manager(struct vmw_private *dev_priv)
 	ret = ttm_bo_man_init(&dev_priv->bdev, man,
 			      dev_priv->vram_size >> PAGE_SHIFT);
 #endif
-	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
+	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
 	return ret;
 }
 
@@ -644,7 +644,7 @@ static void vmw_takedown_vram_manager(struct vmw_private *dev_priv)
 	vmw_thp_takedown(dev_priv);
 #else
 	ttm_bo_man_takedown(&dev_priv->bdev,
-			    &dev_priv->bdev.man[TTM_PL_VRAM]);
+			    ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM));
 #endif
 }
 
@@ -1192,10 +1192,12 @@ static void vmw_master_drop(struct drm_device *dev,
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
@@ -1221,9 +1223,11 @@ void vmw_svga_enable(struct vmw_private *dev_priv)
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
@@ -1240,6 +1244,7 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
  */
 void vmw_svga_disable(struct vmw_private *dev_priv)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 	/*
 	 * Disabling SVGA will turn off device modesetting capabilities, so
 	 * notify KMS about that so that it doesn't cache atomic state that
@@ -1255,8 +1260,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
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
index 2522927b75da..3fa809b5e3bd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -98,7 +98,7 @@ static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman =
 		kzalloc(sizeof(*gman), GFP_KERNEL);
 
@@ -133,7 +133,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 
 void vmw_gmrid_man_takedown(struct vmw_private *dev_priv, int type)
 {
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman =
 		(struct vmwgfx_gmrid_man *)man->priv;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 3591a93dad37..0dd619c9d207 100644
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
 
 void vmw_thp_takedown(struct vmw_private *dev_priv)
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
