Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465FB8EEAD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 06:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F3D10E39F;
	Mon, 22 Sep 2025 04:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE74510E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:15:28 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-4248adc62e0so22459995ab.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 21:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758514528; x=1759119328;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BakDNPWo+QkF9V9wbXmNqYGZxd72ptFmNyaovE0QhPw=;
 b=bC+RdWM39tjj5wjLiH4aPIdJUvyyFjxMPvZ1G9zsgyboYiAjbiolhoYmP0DtNCkWPg
 5TAd9X4mGKbKyyQXIKYEm9FHXEEPwD6TLDebdE+ZOiz4u2CgQM2sskPdxqfO6b4mXadD
 KjgviVTgjfU3xfuKgnz9nIxdxOOMN9GAKOXJO6UKpLq2smeX7KAvs0gXnM3jN+DUwIpU
 18DEYEo+cpf7GSYFUgoy9nhArhUKk4d+WDusgUF/VKmpKg/S1N13X5EJBPPC5no4QDUd
 owKvJyM0sfy29XG06wmvSDeGQIlc47O0975TOrn96lsIl+2Toy/vAtVhTVWxtTdkioVL
 xmcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE1gkG4mGFaMChv9RFg0QOcgjAEb28nTNJ464zNj4YSz1m+WhKA/VF74pAqwQIAqYvbe196+ZHnQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfXv0UT/doSoshlfD8wr0tXgmMlP7frT6Cssvf6hQp35lNiEYC
 ahuNtlTMGNF/f1aF5Da1r1lOaMVZYKtPIuYfgBnwyOV63z8SplntLSZuGR4NJSui08GXRRKhwlC
 MhUdyK7JNuFs6mkB5S1YucUZosMjrYTcWgZ+aVsz6hym7RpawIiJsWiMtNCk=
X-Google-Smtp-Source: AGHT+IGdtf8+tn/0tLHSfNn/WIvMRMx9qNdlFsybI223Br7aqGakbUQdFqw2QC0HSYbbI1UdSWjVmRuaUdU9L5ru6k+ec5lkq/dK
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:258a:b0:424:3b83:4f5f with SMTP id
 e9e14a558f8ab-4248190bbd3mr155108815ab.8.1758514527823; Sun, 21 Sep 2025
 21:15:27 -0700 (PDT)
Date: Sun, 21 Sep 2025 21:15:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d0cd5f.050a0220.139b6.0017.GAE@google.com>
Subject: [syzbot] [fbdev?] KASAN: slab-out-of-bounds Read in
 fb_pad_unaligned_buffer (4)
From: syzbot <syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, simona@ffwll.ch, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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

Hello,

syzbot found the following issue on:

HEAD commit:    b320789d6883 Linux 6.17-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ceae62580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d4703ac89d9e185a
dashboard link: https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/daf1f6c847dd/disk-b320789d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fbeb0bd5d987/vmlinux-b320789d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a85084f8e16b/bzImage-b320789d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in fb_pad_unaligned_buffer+0x3b8/0x440 drivers/video/fbdev/core/fbmem.c:110
Read of size 1 at addr ffff888075fb54e4 by task syz.0.1621/12752

CPU: 1 UID: 0 PID: 12752 Comm: syz.0.1621 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 fb_pad_unaligned_buffer+0x3b8/0x440 drivers/video/fbdev/core/fbmem.c:110
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:129 [inline]
 bit_putcs+0x870/0xde0 drivers/video/fbdev/core/bitblit.c:187
 fbcon_putcs+0x384/0x4a0 drivers/video/fbdev/core/fbcon.c:1327
 con_flush drivers/tty/vt/vt.c:2746 [inline]
 do_con_write+0xfed/0x8280 drivers/tty/vt/vt.c:3173
 con_write+0x23/0xb0 drivers/tty/vt/vt.c:3516
 process_output_block drivers/tty/n_tty.c:561 [inline]
 n_tty_write+0x41c/0x11e0 drivers/tty/n_tty.c:2377
 iterate_tty_write drivers/tty/tty_io.c:1006 [inline]
 file_tty_write.constprop.0+0x504/0x9b0 drivers/tty/tty_io.c:1081
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1f5fb8ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1f60a10038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f1f5fdc6180 RCX: 00007f1f5fb8ebe9
RDX: 0000000000001066 RSI: 0000200000001640 RDI: 0000000000000009
RBP: 00007f1f5fc11e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1f5fdc6218 R14: 00007f1f5fdc6180 R15: 00007ffc8f9c3728
 </TASK>

