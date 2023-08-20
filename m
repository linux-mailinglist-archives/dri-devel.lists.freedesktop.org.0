Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D04782024
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 23:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C90210E15C;
	Sun, 20 Aug 2023 21:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from domac.alu.hr (domac.alu.unizg.hr [IPv6:2001:b68:2:2800::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974C210E15C;
 Sun, 20 Aug 2023 21:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id 309446016E;
 Sun, 20 Aug 2023 23:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1692566058; bh=ZD6pknCEJycLGFVPBeuZ+UHvP10inceHxW+/jLvVFAg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=D9lwvh1icuamutzEPApEhLQ0/DAZtgcvNAl9uu/BeCn5bR0zE+9xA44MPRBzajeTN
 IKhS887dX4T3xBWf9EGsOTF062QyD/X2GoCJanbOKRbKltr0EiH+K4FkV9lNY09Usm
 qpCFPpMsWwFMFBlqRw1ESvAr6nwW9ozG5t2spKO6amVcQ87m00oKqcuJx6AKme3jmN
 6sbvNBqiLh/E+gAwuWLztCNawQDiq1dBDZfRD1ZHcvrO1ckiXFkZvS6G7SD/5ZoU4z
 7i8W8Fv20thKSa2pLJGrhMq3vJyA4Tx6OiHQwS8Jp5zbN51+BFbIi2kXfYwh5vHOKC
 mkqgVticgfLBQ==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-khtF3AHs-W; Sun, 20 Aug 2023 23:14:14 +0200 (CEST)
Received: from [192.168.1.6] (unknown [94.250.191.183])
 by domac.alu.hr (Postfix) with ESMTPSA id 5D3436015E;
 Sun, 20 Aug 2023 23:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1692566054; bh=ZD6pknCEJycLGFVPBeuZ+UHvP10inceHxW+/jLvVFAg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=GIG0cH6meJ+gAB2X0vj4kphWbyhZKD1MctUT4p6JsxIubMqGhT+S6LvH2LDWFNQtQ
 lgo8GpwNfmbKttHWNQKPcgS6qDwHi59/1kLMiPkNEPuLr1fnjNrarOFsXdMDygG+r5
 odiKgKFE6h+8lfMpZl4PJCN7FDtYVzCTKSTb9N1JRG0/tjVHpQBBFNWhk+2NrTyYXI
 5zJdihVFaVnbtmHKB7L08nsMLodSkUTSjd+KpTE+CZl159Qo/9OH1Feo0FGit/iuFN
 9ZIod7bLdBG4nY72Y+NPiBAEl+Ev3GRMoZ2IPK+/WQ61VTeQbFXGq71UjFaTL0aKzV
 LaFaiOWELqOgg==
Message-ID: <3a931379-42f3-ec4f-36c1-bd267dd396b1@alu.unizg.hr>
Date: Sun, 20 Aug 2023 23:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [BUG]: amdgpu: soft lockup - CPU#1 stuck for 26s! [systemd-udevd:635]
Content-Language: en-US
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
To: linux-kernel@vger.kernel.org
References: <b4962d0d-7582-42a1-c8aa-5d31d5e28970@alu.unizg.hr>
In-Reply-To: <b4962d0d-7582-42a1-c8aa-5d31d5e28970@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

This soft lockup occurs on amdgpu vanilla torvalds kernel with KCSAN turned on.

The platform is Ubuntu 22.04 LTS.

Please find config and lshw here:

https://domac.alu.unizg.hr/~mtodorov/linux/bugreports/amdgpu/6.5-rc7/

Here is the log excerpt:

[   69.050693] ==================================================================
[   69.198264] watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [systemd-udevd:635]
[   69.198277] Modules linked in: amdgpu(+) snd_hwdep(+) nls_iso8859_1 amdxcp snd_pcm kvm(+) iommu_v2 drm_buddy gpu_sched irqbypass snd_seq_midi crct10dif_pclmul drm_suballoc_helper snd_seq_midi_event polyval_clmulni drm_ttm_helper snd_rawmidi polyval_generic ttm ghash_clmulni_intel sha512_ssse3 drm_display_helper snd_seq aesni_intel cec snd_seq_device snd_timer crypto_simd rc_core cryptd drm_kms_helper joydev input_leds snd rapl ccp wmi_bmof k10temp i2c_algo_bit soundcore sch_fq_codel mac_hid msr parport_pc drm ppdev lp parport ramoops pstore_blk reed_solomon pstore_zone efi_pstore ip_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq libcrc32c hid_generic usbhid hid nvme nvme_core r8169 ahci xhci_pci video crc32_pclmul libahci i2c_piix4 nvme_common realtek xhci_pci_renesas wmi gpio_amdpt
[   69.198669] CPU: 1 PID: 635 Comm: systemd-udevd Not tainted 6.5.0-rc7-kcsan-g706a74159504 #3
[   69.198680] Hardware name: ASRock X670E PG Lightning/X670E PG Lightning, BIOS 1.21 04/26/2023
[   69.198686] RIP: kcsan_setup_watchpoint+0x274/0x3f0
[ 69.198697] Code: 00 00 48 8b 45 c8 48 c7 00 00 00 00 00 f0 48 ff 0d c1 50 d5 0c 45 84 d2 75 10 48 f7 45 c0 00 02 00 00 74 06 fb 0f 1f 44 00 00 <83> 6b 04 01 41 57 9d 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d 31
All code
========
    0:    00 00                    add    %al,(%rax)
    2:    48 8b 45 c8              mov    -0x38(%rbp),%rax
    6:    48 c7 00 00 00 00 00     movq   $0x0,(%rax)
    d:    f0 48 ff 0d c1 50 d5     lock decq 0xcd550c1(%rip)        # 0xcd550d6
   14:    0c
   15:    45 84 d2                 test   %r10b,%r10b
   18:    75 10                    jne    0x2a
   1a:    48 f7 45 c0 00 02 00     testq  $0x200,-0x40(%rbp)
   21:    00
   22:    74 06                    je     0x2a
   24:    fb                       sti
   25:    0f 1f 44 00 00           nopl   0x0(%rax,%rax,1)
   2a:*    83 6b 04 01              subl   $0x1,0x4(%rbx)        <-- trapping instruction
   2e:    41 57                    push   %r15
   30:    9d                       popf
   31:    48 8d 65 d8              lea    -0x28(%rbp),%rsp
   35:    5b                       pop    %rbx
   36:    41 5c                    pop    %r12
   38:    41 5d                    pop    %r13
   3a:    41 5e                    pop    %r14
   3c:    41 5f                    pop    %r15
   3e:    5d                       pop    %rbp
   3f:    31                       .byte 0x31

Code starting with the faulting instruction
===========================================
    0:    83 6b 04 01              subl   $0x1,0x4(%rbx)
    4:    41 57                    push   %r15
    6:    9d                       popf
    7:    48 8d 65 d8              lea    -0x28(%rbp),%rsp
    b:    5b                       pop    %rbx
    c:    41 5c                    pop    %r12
    e:    41 5d                    pop    %r13
   10:    41 5e                    pop    %r14
   12:    41 5f                    pop    %r15
   14:    5d                       pop    %rbp
   15:    31                       .byte 0x31
[   69.198726] RSP: 0018:ffffb4a0411f7638 EFLAGS: 00000206
[   69.198743] RAX: ffffffffb699a748 RBX: ffff9829c57833f0 RCX: 0000000000000000
[   69.198751] RDX: ffffffffc2569f90 RSI: ffffffffc2569f90 RDI: ffffffffb699a748
[   69.198758] RBP: ffffb4a0411f7698 R08: 0000000000000001 R09: 0000000000000000
[   69.198765] R10: 0000000000000000 R11: 0011ffffc26082c8 R12: 0000000000000008
[   69.198783] R13: ffffffffc26082c8 R14: 0000000000000000 R15: 0000000000000292
[   69.198790] FS:  00007f452d2438c0(0000) GS:ffff9838d8240000(0000) knlGS:0000000000000000
[   69.198799] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   69.198807] CR2: 00007f452cea127f CR3: 000000012540a000 CR4: 0000000000750ee0
[   69.198830] PKRU: 55555554
[   69.198835] Call Trace:
[   69.198839]  <IRQ>
[   69.198844] ? show_regs+0x72/0x90
[   69.198856] ? watchdog_timer_fn+0x292/0x320
[   69.198900] ? __pfx_watchdog_timer_fn+0x10/0x10
[   69.198909] ? __hrtimer_run_queues+0x224/0x470
[   69.198926] ? hrtimer_interrupt+0x1cb/0x3f0
[   69.198937] ? __do_softirq+0xda/0x330
[   69.198950] ? __sysvec_apic_timer_interrupt+0x86/0x1e0
[   69.198980] ? sysvec_apic_timer_interrupt+0x8e/0xa0
[   69.198990]  </IRQ>
[   69.198994]  <TASK>
[   69.199000] ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
[   69.199032] ? kcsan_setup_watchpoint+0x274/0x3f0
[   69.199043] ? kcsan_setup_watchpoint+0x1de/0x3f0
[   69.199055] ? find_kallsyms_symbol+0x139/0x340
[   69.199068] __tsan_read8+0x11c/0x180
[   69.199099] find_kallsyms_symbol+0x139/0x340
[   69.199110] ? vcn_v1_0_enc_ring_emit_fence (drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1647 (discriminator 1)) amdgpu
[   69.204958] ? __pfx_vcn_v1_0_enc_ring_emit_fence (drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1646) amdgpu
[   69.210899] ? __pfx_vcn_v1_0_enc_ring_emit_fence (drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1646) amdgpu
[   69.216910] ? __pfx_vcn_v1_0_enc_ring_emit_fence (drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1646) amdgpu
[   69.222561] module_address_lookup+0x8c/0xe0
[   69.222573] ? __pfx_vcn_v1_0_enc_ring_emit_fence (drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1646) amdgpu
[   69.228237] kallsyms_lookup_buildid+0x107/0x1b0
[   69.228251] ? __pfx_vcn_v1_0_enc_ring_emit_fence (drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1646) amdgpu
[   69.234368] kallsyms_lookup+0x14/0x30
[   69.234381] test_for_valid_rec+0x38/0x90
[   69.234411] ? sched_clock_noinstr+0x9/0x10
[   69.234448] ? srso_alias_return_thunk+0x5/0x7f
[   69.234459] ? __mutex_lock_slowpath+0x13/0x20
[   69.234470] ? srso_alias_return_thunk+0x5/0x7f
[   69.234481] ? mutex_lock+0xa7/0xb0
[   69.234492] ftrace_module_enable+0x22e/0x3b0
[   69.234525] load_module+0x3357/0x3980
[   69.234533] ? aa_file_perm+0x1fc/0x800
[   69.234562] ? srso_alias_return_thunk+0x5/0x7f
[   69.234593] ? security_kernel_post_read_file+0x79/0x90
[   69.234618] init_module_from_file+0xdf/0x130
[   69.234642] ? srso_alias_return_thunk+0x5/0x7f
[   69.234653] ? init_module_from_file+0xdf/0x130
[   69.234668] idempotent_init_module+0x241/0x360
[   69.234683] __x64_sys_finit_module+0x8e/0xf0
[   69.234693] do_syscall_64+0x58/0x90
[   69.234705] ? srso_alias_return_thunk+0x5/0x7f
[   69.234716] ? exit_to_user_mode_prepare+0x76/0x230
[   69.234748] ? srso_alias_return_thunk+0x5/0x7f
[   69.234758] ? syscall_exit_to_user_mode+0x29/0x40
[   69.234769] ? srso_alias_return_thunk+0x5/0x7f
[   69.234780] ? do_syscall_64+0x68/0x90
[   69.234803] ? srso_alias_return_thunk+0x5/0x7f
[   69.234830] ? exit_to_user_mode_prepare+0x76/0x230
[   69.234841] ? srso_alias_return_thunk+0x5/0x7f
[   69.234852] ? syscall_exit_to_user_mode+0x29/0x40
[   69.234869] ? srso_alias_return_thunk+0x5/0x7f
[   69.234888] ? do_syscall_64+0x68/0x90
[   69.234897] ? srso_alias_return_thunk+0x5/0x7f
[   69.234922] ? do_syscall_64+0x68/0x90
[   69.234952] entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[   69.234978] RIP: 0033:0x7f452d11ea3d
[ 69.234996] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 a3 0f 00 f7 d8 64 89 01 48
All code
========
    0:    5b                       pop    %rbx
    1:    41 5c                    pop    %r12
    3:    c3                       ret
    4:    66 0f 1f 84 00 00 00     nopw   0x0(%rax,%rax,1)
    b:    00 00
    d:    f3 0f 1e fa              endbr64
   11:    48 89 f8                 mov    %rdi,%rax
   14:    48 89 f7                 mov    %rsi,%rdi
   17:    48 89 d6                 mov    %rdx,%rsi
   1a:    48 89 ca                 mov    %rcx,%rdx
   1d:    4d 89 c2                 mov    %r8,%r10
   20:    4d 89 c8                 mov    %r9,%r8
   23:    4c 8b 4c 24 08           mov    0x8(%rsp),%r9
   28:    0f 05                    syscall
   2a:*    48 3d 01 f0 ff ff        cmp    $0xfffffffffffff001,%rax        <-- trapping instruction
   30:    73 01                    jae    0x33
   32:    c3                       ret
   33:    48 8b 0d c3 a3 0f 00     mov    0xfa3c3(%rip),%rcx        # 0xfa3fd
   3a:    f7 d8                    neg    %eax
   3c:    64 89 01                 mov    %eax,%fs:(%rcx)
   3f:    48                       rex.W

Code starting with the faulting instruction
===========================================
    0:    48 3d 01 f0 ff ff        cmp    $0xfffffffffffff001,%rax
    6:    73 01                    jae    0x9
    8:    c3                       ret
    9:    48 8b 0d c3 a3 0f 00     mov    0xfa3c3(%rip),%rcx        # 0xfa3d3
   10:    f7 d8                    neg    %eax
   12:    64 89 01                 mov    %eax,%fs:(%rcx)
   15:    48                       rex.W
[   69.235005] RSP: 002b:00007ffda20bffe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   69.235020] RAX: ffffffffffffffda RBX: 00005561184c0f30 RCX: 00007f452d11ea3d
[   69.235028] RDX: 0000000000000000 RSI: 000055611837ad80 RDI: 000000000000001a
[   69.235035] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000002
[   69.235052] R10: 000000000000001a R11: 0000000000000246 R12: 000055611837ad80
[   69.235059] R13: 000055611836bc10 R14: 0000000000000000 R15: 00005561184ba330
[   69.235072]  </TASK>
[   69.462372] ==================================================================

Best regards,
Mirsad Todorovac
