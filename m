Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A016A1E6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C836E223;
	Mon, 24 Feb 2020 09:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E89F6E0DC
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 17:30:13 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id p67so12629424ili.23
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 09:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=R7hdqwHw5eeNO6TxhG5nNkBVCSV9QlKOYXhwkg+mFF4=;
 b=WVSX5vlEkEGWNaeHUiUAfajsX0AOtVZaOBObts4jrK+NEAVa/M7gPEUYQW7rOG7zC+
 8qfFSgAI0bryNDebnQse9Rn4+CO6MrcOow3dzJkbrM7XeIFmfMl8ciiEgyYMsBuIzus8
 1cG8kmPVBzhcO13rBrx9GJaOe1pvCSdckbxeTFVQQ1EpeOHpvyKXgWJ7+krMweOXPGYK
 L4k236lcJdKgdmgdDWz2r8oJUHnZDn28Z/6+rJSdOTdv4aPAedrm1O0kVeZcMeVyQs4I
 7Io1eoh2FhHD/EYrdPWterKWUjmQhHTHk0LAfoYW7hcK0iWnxTSqDes/P4nOup31Ejdu
 +RxA==
X-Gm-Message-State: APjAAAWzOtzeWccsry1/I2wE+dJgN7bD7hdpDpZW16aqdCKMvFC7smSH
 CJAOoAMsv+TF7Lmn+R/glM2vXuPN9BQ7ov2kp++KHGthplq3
X-Google-Smtp-Source: APXvYqy4iLo3RVULMi3CTSwi49Esqx+pcgimJdeqKMBPmV+C9TwdSokxPkYzwsPWOYE4QbyPVJO1ScaLlStwh5B53y36BlfwMOOQ
MIME-Version: 1.0
X-Received: by 2002:a92:af99:: with SMTP id v25mr55751208ill.289.1582479012287; 
 Sun, 23 Feb 2020 09:30:12 -0800 (PST)
Date: Sun, 23 Feb 2020 09:30:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000064653f059f419b58@google.com>
Subject: KASAN: use-after-free Read in bit_putcs
From: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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

Hello,

syzbot found the following crash on:

HEAD commit:    0a44cac8 Merge tag 'dma-mapping-5.6' of git://git.infradea..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11bfb74ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a61f2164c515c07f
dashboard link: https://syzkaller.appspot.com/bug?extid=b308f5fd049fbbc6e74f
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __fb_pad_aligned_buffer include/linux/fb.h:655 [inline]
BUG: KASAN: use-after-free in bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
BUG: KASAN: use-after-free in bit_putcs+0x13ee/0x1cc0 drivers/video/fbdev/core/bitblit.c:185
Read of size 1 at addr ffff8880a8087c10 by task syz-executor.2/5278

CPU: 1 PID: 5278 Comm: syz-executor.2 Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1fb/0x318 lib/dump_stack.c:118
 print_address_description+0x74/0x5c0 mm/kasan/report.c:374
 __kasan_report+0x149/0x1c0 mm/kasan/report.c:506
 kasan_report+0x26/0x50 mm/kasan/common.c:641
 __asan_report_load1_noabort+0x14/0x20 mm/kasan/generic_report.c:132
 __fb_pad_aligned_buffer include/linux/fb.h:655 [inline]
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
 bit_putcs+0x13ee/0x1cc0 drivers/video/fbdev/core/bitblit.c:185
 fbcon_putcs+0x7b4/0xad0 drivers/video/fbdev/core/fbcon.c:1360
 do_update_region+0x462/0x600 drivers/tty/vt/vt.c:677
 redraw_screen+0xcc5/0x1830 drivers/tty/vt/vt.c:1011
 vc_do_resize+0x12af/0x1af0 drivers/tty/vt/vt.c:1284
 vc_resize+0x4f/0x60 drivers/tty/vt/vt.c:1304
 vt_ioctl+0x2fa8/0x3a70 drivers/tty/vt/vt_ioctl.c:887
 tty_ioctl+0xee6/0x15c0 drivers/tty/tty_io.c:2660
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl fs/ioctl.c:763 [inline]
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl+0x113/0x190 fs/ioctl.c:770
 __x64_sys_ioctl+0x7b/0x90 fs/ioctl.c:770
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c449
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f74261f2c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f74261f36d4 RCX: 000000000045c449
RDX: 0000000020000080 RSI: 000000000000560a RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 000000000000066b R14: 00000000004c8fe0 R15: 000000000076bf2c

