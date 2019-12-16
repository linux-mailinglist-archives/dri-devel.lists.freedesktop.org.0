Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EF1228C9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C576E981;
	Tue, 17 Dec 2019 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 11:09:36 UTC
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn
 [202.108.3.21])
 by gabe.freedesktop.org (Postfix) with SMTP id D7D7F6E4C5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:09:36 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.219.0.244])
 by sina.com with ESMTP
 id 5DF764A60000985D; Mon, 16 Dec 2019 19:04:11 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 334263629893
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in fbcon_cursor
Date: Mon, 16 Dec 2019 19:03:57 +0800
Message-Id: <20191216110357.5060-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, syzkaller-bugs@googlegroups.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 15 Dec 2019 12:35:09 -0800
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    07c4b9e9 Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14b61f41e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79f79de2a27d3e3d
> dashboard link: https://syzkaller.appspot.com/bug?extid=9116ecc1978ca3a12f43
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119fa6b6e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in fbcon_cursor+0x4ef/0x660  
> drivers/video/fbdev/core/fbcon.c:1380
> Read of size 2 at addr ffff8880959ff0cc by task syz-executor.0/10203
> 
> CPU: 1 PID: 10203 Comm: syz-executor.0 Not tainted 5.5.0-rc1-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x197/0x210 lib/dump_stack.c:118
>   print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
>   __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
>   kasan_report+0x12/0x20 mm/kasan/common.c:639
>   __asan_report_load2_noabort+0x14/0x20 mm/kasan/generic_report.c:133
>   fbcon_cursor+0x4ef/0x660 drivers/video/fbdev/core/fbcon.c:1380
>   fbcon_scrolldelta+0x679/0x1220 drivers/video/fbdev/core/fbcon.c:2877
>   fbcon_set_origin+0x43/0x50 drivers/video/fbdev/core/fbcon.c:2928
>   set_origin+0xf3/0x400 drivers/tty/vt/vt.c:919
>   vc_do_resize+0xacc/0x1460 drivers/tty/vt/vt.c:1264
>   vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
>   vt_ioctl+0x14bb/0x26d0 drivers/tty/vt/vt_ioctl.c:840
>   tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
>   vfs_ioctl fs/ioctl.c:47 [inline]
>   file_ioctl fs/ioctl.c:545 [inline]
>   do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
>   ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
>   __do_sys_ioctl fs/ioctl.c:756 [inline]
>   __se_sys_ioctl fs/ioctl.c:754 [inline]
>   __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>   do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x45a909
> Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
> ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f1a84ca0c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a909
> RDX: 0000000020000000 RSI: 0000000000005609 RDI: 0000000000000003
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f1a84ca16d4
> R13: 00000000004c7009 R14: 00000000004dd670 R15: 00000000ffffffff
> 
> Allocated by task 9734:
>   save_stack+0x23/0x90 mm/kasan/common.c:72
>   set_track mm/kasan/common.c:80 [inline]
>   __kasan_kmalloc mm/kasan/common.c:513 [inline]
>   __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
>   kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
>   __do_kmalloc mm/slab.c:3656 [inline]
>   __kmalloc+0x163/0x770 mm/slab.c:3665
>   kmalloc include/linux/slab.h:561 [inline]
>   kzalloc include/linux/slab.h:670 [inline]
>   vc_do_resize+0x262/0x1460 drivers/tty/vt/vt.c:1187
>   vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
>   vt_ioctl+0x14bb/0x26d0 drivers/tty/vt/vt_ioctl.c:840
>   tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
>   vfs_ioctl fs/ioctl.c:47 [inline]
>   file_ioctl fs/ioctl.c:545 [inline]
>   do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
>   ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
>   __do_sys_ioctl fs/ioctl.c:756 [inline]
>   __se_sys_ioctl fs/ioctl.c:754 [inline]
>   __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>   do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Freed by task 10203:
>   save_stack+0x23/0x90 mm/kasan/common.c:72
>   set_track mm/kasan/common.c:80 [inline]
>   kasan_set_free_info mm/kasan/common.c:335 [inline]
>   __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
>   kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
>   __cache_free mm/slab.c:3426 [inline]
>   kfree+0x10a/0x2c0 mm/slab.c:3757
>   vc_do_resize+0xa69/0x1460 drivers/tty/vt/vt.c:1261
>   vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
>   vt_ioctl+0x14bb/0x26d0 drivers/tty/vt/vt_ioctl.c:840
>   tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
>   vfs_ioctl fs/ioctl.c:47 [inline]
>   file_ioctl fs/ioctl.c:545 [inline]
>   do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
>   ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
>   __do_sys_ioctl fs/ioctl.c:756 [inline]
>   __se_sys_ioctl fs/ioctl.c:754 [inline]
>   __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>   do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> The buggy address belongs to the object at ffff8880959ff0c0
>   which belongs to the cache kmalloc-32 of size 32
> The buggy address is located 12 bytes inside of
>   32-byte region [ffff8880959ff0c0, ffff8880959ff0e0)
> The buggy address belongs to the page:
> page:ffffea0002567fc0 refcount:1 mapcount:0 mapping:ffff8880aa4001c0  
> index:0xffff8880959fffc1
> raw: 00fffe0000000200 ffffea00027c7748 ffffea000276ee08 ffff8880aa4001c0
> raw: ffff8880959fffc1 ffff8880959ff000 000000010000003f 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffff8880959fef80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8880959ff000: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
> > ffff8880959ff080: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
>                                                ^
>   ffff8880959ff100: 00 01 fc fc fc fc fc fc fb fb fb fb fc fc fc fc
>   ffff8880959ff180: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
> ==================================================================

Release old screen buffer after use.

--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1161,6 +1161,7 @@ static int vc_do_resize(struct tty_struc
 	unsigned int new_cols, new_rows, new_row_size, new_screen_size;
 	unsigned int user;
 	unsigned short *newscreen;
+	unsigned short *oldscreen;
 	struct uni_screen *new_uniscr = NULL;
 
 	WARN_CONSOLE_UNLOCKED();
@@ -1258,10 +1259,11 @@ static int vc_do_resize(struct tty_struc
 	if (new_scr_end > new_origin)
 		scr_memsetw((void *)new_origin, vc->vc_video_erase_char,
 			    new_scr_end - new_origin);
-	kfree(vc->vc_screenbuf);
+	oldscreen = vc->vc_screenbuf;
 	vc->vc_screenbuf = newscreen;
 	vc->vc_screenbuf_size = new_screen_size;
 	set_origin(vc);
+	kfree(oldscreen);
 
 	/* do part of a reset_terminal() */
 	vc->vc_top = 0;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
