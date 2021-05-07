Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386D37644E
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 13:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244B6E04B;
	Fri,  7 May 2021 11:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8789C6E04B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 11:09:47 +0000 (UTC)
Received: from fsav108.sakura.ne.jp (fsav108.sakura.ne.jp [27.133.134.235])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 147B9Rqu023432;
 Fri, 7 May 2021 20:09:27 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav108.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav108.sakura.ne.jp);
 Fri, 07 May 2021 20:09:27 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav108.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 147B9RAW023427
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 7 May 2021 20:09:27 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_imageblit (2)
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, colin.king@canonical.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jani.nikula@intel.com,
 jirislaby@kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Antonino A. Daplas" <adaplas@gmail.com>
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
Message-ID: <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
Date: Fri, 7 May 2021 20:09:26 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 2021/05/03 22:41, Tetsuo Handa wrote:
> Therefore, I guess that the problem is that fbcon_putcs() from do_update_region() from
> redraw_screen() from vt_kdsetmode(KD_TEXT) from ioctl(fd, KDSETMODE, KD_TEXT) tries to
> redraw 2 x 16640 despite memory amount allocated for actual screen is only 80 x 30.
> 
> I don't know how to fix this problem...
> 

Daniel Vetter suggested me that parameter validation is missing/wrong somewhere, for
resize requests that don't fit should be rejected. Thus, I'm thinking how to add
parameter validation.

Like a diff shown bottom, adding a hook for validating whether rows / columns are
small enough (VGA_FB_PHYS_LEN bytes starting from VGA_FB_PHYS ?) survives the

----------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/kd.h>
#include <linux/vt.h>

int main(int argc, char *argv[])
{
        const int fd = open("/dev/char/4:1", O_RDWR);
        struct vt_sizes vt = { 0x4100, 2 };

        ioctl(fd, KDSETMODE, KD_GRAPHICS);
        ioctl(fd, VT_RESIZE, &vt);
        ioctl(fd, KDSETMODE, KD_TEXT);
        return 0;
}
----------

reproducer. But I don't know how to calculate upper boundary values for vga16fb_tty_resize(),
for I even don't know where these values are derived from...

Also, currently resize_screen() calls vc->vc_sw->con_resize() only if vc->vc_mode != KD_GRAPHICS.
But we need to unconditionally call vga16fb_tty_resize() in order to survive the reproducer; we
need to prevent vc->vc_{rows,cols} from exceeding the upper boundary values regardless of current
vc->vc_mode setting. The "vc->vc_mode != KD_GRAPHICS" check predates the git history, and I don't
know the side effect of removing this check...

----------
e400b6ec4ede4 drivers/char/vt.c   (Antonino A. Daplas   2007-10-16 01:29:35 -0700 1168) static inline int resize_screen(struct vc_data *vc, int width, int height,
e400b6ec4ede4 drivers/char/vt.c   (Antonino A. Daplas   2007-10-16 01:29:35 -0700 1169)                                 int user)
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1170) {
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1171)         /* Resizes the resolution of the display adapater */
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1172)         int err = 0;
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1173)
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1174)         if (vc->vc_mode != KD_GRAPHICS && vc->vc_sw->con_resize)
e400b6ec4ede4 drivers/char/vt.c   (Antonino A. Daplas   2007-10-16 01:29:35 -0700 1175)                 err = vc->vc_sw->con_resize(vc, width, height, user);
e400b6ec4ede4 drivers/char/vt.c   (Antonino A. Daplas   2007-10-16 01:29:35 -0700 1176)
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1177)         return err;
^1da177e4c3f4 drivers/char/vt.c   (Linus Torvalds       2005-04-16 15:20:36 -0700 1178) }
----------

I need more help from those who know this area.

 drivers/tty/vt/vt.c              |    2 +-
 drivers/video/fbdev/core/fbcon.c |    7 +++++++
 drivers/video/fbdev/vga16fb.c    |    8 ++++++++
 include/linux/fb.h               |    3 +++
 4 files changed, 19 insertions(+), 1 deletion(-)

