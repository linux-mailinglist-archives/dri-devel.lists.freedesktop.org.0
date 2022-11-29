Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F463C827
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04E610E327;
	Tue, 29 Nov 2022 19:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECCC10E327
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749649; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLUKcEnShwNV7IAkx5+nlu/qzKUV03wm4WmwUoc45xY=;
 b=bp4LM/hnTnmmZksYmDtegnSOp+dpDcQqJ7cYWG0d53Kykd6HAnVsZIBEFE0th67GKJ4zgN
 1nk6AqSG6KFjCyww5de73wVkrFyIrEybywgwbMu6j1rRiGnyDoZKOWNmN749GNqib70kx9
 bxa4LwAoIGwlZEerL81uQJ6k549mQMw=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 22/26] drm: vboxvideo: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:38 +0000
Message-Id: <20221129191942.138244-9-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index b450f449a3ab..12fee99dbfe8 100644
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

