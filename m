Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F10181ECD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 18:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5DE6E9C1;
	Wed, 11 Mar 2020 17:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89D46E9C1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0471A3F7B1;
 Wed, 11 Mar 2020 18:09:25 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=hPQCexlx; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cz_VO7BgdaS5; Wed, 11 Mar 2020 18:09:20 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 379BD3F2CE;
 Wed, 11 Mar 2020 18:09:19 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5B42A362EAA;
 Wed, 11 Mar 2020 18:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583946559; bh=NL/DzYHk3m2clWzYK7Ke75NpMUvhxbmPahNrqpDVM+w=;
 h=From:To:Cc:Subject:Date:From;
 b=hPQCexlxexyqsc6IGBvttwM6bwpEvhCknBMMjIMsQTjHfCtnuZ+aofEnEjc4VFpH8
 QFoEvQdBSg9AjeQiF82qXrb4lX+jiRTy0LN8HpQIfWPi3Snt7LMrHXCwQQ367lpq0x
 VzVFb1iCVi4/g6PAla7+RVricVM6o3r0YuNAj2ho=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vmwgfx: Fix the refuse_dma mode when using
 guest-backed objects
Date: Wed, 11 Mar 2020 18:08:38 +0100
Message-Id: <20200311170839.3617-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
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
Cc: Brian Paul <brianp@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellstrom <thellstrom@vmware.com>

When we refuse DMA from system pages for whatever reason, we don't
handle that correctly when guest-backed objects was enabled.
Since guest-backed objects by definition require DMA to and from
system pages, disable all functionality that relies on them.
That basically amounts to 3D acceleration and screen targets.

Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Reviewed-by: Brian Paul <brianp@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 6 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c   | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 065015d2a8f6..3b41cf63110a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -1241,7 +1241,8 @@ int vmw_cmdbuf_set_pool_size(struct vmw_cmdbuf_man *man,
 		 * actually call into the already enabled manager, when
 		 * binding the MOB.
 		 */
-		if (!(dev_priv->capabilities & SVGA_CAP_DX))
+		if (!(dev_priv->capabilities & SVGA_CAP_DX) ||
+		    !dev_priv->has_mob)
 			return -ENOMEM;
 
 		ret = ttm_bo_create(&dev_priv->bdev, size, ttm_bo_type_device,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index cf3dc56d7cf4..f2ec3155468d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -682,8 +682,10 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 
 	ret = vmw_dma_select_mode(dev_priv);
 	if (unlikely(ret != 0)) {
-		DRM_INFO("Restricting capabilities due to IOMMU setup.\n");
+		DRM_INFO("Restricting capabilities since DMA not available.\n");
 		refuse_dma = true;
+		if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS)
+			DRM_INFO("Disabling 3D acceleration.\n");
 	}
 
 	dev_priv->vram_size = vmw_read(dev_priv, SVGA_REG_VRAM_SIZE);
@@ -866,7 +868,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		dev_priv->has_gmr = false;
 	}
 
-	if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS) {
+	if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS && !refuse_dma) {
 		dev_priv->has_mob = true;
 		if (ttm_bo_init_mm(&dev_priv->bdev, VMW_PL_MOB,
 				   VMW_PL_MOB) != 0) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 570687a1a327..68aecb6d9f87 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1888,7 +1888,7 @@ int vmw_kms_stdu_init_display(struct vmw_private *dev_priv)
 
 
 	/* Do nothing if Screen Target support is turned off */
-	if (!VMWGFX_ENABLE_SCREEN_TARGET_OTABLE)
+	if (!VMWGFX_ENABLE_SCREEN_TARGET_OTABLE || !dev_priv->has_mob)
 		return -ENOSYS;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_GBOBJECTS))
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
