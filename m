Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB3A27A816
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CEE6E328;
	Mon, 28 Sep 2020 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2D56E0FB
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 02:03:16 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id x1so3510181iov.20
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 19:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=NC2wUH41jP18o/wjPjgQ83NFv0wnrPzqydTUpCudUfo=;
 b=lJc5ckHCcRF3HH59M3KZFJ7uqGJkscpSS0JM7nwezT1S56jpP4fm1IElvmwK+GsgNl
 PVIXvjH2eMYC+G4/WCnUlsOigugguGxHbDC69FqL3rLTm5wO2rs+yHdHURT0xR39+Sks
 uMRpDtigzlrSRRjKN22tHhI6nBby/xU17IuRVpnHxVIV557arb9/m5zoLAXZNHfgwa/Y
 FKGNr57jRbd8uIl5g//4sS5aQcw5Lx4Y7GuMzKezJCC4X1/eJKex08QtAfatAV5U10My
 HL9HzAVJodwRr9A0PDcdwKqL65ZliO5VZtIqmnJO4vQDqWyC9Ju/wriiThNpurpYHZs+
 McLA==
X-Gm-Message-State: AOAM531UWQxnGUcKK6mkR+39d/5lW4Cwu+jY8iAE3JJL5l1csIrew3pT
 CRZUHDZP0/2tTT8Un3qYg1Kmi9N5VG27UTeY8CIJNh9i5E8d
X-Google-Smtp-Source: ABdhPJx4Isq0YfHLtYAudG7Z8MoW/JHCXhhrlzbGPODTmqFpxpR/6szS8gR2pFh+V9ciHxmvv2mb7VLe19d8Ai2+4TzctwgbaKE7
MIME-Version: 1.0
X-Received: by 2002:a92:99cb:: with SMTP id t72mr2471688ilk.172.1601085796148; 
 Fri, 25 Sep 2020 19:03:16 -0700 (PDT)
Date: Fri, 25 Sep 2020 19:03:16 -0700
In-Reply-To: <00000000000064653f059f419b58@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000226d3f05b02dd607@google.com>
Subject: Re: KASAN: use-after-free Read in bit_putcs
From: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp, 
 syzkaller-bugs@googlegroups.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has found a reproducer for the following issue on:

HEAD commit:    171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13b41d03900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=240e2ebab67245c7
dashboard link: https://syzkaller.appspot.com/bug?extid=b308f5fd049fbbc6e74f
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143d11d3900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150d16e5900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __fb_pad_aligned_buffer include/linux/fb.h:654 [inline]
BUG: KASAN: use-after-free in bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
BUG: KASAN: use-after-free in bit_putcs+0xbb6/0xd20 drivers/video/fbdev/core/bitblit.c:185
Read of size 1 at addr ffff88809df498fe by task syz-executor859/6860

CPU: 1 PID: 6860 Comm: syz-executor859 Not tainted 5.9.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 __fb_pad_aligned_buffer include/linux/fb.h:654 [inline]
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
 bit_putcs+0xbb6/0xd20 drivers/video/fbdev/core/bitblit.c:185
 fbcon_putcs+0x35a/0x450 drivers/video/fbdev/core/fbcon.c:1308
 con_flush drivers/tty/vt/vt.c:2575 [inline]
 do_con_write+0xb6b/0x1dd0 drivers/tty/vt/vt.c:2905
 con_write+0x22/0xb0 drivers/tty/vt/vt.c:3250
 process_output_block drivers/tty/n_tty.c:595 [inline]
 n_tty_write+0x3ce/0xf80 drivers/tty/n_tty.c:2333
 do_tty_write drivers/tty/tty_io.c:962 [inline]
 tty_write+0x4d9/0x870 drivers/tty/tty_io.c:1046
 vfs_write+0x2b0/0x730 fs/read_write.c:576
 ksys_write+0x12d/0x250 fs/read_write.c:631
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x4403c9
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 13 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd97e140c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 00000000004403c9
RDX: 0000000000001006 RSI: 0000000020000180 RDI: 0000000000000006
RBP: 00000000006cb018 R08: 00000000004002c8 R09: 00000000004002c8
R10: 000000000000000d R11: 0000000000000246 R12: 0000000000401c30
R13: 0000000000401cc0 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 6860:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:461
 __do_kmalloc mm/slab.c:3655 [inline]
 __kmalloc+0x1b0/0x360 mm/slab.c:3664
 kmalloc include/linux/slab.h:559 [inline]
 kzalloc include/linux/slab.h:666 [inline]
 tomoyo_init_log+0x1376/0x1ee0 security/tomoyo/audit.c:275
 tomoyo_supervisor+0x34d/0xef0 security/tomoyo/common.c:2097
 tomoyo_audit_env_log security/tomoyo/environ.c:36 [inline]
 tomoyo_env_perm+0x17f/0x1f0 security/tomoyo/environ.c:63
 tomoyo_environ security/tomoyo/domain.c:674 [inline]
 tomoyo_find_next_domain+0x1438/0x1f77 security/tomoyo/domain.c:881
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:101 [inline]
 tomoyo_bprm_check_security+0x121/0x1a0 security/tomoyo/tomoyo.c:91
 security_bprm_check+0x45/0xa0 security/security.c:840
 search_binary_handler fs/exec.c:1807 [inline]
 exec_binprm fs/exec.c:1860 [inline]
 bprm_execve+0x879/0x1b10 fs/exec.c:1931
 do_execveat_common+0x626/0x7c0 fs/exec.c:2026
 do_execve fs/exec.c:2094 [inline]
 __do_sys_execve fs/exec.c:2170 [inline]
 __se_sys_execve fs/exec.c:2165 [inline]
 __x64_sys_execve+0x8f/0xc0 fs/exec.c:2165
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 6860:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:56
 kasan_set_free_info+0x1b/0x30 mm/kasan/generic.c:355
 __kasan_slab_free+0xd8/0x120 mm/kasan/common.c:422
 __cache_free mm/slab.c:3418 [inline]
 kfree+0x10e/0x2b0 mm/slab.c:3756
 tomoyo_supervisor+0x36e/0xef0 security/tomoyo/common.c:2149
 tomoyo_audit_env_log security/tomoyo/environ.c:36 [inline]
 tomoyo_env_perm+0x17f/0x1f0 security/tomoyo/environ.c:63
 tomoyo_environ security/tomoyo/domain.c:674 [inline]
 tomoyo_find_next_domain+0x1438/0x1f77 security/tomoyo/domain.c:881
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:101 [inline]
 tomoyo_bprm_check_security+0x121/0x1a0 security/tomoyo/tomoyo.c:91
 security_bprm_check+0x45/0xa0 security/security.c:840
 search_binary_handler fs/exec.c:1807 [inline]
 exec_binprm fs/exec.c:1860 [inline]
 bprm_execve+0x879/0x1b10 fs/exec.c:1931
 do_execveat_common+0x626/0x7c0 fs/exec.c:2026
 do_execve fs/exec.c:2094 [inline]
 __do_sys_execve fs/exec.c:2170 [inline]
 __se_sys_execve fs/exec.c:2165 [inline]
 __x64_sys_execve+0x8f/0xc0 fs/exec.c:2165
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff88809df49800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 254 bytes inside of
 1024-byte region [ffff88809df49800, ffff88809df49c00)
The buggy address belongs to the page:
page:000000001b295380 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x9df49
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea00027dc7c8 ffff8880aa041850 ffff8880aa040700
raw: 0000000000000000 ffff88809df49000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88809df49780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88809df49800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88809df49880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88809df49900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88809df49980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
