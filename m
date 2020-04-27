Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A51B9851
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D731189FDB;
	Mon, 27 Apr 2020 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBC589FED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 03:48:12 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id s26so19130515ioj.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 20:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=3CmKdxGXP/iHTlLpTWyhuApxpkWipFmSjdk7JK/lqHM=;
 b=LyUWqKcnECovC+LbToFkk82TKk11I77+1H5eS67Af8qNk32zY7AcE6kYaCGBb6WqpJ
 r/viwVHQS4f3/tZ0oKkSuErnDBhDPEduvTNy6dtLleoCthyOXh4nm2IwTp1QEJaat8mX
 CUDkiP/vpx5O2/VBqvKJA0CKPUJq68HCkBrn6YDMKBtX+bOES8v06hNIpHtA0Mtyf/Ce
 FXwct7MAqOPE8jvIzB7aytgRp5+kvEg5LQyRQC9cFXESHpy2ExJTVnynzNKtN945wm7B
 fHt84j/nPRLDYw6P4aHyCHMSWRBp+8EVtMHkYHS9u/7VSGx0Rkr0153xdq9jE/m2FMLf
 LyAw==
X-Gm-Message-State: AGi0PuZ/XOuJtuylouDeATEqEMv02HiIc7zMh6bT37BwXB/vgeHucFOR
 Zht4WIiQPeszsTvMjmiUEluCGTIgu9+4gmeXNryjDBViZ6Hz
X-Google-Smtp-Source: APiQypIWiSpwdzcP8BpPZM8pnkdo6i4U2kCN36F1z1yDAhSmNiip6oKM8sfVlEXLansXzoRhKpkKwRxPKQwOzgn9JM1CQKdjo79b
MIME-Version: 1.0
X-Received: by 2002:a5d:9256:: with SMTP id e22mr19758359iol.179.1587959292300; 
 Sun, 26 Apr 2020 20:48:12 -0700 (PDT)
Date: Sun, 26 Apr 2020 20:48:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000089155205a43d9596@google.com>
Subject: KASAN: use-after-free Read in vkms_dumb_create
From: syzbot <syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 rodrigosiqueiramelo@gmail.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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

HEAD commit:    c578ddb3 Merge tag 'linux-kselftest-5.7-rc3' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10fbf0d8100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7a70e992f2f9b68
dashboard link: https://syzkaller.appspot.com/bug?extid=e3372a2afe1e7ef04bc7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15438330100000

Bisection is inconclusive: the first bad commit could be any of:

