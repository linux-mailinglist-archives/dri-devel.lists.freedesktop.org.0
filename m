Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A757FA18
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E971131FD;
	Mon, 25 Jul 2022 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE22C91FAC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 16:23:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id oy13so9448108ejb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Ys+hi8PB64gYVcU3Rir+4zRigotybpzIBXkZ6P6FTTw=;
 b=VpAHXWLShO7dnzUSMFXwgTudZAcdkY4sYsE0F9+jg77TUbdrLcwF2EjlUdTViOjuQb
 l6D541zrfsK5XA97PNPxHHs8EdmZFJr19V2aWbyN3ZlQcHaUUjsGnojV6f7A2uigK3S0
 12m6aPprjSUl8sIwCS1X2mqDXy25we2fM8PmaCXl4cj3qYtVbbB+s6WFJwW51Ma3PDc/
 hIN87r5fOUxwyGVhG83MvoH1m5qtBB2tXn8EXip3xaY2AXQM8K/6OWTyEi8XoqPHh76Q
 PGvO3sNP4BUlcuRV2eLh03SG63OldfJuwgkY6ek35BU4I6l+h0SGeBx/0xk8KCtb5wK3
 M55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Ys+hi8PB64gYVcU3Rir+4zRigotybpzIBXkZ6P6FTTw=;
 b=1Xm0DvsgsiaiiMJp5LK6l/OKZyE1Ljp8TchYMoN5aOMXreN7B4UxMPl91afDAYrqd/
 Nh5HwxeaRKGXsvCZ5dvKfSiyBt9T4D7+Zqi9XY/eyzbHihzD2V15uEDRtVk2GhYnQM4W
 KR0ZK61GmVbE1t6+s0bK5BW//Fzdco6rpWe9CzFLhixAYMUJCp7z9PzXU6G+2/CALnSU
 JqwkdaP+P8/xhBW1Ft8bW1ZOhfilikIisCwpd3C+E5QWmUR492Nq/V7dg03s3Uf+7KNW
 mq4yRwYPWXhd5npdB7ktlOz1o7NIg8cjb7tLpJxdRUFudiHr7mLbH1r5j+cvi4Bvfpjd
 HTqw==
X-Gm-Message-State: AJIora9AWXu0okzolhUeKobhD0qlnve1HOpBKwcmqZkOrZR4BlRre4lc
 IPoGpo5c8fGkXPLWEA5kT1mUz67l2l+uhqFO6Js=
X-Google-Smtp-Source: AGRyM1vsHQ4VQXvHF7LrwzYz1tg1njb89EmfRMKa+bPrAqx0E5HIxAWx0tt8UP2bU2ExA+yMNyJ3Dee0F1xsCwZ6rDU=
X-Received: by 2002:a17:907:a056:b0:72b:1964:fbcc with SMTP id
 gz22-20020a170907a05600b0072b1964fbccmr509511ejc.489.1658507006072; Fri, 22
 Jul 2022 09:23:26 -0700 (PDT)
MIME-Version: 1.0
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Fri, 22 Jul 2022 09:23:14 -0700
Message-ID: <CANX2M5Ysmgv1b4toRxeTDiKtpJyv_-dTqsRediqd8NbT=RKObQ@mail.gmail.com>
Subject: KASAN: use-after-free Read in drm_gem_object_release
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f4eb6805e467400c"
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: fleischermarius@googlemail.com, syzkaller@googlegroups.com,
 its.priyanka.bose@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f4eb6805e467400c
Content-Type: text/plain; charset="UTF-8"

Hi,

We would like to report the following bug which has been found by our
modified version of syzkaller.

======================================================
description: KASAN: use-after-free Read in drm_gem_object_release
affected file: drivers/gpu/drm/drm_gem.c
kernel version: 5.4.206
kernel commit: 981f87403bb9841f1e0b7953e12a51f09a47a4f0
git tree: upstream
kernel config: https://syzkaller.appspot.com/text?tag=KernelConfig&x=1aab6d4187ddf667
crash reproducer: attached
======================================================
Crash log:
======================================================
BUG: KASAN: use-after-free in drm_gem_object_release+0xf7/0x120
drivers/gpu/drm/drm_gem.c:952
Read of size 8 at addr ffff888069f2d110 by task syz-executor.2/9649

