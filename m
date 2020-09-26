Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6327A839
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38E56E3B7;
	Mon, 28 Sep 2020 07:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05BD6E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 16:25:35 +0000 (UTC)
Received: from fsav401.sakura.ne.jp (fsav401.sakura.ne.jp [133.242.250.100])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08QGPMB5001682;
 Sun, 27 Sep 2020 01:25:22 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav401.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav401.sakura.ne.jp);
 Sun, 27 Sep 2020 01:25:22 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav401.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08QGPJBR001666
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Sun, 27 Sep 2020 01:25:22 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: use-after-free Read in bit_putcs
To: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000226d3f05b02dd607@google.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
Date: Sun, 27 Sep 2020 01:25:17 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <000000000000226d3f05b02dd607@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A simplified reproducer and debug printk() patch shown below reported that
vc_font.height is increased to 9 via ioctl(VT_RESIZEX) after it was once
decreased from 16 to 2 via ioctl(PIO_FONT).



Since vc_resize() with v.v_rows == 0 preserves current vc->vc_rows value,
this reproducer is bypassing

	if (v.v_clin) {
		int rows = v.v_vlin / v.v_clin;
		if (v.v_rows != rows) {
			if (v.v_rows) /* Parameters don't add up */
				return -EINVAL;
			v.v_rows = rows;
		}
	}

check by setting v.v_vlin == 1 and v.v_clin == 9.

If v.v_vcol > 0 and v.v_vcol != vc->vc_cols (though this reproducer is passing
v.v_vcol == 0), tty_do_resize() from vc_do_resize() from vc_resize() can make
"struct tty_struct"->winsize.ws_ypixel = 1 despite
"struct tty_struct"->winsize.vc->vc_rows = vc->vc_rows (which is usually larger
than 1). Does such winsize (a row has 1 / vc->vc_rows pixel) make sense?



Since I don't know the meaning of "struct vt_consize"->v_clin (which is commented
with "/* number of pixel rows per character */" but does it mean font size ?),
I don't know why we can assign that value to vcp->vc_font.height via

	if (v.v_clin)
		vcp->vc_font.height = v.v_clin;

in vt_resizex(). While ioctl(PIO_FONT) needs to pass vc->vc_sw->con_font_set()
check in con_font_set(), ioctl(VT_RESIZEX) does not pass it in vt_resizex()...

Since this problem does not happen if I remove

	if (v.v_clin)
		vcp->vc_font.height = v.v_clin;

 from vt_resizex(), I guess that some variables are getting confused by change
of vc->vc_font.height ...

  #define VT_RESIZE     0x5609  /* set kernel's idea of screensize */
  #define VT_RESIZEX    0x560A  /* set kernel's idea of screensize + more */

Hmm, what comes to the "+ more" part? Who is using VT_RESIZEX ?
If nobody is using VT_RESIZEX, better to make VT_RESIZEX == VT_RESIZE ?

----------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/kd.h>
#include <linux/vt.h>

int main(int argc, char *argv[])
{
        int fd = open("/dev/tty1", 3);
        static char fontdata[8192] = { 2, 3 };
        struct vt_consize v_c = { 0, 0, 1, 9, 0, 0 };
        ioctl(fd, PIO_FONT, fontdata);
        ioctl(fd, VT_RESIZEX, &v_c);
        return 0;
}
----------

