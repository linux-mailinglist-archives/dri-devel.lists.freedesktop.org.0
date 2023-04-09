Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB06DBFF7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 15:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713B10E184;
	Sun,  9 Apr 2023 13:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id B135D10E184
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 13:21:16 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:37240.250830095
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 183631001F8;
 Sun,  9 Apr 2023 21:21:13 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 dcd59a4b78b04d9ea815ada68b5e12f9 for maarten.lankhorst@linux.intel.com; 
 Sun, 09 Apr 2023 21:21:14 CST
X-Transaction-ID: dcd59a4b78b04d9ea815ada68b5e12f9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Date: Sun,  9 Apr 2023 21:21:10 +0800
Message-Id: <20230409132110.494630-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

We should setting the screen buffer size according to the screen's actual
size, rather than the size of the GEM object backing the front framebuffer.
The size of GEM buffer is page size aligned, while the size of active area
of a specific screen is *NOT* necessarily page size aliged. For example,
1680x1050, 1600x900, 1440x900, 800x6000 etc. In those case, the damage rect
computed by drm_fb_helper_memory_range_to_clip() goes out of bottom bounds
of the display.

Run fbdev test of IGT on a x86+ast2400 platform with 1680x1050 resolution
will cause the system hang with the following call trace:

  Oops: 0000 [#1] PREEMPT SMP PTI
  [IGT] fbdev: starting subtest eof
  Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
  [IGT] fbdev: starting subtest nullptr

  RIP: 0010:memcpy_erms+0xa/0x20
  RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
  RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
  RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
  RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
  R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
  R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
  FS:  0000000000000000(0000) GS:ffff895257380000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
  Call Trace:
   <TASK>
   ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
   drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
   process_one_work+0x21f/0x430
   worker_thread+0x4e/0x3c0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xf4/0x120
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x2c/0x50
   </TASK>
  CR2: ffffa17d40e0b000
  ---[ end trace 0000000000000000 ]---

We also add trival code in this patch to restrict the damage rect beyond
the last line of the framebuffer.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/drm_fb_helper.c     | 2 +-
 drivers/gpu/drm/drm_fbdev_generic.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 64458982be40..a2b749372759 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -645,7 +645,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 	u32 x1 = 0;
 	u32 y1 = off / info->fix.line_length;
 	u32 x2 = info->var.xres;
-	u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
+	u32 y2 = min_t(u32, DIV_ROUND_UP(end, info->fix.line_length), info->var.yres);
 
 	if ((y2 - y1) == 1) {
 		/*
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 8e5148bf40bb..a6daecb5f640 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -95,6 +95,8 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->fb = buffer->fb;
 
 	screen_size = buffer->gem->size;
+	screen_size = sizes->surface_height * buffer->fb->pitches[0];
+
 	screen_buffer = vzalloc(screen_size);
 	if (!screen_buffer) {
 		ret = -ENOMEM;
-- 
2.25.1

