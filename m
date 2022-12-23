Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5B654E40
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 10:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F3410E62A;
	Fri, 23 Dec 2022 09:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E27210E62A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 09:18:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 628CC61EB3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 09:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97ECBC43444
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671787071;
 bh=eDplJ0rSuzjKXMwDx7Jei4ofVvyUNM4QzSb0rWCGQ8M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RGHGN6SClI0tmyPlRJYfWORbUmlQlq67p1zBCe4+KzVbRSDXTdPBiB5aTfl1w03c3
 hkwNAQ3klihwOW1sUnB9w8KYw4zTYgWEuKmiELLIrBYWrMcJpxpIqmjn5OPuERts0g
 bKXOd0LDEU3BJRM7vGv1tJYs3DizC3MXWdzja5w7HYSdsyY79rxdkS2nLG7WoyEkLc
 fZnXKxRO/jF9fm+Nn9oXGyyD9Xc0RyJQ3KUhGojtKx93vK1xW8EOuMobz8oN5FB+UB
 9Daj//C/vFCAePukL5Pm+T28g2ZDGYwFVYQoh+tREu+iP66124k+T0KB0WeVgGAhEZ
 l3iqLKOVAI1Uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 88405C43144; Fri, 23 Dec 2022 09:17:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Fri, 23 Dec 2022 09:17:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: doesnotcompete@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204181-2300-AKf6ebvCVU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204181

doesnotcompete@posteo.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |doesnotcompete@posteo.de

--- Comment #69 from doesnotcompete@posteo.de ---
Hello, I'm encountering a similar regression on the 6.1.1 kernel (not prese=
nt
in this form on 6.0.12, although the system occasionally freezes as well). =
When
connecting a Thinkpad USB-C Dock with two monitors to my Ryzen 3500U Thinkp=
ad,
the system freezes with a null-pointer dereference in amdgpu.

Kernel: Linux version 6.1.1-arch1-1 (linux@archlinux) (gcc (GCC) 12.2.0, GN=
U ld
(GNU Binutils) 2.39.0) #1 SMP PREEMPT_DYNAMIC Wed, 21 Dec 2022 22:27:55 +00=
00

Graphics controller: Advanced Micro Devices, Inc. [AMD/ATI] Picasso/Raven 2
[Radeon Vega Series / Radeon Vega Mobile Series] (rev d2)

