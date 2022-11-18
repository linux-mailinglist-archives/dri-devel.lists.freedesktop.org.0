Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC662EBCF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 03:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAF610E6E1;
	Fri, 18 Nov 2022 02:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED8810E6E1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 02:18:30 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ND0n64ZsbzmVrs;
 Fri, 18 Nov 2022 10:18:02 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 10:18:26 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Fix potential null-ptr-deref due to
 drmm_mode_config_init()
Date: Fri, 18 Nov 2022 10:16:51 +0800
Message-ID: <20221118021651.2460-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
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
Cc: shangxiaojing@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drmm_mode_config_init() will call drm_mode_create_standard_properties()
and won't check the ret value. When drm_mode_create_standard_properties()
failed due to alloc, property will be a NULL pointer and may causes the
null-ptr-deref. Fix the null-ptr-deref by adding the ret value check.

Found null-ptr-deref while testing insert module bochs:
general protection fault, probably for non-canonical address
    0xdffffc000000000c: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
CPU: 3 PID: 249 Comm: modprobe Not tainted 6.1.0-rc1+ #364
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
RIP: 0010:drm_object_attach_property+0x73/0x3c0 [drm]
Call Trace:
 <TASK>
 __drm_connector_init+0xb6c/0x1100 [drm]
 bochs_pci_probe.cold.11+0x4cb/0x7fe [bochs]
 pci_device_probe+0x17d/0x340
 really_probe+0x1db/0x5d0
 __driver_probe_device+0x1e7/0x250
 driver_probe_device+0x4a/0x120
 __driver_attach+0xcd/0x2c0
 bus_for_each_dev+0x11a/0x1b0
 bus_add_driver+0x3d7/0x500
 driver_register+0x18e/0x320
 do_one_initcall+0xc4/0x3e0
 do_init_module+0x1b4/0x630
 load_module+0x5dca/0x7230
 __do_sys_finit_module+0x100/0x170
 do_syscall_64+0x3f/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff65af9f839

Fixes: 6b4959f43a04 ("drm/atomic: atomic plane properties")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/gpu/drm/drm_mode_config.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 939d621c9ad4..141a5b4042b2 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -402,6 +402,8 @@ static void drm_mode_config_init_release(struct drm_device *dev, void *ptr)
  */
 int drmm_mode_config_init(struct drm_device *dev)
 {
+	int ret;
+
 	mutex_init(&dev->mode_config.mutex);
 	drm_modeset_lock_init(&dev->mode_config.connection_mutex);
 	mutex_init(&dev->mode_config.idr_mutex);
@@ -423,7 +425,11 @@ int drmm_mode_config_init(struct drm_device *dev)
 	init_llist_head(&dev->mode_config.connector_free_list);
 	INIT_WORK(&dev->mode_config.connector_free_work, drm_connector_free_work_fn);
 
-	drm_mode_create_standard_properties(dev);
+	ret = drm_mode_create_standard_properties(dev);
+	if (ret) {
+		drm_mode_config_cleanup(dev);
+		return ret;
+	}
 
 	/* Just to be sure */
 	dev->mode_config.num_fb = 0;
-- 
2.17.1

