Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2B3716C1
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 16:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9998789115;
	Mon,  3 May 2021 14:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3454 seconds by postgrey-1.36 at gabe;
 Mon, 03 May 2021 14:39:20 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C521589115
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 14:39:20 +0000 (UTC)
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 143DfSZW084930;
 Mon, 3 May 2021 22:41:28 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp);
 Mon, 03 May 2021 22:41:28 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 143DfM5q084817
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 May 2021 22:41:28 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_imageblit (2)
To: syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, colin.king@canonical.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jani.nikula@intel.com,
 jirislaby@kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000006bbd0c05c14f1b09@google.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
Date: Mon, 3 May 2021 22:41:19 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0000000000006bbd0c05c14f1b09@google.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/05/02 10:53, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 988d0763361bb65690d60e2bc53a6b72777040c3
> Author: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Date:   Sun Sep 27 11:46:30 2020 +0000
> 
>     vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
> 

That commit is irrelevant. Below is a simplified reproducer.

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

In vga16fb_probe(), we have

----------
        /* XXX share VGA_FB_PHYS and I/O region with vgacon and others */
        info->screen_base = (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS, 0);

        if (!info->screen_base) {
                printk(KERN_ERR "vga16fb: unable to map device\n");
                ret = -ENOMEM;
                goto err_ioremap;
        }

        printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
----------

and ffff8880000a0000 is assigned for 80 x 30 screen upon boot.

----------
[    4.584361][    T1] vga16fb: mapped to 0xffff8880000a0000
[    6.137556][    T1] Console: switching to colour frame buffer device 80x30
[    7.829276][    T1] fb0: VGA16 VGA frame buffer device
----------

With debug printk() patch shown below,

----------
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 01645e87b3d5..af860b12db44 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -641,6 +641,8 @@ static void con_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 	scr_memsetw(clear, vc->vc_video_erase_char, vc->vc_size_row * nr);
 }
 
+extern struct task_struct *trace_me;
+
 static void do_update_region(struct vc_data *vc, unsigned long start, int count)
 {
 	unsigned int xx, yy, offset;
@@ -656,6 +658,8 @@ static void do_update_region(struct vc_data *vc, unsigned long start, int count)
 		start = vc->vc_sw->con_getxy(vc, start, &nxx, &nyy);
 		xx = nxx; yy = nyy;
 	}
