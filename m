Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D035E17CD88
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F956E151;
	Sat,  7 Mar 2020 10:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264046E055
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 05:41:14 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id x2so3263303ila.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 21:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=8QrBn6vtevMXdmEfXm7wyezrQLMzd+pZc9pFYXzbb7A=;
 b=CBEsinfKcsB5hTQqVSbAfF+hvBJd6iUIzlPefbnhtLFU+oEHp60OykIlZVF8pZH5wL
 juYMxSYKXf4Vc6Jzg4+h9vay/qocd3WJtQclxvJNYPOP2VCK3Rz5LB3xYY2Na7Md8kCw
 JlS9N8/tBheC79K/63ishRTXkDWlk+VIH2fYHf1NT+eBcRaN508nIKOXrVk1itXddjo9
 25Kj0g+TMNw/QHhXBTIeUTtjmsGIQRIdgHz7O5cY5v5hdMWqZbA9+q1EokGJuYOhBrgD
 dX8iy8+t/i8nnB4gi36j9wkIZ3OHyxbsoOIds2zbzzXO3b/o0p3JdgZKdKQ/uNYYvqLx
 QuYw==
X-Gm-Message-State: ANhLgQ1ha2/1ePJhocYYLFKAplFCfXqG8aKGCZ1QHCAI/MnqujgnLFmy
 oNvefWjodI2/aXmtP4chTBy8M583GMXNHNzVwQysyHTBL2/8
X-Google-Smtp-Source: ADFU+vvEoEH+SghOZX3ris+rh4hGitpSlR4lu5HDAW/qGPxB9MopvIOmmBZK9ETnHrmCjsBACLReYgPzIMB/Tx+3s2poekB1/kQ2
MIME-Version: 1.0
X-Received: by 2002:a02:3093:: with SMTP id q141mr6351871jaq.121.1583559673441; 
 Fri, 06 Mar 2020 21:41:13 -0800 (PST)
Date: Fri, 06 Mar 2020 21:41:13 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d0f3cb05a03d37ec@google.com>
Subject: KASAN: use-after-free Read in dmabuffs_dname
From: syzbot <syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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

HEAD commit:    63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11653ac3e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9833e26bab355358
dashboard link: https://syzkaller.appspot.com/bug?extid=3643a18836bce555bff6
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in dmabuffs_dname+0x4f4/0x560 drivers/dma-buf/dma-buf.c:48
Read of size 8 at addr ffff8880a6b390e8 by task syz-executor.1/2394

CPU: 1 PID: 2394 Comm: syz-executor.1 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
 __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:641
 __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
 dmabuffs_dname+0x4f4/0x560 drivers/dma-buf/dma-buf.c:48
 tomoyo_realpath_from_path+0x165/0x660 security/tomoyo/realpath.c:259
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x2a3/0x3e0 security/tomoyo/file.c:771
 tomoyo_file_open security/tomoyo/tomoyo.c:319 [inline]
 tomoyo_file_open+0xa9/0xd0 security/tomoyo/tomoyo.c:314
 security_file_open+0x71/0x300 security/security.c:1529
 do_dentry_open+0x37a/0x1380 fs/open.c:784
 vfs_open+0xa0/0xd0 fs/open.c:914
 do_last fs/namei.c:3490 [inline]
 path_openat+0x12ee/0x3490 fs/namei.c:3607
 do_filp_open+0x192/0x260 fs/namei.c:3637
 do_sys_openat2+0x5eb/0x7e0 fs/open.c:1149
 do_sys_open+0xf2/0x180 fs/open.c:1165
 __do_compat_sys_open fs/open.c:1212 [inline]
 __se_compat_sys_open fs/open.c:1210 [inline]
 __ia32_compat_sys_open+0x79/0xb0 fs/open.c:1210
 do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
 do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
 entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7fd8e39
Code: 1d 00 00 00 89 d3 5b 5e 5d c3 8b 04 24 c3 8b 1c 24 c3 8b 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f5db2014 EFLAGS: 00000296 ORIG_RAX: 0000000000000005
RAX: ffffffffffffffda RBX: 00000000f5db204c RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000c09 RDI: 00000000f5db204c
RBP: 00000000f5db2168 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 2388:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:488
 kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
 __do_kmalloc mm/slab.c:3656 [inline]
 __kmalloc+0x163/0x770 mm/slab.c:3665
 kmalloc include/linux/slab.h:560 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 dma_buf_export+0x24d/0xa80 drivers/dma-buf/dma-buf.c:533
 ion_alloc drivers/staging/android/ion/ion.c:386 [inline]
 ion_ioctl+0x5a9/0xd20 drivers/staging/android/ion/ion.c:495
 compat_ptr_ioctl+0x6e/0xa0 fs/ioctl.c:804
 __do_compat_sys_ioctl fs/ioctl.c:857 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:808 [inline]
 __ia32_compat_sys_ioctl+0x245/0x2c0 fs/ioctl.c:808
 do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
 do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
 entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139

Freed by task 2380:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x102/0x150 mm/kasan/common.c:476
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10a/0x2c0 mm/slab.c:3757
 dma_buf_release+0x343/0x420 drivers/dma-buf/dma-buf.c:111
 __fput+0x2ff/0x890 fs/file_table.c:280
 ____fput+0x16/0x20 fs/file_table.c:313
 task_work_run+0x145/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_32_irqs_on arch/x86/entry/common.c:352 [inline]
 do_fast_syscall_32+0xbbd/0xe16 arch/x86/entry/common.c:408
 entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139

The buggy address belongs to the object at ffff8880a6b39000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 232 bytes inside of
 1024-byte region [ffff8880a6b39000, ffff8880a6b39400)
The buggy address belongs to the page:
page:ffffea00029ace40 refcount:1 mapcount:0 mapping:ffff8880aa400c40 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002346b48 ffffea00022f49c8 ffff8880aa400c40
raw: 0000000000000000 ffff8880a6b39000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880a6b38f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880a6b39000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880a6b39080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff8880a6b39100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a6b39180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
