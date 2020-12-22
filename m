Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F412E0659
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 08:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ABB89E1B;
	Tue, 22 Dec 2020 07:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530F989E1B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 07:06:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 266952312D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 07:06:07 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 1A83381FE6; Tue, 22 Dec 2020 07:06:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210841] New: divide error in Calculate256BBlockSizes
Date: Tue, 22 Dec 2020 07:06:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nshepperd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210841-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210841

            Bug ID: 210841
           Summary: divide error in Calculate256BBlockSizes
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.14
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: nshepperd@gmail.com
        Regression: No

Created attachment 294287
  --> https://bugzilla.kernel.org/attachment.cgi?id=294287&action=edit
Full kernel log from journalctl -b-1 -k

display crashed with this error message: 

    divide error: 0000 [#1] PREEMPT SMP NOPTI

This looks superficially similar to
https://bugzilla.kernel.org/show_bug.cgi?id=206987 or
https://bugzilla.kernel.org/show_bug.cgi?id=207979; but my kernel version has
the patch that should prevent this, and the crash also seems to be in a
different place.

   RIP: 0010:Calculate256BBlockSizes+0x74/0x100 [amdgpu]

objdump -d amdgpu.ko

00000000002423d0 <Calculate256BBlockSizes>:
  2423d0:       e8 00 00 00 00          callq  2423d5
<Calculate256BBlockSizes+0x5>
  2423d5:       89 f0                   mov    %esi,%eax
  2423d7:       4c 8b 5c 24 10          mov    0x10(%rsp),%r11
  2423dc:       89 d6                   mov    %edx,%esi
  2423de:       41 89 ca                mov    %ecx,%r10d
  2423e1:       83 ff 02                cmp    $0x2,%edi
  2423e4:       76 47                   jbe    24242d
<Calculate256BBlockSizes+0x5d>
  2423e6:       83 ff 08                cmp    $0x8,%edi
  2423e9:       74 42                   je     24242d
<Calculate256BBlockSizes+0x5d>
  2423eb:       85 c0                   test   %eax,%eax
  2423ed:       0f 85 8a 00 00 00       jne    24247d
<Calculate256BBlockSizes+0xad>
  2423f3:       41 c7 00 01 00 00 00    movl   $0x1,(%r8)
  2423fa:       41 c7 01 01 00 00 00    movl   $0x1,(%r9)
  242401:       b9 00 01 00 00          mov    $0x100,%ecx
  242406:       31 d2                   xor    %edx,%edx
  242408:       89 c8                   mov    %ecx,%eax
  24240a:       f7 f6                   div    %esi
  24240c:       31 d2                   xor    %edx,%edx
  24240e:       41 f7 30                divl   (%r8)
  242411:       48 8b 54 24 08          mov    0x8(%rsp),%rdx
  242416:       89 02                   mov    %eax,(%rdx)
  242418:       89 c8                   mov    %ecx,%eax
  24241a:       31 d2                   xor    %edx,%edx
  24241c:       41 f7 f2                div    %r10d
  24241f:       31 d2                   xor    %edx,%edx
  242421:       41 f7 31                divl   (%r9)
  242424:       41 89 03                mov    %eax,(%r11)
  242427:       b8 01 00 00 00          mov    $0x1,%eax
  24242c:       c3                      retq
  24242d:       85 c0                   test   %eax,%eax
  24242f:       75 34                   jne    242465
<Calculate256BBlockSizes+0x95>
  242431:       41 c7 00 01 00 00 00    movl   $0x1,(%r8)
  242438:       b9 01 00 00 00          mov    $0x1,%ecx
  24243d:       31 d2                   xor    %edx,%edx
  24243f:       b8 00 01 00 00          mov    $0x100,%eax
    242444:       f7 f6                   div    %esi            <--
[Calculate256BBlockSizes+0x74]
  242446:       48 8b 74 24 08          mov    0x8(%rsp),%rsi
  24244b:       31 d2                   xor    %edx,%edx
  24244d:       f7 f1                   div    %ecx

So the crash is a div instruction. I think corresponding to either the 256 /
BytePerPixelY or 256 / BytePerPixelC in Calculate256BBlockSizes. So it seems
that one of those is being passed in as 0 from
dml21_ModeSupportAndSystemConfigurationFull?

-- 

[Dec22 16:25] divide error: 0000 [#1] PREEMPT SMP NOPTI
[  +0.000008] CPU: 9 PID: 842 Comm: Xorg Tainted: G        W        
5.9.14-arch1-1 #1
[  +0.000003] Hardware name: LENOVO 20UHCTO1WW/20UHCTO1WW, BIOS R1CET56W(1.25 )
09/15/2020
[  +0.000182] RIP: 0010:Calculate256BBlockSizes+0x74/0x100 [amdgpu]
[  +0.000006] Code: 31 d2 41 f7 f2 31 d2 41 f7 31 41 89 03 b8 01 00 00 00 c3 85
c0 75 34 41 c7 00 01 00 00 00 b9 01 00 00 00 31 d2 b8 00 01 00 00 <f7> f6 48 8b
74 24 08 31 d2 f7 f1 89 06 b8 01 00 00 00 41 c7 01 00
[  +0.000003] RSP: 0018:ffffa9d3c195b650 EFLAGS: 00010246
[  +0.000003] RAX: 0000000000000100 RBX: ffff8ea85cba31c8 RCX: 0000000000000008
[  +0.000002] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
[  +0.000002] RBP: 0000000000000000 R08: ffff8ea85cba9914 R09: ffff8ea85cba9954
[  +0.000001] R10: 0000000000000000 R11: ffff8ea85cba9974 R12: ffff8ea85cba9914
[  +0.000002] R13: 0000000000000000 R14: ffff8ea85cba2830 R15: ffff8ea85cba2090
[  +0.000003] FS:  00007f4289f3a2c0(0000) GS:ffff8eab3fa40000(0000)
knlGS:0000000000000000
[  +0.000002] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000002] CR2: 00007f80bc2da000 CR3: 00000003ea4fc000 CR4: 0000000000350ee0
[  +0.000002] Call Trace:
[  +0.000100]  dml21_ModeSupportAndSystemConfigurationFull+0x1109/0x5d10
[amdgpu]
[  +0.000005]  ? sugov_fast_switch+0x5b/0xe0
[  +0.000002]  ? update_load_avg+0x62d/0x660
[  +0.000001]  ? update_curr+0x73/0x1f0
[  +0.000002]  ? dequeue_entity+0xa4/0x440
[  +0.000001]  ? newidle_balance+0xec/0x400
[  +0.000001]  ? preempt_count_add+0x49/0xa0
[  +0.000003]  ? kernel_init_free_pages+0x6d/0x90
[  +0.000001]  ? prep_new_page+0xa2/0xb0
[  +0.000001]  ? get_page_from_freelist+0x11e0/0x12d0
[  +0.000002]  ? __mod_zone_page_state+0x66/0xa0
[  +0.000002]  ? __free_one_page+0x58/0x3d0
[  +0.000001]  ? __mod_zone_page_state+0x66/0xa0
[  +0.000000]  ? preempt_count_add+0x49/0xa0
[  +0.000002]  ? kernel_init_free_pages+0x6d/0x90
[  +0.000001]  ? prep_new_page+0xa2/0xb0
[  +0.000001]  ? get_page_from_freelist+0x11e0/0x12d0
[  +0.000058]  dml_get_voltage_level+0x138/0x1d0 [amdgpu]
[  +0.000062]  dcn20_fast_validate_bw+0x359/0x670 [amdgpu]
[  +0.000057]  ? dcn21_validate_bandwidth+0x95/0x2b0 [amdgpu]
[  +0.000056]  dcn21_validate_bandwidth+0xd3/0x2b0 [amdgpu]
[  +0.000055]  dc_validate_global_state+0x2f2/0x390 [amdgpu]
[  +0.000060]  amdgpu_dm_atomic_check+0xf05/0x1080 [amdgpu]
[  +0.000016]  drm_atomic_check_only+0x57c/0x7f0 [drm]
[  +0.000011]  ? drm_mode_object_put.part.0+0x1f/0x50 [drm]
[  +0.000009]  ? drm_atomic_set_property+0x8e/0xae0 [drm]
[  +0.000009]  drm_atomic_commit+0x13/0x50 [drm]
[  +0.000009]  drm_mode_obj_set_property_ioctl+0x156/0x3d0 [drm]
[  +0.000009]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[  +0.000008]  drm_ioctl_kernel+0xb2/0x100 [drm]
[  +0.000009]  drm_ioctl+0x215/0x390 [drm]
[  +0.000009]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[  +0.000043]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[  +0.000004]  __x64_sys_ioctl+0x83/0xb0
[  +0.000003]  do_syscall_64+0x33/0x40
[  +0.000002]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  +0.000002] RIP: 0033:0x7f428a901f6b
[  +0.000001] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff ff ff 85
c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0
ff ff 73 01 c3 48 8b 0d d5 ae 0c 00 f7 d8 64 89 01 48
[  +0.000001] RSP: 002b:00007ffd2caa5758 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  +0.000001] RAX: ffffffffffffffda RBX: 00007ffd2caa5790 RCX: 00007f428a901f6b
[  +0.000000] RDX: 00007ffd2caa5790 RSI: 00000000c01864ba RDI: 000000000000000d
[  +0.000001] RBP: 00000000c01864ba R08: 000000000000006a R09: 00000000cccccccc
[  +0.000001] R10: 0000000000000fff R11: 0000000000000246 R12: 00005611da332f60
[  +0.000000] R13: 000000000000000d R14: 0000000000000000 R15: 0000000000000003
[  +0.000002] Modules linked in: iptable_mangle iptable_raw xt_connmark
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xt_mark ip6table_mangle xt_comment
xt_addrtype ip6table_raw ip6_tables wireguard curve25519_x86_64
libchacha20poly1305 chacha_x86_64 poly1305_x86_64 libblake2s blake2s_x86_64
ip6_udp_tunnel udp_tunnel libcurve25519_generic libchacha libblake2s_generic
uas usb_storage uinput rfcomm 8021q garp mrp stp llc joydev mousedev
snd_soc_dmic snd_acp3x_pdm_dma snd_acp3x_rn ccm bnep snd_soc_core algif_aead
snd_compress des_generic tps6598x ac97_bus libdes snd_pcm_dmaengine roles
wmi_bmof ecb algif_skcipher amdgpu snd_hda_codec_realtek iwlmvm cmac
snd_hda_codec_generic md4 algif_hash edac_mce_amd snd_hda_codec_hdmi af_alg
kvm_amd snd_hda_intel snd_intel_dspcfg kvm mac80211 snd_hda_codec btusb
irqbypass btrtl rapl libarc4 uvcvideo btbcm snd_hda_core btintel gpu_sched
snd_hwdep i2c_algo_bit pcspkr videobuf2_vmalloc thinkpad_acpi ttm
videobuf2_memops psmouse input_leds iwlwifi snd_pcm
[  +0.000027]  videobuf2_v4l2 ext4 bluetooth drm_kms_helper nvram
videobuf2_common k10temp r8169 cec snd_timer ecdh_generic mbcache ledtrig_audio
sp5100_tco ecc realtek jbd2 i2c_piix4 tpm_crb crc16 rc_core cfg80211 videodev
snd_rn_pci_acp3x mdio_devres snd syscopyarea sysfillrect of_mdio sysimgblt
snd_pci_acp3x fb_sys_fops soundcore ucsi_acpi fixed_phy mc tpm_tis ipmi_devintf
libphy rfkill ac battery ipmi_msghandler typec_ucsi i2c_scmi evdev mac_hid
i2c_multi_instantiate typec tpm_tis_core wmi acpi_cpufreq pinctrl_amd drm
pkcs8_key_parser crypto_user fuse agpgart ip_tables x_tables dm_crypt cbc
encrypted_keys dm_mod trusted tpm rtsx_pci_sdmmc serio_raw mmc_core atkbd
libps2 crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel
crypto_simd cryptd glue_helper ccp xhci_pci xhci_pci_renesas rng_core xhci_hcd
ehci_pci rtsx_pci ehci_hcd i8042 serio btrfs blake2b_generic libcrc32c
crc32c_generic crc32c_intel xor raid6_pq
[  +0.000050] ---[ end trace a3da0200bd831ed5 ]---
[  +0.000058] RIP: 0010:Calculate256BBlockSizes+0x74/0x100 [amdgpu]
[  +0.000027] Code: 31 d2 41 f7 f2 31 d2 41 f7 31 41 89 03 b8 01 00 00 00 c3 85
c0 75 34 41 c7 00 01 00 00 00 b9 01 00 00 00 31 d2 b8 00 01 00 00 <f7> f6 48 8b
74 24 08 31 d2 f7 f1 89 06 b8 01 00 00 00 41 c7 01 00
[  +0.000000] RSP: 0018:ffffa9d3c195b650 EFLAGS: 00010246
[  +0.000001] RAX: 0000000000000100 RBX: ffff8ea85cba31c8 RCX: 0000000000000008
[  +0.000001] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
[  +0.000000] RBP: 0000000000000000 R08: ffff8ea85cba9914 R09: ffff8ea85cba9954
[  +0.000001] R10: 0000000000000000 R11: ffff8ea85cba9974 R12: ffff8ea85cba9914
[  +0.000001] R13: 0000000000000000 R14: ffff8ea85cba2830 R15: ffff8ea85cba2090
[  +0.000001] FS:  00007f4289f3a2c0(0000) GS:ffff8eab3fa40000(0000)
knlGS:0000000000000000
[  +0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000001] CR2: 00007f80bc2da000 CR3: 00000003ea4fc000 CR4: 0000000000350ee0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