CPU: 0 PID: 9649 Comm: syz-executor.2 Tainted: G           OE     5.4.206+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1a0/0x217 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x343 mm/kasan/report.c:374
 __kasan_report.cold+0x75/0x8d mm/kasan/report.c:506
 kasan_report+0x10/0x20 mm/kasan/common.c:645
 drm_gem_object_release+0xf7/0x120 drivers/gpu/drm/drm_gem.c:952
 drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:106 [inline]
 drm_gem_vram_create+0x180/0x1f0 drivers/gpu/drm/drm_gem_vram_helper.c:135
 drm_gem_vram_fill_create_dumb+0x13b/0x2c0
drivers/gpu/drm/drm_gem_vram_helper.c:382
 drm_gem_vram_driver_dumb_create+0x5e/0xe0
drivers/gpu/drm/drm_gem_vram_helper.c:509
 drm_mode_create_dumb+0x2a0/0x330 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x21a/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x52f/0xa70 drivers/gpu/drm/drm_ioctl.c:890
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f6b40bd24ed
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6b3eb82be8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6b40cf0f60 RCX: 00007f6b40bd24ed
RDX: 0000000020000180 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 00007f6b3eb82c40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
R13: 00007ffc4fb462af R14: 00007f6b40cf0f60 R15: 00007f6b3eb82d80

Allocated by task 9649:
 save_stack+0x1b/0x80 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 __kasan_kmalloc+0xd2/0xe0 mm/kasan/common.c:521
 kmem_cache_alloc_trace+0x13a/0x4e0 mm/slab.c:3550
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:690 [inline]
 drm_gem_vram_create+0x53/0x1f0 drivers/gpu/drm/drm_gem_vram_helper.c:131
 drm_gem_vram_fill_create_dumb+0x13b/0x2c0
drivers/gpu/drm/drm_gem_vram_helper.c:382
 drm_gem_vram_driver_dumb_create+0x5e/0xe0
drivers/gpu/drm/drm_gem_vram_helper.c:509
 drm_mode_create_dumb+0x2a0/0x330 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x21a/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x52f/0xa70 drivers/gpu/drm/drm_ioctl.c:890
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 9649:
 save_stack+0x1b/0x80 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 kasan_set_free_info mm/kasan/common.c:334 [inline]
 __kasan_slab_free+0x103/0x150 mm/kasan/common.c:478
 __cache_free mm/slab.c:3425 [inline]
 kfree+0x10b/0x330 mm/slab.c:3756
 ttm_bo_release_list+0x335/0x4e0 drivers/gpu/drm/ttm/ttm_bo.c:166
 kref_put include/linux/kref.h:65 [inline]
 kref_put include/linux/kref.h:62 [inline]
 ttm_bo_release+0x44c/0xf60 drivers/gpu/drm/ttm/ttm_bo.c:686
 kref_put include/linux/kref.h:65 [inline]
 kref_put include/linux/kref.h:62 [inline]
 ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:691 [inline]
 ttm_bo_init_reserved+0x8c1/0x10c0 drivers/gpu/drm/ttm/ttm_bo.c:1390
 ttm_bo_init+0x10e/0x4a0 drivers/gpu/drm/ttm/ttm_bo.c:1419
 drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:97 [inline]
 drm_gem_vram_create+0x15c/0x1f0 drivers/gpu/drm/drm_gem_vram_helper.c:135
 drm_gem_vram_fill_create_dumb+0x13b/0x2c0
drivers/gpu/drm/drm_gem_vram_helper.c:382
 drm_gem_vram_driver_dumb_create+0x5e/0xe0
