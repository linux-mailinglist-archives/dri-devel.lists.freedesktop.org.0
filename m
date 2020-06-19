Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011A200096
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 05:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27F56EBE8;
	Fri, 19 Jun 2020 03:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C246EBE8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 03:14:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Fri, 19 Jun 2020 03:14:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-4QBQImNlAe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204181

--- Comment #65 from Christopher Snowhill (kode54@gmail.com) ---
Oh, there is no file attach here. So I'll just paste the whole thing in this
response:

Jun 18 19:53:40 mrgency kernel: general protection fault, probably for
non-canonical address 0x486df9363c7dd76e: 0000 [#1] SMP NOPTI
Jun 18 19:53:40 mrgency kernel: CPU: 7 PID: 15075 Comm: kworker/u64:1 Not
tainted 5.7.2-6-tkg-pds #1
Jun 18 19:53:40 mrgency kernel: Hardware name: Micro-Star International Co.,
Ltd MS-7C02/B450 TOMAHAWK (MS-7C02), BIOS 1.D0 11/07/2019
Jun 18 19:53:40 mrgency kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Jun 18 19:53:40 mrgency kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x24c/0x2040 [amdgpu]
Jun 18 19:53:40 mrgency kernel: Code: 8b 4f 08 8b 81 e0 02 00 00 41 ff c5 44 39
e8 0f 87 4d ff ff ff 48 83 bd 60 fd ff ff 00 0f 84 01 01 00 00 48 8b bd 60 fd
ff ff <80> bf b0 01 00 00 01 0f 86 aa 00 00 00 31 c0 48 b9 00 00 00 00 01
Jun 18 19:53:40 mrgency kernel: RSP: 0018:ffffaa9109057b70 EFLAGS: 00010202
Jun 18 19:53:40 mrgency kernel: RAX: 0000000000000006 RBX: ffff916786f2c800
RCX: ffff916a4c049800
Jun 18 19:53:40 mrgency kernel: RDX: ffff916a4c0ce800 RSI: ffffffffc14dd198
RDI: 486df9363c7dd76e
Jun 18 19:53:40 mrgency kernel: RBP: ffffaa9109057e60 R08: 0000000000000001
R09: 0000000000000001
Jun 18 19:53:40 mrgency kernel: R10: 0000000000000000 R11: 0000000000000000
R12: ffff9169ce131800
Jun 18 19:53:40 mrgency kernel: R13: 0000000000000006 R14: 0000000000000000
R15: ffff91680248b780
Jun 18 19:53:40 mrgency kernel: FS:  0000000000000000(0000)
GS:ffff916a4e9c0000(0000) knlGS:0000000000000000
Jun 18 19:53:40 mrgency kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 18 19:53:40 mrgency kernel: CR2: 000010a7e8949000 CR3: 000000028b26c000
CR4: 00000000003406e0
Jun 18 19:53:40 mrgency kernel: Call Trace:
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? take_other_rq_task+0x9d/0x3e0
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x40/0x70
Jun 18 19:53:40 mrgency kernel:  ? __switch_to_asm+0x34/0x70
Jun 18 19:53:40 mrgency kernel:  ? timerqueue_add+0x65/0xb0
Jun 18 19:53:40 mrgency kernel:  ? enqueue_hrtimer+0x3c/0x90
Jun 18 19:53:40 mrgency kernel:  ? hrtimer_start_range_ns+0x1a2/0x2f0
Jun 18 19:53:40 mrgency kernel:  ? __schedule+0x202/0x9d0
Jun 18 19:53:40 mrgency kernel:  ? psi_task_change+0x84/0xc0
Jun 18 19:53:40 mrgency kernel:  ? usleep_range+0x80/0x80
Jun 18 19:53:40 mrgency kernel:  ? _cond_resched+0x16/0x40
Jun 18 19:53:40 mrgency kernel:  ? __wait_for_common+0x3b/0x160
Jun 18 19:53:40 mrgency kernel:  commit_tail+0x92/0x120 [drm_kms_helper]
Jun 18 19:53:40 mrgency kernel:  process_one_work+0x1e6/0x3b0
Jun 18 19:53:40 mrgency kernel:  worker_thread+0x50/0x410
Jun 18 19:53:40 mrgency kernel:  ? process_one_work+0x3b0/0x3b0
Jun 18 19:53:40 mrgency kernel:  kthread+0x122/0x140
Jun 18 19:53:40 mrgency kernel:  ? __kthread_bind_mask+0x60/0x60
Jun 18 19:53:40 mrgency kernel:  ret_from_fork+0x22/0x40
Jun 18 19:53:40 mrgency kernel: Modules linked in: fuse rfcomm tun uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev
cmac algif_hash algif_skcipher af_alg bnep btusb btrtl btbcm btintel bluetooth
ecdh_generic rfkill ecc crc16 hid_steam snd_usb_audio snd_usbmidi_lib
snd_rawmidi snd_seq_device mc mousedev joydev input_leds nls_iso8859_1
nls_cp437 vfat amdgpu hid_generic wmi_bmof fat edac_mce_amd dm_mod
snd_hda_codec_realtek kvm_amd snd_hda_codec_generic snd_hda_codec_hdmi
ledtrig_audio kvm snd_hda_intel gpu_sched snd_intel_dspcfg i2c_algo_bit
irqbypass snd_hda_codec ttm crct10dif_pclmul crc32_pclmul snd_hda_core
ghash_clmulni_intel drm_kms_helper snd_hwdep snd_pcm usbhid hid cec aesni_intel
r8169 snd_timer rc_core sp5100_tco snd crypto_simd syscopyarea realtek
sysfillrect cryptd glue_helper sysimgblt pcspkr ccp libphy i2c_piix4 k10temp
soundcore fb_sys_fops tpm_crb wmi tpm_tis tpm_tis_core tpm pinctrl_amd rng_core
gpio_amdpt evdev mac_hid acpi_cpufreq drm sg crypto_user
Jun 18 19:53:40 mrgency kernel:  agpgart ip_tables x_tables btrfs
blake2b_generic libcrc32c crc32c_generic xor raid6_pq crc32c_intel xhci_pci
sr_mod cdrom xhci_hcd
Jun 18 19:53:40 mrgency kernel: ---[ end trace 28969089457f0e4d ]---
Jun 18 19:53:40 mrgency kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x24c/0x2040 [amdgpu]
Jun 18 19:53:40 mrgency kernel: Code: 8b 4f 08 8b 81 e0 02 00 00 41 ff c5 44 39
e8 0f 87 4d ff ff ff 48 83 bd 60 fd ff ff 00 0f 84 01 01 00 00 48 8b bd 60 fd
ff ff <80> bf b0 01 00 00 01 0f 86 aa 00 00 00 31 c0 48 b9 00 00 00 00 01
Jun 18 19:53:40 mrgency kernel: RSP: 0018:ffffaa9109057b70 EFLAGS: 00010202
Jun 18 19:53:40 mrgency kernel: RAX: 0000000000000006 RBX: ffff916786f2c800
RCX: ffff916a4c049800
Jun 18 19:53:40 mrgency kernel: RDX: ffff916a4c0ce800 RSI: ffffffffc14dd198
RDI: 486df9363c7dd76e
Jun 18 19:53:40 mrgency kernel: RBP: ffffaa9109057e60 R08: 0000000000000001
R09: 0000000000000001
Jun 18 19:53:40 mrgency kernel: R10: 0000000000000000 R11: 0000000000000000
R12: ffff9169ce131800
Jun 18 19:53:40 mrgency kernel: R13: 0000000000000006 R14: 0000000000000000
R15: ffff91680248b780
Jun 18 19:53:40 mrgency kernel: FS:  0000000000000000(0000)
GS:ffff916a4e9c0000(0000) knlGS:0000000000000000
Jun 18 19:53:40 mrgency kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 18 19:53:40 mrgency kernel: CR2: 000010a7e8949000 CR3: 000000028b26c000
CR4: 00000000003406e0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
