Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63D453318
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 14:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5856ECD1;
	Tue, 16 Nov 2021 13:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521F06EEB3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:24:19 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 x11-20020a0566022c4b00b005e702603028so12478352iov.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=DiSi5ETUNz1KCyEdWv9m3Z+qD7X4jgaMGtAKR3v6BsY=;
 b=MvgjYwuZBQHlA2vUsHrE9yBmpbJxR2d9LEa8kyhUQ0ZN+NVgz/muacpDzHVAWu/kp+
 rrCLad6gDuGpND1ORrjdEwJ2Tdqoc3o8VeFVExF46a24FifuJI3nrkSocJis4p/1X7fL
 bC0n9prXjlh6MnZN3NP8EoOVDgR8ocEZkM2j5UYeMYzDL8gwt+cQBofkmLSX9CVycJWR
 zXHa2346lvopDzMN9yA1JY+pOrzSUXkJ8x75SBmJ3EHZ/BnYPyiKOJjIS2LvCk4OjCpD
 48bRJtatkkY96VBTdiHW/zPA3Ms67W6uwZ9WWSO979m94EIIO2pF96zMukswkZcq+agI
 RROA==
X-Gm-Message-State: AOAM530CPfL8K7t3qYvRaEXXXcd8+zCqpKbx8SiSWQnY4Ml0aZQMyH7M
 t89/FZb+j8ZotDmsd9xCWzn+iMorWF86nqRF99UJp6XoySIh
X-Google-Smtp-Source: ABdhPJxG2kNwDLNsJ0nIW91JMRKx4gKYZqGtZkvTe4pKSkuHAi48xgpNgKuCn/KmJ0OzR9n0wgm7CCxOL5D7315UcL12u4sjZE3/
MIME-Version: 1.0
X-Received: by 2002:a6b:7c46:: with SMTP id b6mr3867928ioq.129.1637054658662; 
 Tue, 16 Nov 2021 01:24:18 -0800 (PST)
Date: Tue, 16 Nov 2021 01:24:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000685c4605d0e47dad@google.com>
Subject: [syzbot] KASAN: use-after-free Read in drm_gem_object_release_handle
From: syzbot <syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Nov 2021 13:45:51 +0000
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

HEAD commit:    8ab774587903 Merge tag 'trace-v5.16-5' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1174ace6b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d3b8fd1977c1e73
dashboard link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in drm_gem_object_release_handle+0xf2/0x110 drivers/gpu/drm/drm_gem.c:252
Read of size 8 at addr ffff888028419a28 by task syz-executor.2/10905

CPU: 0 PID: 10905 Comm: syz-executor.2 Not tainted 5.16.0-rc1-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0x8d/0x320 mm/kasan/report.c:247
 __kasan_report mm/kasan/report.c:433 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:450
 drm_gem_object_release_handle+0xf2/0x110 drivers/gpu/drm/drm_gem.c:252
 idr_for_each+0x113/0x220 lib/idr.c:208
 drm_gem_release+0x22/0x30 drivers/gpu/drm/drm_gem.c:930
 drm_file_free.part.0+0x805/0xb80 drivers/gpu/drm/drm_file.c:281
 drm_file_free drivers/gpu/drm/drm_file.c:248 [inline]
 drm_close_helper.isra.0+0x17d/0x1f0 drivers/gpu/drm/drm_file.c:308
 drm_release+0x1e6/0x530 drivers/gpu/drm/drm_file.c:495
 __fput+0x286/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 __do_fast_syscall_32+0x72/0xf0 arch/x86/entry/common.c:181
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf6f4e549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000ff954ef0 EFLAGS: 00000282 ORIG_RAX: 0000000000000006
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 00000000f7084000 RDI: 00000000f70aafac
RBP: 00000000f7084000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Allocated by task 10906:
 kasan_save_stack+0x1e/0x50 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:434 [inline]
 ____kasan_kmalloc mm/kasan/common.c:513 [inline]
 ____kasan_kmalloc mm/kasan/common.c:472 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:522
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:724 [inline]
 __drm_gem_shmem_create+0x3d8/0x470 drivers/gpu/drm/drm_gem_shmem_helper.c:56
 drm_gem_shmem_create drivers/gpu/drm/drm_gem_shmem_helper.c:116 [inline]
 drm_gem_shmem_create_with_handle+0x26/0x100 drivers/gpu/drm/drm_gem_shmem_helper.c:422
 drm_gem_shmem_dumb_create+0x13f/0x290 drivers/gpu/drm/drm_gem_shmem_helper.c:538
 drm_mode_create_dumb+0x26c/0x2f0 drivers/gpu/drm/drm_dumb_buffers.c:96
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:782
 drm_ioctl+0x51e/0x9d0 drivers/gpu/drm/drm_ioctl.c:885
 drm_compat_ioctl+0x270/0x330 drivers/gpu/drm/drm_ioc32.c:987
 __do_compat_sys_ioctl+0x1c7/0x290 fs/ioctl.c:972
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

