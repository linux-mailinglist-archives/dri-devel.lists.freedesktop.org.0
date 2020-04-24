Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BADA1B7FEE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58726EB2E;
	Fri, 24 Apr 2020 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2249 seconds by postgrey-1.36 at gabe;
 Fri, 24 Apr 2020 13:56:50 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5EA89AAE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 13:56:50 +0000 (UTC)
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 03ODJAHa025412;
 Fri, 24 Apr 2020 22:19:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Fri, 24 Apr 2020 22:19:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 03ODJ4tA025291
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 24 Apr 2020 22:19:10 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: Re: INFO: task hung in vcs_open
To: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <000000000000e23c2805a4027606@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <1cb243b7-e767-3bf3-5303-ab69c58c81b3@I-love.SAKURA.ne.jp>
Date: Fri, 24 Apr 2020 22:19:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <000000000000e23c2805a4027606@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: syzbot <syzbot+975c6b229a82b59591c0@syzkaller.appspotmail.com>,
 nico@fluxnic.net, gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An unkillable task report

INFO: task syz-executor.2:10292 can't die for more than 143 seconds.
syz-executor.2  R  running task    26216 10292   7415 0x00004006
Call Trace:
 preempt_schedule_irq+0xb0/0x150 kernel/sched/core.c:4346
 retint_kernel+0x1b/0x2b
RIP: 0010:bitfill_aligned+0x12/0x200 drivers/video/fbdev/core/cfbfillrect.c:37
(...snipped...)
 cfb_fillrect+0x418/0x7a0 drivers/video/fbdev/core/cfbfillrect.c:327
 vga16fb_fillrect+0x68f/0x1960 drivers/video/fbdev/vga16fb.c:951
 bit_clear_margins+0x2d5/0x4a0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins+0x1de/0x240 drivers/video/fbdev/core/fbcon.c:1381
 fbcon_switch+0xd21/0x1740 drivers/video/fbdev/core/fbcon.c:2363
 redraw_screen+0x2ae/0x770 drivers/tty/vt/vt.c:1009
 fbcon_modechanged+0x5c3/0x790 drivers/video/fbdev/core/fbcon.c:3000
 fbcon_update_vcs+0x3a/0x50 drivers/video/fbdev/core/fbcon.c:3047
 fb_set_var+0xad0/0xd40 drivers/video/fbdev/core/fbmem.c:1056
 do_fb_ioctl+0x390/0x6e0 drivers/video/fbdev/core/fbmem.c:1109
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

suggests that a killed thread is stalling at

                while (height--) {
                        dst += dst_idx >> (ffs(bits) - 1);
                        dst_idx &= (bits - 1);
                        fill_op32(p, dst, dst_idx, pat, width*bpp, bits,
                                  bswapmask);
                        dst_idx += p->fix.line_length*8;
                }

loop where "(unsigned long) height" became unexpectedly large.

This value seems to be determined as "(unsigned int) bh" at
bit_clear_margins(). I guess that bh became a value near UINT_MAX
due to hitting info->var.yres < (vc->vc_rows*ch) case.
Can this legally happen? If yes, we need overflow check here.

static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
                              int color, int bottom_only)
{
        unsigned int cw = vc->vc_font.width;
        unsigned int ch = vc->vc_font.height;
        unsigned int rw = info->var.xres - (vc->vc_cols*cw);
        unsigned int bh = info->var.yres - (vc->vc_rows*ch);
        unsigned int rs = info->var.xres - rw;
        unsigned int bs = info->var.yres - bh;
        struct fb_fillrect region;

        region.color = color;
        region.rop = ROP_COPY;

        if (rw && !bottom_only) {
                region.dx = info->var.xoffset + rs;
                region.dy = 0;
                region.width = rw;
                region.height = info->var.yres_virtual;
                info->fbops->fb_fillrect(info, &region);
        }

        if (bh) {
                region.dx = info->var.xoffset;
                region.dy = info->var.yoffset + bs;
                region.width = rs;
                region.height = bh;
                info->fbops->fb_fillrect(info, &region);
        }
}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
