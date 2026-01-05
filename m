Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E403CF47FA
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FA010E3B9;
	Mon,  5 Jan 2026 15:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="EDoEbJci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C00510E17D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:48:29 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-430f9ffd4e8so955100f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767628108; x=1768232908; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lkFK6cQgV8GyAdifHouF5m9RqRwcuR1Sece+EW+SEIU=;
 b=EDoEbJcitXUyq1UkRMMiDfjIfRhtXjc5J8hDyR8FVdMV3Nd67hCXXVw40VkVB7irNb
 4MewVSauBZcPE6lFhXJlko3z27yH6/tLnd0C5R8pc4hvwqcF2WyQkpAg5IHGuUevCUYH
 DW/ipy/cb6hgI3xLEyGMbTw4LnaEyELpXdjhcnxfbXUzDHL+Nbw590shh7rAFmsZodle
 A9xNdwDDEXdzP5AgfsZDCRYKVYIZeHqQgZ90FpYRlgSDF47yVLrkxubDFk8mjdldlq5j
 2Hq8bJmanVUArP/uzJEvh+V7rV7zI31mBxSvO0wePnk4dlZiX3CgDYdzARQ431yvYy4C
 WOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767628108; x=1768232908;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lkFK6cQgV8GyAdifHouF5m9RqRwcuR1Sece+EW+SEIU=;
 b=nR1R+aoqBeQoc6hunY53+ZM4vuuEHsGY5mPZS8vIhX3LEWjqtLhxR1JM/BD2SRCM7p
 FE3Crzajbhzp84f7J+CJRVzyQ33qEam1y2bWnP1hT7tlqxBccoC0Jw1dbqU4DvnpP/WU
 I8gL5kDgSLivTiTSjTuMy+d7QIT9DVENlsPnU/8wcMan/tRFZTQpzNzIoEbRXlJJoBxl
 PgYB9JE9L9fcEkdrXERUL+DCgU9oyd4qjD/FdwZOm8re79sdsyrAzZ0f8Dl6+rLPnOuj
 rw68e54aYuDFV7Q3XK4Bbsw3JzvtQFPQoDuAwp/fKSC9AEohJtC7HPiVf3WvQ6XuU50H
 1MeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVn3s4mxiJo/Wr0QldVAEdmLOlOJTCjuyGD/wPPUetAZqFLbY5aizHQTaphxJqk2/rpzuri/xQev8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR9ros00KffD6WWrUbVeG4BqsWmx5L6XHV2qC2tl2t4MvX7Aa3
 4NSchCsP9B3WeDoRXf2Lakt6xYFlm7DbKpdLUCsXVSPP8cTs6uFOqiFaDHqT8SbN41vY0TcdZCP
 L1sH8
X-Gm-Gg: AY/fxX7oRhtj9JloIGpGw7EDJsI0ZJqh2aZAt1I2UfU6U3YPft7Sw7/2rvXQ3eCVREg
 Cy1A7Z9Sw3KO3z1GiXJ1Us+KwpqamQ3iUX5JK9uqyRXIRamEBxcMj0K+ACqIWNBsl84KDR3JnN6
 rQYQohPnSrp4RIk+9yQBp3wjJWjnQQCe/WLdh7YvdWK0P9wgMcP+F6soKARhcznNpgp0PITDh7r
 82DgdQecn5mR8ZMMcX+DhpT0uQ/lFmSOSqVlLAe4egJHTIEVqxieIgOJ4Db7/d8K60ycEK4/sxe
 ApWPhlN5J8GSlh3Kt3P4OwTBtEbZFoN6fwCQMgkhnC2y244dZce3J2wIBCf/2apS+KTU96OngHA
 PC1Z/MrUAPiFh0CU1isyDvpDXIbi2o36aQxvNvGHoPJ3mNDk492AKBVSWDasZC1g0Cx4YpAeweQ
 qZpIEf3eZ2qf4SUg==