----------
diff --git a/include/linux/fb.h b/include/linux/fb.h
index a8dccd23c249..870384afb5e9 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -289,14 +289,17 @@ struct fb_ops {
 
 	/* teardown any resources to do with this framebuffer */
 	void (*fb_destroy)(struct fb_info *info);
 
 	/* called at KDB enter and leave time to prepare the console */
 	int (*fb_debug_enter)(struct fb_info *info);
 	int (*fb_debug_leave)(struct fb_info *info);
+
+	/* Check if resizing TTY to these sizes is safe. */
+	int (*fb_tty_resize)(struct fb_info *info, unsigned int cols, unsigned int rows);
 };
 
 #ifdef CONFIG_FB_TILEBLITTING
 #define FB_TILE_CURSOR_NONE        0
 #define FB_TILE_CURSOR_UNDERLINE   1
 #define FB_TILE_CURSOR_LOWER_THIRD 2
 #define FB_TILE_CURSOR_LOWER_HALF  3
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 1e8a38a7967d..54aa6a99b09c 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1266,27 +1266,35 @@ static void vga16fb_destroy(struct fb_info *info)
 {
 	iounmap(info->screen_base);
 	fb_dealloc_cmap(&info->cmap);
 	/* XXX unshare VGA regions */
 	framebuffer_release(info);
 }
 
+static int vga16fb_tty_resize(struct fb_info *info, unsigned int cols, unsigned int rows)
+{
+	if (cols <= 80 && rows <= 30)
+		return 0;
+	return -EINVAL;
+}
+
 static const struct fb_ops vga16fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open        = vga16fb_open,
 	.fb_release     = vga16fb_release,
 	.fb_destroy	= vga16fb_destroy,
 	.fb_check_var	= vga16fb_check_var,
 	.fb_set_par	= vga16fb_set_par,
 	.fb_setcolreg 	= vga16fb_setcolreg,
 	.fb_pan_display = vga16fb_pan_display,
 	.fb_blank 	= vga16fb_blank,
 	.fb_fillrect	= vga16fb_fillrect,
 	.fb_copyarea	= vga16fb_copyarea,
 	.fb_imageblit	= vga16fb_imageblit,
+	.fb_tty_resize  = vga16fb_tty_resize,
 };
 
 #ifndef MODULE
 static int __init vga16fb_setup(char *options)
 {
 	char *this_opt;
 	
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3406067985b1..c0eac87a2a56 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1990,14 +1990,21 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 		if (pitch <= 0)
 			return -EINVAL;
 		size = CALC_FONTSZ(vc->vc_font.height, pitch, vc->vc_font.charcount);
 		if (size > FNTSIZE(vc->vc_font.data))
 			return -EINVAL;
 	}
 
+	if (info->fbops && info->fbops->fb_tty_resize) {
+		int err = info->fbops->fb_tty_resize(info, width, height);
+
+		if (err)
+			return err;
+	}
+
 	virt_w = FBCON_SWAP(ops->rotate, width, height);
 	virt_h = FBCON_SWAP(ops->rotate, height, width);
 	virt_fw = FBCON_SWAP(ops->rotate, vc->vc_font.width,
 				 vc->vc_font.height);
 	virt_fh = FBCON_SWAP(ops->rotate, vc->vc_font.height,
 				 vc->vc_font.width);
 	var.xres = virt_w * virt_fw;
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 01645e87b3d5..fa1548d4f94b 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1167,15 +1167,15 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 
 static inline int resize_screen(struct vc_data *vc, int width, int height,
 				int user)
 {
 	/* Resizes the resolution of the display adapater */
 	int err = 0;
 
-	if (vc->vc_mode != KD_GRAPHICS && vc->vc_sw->con_resize)
+	if (vc->vc_sw->con_resize)
 		err = vc->vc_sw->con_resize(vc, width, height, user);
 
 	return err;
 }
 
 /**
  *	vc_do_resize	-	resizing method for the tty
----------

