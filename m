Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADAC55292B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 03:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69AC10EE41;
	Tue, 21 Jun 2022 01:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jun 2022 01:58:49 UTC
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30910FD14
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 01:58:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1655776341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=K1+H2v0Dcy5bcSfjbkDccu2ORW87weu+sEwK39E3Vlk=;
 b=ivrUZstejSf/I9HRVWtAIeQvqmdrX3LWfbTyH4Lqykkaa5zxKwQr7kDwuMAR2J542l6Omx
 ZhHxTdF2b/sUqPDyZPHGU3bVgX9rowrRntCKpKDaLiexGXnbB1hJb+oWB4ppiS6unYdg2W
 fYuntfhTPtar7BMhHUHvawpE2Anw+oE=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH] drm: Make drm_buddy a part of drm module
Date: Tue, 21 Jun 2022 09:51:50 +0800
Message-Id: <20220621015151.11129-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_buddy is just a software allocator, so don't need to create
a module for this small part.
If drm_buddy is included in drm module, then only need to insmod drm.ko

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/gpu/drm/Kconfig     |  2 +-
 drivers/gpu/drm/Makefile    |  1 +
 drivers/gpu/drm/drm_buddy.c |  7 ++-----
 drivers/gpu/drm/drm_drv.c   | 10 ++++++++++
 include/drm/drm_buddy.h     |  3 +++
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 22e7fa48d693..6c18b34f25d3 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -180,7 +180,7 @@ config DRM_TTM
 	  uses it.
 
 config DRM_BUDDY
-	tristate
+	bool
 	depends on DRM
 	help
 	  A page based buddy allocator
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 13ef240b3d2b..75737ccb5fc0 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -29,6 +29,7 @@ drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
+drm-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..9262811b39ac 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -767,12 +767,12 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 }
 EXPORT_SYMBOL(drm_buddy_print);
 
-static void drm_buddy_module_exit(void)
+void drm_buddy_slb_blk_put(void)
 {
 	kmem_cache_destroy(slab_blocks);
 }
 
-static int __init drm_buddy_module_init(void)
+int __init drm_buddy_slb_blk_get(void)
 {
 	slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
 	if (!slab_blocks)
@@ -781,8 +781,5 @@ static int __init drm_buddy_module_init(void)
 	return 0;
 }
 
-module_init(drm_buddy_module_init);
-module_exit(drm_buddy_module_exit);
-
 MODULE_DESCRIPTION("DRM Buddy Allocator");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..2b5d6a8b5572 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -44,6 +44,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
+#include <drm/drm_buddy.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1034,6 +1035,9 @@ static const struct file_operations drm_stub_fops = {
 static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
+#if IS_ENABLED(CONFIG_DRM_BUDDY)
+	drm_buddy_slb_blk_put();
+#endif
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1061,6 +1065,12 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+#if IS_ENABLED(CONFIG_DRM_BUDDY)
+	ret = drm_buddy_slb_blk_get();
+	if (!ret)
+		goto error;
+#endif
+
 	drm_privacy_screen_lookup_init();
 
 	drm_core_init_complete = true;
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 572077ff8ae7..6f648175243c 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -156,4 +156,7 @@ void drm_buddy_block_print(struct drm_buddy *mm,
 			   struct drm_buddy_block *block,
 			   struct drm_printer *p);
 
+int __init drm_buddy_slb_blk_get(void);
+void drm_buddy_slb_blk_put(void);
+
 #endif
-- 
2.25.1

