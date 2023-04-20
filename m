Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D946E885A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 05:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1675A10EB5F;
	Thu, 20 Apr 2023 03:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9674510EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 03:05:07 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxIk7gq0BkdEMfAA--.48519S3;
 Thu, 20 Apr 2023 11:05:04 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id AQAAf8CxKLLeq0Bkc3AwAA--.68S2;
 Thu, 20 Apr 2023 11:05:02 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds access
Date: Thu, 20 Apr 2023 11:05:00 +0800
Message-Id: <20230420030500.1578756-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxKLLeq0Bkc3AwAA--.68S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF15Kr1fuF1kKw43Aw1UJrb_yoWrKF4fpa
 y7Ga1UKrsYqF1DWrW7A3WrAw15Wan7AFyIgr97G342vF43A3Z29FyUKF4jgFy5Jr1fZr1a
 qws09w1I9r12kaUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bSkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
 M2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
 CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2
 z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
 0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCI
 bckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
 JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUUU==
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

The fbdev test of IGT may write after EOF, which lead to out-of-bound
access for drm drivers hire fbdev-generic. For example, run fbdev test
on a x86+ast2400 platform, with 1680x1050 resolution, will cause the
linux kernel hang with the following call trace:

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

The is because damage rectangles computed by
drm_fb_helper_memory_range_to_clip() function does not guaranteed to be
bound in the screen's active display area. Possible reasons are:

1) Buffers are allocated in the granularity of page size, for mmap system
   call support. The shadow screen buffer consumed by fbdev emulation may
   also choosed be page size aligned.

2) The DIV_ROUND_UP() used in drm_fb_helper_memory_range_to_clip()
   will introduce off-by-one error.

For example, on a 16KB page size system, in order to store a 1920x1080
XRGB framebuffer, we need allocate 507 pages. Unfortunately, the size
1920*1080*4 can not be divided exactly by 16KB.

 1920 * 1080 * 4 = 8294400 bytes
 506 * 16 * 1024 = 8290304 bytes
 507 * 16 * 1024 = 8306688 bytes

 line_length = 1920*4 = 7680 bytes

 507 * 16 * 1024 / 7680 = 1081.6

 off / line_length = 507 * 16 * 1024 / 7680 = 1081
 DIV_ROUND_UP(507 * 16 * 1024, 7680) will yeild 1082

memcpy_toio() typically issue the copy line by line, when copy the last
line, out-of-bound access will be happen. Because:

 1082 * line_length = 1082 * 7680 = 8309760, and 8309760 > 8306688

Note that userspace may stil write to the invisiable area if a larger
buffer than width x stride is exposed. But it is not a big issue as
long as there still have memory resolve the access if not drafting so
far.

 - Also limit the y1 (Daniel)
 - keep fix patch it to minimal (Daniel)
 - screen_size is page size aligned because of it need mmap (Thomas)
 - Adding fixes tag (Thomas)

Fixes: aa15c677cc34 ("drm/fb-helper: Fix vertical damage clipping")

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/dri-devel/ad44df29-3241-0d9e-e708-b0338bf3c623@189.cn/
---
 drivers/gpu/drm/drm_fb_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 64458982be40..6bb1b8b27d7a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -641,19 +641,27 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
 					       struct drm_rect *clip)
 {
+	u32 line_length = info->fix.line_length;
+	u32 fb_height = info->var.yres;
 	off_t end = off + len;
 	u32 x1 = 0;
-	u32 y1 = off / info->fix.line_length;
+	u32 y1 = off / line_length;
 	u32 x2 = info->var.xres;
-	u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
+	u32 y2 = DIV_ROUND_UP(end, line_length);
+
+	/* Don't allow any of them beyond the bottom bound of display area */
+	if (y1 > fb_height)
+		y1 = fb_height;
+	if (y2 > fb_height)
+		y2 = fb_height;
 
 	if ((y2 - y1) == 1) {
 		/*
 		 * We've only written to a single scanline. Try to reduce
 		 * the number of horizontal pixels that need an update.
 		 */
-		off_t bit_off = (off % info->fix.line_length) * 8;
-		off_t bit_end = (end % info->fix.line_length) * 8;
+		off_t bit_off = (off % line_length) * 8;
+		off_t bit_end = (end % line_length) * 8;
 
 		x1 = bit_off / info->var.bits_per_pixel;
 		x2 = DIV_ROUND_UP(bit_end, info->var.bits_per_pixel);
-- 
2.25.1

