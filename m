Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB4693B55
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 01:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0095C10E1FD;
	Mon, 13 Feb 2023 00:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC0D10E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 00:25:51 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 h7-20020a056e021d8700b0031532629b80so2597276ila.14
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 16:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84tGHx2dc/bSnFn3PlEGqqtj4JokcAjpVRmrBLqOmcE=;
 b=ubpg57UO5ChnzFM+IAamcNupBDW6iRiNZIO+BDFMrWwi8DtyGQ83tUkxdTaxAmEI+g
 6JNmH1pFX9kyH2t6JIDXBzwUiaQE7yo0nH01UyUbWVDelL3huvpuF7sMfNdEMoTW9xnl
 MWE7HqivDiRxORvl8XtjBcELfA1mL8Ezk7QmmyZX02D/FGXueCOFnjTzaumYCXuof6tp
 sgP6mZ736KF2hx9dDCwUo8eJ4hKIlSXMvtLTod1ckiXjrRRYsiVoIrlnSFN85Y9OkjMM
 RQqEjUrX+PUlg6+QlxPE6h68GL5mJdpyZ46+Fy/j5uJqRmgjwzqPawCMaa2+Xh/u64m1
 zmcA==
X-Gm-Message-State: AO0yUKUulLtgfhl+2nlY7P1MaG5jgYjvRKbAp03xHzwGIc9n/RdSdfrK
 oB/QZI+e/KOpUMIPfxy30l+r0dk2oaVrGnwKpqy4iQPsueJp
X-Google-Smtp-Source: AK7set/i/sqqOGmFgt09qN5g0QG296Hn7EN5R+rfjDiPS0pT2DEFht5FIA7XeWf7TPT1DR3hy94RqOs9wseDFLSxY9YOyTvodlwT
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:889:b0:313:b6f1:e839 with SMTP id
 z9-20020a056e02088900b00313b6f1e839mr11390107ils.89.1676247950456; Sun, 12
 Feb 2023 16:25:50 -0800 (PST)
Date: Sun, 12 Feb 2023 16:25:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a47fd205f489e34b@google.com>
Subject: [syzbot] memory leak in vma_node_allow
From: syzbot <syzbot+58ea3177ba8bd0a5d8ee@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    0983f6bf2bfc Merge tag 'devicetree-fixes-for-6.2-2' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134dab4d480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e55e71813900595
dashboard link: https://syzkaller.appspot.com/bug?extid=58ea3177ba8bd0a5d8ee
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15052a83480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13073cfb480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dfe2e2ac7b39/disk-0983f6bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bd09e355e210/vmlinux-0983f6bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8409e5f10fab/bzImage-0983f6bf.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+58ea3177ba8bd0a5d8ee@syzkaller.appspotmail.com

