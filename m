Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413123B2FA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403BB6E3CB;
	Tue,  4 Aug 2020 02:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA316E3C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-gn7rUzTlNYidlVPxCTtpBA-1; Mon, 03 Aug 2020 22:57:50 -0400
X-MC-Unique: gn7rUzTlNYidlVPxCTtpBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0976100AA23;
 Tue,  4 Aug 2020 02:57:48 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E35390E68;
 Tue,  4 Aug 2020 02:57:46 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 28/59] drm/vmwgfx: takedown vram manager
Date: Tue,  4 Aug 2020 12:56:01 +1000
Message-Id: <20200804025632.3868079-29-airlied@gmail.com>
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

Don't bother returning EBUSY, nobody cares enough,
if the driver has a problem, it should deal with it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 14 +++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 23 +++++++++++++----------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 364d5f3ff9a8..4f4d22bac477 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -637,6 +637,17 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
 	return ret;
 }
+
+static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	vmw_thp_fini(dev_priv);
+#else
+	ttm_bo_man_fini(&dev_priv->bdev,
+			    &dev_priv->bdev.man[TTM_PL_VRAM]);
+#endif
+}
+
 static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 {
 	struct vmw_private *dev_priv;
@@ -988,7 +999,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
 	if (dev_priv->has_gmr)
 		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_GMR);
-	(void)ttm_bo_clean_mm(&dev_priv->bdev, TTM_PL_VRAM);
+	vmw_vram_manager_fini(dev_priv);
 out_no_vram:
 	(void)ttm_bo_device_release(&dev_priv->bdev);
 out_no_bdev:
@@ -1042,6 +1053,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_release_device_early(dev_priv);
 	if (dev_priv->has_mob)
 		(void) ttm_bo_clean_mm(&dev_priv->bdev, VMW_PL_MOB);
+	vmw_vram_manager_fini(dev_priv);
 	(void) ttm_bo_device_release(&dev_priv->bdev);
 	drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
 	vmw_release_device_late(dev_priv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8f319dd6cdb4..c6530d7b6d51 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1521,6 +1521,7 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
 /* Transparent hugepage support - vmwgfx_thp.c */
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 extern int vmw_thp_init(struct vmw_private *dev_priv);
+void vmw_thp_fini(struct vmw_private *dev_priv);
 #endif
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 0292c931c265..548f152b9963 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -135,21 +135,25 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	return 0;
 }
 
-static int vmw_thp_takedown(struct ttm_mem_type_manager *man)
+void vmw_thp_fini(struct vmw_private *dev_priv)
 {
+	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
 	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
 	struct drm_mm *mm = &rman->mm;
+	int ret;
+
+	ttm_mem_type_manager_disable(man);
 
+	ret = ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
+	if (ret)
+		return;
 	spin_lock(&rman->lock);
-	if (drm_mm_clean(mm)) {
-		drm_mm_takedown(mm);
-		spin_unlock(&rman->lock);
-		kfree(rman);
-		man->priv = NULL;
-		return 0;
-	}
+	drm_mm_clean(mm);
+	drm_mm_takedown(mm);
 	spin_unlock(&rman->lock);
-	return -EBUSY;
+	kfree(rman);
+	man->priv = NULL;
+	ttm_mem_type_manager_cleanup(man);
 }
 
 static void vmw_thp_debug(struct ttm_mem_type_manager *man,
@@ -163,7 +167,6 @@ static void vmw_thp_debug(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func vmw_thp_func = {
-	.takedown = vmw_thp_takedown,
 	.get_node = vmw_thp_get_node,
 	.put_node = vmw_thp_put_node,
 	.debug = vmw_thp_debug
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
