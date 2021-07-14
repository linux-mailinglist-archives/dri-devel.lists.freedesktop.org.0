Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C754A3C7D3A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 06:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F200689EF7;
	Wed, 14 Jul 2021 04:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747E689EF7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:14:20 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 13 Jul 2021 21:14:16 -0700
Received: from vertex.localdomain (unknown [10.21.244.34])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 178C32024A;
 Tue, 13 Jul 2021 21:14:19 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/vmwgfx: Be a lot more flexible with MOB limits
Date: Wed, 14 Jul 2021 00:14:16 -0400
Message-ID: <20210714041417.221947-3-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714041417.221947-1-zackr@vmware.com>
References: <20210714041417.221947-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code was trying to keep a strict limit on the amount of mob
memory that was used in the guest by making it match the host
settings. There's technically no reason to do that (guests can
certainly use more than the host can have resident in renderers
at the same time).

In particular this is problematic because our userspace is not
great at handling OOM conditions and running out of MOB space
results in GL apps crashing, e.g. gnome-shell likes to allocate
huge surfaces (~61MB for the desktop on 2560x1600 with two workspaces)
and running out of memory there means that the gnome-shell crashes
on startup taking us back to the login and resulting in a system
where one can not login in graphically anymore.

Instead of letting the userspace crash we can extend available
MOB space, we just don't want to use all of the RAM for graphics,
so we're going to limit it to half of RAM.

With the addition of some extra logging this should make the
"guest has been configured with not enough graphics memory"
errors a lot easier to diagnose in cases where the automatic
expansion of MOB space fails.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  8 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 36 +++++++++++++++++--
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 359f2e6f3693..a9195c472b75 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -948,6 +948,13 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		dev_priv->texture_max_height = 8192;
 		dev_priv->max_primary_mem = dev_priv->vram_size;
 	}
+	DRM_INFO("Legacy memory limits: VRAM = %llu kB, FIFO = %llu kB, surface = %u kB\n",
+		 (u64)dev_priv->vram_size / 1024,
+		 (u64)dev_priv->fifo_mem_size / 1024,
+		 dev_priv->memory_size / 1024);
+
+	DRM_INFO("MOB limits: max mob size = %u kB, max mob pages = %u\n",
+		 dev_priv->max_mob_size / 1024, dev_priv->max_mob_pages);
 
 	vmw_print_capabilities(dev_priv->capabilities);
 	if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER)
@@ -1094,7 +1101,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		DRM_INFO("SM4_1 support available.\n");
 	if (dev_priv->sm_type == VMW_SM_4)
 		DRM_INFO("SM4 support available.\n");
-	DRM_INFO("Running without reservation semaphore\n");
 
 	vmw_host_printf("vmwgfx: Module Version: %d.%d.%d (kernel: %s)",
 			VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 28ceb749a733..b2c4af331c9d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -71,8 +71,40 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 
 	if (gman->max_gmr_pages > 0) {
 		gman->used_gmr_pages += (*res)->num_pages;
-		if (unlikely(gman->used_gmr_pages > gman->max_gmr_pages))
-			goto nospace;
+		/*
+		 * Because the graphics memory is a soft limit we can try to
+		 * expand it instead of letting the userspace apps crash.
+		 * We're just going to have a sane limit (half of RAM)
+		 * on the number of MOB's that we create and will try to keep
+		 * the system running until we reach that.
+		 */
+		if (unlikely(gman->used_gmr_pages > gman->max_gmr_pages)) {
+			const unsigned long max_graphics_pages = totalram_pages() / 2;
+			uint32_t new_max_pages = 0;
+
+			DRM_WARN("vmwgfx: mob memory overflow. Consider increasing guest RAM and graphicsMemory.\n");
+			vmw_host_printf("vmwgfx, warning: mob memory overflow. Consider increasing guest RAM and graphicsMemory.\n");
+
+			if (gman->max_gmr_pages > (max_graphics_pages / 2)) {
+				DRM_WARN("vmwgfx: guest requires more than half of RAM for graphics.\n");
+				new_max_pages = max_graphics_pages;
+			} else
+				new_max_pages = gman->max_gmr_pages * 2;
+			if (new_max_pages > gman->max_gmr_pages && new_max_pages >= gman->used_gmr_pages) {
+				DRM_WARN("vmwgfx: increasing guest mob limits to %u kB.\n",
+					 ((new_max_pages) << (PAGE_SHIFT - 10)));
+
+				gman->max_gmr_pages = new_max_pages;
+			} else {
+				char buf[256];
+				snprintf(buf, sizeof(buf),
+					 "vmwgfx, error: guest graphics is out of memory (mob limit at: %ukB).\n",
+					 ((gman->max_gmr_pages) << (PAGE_SHIFT - 10)));
+				vmw_host_printf(buf);
+				DRM_WARN("%s", buf);
+				goto nospace;
+			}
+		}
 	}
 
 	(*res)->start = id;
-- 
2.30.2

