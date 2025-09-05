Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35339B47813
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5A10E40A;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1084 seconds by postgrey-1.36 at gabe;
 Fri, 05 Sep 2025 03:10:54 UTC
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C32B10E365
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 03:10:54 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cJ19W1VlYzKHMv7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:52:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 2CE271A1B7C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:52:47 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgAncY18ULpou6m7BQ--.37022S4;
 Fri, 05 Sep 2025 10:52:46 +0800 (CST)
From: Zizhi Wo <wozizhi@huaweicloud.com>
To: deller@gmx.de, tzimmermann@suse.de, lee@kernel.org, jani.nikula@intel.com,
 oushixiong@kylinos.cn, soci@c64.rulez.org
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yangerkun@huawei.com,
 wozizhi@huaweicloud.com
Subject: [PATCH] fbdev: Delay the setting of fbcon_ops to fix KASAN issues
Date: Fri,  5 Sep 2025 10:43:40 +0800
Message-Id: <20250905024340.337521-1-wozizhi@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAncY18ULpou6m7BQ--.37022S4
X-Coremail-Antispam: 1UD129KBjvJXoWxArWkurWUXr4rAryfGw47twb_yoWrArWDpF
 yYkry2q3Z8tw45C3W3Xw45WF4rX3ZrJry7ua97ta4YgFy3uFW8W34kJFyUuFWrur97Jry8
 Xw1DtrW8GFWDuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

[BUG]
Recently, we encountered a KASAN warning as follows:

kasan_report+0xaf/0xe0 mm/kasan/report.c:588
fb_pad_aligned_buffer+0x12f/0x150 drivers/video/fbdev/core/fbmem.c:116
ccw_putcs_aligned drivers/video/fbdev/core/fbcon_ccw.c:119 [inline]
ccw_putcs+0x9ac/0xbb0 drivers/video/fbdev/core/fbcon_ccw.c:175
fbcon_putcs+0x329/0x3f0 drivers/video/fbdev/core/fbcon.c:1297
do_update_region+0x3de/0x670 drivers/tty/vt/vt.c:623
invert_screen+0x1de/0x600 drivers/tty/vt/vt.c:748
highlight drivers/tty/vt/selection.c:57 [inline]
clear_selection+0x5e/0x70 drivers/tty/vt/selection.c:81
vc_do_resize+0xc8e/0xf40 drivers/tty/vt/vt.c:1206
fbcon_modechanged+0x489/0x7a0 drivers/video/fbdev/core/fbcon.c:2705
fbcon_set_all_vcs+0x1e0/0x600 drivers/video/fbdev/core/fbcon.c:2752
fbcon_rotate_all drivers/video/fbdev/core/fbcon.c:250 [inline]
...

reproduce[probabilistic, depending on the width and height of vc_font, as
well as the value of "p" in do_update_region()]:
1) echo 2 > /sys/devices/virtual/graphics/fbcon/rotate_all
2) echo 3 > /sys/devices/virtual/graphics/fbcon/rotate_all

[CAUSE]
The root cause is that fbcon_modechanged() first sets the current rotate's
corresponding ops. Subsequently, during vc_resize(), it may trigger
clear_selection(), and in fbcon_putcs->ccw_putcs[rotate=3], this can result
in an out-of-bounds access to "src". This happens because ops->fontbuffer
is reallocated in fbcon_rotate_font():
1) When rotate=2, its size is (width + 7) / 8 * height
2) When rotate=3, its size is (height + 7) / 8 * width

And the call to fbcon_rotate_font() occurs after clear_selection(). In
other words, the fontbuffer is allocated using the size calculated from the
previous rotation[2], but before reallocating it with the new size,
con_putcs is already using the new rotation[3]:

rotate_all_store
 fbcon_rotate_all
  fbcon_set_all_vcs
   fbcon_modechanged
   ...
    fbcon_set_rotate
     fbcon_rotate_ccw
      ops->putcs = ccw_putcs // set rotate 3 ops
    vc_resize
    ...
     clear_selection
      highlight
      ...
       do_update_region
	fbcon_putcs
	 ccw_putcs_aligned
	  src = ops->fontbuffer + (scr_readw(s--) & charmask)*cellsize
	  fb_pad_aligned_buffer----[src KASAN!!!]
       update_screen
        redraw_screen
	 fbcon_switch
	  fbcon_rotate_font
	   dst = kmalloc_array(len, d_cellsize, GFP_KERNEL)
	   ops->fontbuffer = dst

[FIX]
Considering that when the rotation changes, clear_selection() should clear
the previously selected region and not consider the new rotation yet.
Therefore, the assignment to fbcon_ops for the newly set rotate can be
postponed to fbcon_rotate_font(), since the fontbuffer is regenerated
there. To avoid affecting other code paths, fbcon_set_rotate() will
temporarily continue assigning fbcon_ops based on cur_rotate not rotate.

Signed-off-by: Zizhi Wo <wozizhi@huaweicloud.com>
---
 drivers/video/fbdev/core/fbcon_rotate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index ec3c883400f7..d76446da24d4 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -70,6 +70,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 			src += s_cellsize;
 			dst += d_cellsize;
 		}
+		fbcon_rotate_ud(ops);
 		break;
 	case FB_ROTATE_CW:
 		for (i = len; i--; ) {
@@ -78,6 +79,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 			src += s_cellsize;
 			dst += d_cellsize;
 		}
+		fbcon_rotate_cw(ops);
 		break;
 	case FB_ROTATE_CCW:
 		for (i = len; i--; ) {
@@ -86,6 +88,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 			src += s_cellsize;
 			dst += d_cellsize;
 		}
+		fbcon_rotate_ccw(ops);
 		break;
 	}
 
@@ -97,7 +100,7 @@ void fbcon_set_rotate(struct fbcon_ops *ops)
 {
 	ops->rotate_font = fbcon_rotate_font;
 
-	switch(ops->rotate) {
+	switch (ops->cur_rotate) {
 	case FB_ROTATE_CW:
 		fbcon_rotate_cw(ops);
 		break;
-- 
2.39.2

