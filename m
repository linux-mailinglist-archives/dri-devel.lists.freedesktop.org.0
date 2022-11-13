Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677466272A0
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 21:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083E10E24A;
	Sun, 13 Nov 2022 20:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3CF10E24A
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 20:48:27 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso10649397fac.11
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 12:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A+FqJCQj3cxcBSnjLAJDzR2+3n1zYLnsgtHBpABoNnQ=;
 b=D1Fxb6u/rIa6zUsRamAj+tUHDp/UiMRsW1vdPDCvxJb+rkdm1z+VCXXMfr9mHq3DZo
 hxYwo5gjCEWlm6kEltYGgqSiBB5qhvnzzCX5XGMjpsn3rTGjLnn/su6E9DEj88+y5FsO
 J+3vt7fuLw5epBHtKqDmWKoTi8aa1jr/DpF3IQ0WOGBIF1KuWhTd399sNvPyEGlTOMxM
 yTECGoouiveS7oNPC8+WB6fq9H26ll0rkleWMjeNIp+pX8AEWioLQLDlFX2ghXcgfr95
 JHbnwcG7NC/pa0S0xFHYGfrnRqTcQPmFRl8twMTzS1X+r1HnfgtbFwKufiPYeHzElJBP
 husA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A+FqJCQj3cxcBSnjLAJDzR2+3n1zYLnsgtHBpABoNnQ=;
 b=oLBeuVXAO1iWGoSAg4Uqg2KHSlYjyt8/QQ0i9JU8ZO8of2R+lYhATv3BTPDrUZBfrr
 mr2j07F6hi/a5OWIcew718voQM56yOTdAzWym0kxHEcBV9ar33NNfVoIZLOXbEcI0P8T
 bnN31MT+ALkAO+TolyJKjacn6uN1+Mtmwy8rEeFU1mUFXJQfAVoPAHs6pdrn1icYk3Bq
 b4/fBIRpuiqt21KqF3AGCAo8vvbcZ4yofpnN89UESMGDSm6IVwx+lqyAZIWXpDz3c/pD
 MpYesihAbG48QsKZKL/LFNH36HVJEgK+CRYMXowkDKzd3YNxTx4j3M0jDsiNvfsMnd06
 i7FA==
X-Gm-Message-State: ANoB5pmi3BRU/DH2fgub8aZyrww+52jnKErZxbNyvh730BbWgywQ5Bzf
 xzjF/Xx+m7bJdZUGb4XVBOqCFL/v6A2ZcfHWpL8Efw==
X-Google-Smtp-Source: AA0mqf47dX7RN8qqGSzmJeDvNjmCCRtkgWjGs+Hj0Kp3Oys9ObMoe8KAdWDXf/SjvuyXtISbRT/yJLTRRjA4Hg66bNk=
X-Received: by 2002:a05:6870:1117:b0:13d:a22b:3503 with SMTP id
 23-20020a056870111700b0013da22b3503mr5503729oaf.233.1668372506826; Sun, 13
 Nov 2022 12:48:26 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+bJiZgT1W4JY+X=aZjbg8+X2fw7j2pxH_Hke_yn7R0Qnw@mail.gmail.com>
In-Reply-To: <CACT4Y+bJiZgT1W4JY+X=aZjbg8+X2fw7j2pxH_Hke_yn7R0Qnw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 13 Nov 2022 21:48:16 +0100
Message-ID: <CACT4Y+YFtMzmDyHH8Uf2Q69xBAP6gVg+hN2Gz-+cj=K79U8okg@mail.gmail.com>
Subject: Re: dealock in drm_fb_helper_damage_work
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dmitry.osipenko@collabora.com
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

On Sun, 13 Nov 2022 at 21:42, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hi,
>
> I am getting the following deadlock on reservation_ww_class_mutex
> while trying to boot next-20221111 kernel:

The code is recently added by this commit:

commit 79e2cf2e7a193473dfb0da3b9b869682b43dc60f
Author: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Date:   Mon Oct 17 20:22:11 2022 +0300
    drm/gem: Take reservation lock for vmap/vunmap operations