Warning: Permanently added '10.128.1.168' (ECDSA) to the list of known hosts.
executing program
executing program
BUG: memory leak
unreferenced object 0xffff88810f1c75c0 (size 64):
  comm "syz-executor750", pid 5060, jiffies 4294945258 (age 13.860s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 d6 e4 04 81 88 ff ff  ................
  backtrace:
    [<ffffffff81508f84>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1062
    [<ffffffff82787cca>] kmalloc include/linux/slab.h:580 [inline]
    [<ffffffff82787cca>] vma_node_allow+0x3a/0x150 drivers/gpu/drm/drm_vma_manager.c:255
    [<ffffffff8276788e>] drm_gem_handle_create_tail+0x10e/0x250 drivers/gpu/drm/drm_gem.c:377
    [<ffffffff8278ed4d>] drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:432 [inline]
    [<ffffffff8278ed4d>] drm_gem_shmem_dumb_create+0xbd/0x200 drivers/gpu/drm/drm_gem_shmem_helper.c:534
    [<ffffffff82753a5b>] drm_mode_create_dumb+0x11b/0x150 drivers/gpu/drm/drm_dumb_buffers.c:96
    [<ffffffff82768e28>] drm_ioctl_kernel+0x148/0x260 drivers/gpu/drm/drm_ioctl.c:788
    [<ffffffff82769230>] drm_ioctl+0x2f0/0x500 drivers/gpu/drm/drm_ioctl.c:891
    [<ffffffff81642600>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81642600>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81642600>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81642600>] __x64_sys_ioctl+0x100/0x140 fs/ioctl.c:856
    [<ffffffff8498c889>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff8498c889>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84a0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888109662d80 (size 64):
  comm "syz-executor750", pid 5060, jiffies 4294945258 (age 13.870s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 d6 e4 04 81 88 ff ff  ................
  backtrace:
    [<ffffffff81508f84>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1062
    [<ffffffff82787cca>] kmalloc include/linux/slab.h:580 [inline]
    [<ffffffff82787cca>] vma_node_allow+0x3a/0x150 drivers/gpu/drm/drm_vma_manager.c:255
    [<ffffffff8276788e>] drm_gem_handle_create_tail+0x10e/0x250 drivers/gpu/drm/drm_gem.c:377
    [<ffffffff8278ed4d>] drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:432 [inline]
    [<ffffffff8278ed4d>] drm_gem_shmem_dumb_create+0xbd/0x200 drivers/gpu/drm/drm_gem_shmem_helper.c:534
    [<ffffffff82753a5b>] drm_mode_create_dumb+0x11b/0x150 drivers/gpu/drm/drm_dumb_buffers.c:96
    [<ffffffff82768e28>] drm_ioctl_kernel+0x148/0x260 drivers/gpu/drm/drm_ioctl.c:788
    [<ffffffff82769230>] drm_ioctl+0x2f0/0x500 drivers/gpu/drm/drm_ioctl.c:891
    [<ffffffff81642600>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81642600>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81642600>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81642600>] __x64_sys_ioctl+0x100/0x140 fs/ioctl.c:856
    [<ffffffff8498c889>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff8498c889>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84a0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888109662900 (size 64):
  comm "syz-executor750", pid 5069, jiffies 4294945834 (age 8.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 ce 8f 09 81 88 ff ff  ................
  backtrace:
    [<ffffffff81508f84>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1062
    [<ffffffff82787cca>] kmalloc include/linux/slab.h:580 [inline]
    [<ffffffff82787cca>] vma_node_allow+0x3a/0x150 drivers/gpu/drm/drm_vma_manager.c:255
    [<ffffffff8276788e>] drm_gem_handle_create_tail+0x10e/0x250 drivers/gpu/drm/drm_gem.c:377
    [<ffffffff8278ed4d>] drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:432 [inline]
    [<ffffffff8278ed4d>] drm_gem_shmem_dumb_create+0xbd/0x200 drivers/gpu/drm/drm_gem_shmem_helper.c:534
    [<ffffffff82753a5b>] drm_mode_create_dumb+0x11b/0x150 drivers/gpu/drm/drm_dumb_buffers.c:96
    [<ffffffff82768e28>] drm_ioctl_kernel+0x148/0x260 drivers/gpu/drm/drm_ioctl.c:788
    [<ffffffff82769230>] drm_ioctl+0x2f0/0x500 drivers/gpu/drm/drm_ioctl.c:891
    [<ffffffff81642600>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81642600>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81642600>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81642600>] __x64_sys_ioctl+0x100/0x140 fs/ioctl.c:856
    [<ffffffff8498c889>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff8498c889>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84a0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888109662940 (size 64):
  comm "syz-executor750", pid 5069, jiffies 4294945834 (age 8.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 ce 8f 09 81 88 ff ff  ................
  backtrace:
    [<ffffffff81508f84>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1062
    [<ffffffff82787cca>] kmalloc include/linux/slab.h:580 [inline]
    [<ffffffff82787cca>] vma_node_allow+0x3a/0x150 drivers/gpu/drm/drm_vma_manager.c:255
    [<ffffffff8276788e>] drm_gem_handle_create_tail+0x10e/0x250 drivers/gpu/drm/drm_gem.c:377
    [<ffffffff8278ed4d>] drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:432 [inline]
    [<ffffffff8278ed4d>] drm_gem_shmem_dumb_create+0xbd/0x200 drivers/gpu/drm/drm_gem_shmem_helper.c:534
    [<ffffffff82753a5b>] drm_mode_create_dumb+0x11b/0x150 drivers/gpu/drm/drm_dumb_buffers.c:96
    [<ffffffff82768e28>] drm_ioctl_kernel+0x148/0x260 drivers/gpu/drm/drm_ioctl.c:788
    [<ffffffff82769230>] drm_ioctl+0x2f0/0x500 drivers/gpu/drm/drm_ioctl.c:891
    [<ffffffff81642600>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81642600>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81642600>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81642600>] __x64_sys_ioctl+0x100/0x140 fs/ioctl.c:856
    [<ffffffff8498c889>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff8498c889>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84a0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
