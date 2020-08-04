Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C123B300
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751696E3D8;
	Tue,  4 Aug 2020 02:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B736E3D6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-mG0gubqdORqy_YVhnD5_Tg-1; Mon, 03 Aug 2020 22:58:04 -0400
X-MC-Unique: mG0gubqdORqy_YVhnD5_Tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4794100CD00;
 Tue,  4 Aug 2020 02:58:02 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 337EA8AD1C;
 Tue,  4 Aug 2020 02:58:01 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 33/59] drm/vmwgfx: fix gmrid takedown paths to new interface
Date: Tue,  4 Aug 2020 12:56:06 +1000
Message-Id: <20200804025632.3868079-34-airlied@gmail.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  9 ++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 11 ++++++++---
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 4f4d22bac477..f368a9cc0c2a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -996,9 +996,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	vmw_kms_close(dev_priv);
 out_no_kms:
 	if (dev_priv->has_mob)
-		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
+		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
 	if (dev_priv->has_gmr)
-		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_GMR);
+		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
 	vmw_vram_manager_fini(dev_priv);
 out_no_vram:
 	(void)ttm_bo_device_release(&dev_priv->bdev);
@@ -1047,12 +1047,11 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_overlay_close(dev_priv);
 
 	if (dev_priv->has_gmr)
-		(void)ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_GMR);
-	(void)ttm_bo_clean_mm(&dev_priv->bdev, TTM_PL_VRAM);
+		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
 
 	vmw_release_device_early(dev_priv);
 	if (dev_priv->has_mob)
-		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
+		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
 	vmw_vram_manager_fini(dev_priv);
 	(void) ttm_bo_device_release(&dev_priv->bdev);
 	drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index c6530d7b6d51..aa763c6b1146 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1222,6 +1222,7 @@ int vmw_overlay_num_free_overlays(struct vmw_private *dev_priv);
  */
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type);
+void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type);
 
 /**
  * Prime - vmwgfx_prime.c
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 141fb14e3583..ec1b5bb01a93 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -133,20 +133,25 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	return 0;
 }
 
-static int vmw_gmrid_man_takedown(struct ttm_mem_type_manager *man)
+void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
 {
+	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
 	struct vmwgfx_gmrid_man *gman =
 		(struct vmwgfx_gmrid_man *)man->priv;
 
+	ttm_mem_type_manager_disable(man);
+
+	ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
+
 	if (gman) {
 		ida_destroy(&gman->gmr_ida);
 		kfree(gman);
 	}
-	return 0;
+
+	ttm_mem_type_manager_cleanup(man);
 }
 
 static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
-	.takedown = vmw_gmrid_man_takedown,
 	.get_node = vmw_gmrid_man_get_node,
 	.put_node = vmw_gmrid_man_put_node,
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