----------
diff --git a/drivers/tty/vt/vt_ioctl.c b/drivers/tty/vt/vt_ioctl.c
index a4e520bdd521..df6b7abd1068 100644
--- a/drivers/tty/vt/vt_ioctl.c
+++ b/drivers/tty/vt/vt_ioctl.c
@@ -769,64 +769,70 @@ static int vt_resizex(struct vc_data *vc, struct vt_consize __user *cs)
 {
 	struct vt_consize v;
 	int i;
+	int ret = 0;
 
 	if (copy_from_user(&v, cs, sizeof(struct vt_consize)))
 		return -EFAULT;
 
-	/* FIXME: Should check the copies properly */
-	if (!v.v_vlin)
-		v.v_vlin = vc->vc_scan_lines;
+	console_lock();
+	for (i = 0; i < MAX_NR_CONSOLES; i++) {
+		struct vc_data *vcp = vc_cons[i].d;
 
-	if (v.v_clin) {
-		int rows = v.v_vlin / v.v_clin;
-		if (v.v_rows != rows) {
-			if (v.v_rows) /* Parameters don't add up */
-				return -EINVAL;
-			v.v_rows = rows;
+		if (!vcp)
+			continue;
+		if (v.v_clin) {
+			int rows = (v.v_vlin ? v.v_vlin : vcp->vc_scan_lines) / v.v_clin;
+			if (v.v_rows != rows) {
+				if (v.v_rows) { /* Parameters don't add up */
+					ret = -EINVAL;
+					break;
+				}
+				v.v_rows = rows;
+			}
 		}
-	}
-
-	if (v.v_vcol && v.v_ccol) {
-		int cols = v.v_vcol / v.v_ccol;
-		if (v.v_cols != cols) {
-			if (v.v_cols)
-				return -EINVAL;
-			v.v_cols = cols;
+		if (v.v_vcol && v.v_ccol) {
+			int cols = v.v_vcol / v.v_ccol;
+			if (v.v_cols != cols) {
+				if (v.v_cols) {
+					ret = -EINVAL;
+					break;
+				}
+				v.v_cols = cols;
+			}
+		}
+		if (v.v_clin > 32) {
+			ret = -EINVAL;
+			break;
 		}
 	}
+	printk(KERN_INFO "vc=%px v.v_rows=%hu v.v_cols=%hu v.v_vlin=%hu v.v_clin=%u v.v_vcol=%hu v.v_ccol=%hu ret=%d\n", vc, v.v_rows, v.v_cols, v.v_vlin, v.v_clin, v.v_vcol, v.v_ccol, ret);
+	for (i = 0; !ret && i < MAX_NR_CONSOLES; i++) {
+		unsigned int save_scan_lines;
+		unsigned int save_font_height;
+		struct vc_data *vcp = vc_cons[i].d;
 
-	if (v.v_clin > 32)
-		return -EINVAL;
-
-	for (i = 0; i < MAX_NR_CONSOLES; i++) {
-		struct vc_data *vcp;
-
-		if (!vc_cons[i].d)
+		if (!vcp)
 			continue;
-		console_lock();
-		vcp = vc_cons[i].d;
-		if (vcp) {
-			int ret;
-			int save_scan_lines = vcp->vc_scan_lines;
-			int save_font_height = vcp->vc_font.height;
-
-			if (v.v_vlin)
-				vcp->vc_scan_lines = v.v_vlin;
-			if (v.v_clin)
-				vcp->vc_font.height = v.v_clin;
-			vcp->vc_resize_user = 1;
-			ret = vc_resize(vcp, v.v_cols, v.v_rows);
-			if (ret) {
-				vcp->vc_scan_lines = save_scan_lines;
-				vcp->vc_font.height = save_font_height;
-				console_unlock();
-				return ret;
-			}
+		save_scan_lines = vcp->vc_scan_lines;
+		save_font_height = vcp->vc_font.height;
+		if (v.v_vlin)
+			vcp->vc_scan_lines = v.v_vlin;
+		if (v.v_clin)
+			vcp->vc_font.height = v.v_clin;
+		printk(KERN_INFO "vcp=%px before: ->vc_rows=%u ->vc_cols=%u ->vc_scan_lines=%u save_scan_lines=%u ->vc_font.height=%u save_font_height=%u\n",
+		       vcp, vcp->vc_rows, vcp->vc_cols, vcp->vc_scan_lines, save_scan_lines, vcp->vc_font.height, save_font_height);
+		vcp->vc_resize_user = 1;
+		ret = vc_resize(vcp, v.v_cols, v.v_rows);
+		printk(KERN_INFO "vcp=%px after: ->vc_rows=%u ->vc_cols=%u ->vc_scan_lines=%u save_scan_lines=%u ->vc_font.height=%u save_font_height=%u ret=%d\n",
+		       vcp, vcp->vc_rows, vcp->vc_cols, vcp->vc_scan_lines, save_scan_lines, vcp->vc_font.height, save_font_height, ret);
+		if (ret) {
+			vcp->vc_scan_lines = save_scan_lines;
+			vcp->vc_font.height = save_font_height;
 		}
-		console_unlock();
 	}
+	console_unlock();
 
-	return 0;
+	return ret;
 }
 
 /*
diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 9725ecd1255b..c1b9f43ff657 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -181,6 +181,8 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 		dst = fb_get_buffer_offset(info, &info->pixmap, size);
 		image.data = dst;
 
+		printk(KERN_DEBUG "%s: width=%u cellsize=%u count=%d maxcnt=%u scan_align=%u buf_align=%u image.width=%u image.height=%u pitch=%u\n",
+		       __func__, width, cellsize, count, maxcnt, scan_align, buf_align, image.width, image.height, pitch);
 		if (!mod)
 			bit_putcs_aligned(vc, info, s, attribute, cnt, pitch,
 					  width, cellsize, &image, buf, dst);
----------

----------
[  297.298013] [ T2823] bit_putcs: width=1 cellsize=16 count=80 maxcnt=512 scan_align=0 buf_align=0 image.width=640 image.height=16 pitch=80
[  297.312092] [ T2823] bit_putcs: width=1 cellsize=16 count=80 maxcnt=512 scan_align=0 buf_align=0 image.width=640 image.height=16 pitch=80
[  297.324735] [ T2823] bit_putcs: width=1 cellsize=16 count=80 maxcnt=512 scan_align=0 buf_align=0 image.width=640 image.height=16 pitch=80
[  297.337634] [ T2823] bit_putcs: width=1 cellsize=16 count=80 maxcnt=512 scan_align=0 buf_align=0 image.width=640 image.height=16 pitch=80
[  297.350185] [ T2823] bit_putcs: width=1 cellsize=16 count=80 maxcnt=512 scan_align=0 buf_align=0 image.width=640 image.height=16 pitch=80
[  297.361861] [ T2823] bit_putcs: width=1 cellsize=16 count=80 maxcnt=512 scan_align=0 buf_align=0 image.width=640 image.height=16 pitch=80
[  297.474116] [ T2823] bit_putcs: width=1 cellsize=16 count=28 maxcnt=512 scan_align=0 buf_align=0 image.width=224 image.height=16 pitch=28
[  297.481866] [ T2823] bit_putcs: width=1 cellsize=16 count=4 maxcnt=512 scan_align=0 buf_align=0 image.width=32 image.height=16 pitch=4
[  297.483529] [ T2823] bit_putcs: width=1 cellsize=16 count=1 maxcnt=512 scan_align=0 buf_align=0 image.width=8 image.height=16 pitch=1
[  297.484792] [ T2823] bit_putcs: width=1 cellsize=16 count=7 maxcnt=512 scan_align=0 buf_align=0 image.width=56 image.height=16 pitch=7
[  357.373828] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.375232] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.376821] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.378256] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.379684] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
(...snipped...)
[  357.720089] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.721519] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.722962] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.724390] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.725834] [ T2940] bit_putcs: width=1 cellsize=2 count=80 maxcnt=4096 scan_align=0 buf_align=0 image.width=640 image.height=2 pitch=80
[  357.727876] [ T2940] vc=ffff8880d69b6000 v.v_rows=0 v.v_cols=0 v.v_vlin=1 v.v_clin=9 v.v_vcol=0 v.v_ccol=0 ret=0
[  357.727933] [ T2940] vcp=ffff8880d69b6000 before: ->vc_rows=240 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=2
[  357.727994] [ T2940] vcp=ffff8880d69b6000 after: ->vc_rows=240 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=2 ret=0
[  357.728050] [ T2940] vcp=ffff8880d46d9000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  357.728110] [ T2940] vcp=ffff8880d46d9000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  357.728167] [ T2940] vcp=ffff8880d40a8000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  357.728227] [ T2940] vcp=ffff8880d40a8000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  357.728283] [ T2940] vcp=ffff8880d46fb000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  357.728344] [ T2940] vcp=ffff8880d46fb000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  357.728400] [ T2940] vcp=ffff8880d46f9000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  357.728460] [ T2940] vcp=ffff8880d46f9000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  357.728516] [ T2940] vcp=ffff8880ce2d1000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  357.728616] [ T2940] vcp=ffff8880ce2d1000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  357.743762] [    C0] bit_putcs: width=1 cellsize=9 count=68 maxcnt=910 scan_align=0 buf_align=0 image.width=544 image.height=9 pitch=68
[  357.743783] [    C0] ==================================================================
[  357.743803] [    C0] BUG: KASAN: slab-out-of-bounds in bit_putcs+0x6a0/0x980
[  357.743822] [    C0] Read of size 1 at addr ffff8880d46ff343 by task a.out/2940
[  357.743830] [    C0]
[  357.743848] [    C0] CPU: 0 PID: 2940 Comm: a.out Not tainted 5.9.0-rc6+ #635
[  357.743871] [    C0] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[  357.743880] [    C0] Call Trace:
[  357.743891] [    C0]  dump_stack+0x161/0x1c3
[  357.743902] [    C0]  ? bit_putcs+0x6a0/0x980
[  357.743914] [    C0]  ? bit_putcs+0x6a0/0x980
[  357.743932] [    C0]  print_address_description.constprop.0.cold+0xd3/0x4c5
[  357.743944] [    C0]  ? log_store.cold+0x16/0x16
[  357.743956] [    C0]  ? vprintk_func+0xe2/0x155
[  357.743968] [    C0]  ? bit_putcs+0x6a0/0x980
[  357.743979] [    C0]  ? bit_putcs+0x6a0/0x980
[  357.743992] [    C0]  kasan_report.cold+0x1f/0x42
[  357.744003] [    C0]  ? bit_putcs+0x6a0/0x980
[  357.744014] [    C0]  bit_putcs+0x6a0/0x980
[  357.744026] [    C0]  ? bit_clear+0x2f0/0x2f0
[  357.744038] [    C0]  ? find_held_lock+0x85/0xa0
[  357.744052] [    C0]  ? raw_notifier_call_chain+0x31/0x40
[  357.744067] [    C0]  ? fb_get_color_depth.part.0+0x57/0xe0
[  357.744082] [    C0]  ? __sanitizer_cov_trace_switch+0x49/0x80
[  357.744093] [    C0]  fbcon_putcs+0x1d8/0x1e0
[  357.744105] [    C0]  ? bit_clear+0x2f0/0x2f0
[  357.744118] [    C0]  vt_console_print+0x72d/0x870
[  357.744130] [    C0]  ? fb_flashcursor+0x230/0x230
[  357.744144] [    C0]  ? screen_glyph_unicode+0x140/0x140
[  357.744157] [    C0]  ? rwlock_bug.part.0+0x50/0x50
[  357.744171] [    C0]  ? screen_glyph_unicode+0x140/0x140
[  357.744183] [    C0]  console_unlock+0x92c/0xb30
[  357.744195] [    C0]  vt_ioctl.cold+0x182/0x3a2
[  357.744210] [    C0]  ? complete_change_console+0x1e0/0x1e0
[  357.744222] [    C0]  ? find_held_lock+0x85/0xa0
[  357.744237] [    C0]  ? debug_check_no_obj_freed+0x18d/0x276
[  357.744249] [    C0]  ? lock_downgrade+0x3e0/0x3e0
[  357.744261] [    C0]  ? find_held_lock+0x85/0xa0
[  357.744274] [    C0]  ? lock_is_held_type+0xbf/0xf0
[  357.744285] [    C0]  ? putname+0xa7/0xc0
[  357.744296] [    C0]  ? putname+0xa7/0xc0
[  357.744306] [    C0]  ? putname+0xa7/0xc0
[  357.744322] [    C0]  ? __sanitizer_cov_trace_switch+0x49/0x80
[  357.744336] [    C0]  ? complete_change_console+0x1e0/0x1e0
[  357.744361] [    C0]  ? tty_ioctl+0x7c4/0xec0
[  357.744373] [    C0]  tty_ioctl+0x7c4/0xec0
[  357.744387] [    C0]  ? kmem_cache_free.part.0+0x1b0/0x1e0
[  357.744399] [    C0]  ? tty_vhangup+0x30/0x30
[  357.744414] [    C0]  ? __sanitizer_cov_trace_switch+0x49/0x80
[  357.744426] [    C0]  ? do_vfs_ioctl+0x224/0xc50
[  357.744439] [    C0]  ? ioctl_file_clone+0x140/0x140
[  357.744452] [    C0]  ? file_open_root+0x420/0x420
[  357.744467] [    C0]  ? check_preemption_disabled+0x50/0x130
[  357.744479] [    C0]  ? lock_is_held_type+0xbf/0xf0
[  357.744495] [    C0]  ? syscall_enter_from_user_mode+0x1c/0x60
[  357.744509] [    C0]  ? rcu_read_lock_sched_held+0xa0/0xd0
[  357.744521] [    C0]  ? mark_held_locks+0x24/0x90
[  357.744533] [    C0]  ? tty_vhangup+0x30/0x30
[  357.744545] [    C0]  __x64_sys_ioctl+0xec/0x140
[  357.744557] [    C0]  do_syscall_64+0x31/0x70
[  357.744572] [    C0]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  357.744583] [    C0] RIP: 0033:0x7f9b8316150b
[  357.744632] [    C0] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[  357.744647] [    C0] RSP: 002b:00007ffe190139b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  357.744680] [    C0] RAX: ffffffffffffffda RBX: 000055dc2ea7b220 RCX: 00007f9b8316150b
[  357.744701] [    C0] RDX: 00007ffe190139cc RSI: 000000000000560a RDI: 0000000000000003
[  357.744721] [    C0] RBP: 0000000000000003 R08: 0000000000000000 R09: 00007f9b83257d50
[  357.744741] [    C0] R10: 0000000000000000 R11: 0000000000000246 R12: 000055dc2ea7b130
[  357.744762] [    C0] R13: 00007ffe19013ad0 R14: 0000000000000000 R15: 0000000000000000
[  357.744769] [    C0]
[  357.744781] [    C0] Allocated by task 2940:
[  357.744793] [    C0]  kasan_save_stack+0x1f/0x40
[  357.744808] [    C0]  __kasan_kmalloc.constprop.0+0xbf/0xd0
[  357.744819] [    C0]  __kmalloc+0x57d/0x9d0
[  357.744831] [    C0]  fbcon_set_font+0x1a6/0x4a0
[  357.744843] [    C0]  con_font_op+0x8e2/0xac0
[  357.744854] [    C0]  vt_ioctl+0x1186/0x21a0
[  357.744866] [    C0]  tty_ioctl+0x7c4/0xec0
[  357.744878] [    C0]  __x64_sys_ioctl+0xec/0x140
[  357.744889] [    C0]  do_syscall_64+0x31/0x70
[  357.744905] [    C0]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  357.744912] [    C0]
[  357.744932] [    C0] The buggy address belongs to the object at ffff8880d46ff000
[  357.744949] [    C0]  which belongs to the cache kmalloc-1k of size 1024
[  357.744967] [    C0] The buggy address is located 835 bytes inside of
[  357.744985] [    C0]  1024-byte region [ffff8880d46ff000, ffff8880d46ff400)
[  357.745000] [    C0] The buggy address belongs to the page:
[  357.745027] [    C0] page:00000000878ccadc refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xd46ff
[  357.745040] [    C0] flags: 0xfffe0000000200(slab)
[  357.745063] [    C0] raw: 00fffe0000000200 ffffea00032a0808 ffffea00035ae308 ffff8880d6840700
[  357.745086] [    C0] raw: 0000000000000000 ffff8880d46ff000 0000000100000002 ffff8880cbe8b281
[  357.745103] [    C0] page dumped because: kasan: bad access detected
[  357.745117] [    C0] page->mem_cgroup:ffff8880cbe8b281
[  357.745125] [    C0]
[  357.745140] [    C0] Memory state around the buggy address:
[  357.745162] [    C0]  ffff8880d46ff200: 00 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  357.745186] [    C0]  ffff8880d46ff280: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  357.745208] [    C0] >ffff8880d46ff300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  357.745224] [    C0]                                            ^
[  357.745246] [    C0]  ffff8880d46ff380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  357.745267] [    C0]  ffff8880d46ff400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  357.745288] [    C0] ==================================================================
[  357.745305] [    C0] Disabling lock debugging due to kernel taint
[  357.745349] [    C0] bit_putcs: width=1 cellsize=9 count=46 maxcnt=910 scan_align=0 buf_align=0 image.width=368 image.height=9 pitch=46
[  357.759878] [    C0] bit_putcs: width=1 cellsize=9 count=80 maxcnt=910 scan_align=0 buf_align=0 image.width=640 image.height=9 pitch=80
[  357.759910] [    C0] bit_putcs: width=1 cellsize=9 count=74 maxcnt=910 scan_align=0 buf_align=0 image.width=592 image.height=9 pitch=74
[  357.775006] [    C0] bit_putcs: width=1 cellsize=9 count=80 maxcnt=910 scan_align=0 buf_align=0 image.width=640 image.height=9 pitch=80
----------

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