> ============================================
> WARNING: possible recursive locking detected
> 6.1.0-rc4-next-20221111 #193 Not tainted
> --------------------------------------------
> kworker/4:1/81 is trying to acquire lock:
> ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> dma_resv_lock_interruptible include/linux/dma-resv.h:372 [inline]
> ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> ttm_bo_reserve include/drm/ttm/ttm_bo_driver.h:121 [inline]
> ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> drm_gem_vram_vmap+0xa4/0x590 drivers/gpu/drm/drm_gem_vram_helper.c:436
>
> but task is already holding lock:
> ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> dma_resv_lock include/linux/dma-resv.h:345 [inline]
> ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> drm_gem_vmap_unlocked+0x3f/0xa0 drivers/gpu/drm/drm_gem.c:1195
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(reservation_ww_class_mutex);
>   lock(reservation_ww_class_mutex);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 4 locks held by kworker/4:1/81:
>  #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>  #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
> arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
>  #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
> atomic_long_set include/linux/atomic/atomic-instrumented.h:1280
> [inline]
>  #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
> set_work_data kernel/workqueue.c:636 [inline]
>  #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
> set_work_pool_and_clear_pending kernel/workqueue.c:663 [inline]
>  #0: ffff888100078d38 ((wq_completion)events){+.+.}-{0:0}, at:
> process_one_work+0x8e4/0x1720 kernel/workqueue.c:2260
>  #1: ffffc9000694fda0
> ((work_completion)(&helper->damage_work)){+.+.}-{0:0}, at:
> process_one_work+0x918/0x1720 kernel/workqueue.c:2264
>  #2: ffff88812ebe8278 (&helper->lock){+.+.}-{3:3}, at:
> drm_fbdev_damage_blit drivers/gpu/drm/drm_fbdev_generic.c:312 [inline]
>  #2: ffff88812ebe8278 (&helper->lock){+.+.}-{3:3}, at:
> drm_fbdev_fb_dirty+0x30e/0xcd0 drivers/gpu/drm/drm_fbdev_generic.c:342
>  #3: ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> dma_resv_lock include/linux/dma-resv.h:345 [inline]
>  #3: ffff88812ebe89a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> drm_gem_vmap_unlocked+0x3f/0xa0 drivers/gpu/drm/drm_gem.c:1195
>
> stack backtrace:
> CPU: 4 PID: 81 Comm: kworker/4:1 Not tainted 6.1.0-rc4-next-20221111 #193
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x100/0x178 lib/dump_stack.c:106
>  print_deadlock_bug kernel/locking/lockdep.c:2990 [inline]
>  check_deadlock kernel/locking/lockdep.c:3033 [inline]
>  validate_chain kernel/locking/lockdep.c:3818 [inline]
>  __lock_acquire.cold+0x119/0x3b9 kernel/locking/lockdep.c:5055
>  lock_acquire kernel/locking/lockdep.c:5668 [inline]
>  lock_acquire+0x1e0/0x610 kernel/locking/lockdep.c:5633
>  __mutex_lock_common kernel/locking/mutex.c:603 [inline]
>  __ww_mutex_lock.constprop.0+0x1ba/0x2ee0 kernel/locking/mutex.c:754
>  ww_mutex_lock_interruptible+0x37/0x140 kernel/locking/mutex.c:886
>  dma_resv_lock_interruptible include/linux/dma-resv.h:372 [inline]
>  ttm_bo_reserve include/drm/ttm/ttm_bo_driver.h:121 [inline]
>  drm_gem_vram_vmap+0xa4/0x590 drivers/gpu/drm/drm_gem_vram_helper.c:436
>  drm_gem_vmap+0xc5/0x1b0 drivers/gpu/drm/drm_gem.c:1166
>  drm_gem_vmap_unlocked+0x4a/0xa0 drivers/gpu/drm/drm_gem.c:1196
>  drm_client_buffer_vmap+0x45/0xd0 drivers/gpu/drm/drm_client.c:326
>  drm_fbdev_damage_blit drivers/gpu/drm/drm_fbdev_generic.c:314 [inline]
>  drm_fbdev_fb_dirty+0x31e/0xcd0 drivers/gpu/drm/drm_fbdev_generic.c:342
>  drm_fb_helper_damage_work+0x27a/0x5d0 drivers/gpu/drm/drm_fb_helper.c:388
>  process_one_work+0xa33/0x1720 kernel/workqueue.c:2289
>  worker_thread+0x67d/0x10e0 kernel/workqueue.c:2436
>  kthread+0x2e4/0x3a0 kernel/kthread.c:376
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
>  </TASK>
>
> The config is:
> https://gist.githubusercontent.com/dvyukov/2897b21db809075a22db0370c495ed2d/raw/9b2535b2ba77bb57e4f1ba2b909ad4075b6e2c6a/gistfile1.txt
>
> Qemu command line:
> qemu-system-x86_64 -enable-kvm -machine q35,nvdimm -cpu
> max,migratable=off -smp 18 \
> -m 72G -hda buildroot-amd64-2021.08 -kernel arch/x86/boot/bzImage -nographic \
> -net user,host=10.0.2.10,hostfwd=tcp::10022-:22 -net nic,model=virtio-net-pci \
> -append "console=ttyS0 root=/dev/sda1 earlyprintk=serial rodata=n \
> oops=panic panic_on_warn=1 panic=86400 coredump_filter=0xffff"
