Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7367F79C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 12:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEDD10E0A5;
	Sat, 28 Jan 2023 11:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EA910E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 11:44:46 +0000 (UTC)
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 30SBie6D092786;
 Sat, 28 Jan 2023 20:44:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Sat, 28 Jan 2023 20:44:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 30SBie3D092783
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 28 Jan 2023 20:44:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c59cbadb-7671-2d7c-d535-24f41aff18cc@I-love.SAKURA.ne.jp>
Date: Sat, 28 Jan 2023 20:44:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [vmwgfx] crash upon vmw_open_channel() when booting on Oracle VM
 VirtualBox
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello.

I noticed that a kernel built with vmwgfx driver fails to boot a Linux guest
on Oracle VM VirtualBox 7.0.4 on Windows 11 on DELL Inspiron 14 5420.
I didn't notice this problem when I booted an older kernel on an older version
of Oracle VM VirtualBox on Windows 8.1 on an older PC.

The location that crashes is

        VMW_PORT(VMW_PORT_CMD_OPEN_CHANNEL,
                (protocol | GUESTMSG_FLAG_COOKIE), si, di,
                0,
                VMW_HYPERVISOR_MAGIC,
                eax, ebx, ecx, edx, si, di);

in vmw_open_channel(). It might be that some changes in VirtualBox side
is conflicting with how VMware tries to test if the guest is VMware.
How can I debug this problem?

Kernel config is at https://I-love.SAKURA.ne.jp/tmp/config-6.2.0-rc5-20230128 .

$ ./scripts/faddr2line vmlinux vmw_host_printf+0x31e/0x600
vmw_host_printf+0x31e/0x600:
vmw_open_channel at drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:109
(inlined by) vmw_host_printf at drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:530

