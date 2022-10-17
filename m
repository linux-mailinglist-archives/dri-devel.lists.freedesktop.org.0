Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8389601814
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0F210E9DF;
	Mon, 17 Oct 2022 19:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D34C10E720
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:54:53 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1536033EF91;
 Mon, 17 Oct 2022 20:54:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666036491; bh=g3BPQ/Zm/BiUjXwoosvFmdBlDgWaZpLDWZ89UTjtmzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LFodSYt2RNhw7sPQymI86jIj+5CuwVR6VpPmj5qIOwBOEdp3bdJicwczkR1kCNQDR
 gMplbD8RUyfjn+Xclkk2wQtl6yIrdZ1DFchpufAegayDqoyDu7h13HGVxKHYv98/cV
 Ek5cHfxB6EOnpuTQ0INYKpAO7AlD+hoSYWDCpXW459OhlxOCc/TX4xAEu6n1/ZTGZk
 i4n+0KeYn/Xa7iHOZxIY2FU7vS0/3834EPRt0iVghNEaVssGJrq36+uxq1W09IBcGV
 ihvNvXJqXkfDoJJuymI9Lp4w3iN2NjmiA1hT+cZv7qK5ZxK06PQ2tgYxWfdEHnU0fl
 MdHZg3O0YSLGQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/16] drm/vmwgfx: Write the driver id registers
Date: Mon, 17 Oct 2022 15:54:25 -0400
Message-Id: <20221017195440.311862-2-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017195440.311862-1-zack@kde.org>
References: <20221017195440.311862-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Driver id registers are a new mechanism in the svga device to hint to the
device which driver is running. This should not change device behavior
in any way, but might be convenient to work-around specific bugs
in guest drivers.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 43 +++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index d7bd5eb1d3ac..45028e25d490 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -25,10 +25,13 @@
  *
  **************************************************************************/
 
-#include <linux/dma-mapping.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/cc_platform.h>
+
+#include "vmwgfx_drv.h"
+
+#include "vmwgfx_devcaps.h"
+#include "vmwgfx_mksstat.h"
+#include "vmwgfx_binding.h"
+#include "ttm_object.h"
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
@@ -41,11 +44,11 @@
 #include <drm/ttm/ttm_placement.h>
 #include <generated/utsrelease.h>
 
-#include "ttm_object.h"
-#include "vmwgfx_binding.h"
-#include "vmwgfx_devcaps.h"
-#include "vmwgfx_drv.h"
-#include "vmwgfx_mksstat.h"
+#include <linux/cc_platform.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/version.h>
 
 #define VMWGFX_DRIVER_DESC "Linux drm driver for VMware graphics devices"
 
@@ -806,6 +809,27 @@ static int vmw_detect_version(struct vmw_private *dev)
 	return 0;
 }
 
+static void vmw_write_driver_id(struct vmw_private *dev)
+{
+	if ((dev->capabilities2 & SVGA_CAP2_DX2) != 0) {
+		vmw_write(dev,  SVGA_REG_GUEST_DRIVER_ID,
+			  SVGA_REG_GUEST_DRIVER_ID_LINUX);
+
+		vmw_write(dev, SVGA_REG_GUEST_DRIVER_VERSION1,
+			  LINUX_VERSION_MAJOR << 24 |
+			  LINUX_VERSION_PATCHLEVEL << 16 |
+			  LINUX_VERSION_SUBLEVEL);
+		vmw_write(dev, SVGA_REG_GUEST_DRIVER_VERSION2,
+			  VMWGFX_DRIVER_MAJOR << 24 |
+			  VMWGFX_DRIVER_MINOR << 16 |
+			  VMWGFX_DRIVER_PATCHLEVEL);
+		vmw_write(dev, SVGA_REG_GUEST_DRIVER_VERSION3, 0);
+
+		vmw_write(dev, SVGA_REG_GUEST_DRIVER_ID,
+			  SVGA_REG_GUEST_DRIVER_ID_SUBMIT);
+	}
+}
+
 static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 {
 	int ret;
@@ -1091,6 +1115,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	vmw_host_printf("vmwgfx: Module Version: %d.%d.%d (kernel: %s)",
 			VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
 			VMWGFX_DRIVER_PATCHLEVEL, UTS_RELEASE);
+	vmw_write_driver_id(dev_priv);
 
 	if (dev_priv->enable_fb) {
 		vmw_fifo_resource_inc(dev_priv);
-- 
2.34.1

