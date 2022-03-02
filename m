Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F5A4CA904
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD7310E457;
	Wed,  2 Mar 2022 15:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632F310E49B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:44 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id C6A072872AA;
 Wed,  2 Mar 2022 15:24:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234683; bh=zuV10dqASu45dpzHE1BJpK3kfOIonnDylB69e3jbRDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N3266IsUklvWOO9eg1jaWUIiHijdzlAfUBMSsF5SPQpSVqFN5/gOOwl6BaQe+irHk
 zwN7p/IDjngPdoKPZ/joYT9VHUxOvCX16N5KRpe5nrbct4bNlckcZv1xRuJjPP24sr
 sNnZdjGobYpKipgwQSFT39LgPHSp5ipaTMufEAIii1Sigs49dIj6gAoHpQ7uBB239Q
 iMx1aF127skxjvP18psex9MocmF1b3/9wFnUyt4uY9aKLA3ftsj+BaIAvigCTBn+l8
 Oq9436MPEQtTdRNRq3Sgrf6YxJ7pP/keoYvWkb7h7lKVOBDTkH6Yr38rS3E0IS/oe/
 60MFXUToNuQ4g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/vmwgfx: Allow querying of the SVGA PCI id from the
 userspace
Date: Wed,  2 Mar 2022 10:24:23 -0500
Message-Id: <20220302152426.885214-6-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302152426.885214-1-zack@kde.org>
References: <20220302152426.885214-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Mesa3D loaders require knowledge of the devices PCI id. SVGAv2 and v3
have different PCI id's, but the same driver is used to handle them both.
To allow Mesa3D svga driver to be loaded automatically for both SVGAv2
and SVGAv3 make the kernel return the PCI id of the currently running
device.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 27 +++++++++++++++------------
 include/uapi/drm/vmwgfx_drm.h         |  9 ++++++++-
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 471da2b4c177..a1da5678c731 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -27,9 +27,11 @@
 
 #include "vmwgfx_drv.h"
 #include "vmwgfx_devcaps.h"
-#include <drm/vmwgfx_drm.h>
 #include "vmwgfx_kms.h"
 
+#include <drm/vmwgfx_drm.h>
+#include <linux/pci.h>
+
 int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv)
 {
@@ -62,17 +64,15 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 		break;
 	case DRM_VMW_PARAM_FIFO_HW_VERSION:
 	{
-		if ((dev_priv->capabilities & SVGA_CAP_GBOBJECTS)) {
+		if ((dev_priv->capabilities & SVGA_CAP_GBOBJECTS))
 			param->value = SVGA3D_HWVERSION_WS8_B1;
-			break;
-		}
-
-		param->value =
-			vmw_fifo_mem_read(dev_priv,
-					  ((vmw_fifo_caps(dev_priv) &
-					    SVGA_FIFO_CAP_3D_HWVERSION_REVISED) ?
-						   SVGA_FIFO_3D_HWVERSION_REVISED :
-						   SVGA_FIFO_3D_HWVERSION));
+		else
+			param->value = vmw_fifo_mem_read(
+					       dev_priv,
+					       ((vmw_fifo_caps(dev_priv) &
+						 SVGA_FIFO_CAP_3D_HWVERSION_REVISED) ?
+							SVGA_FIFO_3D_HWVERSION_REVISED :
+							SVGA_FIFO_3D_HWVERSION));
 		break;
 	}
 	case DRM_VMW_PARAM_MAX_SURF_MEMORY:
@@ -108,6 +108,9 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 	case DRM_VMW_PARAM_GL43:
 		param->value = has_gl43_context(dev_priv);
 		break;
+	case DRM_VMW_PARAM_DEVICE_ID:
+		param->value = to_pci_dev(dev_priv->drm.dev)->device;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 8277644c1144..26549c86a91f 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright © 2009-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright © 2009-2022 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -92,6 +92,12 @@ extern "C" {
  *
  * DRM_VMW_PARAM_SM5
  * SM5 support is enabled.
+ *
+ * DRM_VMW_PARAM_GL43
+ * SM5.1+GL4.3 support is enabled.
+ *
+ * DRM_VMW_PARAM_DEVICE_ID
+ * PCI ID of the underlying SVGA device.
  */
 
 #define DRM_VMW_PARAM_NUM_STREAMS      0
@@ -111,6 +117,7 @@ extern "C" {
 #define DRM_VMW_PARAM_SM4_1            14
 #define DRM_VMW_PARAM_SM5              15
 #define DRM_VMW_PARAM_GL43             16
+#define DRM_VMW_PARAM_DEVICE_ID        17
 
 /**
  * enum drm_vmw_handle_type - handle type for ref ioctls
-- 
2.32.0

