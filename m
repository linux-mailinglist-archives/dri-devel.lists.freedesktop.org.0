Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E136144D7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 07:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B245810E16C;
	Tue,  1 Nov 2022 06:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9AB88FBD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 06:54:28 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N1gjr3mxMz15MBv;
 Tue,  1 Nov 2022 14:54:24 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 14:54:25 +0800
From: Yuan Can <yuancan@huawei.com>
To: <rodrigosiqueiramelo@gmail.com>, <melissa.srw@gmail.com>,
 <hamohammed.sa@gmail.com>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <seanpaul@chromium.org>, <sylphrenadin@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/vkms: Fix null-ptr-deref in vkms_release()
Date: Tue, 1 Nov 2022 06:51:56 +0000
Message-ID: <20221101065156.41584-3-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221101065156.41584-1-yuancan@huawei.com>
References: <20221101065156.41584-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Cc: yuancan@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A null-ptr-deref is triggered when it tries to destroy the workqueue in
vkms->output.composer_workq in vkms_release().

 KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
 CPU: 5 PID: 17193 Comm: modprobe Not tainted 6.0.0-11331-gd465bff130bf #24
 RIP: 0010:destroy_workqueue+0x2f/0x710
 ...
 Call Trace:
  <TASK>
  ? vkms_config_debugfs_init+0x50/0x50 [vkms]
  __devm_drm_dev_alloc+0x15a/0x1c0 [drm]
  vkms_init+0x245/0x1000 [vkms]
  do_one_initcall+0xd0/0x4f0
  do_init_module+0x1a4/0x680
  load_module+0x6249/0x7110
  __do_sys_finit_module+0x140/0x200
  do_syscall_64+0x35/0x80
  entry_SYSCALL_64_after_hwframe+0x46/0xb0

The reason is that an OOM happened which triggers the destroy of the
workqueue, however, the workqueue is alloced in the later process,
thus a null-ptr-deref happened. A simple call graph is shown as below:

 vkms_init()
  vkms_create()
    devm_drm_dev_alloc()
      __devm_drm_dev_alloc()
        devm_drm_dev_init()
          devm_add_action_or_reset()
            devm_add_action() # an error happened
            devm_drm_dev_init_release()
              drm_dev_put()
                kref_put()
                  drm_dev_release()
                    vkms_release()
                      destroy_workqueue() # null-ptr-deref happened
    vkms_modeset_init()
      vkms_output_init()
        vkms_crtc_init() # where the workqueue get allocated

Fix this by checking if composer_workq is NULL before passing it to
the destroy_workqueue() in vkms_release().

Fixes: 6c234fe37c57 ("drm/vkms: Implement CRC debugfs API")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dfe983eaa07f..f716c5796f5f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -57,7 +57,8 @@ static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
 
-	destroy_workqueue(vkms->output.composer_workq);
+	if (vkms->output.composer_workq)
+		destroy_workqueue(vkms->output.composer_workq);
 }
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
-- 
2.17.1