Freed by task 10906:
 kasan_save_stack+0x1e/0x50 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free mm/kasan/common.c:328 [inline]
 __kasan_slab_free+0xff/0x130 mm/kasan/common.c:374
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:1723 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1749
 slab_free mm/slub.c:3513 [inline]
 kfree+0xf6/0x560 mm/slub.c:4561
 drm_gem_object_free+0x58/0x80 drivers/gpu/drm/drm_gem.c:972
 kref_put include/linux/kref.h:65 [inline]
 __drm_gem_object_put include/drm/drm_gem.h:371 [inline]
 drm_gem_object_put include/drm/drm_gem.h:384 [inline]
 drm_gem_mmap+0x4aa/0x680 drivers/gpu/drm/drm_gem.c:1132
 call_mmap include/linux/fs.h:2167 [inline]
 mmap_region+0xd8c/0x1650 mm/mmap.c:1786
 do_mmap+0x869/0xfb0 mm/mmap.c:1575
 vm_mmap_pgoff+0x1b7/0x290 mm/util.c:519
 ksys_mmap_pgoff+0x40d/0x5a0 mm/mmap.c:1623
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

Last potentially related work creation:
 kasan_save_stack+0x1e/0x50 mm/kasan/common.c:38
 __kasan_record_aux_stack+0xf5/0x120 mm/kasan/generic.c:348
 kvfree_call_rcu+0x74/0x990 kernel/rcu/tree.c:3550
 drop_sysctl_table+0x3c0/0x4e0 fs/proc/proc_sysctl.c:1647
 unregister_sysctl_table fs/proc/proc_sysctl.c:1685 [inline]
 unregister_sysctl_table+0xc0/0x190 fs/proc/proc_sysctl.c:1660
 neigh_sysctl_unregister+0x5b/0x80 net/core/neighbour.c:3810
 addrconf_ifdown.isra.0+0xfc2/0x1630 net/ipv6/addrconf.c:3870
 addrconf_notify+0xeb/0x1bb0 net/ipv6/addrconf.c:3651
 notifier_call_chain+0xb5/0x200 kernel/notifier.c:83
 call_netdevice_notifiers_info+0xb5/0x130 net/core/dev.c:2002
 call_netdevice_notifiers_extack net/core/dev.c:2014 [inline]
 call_netdevice_notifiers net/core/dev.c:2028 [inline]
 unregister_netdevice_many+0x94f/0x1790 net/core/dev.c:11077
 ip6_tnl_exit_batch_net+0x5f5/0x890 net/ipv6/ip6_tunnel.c:2311
 ops_exit_list+0x10d/0x160 net/core/net_namespace.c:171
 cleanup_net+0x4ea/0xb00 net/core/net_namespace.c:593
 process_one_work+0x9b2/0x1690 kernel/workqueue.c:2298
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2445
 kthread+0x405/0x4f0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Second to last potentially related work creation:
 kasan_save_stack+0x1e/0x50 mm/kasan/common.c:38
 __kasan_record_aux_stack+0xf5/0x120 mm/kasan/generic.c:348
 __call_rcu kernel/rcu/tree.c:2985 [inline]
 call_rcu+0xb1/0x740 kernel/rcu/tree.c:3065
 pwq_unbound_release_workfn+0x248/0x340 kernel/workqueue.c:3738
 process_one_work+0x9b2/0x1690 kernel/workqueue.c:2298
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2445
 kthread+0x405/0x4f0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