drivers/gpu/drm/drm_gem_vram_helper.c:509
 drm_mode_create_dumb+0x2a0/0x330 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x21a/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x52f/0xa70 drivers/gpu/drm/drm_ioctl.c:890
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff888069f2d000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 272 bytes inside of
 1024-byte region [ffff888069f2d000, ffff888069f2d400)
The buggy address belongs to the page:
page:ffffea0001a7cb40 refcount:1 mapcount:0 mapping:ffff888119400c40 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002831748 ffffea00019062c8 ffff888119400c40
raw: 0000000000000000 ffff888069f2d000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888069f2d000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888069f2d080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888069f2d100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888069f2d180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888069f2d200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
==================================================================
BUG: KASAN: double-free or invalid-free in
drm_gem_vram_create+0x1b7/0x1f0
drivers/gpu/drm/drm_gem_vram_helper.c:142

CPU: 0 PID: 9649 Comm: syz-executor.2 Tainted: G    B      OE     5.4.206+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1a0/0x217 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x343 mm/kasan/report.c:374
 kasan_report_invalid_free+0x61/0xa0 mm/kasan/report.c:468
 __kasan_slab_free+0x135/0x150 mm/kasan/common.c:457
 __cache_free mm/slab.c:3425 [inline]
 kfree+0x10b/0x330 mm/slab.c:3756
 drm_gem_vram_create+0x1b7/0x1f0 drivers/gpu/drm/drm_gem_vram_helper.c:142
 drm_gem_vram_fill_create_dumb+0x13b/0x2c0
drivers/gpu/drm/drm_gem_vram_helper.c:382
 drm_gem_vram_driver_dumb_create+0x5e/0xe0
drivers/gpu/drm/drm_gem_vram_helper.c:509
 drm_mode_create_dumb+0x2a0/0x330 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x21a/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x52f/0xa70 drivers/gpu/drm/drm_ioctl.c:890
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f6b40bd24ed
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6b3eb82be8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6b40cf0f60 RCX: 00007f6b40bd24ed
RDX: 0000000020000180 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 00007f6b3eb82c40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
R13: 00007ffc4fb462af R14: 00007f6b40cf0f60 R15: 00007f6b3eb82d80

Allocated by task 9649:
 save_stack+0x1b/0x80 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 __kasan_kmalloc+0xd2/0xe0 mm/kasan/common.c:521
 kmem_cache_alloc_trace+0x13a/0x4e0 mm/slab.c:3550
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:690 [inline]
 drm_gem_vram_create+0x53/0x1f0 drivers/gpu/drm/drm_gem_vram_helper.c:131
 drm_gem_vram_fill_create_dumb+0x13b/0x2c0
drivers/gpu/drm/drm_gem_vram_helper.c:382
 drm_gem_vram_driver_dumb_create+0x5e/0xe0
drivers/gpu/drm/drm_gem_vram_helper.c:509
 drm_mode_create_dumb+0x2a0/0x330 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x21a/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x52f/0xa70 drivers/gpu/drm/drm_ioctl.c:890
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 9649:
 save_stack+0x1b/0x80 mm/kasan/common.c:71
 set_track mm/kasan/common.c:79 [inline]
 kasan_set_free_info mm/kasan/common.c:334 [inline]
 __kasan_slab_free+0x103/0x150 mm/kasan/common.c:478
 __cache_free mm/slab.c:3425 [inline]
 kfree+0x10b/0x330 mm/slab.c:3756
 ttm_bo_release_list+0x335/0x4e0 drivers/gpu/drm/ttm/ttm_bo.c:166
 kref_put include/linux/kref.h:65 [inline]
 kref_put include/linux/kref.h:62 [inline]
 ttm_bo_release+0x44c/0xf60 drivers/gpu/drm/ttm/ttm_bo.c:686
 kref_put include/linux/kref.h:65 [inline]
 kref_put include/linux/kref.h:62 [inline]
 ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:691 [inline]
 ttm_bo_init_reserved+0x8c1/0x10c0 drivers/gpu/drm/ttm/ttm_bo.c:1390
 ttm_bo_init+0x10e/0x4a0 drivers/gpu/drm/ttm/ttm_bo.c:1419
 drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:97 [inline]
 drm_gem_vram_create+0x15c/0x1f0 drivers/gpu/drm/drm_gem_vram_helper.c:135
 drm_gem_vram_fill_create_dumb+0x13b/0x2c0
