Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE26D3E81
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 09:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCC810E138;
	Mon,  3 Apr 2023 07:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com
 [209.85.166.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD4010E138
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 07:57:51 +0000 (UTC)
Received: by mail-io1-f80.google.com with SMTP id
 b12-20020a6bb20c000000b007585c93862aso17601277iof.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 00:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680508670; x=1683100670;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+55Ep96w1GrdicGs3q+SqcOATmhIDqVCR7yAN3WUpu0=;
 b=VPOOoJDYhnk5d+qV5OynsQIyJPZgUZN5jM9tLc0OaDSyZ+LGPHidV0EiabJRWin7yg
 WWVdCbWZBl/ALHptMd2VZPDNR+0g0V2331G3OfpZwnTm5gIq14sL1qPvPGpBsnOGk8ck
 ePwL5UCrXVgppB+a7K4A3NXI4AOwFCd+JEkoa6vxLYHCmnBUoU2jay8ec7uzZXvd6+xq
 ebuAlZb0ekgpPDdhULDTJLwEfuyk7i2v3r6ThNOfGHEj0VTRSs0BTCZ1tOCvjihQfBo/
 O8DGkCSPFZROilP5yk377cuyPtOE9eX10rpz/kKn1SZtRM9rxJYcU8e1o2KvNbSp9IwP
 UnKA==
X-Gm-Message-State: AO0yUKU3doX1PJV2s2MfEv+WvpKXjqq1Mz1D0suBTIgFTpaJn3s4XdAZ
 eyWma6euIGKSXL9z0Ip6VKkZebSYtimWvhhIngt3lM2AmYnn
X-Google-Smtp-Source: AK7set/HiIOOOPEDz4KuXoTXHsmn3Z20SY1XF49Ui+ReesLTOXpveKjoXONsOCIz8MDc6aeGYhCkGZ+nmfXmrxhlSLzUCteDhDPn
MIME-Version: 1.0
X-Received: by 2002:a02:2282:0:b0:3fe:88a4:1da2 with SMTP id
 o124-20020a022282000000b003fe88a41da2mr15167577jao.4.1680508670436; Mon, 03
 Apr 2023 00:57:50 -0700 (PDT)
Date: Mon, 03 Apr 2023 00:57:50 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000057e9d305f869eaa0@google.com>
Subject: [syzbot] [dri?] general protection fault in drm_crtc_next_vblank_start
From: syzbot <syzbot+54280c5aea19802490b5@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@redhat.com, christian.koenig@amd.com, 
 daniel.vetter@ffwll.ch, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, robdclark@chromium.org, sean@poorly.run, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    a6d9e3034536 Add linux-next specific files for 20230330
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1001d1cdc80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aceb117f7924508e
dashboard link: https://syzkaller.appspot.com/bug?extid=54280c5aea19802490b5
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13435a2ec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=139c9c21c80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ec1f900ea929/disk-a6d9e303.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fabbf89c0d22/vmlinux-a6d9e303.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1ed05d6192fa/bzImage-a6d9e303.xz

The issue was bisected to:

commit d39e48ca80c0960b039cb38633957f0040f63e1a
Author: Rob Clark <robdclark@chromium.org>
Date:   Fri Sep 3 18:47:54 2021 +0000

    drm/atomic-helper: Set fence deadline for vblank

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d260c9c80000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d260c9c80000
console output: https://syzkaller.appspot.com/x/log.txt?x=16d260c9c80000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+54280c5aea19802490b5@syzkaller.appspotmail.com
Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")

[drm] Initialized udl 0.0.1 20120220 for 1-1:0.0 on minor 2
[drm] Initialized udl on minor 2
udl 1-1:0.0: [drm] *ERROR* Read EDID byte 0 failed err ffffffb9
udl 1-1:0.0: [drm] Cannot find any crtc or sizes
general protection fault, probably for non-canonical address 0xdffffc0000000028: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000140-0x0000000000000147]
CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.3.0-rc4-next-20230330-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Workqueue: usb_hub_wq hub_event
RIP: 0010:drm_crtc_next_vblank_start+0xb3/0x2b0 drivers/gpu/drm/drm_vblank.c:1003
Code: e8 01 00 00 48 69 db 38 02 00 00 48 b8 00 00 00 00 00 fc ff df 49 03 9d 38 03 00 00 4c 8d ab 44 01 00 00 4c 89 ea 48 c1 ea 03 <0f> b6 14 02 4c 89 e8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 67
RSP: 0018:ffffc900000e6bb0 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000028 RSI: ffffffff849f2afb RDI: ffff888079558338
RBP: ffffc900000e6c48 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000010 R12: ffff8880795590d8
R13: 0000000000000144 R14: ffff8880795590d8 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f17191c7688 CR3: 00000000281af000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 set_fence_deadline drivers/gpu/drm/drm_atomic_helper.c:1531 [inline]
 drm_atomic_helper_wait_for_fences+0x1b4/0x780 drivers/gpu/drm/drm_atomic_helper.c:1578
 drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:2007 [inline]
 drm_atomic_helper_commit+0x1bd/0x370 drivers/gpu/drm/drm_atomic_helper.c:1979
 drm_atomic_commit+0x20a/0x300 drivers/gpu/drm/drm_atomic.c:1503
 drm_client_modeset_commit_atomic+0x69b/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1045
 drm_client_modeset_commit_locked+0x149/0x580 drivers/gpu/drm/drm_client_modeset.c:1148
 drm_client_modeset_commit+0x51/0x80 drivers/gpu/drm/drm_client_modeset.c:1174
 drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1983 [inline]
 __drm_fb_helper_initial_config_and_unlock+0x118a/0x1510 drivers/gpu/drm/drm_fb_helper.c:2169
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:2259 [inline]
 drm_fb_helper_initial_config+0x42/0x60 drivers/gpu/drm/drm_fb_helper.c:2251
 drm_fbdev_generic_client_hotplug+0x1ab/0x270 drivers/gpu/drm/drm_fbdev_generic.c:281
 drm_fbdev_generic_setup+0x127/0x3b0 drivers/gpu/drm/drm_fbdev_generic.c:343
 udl_usb_probe+0x120/0x190 drivers/gpu/drm/udl/udl_drv.c:120
 usb_probe_interface+0x30f/0x960 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x240/0xca0 drivers/base/dd.c:658
 __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:795
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:825
 __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:953
 bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1025
 bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
 device_add+0x11c4/0x1c50 drivers/base/core.c:3616
 usb_set_configuration+0x10ee/0x1af0 drivers/usb/core/message.c:2171
 usb_generic_driver_probe+0xcf/0x130 drivers/usb/core/generic.c:238
 usb_probe_device+0xd8/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x240/0xca0 drivers/base/dd.c:658
 __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:795
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:825
 __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:953
 bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1025
 bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
 device_add+0x11c4/0x1c50 drivers/base/core.c:3616
 usb_new_device+0xcb2/0x19d0 drivers/usb/core/hub.c:2575
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5551 [inline]
 port_event drivers/usb/core/hub.c:5711 [inline]
 hub_event+0x2d9e/0x4e40 drivers/usb/core/hub.c:5793
 process_one_work+0x99a/0x15e0 kernel/workqueue.c:2405
 worker_thread+0x67d/0x10c0 kernel/workqueue.c:2552
 kthread+0x33e/0x440 kernel/kthread.c:379
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:drm_crtc_next_vblank_start+0xb3/0x2b0 drivers/gpu/drm/drm_vblank.c:1003
Code: e8 01 00 00 48 69 db 38 02 00 00 48 b8 00 00 00 00 00 fc ff df 49 03 9d 38 03 00 00 4c 8d ab 44 01 00 00 4c 89 ea 48 c1 ea 03 <0f> b6 14 02 4c 89 e8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 67
RSP: 0018:ffffc900000e6bb0 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000028 RSI: ffffffff849f2afb RDI: ffff888079558338
RBP: ffffc900000e6c48 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000010 R12: ffff8880795590d8
R13: 0000000000000144 R14: ffff8880795590d8 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f17191c7688 CR3: 000000002b398000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	e8 01 00 00 48       	callq  0x48000006
   5:	69 db 38 02 00 00    	imul   $0x238,%ebx,%ebx
   b:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  12:	fc ff df
  15:	49 03 9d 38 03 00 00 	add    0x338(%r13),%rbx
  1c:	4c 8d ab 44 01 00 00 	lea    0x144(%rbx),%r13
  23:	4c 89 ea             	mov    %r13,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	4c 89 e8             	mov    %r13,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85                   	.byte 0x85
  3f:	67                   	addr32


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