Allocated by task 2919:
 save_stack mm/kasan/common.c:72 [inline]
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc+0x118/0x1c0 mm/kasan/common.c:515
 kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
 __do_kmalloc_node mm/slab.c:3616 [inline]
 __kmalloc_node_track_caller+0x4d/0x60 mm/slab.c:3630
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0xe8/0x500 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1051 [inline]
 _sctp_make_chunk+0x60/0x460 net/sctp/sm_make_chunk.c:1394
 sctp_make_data net/sctp/sm_make_chunk.c:1426 [inline]
 sctp_make_datafrag_empty+0xa3/0x5b0 net/sctp/sm_make_chunk.c:740
 sctp_datamsg_from_user+0x7a8/0x1020 net/sctp/chunk.c:262
 sctp_sendmsg_to_asoc+0x7a9/0x1500 net/sctp/socket.c:1844
 sctp_sendmsg+0x15a1/0x3570 net/sctp/socket.c:2016
 inet_sendmsg+0x147/0x310 net/ipv4/af_inet.c:807
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x4f7/0x7f0 net/socket.c:2343
 ___sys_sendmsg net/socket.c:2397 [inline]
 __sys_sendmsg+0x1ed/0x290 net/socket.c:2430
 __do_sys_sendmsg net/socket.c:2439 [inline]
 __se_sys_sendmsg net/socket.c:2437 [inline]
 __x64_sys_sendmsg+0x7f/0x90 net/socket.c:2437
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 2919:
 save_stack mm/kasan/common.c:72 [inline]
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x12e/0x1e0 mm/kasan/common.c:476
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10d/0x220 mm/slab.c:3757
 skb_free_head net/core/skbuff.c:592 [inline]
 skb_release_data+0x72f/0x8c0 net/core/skbuff.c:612
 skb_release_all net/core/skbuff.c:666 [inline]
 __kfree_skb+0x59/0x1c0 net/core/skbuff.c:680
 consume_skb+0x72/0x110 net/core/skbuff.c:839
 sctp_chunk_destroy net/sctp/sm_make_chunk.c:1454 [inline]
 sctp_chunk_put+0x17b/0x200 net/sctp/sm_make_chunk.c:1481
 sctp_chunk_free+0x59/0x60 net/sctp/sm_make_chunk.c:1468
 sctp_outq_sack+0x1169/0x16a0 net/sctp/outqueue.c:1352
 sctp_cmd_process_sack net/sctp/sm_sideeffect.c:798 [inline]
 sctp_cmd_interpreter net/sctp/sm_sideeffect.c:1354 [inline]
 sctp_side_effects net/sctp/sm_sideeffect.c:1185 [inline]
 sctp_do_sm+0x18f3/0x5840 net/sctp/sm_sideeffect.c:1156
 sctp_assoc_bh_rcv+0x494/0x770 net/sctp/associola.c:1044
 sctp_inq_push+0x1ab/0x1d0 net/sctp/inqueue.c:80
 sctp_backlog_rcv+0x16c/0x4b0 net/sctp/input.c:344
 sk_backlog_rcv include/net/sock.h:938 [inline]
 __release_sock+0x1c1/0x4b0 net/core/sock.c:2437
 release_sock+0x65/0x1c0 net/core/sock.c:2953
 sctp_wait_for_connect+0x2f6/0x590 net/sctp/socket.c:9280
 sctp_sendmsg_to_asoc+0x11ba/0x1500 net/sctp/socket.c:1870
 sctp_sendmsg+0x15a1/0x3570 net/sctp/socket.c:2016
 inet_sendmsg+0x147/0x310 net/ipv4/af_inet.c:807
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x4f7/0x7f0 net/socket.c:2343
 ___sys_sendmsg net/socket.c:2397 [inline]
 __sys_sendmsg+0x1ed/0x290 net/socket.c:2430
 __do_sys_sendmsg net/socket.c:2439 [inline]
 __se_sys_sendmsg net/socket.c:2437 [inline]
 __x64_sys_sendmsg+0x7f/0x90 net/socket.c:2437
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8880a8087c00
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 16 bytes inside of
 512-byte region [ffff8880a8087c00, ffff8880a8087e00)
The buggy address belongs to the page:
page:ffffea0002a021c0 refcount:1 mapcount:0 mapping:ffff8880aa400a80 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002431688 ffffea000259d648 ffff8880aa400a80
raw: 0000000000000000 ffff8880a8087000 0000000100000004 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880a8087b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880a8087b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880a8087c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff8880a8087c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a8087d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
