Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4006145FE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9971610E320;
	Tue,  1 Nov 2022 08:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B09610E18B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 07:08:27 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N1h1y2mpqz15MFB;
 Tue,  1 Nov 2022 15:08:22 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 15:08:23 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <sam@ravnborg.org>, <lyude@redhat.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/drv: Fix potential memory leak in drm_dev_init()
Date: Tue, 1 Nov 2022 15:07:15 +0800
Message-ID: <20221101070716.9189-2-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221101070716.9189-1-shangxiaojing@huawei.com>
References: <20221101070716.9189-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Nov 2022 08:48:29 +0000
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

drm_dev_init() will add drm_dev_init_release() as a callback. When
drmm_add_action() failed, the release function won't be added. As the
result, the ref cnt added by device_get() in drm_dev_init() won't be put
by drm_dev_init_release(), which leads to the memleak. Use
drmm_add_action_or_reset() instead of drmm_add_action() to prevent
memleak.

unreferenced object 0xffff88810bc0c800 (size 2048):
  comm "modprobe", pid 8322, jiffies 4305809845 (age 15.292s)
  hex dump (first 32 bytes):
    e8 cc c0 0b 81 88 ff ff ff ff ff ff 00 00 00 00  ................
    20 24 3c 0c 81 88 ff ff 18 c8 c0 0b 81 88 ff ff   $<.............
  backtrace:
    [<000000007251f72d>] __kmalloc+0x4b/0x1c0
    [<0000000045f21f26>] platform_device_alloc+0x2d/0xe0
    [<000000004452a479>] platform_device_register_full+0x24/0x1c0
    [<0000000089f4ea61>] 0xffffffffa0736051
    [<00000000235b2441>] do_one_initcall+0x7a/0x380
    [<0000000001a4a177>] do_init_module+0x5c/0x230
    [<000000002bf8a8e2>] load_module+0x227d/0x2420
    [<00000000637d6d0a>] __do_sys_finit_module+0xd5/0x140
    [<00000000c99fc324>] do_syscall_64+0x3f/0x90
    [<000000004d85aa77>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

Fixes: 2cbf7fc6718b ("drm: Use drmm_ for drm_dev_init cleanup")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index e3a1243dd2ae..b2c2a5872621 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -616,7 +616,7 @@ static int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
 
-	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
+	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
 	if (ret)
 		return ret;
 
-- 
2.17.1