85b5bafb drm/cma-helper: Remove drm_fb_cma_fbdev_init_with_funcs()
dff1c703 drm/tinydrm: Use drm_fbdev_generic_setup()
23167fa9 drm/panel: simple: Add support for Rocktech RK070ER9427 LCD panel
9060d7f4 drm/fb-helper: Finish the generic fbdev emulation
2230ca12 dt-bindings: display: Document the EDT et* displays in one file.
e896c132 drm/debugfs: Add internal client debugfs file
894a677f drm/cma-helper: Use the generic fbdev emulation
aa7e6455 drm/panel: Add support for the EDT ETM0700G0BDH6
244007ec drm/pl111: Set .gem_prime_vmap and .gem_prime_mmap
aad34de2 drm/panel: Add support for the EDT ETM0700G0EDH6
7a6aca49 dt-bindings: Add vendor prefix for DLC Display Co., Ltd.
d536540f drm/fb-helper: Add generic fbdev emulation .fb_probe function
0ca0c827 drm/panel: simple: Add DLC DLC0700YZG-1 panel
c76f0f7c drm: Begin an API for in-kernel clients
5ba57bab drm: vkms: select DRM_KMS_HELPER
5fa8e4a2 drm/panel: Make of_drm_find_panel() return an ERR_PTR() instead of NULL
008095e0 drm/vc4: Add support for the transposer block
c59eb3cf drm/panel: Let of_drm_find_panel() return -ENODEV when the panel is disabled
1ebe99a7 drm/vc4: Call drm_atomic_helper_fake_vblank() in the commit path
2e64a174 drm/of: Make drm_of_find_panel_or_bridge() fail when the device is disabled
1b9883ea drm/vc4: Support the case where the DSI device is disabled
6fb42b66 drm/atomic: Call fake_vblank() from the generic commit_tail() helpers
b0b7aa40 dt-bindings: display: Add DT bindings for BOE HV070WSA-100 panel
b25c60af drm/crtc: Add a generic infrastructure to fake VBLANK events
184d3cf4 drm/vc4: Use wait_for_flip_done() instead of wait_for_vblanks()
ae8cf41b drm/panel: simple: Add support for BOE HV070WSA-100 panel to simple-panel
814bde99 drm/connector: Make ->atomic_commit() optional
955f60db drm: Add support for extracting sync signal drive edge from videomode
3b39ad7a drm/panel: simple: Add newhaven, nhd-4.3-480272ef-atxl LCD
425132fd drm/connector: Pass a drm_connector_state to ->atomic_commit()
a5d2ade6 drm/panel: simple: Add support for Innolux G070Y2-L01
b82c1f8f drm/atomic: Avoid connector to writeback_connector casts
03fa9aa3 dt-bindings: Add DataImage, Inc. vendor prefix
73915b2b drm/writeback: Fix the "overview" section of the doc
97ceb1fb drm/panel: simple: Add support for DataImage SCF0700C48GGU18
e22e9531 Merge drm-upstream/drm-next into drm-misc-next
3d5664f9 drm/panel: ili9881c: Fix missing assignment to error return ret
a0120245 drm/crc: Only report a single overflow when a CRC fd is opened
7ad4e463 drm/panel: p079zca: Refactor panel driver to support multiple panels
8adbbb2e drm/stm: ltdc: rework reset sequence
48bd379a drm/panel: p079zca: Add variable unprepare_delay properties
7868e507 drm/stm: ltdc: filter mode pixel clock vs pad constraint
731edd4c dt-bindings: Add Innolux P097PFG panel bindings
f8878bb2 drm: print plane state normalized zpos value
ca52bea9 drm/atomic-helper: Use bitwise or for filling a bitmask
de04a462 drm/panel: p079zca: Support Innolux P097PFG panel
2bb7a39c dt-bindings: Add vendor prefix for kingdisplay
a65020d0 drm/v3d: Fix a grammar nit in the scheduler docs.
2dd4f211 drm/v3d: Add missing v3d documentation structure.
ebc950fd dt-bindings: Add KINGDISPLAY KD097D04 panel bindings
cd0e0ca6 drm/panel: type promotion bug in s6e8aa0_read_mtp_id()
e0d01811 drm/v3d: Remove unnecessary dma_fence_ops.
624bb0c0 drm/v3d: Delay the scheduler timeout if we're still making progress.
b6d83fcc drm/panel: p079zca: Use of_device_get_match_data()
408633d2 drm/v3d: use new return type vm_fault_t in v3d_gem_fault
decac6b0 dt-bindings: display: sun4i-drm: Add R40 display engine compatible
0b7510d1 drm/tilcdc: Use drm_connector_has_possible_encoder()
d978a94b drm/sun4i: Add R40 display engine compatible
af11942e drm/sun4i: tcon-top: Cleanup clock handling
f8222409 drm/msm: Use drm_connector_has_possible_encoder()
38cb8d96 drm: Add drm_connector_has_possible_encoder()
da82107e drm/sun4i: tcon: Release node when traversing of graph
7a667775 dt-bindings: display: sun4i-drm: Add R40 TV TCON description
7b71ca24 drm/radeon: Use drm_connector_for_each_possible_encoder()
4a068c5c drm/sun4i: DW HDMI: Release nodes if error happens during CRTC search
ddba766d drm/nouveau: Use drm_connector_for_each_possible_encoder()
98c0e348 drm/amdgpu: Use drm_connector_for_each_possible_encoder()
e0f56782 drm/sun4i: mixer: Order includes alphabetically
05db311a drm/sun4i: tcon-top: Add helpers for mux switching
83aefbb8 drm: Add drm_connector_for_each_possible_encoder()
20431c05 drm/i915: Nuke intel_mst_best_encoder()
5e496566 drm/sun4i: tcon-top: Remove mux configuration at probe time
0d998891 drm/fb-helper: Eliminate the .best_encoder() usage
ac1fe132 dt-bindings: display: sun4i-drm: Fix order of DW HDMI PHY compatibles
03e3ec9a drm/panel: simple: Add Sharp LQ035Q7DB03 panel support
c91b007e drm/vkms: Add extra information about vkms
5685ca0c drm/tinydrm: Fix doc build warnings
854502fa drm/vkms: Add basic CRTC initialization
ae61f61f drm/client: Fix: drm_client_new: Don't require DRM to be registered
c04372ea drm/vkms: Add mode_config initialization
41111ce1 drm/vkms: vkms_driver can be static
559e50fd drm/vkms: Add dumb operations
1c7c5fd9 drm/vkms: Introduce basic VKMS driver
657cd71e drm: gma500: Changed __attribute__((packed)) to __packed
d1648930 drm/vkms: Add connectors helpers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b65cdfe00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in vkms_dumb_create+0x286/0x290 drivers/gpu/drm/vkms/vkms_gem.c:142
Read of size 8 at addr ffff88809e537110 by task syz-executor.0/9558

