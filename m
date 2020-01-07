Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54348133CC1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3919A6E18E;
	Wed,  8 Jan 2020 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8766E109
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 16:23:17 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id i1so18124231oie.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 08:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=t1GDAIed2TOBCAdxCOyzO9BNuP8hbDwto6Xp55SIbek=;
 b=sK6tv8yNwf31YnS7IFOYz+k/L5IKwOzcpwDk/uCq1rLgjwm2TaeuZUwvgAesuE/Lfp
 jAv6tmdWkcYjmFNV1k0pSeFNDpbe+OIu7/9YIjbSDAKMzxcQ+Wo/o1eh32WDiZP5uiR5
 ehxFRxFVXVJNMdiX3nGnTFaa9a0kBbLx+9AGpUQDi30AXz0kcP9/6o45jUdgQdbiuhuC
 TGiwX3ZME17WEJymwRklNUdth8VlR1xSgo88FNWohQC8GmSFh6XsAvGhC5VXWe8cBbEA
 kULjqz7uf8Th+J5NqxG75xflESa7VEoCRiTwgxHVZwkNy2HzcP7X5HroScqX/ynL4Z2k
 m7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=t1GDAIed2TOBCAdxCOyzO9BNuP8hbDwto6Xp55SIbek=;
 b=IKvAVKgs2w6tdJ/GcOZUNOWvLEs8dcivrZ2pVKDvnF/UipmrjIQ4P2Z+0zjB/S1QbX
 6l/sMTnUVOvQei61W082zdBSASMm+jN3HeWeI4zidBhaVlm2lgxBmmyMHfmp28eqSAJu
 cHeCL7RQUKvFcXqUx/3LxybwH1/k+wCUyGpTNxKskqmIllIdPhE3J44E18VW9CeeL6qB
 IU1j26jRJsxlGJCTbqvdHD8O6MVWapuf4MsAOcGcdRYxhTyaCnf28R01/ovD/k4mragZ
 08MfULEIbi3axw/zBWAT2kuH3EBKCsWOxqAEHPPcZINl4LHH9eHHDoi7hzvukaFeyQUr
 +hfA==
X-Gm-Message-State: APjAAAUSc39qNBaMfUKvn1epZpDRrodMYrB+Qh6v/uWj9xYX6wEO8PqT
 GmdAInVzBRi7374PoJDHg4dZDHn120X1abFALcsuZQ==
X-Google-Smtp-Source: APXvYqyYThaC7HdeupMNZMpSB5NjGPRUBRM1d89vAE+s+kc0HxboAxu1tbFEeLpXxdNvb1mAu3VbObZCVOvWBxoijrM=
X-Received: by 2002:a05:6808:8d0:: with SMTP id
 k16mr344748oij.68.1578414196789; 
 Tue, 07 Jan 2020 08:23:16 -0800 (PST)
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Tue, 7 Jan 2020 17:22:50 +0100
Message-ID: <CAG48ez1cqqYYp2s2Wc_84ksqrvXEcq0WeT6KPtRVzWaoJnS3eA@mail.gmail.com>
Subject: locking warnings in drm/virtio code
To: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