X-Google-Smtp-Source: AGHT+IF4bBxIwyxOHagUL/rGp4fhcS1kRhg8KvGvQD9CeAbseJFjvtnlRsVj6gawMC1AxNTdET/ZKw==
X-Received: by 2002:a5d:58da:0:b0:430:fcbc:dc52 with SMTP id
 ffacd0b85a97d-432aa409640mr9444417f8f.30.1767628107736; 
 Mon, 05 Jan 2026 07:48:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca56a16sm162988f8f.30.2026.01.05.07.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 07:48:27 -0800 (PST)
Date: Mon, 5 Jan 2026 16:48:25 +0100
From: Petr Mladek <pmladek@suse.com>
To: =?utf-8?B?546L5b+X?= <23009200614@stu.xidian.edu.cn>
Cc: rodrigosiqueiramelo@gmail.com, daniel@ffwll.ch,
 senozhatsky@chromium.org, paulmck@kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [BUG] RCU stall in vkms_vblank_simulate due to lock contention
 during warn_alloc (6.18.0)
Message-ID: <aVvdSTIVFItFZENK@pathway.suse.cz>
References: <2cea5f.92cc.19b8721c1b5.Coremail.23009200614@stu.xidian.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cea5f.92cc.19b8721c1b5.Coremail.23009200614@stu.xidian.edu.cn>
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

Adding some DRM people into Cc.

On Sun 2026-01-04 11:51:35, 王志 wrote:
> Dear Developers,
> 
> I am reporting an RCU CPU stall detected by Syzkaller on Linux 6.18.0. The issue involves a deadlock-like scenario in the VKMS driver when memory allocation warnings occur.
> 
> Analysis: CPU 2 is executing a DRM ioctl and enters warn_alloc, which invokes printk. While flushing the console, an hrtimer interrupt fires and runs vkms_vblank_simulate.
> 
> The interrupt handler stalls at drm_handle_vblank trying to acquire a spinlock, which appears to be held by CPU 1 (running drm_file_free). Since this happens in hard IRQ context, CPU 2 spins indefinitely, leading to the RCU stall.

If it spins indefinitelly then it looks like a deadlock.

But it seems that both CPU1 and CPU2 are waiting for the  (same?)
lock, see below.

> Stack Trace Highlights:
> 
> RIP: native_queued_spin_lock_slowpath
> <IRQ>
> drm_handle_vblank+0x125/0xc70
> vkms_vblank_simulate+0xa8/0x390
> hrtimer_interrupt
> <TASK>
> console_flush_all
> warn_alloc
> __kvmalloc_node_noprof
> drm_property_create_blob
> drm_ioctl
> Environment:
> 
> Kernel: 6.18.0 #1 PREEMPT(full)
> 
> Config: KASAN enabled
> 
> Hardware: QEMU (i440FX)
> 
> It seems like the combination of PREEMPT(full) and the long duration of warn_alloc's printk cycle makes the system vulnerable to this interrupt-level contention.
> 
> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> rcu: 	2-...!: (10 ticks this GP) idle=4f7c/1/0x4000000000000000 softirq=64211/64211 fqs=13
> rcu: 	(detected by 0, t=10505 jiffies, g=77557, q=966 ncpus=4)
> Sending NMI from CPU 0 to CPUs 2:
> NMI backtrace for cpu 2
> CPU: 2 UID: 0 PID: 27050 Comm: syz.2.6110 Not tainted 6.18.0 #1 PREEMPT(full) 
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> RIP: 0010:native_queued_spin_lock_slowpath+0x23e/0x9c0

This is spin_lock_slowpath on CPU2 => CPU2 is spinning and waiting for
a lock.

