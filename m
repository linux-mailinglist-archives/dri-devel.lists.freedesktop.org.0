Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0D89D06D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 04:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735C7112A56;
	Tue,  9 Apr 2024 02:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2E8112A56
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 02:35:23 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VD93V5cBtztS6L;
 Tue,  9 Apr 2024 10:32:38 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
 by mail.maildlp.com (Postfix) with ESMTPS id 780AA140118;
 Tue,  9 Apr 2024 10:35:20 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 9 Apr
 2024 10:35:19 +0800
From: Guo Mengqi <guomengqi3@huawei.com>
To: <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <stable@vger.kernel.org>, <xuqiang36@huawei.com>,
 <zhangchangzhong@huawei.com>, <greg@kroah.com>
CC: <guomengqi3@huawei.com>
Subject: [PATCH 5.4.y] drm/vkms: call drm_atomic_helper_shutdown before
 drm_dev_put()
Date: Tue, 9 Apr 2024 10:26:47 +0800
Message-ID: <20240409022647.1821-1-guomengqi3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
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

commit 73a82b22963d ("drm/atomic: Fix potential use-after-free
in nonblocking commits") introduced drm_dev_get/put() to
drm_atomic_helper_shutdown(). And this cause problem in vkms driver exit
process.

vkms_exit()
  drm_dev_put()
    vkms_release()
      drm_atomic_helper_shutdown()
        drm_dev_get()
        drm_dev_put()
          vkms_release()    ------ use after free

Using 5.4 stable x86 image on qemu, below stacktrace can be triggered by
load and unload vkms.ko.

root:~ # insmod vkms.ko
[   76.957802] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   76.961490] [drm] Driver supports precise vblank timestamp query.
[   76.964416] [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 0
root:~ # rmmod vkms.ko
[   79.650202] refcount_t: addition on 0; use-after-free.
[   79.650249] WARNING: CPU: 2 PID: 3533 at ../lib/refcount.c:25 refcount_warn_saturate+0xcf/0xf0
[   79.654241] Modules linked in: vkms(-)
[   79.654249] CPU: 2 PID: 3533 Comm: rmmod Not tainted 5.4.273 #4
[   79.654251] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
[   79.654262] RIP: 0010:refcount_warn_saturate+0xcf/0xf0
...
[   79.654296] Call Trace:
[   79.654462]  ? __warn+0x80/0xd0
[   79.654473]  ? refcount_warn_saturate+0xcf/0xf0
[   79.654481]  ? report_bug+0xb6/0x130
[   79.654484]  ? refcount_warn_saturate+0xcf/0xf0
[   79.654489]  ? fixup_bug.part.12+0x13/0x30
[   79.654492]  ? do_error_trap+0x90/0xb0
[   79.654495]  ? do_invalid_op+0x31/0x40
[   79.654497]  ? refcount_warn_saturate+0xcf/0xf0
[   79.654504]  ? invalid_op+0x1e/0x30
[   79.654508]  ? refcount_warn_saturate+0xcf/0xf0
[   79.654516]  drm_atomic_state_init+0x68/0xb0
[   79.654543]  drm_atomic_state_alloc+0x43/0x60
[   79.654551]  drm_atomic_helper_disable_all+0x13/0x180
[   79.654562]  drm_atomic_helper_shutdown+0x5f/0xb0
[   79.654571]  vkms_release+0x18/0x40 [vkms]
[   79.654575]  vkms_exit+0x29/0xc00 [vkms]
[   79.654582]  __x64_sys_delete_module+0x155/0x220
[   79.654592]  do_syscall_64+0x43/0x120
[   79.654603]  entry_SYSCALL_64_after_hwframe+0x5c/0xc1
[   79.654619] ---[ end trace ce0c02f57ea6bf73 ]---

It seems that the proper unload sequence is:
	drm_atomic_helper_shutdown();
	drm_dev_put();

Just put drm_atomic_helper_shutdown() before drm_dev_put()
should solve the problem.

Note that vkms exit code is refactored by commit 53d77aaa3f76
("drm/vkms: Use devm_drm_dev_alloc") in tags/v5.10-rc1.

So this bug only exists on 4.19 and 5.4.

Fixes: 380c7ceabdde ("drm/atomic: Fix potential use-after-free in nonblocking commits")
Fixes: 2ead1be54b22 ("drm/vkms: Fix connector leak at the module removal")
Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 44ab9f8ef8be..86043d7c0e4b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -60,7 +60,6 @@ static void vkms_release(struct drm_device *dev)
 	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
 
 	platform_device_unregister(vkms->platform);
-	drm_atomic_helper_shutdown(&vkms->drm);
 	drm_mode_config_cleanup(&vkms->drm);
 	drm_dev_fini(&vkms->drm);
 	destroy_workqueue(vkms->output.composer_workq);
@@ -194,6 +193,7 @@ static void __exit vkms_exit(void)
 	}
 
 	drm_dev_unregister(&vkms_device->drm);
+	drm_atomic_helper_shutdown(&vkms_device->drm);
 	drm_dev_put(&vkms_device->drm);
 
 	kfree(vkms_device);
-- 
2.17.1

