Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55522C6296
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D0C6EB9B;
	Fri, 27 Nov 2020 10:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5936EB65
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 09:39:53 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cj8jC4pSwzhjJL;
 Fri, 27 Nov 2020 17:39:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Nov 2020 17:39:39 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/dev: Fix NULL pointer dereference in drm_minor_alloc
Date: Fri, 27 Nov 2020 17:43:55 +0800
Message-ID: <20201127094355.120520-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 0 PID: 18491 Comm: syz-executor.0 Tainted: G C 5.10.0-rc4+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1 04/01/2014
RIP: 0010:kobject_put+0x2f/0x140
Call Trace:
put_device+0x20/0x40
drm_minor_alloc_release+0x60/0xe0 [drm]
drm_managed_release+0x1b6/0x440 [drm]
drm_dev_init+0x50b/0x8e0 [drm]
__devm_drm_dev_alloc+0x50/0x160 [drm]
vgem_init+0x15c/0x1000 [vgem]
do_one_initcall+0x149/0x7e0
do_init_module+0x1ef/0x700
load_module+0x3467/0x4140
__do_sys_finit_module+0x10d/0x1a0
do_syscall_64+0x34/0x80
entry_SYSCALL_64_after_hwframe+0x44/0xa9

kfree(minor->kdev) in put_device would raise a null-ptr-deref bug when
minor->kdev is null or error pointer. So do check before put_device in
drm_minor_alloc_release and prohibit minor->kdev becoming an error pointer.

Fixes: f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/drm_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cd162d406..c253d3cd4 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -100,7 +100,8 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 
 	WARN_ON(dev != minor->dev);
 
-	put_device(minor->kdev);
+	if (minor->kdev)
+		put_device(minor->kdev);
 
 	spin_lock_irqsave(&drm_minor_lock, flags);
 	idr_remove(&drm_minors_idr, minor->index);
@@ -140,8 +141,11 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 		return r;
 
 	minor->kdev = drm_sysfs_minor_alloc(minor);
-	if (IS_ERR(minor->kdev))
-		return PTR_ERR(minor->kdev);
+	if (IS_ERR(minor->kdev)) {
+		r = PTR_ERR(minor->kdev);
+		minor->kdev = NULL;
+		return r;
+	}
 
 	*drm_minor_get_slot(dev, type) = minor;
 	return 0;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
