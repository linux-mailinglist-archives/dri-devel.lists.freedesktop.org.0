Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F6BCC97B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC1910E3A2;
	Fri, 10 Oct 2025 10:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="HsHlnNcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1266 seconds by postgrey-1.36 at gabe;
 Fri, 10 Oct 2025 08:32:03 UTC
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com
 [113.46.200.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1016A10E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 08:32:03 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=pdS1EW9jcK370UHJoQR6CtbmqQ6PWXVjAxzle3L9Fds=;
 b=HsHlnNcYVhU624rtF4gVCBRGSm6QevKAjeAVyk+nDQh/iN3GmWQPRazFKi5w33JjEXhA28bKb
 HFsfw2YT28eVCDfozrAsMGB02Xfe5pWsquqwCgwhksFcHP/bkRgGYY1bWAGfYgKdcLVQIYjBbXy
 NStE2vFEpFFTLzzw+TXq3l0=
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cjg225DzWz1T4Fp;
 Fri, 10 Oct 2025 16:31:22 +0800 (CST)
Received: from dggpemf200018.china.huawei.com (unknown [7.185.36.31])
 by mail.maildlp.com (Postfix) with ESMTPS id 473731402C8;
 Fri, 10 Oct 2025 16:32:00 +0800 (CST)
Received: from huawei.com (10.50.85.135) by dggpemf200018.china.huawei.com
 (7.185.36.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Oct
 2025 16:31:59 +0800
From: Quanmin Yan <yanquanmin1@huawei.com>
To: <tzimmermann@suse.de>
CC: <simona@ffwll.ch>, <deller@gmx.de>, <linux-kernel@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <yanquanmin1@huawei.com>, <wangkefeng.wang@huawei.com>, <zuoze1@huawei.com>,
 <sunnanyong@huawei.com>
Subject: [PATCH v2] fbcon: Set fb_display[i]->mode to NULL when the mode is
 released
Date: Fri, 10 Oct 2025 16:16:59 +0800
Message-ID: <20251010081659.3609082-1-yanquanmin1@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.85.135]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf200018.china.huawei.com (7.185.36.31)
X-Mailman-Approved-At: Fri, 10 Oct 2025 10:47:10 +0000
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

Recently, we discovered the following issue through syzkaller:

BUG: KASAN: slab-use-after-free in fb_mode_is_equal+0x285/0x2f0
Read of size 4 at addr ff11000001b3c69c by task syz.xxx
...
Call Trace:
 <TASK>
 dump_stack_lvl+0xab/0xe0
 print_address_description.constprop.0+0x2c/0x390
 print_report+0xb9/0x280
 kasan_report+0xb8/0xf0
 fb_mode_is_equal+0x285/0x2f0
 fbcon_mode_deleted+0x129/0x180
 fb_set_var+0xe7f/0x11d0
 do_fb_ioctl+0x6a0/0x750
 fb_ioctl+0xe0/0x140
 __x64_sys_ioctl+0x193/0x210
 do_syscall_64+0x5f/0x9c0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Based on experimentation and analysis, during framebuffer unregistration,
only the memory of fb_info->modelist is freed, without setting the
corresponding fb_display[i]->mode to NULL for the freed modes. This leads
to UAF issues during subsequent accesses. Here's an example of reproduction
steps:
1. With /dev/fb0 already registered in the system, load a kernel module
   to register a new device /dev/fb1;
2. Set fb1's mode to the global fb_display[] array (via FBIOPUT_CON2FBMAP);
3. Switch console from fb to VGA (to allow normal rmmod of the ko);
4. Unload the kernel module, at this point fb1's modelist is freed, leaving
   a wild pointer in fb_display[];
5. Trigger the bug via system calls through fb0 attempting to delete a mode
   from fb0.

Add a check in do_unregister_framebuffer(): if the mode to be freed exists
in fb_display[], set the corresponding mode pointer to NULL.

Signed-off-by: Quanmin Yan <yanquanmin1@huawei.com>
---

Changes from v1
(https://lore.kernel.org/all/20250923110608.3385083-1-yanquanmin1@huawei.com/)
- Focus on fixing the issue specifically in the framebuffer unregistration
  path, as other paths do not encounter this problem.
- Adjusted according to Thomas's suggestions.

 drivers/video/fbdev/core/fbcon.c | 19 +++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c |  1 +
 include/linux/fbcon.h            |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 96cc9b389246..9bd3c3814b5c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2810,6 +2810,25 @@ int fbcon_mode_deleted(struct fb_info *info,
 	return found;
 }
 
+static void fbcon_delete_mode(struct fb_videomode *m)
+{
+	struct fbcon_display *p;
+
+	for (int i = first_fb_vc; i <= last_fb_vc; i++) {
+		p = &fb_display[i];
+		if (p->mode == m)
+			p->mode = NULL;
+	}
+}
+
+void fbcon_delete_modelist(struct list_head *head)
+{
+	struct fb_modelist *modelist;
+
+	list_for_each_entry(modelist, head, list)
+		fbcon_delete_mode(&modelist->mode);
+}
+
 #ifdef CONFIG_VT_HW_CONSOLE_BINDING
 static void fbcon_unbind(void)
 {
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 53f1719b1ae1..eff757ebbed1 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -544,6 +544,7 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 		fb_info->pixmap.addr = NULL;
 	}
 
+	fbcon_delete_modelist(&fb_info->modelist);
 	fb_destroy_modelist(&fb_info->modelist);
 	registered_fb[fb_info->node] = NULL;
 	num_registered_fb--;
diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
index 81f0e698acbf..f206370060e1 100644
--- a/include/linux/fbcon.h
+++ b/include/linux/fbcon.h
@@ -18,6 +18,7 @@ void fbcon_suspended(struct fb_info *info);
 void fbcon_resumed(struct fb_info *info);
 int fbcon_mode_deleted(struct fb_info *info,
 		       struct fb_videomode *mode);
+void fbcon_delete_modelist(struct list_head *head);
 void fbcon_new_modelist(struct fb_info *info);
 void fbcon_get_requirement(struct fb_info *info,
 			   struct fb_blit_caps *caps);
@@ -38,6 +39,7 @@ static inline void fbcon_suspended(struct fb_info *info) {}
 static inline void fbcon_resumed(struct fb_info *info) {}
 static inline int fbcon_mode_deleted(struct fb_info *info,
 				     struct fb_videomode *mode) { return 0; }
+static inline void fbcon_delete_modelist(struct list_head *head) {}
 static inline void fbcon_new_modelist(struct fb_info *info) {}
 static inline void fbcon_get_requirement(struct fb_info *info,
 					 struct fb_blit_caps *caps) {}
-- 
2.43.0

