Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906024EFBE7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A0510E0F4;
	Fri,  1 Apr 2022 20:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F418010E0F9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:56:07 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 2F83028A54B;
 Fri,  1 Apr 2022 21:56:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1648846566; bh=eEh++Bp5KnRY3dkxKwL4uFC2SlErQdh0ERiEKx3Dq50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bi+eX4s6Ol1/R5b19yV6GBA5A4GyjRT1HFdx5pbUC6jGQyNX26k9g1vhjosNhn3jZ
 nBhm3Q7Oe+VjUwACDf4Xr0UpWCriwtN/ntjxENkGGW8JDnQLmOvd0FSkVk6Ytm/EVV
 K1t7M0M5cDRy8GpXQiHoG40KPTFUODVLY5KbyJI62OIoM43oYGIrKoLdXMiKdCpKCn
 sDLioMYJ1uPxwYr9hUE1d4tDm0VLDHIHJgsTgpXEnHO975n04HDt5NFAcxZFr3Id0U
 Qx4Ibn/GHzR4AKl/DMQtAPFVfKSx5/1nHbkm/JNvefaFGx7KN4sXHzCalu/JnPB90I
 xiW9PUsf2YW0g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vmwgfx: Write the driver id registers
Date: Fri,  1 Apr 2022 16:56:01 -0400
Message-Id: <20220401205602.1172975-2-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401205602.1172975-1-zack@kde.org>
References: <20220401205602.1172975-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
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
index 6d675855f065..72a17618ba0a 100644
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
@@ -1094,6 +1118,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	vmw_host_printf("vmwgfx: Module Version: %d.%d.%d (kernel: %s)",
 			VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
 			VMWGFX_DRIVER_PATCHLEVEL, UTS_RELEASE);
+	vmw_write_driver_id(dev_priv);
 
 	if (dev_priv->enable_fb) {
 		vmw_fifo_resource_inc(dev_priv);
-- 
2.32.0

