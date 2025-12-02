Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F6C9CE4C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 21:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D8710E6A2;
	Tue,  2 Dec 2025 20:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LXLhyXkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966FA10E6A2;
 Tue,  2 Dec 2025 20:23:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1050343FAD;
 Tue,  2 Dec 2025 20:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DED2C4CEF1;
 Tue,  2 Dec 2025 20:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764706995;
 bh=5okg3qKSOzCDrFMh8ZM74TVx5aD+HlYMj2Cu+hyF15g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LXLhyXkStvhn6cK4QG7j0j2aZlhd60lye5CC+4V1hPwAfPiAEkSnYdd3OY483MMEs
 5R5mMRKRHrjS5hoGRvjo+uPFbAUpdyfy2VD8/ZAxu44GVtmReFx62MkhBVB/2bjXCt
 cKzmqpssrs+j9kIqBgRr0noruJZK2iJcdVChc7gVfsLdiTyT23tNZxx1GgGEPpaNPN
 lo4bfOzzFkw8/UpsFwloivm7tenl5p8rEqcURZhq9zPNv8lChK0jkYsjfeEpnLsDU+
 kKsMNE2UJ2y8Bhzvb2cHppetLvWNFuDblUQCzBc52B+aUO1rB912pSTeL8JYXkMXAn
 lchWvi7A6iv6w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12.y] drm, fbcon,
 vga_switcheroo: Avoid race condition in fbcon setup
Date: Tue,  2 Dec 2025 15:23:12 -0500
Message-ID: <20251202202312.2505097-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025120119-edgy-recycled-bcfe@gregkh>
References: <2025120119-edgy-recycled-bcfe@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit eb76d0f5553575599561010f24c277cc5b31d003 ]

Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
access in fbcon_remap_all(). Without holding the console lock the call
races with switching outputs.

VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
function uses struct fb_info.node, which is set by register_framebuffer().
As the fb-helper code currently sets up VGA switcheroo before registering
the framebuffer, the value of node is -1 and therefore not a legal value.
For example, fbcon uses the value within set_con2fb_map() [1] as an index
into an array.

Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
result in VGA switching that does not switch fbcon correctly.

Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
which already holds the console lock. Fbdev calls fbcon_fb_registered()
from within register_framebuffer(). Serializes the helper with VGA
switcheroo's call to fbcon_remap_all().

Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
as parameter, it really only needs the contained fbcon state. Moving the
call to fbcon initialization is therefore cleaner than before. Only amdgpu,
i915, nouveau and radeon support vga_switcheroo. For all other drivers,
this change does nothing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.34+
Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_fb_helper.c            | 6 ------
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 ------
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 5 -----
 drivers/video/fbdev/core/fbcon.c           | 9 +++++++++
 4 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b15ddbd65e7b5..a8971c4eb9f05 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,9 +30,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
-#include <linux/pci.h>
 #include <linux/sysrq.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1637,10 +1635,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
-	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(dev->dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 49a1ac4f54919..337cc9fc31b19 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -589,11 +589,8 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 static void intel_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = fb_helper->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(pdev, NULL);
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
 		drm_fb_helper_unprepare(fb_helper);
@@ -620,7 +617,6 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = client->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int ret;
 
 	if (dev->fb_helper)
@@ -634,8 +630,6 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (ret)
 		goto err_drm_fb_helper_fini;
 
-	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
-
 	return 0;
 
 err_drm_fb_helper_fini:
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index fb70de29545c6..a197ba2f2717b 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -300,10 +300,8 @@ static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = fb_helper->dev;
-	struct radeon_device *rdev = dev->dev_private;
 
 	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
 		drm_helper_force_disable_all(dev);
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
@@ -325,7 +323,6 @@ static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = client->dev;
-	struct radeon_device *rdev = dev->dev_private;
 	int ret;
 
 	if (dev->fb_helper)
@@ -342,8 +339,6 @@ static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (ret)
 		goto err_drm_fb_helper_fini;
 
-	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
-
 	return 0;
 
 err_drm_fb_helper_fini:
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 1fc1e47ae2b49..e681066736dea 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -65,6 +65,7 @@
 #include <linux/string.h>
 #include <linux/kd.h>
 #include <linux/panic.h>
+#include <linux/pci.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
@@ -77,6 +78,7 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
+#include <linux/vga_switcheroo.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
@@ -2894,6 +2896,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
 
 	console_lock();
 
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
+
 	fbcon_registered_fb[info->node] = NULL;
 	fbcon_num_registered_fb--;
 
@@ -3027,6 +3032,10 @@ static int do_fb_registered(struct fb_info *info)
 		}
 	}
 
+	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
+
 	return ret;
 }
 
-- 
2.51.0

