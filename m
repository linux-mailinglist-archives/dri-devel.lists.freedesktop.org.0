Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A622DA8F3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B897F89C69;
	Tue, 15 Dec 2020 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34FA6E169
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 10:32:49 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cvd49519tz15dtT;
 Mon, 14 Dec 2020 18:32:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 18:32:43 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>
Subject: [PATCH] drm/hisilicon: Fix use-after-free
Date: Mon, 14 Dec 2020 18:32:53 +0800
Message-ID: <1607941973-32287-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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

Fix the problem of dev being released twice.
------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 75 PID: 15700 at lib/refcount.c:28 refcount_warn_saturate+0xd4/0x150
CPU: 75 PID: 15700 Comm: rmmod Tainted: G            E     5.10.0-rc3+ #3
Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDDA, BIOS 0.88 07/24/2019
pstate: 40400009 (nZcv daif +PAN -UAO -TCO BTYPE=--)
pc : refcount_warn_saturate+0xd4/0x150
lr : refcount_warn_saturate+0xd4/0x150
sp : ffff2028150cbc00
x29: ffff2028150cbc00 x28: ffff2028150121c0
x27: 0000000000000000 x26: 0000000000000000
x25: 0000000000000000 x24: 0000000000000003
x23: 0000000000000000 x22: ffff2028150cbc90
x21: ffff2020038a30a8 x20: ffff2028150cbc90
x19: ffff0020cd938020 x18: 0000000000000010
x17: 0000000000000000 x16: 0000000000000000
x15: ffffffffffffffff x14: ffff2028950cb88f
x13: ffff2028150cb89d x12: 0000000000000000
x11: 0000000005f5e0ff x10: ffff2028150cb800
x9 : 00000000ffffffd0 x8 : 75203b776f6c6672
x7 : ffff800011a6f7c8 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000000
x3 : 0000000000000000 x2 : ffff202ffe2f9dc0
x1 : ffffa02fecf40000 x0 : 0000000000000026
Call trace:
 refcount_warn_saturate+0xd4/0x150
 devm_drm_dev_init_release+0x50/0x70
 devm_action_release+0x20/0x30
 release_nodes+0x13c/0x218
 devres_release_all+0x80/0x170
 device_release_driver_internal+0x128/0x1f0
 driver_detach+0x6c/0xe0
 bus_remove_driver+0x74/0x100
 driver_unregister+0x34/0x60
 pci_unregister_driver+0x24/0xd8
 hibmc_pci_driver_exit+0x14/0xe858 [hibmc_drm]
 __arm64_sys_delete_module+0x1fc/0x2d0
 el0_svc_common.constprop.3+0xa8/0x188
 do_el0_svc+0x80/0xa0
 el0_sync_handler+0x8c/0xb0
 el0_sync+0x15c/0x180
CPU: 75 PID: 15700 Comm: rmmod Tainted: G            E     5.10.0-rc3+ #3
Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDDA, BIOS 0.88 07/24/2019
Call trace:
 dump_backtrace+0x0/0x208
 show_stack+0x2c/0x40
 dump_stack+0xd8/0x10c
 __warn+0xac/0x128
 report_bug+0xcc/0x180
 bug_handler+0x24/0x78
 call_break_hook+0x80/0xa0
 brk_handler+0x28/0x68
 do_debug_exception+0x9c/0x148
 el1_sync_handler+0x7c/0x128
 el1_sync+0x80/0x100
 refcount_warn_saturate+0xd4/0x150
 devm_drm_dev_init_release+0x50/0x70
 devm_action_release+0x20/0x30
 release_nodes+0x13c/0x218
 devres_release_all+0x80/0x170
 device_release_driver_internal+0x128/0x1f0
 driver_detach+0x6c/0xe0
 bus_remove_driver+0x74/0x100
 driver_unregister+0x34/0x60
 pci_unregister_driver+0x24/0xd8
 hibmc_pci_driver_exit+0x14/0xe858 [hibmc_drm]
 __arm64_sys_delete_module+0x1fc/0x2d0
 el0_svc_common.constprop.3+0xa8/0x188
 do_el0_svc+0x80/0xa0
 el0_sync_handler+0x8c/0xb0
 el0_sync+0x15c/0x180
---[ end trace 00718630d6e5ff18 ]---

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 7e91ef1..e3ab765b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -364,7 +364,6 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
 
 	drm_dev_unregister(dev);
 	hibmc_unload(dev);
-	drm_dev_put(dev);
 }
 
 static const struct pci_device_id hibmc_pci_table[] = {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
