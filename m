Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1921E8D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA356E8EB;
	Tue, 14 Jul 2020 07:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197626EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 08:24:41 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y13so2727301lfe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/zlPwj7L7Ce+zffsmTIyPLSSztPq7z1z/8n6y5GLBiI=;
 b=OQPyv+81yIhNGom8eprVss9EVJ3KxzNiEWKPFA19f0laD7kwfEQJgb5rjF1N6GK4Yc
 qI3BSatubHk1aMGTajQfSjkJBlCa1uE/NWlnwtsBhbpcJE8yn7vLcUxLR67Vfbggt2qa
 Ekq1bCpssBz5Tu920z3Bymooun8Mp/Dm8LRaAKvpBCgFkDALibbTTq+Y9Rtka/2IB0jn
 F+ChWn3lsojmPMs5Cwh0ZOa+l4r8cDy0UUYYVPRT6H8EWpxpbIKdbstowELIvF00vINf
 AbKdbz+iuIxg+QiGVmBHWkM3caUwPHWsi/d+3cdrGHzbugjU8QgnssCZJbA5v90BYY4o
 87+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/zlPwj7L7Ce+zffsmTIyPLSSztPq7z1z/8n6y5GLBiI=;
 b=oJN+7axDcCkxu5ILvwM3SU0pSTVoTzO1SIz4AZ7XuXV32JU5e9nTp1wNpHWLP0nQtz
 o0a2Fl7RZKwRuY/6iY1bCjjXARY+3+DoU6MnhYtAzfcpFvT1QVi81aTiM0FlY/5SFLj0
 0QaxxLCj9ERSxOJRwBgO03KMAJAmqzUTTH0m6uXV4HYZeN0oE4bBmQHKT4XVvn2bMcf1
 S++DAd3IsPYCbPaChoYyvh35rEhRwC2TKnS67EgRr6hbo0CZXvINME6A8riiO2Z2AGvU
 j8A4rh2Sgd1tfe5spz7RUqnHhhtnbJKf/1PSM2utMd7smiGZm7t+v1hfdtpnkQExYGXD
 P+fw==
X-Gm-Message-State: AOAM530rigyvCC8y5K593rP5UxBxu097nKHtxeW0+pKsvIrTwqkNETYL
 If+4OMeBFSX1WeC3lVwN5sDVXKsozcIULL8Nzc0=
X-Google-Smtp-Source: ABdhPJzIn4Vepu91hUeOdZPWH/qQp/ZUH2JgYP6sHMOSblV9Qd6jjhFu1LGRn1HFZD55STXAlOvosPxkijtQgY5ZPS4=
X-Received: by 2002:ac2:43aa:: with SMTP id t10mr42624462lfl.114.1594369479439; 
 Fri, 10 Jul 2020 01:24:39 -0700 (PDT)
MIME-Version: 1.0
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Fri, 10 Jul 2020 16:24:03 +0800
Message-ID: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
Subject: KASAN: use-after-free Read in drm_gem_object_release
To: security@kernel.org
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: robdclark@chromium.org, airlied@linux.ie, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 seanpaul@chromium.org, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I report a bug (in linux-5.8.0-rc4) found by syzkaller.

kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.8.0-rc4.config

I test the reproducer and crash too.

In the drm_em_vram_t() function,  ttm_bo_init() function call
ttm_bo_init_reserved(),
the ttm_bo_init_reserved() function  call ttm_bo_put(), it will free
gbo->bo that is struct ttm_buffer_object.

then, goto the err_drm_gem_object_release lable,
drm_gem_object_release() function will free gbo->bo.base, so cause use
after free.

crash log:
==================================================================
BUG: KASAN: use-after-free in drm_gem_object_release+0xf7/0x120
drivers/gpu/drm/drm_gem.c:953
Read of size 8 at addr ffff888064dfd928 by task syz-executor.2/1320

CPU: 1 PID: 1320 Comm: syz-executor.2 Not tainted 5.8.0-rc4+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.10.2-1ubuntu1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x436 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 drm_gem_object_release+0xf7/0x120 drivers/gpu/drm/drm_gem.c:953
 drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:211 [inline]
 drm_gem_vram_create+0x3e6/0x5e0 drivers/gpu/drm/drm_gem_vram_helper.c:244
 drm_gem_vram_fill_create_dumb+0x17a/0x310
drivers/gpu/drm/drm_gem_vram_helper.c:615
 drm_gem_vram_driver_dumb_create+0x51/0xb0
drivers/gpu/drm/drm_gem_vram_helper.c:710
 drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4d2/0x96f drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x467a29
Code: Bad RIP value.
RSP: 002b:00007f98f2d40c48 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000076bf00 RCX: 0000000000467a29
RDX: 0000000020000040 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 000000000070c600 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f98f2d416bc
R13: 0000000000000297 R14: 0000000000702040 R15: 00000000004d2418

Allocated by task 1320:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:494
 kmem_cache_alloc_trace+0x14f/0x2d0 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 drm_gem_vram_create+0x425/0x5e0 drivers/gpu/drm/drm_gem_vram_helper.c:239
 drm_gem_vram_fill_create_dumb+0x17a/0x310
drivers/gpu/drm/drm_gem_vram_helper.c:615
 drm_gem_vram_driver_dumb_create+0x51/0xb0
drivers/gpu/drm/drm_gem_vram_helper.c:710
 drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4d2/0x96f drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 1320:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf5/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x103/0x2c0 mm/slab.c:3757
 ttm_bo_release+0xae1/0x1350 drivers/gpu/drm/ttm/ttm_bo.c:632
 kref_put include/linux/kref.h:65 [inline]
 ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:638 [inline]
 ttm_bo_init_reserved+0xb04/0xd00 drivers/gpu/drm/ttm/ttm_bo.c:1339
 ttm_bo_init+0x10e/0x330 drivers/gpu/drm/ttm/ttm_bo.c:1366
 drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:202 [inline]
 drm_gem_vram_create+0x3c1/0x5e0 drivers/gpu/drm/drm_gem_vram_helper.c:244
 drm_gem_vram_fill_create_dumb+0x17a/0x310
drivers/gpu/drm/drm_gem_vram_helper.c:615
 drm_gem_vram_driver_dumb_create+0x51/0xb0
drivers/gpu/drm/drm_gem_vram_helper.c:710
 drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4d2/0x96f drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff888064dfd800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 296 bytes inside of
 1024-byte region [ffff888064dfd800, ffff888064dfdc00)
The buggy address belongs to the page:
page:ffffea0001937f40 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0000f3c248 ffffea0001ad7388 ffff88806bc00c40
raw: 0000000000000000 ffff888064dfd000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888064dfd800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888064dfd880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888064dfd900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff888064dfd980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888064dfda00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

Regards,
 butt3rflyh4ck.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