The buggy address belongs to the object at ffff888028419800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 552 bytes inside of
 1024-byte region [ffff888028419800, ffff888028419c00)
The buggy address belongs to the page:
page:ffffea0000a10600 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28418
head:ffffea0000a10600 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 0000000000000000 dead000000000001 ffff888010c42dc0
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3675, ts 98683278438, free_ts 98683124629
 prep_new_page mm/page_alloc.c:2418 [inline]
 get_page_from_freelist+0xa72/0x2f50 mm/page_alloc.c:4149
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5369
 alloc_pages+0x1a7/0x300 mm/mempolicy.c:2191
 alloc_slab_page mm/slub.c:1793 [inline]
 allocate_slab mm/slub.c:1930 [inline]
 new_slab+0x32d/0x4a0 mm/slub.c:1993
 ___slab_alloc+0x918/0xfe0 mm/slub.c:3022
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3109
 slab_alloc_node mm/slub.c:3200 [inline]
 __kmalloc_node_track_caller+0x2cb/0x360 mm/slub.c:4956
 kmalloc_reserve net/core/skbuff.c:354 [inline]
 __alloc_skb+0xde/0x340 net/core/skbuff.c:426
 alloc_skb_fclone include/linux/skbuff.h:1176 [inline]
 tcp_stream_alloc_skb+0x66/0x910 net/ipv4/tcp.c:861
 tcp_sendmsg_locked+0xaba/0x3040 net/ipv4/tcp.c:1281
 tcp_sendmsg+0x2b/0x40 net/ipv4/tcp.c:1440
 inet_sendmsg+0x99/0xe0 net/ipv4/af_inet.c:819
 sock_sendmsg_nosec net/socket.c:704 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:724
 sock_write_iter+0x289/0x3c0 net/socket.c:1057
 call_write_iter include/linux/fs.h:2162 [inline]
 new_sync_write+0x429/0x660 fs/read_write.c:503
 vfs_write+0x7cd/0xae0 fs/read_write.c:590
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1338 [inline]
 free_pcp_prepare+0x374/0x870 mm/page_alloc.c:1389
 free_unref_page_prepare mm/page_alloc.c:3309 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3388
 skb_free_frag include/linux/skbuff.h:2949 [inline]
 skb_free_head net/core/skbuff.c:653 [inline]
 skb_release_data+0x61f/0x790 net/core/skbuff.c:677
 skb_release_all net/core/skbuff.c:742 [inline]
 __kfree_skb+0x46/0x60 net/core/skbuff.c:756
 sk_eat_skb include/net/sock.h:2652 [inline]
 tcp_recvmsg_locked+0x12e8/0x20d0 net/ipv4/tcp.c:2485
 tcp_recvmsg+0x12b/0x550 net/ipv4/tcp.c:2531
 inet_recvmsg+0x11b/0x5e0 net/ipv4/af_inet.c:850
 sock_recvmsg_nosec net/socket.c:944 [inline]
 sock_recvmsg net/socket.c:962 [inline]
 sock_recvmsg net/socket.c:958 [inline]
 sock_read_iter+0x33c/0x470 net/socket.c:1035
 call_read_iter include/linux/fs.h:2156 [inline]
 new_sync_read+0x5ba/0x6e0 fs/read_write.c:400
 vfs_read+0x35c/0x600 fs/read_write.c:481
 ksys_read+0x1ee/0x250 fs/read_write.c:619
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff888028419900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888028419980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888028419a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff888028419a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888028419b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	03 74 c0 01          	add    0x1(%rax,%rax,8),%esi
   4:	10 05 03 74 b8 01    	adc    %al,0x1b87403(%rip)        # 0x1b8740d
   a:	10 06                	adc    %al,(%rsi)
   c:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
  10:	10 07                	adc    %al,(%rdi)
  12:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
  16:	10 08                	adc    %cl,(%rax)
  18:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1c:	00 00                	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	retq
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