My development VM (KVM guest, virtio graphics) is throwing warnings
when I start up X while running a build from Linus' tree with lockdep
turned on. I tried to bisect it, and it looks like at least the
"suspicious RCU usage" one started triggering in commit
889165ad6190556ffe4a8fa6b0e486f1c25589d8 ("drm/virtio: pass gem
reservation object to ttm init").

Slightly shortened dmesg output follows:

[   37.706151] =============================
[   37.706605] WARNING: suspicious RCU usage
[   37.707089] 5.5.0-rc5+ #605 Not tainted
[   37.707522] -----------------------------
[   37.708015] include/linux/dma-resv.h:247 suspicious
rcu_dereference_protected() usage!
[   37.708899]
[   37.708899] other info that might help us debug this:
[   37.708899]
[   37.709856]
[   37.709856] rcu_scheduler_active = 2, debug_locks = 1
[   37.710771] 3 locks held by Xorg/1869:
[   37.711266] #0: ffff8880a976fa48 (crtc_ww_class_acquire){+.+.}, at:
drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:949)
[   37.712372] #1: ffff8880b32e00a8 (crtc_ww_class_mutex){+.+.}, at:
drm_modeset_lock (linux/drivers/gpu/drm/drm_modeset_lock.c:258
linux/drivers/gpu/drm/drm_modeset_lock.c:342
linux/drivers/gpu/drm/drm_modeset_lock.c:338)
[   37.713415] #2: ffff8880b32eb6c0 (&(&vgvq->qlock)->rlock){+.+.},
at: virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:381)
[   37.714650]
[   37.714650] stack backtrace:
[   37.715140] CPU: 0 PID: 1869 Comm: Xorg Not tainted 5.5.0-rc5+ #605
[   37.715889] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[   37.718253] Call Trace:
[   37.718596] dump_stack (linux/lib/dump_stack.c:120)
[   37.719011] dma_resv_add_excl_fence
(linux/./include/linux/dma-resv.h:246
linux/drivers/dma-buf/dma-resv.c:273)
[...]
[   37.720278] virtio_gpu_array_add_fence
(linux/drivers/gpu/drm/virtio/virtgpu_gem.c:230 (discriminator 3))
[   37.720925] virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:391)
[...]
[   37.724065] virtio_gpu_cursor_plane_update
(linux/drivers/gpu/drm/virtio/virtgpu_plane.c:240)
[   37.724656] drm_atomic_helper_commit_planes
(linux/drivers/gpu/drm/drm_atomic_helper.c:2444 (discriminator 2))
[   37.725324] vgdev_atomic_commit_tail
(linux/drivers/gpu/drm/virtio/virtgpu_display.c:332)
[   37.725835] commit_tail (linux/drivers/gpu/drm/drm_atomic_helper.c:1612)
[   37.726204] drm_atomic_helper_commit
(linux/drivers/gpu/drm/drm_atomic_helper.c:1824)
[   37.726729] drm_atomic_helper_update_plane
(linux/drivers/gpu/drm/drm_atomic_helper.c:2858)
[   37.727391] drm_mode_cursor_universal (linux/drivers/gpu/drm/drm_plane.c:909)
[...]
[   37.729585] drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:995)
[...]
[   37.731491] drm_ioctl_kernel (linux/drivers/gpu/drm/drm_ioctl.c:792)
[...]
[   37.733510] drm_ioctl (linux/./include/linux/uaccess.h:152
linux/drivers/gpu/drm/drm_ioctl.c:887)
[...]
[   37.737651] do_vfs_ioctl (linux/fs/ioctl.c:47 linux/fs/ioctl.c:545
linux/fs/ioctl.c:732)
[...]
[   37.740419] ksys_ioctl (linux/./include/linux/file.h:43 linux/fs/ioctl.c:750)
[   37.740797] __x64_sys_ioctl (linux/fs/ioctl.c:754)
[...]
[   37.750537] ------------[ cut here ]------------
[   37.751063] WARNING: CPU: 0 PID: 1869 at
drivers/dma-buf/dma-resv.c:277 dma_resv_add_excl_fence
(linux/drivers/dma-buf/dma-resv.c:277)
[   37.752227] CPU: 0 PID: 1869 Comm: Xorg Not tainted 5.5.0-rc5+ #605
[   37.752963] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[   37.753918] RIP: 0010:dma_resv_add_excl_fence
(linux/drivers/dma-buf/dma-resv.c:277)
[ 37.754516] Code: 56 84 83 c6 05 98 4b 0b 02 01 e8 ba 0a 19 ff e9 1d
ff ff ff 49 8d 7d 60 be ff ff ff ff e8 ca 55 18 ff 85 c0 0f 85 18 fd
ff ff <0f> 0b e9 11 fd ff ff 49 8d 7d 60 be ff ff ff ff e8 ad 55 18 ff
85
All code
========
   0: 56                    push   %rsi
   1: 84 83 c6 05 98 4b    test   %al,0x4b9805c6(%rbx)
   7: 0b 02                or     (%rdx),%eax
   9: 01 e8                add    %ebp,%eax
   b: ba 0a 19 ff e9        mov    $0xe9ff190a,%edx
  10: 1d ff ff ff 49        sbb    $0x49ffffff,%eax
  15: 8d 7d 60              lea    0x60(%rbp),%edi
  18: be ff ff ff ff        mov    $0xffffffff,%esi
  1d: e8 ca 55 18 ff        callq  0xffffffffff1855ec
  22: 85 c0                test   %eax,%eax
  24: 0f 85 18 fd ff ff    jne    0xfffffffffffffd42
  2a:* 0f 0b                ud2    <-- trapping instruction
  2c: e9 11 fd ff ff        jmpq   0xfffffffffffffd42
  31: 49 8d 7d 60          lea    0x60(%r13),%rdi
  35: be ff ff ff ff        mov    $0xffffffff,%esi
  3a: e8 ad 55 18 ff        callq  0xffffffffff1855ec
  3f: 85                    .byte 0x85

