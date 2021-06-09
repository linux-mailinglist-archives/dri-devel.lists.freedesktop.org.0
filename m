Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E03A1BB1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDF06E9C7;
	Wed,  9 Jun 2021 17:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7606E9BC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:23:14 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 9 Jun 2021 10:23:11 -0700
Received: from vertex.localdomain (unknown [10.21.244.178])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 9E4592024E;
 Wed,  9 Jun 2021 10:23:13 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 8/9] drm/vmwgfx: Remove vmw_chipset
Date: Wed, 9 Jun 2021 13:23:06 -0400
Message-ID: <20210609172307.131929-9-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609172307.131929-1-zackr@vmware.com>
References: <20210609172307.131929-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmw_chipset was duplicating pci_id. They are exactly the same
variable just with two different names. Becuase pci_id was
already used to detect the SVGA version, there's no point
in having vmw_chipset and thus we can remove it.

All references to vmw_chipset should use pci_id.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index be3db4988949..d51f215bd715 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -706,7 +706,7 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 }
 
 static int vmw_setup_pci_resources(struct vmw_private *dev,
-				   unsigned long pci_id)
+				   u32 pci_id)
 {
 	resource_size_t rmmio_start;
 	resource_size_t rmmio_size;
@@ -783,7 +783,7 @@ static int vmw_detect_version(struct vmw_private *dev)
 	svga_id = vmw_read(dev, SVGA_REG_ID);
 	if (svga_id != SVGA_ID_2 && svga_id != SVGA_ID_3) {
 		DRM_ERROR("Unsupported SVGA ID 0x%x on chipset 0x%x\n",
-			  svga_id, dev->vmw_chipset);
+			  svga_id, dev->pci_id);
 		return -ENOSYS;
 	}
 	BUG_ON(vmw_is_svga_v3(dev) && (svga_id != SVGA_ID_3));
@@ -798,7 +798,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	bool refuse_dma = false;
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
-	dev_priv->vmw_chipset = pci_id;
 	dev_priv->drm.dev_private = dev_priv;
 
 	mutex_init(&dev_priv->cmdbuf_mutex);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3875cfbf1791..9422967659d7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -487,8 +487,7 @@ struct vmw_private {
 	struct ttm_device bdev;
 
 	struct drm_vma_offset_manager vma_manager;
-	unsigned long pci_id;
-	u32 vmw_chipset;
+	u32 pci_id;
 	resource_size_t io_start;
 	resource_size_t vram_start;
 	resource_size_t vram_size;
-- 
2.30.2

