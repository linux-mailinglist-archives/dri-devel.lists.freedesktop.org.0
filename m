Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD773DD73E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EEF6E183;
	Mon,  2 Aug 2021 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBE06E17C;
 Mon,  2 Aug 2021 13:35:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="210348405"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="210348405"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 06:35:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="520567355"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 06:35:53 -0700
From: Imre Deak <imre.deak@intel.com>
To: linux-fbdev@vger.kernel.org,
	Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org
Subject: [PATCH] fbdev/efifb: Release PCI device's runtime PM ref during FB
 destroy
Date: Mon,  2 Aug 2021 16:35:51 +0300
Message-Id: <20210802133551.1904964-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
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

Atm the EFI FB driver gets a runtime PM reference for the associated GFX
PCI device during driver probing and releases it only when removing the
driver.

When fbcon switches to the FB provided by the PCI device's driver (for
instance i915/drmfb), the EFI FB will get only unregistered without the
EFI FB driver getting unloaded, keeping the runtime PM reference
acquired during driver probing. This reference will prevent the PCI
driver from runtime suspending the device.

Fix this by releasing the RPM reference from the EFI FB's destroy hook,
called when the FB gets unregistered.

Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/video/fbdev/efifb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 8ea8f079cde26..25cdea32b9633 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -47,6 +47,8 @@ static bool use_bgrt = true;
 static bool request_mem_succeeded = false;
 static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
 
+static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
+
 static struct fb_var_screeninfo efifb_defined = {
 	.activate		= FB_ACTIVATE_NOW,
 	.height			= -1,
@@ -243,6 +245,9 @@ static inline void efifb_show_boot_graphics(struct fb_info *info) {}
 
 static void efifb_destroy(struct fb_info *info)
 {
+	if (efifb_pci_dev)
+		pm_runtime_put(&efifb_pci_dev->dev);
+
 	if (info->screen_base) {
 		if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
 			iounmap(info->screen_base);
@@ -333,7 +338,6 @@ ATTRIBUTE_GROUPS(efifb);
 
 static bool pci_dev_disabled;	/* FB base matches BAR of a disabled device */
 
-static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
 static struct resource *bar_resource;
 static u64 bar_offset;
 
@@ -603,8 +607,6 @@ static int efifb_remove(struct platform_device *pdev)
 	unregister_framebuffer(info);
 	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
 	framebuffer_release(info);
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
 
 	return 0;
 }
-- 
2.27.0

