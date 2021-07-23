Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C223D3DE4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 18:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8646EA40;
	Fri, 23 Jul 2021 16:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189EC6E996
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 16:51:56 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 23 Jul 2021 09:51:50 -0700
Received: from vertex.localdomain (unknown [10.84.232.132])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 29DDF202F4;
 Fri, 23 Jul 2021 09:51:55 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/vmwgfx: Be a lot more flexible with MOB limits
Date: Fri, 23 Jul 2021 12:51:52 -0400
Message-ID: <20210723165153.113198-3-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723165153.113198-1-zackr@vmware.com>
References: <20210723165153.113198-1-zackr@vmware.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  9 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 36 +++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 049ea3b8229b..ab9a1750e1df 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -942,6 +942,15 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		dev_priv->texture_max_height = 8192;
 		dev_priv->max_primary_mem = dev_priv->vram_size;
 	}
+	drm_info(&dev_priv->drm,
+		 "Legacy memory limits: VRAM = %llu kB, FIFO = %llu kB, surface = %u kB\n",
+		 (u64)dev_priv->vram_size / 1024,
+		 (u64)dev_priv->fifo_mem_size / 1024,
+		 dev_priv->memory_size / 1024);
+
+	drm_info(&dev_priv->drm,
+		 "MOB limits: max mob size = %u kB, max mob pages = %u\n",
+		 dev_priv->max_mob_size / 1024, dev_priv->max_mob_pages);
 
 	vmw_print_bitmap(&dev_priv->drm, "Capabilities",
 			 dev_priv->capabilities,
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

