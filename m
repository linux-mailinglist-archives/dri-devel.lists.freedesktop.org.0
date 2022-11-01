Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C36144D9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 07:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24EB10E17F;
	Tue,  1 Nov 2022 06:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACF1886A4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 06:54:28 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N1gfX6RvtzJnL7;
 Tue,  1 Nov 2022 14:51:32 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 14:54:25 +0800
From: Yuan Can <yuancan@huawei.com>
To: <rodrigosiqueiramelo@gmail.com>, <melissa.srw@gmail.com>,
 <hamohammed.sa@gmail.com>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <seanpaul@chromium.org>, <sylphrenadin@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/vkms: Fix memory leak in vkms_init()
Date: Tue, 1 Nov 2022 06:51:55 +0000
Message-ID: <20221101065156.41584-2-yuancan@huawei.com>
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

A memory leak was reported after the vkms module install failed.

unreferenced object 0xffff88810bc28520 (size 16):
  comm "modprobe", pid 9662, jiffies 4298009455 (age 42.590s)
  hex dump (first 16 bytes):
    01 01 00 64 81 88 ff ff 00 00 dc 0a 81 88 ff ff  ...d............
  backtrace:
    [<00000000e7561ff8>] kmalloc_trace+0x27/0x60
    [<000000000b1954a0>] 0xffffffffc45200a9
    [<00000000abbf1da0>] do_one_initcall+0xd0/0x4f0
    [<000000001505ee87>] do_init_module+0x1a4/0x680
    [<00000000958079ad>] load_module+0x6249/0x7110
    [<00000000117e4696>] __do_sys_finit_module+0x140/0x200
    [<00000000f74b12d2>] do_syscall_64+0x35/0x80
    [<000000008fc6fcde>] entry_SYSCALL_64_after_hwframe+0x46/0xb0

The reason is that the vkms_init() returns without checking the return
value of vkms_create(), and if the vkms_create() failed, the config
allocated at the beginning of vkms_init() is leaked.

 vkms_init()
   config = kmalloc(...) # config allocated
   ...
   return vkms_create() # vkms_create failed and config is leaked

Fix this problem by checking return value of vkms_create() and free the
config if error happened.

Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..dfe983eaa07f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -218,6 +218,7 @@ static int vkms_create(struct vkms_config *config)
 
 static int __init vkms_init(void)
 {
+	int ret;
 	struct vkms_config *config;
 
 	config = kmalloc(sizeof(*config), GFP_KERNEL);
@@ -230,7 +231,11 @@ static int __init vkms_init(void)
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
 
-	return vkms_create(config);
+	ret = vkms_create(config);
+	if (ret)
+		kfree(config);
+
+	return ret;
 }
 
 static void vkms_destroy(struct vkms_config *config)
-- 
2.17.1

