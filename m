Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E0062729A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 21:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF5610E246;
	Sun, 13 Nov 2022 20:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EA310E246
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 20:43:01 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so1794840otl.10
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 12:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hc+Ljz5g+y0Q6LZI8LQIZm/+4qQ5r+Ue80MM2eHDZaE=;
 b=RN8W9/TRXB8oOkMxWn0O82Kdx4nOIdjSxi5ktzH+P8DwUPoOJ059ENjOKgW/v3Gtqc
 U8ZnlSaJcV673WbFzWP/1W/CZdObmUNVavrIp3UVQ1zptQlDHAMS0v20Glb5Y9o/hhtZ
 8Xa38/hUaIDx1kW33UlOoMXqyPhCXUEy10T0TAKhCZpGVy0+yrtur8fEHtCEWRpvZ2SF
 uhgztB9ApBTwj5UJ66a2sImOsDi7L1KaU+lleohF9SYBx6ZqM3a/qR9fM7OGt+jcQ2Hq
 sQ17V87DP5KpcxAS1YIER+wjnXmfDpgUJZgg7biJBbflR57lsj9axYxM45NwH0iVrYwg
 TkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hc+Ljz5g+y0Q6LZI8LQIZm/+4qQ5r+Ue80MM2eHDZaE=;
 b=fKQ+nHNNa7tDcLtADrda2n33d4+Yf/HRkGzpeXMXBIp7mDA7fn1H5gakKhLI4hcSqq
 Z/E4XMvXpa+U03L/X8rDm6QGjRwXbWa4P1jRgfiu5L+uxTNuKt4EuFMlZBYMl8GptKJM
 1elJ4rm90/Mq1tn7S2VPhgPay2aLo9E0i0NBSN3XKUynHKIhhUHLZmXi5Crtu0pxkkiJ
 Q5O1LjpxY4VEuvw8hkz/rwFDxB5V/hoYIqu5/R9E/s2kyVOPaIqRRp4RvUGly7BHwFbU
 LDpthmZm4xYfijn8xBSUSXqZgxDgQwlBzVd2VQyhybWlOex/bF9fsbpDJvv9oy2jyIX5
 At0g==
X-Gm-Message-State: ANoB5pllfKSmwLQUyOdIT6GyTZVKILG2f5Y8vuNPz07fhQxLF9frOOG0
 etg/nF/07WLhOCt623r9AL85Oy7ujFT3a6RB8Nee4g==
X-Google-Smtp-Source: AA0mqf7HZIDehA8Rvknh5xPTnHKk4J7wQvBCFoIRXtH6TyR3WYn1RnmeSSxCCutwmQgipvMYZeUcX1D+YSzRoA/ns7Q=
X-Received: by 2002:a05:6830:43:b0:66c:9e9a:1f82 with SMTP id
 d3-20020a056830004300b0066c9e9a1f82mr4978215otp.269.1668372180313; Sun, 13
 Nov 2022 12:43:00 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 13 Nov 2022 21:42:49 +0100
Message-ID: <CACT4Y+bJiZgT1W4JY+X=aZjbg8+X2fw7j2pxH_Hke_yn7R0Qnw@mail.gmail.com>
Subject: dealock in drm_fb_helper_damage_work
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
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

Hi,

I am getting the following deadlock on reservation_ww_class_mutex
while trying to boot next-20221111 kernel:

============================================
WARNING: possible recursive locking detected
6.1.0-rc4-next-20221111 #193 Not tainted
--------------------------------------------
kworker/4:1/81 is trying to acquire lock:
ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
dma_resv_lock_interruptible include/linux/dma-resv.h:372 [inline]
ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
ttm_bo_reserve include/drm/ttm/ttm_bo_driver.h:121 [inline]
ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
drm_gem_vram_vmap+0xa4/0x590 drivers/gpu/drm/drm_gem_vram_helper.c:436

