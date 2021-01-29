Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2F3094B9
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172BA6EC9A;
	Sat, 30 Jan 2021 11:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129D86EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 08:43:45 +0000 (UTC)
Received: from 1-171-224-33.dynamic-ip.hinet.net ([1.171.224.33]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1l5PNQ-0003Fu-G6; Fri, 29 Jan 2021 08:43:37 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: pjones@redhat.com
Subject: [PATCH] efifb: Ensure graphics device for efifb stays at PCI D0
Date: Fri, 29 Jan 2021 16:43:27 +0800
Message-Id: <20210129084327.986630-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:27:52 +0000
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
Cc: hdegoede@redhat.com,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are seeing root ports on some desktop boards support D3cold for
discrete graphics card. So when efifb is in use while graphics device
isn't bound to a driver, PCI and ACPI will put the graphics to D3cold
when runtime suspend kicks in, makes efifb stop working.

So ensure the graphics device won't be runtime suspended, to keep efifb
work all the time.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/video/fbdev/efifb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index e57c00824965..19edd7206409 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/screen_info.h>
+#include <linux/pm_runtime.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
@@ -575,6 +576,7 @@ static int efifb_probe(struct platform_device *dev)
 		goto err_fb_dealoc;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
+	pm_runtime_get_sync(&efifb_pci_dev->dev);
 	return 0;
 
 err_fb_dealoc:
@@ -601,6 +603,7 @@ static int efifb_remove(struct platform_device *pdev)
 	unregister_framebuffer(info);
 	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
 	framebuffer_release(info);
+	pm_runtime_put(&efifb_pci_dev->dev);
 
 	return 0;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