Code: 02 48 89 e8 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 1c 07 00 00 b8 01 00 00 00 66 89 45 00 e9 c2 fe ff ff 89 44 24 40 f3 90 <e9> 5e fe ff ff 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03
> RSP: 0018:ffffc90000658b78 EFLAGS: 00000002
> RAX: 0000000000000001 RBX: 0000000000000001 RCX: ffffffff8b43f32e
> RDX: ffffed10044eac6b RSI: 0000000000000004 RDI: ffff888022756350
> RBP: ffff888022756350 R08: 0000000000000000 R09: ffffed10044eac6a
> R10: ffff888022756353 R11: 0000000000000000 R12: 1ffff920000cb171
> R13: 0000000000000003 R14: ffffed10044eac6a R15: ffffc90000658bb8
> FS:  00007f1a7d7f6640(0000) GS:ffff8880cf101000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f2e53b8fff0 CR3: 0000000061616000 CR4: 00000000000006f0
> Call Trace:
>  <IRQ>
>  debug_spin_lock_before home/wmy/Fuzzer/third_tool/linux-6.18/kernel/locking/spinlock_debug.c:87 [inline]
>  do_raw_spin_lock+0x20d/0x2b0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/locking/spinlock_debug.c:115
>  __raw_spin_lock_irqsave home/wmy/Fuzzer/third_tool/linux-6.18/include/linux/spinlock_api_smp.h:110 [inline]
>  _raw_spin_lock_irqsave+0x45/0x60 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/locking/spinlock.c:162
>  drm_handle_vblank+0x125/0xc70
>  vkms_vblank_simulate+0xa8/0x390
>  __run_hrtimer home/wmy/Fuzzer/third_tool/linux-6.18/kernel/time/hrtimer.c:1779 [inline]
>  __hrtimer_run_queues+0x1f5/0xb30 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/time/hrtimer.c:1841
>  hrtimer_interrupt+0x39a/0x880 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/time/hrtimer.c:1912
>  instrument_atomic_read home/wmy/Fuzzer/third_tool/linux-6.18/include/linux/instrumented.h:68 [inline]
>  _test_bit home/wmy/Fuzzer/third_tool/linux-6.18/include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
>  cpumask_test_cpu home/wmy/Fuzzer/third_tool/linux-6.18/include/linux/cpumask.h:646 [inline]
>  cpu_online home/wmy/Fuzzer/third_tool/linux-6.18/include/linux/cpumask.h:1205 [inline]
>  __do_trace_local_timer_exit home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/include/asm/trace/irq_vectors.h:40 [inline]
>  trace_local_timer_exit home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/include/asm/trace/irq_vectors.h:40 [inline]
>  __sysvec_apic_timer_interrupt+0x10d/0x400 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/kernel/apic/apic.c:1059
>  sysvec_apic_timer_interrupt+0xa3/0xc0 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/kernel/apic/apic.c:2145
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/include/asm/idtentry.h:697
> RIP: 0010:srcu_read_unlock_nmisafe home/wmy/Fuzzer/third_tool/linux-6.18/include/linux/srcu.h:449 [inline]
> RIP: 0010:console_srcu_read_unlock home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:303 [inline]
> RIP: 0010:console_flush_all+0x905/0xbe0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:3225
> Code: 24 08 48 8d 68 01 4c 89 e8 48 c1 e8 03 42 80 3c 30 00 0f 85 ab 02 00 00 49 89 6f 58 e9 3a ff ff ff e8 ef c7 20 00 fb 4c 89 e8 <48> c1 e8 03 42 80 3c 30 00 0f 84 1e ff ff ff 4c 89 ef e8 c4 20 87
> RSP: 0018:ffffc90002dd7138 EFLAGS: 00000246
> RAX: ffffffff8ee702d8 RBX: 0000000000000001 RCX: ffffc90007631000
> RDX: 0000000000080000 RSI: ffffffff81999011 RDI: 0000000000000007
> RBP: 0000000000000200 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000200 R11: 0000000000000000 R12: 0000000000000000
> R13: ffffffff8ee702d8 R14: dffffc0000000000 R15: ffffffff8ee70280
>  __console_flush_and_unlock home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:3258 [inline]
>  console_unlock+0xc2/0x1f0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:3298
>  console_trylock home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:2843 [inline]
>  console_trylock home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:2836 [inline]
>  console_trylock_spinning home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:1982 [inline]
>  vprintk_emit+0x3e7/0x670 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:2422
>  _printk+0xbe/0xf0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/printk/printk.c:2447
>  show_free_areas+0x121d/0x2140 home/wmy/Fuzzer/third_tool/linux-6.18/mm/show_mem.c:299
>  __show_mem+0x34/0x150 home/wmy/Fuzzer/third_tool/linux-6.18/mm/show_mem.c:408
>  warn_alloc_show_mem home/wmy/Fuzzer/third_tool/linux-6.18/mm/page_alloc.c:3938 [inline]
>  warn_alloc+0x278/0x360 home/wmy/Fuzzer/third_tool/linux-6.18/mm/page_alloc.c:3963
>  free_vm_area home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:4619 [inline]
>  __vmalloc_area_node home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:3709 [inline]
>  __vmalloc_node_range_noprof+0xfaa/0x13b0 home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:3897
>  __vmalloc_node_noprof+0xac/0xf0 home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:3960
>  set_vm_area_page_order home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:3089 [inline]
>  __vmalloc_area_node home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:3713 [inline]
>  __vmalloc_node_range_noprof+0x40d/0x13b0 home/wmy/Fuzzer/third_tool/linux-6.18/mm/vmalloc.c:3897
>  slab_want_init_on_free home/wmy/Fuzzer/third_tool/linux-6.18/mm/slab.h:644 [inline]
>  slab_want_init_on_free home/wmy/Fuzzer/third_tool/linux-6.18/mm/slab.h:640 [inline]
>  maybe_wipe_obj_freeptr home/wmy/Fuzzer/third_tool/linux-6.18/mm/slub.c:4918 [inline]
>  slab_alloc_node home/wmy/Fuzzer/third_tool/linux-6.18/mm/slub.c:5278 [inline]
>  __do_kmalloc_node home/wmy/Fuzzer/third_tool/linux-6.18/mm/slub.c:5649 [inline]
>  __kvmalloc_node_noprof+0x41f/0x9d0 home/wmy/Fuzzer/third_tool/linux-6.18/mm/slub.c:7112
>  drm_property_create_blob.part.0+0x34/0x320
>  drm_mode_createblob_ioctl+0x139/0x490
>  drm_ioctl_kernel+0x1ed/0x3e0
>  drm_ioctl+0x574/0xb90
>  vfs_ioctl home/wmy/Fuzzer/third_tool/linux-6.18/fs/ioctl.c:51 [inline]
>  __do_sys_ioctl home/wmy/Fuzzer/third_tool/linux-6.18/fs/ioctl.c:597 [inline]
>  __se_sys_ioctl home/wmy/Fuzzer/third_tool/linux-6.18/fs/ioctl.c:583 [inline]
>  __x64_sys_ioctl+0x18f/0x210 home/wmy/Fuzzer/third_tool/linux-6.18/fs/ioctl.c:583
>  do_syscall_64+0xcb/0xfa0 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/entry/syscall_64.c:99
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1a7f5b059d
> Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f1a7d7f5f98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f1a7f825fa0 RCX: 00007f1a7f5b059d
> RDX: 0000200000000000 RSI: 00000000c01064bd RDI: 000000000000000a
> RBP: 00007f1a7f64e078 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f1a7f826038 R14: 00007f1a7f825fa0 R15: 00007f1a7d7d6000
>  </TASK>
> rcu: rcu_preempt kthread timer wakeup didn't happen for 10449 jiffies! g77557 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> rcu: 	Possible timer handling issue on cpu=1 timer-softirq=43340
> rcu: rcu_preempt kthread starved for 10450 jiffies! g77557 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
> rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
> rcu: RCU grace-period kthread stack dump:
> task:rcu_preempt     state:I stack:28424 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00080000
> Call Trace:
>  <TASK>
>  sched_info_arrive home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/stats.h:267 [inline]
>  sched_info_switch home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/stats.h:330 [inline]
>  prepare_task_switch home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/core.c:5122 [inline]
>  context_switch home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/core.c:5272 [inline]
>  __schedule+0x1044/0x5bb0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/core.c:6929
>  __schedule_loop home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/core.c:7011 [inline]
>  schedule+0xe7/0x3a0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/sched/core.c:7026
>  schedule_timeout+0x113/0x280 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/time/sleep_timeout.c:98
>  rcu_gp_fqs_check_wake home/wmy/Fuzzer/third_tool/linux-6.18/kernel/rcu/tree.c:2007 [inline]
>  rcu_gp_fqs_loop+0x18c/0xa00 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/rcu/tree.c:2083
>  rcu_gp_kthread+0x26f/0x370 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/rcu/tree.c:2280
>  kthread+0x3d0/0x780 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/kthread.c:463
>  ret_from_fork+0x676/0x7d0 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/kernel/process.c:195
>  ret_from_fork_asm+0x1a/0x30 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/entry/entry_64.S:245
>  </TASK>
> rcu: Stack dump where RCU GP kthread last ran:
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 27261 Comm: syz.1.6200 Not tainted 6.18.0 #1 PREEMPT(full) 
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> RIP: 0010:native_queued_spin_lock_slowpath+0x23e/0x9c0

