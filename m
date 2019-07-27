Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A230077AF8
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 20:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738D86EECC;
	Sat, 27 Jul 2019 18:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BB176EECC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 18:12:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 01C4072167; Sat, 27 Jul 2019 18:12:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111234] amdgpu bug: kernel NULL pointer dereference during
 video playback
Date: Sat, 27 Jul 2019 18:12:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mjevans1983@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111234-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1033626270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1033626270==
Content-Type: multipart/alternative; boundary="15642511760.eCeeBbd.22053"
Content-Transfer-Encoding: 7bit


--15642511760.eCeeBbd.22053
Date: Sat, 27 Jul 2019 18:12:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111234

            Bug ID: 111234
           Summary: amdgpu bug: kernel NULL pointer dereference during
                    video playback
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mjevans1983@gmail.com

Over the past month I've experienced frequent (more than once per week) vid=
eo
output freezes while watching hardware accelerated video output from Twitch
(they transcoded, played in mpv with profile=3Dgpu-hq).

For three of these I collected dmesg outputs by logging in from a different=
 PC.
 I also observed that the numlock key was unresponsive, but I suspect that
might just be because the video driver issue caused KDE Plasma to either cr=
ash
or lock up waiting on the kernel.

It's slightly interesting that over two kernel versions and the three trace=
s I
did collect that the null pointer is to the same address.

[    4.615743] [drm] initializing kernel modesetting (TONGA 0x1002:0x6939
0x148C:0x2349 0x00).
[    4.615754] [drm] register mmio base: 0xF7E00000
[    4.615755] [drm] register mmio size: 262144
[    4.616024] ATOM BIOS: 113-C7660101_106
[    5.072492] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:01:00.0 on
minor 0



[ 4953.465909] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b4
[ 4953.465918] #PF: supervisor read access in kernel mode
[ 4953.465922] #PF: error_code(0x0000) - not-present page
[ 4953.465925] PGD 0 P4D 0=20
[ 4953.465932] Oops: 0000 [#1] PREEMPT SMP PTI
[ 4953.465939] CPU: 5 PID: 14373 Comm: kworker/u16:4 Tainted: G        W  O=
E=20=20=20
 5.2.1-arch1-1-ARCH #1
[ 4953.465967] Workqueue: events_unbound commit_work [drm_kms_helper]
[ 4953.466127] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[ 4953.466133] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 ae 7e f6 b8 01 00 =
00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 <8b> 8=
3 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01 0
0 00
[ 4953.466137] RSP: 0018:ffffaed60f84faf0 EFLAGS: 00210202
[ 4953.466142] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[ 4953.466145] RDX: ffffffffc149a710 RSI: 0000000000000000 RDI:
ffff8aa32a5d9000
[ 4953.466148] RBP: ffff8a9d80030000 R08: ffff8a9d80030000 R09:
0000000000000000
[ 4953.466152] R10: ffff8a9d80030000 R11: ffff8aa33eb692a4 R12:
0000000000000001
[ 4953.466155] R13: ffffaed60f84fd58 R14: ffff8aa32140cff0 R15:
0000000000000000
[ 4953.466159] FS:  0000000000000000(0000) GS:ffff8aa33eb40000(0000)
knlGS:0000000000000000
[ 4953.466163] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4953.466166] CR2: 00000000000002b4 CR3: 00000007b5212002 CR4:
00000000001606e0
[ 4953.466170] Call Trace:
[ 4953.466332]  dc_commit_state+0xa1/0x5a0 [amdgpu]
[ 4953.466446]  ? amdgpu_bo_unpin+0xce/0xe0 [amdgpu]
[ 4953.466491]  ? drm_calc_timestamping_constants+0xe0/0x140 [drm]
[ 4953.466675]  amdgpu_dm_atomic_commit_tail+0xc64/0x1a20 [amdgpu]
[ 4953.466689]  ? __switch_to_asm+0x40/0x70
[ 4953.466694]  ? __switch_to_asm+0x34/0x70
[ 4953.466699]  ? __switch_to_asm+0x40/0x70
[ 4953.466704]  ? __switch_to_asm+0x40/0x70
[ 4953.466709]  ? __switch_to_asm+0x40/0x70
[ 4953.466713]  ? __switch_to_asm+0x40/0x70
[ 4953.466718]  ? __switch_to_asm+0x34/0x70
[ 4953.466723]  ? __switch_to_asm+0x40/0x70
[ 4953.466728]  ? __switch_to_asm+0x40/0x70
[ 4953.466737]  ? __switch_to_xtra+0x1b6/0x610
[ 4953.466742]  ? __switch_to_asm+0x34/0x70
[ 4953.466747]  ? __switch_to_asm+0x40/0x70
[ 4953.466751]  ? __switch_to_asm+0x34/0x70
[ 4953.466780]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4953.466798]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4953.466806]  process_one_work+0x1d1/0x3e0
[ 4953.466812]  worker_thread+0x4a/0x3d0
[ 4953.466821]  kthread+0xfd/0x130
[ 4953.466826]  ? process_one_work+0x3e0/0x3e0
[ 4953.466832]  ? kthread_park+0x90/0x90
[ 4953.466838]  ret_from_fork+0x35/0x40
[ 4953.466845] Modules linked in: arc4 md4 cfg80211 8021q garp mrp bridge s=
tp
llc nct6775 hwmon_vid ext4 crc16 mbcache jbd2 intel_rapl amdgpu
x86_pkg_temp_thermal intel_powerclamp coretemp input_leds joydev kvm_intel
mousedev hid_steam kvm irqbypass amd_iommu_v2 gpu_sched ttm ofpart
crct10dif_pclmul cmdlinepart crc32_pclmul drm_kms_helper intel_spi_platform
snd_hda_codec_realtek ghash_clmulni_intel intel_spi snd_hda_codec_generic
eeepc_wmi snd_hda_codec_hdmi ledtrig_audio drm spi_nor asus_wmi sparse_keym=
ap
iTCO_wdt hid_generic mei_hdcp mtd snd_hda_intel ppdev iTCO_vendor_support
rfkill aesni_intel snd_usb_audio wmi_bmof mxm_wmi snd_hda_codec snd_virtuoso
aes_x86_64 agpgart igb crypto_simd snd_oxygen_lib mei_me syscopyarea
snd_mpu401_uart snd_usbmidi_lib sysfillrect snd_hda_core cryptd glue_helper
sysimgblt media intel_cstate i2c_algo_bit usbhid snd_rawmidi snd_hwdep
parport_pc intel_uncore pcspkr i2c_i801 mei lpc_ich dca fb_sys_fops
ie31200_edac hid intel_rapl_perf snd_pcm parport evdev wmi
[ 4953.466916]  pcc_cpufreq mac_hid sch_fq tcp_htcp snd_seq_dummy snd_seq_o=
ss
snd_seq_midi_event snd_seq snd_seq_device snd_timer snd soundcore cuse nfsd
auth_rpcgss nfsv4 nfsv3 nfs_acl nfsv2 nfs lockd grace sunrpc nls_utf8 cifs =
ccm
dns_resolver fscache loop fuse sg crypto_user vfs_monitor(OE) ip_tables
x_tables dm_mod btrfs libcrc32c crc32c_generic xor raid6_pq raid1 md_mod sd=
_mod
ahci libahci libata xhci_pci scsi_mod crc32c_intel ehci_pci firewire_ohci
xhci_hcd ehci_hcd firewire_core crc_itu_t
[ 4953.466966] CR2: 00000000000002b4
[ 4953.466972] ---[ end trace 24c4d6a2e775c61e ]---
[ 4953.467120] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[ 4953.467126] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 ae 7e f6 b8 01 00 =
00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 <8b> 8=
3 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01 00 00
[ 4953.467130] RSP: 0018:ffffaed60f84faf0 EFLAGS: 00210202
[ 4953.467134] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[ 4953.467137] RDX: ffffffffc149a710 RSI: 0000000000000000 RDI:
ffff8aa32a5d9000
[ 4953.467141] RBP: ffff8a9d80030000 R08: ffff8a9d80030000 R09:
0000000000000000
[ 4953.467144] R10: ffff8a9d80030000 R11: ffff8aa33eb692a4 R12:
0000000000000001
[ 4953.467147] R13: ffffaed60f84fd58 R14: ffff8aa32140cff0 R15:
0000000000000000
[ 4953.467151] FS:  0000000000000000(0000) GS:ffff8aa33eb40000(0000)
knlGS:0000000000000000
[ 4953.467154] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4953.467158] CR2: 00000000000002b4 CR3: 00000007b5212002 CR4:
00000000001606e0
[ 5148.503504] audit: type=3D1006 audit(1563216150.929:94): pid=3D20550 uid=
=3D0
old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D5=
 res=3D1