+	if (trace_me == current)
+		pr_info("p=%px vc->{ vc_origin=%lx vc_rows=%u vc_cols=%u vc_scr_end=%lx } start=%lx count=%d xx=%u yy=%u\n", p, vc->vc_origin, vc->vc_rows, vc->vc_cols, vc->vc_scr_end, start, count, xx, yy);
 	for(;;) {
 		u16 attrib = scr_readw(p) & 0xff00;
 		int startx = xx;
@@ -1227,6 +1231,8 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 	newscreen = kzalloc(new_screen_size, GFP_USER);
 	if (!newscreen)
 		return -ENOMEM;
+	if (trace_me == current)
+		pr_info("vc=%px new_cols=%u new_rows=%u new_screen_size=%u newscreen=%px\n", vc, new_cols, new_rows, new_screen_size, newscreen);
 
 	if (get_vc_uniscr(vc)) {
 		new_uniscr = vc_uniscr_alloc(new_cols, new_rows);
diff --git a/drivers/tty/vt/vt_ioctl.c b/drivers/tty/vt/vt_ioctl.c
index 89aeaf3c1bca..137befd09d22 100644
--- a/drivers/tty/vt/vt_ioctl.c
+++ b/drivers/tty/vt/vt_ioctl.c
@@ -240,6 +240,8 @@ int vt_waitactive(int n)
 #define GPLAST 0x3df
 #define GPNUM (GPLAST - GPFIRST + 1)
 
+struct task_struct *trace_me;
+
 /*
  * currently, setting the mode from KD_TEXT to KD_GRAPHICS doesn't do a whole
  * lot. i'm not sure if it should do any restoration of modes or what...
@@ -272,10 +274,12 @@ static int vt_kdsetmode(struct vc_data *vc, unsigned long mode)
 
 	/* explicitly blank/unblank the screen if switching modes */
 	console_lock();
+	trace_me = current;
 	if (mode == KD_TEXT)
 		do_unblank_screen(1);
 	else
 		do_blank_screen(1);
+	trace_me = NULL;
 	console_unlock();
 
 	return 0;
@@ -877,6 +881,7 @@ int vt_ioctl(struct tty_struct *tty,
 			return -EFAULT;
 
 		console_lock();
+		trace_me = current;
 		for (i = 0; i < MAX_NR_CONSOLES; i++) {
 			vc = vc_cons[i].d;
 
@@ -886,6 +891,7 @@ int vt_ioctl(struct tty_struct *tty,
 				vc_resize(vc_cons[i].d, cc, ll);
 			}
 		}
+		trace_me = NULL;
 		console_unlock();
 		break;
 	}
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 1e8a38a7967d..fca76f6b9ab6 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1145,6 +1145,8 @@ static void vga_8planes_imageblit(struct fb_info *info, const struct fb_image *i
         setindex(oldindex);
 }
 
+extern struct task_struct *trace_me;
+
 static void vga_imageblit_expand(struct fb_info *info, const struct fb_image *image)
 {
 	char __iomem *where = info->screen_base + (image->dx/8) +
@@ -1170,6 +1172,9 @@ static void vga_imageblit_expand(struct fb_info *info, const struct fb_image *im
 				readb(where); /* fill latches */
 				setmode(3);
 				wmb();
+				if (trace_me == current)
+					pr_info_ratelimited("image->{ data=%px dx=%u dy=%u height=%u width=%u } info->{ screen_base=%px fix.line_length=%u } where=%px\n",
+							    cdat, image->dx, image->dy, image->height, image->width, info->screen_base, info->fix.line_length, where);
 				for (y = 0; y < image->height; y++) {
 					dst = where;
 					for (x = image->width/8; x--;) 
----------

we can see that at least ffff8880000a0000-ffff888001000040 are accessed, and 'dy'
would be 201520 when 'where' is ffff888001000000, which corresponds with 'real_y()'
being 12595, for ioctl(VT_RESIZE) changed screen size to 2 x 16640.

----------
[  222.885841][ T1675] vc=ffff888100109800 new_cols=2 new_rows=16640 new_screen_size=66560 newscreen=ffff888112120000
[  222.886520][ T1675] vc=ffff888105d26800 new_cols=2 new_rows=16640 new_screen_size=66560 newscreen=ffff888112140000
[  222.886662][ T1675] vc=ffff888105ca5800 new_cols=2 new_rows=16640 new_screen_size=66560 newscreen=ffff888112140000
[  222.886799][ T1675] vc=ffff8881017ff800 new_cols=2 new_rows=16640 new_screen_size=66560 newscreen=ffff888112140000
[  222.886951][ T1675] vc=ffff888102770800 new_cols=2 new_rows=16640 new_screen_size=66560 newscreen=ffff888112140000
[  222.887089][ T1675] vc=ffff8881052e5800 new_cols=2 new_rows=16640 new_screen_size=66560 newscreen=ffff888112140000
[  222.956019][ T1675] image->{ data=ffff888100a6e180 dx=8 dy=48 height=16 width=8 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a0f01
[  223.252930][ T1675] p=ffff888112120000 vc->{ vc_origin=ffff888112120000 vc_rows=16640 vc_cols=2 vc_scr_end=ffff888112130400 } start=ffff888112120004 count=33280 xx=0 yy=0
[  223.253187][ T1675] image->{ data=ffff888100a6e190 dx=0 dy=0 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a0000
[  223.253777][ T1675] image->{ data=ffff888100a6e1b0 dx=0 dy=16 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a0500
[  223.254373][ T1675] image->{ data=ffff888100a6e1d0 dx=0 dy=32 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a0a00
[  223.254867][ T1675] image->{ data=ffff888100a6e1f0 dx=0 dy=48 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a0f00
[  223.255340][ T1675] image->{ data=ffff888100a6e210 dx=0 dy=64 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a1400
[  223.255834][ T1675] image->{ data=ffff888100a6e230 dx=0 dy=80 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a1900
[  223.256307][ T1675] image->{ data=ffff888100a6e250 dx=0 dy=96 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a1e00
[  223.256800][ T1675] image->{ data=ffff888100a6e270 dx=0 dy=112 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a2300
[  223.257274][ T1675] image->{ data=ffff888100a6e290 dx=0 dy=128 height=16 width=16 } info->{ screen_base=ffff8880000a0000 fix.line_length=80 } where=ffff8880000a2800
[  224.897239][ T1675] BUG: unable to handle page fault for address: ffff888001000040
[  224.897276][ T1675] #PF: supervisor write access in kernel mode
[  224.897316][ T1675] #PF: error_code(0x0003) - permissions violation
[  224.897354][ T1675] PGD 3c01067 P4D 3c01067 PUD 3c02067 PMD 80000000010001e1 
[  224.897454][ T1675] Oops: 0003 [#1] PREEMPT SMP
[  224.897516][ T1675] CPU: 3 PID: 1675 Comm: a.out Not tainted 5.12.0+ #652
[  224.897591][ T1675] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[  224.897632][ T1675] RIP: 0010:vga16fb_imageblit+0x4b1/0x9d0
[  224.897740][ T1675] Code: f6 74 47 45 89 fe 48 89 1c 24 4d 89 ef e8 b7 a0 9d ff 48 8b 04 24 49 83 c7 01 48 89 c2 48 83 c0 01 48 89 04 24 41 0f b6 47 ff <88> 02 31 ff 44 89 f6 41 83 ee 01 e8 ef a1 9d ff 41 83 fe ff 75 cd
[  224.897820][ T1675] RSP: 0018:ffffc900010d3a30 EFLAGS: 00010286
[  224.897879][ T1675] RAX: 0000000000000000 RBX: ffff888001000040 RCX: ffff888103a40100
[  224.897972][ T1675] RDX: ffff888001000040 RSI: ffff888103a40100 RDI: 0000000000000002
[  224.898027][ T1675] RBP: ffffc900010d3af8 R08: ffffffff8182e1b9 R09: 0000000000000000
[  224.898083][ T1675] R10: 0000000000000005 R11: 0000000000080000 R12: ffff888101f36800
[  224.898137][ T1675] R13: ffff888100a6ebc8 R14: 0000000000000001 R15: ffff888100a6ebc9
[  224.898194][ T1675] FS:  00007fbefdeb6540(0000) GS:ffff88811bd80000(0000) knlGS:0000000000000000
[  224.898269][ T1675] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  224.898328][ T1675] CR2: ffff888001000040 CR3: 0000000103a56003 CR4: 00000000000706e0
[  224.898387][ T1675] Call Trace:
[  224.898405][ T1675]  bit_putcs+0x4dd/0x700
[  224.898493][ T1675]  ? write_comp_data+0x1c/0x70
[  224.898568][ T1675]  ? __sanitizer_cov_trace_switch+0x50/0x90
[  224.898655][ T1675]  ? bit_clear+0x1e0/0x1e0
[  224.898742][ T1675]  fbcon_putcs+0x13c/0x150
[  224.898823][ T1675]  do_update_region+0x1c6/0x2b0
[  224.898935][ T1675]  redraw_screen+0x2e4/0x310
[  224.899051][ T1675]  fbcon_blank+0x38f/0x440
[  224.899139][ T1675]  do_unblank_screen+0x10f/0x210
[  224.899240][ T1675]  vt_ioctl+0x116f/0x19c0
[  224.899325][ T1675]  ? lock_is_held_type+0xfc/0x170
[  224.899413][ T1675]  ? write_comp_data+0x1c/0x70
[  224.899488][ T1675]  ? __sanitizer_cov_trace_switch+0x50/0x90
[  224.899576][ T1675]  ? complete_change_console+0x160/0x160
[  224.899661][ T1675]  tty_ioctl+0x630/0xbb0
[  224.899731][ T1675]  ? __sanitizer_cov_trace_pc+0x1a/0x40
[  224.899813][ T1675]  ? do_vfs_ioctl+0x9b/0xca0
[  224.899904][ T1675]  ? lock_is_held_type+0xfc/0x170
[  224.899982][ T1675]  ? tty_vhangup+0x30/0x30
[  224.900053][ T1675]  __x64_sys_ioctl+0xbb/0x110
[  224.900134][ T1675]  do_syscall_64+0x3a/0xb0
[  224.900229][ T1675]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  224.900326][ T1675] RIP: 0033:0x7fbefddda50b
[  224.900379][ T1675] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[  224.900459][ T1675] RSP: 002b:00007ffe60c4e2b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  224.900532][ T1675] RAX: ffffffffffffffda RBX: 0000557f9f780220 RCX: 00007fbefddda50b
[  224.900589][ T1675] RDX: 0000000000000000 RSI: 0000000000004b3a RDI: 0000000000000003
[  224.900641][ T1675] RBP: 0000000000000003 R08: 0000000000000000 R09: 00007fbefded0d50
[  224.900694][ T1675] R10: 0000000000000000 R11: 0000000000000246 R12: 0000557f9f780130
[  224.900748][ T1675] R13: 00007ffe60c4e3c0 R14: 0000000000000000 R15: 0000000000000000
[  224.900804][ T1675] Modules linked in: sg video rapl evdev backlight input_leds mousedev led_class button ac binfmt_misc sd_mod t10_pi crc_t10dif crct10dif_generic sr_mod cdrom crct10dif_pclmul ata_generic crct10dif_common crc32_pclmul crc32c_intel ahci ghash_clmulni_intel psmouse libahci aesni_intel atkbd ata_piix libaes libps2 crypto_simd i2c_piix4 libata i8042 rtc_cmos i2c_core cryptd serio scsi_mod
[  224.901745][ T1675] CR2: ffff888001000040
[  224.901777][ T1675] ---[ end trace 045541aa43f10c56 ]---
[  224.901841][ T1675] RIP: 0010:vga16fb_imageblit+0x4b1/0x9d0
[  224.901948][ T1675] Code: f6 74 47 45 89 fe 48 89 1c 24 4d 89 ef e8 b7 a0 9d ff 48 8b 04 24 49 83 c7 01 48 89 c2 48 83 c0 01 48 89 04 24 41 0f b6 47 ff <88> 02 31 ff 44 89 f6 41 83 ee 01 e8 ef a1 9d ff 41 83 fe ff 75 cd
[  224.902062][ T1675] RSP: 0018:ffffc900010d3a30 EFLAGS: 00010286
[  224.902181][ T1675] RAX: 0000000000000000 RBX: ffff888001000040 RCX: ffff888103a40100
[  224.902245][ T1675] RDX: ffff888001000040 RSI: ffff888103a40100 RDI: 0000000000000002
[  224.902347][ T1675] RBP: ffffc900010d3af8 R08: ffffffff8182e1b9 R09: 0000000000000000
[  224.902461][ T1675] R10: 0000000000000005 R11: 0000000000080000 R12: ffff888101f36800
[  224.902524][ T1675] R13: ffff888100a6ebc8 R14: 0000000000000001 R15: ffff888100a6ebc9
[  224.902580][ T1675] FS:  00007fbefdeb6540(0000) GS:ffff88811bd80000(0000) knlGS:0000000000000000
[  224.902655][ T1675] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  224.902714][ T1675] CR2: ffff888001000040 CR3: 0000000103a56003 CR4: 00000000000706e0
[  224.902777][ T1675] Kernel panic - not syncing: Fatal exception
[  224.903014][ T1675] Kernel Offset: disabled
[  225.661115][ T1675] Rebooting in 10 seconds..
----------

Therefore, I guess that the problem is that fbcon_putcs() from do_update_region() from
redraw_screen() from vt_kdsetmode(KD_TEXT) from ioctl(fd, KDSETMODE, KD_TEXT) tries to
redraw 2 x 16640 despite memory amount allocated for actual screen is only 80 x 30.

I don't know how to fix this problem...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
