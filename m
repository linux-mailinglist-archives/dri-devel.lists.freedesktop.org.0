Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E79593077
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 16:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D3DC6208;
	Mon, 15 Aug 2022 14:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D142BC0F75
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:09:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0798F60F76
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D796C4347C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660572574;
 bh=ctFM4onR1sQAuerO5gI4WoeTr2K70v/gMX0Ory0AJR0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GNl7ad0EZMx+5lsLEG3ykFjzf4nRb1Mg5icy3+BYog/669VNTiuLxQid6igtPpAn0
 RsjjoJvsjg9JnMHheCosGRNK1n8FJtOpsqiVnlmip7giKKUpR/BDd1CAiOIn9I36rH
 A3NApQJZSczYlih4U+QnMD3MNwhvLNId+9vLP3QJ7B7QYJF/TC9zpzNf7WN4oL8doM
 nwPMZoDkYjTJ4OIAMoFeWzOODtP42DLAxzWfog8nUCf1fb7y6QKz2lhV8TBlv2y752
 IiLX9u0pqWsyIlXebhCIjV0gJKbBLgtOz1cPoIWn8SGlu785XBZjOv7ZSus4T6efnl
 TTnsuFQV+ht4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5CED3C433E4; Mon, 15 Aug 2022 14:09:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Mon, 15 Aug 2022 14:09:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216143-2300-mrsyUiEMpq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301573
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301573&action=3Dedit
kernel dmesg (kernel 6.0-rc1, AMD Ryzen 9 5950X)

No change with v6-0-rc1.
[...]
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling =
-22!
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!
[...]

Additionally I get:
[...]
------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 7 PID: 2120 at lib/refcount.c:28 refcount_warn_saturate+0x93/=
0xf0
Modules linked in: rfkill dm_crypt nhpoly1305_avx2 nhpoly1305 aes_generic
aesni_intel libaes crypto_simd cryptd chacha_generic chacha_x86_64 libchacha
adiantum libpoly1305 algif_skcipher joydev input_leds hid_generic usbhid hid
ext4 mbcache crc16 jbd2 sr_mod amdgpu cdrom snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio dm_mod led_class mfd_core
snd_hda_codec_hdmi drm_buddy r8169 gpu_sched evdev wmi_bmof drm_ttm_helper
snd_hda_intel ttm snd_intel_dspcfg realtek i2c_algo_bit snd_hda_codec
drm_display_helper snd_hwdep mdio_devres drm_kms_helper snd_hda_core sysimg=
blt
syscopyarea snd_pcm sysfillrect libphy fb_sys_fops xhci_pci snd_timer ahci
xhci_hcd snd libahci soundcore usbcore libata k10temp usb_common i2c_piix4
gpio_amdpt gpio_generic button pkcs8_key_parser nct6775 hwmon_vid nct6775_c=
ore
wmi hwmon zram zsmalloc amd_pstate drm fuse drm_panel_orientation_quirks
backlight configfs efivarfs
CPU: 7 PID: 2120 Comm: X:cs0 Not tainted 6.0.0-rc1-Zen3 #1
Hardware name: To Be Filled By O.E.M. B450M Steel Legend/B450M Steel Legend,
BIOS P4.30 02/25/2022
RIP: 0010:refcount_warn_saturate+0x93/0xf0
Code: c7 c7 6d 4b e9 b2 e8 cc 13 bf ff 0f 0b c3 80 3d 5b fe da 00 00 75 af =
c6
05 52 fe da 00 01 48 c7 c7 ad 45 ea b2 e8 ad 13 bf ff <0f> 0b c3 80 3d 39 f=
e da
00 00 75 90 c6 05 30 fe da 00 01 48 c7 c7
RSP: 0018:ffffbc8ac1b7fb38 EFLAGS: 00010246
RAX: d8250f016f21c100 RBX: 0000000000000038 RCX: 0000000000000027
RDX: 00000000ffffbfff RSI: 0000000000000004 RDI: ffffa0db5ebd71c8
RBP: 0000000000000003 R08: 0000000000000000 R09: ffffa0db5e8a0000
R10: 0000000000000419 R11: 0000000000000000 R12: 00000000aaaaaaaa
R13: ffffa0d4f3e20000 R14: ffffa0d5a62ccc00 R15: 0000000000000003
FS:  00007f879006c640(0000) GS:ffffa0db5ebc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563c67cfb000 CR3: 00000002c3938000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 amdgpu_cs_ioctl+0x498/0xdd0 [amdgpu]
 ? amdgpu_cs_report_moved_bytes+0x60/0x60 [amdgpu]
 drm_ioctl_kernel+0xdb/0x150 [drm]
 drm_ioctl+0x301/0x440 [drm]
 ? amdgpu_cs_report_moved_bytes+0x60/0x60 [amdgpu]
 amdgpu_drm_ioctl+0x42/0x80 [amdgpu]
 __se_sys_ioctl+0x72/0xc0
 do_syscall_64+0x6a/0x90
 ? do_user_addr_fault+0x2da/0x410
 ? exc_page_fault+0x5f/0x90
 entry_SYSCALL_64_after_hwframe+0x4b/0xb5
RIP: 0033:0x7f879b42496b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 =
24
08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 f=
f ff
77 1b 48 8b 44 24 18 64 48 2b 04 25 28 00
RSP: 002b:00007f879006b590 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000c0186444 RCX: 00007f879b42496b
RDX: 00007f879006b8a8 RSI: 00000000c0186444 RDI: 000000000000000d
RBP: 00007f879006b8e0 R08: 00007f879006b970 R09: 0000000000000003
R10: 0000560b4e0cdc40 R11: 0000000000000246 R12: 000000000000000d
R13: 0000560b4e175968 R14: 0000000000000000 R15: 00007f879006b8a8
 </TASK>
---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