[464226.751918] BUG: kernel NULL pointer dereference, address: 000000000000=
02b4
[464226.751929] #PF: supervisor read access in kernel mode
[464226.751933] #PF: error_code(0x0000) - not-present page
[464226.751936] PGD 0 P4D 0=20
[464226.751944] Oops: 0000 [#1] PREEMPT SMP PTI
[464226.751951] CPU: 6 PID: 20885 Comm: kworker/u16:7 Tainted: G           =
OE=20=20
  5.2.1-arch1-1-ARCH #1
[464226.751981] Workqueue: events_unbound commit_work [drm_kms_helper]
[464226.752158] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[464226.752165] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 fe 73 d4 b8 01 00=
 00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 <8b> 8=
3 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01=20
00 00
[464226.752170] RSP: 0018:ffffad91cd9f3af0 EFLAGS: 00010202
[464226.752174] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[464226.752178] RDX: ffffffffc1345710 RSI: 0000000000000000 RDI:
ffff928467e8c000
[464226.752182] RBP: ffff927f19680000 R08: ffff927f19680000 R09:
0000000000000000
[464226.752185] R10: ffff927f19680000 R11: 0000000000000000 R12:
0000000000000001
[464226.752188] R13: ffffad91cd9f3d58 R14: ffff92846149cff0 R15:
0000000000000000
[464226.752193] FS:  0000000000000000(0000) GS:ffff92847eb80000(0000)
knlGS:0000000000000000
[464226.752197] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[464226.752201] CR2: 00000000000002b4 CR3: 00000007b8fdc002 CR4:
00000000001606e0
[464226.752204] Call Trace:
[464226.752384]  dc_commit_state+0xa1/0x5a0 [amdgpu]
[464226.752507]  ? amdgpu_bo_unpin+0xce/0xe0 [amdgpu]
[464226.752551]  ? drm_calc_timestamping_constants+0xe0/0x140 [drm]
[464226.752733]  amdgpu_dm_atomic_commit_tail+0xc64/0x1a20 [amdgpu]
[464226.752745]  ? __switch_to_asm+0x40/0x70
[464226.752751]  ? __switch_to_asm+0x34/0x70
[464226.752756]  ? __switch_to_asm+0x40/0x70
[464226.752762]  ? __switch_to_asm+0x40/0x70
[464226.752767]  ? __switch_to_asm+0x40/0x70
[464226.752772]  ? __switch_to_asm+0x40/0x70
[464226.752778]  ? __switch_to_asm+0x34/0x70
[464226.752783]  ? __switch_to_asm+0x40/0x70
[464226.752788]  ? __switch_to_asm+0x40/0x70
[464226.752797]  ? __switch_to_xtra+0x1b6/0x610
[464226.752802]  ? __switch_to_asm+0x34/0x70
[464226.752807]  ? __switch_to_asm+0x40/0x70
[464226.752812]  ? __switch_to_asm+0x34/0x70
[464226.752843]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[464226.752862]  commit_tail+0x3c/0x70 [drm_kms_helper]
[464226.752871]  process_one_work+0x1d1/0x3e0
[464226.752878]  worker_thread+0x4a/0x3d0
[464226.752887]  kthread+0xfd/0x130
[464226.752893]  ? process_one_work+0x3e0/0x3e0
[464226.752899]  ? kthread_park+0x90/0x90
[464226.752905]  ret_from_fork+0x35/0x40
[464226.752913] Modules linked in: sctp arc4 md4 cfg80211 8021q garp mrp br=
idge
stp llc nct6775 hwmon_vid ext4 crc16 mbcache jbd2 intel_rapl amdgpu hid_ste=
am
joydev mousedev input_leds x86_pkg_temp_thermal inte
l_powerclamp coretemp kvm_intel kvm dm_mod irqbypass amd_iommu_v2 gpu_sched=
 ttm
crct10dif_pclmul crc32_pclmul drm_kms_helper ofpart ghash_clmulni_intel
cmdlinepart drm intel_spi_platform intel_spi spi_nor eeepc
_wmi hid_generic mei_hdcp asus_wmi snd_hda_codec_realtek iTCO_wdt
snd_hda_codec_generic sparse_keymap iTCO_vendor_support ledtrig_audio mtd
snd_hda_codec_hdmi wmi_bmof ppdev rfkill mxm_wmi snd_usb_audio snd_hda_intel
aesni_intel snd_virtuoso agpgart snd_hda_codec snd_oxygen_lib igb aes_x86_64
crypto_simd cryptd snd_hda_core snd_usbmidi_lib glue_helper syscopyarea
intel_cstate snd_mpu401_uart sysfillrect i2c_algo_bit intel_uncore media
snd_hwdep snd_rawmidi mei_me sysimgblt usbhid intel_rapl_perf pcspkr i2c_i8=
01
lpc_ich snd_pcm mei fb_sys_fops dca ie31200_edac hid parport_pc evdev
[464226.752991]  parport mac_hid pcc_cpufreq wmi sch_fq tcp_htcp snd_seq_du=
mmy
snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device snd_timer snd soundco=
re
cuse nfsd auth_rpcgss nfsv4 nfsv3 nfs_acl nfsv2 nfs lockd grace sunrpc nls_=
utf8
cifs ccm dns_resolver fscache loop fuse sg crypto_user vfs_monitor(OE)
ip_tables x_tables btrfs libcrc32c crc32c_generic xor raid6_pq raid1 md_mod
sd_mod ahci libahci libata xhci_pci firewire_ohci crc32c_intel scsi_mod
xhci_hcd ehci_pci firewire_core ehci_hcd crc_itu_t
[464226.753047] CR2: 00000000000002b4
[464226.753053] ---[ end trace a22ae414b68cae32 ]---
[464226.753218] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[464226.753225] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 fe 73 d4 b8 01 00=
 00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 <8b> 8=
3 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01 00 00
[464226.753229] RSP: 0018:ffffad91cd9f3af0 EFLAGS: 00010202
[464226.753233] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[464226.753237] RDX: ffffffffc1345710 RSI: 0000000000000000 RDI:
ffff928467e8c000
[464226.753241] RBP: ffff927f19680000 R08: ffff927f19680000 R09:
0000000000000000
[464226.753244] R10: ffff927f19680000 R11: 0000000000000000 R12:
0000000000000001
[464226.753248] R13: ffffad91cd9f3d58 R14: ffff92846149cff0 R15:
0000000000000000
[464226.753252] FS:  0000000000000000(0000) GS:ffff92847eb80000(0000)
knlGS:0000000000000000
[464226.753256] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[464226.753260] CR2: 00000000000002b4 CR3: 00000007b8fdc002 CR4:
00000000001606e0


[89446.140229] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b4
[89446.140238] #PF: supervisor read access in kernel mode
[89446.140242] #PF: error_code(0x0000) - not-present page
[89446.140245] PGD 0 P4D 0=20
[89446.140252] Oops: 0000 [#1] PREEMPT SMP PTI
[89446.140258] CPU: 5 PID: 18007 Comm: kworker/u16:0 Tainted: G           O=
E=20=20=20
 5.2.2-arch1-1-ARCH #1
[89446.140284] Workqueue: events_unbound commit_work [drm_kms_helper]
[89446.140489] RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
[89446.140498] Code: 04 00 00 49 8b bc 02 80 02 00 00 48 8b 07 48 8b 40 50 =
e8
1d b5 e5 ec b8 01 00 00 00 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 53 <8b> 8=
6 b4
02 00 00 48 89 f3 48 89 f2 8b 8e 10 01 00 00 bf 04 0
0 00
[89446.140503] RSP: 0018:ffffb8dc4c743af0 EFLAGS: 00010202
[89446.140510] RAX: 0000000000000000 RBX: ffff9dea30ea6000 RCX:
0000000000000002
[89446.140515] RDX: ffffffffc162a710 RSI: 0000000000000000 RDI:
ffff9dea30ea6000
[89446.140520] RBP: ffff9de9007a0000 R08: ffff9de9007a0000 R09:
0000000000000000
[89446.140525] R10: ffff9de9007a0000 R11: 0000000000000018 R12:
0000000000000001
[89446.140531] R13: ffffb8dc4c743d58 R14: ffff9dea207ecff0 R15:
0000000000000000
[89446.140537] FS:  0000000000000000(0000) GS:ffff9dea3eb40000(0000)
knlGS:0000000000000000
[89446.140542] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[89446.140547] CR2: 00000000000002b4 CR3: 000000075c0c2004 CR4:
00000000001606e0
[89446.140551] Call Trace:
[89446.140772]  dc_commit_state+0x9a/0x5a0 [amdgpu]
[89446.140968]  ? dm_plane_helper_cleanup_fb+0xa3/0x120 [amdgpu]
[89446.141175]  amdgpu_dm_atomic_commit_tail+0xc5d/0x1a10 [amdgpu]
[89446.141191]  ? __switch_to_asm+0x40/0x70
[89446.141199]  ? __switch_to_asm+0x34/0x70
[89446.141206]  ? __switch_to_asm+0x40/0x70
[89446.141212]  ? __switch_to_asm+0x40/0x70
[89446.141219]  ? __switch_to_asm+0x40/0x70
[89446.141225]  ? __switch_to_asm+0x40/0x70
[89446.141231]  ? __switch_to_asm+0x34/0x70
[89446.141237]  ? __switch_to_asm+0x40/0x70
[89446.141244]  ? __switch_to_asm+0x40/0x70
[89446.141250]  ? __switch_to_asm+0x34/0x70
[89446.141260]  ? __switch_to_xtra+0x1b4/0x610
[89446.141266]  ? __switch_to_asm+0x34/0x70
[89446.141273]  ? __switch_to_asm+0x40/0x70
[89446.141279]  ? __switch_to_asm+0x34/0x70
[89446.141320]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[89446.141340]  commit_tail+0x3c/0x70 [drm_kms_helper]
[89446.141347]  process_one_work+0x1d1/0x3e0
[89446.141353]  worker_thread+0x4a/0x3d0
[89446.141361]  kthread+0xfb/0x130
[89446.141365]  ? process_one_work+0x3e0/0x3e0
[89446.141371]  ? kthread_park+0x90/0x90
[89446.141377]  ret_from_fork+0x35/0x40
[89446.141384] Modules linked in: arc4 md4 cfg80211 8021q garp mrp bridge s=
tp
llc nct6775 hwmon_vid ext4 crc16 mbcache jbd2 joydev mousedev input_leds am=
dgpu
intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm
irqbypass ofpart cmdlinepart intel_spi_platform intel_spi eeepc_wmi spi_nor
crct10dif_pclmul asus_wmi sparse_keymap iTCO_wdt crc32_pclmul mtd mei_hdcp
ppdev iTCO_vendor_support rfkill wmi_bmof mxm_wmi amd_iommu_v2
ghash_clmulni_intel gpu_sched ttm drm_kms_helper snd_hda_codec_realtek
snd_usb_audio snd_hda_codec_generic snd_usbmidi_lib drm aesni_intel
ledtrig_audio snd_virtuoso snd_hda_codec_hdmi aes_x86_64 snd_oxygen_lib
crypto_simd snd_hda_intel cryptd media glue_helper snd_hda_codec
snd_mpu401_uart intel_cstate agpgart syscopyarea intel_uncore igb snd_hda_c=
ore
hid_steam intel_rapl_perf snd_rawmidi snd_hwdep sysfillrect i2c_algo_bit
sysimgblt mei_me dca lpc_ich pcspkr snd_pcm fb_sys_fops i2c_i801 mei
ie31200_edac parport_pc parport evdev mac_hid wmi pcc_cpufreq
[89446.141456]  sch_fq tcp_htcp snd_seq_dummy snd_seq_oss snd_seq_midi_event
snd_seq snd_seq_device snd_timer snd soundcore cuse nfsd auth_rpcgss nfsv4
nfsv3 nfs_acl nfsv2 nfs lockd grace sunrpc nls_utf8 cifs ccm dns_resolver
fscache loop fuse sg crypto_user vfs_monitor(OE) ip_tables x_tables hid_gen=
eric
usbhid hid dm_mod btrfs libcrc32c crc32c_generic xor raid6_pq raid1 md_mod
sd_mod ahci libahci libata xhci_pci firewire_ohci crc32c_intel scsi_mod
xhci_hcd ehci_pci firewire_core ehci_hcd crc_itu_t
[89446.141524] CR2: 00000000000002b4
[89446.141531] ---[ end trace a31be47676a3f1f7 ]---
[89446.141679] RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
[89446.141686] Code: 04 00 00 49 8b bc 02 80 02 00 00 48 8b 07 48 8b 40 50 =
e8
1d b5 e5 ec b8 01 00 00 00 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 53 <8b> 8=
6 b4
02 00 00 48 89 f3 48 89 f2 8b 8e 10 01 00 00 bf 04 00 00
[89446.141690] RSP: 0018:ffffb8dc4c743af0 EFLAGS: 00010202
[89446.141694] RAX: 0000000000000000 RBX: ffff9dea30ea6000 RCX:
0000000000000002
[89446.141697] RDX: ffffffffc162a710 RSI: 0000000000000000 RDI:
ffff9dea30ea6000
[89446.141701] RBP: ffff9de9007a0000 R08: ffff9de9007a0000 R09:
0000000000000000
[89446.141704] R10: ffff9de9007a0000 R11: 0000000000000018 R12:
0000000000000001
[89446.141707] R13: ffffb8dc4c743d58 R14: ffff9dea207ecff0 R15:
0000000000000000
[89446.141711] FS:  0000000000000000(0000) GS:ffff9dea3eb40000(0000)
knlGS:0000000000000000
[89446.141715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[89446.141718] CR2: 00000000000002b4 CR3: 000000075c0c2004 CR4:
00000000001606e0


I've been updating to the latest packages after most of these crashes,
currently:

GL_VERSION: 4.5 (Compatibility Profile) Mesa 19.1.3
GL_RENDERER: AMD Radeon R9 200 Series (TONGA, DRM 3.32.0, 5.2.3-arch1-1-ARC=
H,
LLVM 8.0.1)

-

Please let me know if there's additional information that could help and/or=
 if
there is a better location to file this bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642511760.eCeeBbd.22053
Date: Sat, 27 Jul 2019 18:12:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu bug: kernel NULL pointer dereference during video =
playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111234">111234</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>amdgpu bug: kernel NULL pointer dereference during video play=
back
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mjevans1983&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Over the past month I've experienced frequent (more than once =
per week) video
output freezes while watching hardware accelerated video output from Twitch
(they transcoded, played in mpv with profile=3Dgpu-hq).

For three of these I collected dmesg outputs by logging in from a different=
 PC.
 I also observed that the numlock key was unresponsive, but I suspect that
might just be because the video driver issue caused KDE Plasma to either cr=
ash
or lock up waiting on the kernel.

It's slightly interesting that over two kernel versions and the three trace=
s I
did collect that the null pointer is to the same address.

[    4.615743] [drm] initializing kernel modesetting (TONGA 0x1002:0x6939
0x148C:0x2349 0x00).
[    4.615754] [drm] register mmio base: 0xF7E00000
[    4.615755] [drm] register mmio size: 262144
[    4.616024] ATOM BIOS: 113-C7660101_106
[    5.072492] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:01:00.0 on
minor 0



[ 4953.465909] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b4
[ 4953.465918] #PF: supervisor read access in kernel mode
[ 4953.465922] #PF: error_code(0x0000) - not-present page
[ 4953.465925] PGD 0 P4D 0=20
[ 4953.465932] Oops: 0000 [#1] PREEMPT SMP PTI
[ 4953.465939] CPU: 5 PID: 14373 Comm: kworker/u16:4 Tainted: G        W  O=
E=20=20=20
 5.2.1-arch1-1-ARCH #1
[ 4953.465967] Workqueue: events_unbound commit_work [drm_kms_helper]
[ 4953.466127] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[ 4953.466133] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 ae 7e f6 b8 01 00 =
00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 &lt;8b=
&gt; 83 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01 0
0 00
[ 4953.466137] RSP: 0018:ffffaed60f84faf0 EFLAGS: 00210202
[ 4953.466142] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[ 4953.466145] RDX: ffffffffc149a710 RSI: 0000000000000000 RDI:
ffff8aa32a5d9000
[ 4953.466148] RBP: ffff8a9d80030000 R08: ffff8a9d80030000 R09:
0000000000000000
[ 4953.466152] R10: ffff8a9d80030000 R11: ffff8aa33eb692a4 R12:
0000000000000001
[ 4953.466155] R13: ffffaed60f84fd58 R14: ffff8aa32140cff0 R15:
0000000000000000
[ 4953.466159] FS:  0000000000000000(0000) GS:ffff8aa33eb40000(0000)
knlGS:0000000000000000
[ 4953.466163] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4953.466166] CR2: 00000000000002b4 CR3: 00000007b5212002 CR4:
00000000001606e0
[ 4953.466170] Call Trace:
[ 4953.466332]  dc_commit_state+0xa1/0x5a0 [amdgpu]
[ 4953.466446]  ? amdgpu_bo_unpin+0xce/0xe0 [amdgpu]
[ 4953.466491]  ? drm_calc_timestamping_constants+0xe0/0x140 [drm]
[ 4953.466675]  amdgpu_dm_atomic_commit_tail+0xc64/0x1a20 [amdgpu]
[ 4953.466689]  ? __switch_to_asm+0x40/0x70
[ 4953.466694]  ? __switch_to_asm+0x34/0x70
[ 4953.466699]  ? __switch_to_asm+0x40/0x70
[ 4953.466704]  ? __switch_to_asm+0x40/0x70
[ 4953.466709]  ? __switch_to_asm+0x40/0x70
[ 4953.466713]  ? __switch_to_asm+0x40/0x70
[ 4953.466718]  ? __switch_to_asm+0x34/0x70
[ 4953.466723]  ? __switch_to_asm+0x40/0x70
[ 4953.466728]  ? __switch_to_asm+0x40/0x70
[ 4953.466737]  ? __switch_to_xtra+0x1b6/0x610
[ 4953.466742]  ? __switch_to_asm+0x34/0x70
[ 4953.466747]  ? __switch_to_asm+0x40/0x70
[ 4953.466751]  ? __switch_to_asm+0x34/0x70
[ 4953.466780]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4953.466798]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4953.466806]  process_one_work+0x1d1/0x3e0
[ 4953.466812]  worker_thread+0x4a/0x3d0
[ 4953.466821]  kthread+0xfd/0x130
[ 4953.466826]  ? process_one_work+0x3e0/0x3e0
[ 4953.466832]  ? kthread_park+0x90/0x90
[ 4953.466838]  ret_from_fork+0x35/0x40
[ 4953.466845] Modules linked in: arc4 md4 cfg80211 8021q garp mrp bridge s=
tp
llc nct6775 hwmon_vid ext4 crc16 mbcache jbd2 intel_rapl amdgpu
x86_pkg_temp_thermal intel_powerclamp coretemp input_leds joydev kvm_intel
mousedev hid_steam kvm irqbypass amd_iommu_v2 gpu_sched ttm ofpart
crct10dif_pclmul cmdlinepart crc32_pclmul drm_kms_helper intel_spi_platform
snd_hda_codec_realtek ghash_clmulni_intel intel_spi snd_hda_codec_generic
eeepc_wmi snd_hda_codec_hdmi ledtrig_audio drm spi_nor asus_wmi sparse_keym=
ap
iTCO_wdt hid_generic mei_hdcp mtd snd_hda_intel ppdev iTCO_vendor_support
rfkill aesni_intel snd_usb_audio wmi_bmof mxm_wmi snd_hda_codec snd_virtuoso
aes_x86_64 agpgart igb crypto_simd snd_oxygen_lib mei_me syscopyarea
snd_mpu401_uart snd_usbmidi_lib sysfillrect snd_hda_core cryptd glue_helper
sysimgblt media intel_cstate i2c_algo_bit usbhid snd_rawmidi snd_hwdep
parport_pc intel_uncore pcspkr i2c_i801 mei lpc_ich dca fb_sys_fops
ie31200_edac hid intel_rapl_perf snd_pcm parport evdev wmi
[ 4953.466916]  pcc_cpufreq mac_hid sch_fq tcp_htcp snd_seq_dummy snd_seq_o=
ss
snd_seq_midi_event snd_seq snd_seq_device snd_timer snd soundcore cuse nfsd
auth_rpcgss nfsv4 nfsv3 nfs_acl nfsv2 nfs lockd grace sunrpc nls_utf8 cifs =
ccm
dns_resolver fscache loop fuse sg crypto_user vfs_monitor(OE) ip_tables
x_tables dm_mod btrfs libcrc32c crc32c_generic xor raid6_pq raid1 md_mod sd=
_mod
ahci libahci libata xhci_pci scsi_mod crc32c_intel ehci_pci firewire_ohci
xhci_hcd ehci_hcd firewire_core crc_itu_t
[ 4953.466966] CR2: 00000000000002b4
[ 4953.466972] ---[ end trace 24c4d6a2e775c61e ]---
[ 4953.467120] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[ 4953.467126] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 ae 7e f6 b8 01 00 =
00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 &lt;8b=
&gt; 83 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01 00 00
[ 4953.467130] RSP: 0018:ffffaed60f84faf0 EFLAGS: 00210202
[ 4953.467134] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[ 4953.467137] RDX: ffffffffc149a710 RSI: 0000000000000000 RDI:
ffff8aa32a5d9000
[ 4953.467141] RBP: ffff8a9d80030000 R08: ffff8a9d80030000 R09:
0000000000000000
[ 4953.467144] R10: ffff8a9d80030000 R11: ffff8aa33eb692a4 R12:
0000000000000001
[ 4953.467147] R13: ffffaed60f84fd58 R14: ffff8aa32140cff0 R15:
0000000000000000
[ 4953.467151] FS:  0000000000000000(0000) GS:ffff8aa33eb40000(0000)
knlGS:0000000000000000
[ 4953.467154] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4953.467158] CR2: 00000000000002b4 CR3: 00000007b5212002 CR4:
00000000001606e0
[ 5148.503504] audit: type=3D1006 audit(1563216150.929:94): pid=3D20550 uid=
=3D0
old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D5=
 res=3D1


