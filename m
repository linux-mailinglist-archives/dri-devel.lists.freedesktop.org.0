Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2035E48A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 19:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FA46E82A;
	Tue, 13 Apr 2021 17:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ABE6E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 17:05:20 +0000 (UTC)
Received: from 1-171-231-81.dynamic-ip.hinet.net ([1.171.231.81]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1lWMTS-0005T2-Fo; Tue, 13 Apr 2021 17:05:15 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: pjones@redhat.com
Subject: [PATCH] efifb: Check efifb_pci_dev before using it
Date: Wed, 14 Apr 2021 01:05:08 +0800
Message-Id: <20210413170508.968148-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some platforms like Hyper-V and RPi4 with UEFI firmware, efifb is not
a PCI device.

So make sure efifb_pci_dev is found before using it.

Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
BugLink: https://bugs.launchpad.net/bugs/1922403
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/video/fbdev/efifb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index f58a545b3bf3..8ea8f079cde2 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -575,7 +575,8 @@ static int efifb_probe(struct platform_device *dev)
 		goto err_fb_dealoc;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
-	pm_runtime_get_sync(&efifb_pci_dev->dev);
+	if (efifb_pci_dev)
+		pm_runtime_get_sync(&efifb_pci_dev->dev);
 	return 0;
 
 err_fb_dealoc:
@@ -602,7 +603,8 @@ static int efifb_remove(struct platform_device *pdev)
 	unregister_framebuffer(info);
 	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
 	framebuffer_release(info);
-	pm_runtime_put(&efifb_pci_dev->dev);
+	if (efifb_pci_dev)
+		pm_runtime_put(&efifb_pci_dev->dev);
 
 	return 0;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
