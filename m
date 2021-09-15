Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323240C7AD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 16:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A546E950;
	Wed, 15 Sep 2021 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FB96E94F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:46:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D99760E90
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631717193;
 bh=2MRmkc5iIHv8dMceSy/08epkls2mE1p6UN35RzKeyIU=;
 h=From:To:Subject:Date:From;
 b=jGkixnQstsomITdiMV+Zj78Fb+HeCtYbEQKOJf7rHw4BQJIRnxJKzc3cC5BGcmQ3g
 vENB5OXCCV5YNsh/5e/U5pTmIK0X4G2N+tzNwZZl+Jdx1FQ3IlRqI8gGp4MHDzZ3yX
 kf5yoX2U1mUqerwd1IlqMwn3K1KpamEMEkzJEv87Gew4YGGhUGV2gRdZrhI9a27zaI
 8mQ+QtbuSOWjogySExwvg/ut9t0tNzl8akLJjuvLCRWU+h7EBMwfjWMAIJKiQTJUJQ
 HkvO1yHCvsDV5RNzX7BPSxibxHJJYyfBckcfqSOkCxrw2nR0bNxKb8m5x7FACihpfe
 ETBOE3Ss/5nnQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4739761001; Wed, 15 Sep 2021 14:46:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] New: Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Wed, 15 Sep 2021 14:46:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpiazza@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214413-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

            Bug ID: 214413
           Summary: Kernel oops on boot for amdgpu (in
                    si_dpm_set_power_state)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mpiazza@gmail.com
        Regression: No

Created attachment 298817
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298817&action=3Dedit
Dmesg log with kernel oops

Booting from a fresh self-compiled kernel 5.14.4 causes the following kerne=
ll
oops.

