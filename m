Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B52E87FC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 16:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7BF897E0;
	Sat,  2 Jan 2021 15:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A24897E0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 15:52:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A0713207F7
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 15:52:09 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 94B18816ED; Sat,  2 Jan 2021 15:52:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211003] New: radeon "BUG: unable to handle page fault for
 address" when hot-unplugging another PCI-e device
Date: Sat, 02 Jan 2021 15:52:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jernej.jakob@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211003

            Bug ID: 211003
           Summary: radeon "BUG: unable to handle page fault for address"
                    when hot-unplugging another PCI-e device
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.80-gentoo-r1-x86_64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jernej.jakob@gmail.com
        Regression: No

radeon driver, bug happens when hot-unplugging another PCI-e card that is not
the video card (it was removed via /sys/bus/pci/device/.../remove before
hot-unplugging). It may be a hardware-induced error as this motherboard wasn't
designed for hot-plugging (but it usually works)

[62004.135491] radeon 0000:01:00.0: ring 0 stalled for more than 23820msec
[62004.135496] radeon 0000:01:00.0: GPU lockup (current fence id
0x000000000004145c last fence id 0x00000000000414f3 on ring 0)
[62004.465908] BUG: unable to handle page fault for address: ffffac09404bcffc
[62004.465914] #PF: supervisor read access in kernel mode
[62004.465917] #PF: error_code(0x0000) - not-present page
[62004.465919] PGD 107d34067 P4D 107d34067 PUD 0 
[62004.465925] Oops: 0000 [#1] SMP PTI
[62004.465929] CPU: 3 PID: 1397 Comm: eadedCompositor Not tainted
5.4.80-gentoo-r1-x86_64 #1
[62004.465932] Hardware name:  /DP965LT, BIOS MQ96510J.86A.1761.2009.0326.0001
03/26/2009
[62004.465973] RIP: 0010:radeon_ring_backup+0xc0/0x140 [radeon]
[62004.465977] Code: c6 49 89 06 48 85 c0 74 7b 41 8d 7c 24 ff 31 d2 48 c1 e7
02 eb 07 49 8b 06 48 83 c2 04 48 8b 75 08 8d 4b 01 89 db 48 8d 34 9e <8b> 36 89
34 10 23 4d 54 89 cb 48 39 d7 75 dd 4c 89 ef e8 d9 2d
 0b
[62004.465980] RSP: 0018:ffffac0543e6fc30 EFLAGS: 00010202
[62004.465983] RAX: ffff9514cd800000 RBX: 00000000ffffffff RCX:
0000000000000000
[62004.465986] RDX: 0000000000000000 RSI: ffffac09404bcffc RDI:
00000000000a7b80
[62004.465988] RBP: ffff9515da7514c8 R08: 00000000000303c7 R09:
000000000022c000
[62004.465991] R10: 00000000000303c0 R11: 0000000000000000 R12:
0000000000029ee1
[62004.465994] R13: ffff9515da7514a8 R14: ffffac0543e6fc90 R15:
ffff9515da750000
[62004.465997] FS:  00007f38769ff640(0000) GS:ffff9515e3b80000(0000)
knlGS:0000000000000000
[62004.466000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[62004.466002] CR2: ffffac09404bcffc CR3: 00000001f541e000 CR4:
00000000000006e0
[62004.466005] Call Trace:
[62004.466033]  radeon_gpu_reset+0xb3/0x2e0 [radeon]
[62004.466054]  ? radeon_gem_busy_ioctl+0x70/0x70 [radeon]
[62004.466074]  radeon_gem_handle_lockup.part.0+0xa/0x20 [radeon]
[62004.466096]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[62004.466109]  drm_ioctl+0x208/0x390 [drm]
[62004.466130]  ? radeon_gem_busy_ioctl+0x70/0x70 [radeon]
[62004.466134]  ? do_futex+0x16c/0xd10
[62004.466138]  ? ___sys_recvmsg+0x88/0xc0
[62004.466154]  radeon_drm_ioctl+0x49/0x80 [radeon]
[62004.466158]  do_vfs_ioctl+0x40e/0x670
[62004.466161]  ksys_ioctl+0x5e/0x90
[62004.466164]  __x64_sys_ioctl+0x16/0x20
[62004.466167]  do_syscall_64+0x5f/0x200
[62004.466170]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[62004.466172] RIP: 0033:0x7f38ee60ca57
[62004.466174] Code: c0 75 b5 49 8d 3c 1c e8 17 ff ff ff 85 c0 78 b6 4c 89 e0
5b 5d 41 5c c3 66 2e 0f 1f 84 00 00 00 00 00 90 b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d d9 63 0c 00 f7 d8 64 89 01 48
[62004.466176] RSP: 002b:00007f38769fe5e8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[62004.466178] RAX: ffffffffffffffda RBX: 00007f38769fe630 RCX:
00007f38ee60ca57
[62004.466180] RDX: 00007f38769fe630 RSI: 0000000040086464 RDI:
000000000000001d
[62004.466182] RBP: 0000000040086464 R08: 00007f38700add90 R09:
ffffffffffffffff
[62004.466183] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000001
[62004.466185] R13: 000000000000001d R14: 00007f38701ed5b0 R15:
0000000000000000
[62004.466187] Modules linked in: mptsas mptscsih scsi_transport_sas mptctl
mptbase ipv6 crc_ccitt cfg80211 rfkill 8021q garp mrp stp llc radeon kvm_intel
snd_hda_codec_idt iTCO_wdt snd_hda_codec_generic iTCO_vendor_support gpio_ich
snd_hda_codec_hdmi ledtrig_audio i2c_algo_bit kvm snd_hda_intel ppdev
snd_intel_nhlt firewire_ohci irqbypass snd_hda_codec pcspkr serio_raw i2c_i801
ttm ftdi_sio firewire_core lpc_ich snd_hda_core crc_itu_t drm_kms_helper
snd_hwdep mfd_core joydev snd_pcm snd_timer ata_generic coretemp usbserial
pata_acpi snd drm mei_me parport_pc soundcore backlight mei i2c_core mac_hid
parport acpi_cpufreq ext4 mbcache jbd2 serpent_sse2_x86_64 serpent_generic
dm_crypt dm_mod sd_mod xhci_pci xhci_hcd e1000e ahci libahci pata_marvell
uhci_hcd
[62004.466223] CR2: ffffac09404bcffc
[62004.466226] ---[ end trace 03961b91fcf60642 ]---
[62004.466246] RIP: 0010:radeon_ring_backup+0xc0/0x140 [radeon]
[62004.466248] Code: c6 49 89 06 48 85 c0 74 7b 41 8d 7c 24 ff 31 d2 48 c1 e7
02 eb 07 49 8b 06 48 83 c2 04 48 8b 75 08 8d 4b 01 89 db 48 8d 34 9e <8b> 36 89
34 10 23 4d 54 89 cb 48 39 d7 75 dd 4c 89 ef e8 d9 2d 0b
[62004.466250] RSP: 0018:ffffac0543e6fc30 EFLAGS: 00010202
[62004.466252] RAX: ffff9514cd800000 RBX: 00000000ffffffff RCX:
0000000000000000
[62004.466254] RDX: 0000000000000000 RSI: ffffac09404bcffc RDI:
00000000000a7b80
[62004.466256] RBP: ffff9515da7514c8 R08: 00000000000303c7 R09:
000000000022c000
[62004.466257] R10: 00000000000303c0 R11: 0000000000000000 R12:
0000000000029ee1
[62004.466259] R13: ffff9515da7514a8 R14: ffffac0543e6fc90 R15:
ffff9515da750000
[62004.466261] FS:  00007f38769ff640(0000) GS:ffff9515e3b80000(0000)
knlGS:0000000000000000
[62004.466263] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[62004.466264] CR2: ffffac09404bcffc CR3: 00000001f541e000 CR4:
00000000000006e0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