----------------------------------------
[    0.000000][    T0] Linux version 6.2.0-rc5-00199-g5af6ce704936 (root@fuzz) (Ubuntu clang version 14.0.0-1ubuntu1, Ubuntu LLD 14.0.0) #937 SMP PREEMPT_DYNAMIC Sat Jan 28 20:13:16 JST 2023
(...snipped...)
[   10.701088][    T1] Linux agpgart interface v0.103
[   10.709269][    T1] ACPI: bus type drm_connector registered
[   10.715161][    T1] vmwgfx 0000:00:02.0: vgaarb: deactivate vga console
[   10.722965][    T1] Console: switching to colour dummy device 80x25
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] FIFO at 0x00000000f0000000 size is 2048 kiB
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] VRAM at 0x00000000e0000000 size is 16384 kiB
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] Running on SVGA version 2.
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] Capabilities: rect copy, cursor, cursor bypass, cursor bypass 2, alpha cursor, extended fifo, pitchlock, irq mask, gmr, traces, gmr2, screen object 2, command buffers, 
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] DMA map mode: Caching DMA mappings.
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] Legacy memory limits: VRAM = 16384 kB, FIFO = 2048 kB, surface = 507904 kB
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] MOB limits: max mob size = 0 kB, max mob pages = 0
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] Max GMR ids is 8192
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] Max number of GMR pages is 1048576
[   10.751077][    T1] vmwgfx 0000:00:02.0: [drm] Maximum display memory size is 16384 kiB
[   10.765114][    T1] vmwgfx 0000:00:02.0: [drm] Screen Object display unit initialized
[   10.774544][    T1] vmwgfx 0000:00:02.0: [drm] Fifo max 0x00200000 min 0x00001000 cap 0x00000355
[   10.779261][    T1] vmwgfx 0000:00:02.0: [drm] Using command buffers with DMA pool.
[   10.779261][    T1] vmwgfx 0000:00:02.0: [drm] Available shader model: Legacy.
[   10.779261][    T1] BUG: unable to handle page fault for address: 00000000c943508a
[   10.779261][    T1] #PF: supervisor write access in kernel mode
[   10.779261][    T1] #PF: error_code(0x0002) - not-present page
[   10.779261][    T1] PGD 0 P4D 0 
[   10.779261][    T1] Oops: 0002 [#1] PREEMPT SMP
[   10.779261][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc5-00199-g5af6ce704936 #937
[   10.779261][    T1] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[   10.779261][    T1] RIP: 0010:vmw_host_printf+0x31e/0x600
[   10.779261][    T1] Code: 53 08 48 89 43 18 4c 89 63 20 bb 52 50 43 c9 b8 68 58 4d 56 b9 1e 00 00 00 31 f6 31 ff 31 d2 66 ba 58 56 ed 49 89 cc 49 89 d7 <48> 89 73 38 48 89 7b 40 49 c7 06 00 00 00 00 49 c7 46 08 00 00 00
[   10.779261][    T1] RSP: 0000:ffff8881001c2fe0 EFLAGS: 00010246
[   10.779261][    T1] RAX: 00000000ffffffff RBX: 00000000c9435052 RCX: 000000000000001e
[   10.779261][    T1] RDX: 0000000000005658 RSI: 0000000000000000 RDI: 0000000000000000
[   10.779261][    T1] RBP: ffff8881001c3130 R08: ffffffff864b246e R09: ffffffff90bf0700
[   10.779261][    T1] R10: 0000000000000012 R11: ffff8881208d8000 R12: 000000000000001e
[   10.779261][    T1] R13: 0000000000000000 R14: ffff8881208d8b10 R15: 0000000000005658
[   10.779261][    T1] FS:  0000000000000000(0000) GS:ffff88821fa00000(0000) knlGS:0000000000000000
[   10.779261][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.779261][    T1] CR2: 00000000c943508a CR3: 0000000012029000 CR4: 00000000000106e0
[   10.779261][    T1] Call Trace:
[   10.779261][    T1]  <TASK>
[   10.779261][    T1]  ? kmsan_get_shadow_origin_ptr+0x49/0xa0
[   10.779261][    T1]  vmw_probe+0x6ecb/0x73e0
[   10.779261][    T1]  ? rpm_resume+0x1730/0x2d70
[   10.779261][    T1]  ? kmsan_get_shadow_origin_ptr+0x49/0xa0
[   10.779261][    T1]  ? preempt_count_sub+0xf8/0x330
[   10.779261][    T1]  ? _raw_spin_unlock_irqrestore+0x78/0xb0
[   10.779261][    T1]  ? kmsan_get_shadow_origin_ptr+0x49/0xa0
[   10.779261][    T1]  ? vmw_write+0x280/0x280
[   10.779261][    T1]  pci_device_probe+0xb1d/0xf00
[   10.779261][    T1]  ? pci_uevent+0x820/0x820
[   10.779261][    T1]  really_probe+0x6a2/0x1540
[   10.779261][    T1]  ? kmsan_internal_unpoison_memory+0x10/0x20
[   10.779261][    T1]  __driver_probe_device+0x3e9/0x530
[   10.779261][    T1]  driver_probe_device+0xaf/0x850
[   10.779261][    T1]  ? __msan_instrument_asm_store+0xb5/0xe0
[   10.779261][    T1]  __driver_attach+0x8d8/0xc90
[   10.779261][    T1]  bus_for_each_dev+0x20e/0x340
[   10.779261][    T1]  ? driver_attach+0xb0/0xb0
[   10.779261][    T1]  driver_attach+0x89/0xb0
[   10.779261][    T1]  bus_add_driver+0x692/0xc70
[   10.779261][    T1]  driver_register+0x478/0x8d0
[   10.779261][    T1]  __pci_register_driver+0x25d/0x3f0
[   10.779261][    T1]  ? i915_vma_resource_module_init+0xf0/0xf0
[   10.779261][    T1]  drm_pci_register_driver+0x72/0xa0
[   10.779261][    T1]  vmw_pci_driver_init+0x21/0x30
[   10.779261][    T1]  do_one_initcall+0x352/0x9b0
[   10.779261][    T1]  ? filter_irq_stacks+0x1d4/0x230
[   10.779261][    T1]  ? __stack_depot_save+0x21/0x4b0
[   10.779261][    T1]  ? kmsan_get_shadow_origin_ptr+0x49/0xa0
[   10.779261][    T1]  ? kmsan_get_shadow_origin_ptr+0x49/0xa0
[   10.779261][    T1]  ? __msan_metadata_ptr_for_load_1+0x20/0x30
[   10.779261][    T1]  ? parse_args+0x1763/0x1840
[   10.779261][    T1]  ? kmsan_get_shadow_origin_ptr+0x49/0xa0
[   10.779261][    T1]  ? i915_vma_resource_module_init+0xf0/0xf0
[   10.779261][    T1]  do_initcall_level+0x1ed/0x3e0
[   10.779261][    T1]  do_initcalls+0x129/0x1e0
[   10.779261][    T1]  ? smp_cpu_index_default+0x170/0x170
[   10.779261][    T1]  do_basic_setup+0x22/0x30
[   10.779261][    T1]  kernel_init_freeable+0x324/0x4e0
[   10.779261][    T1]  ? rest_init+0x2d0/0x2d0
[   10.779261][    T1]  kernel_init+0x33/0x860
[   10.779261][    T1]  ? rest_init+0x2d0/0x2d0
[   10.779261][    T1]  ret_from_fork+0x1f/0x30
[   10.779261][    T1]  </TASK>
[   10.779261][    T1] Modules linked in:
[   10.779261][    T1] CR2: 00000000c943508a
[   10.779261][    T1] ---[ end trace 0000000000000000 ]---
[   10.779261][    T1] RIP: 0010:vmw_host_printf+0x31e/0x600
[   10.779261][    T1] Code: 53 08 48 89 43 18 4c 89 63 20 bb 52 50 43 c9 b8 68 58 4d 56 b9 1e 00 00 00 31 f6 31 ff 31 d2 66 ba 58 56 ed 49 89 cc 49 89 d7 <48> 89 73 38 48 89 7b 40 49 c7 06 00 00 00 00 49 c7 46 08 00 00 00
[   10.779261][    T1] RSP: 0000:ffff8881001c2fe0 EFLAGS: 00010246
[   10.779261][    T1] RAX: 00000000ffffffff RBX: 00000000c9435052 RCX: 000000000000001e
[   10.779261][    T1] RDX: 0000000000005658 RSI: 0000000000000000 RDI: 0000000000000000
[   10.779261][    T1] RBP: ffff8881001c3130 R08: ffffffff864b246e R09: ffffffff90bf0700
[   10.779261][    T1] R10: 0000000000000012 R11: ffff8881208d8000 R12: 000000000000001e
[   10.779261][    T1] R13: 0000000000000000 R14: ffff8881208d8b10 R15: 0000000000005658
[   10.779261][    T1] FS:  0000000000000000(0000) GS:ffff88821fa00000(0000) knlGS:0000000000000000
[   10.779261][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.779261][    T1] CR2: 00000000c943508a CR3: 0000000012029000 CR4: 00000000000106e0
[   10.779261][    T1] Kernel panic - not syncing: Fatal exception
[   10.779261][    T1] Kernel Offset: disabled
[   10.779261][    T1] Rebooting in 86400 seconds..
----------------------------------------
