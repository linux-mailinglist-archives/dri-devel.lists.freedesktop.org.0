Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BCDAD4F82
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 11:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE38A10E086;
	Wed, 11 Jun 2025 09:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3084 seconds by postgrey-1.36 at gabe;
 Wed, 11 Jun 2025 09:15:15 UTC
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id 6140210E086
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 09:15:15 +0000 (UTC)
Received: (qmail 9481 invoked from network); 11 Jun 2025 09:15:14 -0000
Received: from cucamonga.audible.transient.net (192.168.2.5)
 by canarsie.audible.transient.net with QMQP; 11 Jun 2025 09:15:14 -0000
Received: (nullmailer pid 3700 invoked by uid 1000);
 Wed, 11 Jun 2025 09:15:14 -0000
Date: Wed, 11 Jun 2025 09:15:14 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [REGRESSION] v6.16-rc1 nouveau NULL pointer dereference
Message-ID: <aElJIo9_Se6tAR1a@audible.transient.net>
Mail-Followup-To: Ben Skeggs <bskeggs@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

With v6.16-rc1 on my x86_64 pc with a G86 [Quadro NVS 290] I get a
kernel NULL pointer dereference when Xorg starts up and no further
video output.  I bisected the problem to commit 862450a85b85
("drm/nouveau/gf100-: track chan progress with non-WFI semaphore
release") and reverting that commit on top of v6.16-rc1 returns
functionality to normal.

Here's a abbreviated dmesg and the BUG splat, happy to provide any
other information needed / test patches:

[    3.824618] nouveau 0000:01:00.0: NVIDIA G86 (086f00a2)
[    3.927817] nouveau 0000:01:00.0: bios: version 60.86.6c.00.21
[    3.928220] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    3.928959] Console: switching to colour dummy device 80x25
[    3.949712] nouveau 0000:01:00.0: bios: M0203T not found
[    3.949720] nouveau 0000:01:00.0: bios: M0203E not matched!
[    3.949723] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[    4.331893] nouveau 0000:01:00.0: drm: VRAM: 256 MiB
[    4.331906] nouveau 0000:01:00.0: drm: GART: 1048576 MiB
[    4.331912] nouveau 0000:01:00.0: drm: TMDS table version 2.0
[    4.333420] nouveau 0000:01:00.0: drm: MM: using CRYPT for buffer copies
[    4.334408] [drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 0
[    4.398067] fbcon: nouveaudrmfb (fb0) is primary device
[    4.441353] Console: switching to colour frame buffer device 240x75
[    4.450981] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
...
[   27.798766] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   27.798774] #PF: supervisor instruction fetch in kernel mode
[   27.798777] #PF: error_code(0x0010) - not-present page
[   27.798780] PGD 0 P4D 0 
[   27.798785] Oops: Oops: 0010 [#1] SMP PTI
[   27.798789] CPU: 0 UID: 0 PID: 2247 Comm: Xorg Not tainted 6.16.0-rc1 #14 PREEMPT 
[   27.798794] Hardware name: Dell Inc. Precision WorkStation T3400  /0TP412, BIOS A14 04/30/2012
[   27.798797] RIP: 0010:0x0
[   27.798804] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   27.798806] RSP: 0018:ffffc9000092fbe8 EFLAGS: 00010202
[   27.798810] RAX: 0000000000000000 RBX: ffffc9000092fda8 RCX: 0000000000000001
[   27.798813] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff88810a9fbc00
[   27.798815] RBP: ffffc9000092fd00 R08: 0000000000000000 R09: 0000000000000000
[   27.798817] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88810a9fbc00
[   27.798820] R13: ffff8881027a2e60 R14: 0000000000000001 R15: ffff888104847e40
[   27.798822] FS:  00007fc76a1c0b00(0000) GS:ffff8882b1664000(0000) knlGS:0000000000000000
[   27.798826] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.798829] CR2: ffffffffffffffd6 CR3: 000000010631a000 CR4: 00000000000426f0
[   27.798831] Call Trace:
[   27.798834]  <TASK>
[   27.798836]  nouveau_gem_ioctl_pushbuf+0x1448/0x1660
[   27.798845]  ? nouveau_gem_ioctl_new+0x170/0x170
[   27.798848]  ? drm_ioctl_kernel+0xaa/0x100
[   27.798854]  drm_ioctl_kernel+0xaa/0x100
[   27.798859]  drm_ioctl+0x280/0x530
[   27.798864]  ? nouveau_gem_ioctl_new+0x170/0x170
[   27.798868]  nouveau_drm_ioctl+0x4e/0xb0
[   27.798874]  __x64_sys_ioctl+0x5d8/0xb10
[   27.798878]  ? handle_mm_fault+0xb3/0x1a0
[   27.798882]  ? lock_mm_and_find_vma+0x2f/0x160
[   27.798887]  do_syscall_64+0x4a/0x1d0
[   27.798893]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   27.798898] RIP: 0033:0x7fc76a5418db
[   27.798901] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   27.798905] RSP: 002b:00007fffd49b78e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   27.798910] RAX: ffffffffffffffda RBX: 00005607646e0b50 RCX: 00007fc76a5418db
[   27.798912] RDX: 00007fffd49b79a0 RSI: 00000000c0406481 RDI: 0000000000000013
[   27.798915] RBP: 00007fffd49b79a0 R08: 0000000000000000 R09: 0000000000000001
[   27.798917] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c0406481
[   27.798919] R13: 0000000000000013 R14: 000056076477e990 R15: 00005607646e1060
[   27.798923]  </TASK>
[   27.798925] Modules linked in: autofs4 fan nfsd auth_rpcgss nfs lockd grace sunrpc bridge stp llc vhost_net tun vhost vhost_iotlb tap nhpoly1305_sse2 nhpoly1305 aes_generic libaes chacha chacha_x86_64 libchacha adiantum libpoly1305_generic dm_crypt snd_hda_codec_analog snd_hda_codec_generic snd_usb_audio snd_hda_intel platform_profile dell_smbios dell_wmi_descriptor snd_intel_dspcfg snd_hda_codec dcdbas snd_usbmidi_lib snd_hda_core snd_hwdep snd_rawmidi snd_pcm kvm_intel snd_seq_device snd_timer snd kvm sr_mod soundcore cdrom irqbypass tg3 sg floppy evdev xfs dm_mod raid1 md_mod psmouse
[   27.798994] CR2: 0000000000000000
[   27.798997] ---[ end trace 0000000000000000 ]---
[   27.799000] RIP: 0010:0x0
[   27.799004] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   27.799006] RSP: 0018:ffffc9000092fbe8 EFLAGS: 00010202
[   27.799009] RAX: 0000000000000000 RBX: ffffc9000092fda8 RCX: 0000000000000001
[   27.799012] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff88810a9fbc00
[   27.799014] RBP: ffffc9000092fd00 R08: 0000000000000000 R09: 0000000000000000
[   27.799017] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88810a9fbc00
[   27.799019] R13: ffff8881027a2e60 R14: 0000000000000001 R15: ffff888104847e40
[   27.799021] FS:  00007fc76a1c0b00(0000) GS:ffff8882b1664000(0000) knlGS:0000000000000000
[   27.799025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.799027] CR2: ffffffffffffffd6 CR3: 000000010631a000 CR4: 00000000000426f0
[   27.799030] note: Xorg[2247] exited with irqs disabled



-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
