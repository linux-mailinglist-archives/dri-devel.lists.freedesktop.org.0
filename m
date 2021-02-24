Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B77324213
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3A76EB0B;
	Wed, 24 Feb 2021 16:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9446EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 16:30:36 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 24 Feb 2021 08:30:30 -0800
Received: from vertex.localdomain (unknown [10.16.119.71])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 1051F205A1;
 Wed, 24 Feb 2021 08:30:34 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: Bump the patch level version and cleanup logging
Date: Wed, 24 Feb 2021 11:30:34 -0500
Message-ID: <20210224163034.918430-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should advertise the reworked fifo/cmd handling and huge pages
support. Also while bumping the version number lets cleanup
the logging, there's no point in logging whether we're atomic
(we always are) or what repo we use (it's always in kernel now).

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 13 -------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  4 ++--
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 4efed3bf0ef9..6910111099c8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -47,12 +47,6 @@
 #define VMW_MIN_INITIAL_WIDTH 800
 #define VMW_MIN_INITIAL_HEIGHT 600
 
-#ifndef VMWGFX_GIT_VERSION
-#define VMWGFX_GIT_VERSION "Unknown"
-#endif
-
-#define VMWGFX_REPO "In Tree"
-
 #define VMWGFX_VALIDATION_MEM_GRAN (16*PAGE_SIZE)
 
 
@@ -967,8 +961,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	if (ret)
 		goto out_no_fifo;
 
-	DRM_INFO("Atomic: %s\n", (dev_priv->drm.driver->driver_features & DRIVER_ATOMIC)
-		 ? "yes." : "no.");
 	if (dev_priv->sm_type == VMW_SM_5)
 		DRM_INFO("SM5 support available.\n");
 	if (dev_priv->sm_type == VMW_SM_4_1)
@@ -976,11 +968,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	if (dev_priv->sm_type == VMW_SM_4)
 		DRM_INFO("SM4 support available.\n");
 
-	snprintf(host_log, sizeof(host_log), "vmwgfx: %s-%s",
-		VMWGFX_REPO, VMWGFX_GIT_VERSION);
-	vmw_host_log(host_log);
-
-	memset(host_log, 0, sizeof(host_log));
 	snprintf(host_log, sizeof(host_log), "vmwgfx: Module Version: %d.%d.%d",
 		VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
 		VMWGFX_DRIVER_PATCHLEVEL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index e65b00f8336d..bb2ce6327944 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -55,10 +55,10 @@
 
 
 #define VMWGFX_DRIVER_NAME "vmwgfx"
-#define VMWGFX_DRIVER_DATE "20200114"
+#define VMWGFX_DRIVER_DATE "20210218"
 #define VMWGFX_DRIVER_MAJOR 2
 #define VMWGFX_DRIVER_MINOR 18
-#define VMWGFX_DRIVER_PATCHLEVEL 0
+#define VMWGFX_DRIVER_PATCHLEVEL 1
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
 #define VMWGFX_MAX_RELOCATIONS 2048
 #define VMWGFX_MAX_VALIDATIONS 2048
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