[   11.451662] RIP: 0010:si_dpm_set_power_state+0xde3/0x1250 [amdgpu]
[   11.452272] Code: 0f 84 8e f5 ff ff c7 44 24 30 ea ff ff ff 48 c7 c7 38 =
a5
d6 a0 e8 9d 44 ae ff e9 75 f5 ff ff 45 31 c0 49 8b b4 24 10 0e 00 00 <0f
> b7 0e 66 85 c9 0f 84 eb 03 00 00 83 e9 01 48 8d 46 14 48 8d 0c
[   11.452468] RSP: 0018:ffff888106c0baa8 EFLAGS: 00010246
[   11.452530] RAX: ffff8881116a9a00 RBX: 000000000000ffff RCX:
0000000000000000
[   11.452608] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffff8881116c0000
[   11.452686] RBP: ffff8881116c0000 R08: 0000000000000000 R09:
ffff8881116a8e58
[   11.452764] R10: ffff8881116c8400 R11: ffff8881116a99d8 R12:
ffff8881116a8000
[   11.452841] R13: ffff8881116a8000 R14: 0000000000000000 R15:
0000000000000005
[   11.452919] FS:  00007face07fa040(0000) GS:ffff8881a9400000(0000)
knlGS:0000000000000000
[   11.453008] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.453073] CR2: 0000000000000000 CR3: 0000000104e7a000 CR4:
00000000000406f0
[   11.453151] Call Trace:
[   11.453190]  ? _raw_spin_unlock_irqrestore+0x15/0x30
[   11.453256]  ? si_dpm_pre_set_power_state+0x506/0xa50 [amdgpu]
[   11.453818]  amdgpu_pm_compute_clocks.part.0+0x31c/0x5c0 [amdgpu]
[   11.454382]  si_dpm_hw_init+0x72/0x80 [amdgpu]
[   11.454928]  amdgpu_device_init.cold+0xd5a/0x1761 [amdgpu]
[   11.455479]  ? pci_conf1_read+0x9f/0xf0
[   11.455533]  ? pci_bus_read_config_word+0x44/0x70
[   11.455595]  amdgpu_driver_load_kms+0x63/0x2e0 [amdgpu]
[   11.456078]  amdgpu_pci_probe+0xf6/0x180 [amdgpu]
[   11.456554]  local_pci_probe+0x3d/0x70
[   11.456603]  ? pci_match_device+0xd2/0x100
[   11.456655]  pci_device_probe+0xf5/0x1b0
[   11.456706]  really_probe.part.0+0xb3/0x2a0
[   11.456761]  __driver_probe_device+0x8b/0x120
[   11.456816]  driver_probe_device+0x19/0xd0
[   11.456868]  __driver_attach+0xa6/0x170
[   11.456916]  ? __device_attach_driver+0xe0/0xe0
[   11.456972]  bus_for_each_dev+0x73/0xb0
[   11.457022]  bus_add_driver+0x106/0x1b0
[   11.457072]  driver_register+0x86/0xd0
[   11.457120]  ? 0xffffffffa0f33000
[   11.459179]  do_one_initcall+0x48/0x200
[   11.461264]  ? kmem_cache_alloc_trace+0x2c9/0x430
[   11.463394]  do_init_module+0x56/0x240
[   11.465492]  __do_sys_finit_module+0xa0/0xe0
[   11.467586]  do_syscall_64+0x43/0x90
[   11.469658]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   11.471773] RIP: 0033:0x7face0986f49
[   11.473851] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 17 3f 0c 00 f7 d8 64 89 01 48
[   11.478308] RSP: 002b:00007ffe5da504d8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   11.480601] RAX: ffffffffffffffda RBX: 00005599b42ece30 RCX:
00007face0986f49
[   11.482914] RDX: 0000000000000000 RSI: 00005599b42eedb0 RDI:
0000000000000014
[   11.485212] RBP: 00005599b42eedb0 R08: 0000000000000000 R09:
0000000000000000
[   11.487483] R10: 0000000000000014 R11: 0000000000000246 R12:
0000000000000000
[   11.489715] R13: 00005599b42f2a10 R14: 0000000000020000 R15:
0000000000000000
[   11.491855] Modules linked in: ext4 crc32c_generic mbcache jbd2 ath3k bt=
usb
btrtl btbcm btintel bluetooth jitterentropy_rng uvcvideo videobuf2_vmal
loc videobuf2_memops videobuf2_v4l2 sha512_generic videobuf2_common hmac
videodev mc drbg ecdh_generic ecc crc16 toshiba_wmi wmi_bmof sparse_keymap =
am
d_freq_sensitivity ath9k ath9k_common ath9k_hw kvm_amd mac80211 ath kvm
irqbypass sha256_generic snd_hda_codec_idt snd_hda_codec_generic amdgpu(+) =
gha
sh_clmulni_intel ledtrig_audio snd_hda_codec_hdmi deflate cryptd joydev
snd_hda_intel evdev mfd_core snd_intel_dspcfg cfg80211 gpu_sched serio_raw =
efi
_pstore toshiba_bluetooth fam15h_power sg snd_hda_codec snd_hda_core snd_hw=
dep
snd_pcm wmi rfkill libarc4 i2c_algo_bit snd_timer snd drm_ttm_helper tt
m soundcore drm_kms_helper ac battery video acpi_cpufreq button sch_cake lo=
op
msr parport_pc ppdev lp parport drm fuse configfs sunrpc efivarfs ip_tab
les x_tables autofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov
async_memcpy async_pq
[   11.492046]  async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 linear
md_mod hid_generic usbhid hid sd_mod t10_pi uas usb_storage ohci_pci crc3
2c_intel xhci_pci psmouse i2c_piix4 ahci ohci_hcd libahci ehci_pci xhci_hcd
ehci_hcd i2c_core libata usbcore scsi_mod alx usb_common mdio fan thermal
[   11.512445] CR2: 0000000000000000
[   11.515877] ---[ end trace 9d0f57da9351a59c ]---
[   11.524001] ------------[ cut here ]------------



This is my hardware:
marco@albireo:~$ lspci=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Root Complex
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Kabini [Radeon HD 8330]
00:01.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Kabini HDMI/DP
Audio
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 0
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Functions 5:1
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Functions 5:1
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Functions 5:1
00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI
Controller (rev 01)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Contro=
ller
[AHCI mode]
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 39)
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 39)
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 39)
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 39)
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 3a)
00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD] FCH Azalia Control=
ler
(rev 02)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
11)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 16h Processor
Function 5
01:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Sun PRO
[Radeon HD 8570A/8570M]
02:00.0 Network controller: Qualcomm Atheros QCA9565 / AR9565 Wireless Netw=
ork
Adapter (rev 01)
03:00.0 Ethernet controller: Qualcomm Atheros QCA8172 Fast Ethernet (rev 10)


Attached the full dmesg log

Marco

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