This is spin_lock_slowpath on CPU1 => Also CPU1 seems to be spinning and
waiting for a lock.

On CPU2, in IRQ context, it seems that drm_handle_vblank() tries to take:

   + dev->event_lock
   + dev->vblank_time_lock

On CPU1, in TASK context, it seems that drm_file_free() in
drm_events_release() tries to take:

   + dev->event_lock

So, I guess that that contention/deadlock is on dev->event_lock.
But who owns the lock, please? It is not obvious to me.

On CPU2, in TASK context, drm_property_create_blob() seems to take
a mutex. So, it should not be holding any spin lock.

What is going on CPU0?
Could you please provice a (more) complete kernel log?

And if there is a deadlock scenario then it might get reported
by lockdep. Could you please try to enable CONFIG_PROVE_LOCKING?

> Code: 02 48 89 e8 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 1c 07 00 00 b8 01 00 00 00 66 89 45 00 e9 c2 fe ff ff 89 44 24 40 f3 90 <e9> 5e fe ff ff 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03
> RSP: 0018:ffffc90002d97b48 EFLAGS: 00000002
> RAX: 0000000000000001 RBX: 0000000000000001 RCX: ffffffff8b43f32e
> RDX: ffffed10044eac6b RSI: 0000000000000004 RDI: ffff888022756350
> RBP: ffff888022756350 R08: 0000000000000000 R09: ffffed10044eac6a
> R10: ffff888022756353 R11: 0000000000000000 R12: 1ffff920005b2f6b
> R13: 0000000000000003 R14: ffffed10044eac6a R15: ffffc90002d97b88
> FS:  000055557fb21500(0000) GS:ffff8881a2601000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f4e64fa3fc8 CR3: 0000000131d68000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  debug_spin_lock_before home/wmy/Fuzzer/third_tool/linux-6.18/kernel/locking/spinlock_debug.c:87 [inline]
>  do_raw_spin_lock+0x20d/0x2b0 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/locking/spinlock_debug.c:115
>  __raw_spin_lock_irqsave home/wmy/Fuzzer/third_tool/linux-6.18/include/linux/spinlock_api_smp.h:110 [inline]
>  _raw_spin_lock_irqsave+0x45/0x60 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/locking/spinlock.c:162
>  drm_file_free.part.0+0x2fd/0xcf0
>  drm_close_helper.isra.0+0x183/0x1f0
>  drm_release+0x1ab/0x360
>  __fput+0x402/0xb50 home/wmy/Fuzzer/third_tool/linux-6.18/fs/file_table.c:468
>  task_work_run+0x16b/0x260 home/wmy/Fuzzer/third_tool/linux-6.18/kernel/task_work.c:227
>  exit_to_user_mode_loop+0xf9/0x130
>  do_syscall_64+0x424/0xfa0 home/wmy/Fuzzer/third_tool/linux-6.18/arch/x86/entry/syscall_32.c:308
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4e641b059d
> Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff56b8c5b8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
> RAX: 0000000000000000 RBX: 00007f4e64427da0 RCX: 00007f4e641b059d
> RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
> RBP: 00007fff56b8c658 R08: 0000001b33b205bc R09: 0000000000000000
> R10: 0000001b33f20000 R11: 0000000000000246 R12: ffffffffffffffff
> R13: 00007f4e6442609c R14: 00007f4e64427da0 R15: 00007fff56b8c680
>  </TASK>

Best Regards,
Petr
