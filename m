Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD7606E79
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 05:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C3D10E57A;
	Fri, 21 Oct 2022 03:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAF010E260
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 03:44:08 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 6ECA733EED9;
 Fri, 21 Oct 2022 04:44:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666323847; bh=g3BPQ/Zm/BiUjXwoosvFmdBlDgWaZpLDWZ89UTjtmzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e13F0prwuFrmhv/MIECdb0I2qfyrDGRgIb0Zp66JyGO1y8g4x8G0FzUu+oKlRMVse
 tSCx2uOLxTakeAKPmXY1Hog4bKF9eOu1KYUCnG8eIAwsCeiG1/K/zJYU5FTT5Gjyo1
 bwzwA0xUg46szadussSPT2/a1ivfrvePwXm+n6BqxTxjGKcBTFiMYL+fdFat4iGy+4
 bl1AAQvZJVt5o0STtHGNymet2cNem5F6KT4gjh7ybRnx8L+RIxx1EytVtQ5e4/6LJT
 VR5oimYwikgN68/bls+qidQwKgwpXLS1NQhbJdvzeCpPCqxxE2F+uHp6hmGGX/vuAX
 Y+01csgBJd4YQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/17] drm/vmwgfx: Write the driver id registers
Date: Thu, 20 Oct 2022 23:43:44 -0400
Message-Id: <20221021034400.542909-2-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021034400.542909-1-zack@kde.org>
References: <20221021034400.542909-1-zack@kde.org>
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

