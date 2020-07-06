Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E107421675D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC766E5BB;
	Tue,  7 Jul 2020 07:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D456B89F85
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 14:54:00 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 57FE0F2D4B30F8383611;
 Mon,  6 Jul 2020 22:47:30 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.226) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 6 Jul 2020 22:47:23 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon/hibmc: Move drm_fbdev_generic_setup() down to
 avoid the splat
Date: Mon, 6 Jul 2020 22:47:13 +0800
Message-ID: <20200706144713.1123-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: tzimmermann@suse.de, xinliang.liu@linaro.org, puck.chen@hisilicon.com,
 Zenghui Yu <yuzenghui@huawei.com>, airlied@linux.ie,
 kong.kongxinwei@hisilicon.com, zourongrong@gmail.com,
 wanghaibin.wang@huawei.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HiSilicon hibmc driver triggers a splat at boot time as below

[   14.137806] ------------[ cut here ]------------
[   14.142405] hibmc-drm 0000:0a:00.0: Device has not been registered.
[   14.148661] WARNING: CPU: 0 PID: 496 at drivers/gpu/drm/drm_fb_helper.c:2233 drm_fbdev_generic_setup+0x15c/0x1b8
[   14.158787] [...]
[   14.278307] Call trace:
[   14.280742]  drm_fbdev_generic_setup+0x15c/0x1b8
[   14.285337]  hibmc_pci_probe+0x354/0x418
[   14.289242]  local_pci_probe+0x44/0x98
[   14.292974]  work_for_cpu_fn+0x20/0x30
[   14.296708]  process_one_work+0x1c4/0x4e0
[   14.300698]  worker_thread+0x2c8/0x528
[   14.304431]  kthread+0x138/0x140
[   14.307646]  ret_from_fork+0x10/0x18
[   14.311205] ---[ end trace a2000ec2d838af4d ]---

This turned out to be due to the fbdev device hasn't been registered when
drm_fbdev_generic_setup() is invoked. Let's fix the splat by moving it down
after drm_dev_register() which will follow the "Display driver example"
documented by commit de99f0600a79 ("drm/drv: DOC: Add driver example
code").

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index a6fd0c29e5b8..544b9993c99e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -307,8 +307,6 @@ static int hibmc_load(struct drm_device *dev)
 	/* reset all the states of crtc/plane/encoder/connector */
 	drm_mode_config_reset(dev);
 
-	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
-
 	return 0;
 
 err:
@@ -355,6 +353,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 			  ret);
 		goto err_unload;
 	}
+
+	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+
 	return 0;
 
 err_unload:
-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
