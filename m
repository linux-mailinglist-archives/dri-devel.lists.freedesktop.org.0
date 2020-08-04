Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF423B318
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C161F6E40D;
	Tue,  4 Aug 2020 02:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25026E40C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:59:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-T3iG3J30OeOvEXB3Vm2TAQ-1; Mon, 03 Aug 2020 22:58:59 -0400
X-MC-Unique: T3iG3J30OeOvEXB3Vm2TAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9820291270;
 Tue,  4 Aug 2020 02:58:58 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE0EB90E68;
 Tue,  4 Aug 2020 02:58:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 56/59] drm/ttm: add a wrapper for checking if manager is in use
Date: Tue,  4 Aug 2020 12:56:29 +1000
Message-Id: <20200804025632.3868079-57-airlied@gmail.com>
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

This converts vmwgfx over to using an interface to set the
in use and check the in use flag.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c |  1 -
 drivers/gpu/drm/ttm/ttm_bo.c          |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c   | 14 +++++++-------
 include/drm/ttm/ttm_bo_driver.h       | 14 ++++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 22185a8dcfa1..38a0e4bd16f7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -240,7 +240,6 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	ttm_mem_type_manager_init(man, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_mem_type_manager_set_used(man, true);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cda33b4af681..7d10abae9a60 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1002,7 +1002,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 		return ret;
 
 	man = ttm_manager_type(bdev, mem_type);
-	if (!man || !man->use_type)
+	if (!man || !ttm_mem_type_manager_used(man))
 		return -EBUSY;
 
 	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 7168403fb4f8..b2f1e7a3b048 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -630,7 +630,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 				 TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
 				 false, dev_priv->vram_size >> PAGE_SHIFT);
 #endif
-	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
+	ttm_mem_type_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
 }
 
@@ -1192,9 +1192,9 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	spin_lock(&dev_priv->svga_lock);
-	if (!man->use_type) {
+	if (!ttm_mem_type_manager_used(man)) {
 		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
-		man->use_type = true;
+		ttm_mem_type_manager_set_used(man, true);
 	}
 	spin_unlock(&dev_priv->svga_lock);
 }
@@ -1223,8 +1223,8 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	spin_lock(&dev_priv->svga_lock);
-	if (man->use_type) {
-		man->use_type = false;
+	if (ttm_mem_type_manager_used(man)) {
+		ttm_mem_type_manager_set_used(man, false);
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
@@ -1257,8 +1257,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	spin_lock(&dev_priv->svga_lock);
-	if (man->use_type) {
-		man->use_type = false;
+	if (ttm_mem_type_manager_used(man)) {
+		ttm_mem_type_manager_set_used(man, false);
 		spin_unlock(&dev_priv->svga_lock);
 		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 300934289e64..f231fe34e744 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -678,6 +678,20 @@ static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *ma
 	man->use_type = used;
 }
 
+/**
+ * ttm_mem_type_manager_used
+ *
+ * @man: Manager to get used state for
+ *
+ * Get the in use flag for a manager.
+ * Returns:
+ * true is used, false if not.
+ */
+static inline bool ttm_mem_type_manager_used(struct ttm_mem_type_manager *man)
+{
+	return man->use_type;
+}
+
 /**
  * ttm_mem_type_manager_cleanup
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