drivers/gpu/drm/drm_gem_vram_helper.c:382
 drm_gem_vram_driver_dumb_create+0x5e/0xe0
drivers/gpu/drm/drm_gem_vram_helper.c:509
 drm_mode_create_dumb+0x2a0/0x330 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x21a/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x52f/0xa70 drivers/gpu/drm/drm_ioctl.c:890
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:510 [inline]
 do_vfs_ioctl+0xd30/0x1340 fs/ioctl.c:697
 ksys_ioctl+0x9b/0xc0 fs/ioctl.c:714
 __do_sys_ioctl fs/ioctl.c:721 [inline]
 __se_sys_ioctl fs/ioctl.c:719 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:719
 do_syscall_64+0xf6/0x7b0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff888069f2d000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 0 bytes inside of
 1024-byte region [ffff888069f2d000, ffff888069f2d400)
The buggy address belongs to the page:
page:ffffea0001a7cb40 refcount:1 mapcount:0 mapping:ffff888119400c40 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002831748 ffffea00019062c8 ffff888119400c40
raw: 0000000000000000 ffff888069f2d000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888069f2cf00: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
 ffff888069f2cf80: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
>ffff888069f2d000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888069f2d080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888069f2d100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

-- 
Thanks and Regards,

Dipanjan

--000000000000f4eb6805e467400c
Content-Type: application/octet-stream; name="repro.syz"
Content-Disposition: attachment; filename="repro.syz"
Content-Transfer-Encoding: base64
Content-ID: <f_l5wo5z7p1>
X-Attachment-Id: f_l5wo5z7p1

cjAgPSBzeXpfb3Blbl9kZXYkZHJpKCYoMHg3ZjAwMDAwMDA1NDApLCAweDIwMDAwMDAwMDAwMDAw
MDAsIDB4MCkKaW9jdGwkRFJNX0lPQ1RMX01PREVfQ1JFQVRFX0RVTUIocjAsIDB4YzAyMDY0YjIs
ICYoMHg3ZjAwMDAwMDAxODApPXsweDcsIDB4ZmMwMDAsIDB4YzM5fSkgKGZhaWxfbnRoOiAyMCkK
--000000000000f4eb6805e467400c
Content-Type: text/x-csrc; charset="US-ASCII"; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l5wo5z710>
X-Attachment-Id: f_l5wo5z710