Output from journalctl:
Dec 23 09:42:29 kevin-t495 kernel: usb 2-1.3.3: New USB device found,
idVendor=3D17ef, idProduct=3Da395, bcdDevice=3D60.70
Dec 23 09:42:29 kevin-t495 kernel: usb 2-1.3.3: New USB device strings: Mfr=
=3D10,
Product=3D11, SerialNumber=3D0
Dec 23 09:42:29 kevin-t495 kernel: usb 2-1.3.3: Product: USB2.0 Hub
Dec 23 09:42:29 kevin-t495 kernel: usb 2-1.3.3: Manufacturer: Lenovo
Dec 23 09:42:29 kevin-t495 kernel: [drm] Downstream port present 1, type 2
Dec 23 09:42:29 kevin-t495 kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
Dec 23 09:42:29 kevin-t495 kernel: #PF: supervisor read access in kernel mo=
de
Dec 23 09:42:29 kevin-t495 kernel: #PF: error_code(0x0000) - not-present pa=
ge
Dec 23 09:42:29 kevin-t495 kernel: PGD 0 P4D 0=20
Dec 23 09:42:29 kevin-t495 kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
Dec 23 09:42:29 kevin-t495 kernel: CPU: 4 PID: 998 Comm: sway Not tainted
6.1.1-arch1-1 #1 9bd09188b430be630e611f984454e4f3c489be77
Dec 23 09:42:29 kevin-t495 kernel: Hardware name: LENOVO 20NKS01Y00/20NKS01=
Y00,
BIOS R12ET61W(1.31 ) 07/28/2022
Dec 23 09:42:29 kevin-t495 kernel: RIP:
0010:drm_dp_atomic_find_time_slots+0x61/0x2a0 [drm_display_helper]
Dec 23 09:42:29 kevin-t495 kernel: Code: 00 00 00 48 8b 85 60 05 00 00 48 6=
3 80
88 00 00 00 3b 43 28 0f 8d ce 01 00 00 48 8b 53 30 48 8d 04 80 48 8d 04 c2 =
48
8b 40 18 <48> 8b 40 08 4d 8d 65 38 8b 88 90 00 00 00 b8 01 00 00 00 d3 e0 41
Dec 23 09:42:29 kevin-t495 kernel: RSP: 0018:ffffa526c0eef780 EFLAGS: 00010=
293
Dec 23 09:42:29 kevin-t495 kernel: RAX: 0000000000000000 RBX: ffff9555ef407=
200
RCX: 0000000000000214
Dec 23 09:42:29 kevin-t495 kernel: RDX: ffff9555c4124800 RSI: ffff9555429ba=
540
RDI: ffff9555ef407200
Dec 23 09:42:29 kevin-t495 kernel: RBP: ffff9555cfc76000 R08: 0000000000000=
001
R09: ffff9555c4242050
Dec 23 09:42:29 kevin-t495 kernel: R10: ffffa526c0eef8a0 R11: 000000004cb50=
5a0
R12: 026d60dce16e8423
Dec 23 09:42:29 kevin-t495 kernel: R13: ffff95554cb505a0 R14: ffff9555429ba=
540
R15: 0000000000000214
Dec 23 09:42:29 kevin-t495 kernel: FS:  00007fb56378b980(0000)
GS:ffff9557f0b00000(0000) knlGS:0000000000000000
Dec 23 09:42:29 kevin-t495 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 23 09:42:29 kevin-t495 kernel: CR2: 0000000000000008 CR3: 000000010ae2a=
000
CR4: 00000000003506e0
Dec 23 09:42:29 kevin-t495 kernel: Call Trace:
Dec 23 09:42:29 kevin-t495 kernel:  <TASK>
Dec 23 09:42:29 kevin-t495 kernel:=20
compute_mst_dsc_configs_for_link+0x31d/0x9d0 [amdgpu
895e2b3772442c7d04dbf61a65c8a3690bb074b6]
Dec 23 09:42:29 kevin-t495 kernel:  ?
cm_helper_translate_curve_to_degamma_hw_format+0x5f0/0x5f0 [amdgpu
895e2b3772442c7d04dbf61a65c8a3690bb074b6]
Dec 23 09:42:29 kevin-t495 kernel:  ? fill_plane_buffer_attributes+0x355/0x=
530
[amdgpu 895e2b3772442c7d04dbf61a65c8a3690bb074b6]
Dec 23 09:42:29 kevin-t495 kernel:=20
compute_mst_dsc_configs_for_state+0x1e1/0x250 [amdgpu
895e2b3772442c7d04dbf61a65c8a3690bb074b6]
Dec 23 09:42:29 kevin-t495 kernel:  amdgpu_dm_atomic_check+0xf81/0x1230 [am=
dgpu
895e2b3772442c7d04dbf61a65c8a3690bb074b6]
Dec 23 09:42:29 kevin-t495 kernel:  drm_atomic_check_only+0x537/0xba0
Dec 23 09:42:29 kevin-t495 kernel:  drm_mode_atomic_ioctl+0x750/0xbb0
Dec 23 09:42:29 kevin-t495 kernel:  ? drm_property_add_enum+0x180/0x180
Dec 23 09:42:29 kevin-t495 kernel:  ? idr_alloc+0x3a/0x70
Dec 23 09:42:29 kevin-t495 kernel:  ? drm_atomic_set_property+0xbc0/0xbc0
Dec 23 09:42:29 kevin-t495 kernel:  drm_ioctl_kernel+0xcd/0x170
Dec 23 09:42:29 kevin-t495 kernel:  drm_ioctl+0x1eb/0x450
Dec 23 09:42:29 kevin-t495 kernel:  ? drm_atomic_set_property+0xbc0/0xbc0
Dec 23 09:42:29 kevin-t495 kernel:  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu
895e2b3772442c7d04dbf61a65c8a3690bb074b6]
Dec 23 09:42:29 kevin-t495 kernel:  __x64_sys_ioctl+0x94/0xd0
Dec 23 09:42:29 kevin-t495 kernel:  do_syscall_64+0x5f/0x90
Dec 23 09:42:29 kevin-t495 kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Dec 23 09:42:29 kevin-t495 kernel:  ? do_syscall_64+0x6b/0x90
Dec 23 09:42:29 kevin-t495 kernel:  ? do_syscall_64+0x6b/0x90
Dec 23 09:42:29 kevin-t495 kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Dec 23 09:42:29 kevin-t495 kernel:  ? do_syscall_64+0x6b/0x90
Dec 23 09:42:29 kevin-t495 kernel:  ? do_syscall_64+0x6b/0x90
Dec 23 09:42:29 kevin-t495 kernel:  entry_SYSCALL_64_after_hwframe+0x63/0xcd
Dec 23 09:42:29 kevin-t495 kernel: RIP: 0033:0x7fb5645dec0f
Dec 23 09:42:29 kevin-t495 kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 2=
4 60
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
Dec 23 09:42:29 kevin-t495 kernel: RSP: 002b:00007ffd3850b740 EFLAGS: 00000=
246
ORIG_RAX: 0000000000000010
Dec 23 09:42:29 kevin-t495 kernel: RAX: ffffffffffffffda RBX: 000055c223c95=
960
RCX: 00007fb5645dec0f
Dec 23 09:42:29 kevin-t495 kernel: RDX: 00007ffd3850b7e0 RSI: 00000000c0386=
4bc
RDI: 000000000000000d
Dec 23 09:42:29 kevin-t495 kernel: RBP: 00007ffd3850b7e0 R08: 0000000000000=
003
R09: 0000000000000003
Dec 23 09:42:29 kevin-t495 kernel: R10: 000055c222b65010 R11: 0000000000000=
246
R12: 00000000c03864bc
Dec 23 09:42:29 kevin-t495 kernel: R13: 000000000000000d R14: 000055c223c6c=
ba0
R15: 000055c223bfcab0
Dec 23 09:42:29 kevin-t495 kernel:  </TASK>
Dec 23 09:42:29 kevin-t495 kernel: Modules linked in: cdc_ether usbnet r8152
mii rfcomm snd_seq_dummy snd_hrtimer snd_seq snd_seq_device nft_objref
nf_conntrack_netbios_ns nf_conntrack_broadcast ccm cmac algif_hash
algif_skcipher af_alg nft_fib_inet nft_>
Dec 23 09:42:29 kevin-t495 kernel:  snd_pci_acp6x iwlwifi snd_pci_acp5x
snd_hda_core rapl snd_rn_pci_acp3x vfat think_lmi realtek ecdh_generic
snd_hwdep fat snd_acp_config ucsi_acpi typec_ucsi pcspkr mdio_devres psmouse
snd_soc_acpi firmware_attributes_c>
Dec 23 09:42:29 kevin-t495 kernel: CR2: 0000000000000008
Dec 23 09:42:29 kevin-t495 kernel: ---[ end trace 0000000000000000 ]---
Dec 23 09:42:29 kevin-t495 kernel: RIP:
0010:drm_dp_atomic_find_time_slots+0x61/0x2a0 [drm_display_helper]
Dec 23 09:42:29 kevin-t495 kernel: Code: 00 00 00 48 8b 85 60 05 00 00 48 6=
3 80
88 00 00 00 3b 43 28 0f 8d ce 01 00 00 48 8b 53 30 48 8d 04 80 48 8d 04 c2 =
48
8b 40 18 <48> 8b 40 08 4d 8d 65 38 8b 88 90 00 00 00 b8 01 00 00 00 d3 e0 41
Dec 23 09:42:29 kevin-t495 kernel: RSP: 0018:ffffa526c0eef780 EFLAGS: 00010=
293
Dec 23 09:42:29 kevin-t495 kernel: RAX: 0000000000000000 RBX: ffff9555ef407=
200
RCX: 0000000000000214
Dec 23 09:42:29 kevin-t495 kernel: RDX: ffff9555c4124800 RSI: ffff9555429ba=
540
RDI: ffff9555ef407200
Dec 23 09:42:29 kevin-t495 kernel: RBP: ffff9555cfc76000 R08: 0000000000000=
001
R09: ffff9555c4242050
Dec 23 09:42:29 kevin-t495 kernel: R10: ffffa526c0eef8a0 R11: 000000004cb50=
5a0
R12: 026d60dce16e8423
Dec 23 09:42:29 kevin-t495 kernel: R13: ffff95554cb505a0 R14: ffff9555429ba=
540
R15: 0000000000000214
Dec 23 09:42:29 kevin-t495 kernel: FS:  00007fb56378b980(0000)
GS:ffff9557f0b00000(0000) knlGS:0000000000000000
Dec 23 09:42:29 kevin-t495 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 23 09:42:29 kevin-t495 kernel: CR2: 0000000000000008 CR3: 000000010ae2a=
000
CR4: 00000000003506e0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
