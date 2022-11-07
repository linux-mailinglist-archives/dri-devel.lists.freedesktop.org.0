Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13C61FC0F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFFB10E539;
	Mon,  7 Nov 2022 17:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB5910E544
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843596; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5THks8G5thM8MpzfovKFJFQl1Oz6R2zYzhs11WmEBw=;
 b=wRUg0fzPYgUjWGRA7Zk51JSJfOFCQz6mEfxbR520rZUbVMVAA9VZ7aYLFyg8knC7zr6j76
 d1DpHWTqb9UgGG/9fSsBi4mTOCrep6aKkMc6LhSA2mZBWOFUgwuSUkD+JfcmQnHGtF3KcI
 BdiFKNvCT3d8He4siopok9nrVSU5bTk=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 22/26] drm: vboxvideo: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:52:52 +0000
Message-Id: <20221107175256.360839-12-paul@crapouillou.net>
In-Reply-To: <20221107175256.360839-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the pm_sleep_ptr() macro to handle the .suspend / .resume callbacks.

This macro allows the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index f4f2bd79a7cb..79318441ed7e 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -102,7 +102,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
 	vbox_hw_fini(vbox);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int vbox_pm_suspend(struct device *dev)
 {
 	struct vbox_private *vbox = dev_get_drvdata(dev);
@@ -160,16 +159,13 @@ static const struct dev_pm_ops vbox_pm_ops = {
 	.poweroff = vbox_pm_poweroff,
 	.restore = vbox_pm_resume,
 };
-#endif
 
 static struct pci_driver vbox_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
 	.probe = vbox_pci_probe,
 	.remove = vbox_pci_remove,
-#ifdef CONFIG_PM_SLEEP
-	.driver.pm = &vbox_pm_ops,
-#endif
+	.driver.pm = pm_sleep_ptr(&vbox_pm_ops),
 };
 
 DEFINE_DRM_GEM_FOPS(vbox_fops);
-- 
2.35.1