but task is already holding lock:
ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
dma_resv_lock include/linux/dma-resv.h:345 [inline]
ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
drm_gem_vmap_unlocked+0x3f/0xa0 drivers/gpu/drm/drm_gem.c:1195

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(reservation_ww_class_mutex);
  lock(reservation_ww_class_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

4 locks held by kworker/4:1/81:
 #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
atomic_long_set include/linux/atomic/atomic-instrumented.h:1280
[inline]
 #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
set_work_data kernel/workqueue.c:636 [inline]
 #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
set_work_pool_and_clear_pending kernel/workqueue.c:663 [inline]
 #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
process_one_work+0x8e4/0x1720 kernel/workqueue.c:2260
 #1: ffffc9000694fda0
((work_completion)(&helper->damage_work)){+.+.}-{0:0}, at:
process_one_work+0x918/0x1720 kernel/workqueue.c:2264
 #2: ffff88812ebe8278 (&helper->lock){+.+.}-{3:3}, at:
drm_fbdev_damage_blit drivers/gpu/drm/drm_fbdev_generic.c:312 [inline]
 #2: ffff88812ebe8278 (&helper->lock){+.+.}-{3:3}, at:
drm_fbdev_fb_dirty+0x30e/0xcd0 drivers/gpu/drm/drm_fbdev_generic.c:342
 #3: ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
dma_resv_lock include/linux/dma-resv.h:345 [inline]
 #3: ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
drm_gem_vmap_unlocked+0x3f/0xa0 drivers/gpu/drm/drm_gem.c:1195

stack backtrace:
CPU: 4 PID: 81 Comm: kworker/4:1 Not tainted 6.1.0-rc4-next-20221111 #193
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
Workqueue: events drm_fb_helper_damage_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x100/0x178 lib/dump_stack.c:106
 print_deadlock_bug kernel/locking/lockdep.c:2990 [inline]
 check_deadlock kernel/locking/lockdep.c:3033 [inline]
 validate_chain kernel/locking/lockdep.c:3818 [inline]
 __lock_acquire.cold+0x119/0x3b9 kernel/locking/lockdep.c:5055
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e0/0x610 kernel/locking/lockdep.c:5633
 __mutex_lock_common kernel/locking/mutex.c:603 [inline]
 __ww_mutex_lock.constprop.0+0x1ba/0x2ee0 kernel/locking/mutex.c:754
 ww_mutex_lock_interruptible+0x37/0x140 kernel/locking/mutex.c:886
 dma_resv_lock_interruptible include/linux/dma-resv.h:372 [inline]
 ttm_bo_reserve include/drm/ttm/ttm_bo_driver.h:121 [inline]
 drm_gem_vram_vmap+0xa4/0x590 drivers/gpu/drm/drm_gem_vram_helper.c:436
 drm_gem_vmap+0xc5/0x1b0 drivers/gpu/drm/drm_gem.c:1166
 drm_gem_vmap_unlocked+0x4a/0xa0 drivers/gpu/drm/drm_gem.c:1196
 drm_client_buffer_vmap+0x45/0xd0 drivers/gpu/drm/drm_client.c:326
 drm_fbdev_damage_blit drivers/gpu/drm/drm_fbdev_generic.c:314 [inline]
 drm_fbdev_fb_dirty+0x31e/0xcd0 drivers/gpu/drm/drm_fbdev_generic.c:342
 drm_fb_helper_damage_work+0x27a/0x5d0 drivers/gpu/drm/drm_fb_helper.c:388
 process_one_work+0xa33/0x1720 kernel/workqueue.c:2289
 worker_thread+0x67d/0x10e0 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>

The config is:
https://gist.githubusercontent.com/dvyukov/2897b21db809075a22db0370c495ed2d/raw/9b2535b2ba77bb57e4f1ba2b909ad4075b6e2c6a/gistfile1.txt

Qemu command line:
qemu-system-x86_64 -enable-kvm -machine q35,nvdimm -cpu
max,migratable=off -smp 18 \
-m 72G -hda buildroot-amd64-2021.08 -kernel arch/x86/boot/bzImage -nographic \
-net user,host=10.0.2.10,hostfwd=tcp::10022-:22 -net nic,model=virtio-net-pci \
-append "console=ttyS0 root=/dev/sda1 earlyprintk=serial rodata=n \
oops=panic panic_on_warn=1 panic=86400 coredump_filter=0xffff"