CPU: 0 PID: 9558 Comm: syz-executor.0 Not tainted 5.7.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x315 mm/kasan/report.c:382
 __kasan_report.cold+0x35/0x4d mm/kasan/report.c:511
 kasan_report+0x33/0x50 mm/kasan/common.c:625
 vkms_dumb_create+0x286/0x290 drivers/gpu/drm/vkms/vkms_gem.c:142
 drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x220/0x2f0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4c9/0x980 drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x45c829
Code: 0d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f19a3e30c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004e2d80 RCX: 000000000045c829
RDX: 0000000020000080 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 000000000000028b R14: 00000000004d3188 R15: 00007f19a3e316d4

Allocated by task 9558:
 save_stack+0x1b/0x40 mm/kasan/common.c:49
 set_track mm/kasan/common.c:57 [inline]
 __kasan_kmalloc mm/kasan/common.c:495 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:468
 kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
 __vkms_gem_create+0x44/0xf0 include/linux/slab.h:555
 vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:111 [inline]
 vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:100 [inline]
 vkms_dumb_create+0x110/0x290 drivers/gpu/drm/vkms/vkms_gem.c:138
 drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x220/0x2f0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4c9/0x980 drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

Freed by task 9558:
 save_stack+0x1b/0x40 mm/kasan/common.c:49
 set_track mm/kasan/common.c:57 [inline]
 kasan_set_free_info mm/kasan/common.c:317 [inline]
 __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:456
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x109/0x2b0 mm/slab.c:3757
 drm_gem_object_free+0xf0/0x1f0 drivers/gpu/drm/drm_gem.c:983
 kref_put include/linux/kref.h:65 [inline]
 drm_gem_object_put_unlocked drivers/gpu/drm/drm_gem.c:1017 [inline]
 drm_gem_object_put_unlocked+0x190/0x1c0 drivers/gpu/drm/drm_gem.c:1002
 vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:116 [inline]
 vkms_gem_create drivers/gpu/drm/vkms/vkms_gem.c:100 [inline]
 vkms_dumb_create+0x14d/0x290 drivers/gpu/drm/vkms/vkms_gem.c:138
 drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_ioctl_kernel+0x220/0x2f0 drivers/gpu/drm/drm_ioctl.c:787
 drm_ioctl+0x4c9/0x980 drivers/gpu/drm/drm_ioctl.c:887
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

The buggy address belongs to the object at ffff88809e537000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 272 bytes inside of
 1024-byte region [ffff88809e537000, ffff88809e537400)
The buggy address belongs to the page:
page:ffffea0002794dc0 refcount:1 mapcount:0 mapping:00000000e8234a18 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea00027a3608 ffffea0002749008 ffff8880aa000c40
raw: 0000000000000000 ffff88809e537000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88809e537000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88809e537080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88809e537100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88809e537180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88809e537200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
