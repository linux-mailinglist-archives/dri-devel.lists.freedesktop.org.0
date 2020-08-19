Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CCC249514
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E0989950;
	Wed, 19 Aug 2020 06:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9314689950
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:37:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Wed, 19 Aug 2020 06:37:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: krakopo@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206987-2300-HESQDNNbDw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=206987

krakopo@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krakopo@protonmail.com

--- Comment #33 from krakopo@protonmail.com ---
I'm seeing this on an AMD Ryzen 4500U laptop running 5.8.1 (Arch Linux
5.8.1-arch1-1). I can repro fairly consistently when running a 64-bit KVM
virtual machine.

The kernel I'm running has the commit which should resolve this:
7ad816762f9b ("x86/fpu: Reset MXCSR to default in kernel_fpu_begin()")

Confirmed patch is in my kernel:
https://git.archlinux.org/linux.git/tree/arch/x86/kernel/fpu/core.c?h=v5.8.1-arch1#n106

Here is what I see in dmesg:

Aug 18 20:25:49 archpad kernel: simd exception: 0000 [#1] PREEMPT SMP NOPTI
Aug 18 20:25:49 archpad kernel: CPU: 0 PID: 509 Comm: Xorg Not tainted
5.8.1-arch1-1 #1
Aug 18 20:25:49 archpad kernel: Hardware name: LENOVO 81W4/LNVNB161216, BIOS
DZCN19WW 04/13/2020
Aug 18 20:25:49 archpad kernel: RIP: 0010:dcn_bw_ceil2+0x35/0x60 [amdgpu]
Aug 18 20:25:49 archpad kernel: Code: cd 7b 3e 0f 28 d0 66 0f ef db 66 0f ef e4
f3 0f 5e d1 f3 0f 5a e0 f3 0f 2c c2 66 0f ef d2 f3 0f 2a d0 f3 0f 59 d1 f3 0f
5a da <f2> 0f 58 1d 5b 19 2e 00 66 0f 2f dc 72 01 c3 f3 0f 58 ca 0f 28 c1
Aug 18 20:25:49 archpad kernel: RSP: 0018:ffffb8fac07035f8 EFLAGS: 00010202
Aug 18 20:25:49 archpad kernel: RAX: 0000000000000004 RBX: 0000000000000000
RCX: 0000000000000780
Aug 18 20:25:49 archpad kernel: RDX: ffff97ebd0a63080 RSI: ffff97ebd0a69560
RDI: 0000000044444440
Aug 18 20:25:49 archpad kernel: RBP: ffff97ebd0a631c0 R08: ffff97ebd0a633b4
R09: 0000000000000000
Aug 18 20:25:49 archpad kernel: R10: 0000000000000000 R11: 0000000000000000
R12: ffff97ebd0a63360
Aug 18 20:25:49 archpad kernel: R13: 0000000000000001 R14: ffff97ebd0a62188
R15: ffff97ebd0a62028
Aug 18 20:25:49 archpad kernel: FS:  00007f8787a65940(0000)
GS:ffff97ec47400000(0000) knlGS:0000000000000000
Aug 18 20:25:49 archpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 18 20:25:49 archpad kernel: CR2: 0000000800880000 CR3: 00000001f9040000
CR4: 0000000000340ef0
Aug 18 20:25:49 archpad kernel: Call Trace:
Aug 18 20:25:49 archpad kernel: 
dml21_ModeSupportAndSystemConfigurationFull+0x437/0x5cf0 [amdgpu]
Aug 18 20:25:49 archpad kernel:  ? sysvec_apic_timer_interrupt+0x46/0xe0
Aug 18 20:25:49 archpad kernel:  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
Aug 18 20:25:49 archpad kernel:  ? sched_clock+0x5/0x10
Aug 18 20:25:49 archpad kernel:  ? sched_clock_local+0x12/0x80
Aug 18 20:25:49 archpad kernel:  ? amdgpu_sa_bo_new+0xbc/0x550 [amdgpu]
Aug 18 20:25:49 archpad kernel:  ? sched_clock_cpu+0xae/0xd0
Aug 18 20:25:49 archpad kernel:  ? kmem_cache_alloc_trace+0x17c/0x220
Aug 18 20:25:49 archpad kernel:  ? amdgpu_sa_bo_new+0xbc/0x550 [amdgpu]
Aug 18 20:25:49 archpad kernel:  ? _raw_spin_unlock+0x16/0x30
Aug 18 20:25:49 archpad kernel:  ? preempt_count_add+0x49/0xa0
Aug 18 20:25:49 archpad kernel:  ? kernel_init_free_pages+0x6d/0x90
Aug 18 20:25:49 archpad kernel:  ? prep_new_page+0xa2/0xb0
Aug 18 20:25:49 archpad kernel:  ? get_page_from_freelist+0xfa8/0x1220
Aug 18 20:25:49 archpad kernel:  ? __mod_zone_page_state+0x66/0xa0
Aug 18 20:25:49 archpad kernel:  ? hubbub2_get_dcc_compression_cap+0xa8/0x270
[amdgpu]
Aug 18 20:25:49 archpad kernel:  ? fill_plane_buffer_attributes+0x26f/0x420
[amdgpu]
Aug 18 20:25:49 archpad kernel:  dml_get_voltage_level+0x116/0x1e0 [amdgpu]
Aug 18 20:25:49 archpad kernel:  dcn20_fast_validate_bw+0x359/0x680 [amdgpu]
Aug 18 20:25:49 archpad kernel:  ? resource_build_scaling_params+0xc44/0x11a0
[amdgpu]
Aug 18 20:25:49 archpad kernel:  dcn21_validate_bandwidth+0xcd/0x2a0 [amdgpu]
Aug 18 20:25:49 archpad kernel:  dc_validate_global_state+0x2f2/0x390 [amdgpu]
Aug 18 20:25:49 archpad kernel:  amdgpu_dm_atomic_check+0xefb/0x1010 [amdgpu]
Aug 18 20:25:49 archpad kernel:  drm_atomic_check_only+0x57c/0x7f0 [drm]
Aug 18 20:25:49 archpad kernel:  ?
__drm_atomic_helper_crtc_duplicate_state+0x85/0xd0 [drm_kms_helper]
Aug 18 20:25:49 archpad kernel:  drm_atomic_commit+0x13/0x50 [drm]
Aug 18 20:25:49 archpad kernel:  drm_atomic_helper_legacy_gamma_set+0x123/0x180
[drm_kms_helper]
Aug 18 20:25:49 archpad kernel:  drm_mode_gamma_set_ioctl+0x19a/0x230 [drm]
Aug 18 20:25:49 archpad kernel:  ? drm_color_lut_check+0xa0/0xa0 [drm]
Aug 18 20:25:49 archpad kernel:  drm_ioctl_kernel+0xb2/0x100 [drm]
Aug 18 20:25:49 archpad kernel:  drm_ioctl+0x208/0x360 [drm]
Aug 18 20:25:49 archpad kernel:  ? drm_color_lut_check+0xa0/0xa0 [drm]
Aug 18 20:25:49 archpad kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Aug 18 20:25:49 archpad kernel:  ksys_ioctl+0x82/0xc0
Aug 18 20:25:49 archpad kernel:  __x64_sys_ioctl+0x16/0x20
Aug 18 20:25:49 archpad kernel:  do_syscall_64+0x44/0x70
Aug 18 20:25:49 archpad kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Aug 18 20:25:49 archpad kernel: RIP: 0033:0x7f87887888eb
Aug 18 20:25:49 archpad kernel: Code: 0f 1e fa 48 8b 05 a5 95 0c 00 64 c7 00 26
00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 95 0c 00 f7 d8 64 89 01 48
Aug 18 20:25:49 archpad kernel: RSP: 002b:00007ffc92f3a9a8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Aug 18 20:25:49 archpad kernel: RAX: ffffffffffffffda RBX: 00007ffc92f3a9e0
RCX: 00007f87887888eb
Aug 18 20:25:49 archpad kernel: RDX: 00007ffc92f3a9e0 RSI: 00000000c02064a5
RDI: 000000000000000a
Aug 18 20:25:49 archpad kernel: RBP: 00000000c02064a5 R08: 00005627eb36eb10
R09: 00005627eb36ed10
Aug 18 20:25:49 archpad kernel: R10: 00005627eb36e910 R11: 0000000000000246
R12: 0000000000000100
Aug 18 20:25:49 archpad kernel: R13: 000000000000000a R14: 0000000000000100
R15: 0000000000000100
Aug 18 20:25:49 archpad kernel: Modules linked in: xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat
iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c tun bridge hid_multitouch hid_generic 8021q garp mrp stp llc
ebtable_filter ebtables snd_acp3x_rn snd_soc_dmic snd_acp3x_pdm_dma snd_soc_c>
Aug 18 20:25:49 archpad kernel:  drm_kms_helper btintel snd_hwdep i2c_hid hid
videobuf2_common cec nls_iso8859_1 snd_pcm rc_core nls_cp437 bluetooth cfg80211
snd_timer syscopyarea videodev ideapad_laptop snd_rn_pci_acp3x sysfillrect vfat
ecdh_generic snd sysimgblt tpm_crb snd_pci_acp3x sparse_keymap fat ecc mc
fb_sys_fops tpm_tis soundcore ccp rfkill libarc4 wmi battery tpm_tis>
Aug 18 20:25:49 archpad kernel: ---[ end trace 76f111d732bc1b57 ]---
Aug 18 20:25:49 archpad kernel: RIP: 0010:dcn_bw_ceil2+0x35/0x60 [amdgpu]
Aug 18 20:25:49 archpad kernel: Code: cd 7b 3e 0f 28 d0 66 0f ef db 66 0f ef e4
f3 0f 5e d1 f3 0f 5a e0 f3 0f 2c c2 66 0f ef d2 f3 0f 2a d0 f3 0f 59 d1 f3 0f
5a da <f2> 0f 58 1d 5b 19 2e 00 66 0f 2f dc 72 01 c3 f3 0f 58 ca 0f 28 c1
Aug 18 20:25:49 archpad kernel: RSP: 0018:ffffb8fac07035f8 EFLAGS: 00010202
Aug 18 20:25:49 archpad kernel: RAX: 0000000000000004 RBX: 0000000000000000
RCX: 0000000000000780
Aug 18 20:25:49 archpad kernel: RDX: ffff97ebd0a63080 RSI: ffff97ebd0a69560
RDI: 0000000044444440
Aug 18 20:25:49 archpad kernel: RBP: ffff97ebd0a631c0 R08: ffff97ebd0a633b4
R09: 0000000000000000
Aug 18 20:25:49 archpad kernel: R10: 0000000000000000 R11: 0000000000000000
R12: ffff97ebd0a63360
Aug 18 20:25:49 archpad kernel: R13: 0000000000000001 R14: ffff97ebd0a62188
R15: ffff97ebd0a62028
Aug 18 20:25:49 archpad kernel: FS:  00007f8787a65940(0000)
GS:ffff97ec47400000(0000) knlGS:0000000000000000
Aug 18 20:25:49 archpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 18 20:25:49 archpad kernel: CR2: 0000000800880000 CR3: 00000001f9040000
CR4: 0000000000340ef0

$ objdump -d amdgpu.ko
...
00000000001b83c0 <dcn_bw_ceil2>:
  1b83c0:       e8 00 00 00 00          callq  1b83c5 <dcn_bw_ceil2+0x5>
  1b83c5:       66 0f ef ed             pxor   %xmm5,%xmm5
  1b83c9:       0f 2e cd                ucomiss %xmm5,%xmm1
  1b83cc:       7b 3e                   jnp    1b840c <dcn_bw_ceil2+0x4c>
  1b83ce:       0f 28 d0                movaps %xmm0,%xmm2
  1b83d1:       66 0f ef db             pxor   %xmm3,%xmm3
  1b83d5:       66 0f ef e4             pxor   %xmm4,%xmm4
  1b83d9:       f3 0f 5e d1             divss  %xmm1,%xmm2
  1b83dd:       f3 0f 5a e0             cvtss2sd %xmm0,%xmm4
  1b83e1:       f3 0f 2c c2             cvttss2si %xmm2,%eax
  1b83e5:       66 0f ef d2             pxor   %xmm2,%xmm2
  1b83e9:       f3 0f 2a d0             cvtsi2ss %eax,%xmm2
  1b83ed:       f3 0f 59 d1             mulss  %xmm1,%xmm2
  1b83f1:       f3 0f 5a da             cvtss2sd %xmm2,%xmm3
  1b83f5:       f2 0f 58 1d 00 00 00    addsd  0x0(%rip),%xmm3        # 1b83fd
<dcn_bw_ceil2+0x3d>
  1b83fc:       00 
  1b83fd:       66 0f 2f dc             comisd %xmm4,%xmm3
  1b8401:       72 01                   jb     1b8404 <dcn_bw_ceil2+0x44>
  1b8403:       c3                      retq   
  1b8404:       f3 0f 58 ca             addss  %xmm2,%xmm1
  1b8408:       0f 28 c1                movaps %xmm1,%xmm0
  1b840b:       c3                      retq   
  1b840c:       75 c0                   jne    1b83ce <dcn_bw_ceil2+0xe>
  1b840e:       66 0f ef c0             pxor   %xmm0,%xmm0
  1b8412:       c3                      retq   
  1b8413:       66 66 2e 0f 1f 84 00    data16 nopw %cs:0x0(%rax,%rax,1)
  1b841a:       00 00 00 00 
  1b841e:       66 90                   xchg   %ax,%ax
...

Instruction at RIP: 0010:dcn_bw_ceil2+0x35:

>>> hex(0x00000000001b83c0 + 0x35)
'0x1b83f5'

  1b83f5:       f2 0f 58 1d 00 00 00    addsd  0x0(%rip),%xmm3        # 1b83fd
<dcn_bw_ceil2+0x3d>

Same addsd instruction that was mentioned above.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
