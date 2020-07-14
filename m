Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5021EB73
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0550F6E180;
	Tue, 14 Jul 2020 08:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5980C6E178
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84C91AD4B;
 Tue, 14 Jul 2020 08:32:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, jiayang5@huawei.com,
 butterflyhuangxx@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/3] drm: fix double free for gbo in drm_gem_vram_init and
 drm_gem_vram_create
Date: Tue, 14 Jul 2020 10:32:36 +0200
Message-Id: <20200714083238.28479-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714083238.28479-1-tzimmermann@suse.de>
References: <20200714083238.28479-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Hulk Robot <hulkci@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jia Yang <jiayang5@huawei.com>

I got a use-after-free report when doing some fuzz test:

If ttm_bo_init() fails, the "gbo" and "gbo->bo.base" will be
freed by ttm_buffer_object_destroy() in ttm_bo_init(). But
then drm_gem_vram_create() and drm_gem_vram_init() will free
"gbo" and "gbo->bo.base" again.

BUG: KMSAN: use-after-free in drm_vma_offset_remove+0xb3/0x150
CPU: 0 PID: 24282 Comm: syz-executor.1 Tainted: G    B   W         5.7.0-rc4-msan #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014
Call Trace:
 __dump_stack
 dump_stack+0x1c9/0x220
 kmsan_report+0xf7/0x1e0
 __msan_warning+0x58/0xa0
 drm_vma_offset_remove+0xb3/0x150
 drm_gem_free_mmap_offset
 drm_gem_object_release+0x159/0x180
 drm_gem_vram_init
 drm_gem_vram_create+0x7c5/0x990
 drm_gem_vram_fill_create_dumb
 drm_gem_vram_driver_dumb_create+0x238/0x590
 drm_mode_create_dumb
 drm_mode_create_dumb_ioctl+0x41d/0x450
 drm_ioctl_kernel+0x5a4/0x710
 drm_ioctl+0xc6f/0x1240
 vfs_ioctl
 ksys_ioctl
 __do_sys_ioctl
 __se_sys_ioctl+0x2e9/0x410
 __x64_sys_ioctl+0x4a/0x70
 do_syscall_64+0xb8/0x160
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x4689b9
Code: fd e0 fa ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 cb e0 fa ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f368fa4dc98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000076bf00 RCX: 00000000004689b9
RDX: 0000000020000240 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00000000004d17e0 R14: 00007f368fa4e6d4 R15: 000000000076bf0c

Uninit was created at:
 kmsan_save_stack_with_flags
 kmsan_internal_poison_shadow+0x66/0xd0
 kmsan_slab_free+0x6e/0xb0
 slab_free_freelist_hook
 slab_free
 kfree+0x571/0x30a0
 drm_gem_vram_destroy
 ttm_buffer_object_destroy+0xc8/0x130
 ttm_bo_release
 kref_put
 ttm_bo_put+0x117d/0x23e0
 ttm_bo_init_reserved+0x11c0/0x11d0
 ttm_bo_init+0x289/0x3f0
 drm_gem_vram_init
 drm_gem_vram_create+0x775/0x990
 drm_gem_vram_fill_create_dumb
 drm_gem_vram_driver_dumb_create+0x238/0x590
 drm_mode_create_dumb
 drm_mode_create_dumb_ioctl+0x41d/0x450
 drm_ioctl_kernel+0x5a4/0x710
 drm_ioctl+0xc6f/0x1240
 vfs_ioctl
 ksys_ioctl
 __do_sys_ioctl
 __se_sys_ioctl+0x2e9/0x410
 __x64_sys_ioctl+0x4a/0x70
 do_syscall_64+0xb8/0x160
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

If ttm_bo_init() fails, the "gbo" will be freed by
ttm_buffer_object_destroy() in ttm_bo_init(). But then
drm_gem_vram_create() and drm_gem_vram_init() will free
"gbo" again.

Reported-by: Hulk Robot <hulkci@huawei.com>
Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Signed-off-by: Jia Yang <jiayang5@huawei.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 28 +++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index ad096600d89f..8dfb7458a34b 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -175,6 +175,10 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	}
 }
 
+/*
+ * Note that on error, drm_gem_vram_init will free the buffer object.
+ */
+
 static int drm_gem_vram_init(struct drm_device *dev,
 			     struct drm_gem_vram_object *gbo,
 			     size_t size, unsigned long pg_align)
@@ -184,15 +188,19 @@ static int drm_gem_vram_init(struct drm_device *dev,
 	int ret;
 	size_t acc_size;
 
-	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
+	if (WARN_ONCE(!vmm, "VRAM MM not initialized")) {
+		kfree(gbo);
 		return -EINVAL;
+	}
 	bdev = &vmm->bdev;
 
 	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
 
 	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
-	if (ret)
+	if (ret) {
+		kfree(gbo);
 		return ret;
+	}
 
 	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
 
@@ -203,13 +211,13 @@ static int drm_gem_vram_init(struct drm_device *dev,
 			  &gbo->placement, pg_align, false, acc_size,
 			  NULL, NULL, ttm_buffer_object_destroy);
 	if (ret)
-		goto err_drm_gem_object_release;
+		/*
+		 * A failing ttm_bo_init will call ttm_buffer_object_destroy
+		 * to release gbo->bo.base and kfree gbo.
+		 */
+		return ret;
 
 	return 0;
-
-err_drm_gem_object_release:
-	drm_gem_object_release(&gbo->bo.base);
-	return ret;
 }
 
 /**
@@ -243,13 +251,9 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 
 	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
 	if (ret < 0)
-		goto err_kfree;
+		return ERR_PTR(ret);
 
 	return gbo;
-
-err_kfree:
-	kfree(gbo);
-	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL(drm_gem_vram_create);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
