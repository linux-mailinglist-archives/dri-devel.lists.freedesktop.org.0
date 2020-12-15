Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EC2DBD26
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFAA6E0D1;
	Wed, 16 Dec 2020 08:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540C46E314
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 12:18:55 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CwHMv5QLVzM5hT;
 Tue, 15 Dec 2020 20:18:03 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 20:18:49 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/hisilicon: Fix rmmod hibmc_drm failed
Date: Tue, 15 Dec 2020 20:18:59 +0800
Message-ID: <1608034739-699-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_irq_uninstall should be called before pci_disable_msi, if use
devm_drm_irq_install to register the interrupt, the system will
call pci_disable_msi first and then call drm_irq_uninstall, which
will result in the following callstack.

This reverts commit e4401247070a37c2fce62b2773a4eb7757983938.

kernel BUG at drivers/pci/msi.c:376!
Internal error: Oops - BUG: 0 [#1] SMP
CPU: 93 PID: 173814 Comm: rmmod Tainted:
pstate: a0400009 (NzCv daif +PAN -UAO -TCO BTYPE=--)
pc : free_msi_irqs+0x17c/0x1a0
lr : free_msi_irqs+0x16c/0x1a0
sp : ffff2028157f7bd0
x29: ffff2028157f7bd0 x28: ffff202849edab00
x27: 0000000000000000 x26: 0000000000000000
x25: 0000000000000000 x24: 0000000000000000
x23: ffff0020851da000 x22: ffff0020851da2d8
x21: ffff0020cc829000 x20: 0000000000000000
x19: ffff0020d6714800 x18: 0000000000000010
x17: 0000000000000000 x16: 0000000000000000
x15: ffffffffffffffff x14: ffff2028957f77df
x13: ffff2028157f77ed x12: 0000000000000000
x11: 0000000000000040 x10: ffff800011b2f8e0
x9 : ffff800011b2f8d8 x8 : ffff2020203fc458
x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff2020203fc430 x4 : ffff2020203fc4a0
x3 : 0000000000000000 x2 : 0000000000000000
x1 : 00000000000002c9 x0 : ffff0020d6719500
Call trace:
 free_msi_irqs+0x17c/0x1a0
 pci_disable_msi+0xe4/0x118
 hibmc_unload+0x44/0x80 [hibmc_drm]
 hibmc_pci_remove+0x2c/0x38 [hibmc_drm]
 pci_device_remove+0x48/0x108
 device_release_driver_internal+0x118/0x1f0
 driver_detach+0x6c/0xe0
 bus_remove_driver+0x74/0x100
 driver_unregister+0x34/0x60
 pci_unregister_driver+0x24/0xd8
 hibmc_pci_driver_exit+0x14/0xe768 [hibmc_drm]
 __arm64_sys_delete_module+0x1fc/0x2d0
 el0_svc_common.constprop.3+0xa8/0x188
 do_el0_svc+0x80/0xa0
 el0_sync_handler+0x8c/0xb0
 el0_sync+0x15c/0x180
Code: f940b400 b4ffff00 a903e7b8 f90013b5 (d4210000)
---[ end trace 310d94ee8abef44f ]---
Kernel panic - not syncing: Oops - BUG: Fatal exception

v2:
update the commit log to indicate the patch that needs to be revert.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 7e91ef1..9b5f15c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -251,6 +251,10 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 static int hibmc_unload(struct drm_device *dev)
 {
 	drm_atomic_helper_shutdown(dev);
+
+	if (dev->irq_enabled)
+		drm_irq_uninstall(dev);
+
 	pci_disable_msi(dev->pdev);
 
 	return 0;
@@ -286,7 +290,7 @@ static int hibmc_load(struct drm_device *dev)
 	if (ret) {
 		drm_warn(dev, "enabling MSI failed: %d\n", ret);
 	} else {
-		ret = devm_drm_irq_install(dev, dev->pdev->irq);
+		ret = drm_irq_install(dev, dev->pdev->irq);
 		if (ret)
 			drm_warn(dev, "install irq failed: %d\n", ret);
 	}
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
