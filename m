Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280C21E93D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9CC6E940;
	Tue, 14 Jul 2020 07:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735246E13F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 11:10:23 +0000 (UTC)
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06CBAKMo040327;
 Sun, 12 Jul 2020 20:10:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Sun, 12 Jul 2020 20:10:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp
 [106.72.142.33]) (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06CBAFJP040301
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 12 Jul 2020 20:10:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Subject: [PATCH] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Date: Sun, 12 Jul 2020 20:10:13 +0900
Message-Id: <20200712111013.11881-2-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I found that

  const int fd = open("/dev/fb0", O_ACCMODE);
  struct fb_var_screeninfo var = { };
  ioctl(fd, FBIOGET_VSCREENINFO, &var);
  var.xres = var.yres = 1;
  ioctl(fd, FBIOPUT_VSCREENINFO, &var);

causes general protection fault in bitfill_aligned(), for vc_do_resize()
updates vc->vc_{cols,rows} only when vc_do_resize() will return 0.

[   20.102222] BUG: unable to handle page fault for address: ffffb80500d7b000
[   20.102225] #PF: supervisor write access in kernel mode
[   20.102226] #PF: error_code(0x0002) - not-present page
[   20.102227] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 132525067 PTE 0
[   20.102230] Oops: 0002 [#1] SMP
[   20.102232] CPU: 3 PID: 2786 Comm: a.out Not tainted 5.8.0-rc4+ #749
[   20.102233] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[   20.102237] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
[   20.102277] Call Trace:
[   20.102281]  cfb_fillrect+0x159/0x340 [cfbfillrect]
[   20.102747]  vmw_fb_fillrect+0x12/0x30 [vmwgfx]
[   20.102755]  bit_clear_margins+0x92/0xf0 [fb]
[   20.102760]  fbcon_clear_margins+0x4c/0x50 [fb]
[   20.102763]  fbcon_switch+0x321/0x570 [fb]
[   20.102771]  redraw_screen+0xe0/0x250
[   20.102775]  fbcon_modechanged+0x164/0x1b0 [fb]
[   20.102779]  fbcon_update_vcs+0x15/0x20 [fb]
[   20.102781]  fb_set_var+0x364/0x3c0 [fb]
[   20.102817]  do_fb_ioctl+0x2ff/0x3f0 [fb]
[   20.103139]  fb_ioctl+0x2e/0x40 [fb]
[   20.103141]  ksys_ioctl+0x86/0xc0
[   20.103146]  __x64_sys_ioctl+0x15/0x20
[   20.103148]  do_syscall_64+0x54/0xa0
[   20.103151]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

If vc_do_resize() fails (e.g. kzalloc() failure) when var.xres or var.yres
is going to shrink, bit_clear_margins() hits integer underflow bug due to
info->var.xres < (vc->vc_cols * cw) or info->var.yres < (vc->vc_rows * ch).
Unexpectedly large rw or bh will try to overrun the __iomem region and
causes general protection fault.

This crash is easily reproducible by calling vc_do_resize(vc, 0, 0)
which the reproducer above will do. Since fbcon_modechanged() is doing

  cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
  rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
  cols /= vc->vc_font.width;
  rows /= vc->vc_font.height;
  vc_resize(vc, cols, rows);
  (...snipped...)
  update_screen(vc);

, var.xres < vc->vc_font.width makes cols = 0 and var.yres < vc->vc_font.height
makes rows = 0. But vc_do_resize() does not set vc->vc_cols = vc->vc_rows = 0
due to

  new_cols = (cols ? cols : vc->vc_cols);
  new_rows = (lines ? lines : vc->vc_rows);

exception.

Of course, the root problem is that callers of do_vc_resize() are not
handling vc_do_resize() failures, but it might not be easy to handle
them under complicated dependency. Therefore, as a band-aid workaround,
this patch checks integer underflow in "struct fbcon_ops"->clear_margins
call, assuming that vc->vc_cols * vc->vc_font.width and
vc->vc_rows * vc->vc_font.heigh do not cause integer overflow.

I hope that we can survive even if info->var.{xres,yres} were increased
but vc->vc_{cols,rows} were not increased due to kzalloc() failure, for
the __iomem memory for cfb_fillrect() seems to be allocated upon driver
load.

By the way, syzbot has several reports which are stalling inside filling
functions. Although reproducer for [1] is not found yet, it has tried

  r0 = openat$fb0(0xffffffffffffff9c, &(0x7f0000000180)='/dev/fb0\x00', 0x0, 0x0)
  ioctl$FBIOPUT_VSCREENINFO(r0, 0x4601, &(0x7f0000000000)={0x0, 0x0, 0x0, 0x500, 0x0, 0x0, 0x4})

which corresponds to

  const int fd = open("/dev/fb0", O_ACCMODE);
  struct fb_var_screeninfo var = { };
  var.yres_virtual = 0x500;
  var.bits_per_pixel = 4;
  ioctl(fd, FBIOPUT_VSCREENINFO, &var);

and somehow hit unexpectedly long bit_clear_margins() loops. I don't know
why syzbot does not hit general protection fault, but it would depend on
environment because in my VMware environment ioctl(FBIOPUT_VSCREENINFO)
returns -EINVAL if var.xres == var.yres == 0.

[1] https://syzkaller.appspot.com/bug?id=91ecc3bf32ab1a551c33a39dab7fc0c8cd7b7e16

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/video/fbdev/core/bitblit.c   | 4 ++--
 drivers/video/fbdev/core/fbcon_ccw.c | 4 ++--
 drivers/video/fbdev/core/fbcon_cw.c  | 4 ++--
 drivers/video/fbdev/core/fbcon_ud.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index ca935c09a261..35ebeeccde4d 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -216,7 +216,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dx = info->var.xoffset + rs;
 		region.dy = 0;
 		region.width = rw;
@@ -224,7 +224,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dx = info->var.xoffset;
 		region.dy = info->var.yoffset + bs;
 		region.width = rs;
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index dfa9a8aa4509..78f3a5621478 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -201,7 +201,7 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dx = 0;
 		region.dy = info->var.yoffset;
 		region.height = rw;
@@ -209,7 +209,7 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dx = info->var.xoffset + bs;
 		region.dy = 0;
                 region.height = info->var.yres_virtual;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index ce08251bfd38..fd098ff17574 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -184,7 +184,7 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dx = 0;
 		region.dy = info->var.yoffset + rs;
 		region.height = rw;
@@ -192,7 +192,7 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dx = info->var.xoffset;
 		region.dy = info->var.yoffset;
                 region.height = info->var.yres;
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 1936afc78fec..e165a3fad29a 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -231,7 +231,7 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
 	region.color = color;
 	region.rop = ROP_COPY;
 
-	if (rw && !bottom_only) {
+	if ((int) rw > 0 && !bottom_only) {
 		region.dy = 0;
 		region.dx = info->var.xoffset;
 		region.width  = rw;
@@ -239,7 +239,7 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
 		info->fbops->fb_fillrect(info, &region);
 	}
 
-	if (bh) {
+	if ((int) bh > 0) {
 		region.dy = info->var.yoffset;
 		region.dx = info->var.xoffset;
                 region.height  = bh;
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