Allocated by task 10009:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:388 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:405
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4365 [inline]
 __kmalloc_noprof+0x223/0x510 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 fbcon_set_font+0x434/0xb80 drivers/video/fbdev/core/fbcon.c:2536
 con_font_set drivers/tty/vt/vt.c:4887 [inline]
 con_font_op+0x7fb/0xf50 drivers/tty/vt/vt.c:4934
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x48f/0x30a0 drivers/tty/vt/vt_ioctl.c:751
 tty_ioctl+0x661/0x1680 drivers/tty/tty_io.c:2792
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888075fb5000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 468 bytes to the right of
 allocated 784-byte region [ffff888075fb5000, ffff888075fb5310)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x75fb0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b841dc0 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b841dc0 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001d7ec01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 37, tgid 37 (kworker/u8:3), ts 77706432678, free_ts 77578310551
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x132b/0x38e0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:5148
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2487 [inline]
 allocate_slab mm/slub.c:2655 [inline]
 new_slab+0x247/0x330 mm/slub.c:2709
 ___slab_alloc+0xcf2/0x1740 mm/slub.c:3891
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3981
 __slab_alloc_node mm/slub.c:4056 [inline]
 slab_alloc_node mm/slub.c:4217 [inline]
 __do_kmalloc_node mm/slub.c:4364 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 ieee802_11_parse_elems_full+0x1db/0x3780 net/mac80211/parse.c:1011
 ieee802_11_parse_elems_crc net/mac80211/ieee80211_i.h:2462 [inline]
 ieee802_11_parse_elems net/mac80211/ieee80211_i.h:2469 [inline]
 ieee80211_inform_bss+0x10b/0x1140 net/mac80211/scan.c:79
 rdev_inform_bss net/wireless/rdev-ops.h:418 [inline]
 cfg80211_inform_single_bss_data+0x8e7/0x1df0 net/wireless/scan.c:2379
 cfg80211_inform_bss_data+0x224/0x3bd0 net/wireless/scan.c:3234
 cfg80211_inform_bss_frame_data+0x26f/0x750 net/wireless/scan.c:3325
 ieee80211_bss_info_update+0x310/0xab0 net/mac80211/scan.c:226
 ieee80211_rx_bss_info net/mac80211/ibss.c:1094 [inline]
 ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1573 [inline]
 ieee80211_ibss_rx_queued_mgmt+0x1905/0x2fd0 net/mac80211/ibss.c:1600
 ieee80211_iface_process_skb net/mac80211/iface.c:1699 [inline]
 ieee80211_iface_work+0xe2e/0x1360 net/mac80211/iface.c:1753
page last free pid 5220 tgid 5220 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0x7d5/0x10f0 mm/page_alloc.c:2895
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:340
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4180 [inline]
 slab_alloc_node mm/slub.c:4229 [inline]
 kmem_cache_alloc_noprof+0x1cb/0x3b0 mm/slub.c:4236
 getname_flags.part.0+0x4c/0x550 fs/namei.c:146
 getname_flags+0x93/0xf0 include/linux/audit.h:322
 do_readlinkat+0xb4/0x3a0 fs/stat.c:575
 __do_sys_readlink fs/stat.c:613 [inline]
 __se_sys_readlink fs/stat.c:610 [inline]
 __x64_sys_readlink+0x78/0xc0 fs/stat.c:610
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888075fb5380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888075fb5400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888075fb5480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                       ^
 ffff888075fb5500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888075fb5580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