Code starting with the faulting instruction
===========================================
   0: 0f 0b                ud2
   2: e9 11 fd ff ff        jmpq   0xfffffffffffffd18
   7: 49 8d 7d 60          lea    0x60(%r13),%rdi
   b: be ff ff ff ff        mov    $0xffffffff,%esi
  10: e8 ad 55 18 ff        callq  0xffffffffff1855c2
  15: 85                    .byte 0x85
[   37.756590] RSP: 0018:ffff8880a976f498 EFLAGS: 00010246
[   37.757264] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
[   37.758041] RDX: 0000000000000007 RSI: ffff8880b21b4988 RDI: ffff8880ad39a0e4
[   37.758754] RBP: ffff88823acb6380 R08: fffffbfff0a098c8 R09: fffffbfff0a098c8
[   37.759535] R10: fffffbfff0a098c7 R11: ffffffff8504c63f R12: ffff8880b21b4800
[   37.760318] R13: ffff8880b21b4928 R14: ffff8880b21b49e0 R15: dffffc0000000000
[   37.761165] FS:  00007f1e79690f00(0000) GS:ffff8880bb200000(0000)
knlGS:0000000000000000
[   37.762010] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.762653] CR2: 00007f1e7b012000 CR3: 00000000b31f8000 CR4: 00000000000006b0
[   37.766715] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   37.767455] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   37.768337] Call Trace:
[   37.771029] virtio_gpu_array_add_fence
(linux/drivers/gpu/drm/virtio/virtgpu_gem.c:230 (discriminator 3))
[   37.771571] virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:391)
[...]
[   37.774631] virtio_gpu_cursor_plane_update
(linux/drivers/gpu/drm/virtio/virtgpu_plane.c:240)
[   37.775275] drm_atomic_helper_commit_planes
(linux/drivers/gpu/drm/drm_atomic_helper.c:2444 (discriminator 2))
[   37.775880] vgdev_atomic_commit_tail
(linux/drivers/gpu/drm/virtio/virtgpu_display.c:332)
[   37.776446] commit_tail (linux/drivers/gpu/drm/drm_atomic_helper.c:1612)
[   37.776867] drm_atomic_helper_commit
(linux/drivers/gpu/drm/drm_atomic_helper.c:1824)
[   37.777456] drm_atomic_helper_update_plane
(linux/drivers/gpu/drm/drm_atomic_helper.c:2858)
[   37.778052] drm_mode_cursor_universal (linux/drivers/gpu/drm/drm_plane.c:909)
[...]
[   37.780252] drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:995)
[...]
[   37.782269] drm_ioctl_kernel (linux/drivers/gpu/drm/drm_ioctl.c:792)
[...]
[   37.783146] drm_ioctl (linux/./include/linux/uaccess.h:152
linux/drivers/gpu/drm/drm_ioctl.c:887)
[...]
[   37.785736] do_vfs_ioctl (linux/fs/ioctl.c:47 linux/fs/ioctl.c:545
linux/fs/ioctl.c:732)
[...]
[   37.788715] ksys_ioctl (linux/./include/linux/file.h:43 linux/fs/ioctl.c:750)
[...]
[   37.801595] irq event stamp: 829986
[   37.802060] hardirqs last enabled at (829985):
trace_hardirqs_on_thunk (linux/arch/x86/entry/thunk_64.S:41)
[   37.803168] hardirqs last disabled at (829986):
trace_hardirqs_off_thunk (linux/arch/x86/entry/thunk_64.S:42)
[   37.804277] softirqs last enabled at (829984): __do_softirq
(linux/./arch/x86/include/asm/preempt.h:26 linux/kernel/softirq.c:320)
[   37.805293] softirqs last disabled at (829969): irq_exit
(linux/kernel/softirq.c:373 linux/kernel/softirq.c:413)
[   37.806258] ---[ end trace 328e17e8d7e3e2ae ]---
[   37.806846]
[   37.807090] =============================
[   37.807557] WARNING: suspicious RCU usage
[   37.808024] 5.5.0-rc5+ #605 Tainted: G        W
[   37.808686] -----------------------------
[   37.809151] include/linux/dma-resv.h:94 suspicious
rcu_dereference_protected() usage!
[   37.810088]
[   37.810088] other info that might help us debug this:
[   37.810088]
[   37.811071]
[   37.811071] rcu_scheduler_active = 2, debug_locks = 1
[   37.811910] 3 locks held by Xorg/1869:
[   37.812381] #0: ffff8880a976fa48 (crtc_ww_class_acquire){+.+.}, at:
drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:949)
[   37.813479] #1: ffff8880b32e00a8 (crtc_ww_class_mutex){+.+.}, at:
drm_modeset_lock (linux/drivers/gpu/drm/drm_modeset_lock.c:258
linux/drivers/gpu/drm/drm_modeset_lock.c:342
linux/drivers/gpu/drm/drm_modeset_lock.c:338)
[   37.814358] #2: ffff8880b32eb6c0 (&(&vgvq->qlock)->rlock){+.+.},
at: virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:381)
[   37.815482]
[   37.815482] stack backtrace:
[   37.815989] CPU: 0 PID: 1869 Comm: Xorg Tainted: G        W
5.5.0-rc5+ #605
[   37.816852] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[   37.817804] Call Trace:
[   37.818066] dump_stack (linux/lib/dump_stack.c:120)
[   37.818412] dma_resv_add_excl_fence
(linux/./include/linux/dma-resv.h:93
linux/drivers/dma-buf/dma-resv.c:279)
[   37.819019] virtio_gpu_array_add_fence
(linux/drivers/gpu/drm/virtio/virtgpu_gem.c:230 (discriminator 3))
[   37.819586] virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:391)
[...]
[   37.822629] virtio_gpu_cursor_plane_update
(linux/drivers/gpu/drm/virtio/virtgpu_plane.c:240)
[   37.823219] drm_atomic_helper_commit_planes
(linux/drivers/gpu/drm/drm_atomic_helper.c:2444 (discriminator 2))
[   37.823792] vgdev_atomic_commit_tail
(linux/drivers/gpu/drm/virtio/virtgpu_display.c:332)
[   37.824310] commit_tail (linux/drivers/gpu/drm/drm_atomic_helper.c:1612)
[   37.824706] drm_atomic_helper_commit
(linux/drivers/gpu/drm/drm_atomic_helper.c:1824)
[   37.825235] drm_atomic_helper_update_plane
(linux/drivers/gpu/drm/drm_atomic_helper.c:2858)
[   37.825864] drm_mode_cursor_universal (linux/drivers/gpu/drm/drm_plane.c:909)
[...]
[   37.830815] drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:995)
[...]
[   37.832818] drm_ioctl_kernel (linux/drivers/gpu/drm/drm_ioctl.c:792)
[...]
[   37.833832] drm_ioctl (linux/./include/linux/uaccess.h:152
linux/drivers/gpu/drm/drm_ioctl.c:887)
[...]
[   37.836672] do_vfs_ioctl (linux/fs/ioctl.c:47 linux/fs/ioctl.c:545
linux/fs/ioctl.c:732)
[...]
[   37.839627] ksys_ioctl (linux/./include/linux/file.h:43 linux/fs/ioctl.c:750)
[...]
[   37.849656] =====================================
[   37.850165] WARNING: bad unlock balance detected!
[   37.850764] 5.5.0-rc5+ #605 Tainted: G        W
[   37.851307] -------------------------------------
[   37.851955] Xorg/1869 is trying to release lock
(reservation_ww_class_mutex) at:
[   37.852803] virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:391)
[   37.853618] but there are no more locks to release!
[   37.854243]
[   37.854243] other info that might help us debug this:
[   37.855038] 3 locks held by Xorg/1869:
[   37.855421] #0: ffff8880a976fa48 (crtc_ww_class_acquire){+.+.}, at:
drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:949)
[   37.856452] #1: ffff8880b32e00a8 (crtc_ww_class_mutex){+.+.}, at:
drm_modeset_lock (linux/drivers/gpu/drm/drm_modeset_lock.c:258
linux/drivers/gpu/drm/drm_modeset_lock.c:342
linux/drivers/gpu/drm/drm_modeset_lock.c:338)
[   37.857490] #2: ffff8880b32eb6c0 (&(&vgvq->qlock)->rlock){+.+.},
at: virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:381)
[   37.858743]
[   37.858743] stack backtrace:
[   37.859186] CPU: 0 PID: 1869 Comm: Xorg Tainted: G        W
5.5.0-rc5+ #605
[   37.863137] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[   37.864083] Call Trace:
[   37.864342] dump_stack (linux/lib/dump_stack.c:120)
[   37.864805] lock_release (linux/kernel/locking/lockdep.c:4243
linux/kernel/locking/lockdep.c:4503)
[...]
[   37.866717] __mutex_unlock_slowpath
(linux/./include/asm-generic/atomic-instrumented.h:836
linux/./include/asm-generic/atomic-long.h:28
linux/kernel/locking/mutex.c:1237)
[...]
[   37.868513] virtio_gpu_queue_fenced_ctrl_buffer
(linux/drivers/gpu/drm/virtio/virtgpu_vq.c:391)
[...]
[   37.871574] virtio_gpu_cursor_plane_update
(linux/drivers/gpu/drm/virtio/virtgpu_plane.c:240)
[   37.872225] drm_atomic_helper_commit_planes
(linux/drivers/gpu/drm/drm_atomic_helper.c:2444 (discriminator 2))
[   37.872839] vgdev_atomic_commit_tail
(linux/drivers/gpu/drm/virtio/virtgpu_display.c:332)
[   37.873406] commit_tail (linux/drivers/gpu/drm/drm_atomic_helper.c:1612)
[   37.873818] drm_atomic_helper_commit
(linux/drivers/gpu/drm/drm_atomic_helper.c:1824)
[   37.874408] drm_atomic_helper_update_plane
(linux/drivers/gpu/drm/drm_atomic_helper.c:2858)
[   37.875001] drm_mode_cursor_universal (linux/drivers/gpu/drm/drm_plane.c:909)
[...]
[   37.877216] drm_mode_cursor_common (linux/drivers/gpu/drm/drm_plane.c:995)
[...]
[   37.879145] drm_ioctl_kernel (linux/drivers/gpu/drm/drm_ioctl.c:792)
[...]
[   37.880035] drm_ioctl (linux/./include/linux/uaccess.h:152
linux/drivers/gpu/drm/drm_ioctl.c:887)
[...]
[   37.882646] do_vfs_ioctl (linux/fs/ioctl.c:47 linux/fs/ioctl.c:545
linux/fs/ioctl.c:732)
[...]
[   37.885407] ksys_ioctl (linux/./include/linux/file.h:43 linux/fs/ioctl.c:750)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