[464226.751918] BUG: kernel NULL pointer dereference, address: 000000000000=
02b4
[464226.751929] #PF: supervisor read access in kernel mode
[464226.751933] #PF: error_code(0x0000) - not-present page
[464226.751936] PGD 0 P4D 0=20
[464226.751944] Oops: 0000 [#1] PREEMPT SMP PTI
[464226.751951] CPU: 6 PID: 20885 Comm: kworker/u16:7 Tainted: G           =
OE=20=20
  5.2.1-arch1-1-ARCH #1
[464226.751981] Workqueue: events_unbound commit_work [drm_kms_helper]
[464226.752158] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[464226.752165] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 fe 73 d4 b8 01 00=
 00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 &lt;8b=
&gt; 83 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01=20
00 00
[464226.752170] RSP: 0018:ffffad91cd9f3af0 EFLAGS: 00010202
[464226.752174] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[464226.752178] RDX: ffffffffc1345710 RSI: 0000000000000000 RDI:
ffff928467e8c000
[464226.752182] RBP: ffff927f19680000 R08: ffff927f19680000 R09:
0000000000000000
[464226.752185] R10: ffff927f19680000 R11: 0000000000000000 R12:
0000000000000001
[464226.752188] R13: ffffad91cd9f3d58 R14: ffff92846149cff0 R15:
0000000000000000
[464226.752193] FS:  0000000000000000(0000) GS:ffff92847eb80000(0000)
knlGS:0000000000000000
[464226.752197] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[464226.752201] CR2: 00000000000002b4 CR3: 00000007b8fdc002 CR4:
00000000001606e0
[464226.752204] Call Trace:
[464226.752384]  dc_commit_state+0xa1/0x5a0 [amdgpu]
[464226.752507]  ? amdgpu_bo_unpin+0xce/0xe0 [amdgpu]
[464226.752551]  ? drm_calc_timestamping_constants+0xe0/0x140 [drm]
[464226.752733]  amdgpu_dm_atomic_commit_tail+0xc64/0x1a20 [amdgpu]
[464226.752745]  ? __switch_to_asm+0x40/0x70
[464226.752751]  ? __switch_to_asm+0x34/0x70
[464226.752756]  ? __switch_to_asm+0x40/0x70
[464226.752762]  ? __switch_to_asm+0x40/0x70
[464226.752767]  ? __switch_to_asm+0x40/0x70
[464226.752772]  ? __switch_to_asm+0x40/0x70
[464226.752778]  ? __switch_to_asm+0x34/0x70
[464226.752783]  ? __switch_to_asm+0x40/0x70
[464226.752788]  ? __switch_to_asm+0x40/0x70
[464226.752797]  ? __switch_to_xtra+0x1b6/0x610
[464226.752802]  ? __switch_to_asm+0x34/0x70
[464226.752807]  ? __switch_to_asm+0x40/0x70
[464226.752812]  ? __switch_to_asm+0x34/0x70
[464226.752843]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[464226.752862]  commit_tail+0x3c/0x70 [drm_kms_helper]
[464226.752871]  process_one_work+0x1d1/0x3e0
[464226.752878]  worker_thread+0x4a/0x3d0
[464226.752887]  kthread+0xfd/0x130
[464226.752893]  ? process_one_work+0x3e0/0x3e0
[464226.752899]  ? kthread_park+0x90/0x90
[464226.752905]  ret_from_fork+0x35/0x40
[464226.752913] Modules linked in: sctp arc4 md4 cfg80211 8021q garp mrp br=
idge
stp llc nct6775 hwmon_vid ext4 crc16 mbcache jbd2 intel_rapl amdgpu hid_ste=
am
joydev mousedev input_leds x86_pkg_temp_thermal inte
l_powerclamp coretemp kvm_intel kvm dm_mod irqbypass amd_iommu_v2 gpu_sched=
 ttm
crct10dif_pclmul crc32_pclmul drm_kms_helper ofpart ghash_clmulni_intel
cmdlinepart drm intel_spi_platform intel_spi spi_nor eeepc
_wmi hid_generic mei_hdcp asus_wmi snd_hda_codec_realtek iTCO_wdt
snd_hda_codec_generic sparse_keymap iTCO_vendor_support ledtrig_audio mtd
snd_hda_codec_hdmi wmi_bmof ppdev rfkill mxm_wmi snd_usb_audio snd_hda_intel
aesni_intel snd_virtuoso agpgart snd_hda_codec snd_oxygen_lib igb aes_x86_64
crypto_simd cryptd snd_hda_core snd_usbmidi_lib glue_helper syscopyarea
intel_cstate snd_mpu401_uart sysfillrect i2c_algo_bit intel_uncore media
snd_hwdep snd_rawmidi mei_me sysimgblt usbhid intel_rapl_perf pcspkr i2c_i8=
01
lpc_ich snd_pcm mei fb_sys_fops dca ie31200_edac hid parport_pc evdev
[464226.752991]  parport mac_hid pcc_cpufreq wmi sch_fq tcp_htcp snd_seq_du=
mmy
snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device snd_timer snd soundco=
re
cuse nfsd auth_rpcgss nfsv4 nfsv3 nfs_acl nfsv2 nfs lockd grace sunrpc nls_=
utf8
cifs ccm dns_resolver fscache loop fuse sg crypto_user vfs_monitor(OE)
ip_tables x_tables btrfs libcrc32c crc32c_generic xor raid6_pq raid1 md_mod
sd_mod ahci libahci libata xhci_pci firewire_ohci crc32c_intel scsi_mod
xhci_hcd ehci_pci firewire_core ehci_hcd crc_itu_t
[464226.753047] CR2: 00000000000002b4
[464226.753053] ---[ end trace a22ae414b68cae32 ]---
[464226.753218] RIP: 0010:dc_stream_log+0x9/0xb0 [amdgpu]
[464226.753225] Code: 4c 89 e2 48 8b 07 48 8b 40 50 e8 22 fe 73 d4 b8 01 00=
 00
00 5b 5d 41 5c 41 5d 41 5e c3 0f 1f 40 00 0f 1f 44 00 00 53 48 89 f3 &lt;8b=
&gt; 83 b4
02 00 00 48 89 da 8b 8b 10 01 00 00 44 8b 8b 18 01 00 00
[464226.753229] RSP: 0018:ffffad91cd9f3af0 EFLAGS: 00010202
[464226.753233] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000002
[464226.753237] RDX: ffffffffc1345710 RSI: 0000000000000000 RDI:
ffff928467e8c000
[464226.753241] RBP: ffff927f19680000 R08: ffff927f19680000 R09:
0000000000000000
[464226.753244] R10: ffff927f19680000 R11: 0000000000000000 R12:
0000000000000001
[464226.753248] R13: ffffad91cd9f3d58 R14: ffff92846149cff0 R15:
0000000000000000
[464226.753252] FS:  0000000000000000(0000) GS:ffff92847eb80000(0000)
knlGS:0000000000000000
[464226.753256] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[464226.753260] CR2: 00000000000002b4 CR3: 00000007b8fdc002 CR4:
00000000001606e0


[89446.140229] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b4
[89446.140238] #PF: supervisor read access in kernel mode
[89446.140242] #PF: error_code(0x0000) - not-present page
[89446.140245] PGD 0 P4D 0=20
[89446.140252] Oops: 0000 [#1] PREEMPT SMP PTI
[89446.140258] CPU: 5 PID: 18007 Comm: kworker/u16:0 Tainted: G           O=
E=20=20=20
 5.2.2-arch1-1-ARCH #1
[89446.140284] Workqueue: events_unbound commit_work [drm_kms_helper]
[89446.140489] RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
[89446.140498] Code: 04 00 00 49 8b bc 02 80 02 00 00 48 8b 07 48 8b 40 50 =
e8
1d b5 e5 ec b8 01 00 00 00 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 53 &lt;8b=
&gt; 86 b4
02 00 00 48 89 f3 48 89 f2 8b 8e 10 01 00 00 bf 04 0
0 00
[89446.140503] RSP: 0018:ffffb8dc4c743af0 EFLAGS: 00010202
[89446.140510] RAX: 0000000000000000 RBX: ffff9dea30ea6000 RCX:
0000000000000002
[89446.140515] RDX: ffffffffc162a710 RSI: 0000000000000000 RDI:
ffff9dea30ea6000
[89446.140520] RBP: ffff9de9007a0000 R08: ffff9de9007a0000 R09:
0000000000000000
[89446.140525] R10: ffff9de9007a0000 R11: 0000000000000018 R12:
0000000000000001
[89446.140531] R13: ffffb8dc4c743d58 R14: ffff9dea207ecff0 R15:
0000000000000000
[89446.140537] FS:  0000000000000000(0000) GS:ffff9dea3eb40000(0000)
knlGS:0000000000000000
[89446.140542] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[89446.140547] CR2: 00000000000002b4 CR3: 000000075c0c2004 CR4:
00000000001606e0
[89446.140551] Call Trace:
[89446.140772]  dc_commit_state+0x9a/0x5a0 [amdgpu]
[89446.140968]  ? dm_plane_helper_cleanup_fb+0xa3/0x120 [amdgpu]
[89446.141175]  amdgpu_dm_atomic_commit_tail+0xc5d/0x1a10 [amdgpu]
[89446.141191]  ? __switch_to_asm+0x40/0x70
[89446.141199]  ? __switch_to_asm+0x34/0x70
[89446.141206]  ? __switch_to_asm+0x40/0x70
[89446.141212]  ? __switch_to_asm+0x40/0x70
[89446.141219]  ? __switch_to_asm+0x40/0x70
[89446.141225]  ? __switch_to_asm+0x40/0x70
[89446.141231]  ? __switch_to_asm+0x34/0x70
[89446.141237]  ? __switch_to_asm+0x40/0x70
[89446.141244]  ? __switch_to_asm+0x40/0x70
[89446.141250]  ? __switch_to_asm+0x34/0x70
[89446.141260]  ? __switch_to_xtra+0x1b4/0x610
[89446.141266]  ? __switch_to_asm+0x34/0x70
[89446.141273]  ? __switch_to_asm+0x40/0x70
[89446.141279]  ? __switch_to_asm+0x34/0x70
[89446.141320]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[89446.141340]  commit_tail+0x3c/0x70 [drm_kms_helper]
[89446.141347]  process_one_work+0x1d1/0x3e0
[89446.141353]  worker_thread+0x4a/0x3d0
[89446.141361]  kthread+0xfb/0x130
[89446.141365]  ? process_one_work+0x3e0/0x3e0
[89446.141371]  ? kthread_park+0x90/0x90
[89446.141377]  ret_from_fork+0x35/0x40
[89446.141384] Modules linked in: arc4 md4 cfg80211 8021q garp mrp bridge s=
tp
llc nct6775 hwmon_vid ext4 crc16 mbcache jbd2 joydev mousedev input_leds am=
dgpu
intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm
irqbypass ofpart cmdlinepart intel_spi_platform intel_spi eeepc_wmi spi_nor
crct10dif_pclmul asus_wmi sparse_keymap iTCO_wdt crc32_pclmul mtd mei_hdcp
ppdev iTCO_vendor_support rfkill wmi_bmof mxm_wmi amd_iommu_v2
ghash_clmulni_intel gpu_sched ttm drm_kms_helper snd_hda_codec_realtek
snd_usb_audio snd_hda_codec_generic snd_usbmidi_lib drm aesni_intel
ledtrig_audio snd_virtuoso snd_hda_codec_hdmi aes_x86_64 snd_oxygen_lib
crypto_simd snd_hda_intel cryptd media glue_helper snd_hda_codec
snd_mpu401_uart intel_cstate agpgart syscopyarea intel_uncore igb snd_hda_c=
ore
hid_steam intel_rapl_perf snd_rawmidi snd_hwdep sysfillrect i2c_algo_bit
sysimgblt mei_me dca lpc_ich pcspkr snd_pcm fb_sys_fops i2c_i801 mei
ie31200_edac parport_pc parport evdev mac_hid wmi pcc_cpufreq
[89446.141456]  sch_fq tcp_htcp snd_seq_dummy snd_seq_oss snd_seq_midi_event
snd_seq snd_seq_device snd_timer snd soundcore cuse nfsd auth_rpcgss nfsv4
nfsv3 nfs_acl nfsv2 nfs lockd grace sunrpc nls_utf8 cifs ccm dns_resolver
fscache loop fuse sg crypto_user vfs_monitor(OE) ip_tables x_tables hid_gen=
eric
usbhid hid dm_mod btrfs libcrc32c crc32c_generic xor raid6_pq raid1 md_mod
sd_mod ahci libahci libata xhci_pci firewire_ohci crc32c_intel scsi_mod
xhci_hcd ehci_pci firewire_core ehci_hcd crc_itu_t
[89446.141524] CR2: 00000000000002b4
[89446.141531] ---[ end trace a31be47676a3f1f7 ]---
[89446.141679] RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
[89446.141686] Code: 04 00 00 49 8b bc 02 80 02 00 00 48 8b 07 48 8b 40 50 =
e8
1d b5 e5 ec b8 01 00 00 00 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 53 &lt;8b=
&gt; 86 b4
02 00 00 48 89 f3 48 89 f2 8b 8e 10 01 00 00 bf 04 00 00
[89446.141690] RSP: 0018:ffffb8dc4c743af0 EFLAGS: 00010202
[89446.141694] RAX: 0000000000000000 RBX: ffff9dea30ea6000 RCX:
0000000000000002
[89446.141697] RDX: ffffffffc162a710 RSI: 0000000000000000 RDI:
ffff9dea30ea6000
[89446.141701] RBP: ffff9de9007a0000 R08: ffff9de9007a0000 R09:
0000000000000000
[89446.141704] R10: ffff9de9007a0000 R11: 0000000000000018 R12:
0000000000000001
[89446.141707] R13: ffffb8dc4c743d58 R14: ffff9dea207ecff0 R15:
0000000000000000
[89446.141711] FS:  0000000000000000(0000) GS:ffff9dea3eb40000(0000)
knlGS:0000000000000000
[89446.141715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[89446.141718] CR2: 00000000000002b4 CR3: 000000075c0c2004 CR4:
00000000001606e0


I've been updating to the latest packages after most of these crashes,
currently:

GL_VERSION: 4.5 (Compatibility Profile) Mesa 19.1.3
GL_RENDERER: AMD Radeon R9 200 Series (TONGA, DRM 3.32.0, 5.2.3-arch1-1-ARC=
H,
LLVM 8.0.1)

-

Please let me know if there's additional information that could help and/or=
 if
there is a better location to file this bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642511760.eCeeBbd.22053--

--===============1033626270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1033626270==--
