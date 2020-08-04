Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798723B2EF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8036E3AE;
	Tue,  4 Aug 2020 02:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB3B6E3AC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-VsBfuwyIOiiLqH9Eafm_3g-1; Mon, 03 Aug 2020 22:57:30 -0400
X-MC-Unique: VsBfuwyIOiiLqH9Eafm_3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C55C91270;
 Tue,  4 Aug 2020 02:57:29 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F37F38AD1C;
 Tue,  4 Aug 2020 02:57:27 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/59] drm/vmwgfx/ttm: convert vram mm init to new code paths
Date: Tue,  4 Aug 2020 12:55:53 +1000
Message-Id: <20200804025632.3868079-21-airlied@gmail.com>
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

Split out the vram thp init path vs the range manager init.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 25 +++++++++++++++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  4 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 12 ++++++++----
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 1e4c2c6119c3..5a889df2de03 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -620,6 +620,23 @@ static int vmw_dma_masks(struct vmw_private *dev_priv)
 	return ret;
 }
 
+static int vmw_vram_manager_init(struct vmw_private *dev_priv)
+{
+	int ret;
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	ret = vmw_thp_init(dev_priv);
+#else
+	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
+
+	man->available_caching = TTM_PL_FLAG_CACHED;
+	man->default_caching = TTM_PL_FLAG_CACHED;
+
+	ret = ttm_range_man_init(&dev_priv->bdev, man,
+				 dev_priv->vram_size >> PAGE_SHIFT);
+#endif
+	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
+	return ret;
+}
 static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 {
 	struct vmw_private *dev_priv;
@@ -866,16 +883,12 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	 * Enable VRAM, but initially don't use it until SVGA is enabled and
 	 * unhidden.
 	 */
-	dev_priv->bdev.man[TTM_PL_VRAM].func = &vmw_thp_func;
-	dev_priv->bdev.man[TTM_PL_VRAM].available_caching = TTM_PL_FLAG_CACHED;
-	dev_priv->bdev.man[TTM_PL_VRAM].default_caching = TTM_PL_FLAG_CACHED;
-	ret = ttm_bo_init_mm(&dev_priv->bdev, TTM_PL_VRAM,
-			     (dev_priv->vram_size >> PAGE_SHIFT));
+
+	ret = vmw_vram_manager_init(dev_priv);
 	if (unlikely(ret != 0)) {
 		DRM_ERROR("Failed initializing memory manager for VRAM.\n");
 		goto out_no_vram;
 	}
-	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
 
 	/*
 	 * "Guest Memory Regions" is an aperture like feature with
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 65c414f119c0..10b681725a53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1520,9 +1520,7 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
 
 /* Transparent hugepage support - vmwgfx_thp.c */
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-extern const struct ttm_mem_type_manager_func vmw_thp_func;
-#else
-#define vmw_thp_func ttm_bo_manager_func
+extern int vmw_thp_init(struct vmw_private *dev_priv);
 #endif
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index b7c816ba7166..0292c931c265 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -115,18 +115,23 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static int vmw_thp_init(struct ttm_mem_type_manager *man,
-			unsigned long p_size)
+int vmw_thp_init(struct vmw_private *dev_priv)
 {
+	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
 	struct vmw_thp_manager *rman;
+	man->available_caching = TTM_PL_FLAG_CACHED;
+	man->default_caching = TTM_PL_FLAG_CACHED;
 
+	ttm_mem_type_manager_init(&dev_priv->bdev, man,
+				  dev_priv->vram_size >> PAGE_SHIFT);
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
 	if (!rman)
 		return -ENOMEM;
 
-	drm_mm_init(&rman->mm, 0, p_size);
+	drm_mm_init(&rman->mm, 0, man->size);
 	spin_lock_init(&rman->lock);
 	man->priv = rman;
+	ttm_mem_type_manager_set_used(man, true);
 	return 0;
 }
 
@@ -158,7 +163,6 @@ static void vmw_thp_debug(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func vmw_thp_func = {
-	.init = vmw_thp_init,
 	.takedown = vmw_thp_takedown,
 	.get_node = vmw_thp_get_node,
 	.put_node = vmw_thp_put_node,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