Ly8gYXV0b2dlbmVyYXRlZCBieSBzeXprYWxsZXIgKGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUv
c3l6a2FsbGVyKQoKI2RlZmluZSBfR05VX1NPVVJDRSAKCiNpbmNsdWRlIDxlbmRpYW4uaD4KI2lu
Y2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8c2NoZWQuaD4KI2lu
Y2x1ZGUgPHN0ZGFyZy5oPgojaW5jbHVkZSA8c3RkYm9vbC5oPgojaW5jbHVkZSA8c3RkaW50Lmg+
CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcu
aD4KI2luY2x1ZGUgPHN5cy9tb3VudC5oPgojaW5jbHVkZSA8c3lzL3ByY3RsLmg+CiNpbmNsdWRl
IDxzeXMvcmVzb3VyY2UuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvc3lz
Y2FsbC5oPgojaW5jbHVkZSA8c3lzL3RpbWUuaD4KI2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5j
bHVkZSA8c3lzL3dhaXQuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKI2luY2x1ZGUgPGxpbnV4L2Nh
cGFiaWxpdHkuaD4KCnN0YXRpYyBib29sIHdyaXRlX2ZpbGUoY29uc3QgY2hhciogZmlsZSwgY29u
c3QgY2hhciogd2hhdCwgLi4uKQp7CgljaGFyIGJ1ZlsxMDI0XTsKCXZhX2xpc3QgYXJnczsKCXZh
X3N0YXJ0KGFyZ3MsIHdoYXQpOwoJdnNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksIHdoYXQsIGFy
Z3MpOwoJdmFfZW5kKGFyZ3MpOwoJYnVmW3NpemVvZihidWYpIC0gMV0gPSAwOwoJaW50IGxlbiA9
IHN0cmxlbihidWYpOwoJaW50IGZkID0gb3BlbihmaWxlLCBPX1dST05MWSB8IE9fQ0xPRVhFQyk7
CglpZiAoZmQgPT0gLTEpCgkJcmV0dXJuIGZhbHNlOwoJaWYgKHdyaXRlKGZkLCBidWYsIGxlbikg
IT0gbGVuKSB7CgkJaW50IGVyciA9IGVycm5vOwoJCWNsb3NlKGZkKTsKCQllcnJubyA9IGVycjsK
CQlyZXR1cm4gZmFsc2U7Cgl9CgljbG9zZShmZCk7CglyZXR1cm4gdHJ1ZTsKfQoKc3RhdGljIGxv
bmcgc3l6X29wZW5fZGV2KHZvbGF0aWxlIGxvbmcgYTAsIHZvbGF0aWxlIGxvbmcgYTEsIHZvbGF0
aWxlIGxvbmcgYTIpCnsKCWlmIChhMCA9PSAweGMgfHwgYTAgPT0gMHhiKSB7CgkJY2hhciBidWZb
MTI4XTsKCQlzcHJpbnRmKGJ1ZiwgIi9kZXYvJXMvJWQ6JWQiLCBhMCA9PSAweGMgPyAiY2hhciIg
OiAiYmxvY2siLCAodWludDhfdClhMSwgKHVpbnQ4X3QpYTIpOwoJCXJldHVybiBvcGVuKGJ1Ziwg
T19SRFdSLCAwKTsKCX0gZWxzZSB7CgkJY2hhciBidWZbMTAyNF07CgkJY2hhciogaGFzaDsKCQlz
dHJuY3B5KGJ1ZiwgKGNoYXIqKWEwLCBzaXplb2YoYnVmKSAtIDEpOwoJCWJ1ZltzaXplb2YoYnVm
KSAtIDFdID0gMDsKCQl3aGlsZSAoKGhhc2ggPSBzdHJjaHIoYnVmLCAnIycpKSkgewoJCQkqaGFz
aCA9ICcwJyArIChjaGFyKShhMSAlIDEwKTsKCQkJYTEgLz0gMTA7CgkJfQoJCXJldHVybiBvcGVu
KGJ1ZiwgYTIsIDApOwoJfQp9CgpzdGF0aWMgdm9pZCBzZXR1cF9jb21tb24oKQp7CglpZiAobW91
bnQoMCwgIi9zeXMvZnMvZnVzZS9jb25uZWN0aW9ucyIsICJmdXNlY3RsIiwgMCwgMCkpIHsKCX0K
fQoKc3RhdGljIHZvaWQgc2V0dXBfYmluZGVyZnMoKQp7CglpZiAobWtkaXIoIi9kZXYvYmluZGVy
ZnMiLCAwNzc3KSkgewoJfQoJaWYgKG1vdW50KCJiaW5kZXIiLCAiL2Rldi9iaW5kZXJmcyIsICJi
aW5kZXIiLCAwLCBOVUxMKSkgewoJfQoJaWYgKHN5bWxpbmsoIi9kZXYvYmluZGVyZnMiLCAiLi9i
aW5kZXJmcyIpKSB7Cgl9Cn0KCnN0YXRpYyB2b2lkIGxvb3AoKTsKCnN0YXRpYyB2b2lkIHNhbmRi
b3hfY29tbW9uKCkKewoJcHJjdGwoUFJfU0VUX1BERUFUSFNJRywgU0lHS0lMTCwgMCwgMCwgMCk7
CglzZXRzaWQoKTsKCXN0cnVjdCBybGltaXQgcmxpbTsKCXJsaW0ucmxpbV9jdXIgPSBybGltLnJs
aW1fbWF4ID0gKDIwMCA8PCAyMCk7CglzZXRybGltaXQoUkxJTUlUX0FTLCAmcmxpbSk7CglybGlt
LnJsaW1fY3VyID0gcmxpbS5ybGltX21heCA9IDMyIDw8IDIwOwoJc2V0cmxpbWl0KFJMSU1JVF9N
RU1MT0NLLCAmcmxpbSk7CglybGltLnJsaW1fY3VyID0gcmxpbS5ybGltX21heCA9IDEzNiA8PCAy
MDsKCXNldHJsaW1pdChSTElNSVRfRlNJWkUsICZybGltKTsKCXJsaW0ucmxpbV9jdXIgPSBybGlt
LnJsaW1fbWF4ID0gMSA8PCAyMDsKCXNldHJsaW1pdChSTElNSVRfU1RBQ0ssICZybGltKTsKCXJs
aW0ucmxpbV9jdXIgPSBybGltLnJsaW1fbWF4ID0gMDsKCXNldHJsaW1pdChSTElNSVRfQ09SRSwg
JnJsaW0pOwoJcmxpbS5ybGltX2N1ciA9IHJsaW0ucmxpbV9tYXggPSAyNTY7CglzZXRybGltaXQo
UkxJTUlUX05PRklMRSwgJnJsaW0pOwoJaWYgKHVuc2hhcmUoQ0xPTkVfTkVXTlMpKSB7Cgl9Cglp
ZiAobW91bnQoTlVMTCwgIi8iLCBOVUxMLCBNU19SRUMgfCBNU19QUklWQVRFLCBOVUxMKSkgewoJ
fQoJaWYgKHVuc2hhcmUoQ0xPTkVfTkVXSVBDKSkgewoJfQoJaWYgKHVuc2hhcmUoMHgwMjAwMDAw
MCkpIHsKCX0KCWlmICh1bnNoYXJlKENMT05FX05FV1VUUykpIHsKCX0KCWlmICh1bnNoYXJlKENM
T05FX1NZU1ZTRU0pKSB7Cgl9Cgl0eXBlZGVmIHN0cnVjdCB7CgkJY29uc3QgY2hhciogbmFtZTsK
CQljb25zdCBjaGFyKiB2YWx1ZTsKCX0gc3lzY3RsX3Q7CglzdGF0aWMgY29uc3Qgc3lzY3RsX3Qg
c3lzY3Rsc1tdID0gewoJCXsiL3Byb2Mvc3lzL2tlcm5lbC9zaG1tYXgiLCAiMTY3NzcyMTYifSwK
CQl7Ii9wcm9jL3N5cy9rZXJuZWwvc2htYWxsIiwgIjUzNjg3MDkxMiJ9LAoJCXsiL3Byb2Mvc3lz
L2tlcm5lbC9zaG1tbmkiLCAiMTAyNCJ9LAoJCXsiL3Byb2Mvc3lzL2tlcm5lbC9tc2dtYXgiLCAi
ODE5MiJ9LAoJCXsiL3Byb2Mvc3lzL2tlcm5lbC9tc2dtbmkiLCAiMTAyNCJ9LAoJCXsiL3Byb2Mv
c3lzL2tlcm5lbC9tc2dtbmIiLCAiMTAyNCJ9LAoJCXsiL3Byb2Mvc3lzL2tlcm5lbC9zZW0iLCAi
MTAyNCAxMDQ4NTc2IDUwMCAxMDI0In0sCgl9OwoJdW5zaWduZWQgaTsKCWZvciAoaSA9IDA7IGkg
PCBzaXplb2Yoc3lzY3RscykgLyBzaXplb2Yoc3lzY3Rsc1swXSk7IGkrKykKCQl3cml0ZV9maWxl
KHN5c2N0bHNbaV0ubmFtZSwgc3lzY3Rsc1tpXS52YWx1ZSk7Cn0KCnN0YXRpYyBpbnQgd2FpdF9m
b3JfbG9vcChpbnQgcGlkKQp7CglpZiAocGlkIDwgMCkKCQlleGl0KDEpOwoJaW50IHN0YXR1cyA9
IDA7Cgl3aGlsZSAod2FpdHBpZCgtMSwgJnN0YXR1cywgX19XQUxMKSAhPSBwaWQpIHsKCX0KCXJl
dHVybiBXRVhJVFNUQVRVUyhzdGF0dXMpOwp9CgpzdGF0aWMgdm9pZCBkcm9wX2NhcHModm9pZCkK
ewoJc3RydWN0IF9fdXNlcl9jYXBfaGVhZGVyX3N0cnVjdCBjYXBfaGRyID0ge307CglzdHJ1Y3Qg
X191c2VyX2NhcF9kYXRhX3N0cnVjdCBjYXBfZGF0YVsyXSA9IHt9OwoJY2FwX2hkci52ZXJzaW9u
ID0gX0xJTlVYX0NBUEFCSUxJVFlfVkVSU0lPTl8zOwoJY2FwX2hkci5waWQgPSBnZXRwaWQoKTsK
CWlmIChzeXNjYWxsKFNZU19jYXBnZXQsICZjYXBfaGRyLCAmY2FwX2RhdGEpKQoJCWV4aXQoMSk7
Cgljb25zdCBpbnQgZHJvcCA9ICgxIDw8IENBUF9TWVNfUFRSQUNFKSB8ICgxIDw8IENBUF9TWVNf
TklDRSk7CgljYXBfZGF0YVswXS5lZmZlY3RpdmUgJj0gfmRyb3A7CgljYXBfZGF0YVswXS5wZXJt
aXR0ZWQgJj0gfmRyb3A7CgljYXBfZGF0YVswXS5pbmhlcml0YWJsZSAmPSB+ZHJvcDsKCWlmIChz
eXNjYWxsKFNZU19jYXBzZXQsICZjYXBfaGRyLCAmY2FwX2RhdGEpKQoJCWV4aXQoMSk7Cn0KCnN0
YXRpYyBpbnQgZG9fc2FuZGJveF9ub25lKHZvaWQpCnsKCWlmICh1bnNoYXJlKENMT05FX05FV1BJ
RCkpIHsKCX0KCWludCBwaWQgPSBmb3JrKCk7CglpZiAocGlkICE9IDApCgkJcmV0dXJuIHdhaXRf
Zm9yX2xvb3AocGlkKTsKCXNldHVwX2NvbW1vbigpOwoJc2FuZGJveF9jb21tb24oKTsKCWRyb3Bf
Y2FwcygpOwoJaWYgKHVuc2hhcmUoQ0xPTkVfTkVXTkVUKSkgewoJfQoJc2V0dXBfYmluZGVyZnMo
KTsKCWxvb3AoKTsKCWV4aXQoMSk7Cn0KCnN0YXRpYyBpbnQgaW5qZWN0X2ZhdWx0KGludCBudGgp
CnsKCWludCBmZDsKCWZkID0gb3BlbigiL3Byb2MvdGhyZWFkLXNlbGYvZmFpbC1udGgiLCBPX1JE
V1IpOwoJaWYgKGZkID09IC0xKQoJCWV4aXQoMSk7CgljaGFyIGJ1ZlsxNl07CglzcHJpbnRmKGJ1
ZiwgIiVkIiwgbnRoKTsKCWlmICh3cml0ZShmZCwgYnVmLCBzdHJsZW4oYnVmKSkgIT0gKHNzaXpl
X3Qpc3RybGVuKGJ1ZikpCgkJZXhpdCgxKTsKCXJldHVybiBmZDsKfQoKc3RhdGljIHZvaWQgc2V0
dXBfZmF1bHQoKQp7CglzdGF0aWMgc3RydWN0IHsKCQljb25zdCBjaGFyKiBmaWxlOwoJCWNvbnN0
IGNoYXIqIHZhbDsKCQlib29sIGZhdGFsOwoJfSBmaWxlc1tdID0gewoJCXsiL3N5cy9rZXJuZWwv
ZGVidWcvZmFpbHNsYWIvaWdub3JlLWdmcC13YWl0IiwgIk4iLCB0cnVlfSwKCQl7Ii9zeXMva2Vy
bmVsL2RlYnVnL2ZhaWxfZnV0ZXgvaWdub3JlLXByaXZhdGUiLCAiTiIsIGZhbHNlfSwKCQl7Ii9z
eXMva2VybmVsL2RlYnVnL2ZhaWxfcGFnZV9hbGxvYy9pZ25vcmUtZ2ZwLWhpZ2htZW0iLCAiTiIs
IGZhbHNlfSwKCQl7Ii9zeXMva2VybmVsL2RlYnVnL2ZhaWxfcGFnZV9hbGxvYy9pZ25vcmUtZ2Zw
LXdhaXQiLCAiTiIsIGZhbHNlfSwKCQl7Ii9zeXMva2VybmVsL2RlYnVnL2ZhaWxfcGFnZV9hbGxv
Yy9taW4tb3JkZXIiLCAiMCIsIGZhbHNlfSwKCX07Cgl1bnNpZ25lZCBpOwoJZm9yIChpID0gMDsg
aSA8IHNpemVvZihmaWxlcykgLyBzaXplb2YoZmlsZXNbMF0pOyBpKyspIHsKCQlpZiAoIXdyaXRl
X2ZpbGUoZmlsZXNbaV0uZmlsZSwgZmlsZXNbaV0udmFsKSkgewoJCQlpZiAoZmlsZXNbaV0uZmF0
YWwpCgkJCQlleGl0KDEpOwoJCX0KCX0KfQoKdWludDY0X3QgclsxXSA9IHsweGZmZmZmZmZmZmZm
ZmZmZmZ9OwoKdm9pZCBsb29wKHZvaWQpCnsKCWludHB0cl90IHJlcyA9IDA7CgltZW1jcHkoKHZv
aWQqKTB4MjAwMDA1NDAsICIvZGV2L2RyaS9jYXJkI1wwMDAiLCAxNSk7CglyZXMgPSAtMTsKCXJl
cyA9IHN5el9vcGVuX2RldigweDIwMDAwNTQwLCAweDIwMDAwMDAwMDAwMDAwMDAsIDApOwoJaWYg
KHJlcyAhPSAtMSkKCQlyWzBdID0gcmVzOwoJKih1aW50MzJfdCopMHgyMDAwMDE4MCA9IDc7Cgkq
KHVpbnQzMl90KikweDIwMDAwMTg0ID0gMHhmYzAwMDsKCSoodWludDMyX3QqKTB4MjAwMDAxODgg
PSAweGMzOTsKCSoodWludDMyX3QqKTB4MjAwMDAxOGMgPSAwOwoJaW5qZWN0X2ZhdWx0KDIwKTsK
CXN5c2NhbGwoX19OUl9pb2N0bCwgclswXSwgMHhjMDIwNjRiMiwgMHgyMDAwMDE4MHVsKTsKCn0K
aW50IG1haW4odm9pZCkKewoJc3lzY2FsbChfX05SX21tYXAsIDB4MWZmZmYwMDB1bCwgMHgxMDAw
dWwsIDB1bCwgMHgzMnVsLCAtMSwgMHVsKTsKCXN5c2NhbGwoX19OUl9tbWFwLCAweDIwMDAwMDAw
dWwsIDB4MTAwMDAwMHVsLCA3dWwsIDB4MzJ1bCwgLTEsIDB1bCk7CglzeXNjYWxsKF9fTlJfbW1h
cCwgMHgyMTAwMDAwMHVsLCAweDEwMDB1bCwgMHVsLCAweDMydWwsIC0xLCAwdWwpOwoJc2V0dXBf
ZmF1bHQoKTsKCWRvX3NhbmRib3hfbm9uZSgpOwoJcmV0dXJuIDA7Cn0K
--000000000000f4eb6805e467400c--
