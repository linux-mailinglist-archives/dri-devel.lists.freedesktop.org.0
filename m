Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008B9407F0E
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 19:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B84E6E042;
	Sun, 12 Sep 2021 17:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8516E042
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 17:48:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 19E3361050
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 17:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631468924;
 bh=v0oOrgs5HiyZjmJNcap3Cwe7ac8gDPDbyMIOiXF9Ckc=;
 h=From:To:Subject:Date:From;
 b=lyy7KoLu/99VXBpLitY5TzgChz0YzzupJ36rF8lJnwEPeRQCgq0JnL2HeTpmIBUWi
 YtV+vdwGQnBckj24KgcLg75ItoBOs03WykI/RXQDzT3TDyldR+PmimGqELIBYaFTl2
 KMr8xhhpRK/MQHD76Zrto1h/iQnd4LzjDL2bqktWGgk/uKqi95xMkSGFdQNCl51+YN
 zb9KjuuvJFK1VPXI8M1EzZrzAnT0qKiFwlO/RFo8q0kpC7oAC8n9zkVEUt+Xl5WYSo
 pBb009/amh3dc+ouQirNKWmHzzaoCfiftOTK3wVeLss6Vnzgm1lL95yiG0fuX30rB0
 /y9bNhDwtXFUg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0D33560F44; Sun, 12 Sep 2021 17:48:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214375] New: 5.14 Regression: Null pointer dereference in
 radeon_agp_head_init
Date: Sun, 12 Sep 2021 17:48:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: calvin.walton@kepstin.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214375-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214375

            Bug ID: 214375
           Summary: 5.14 Regression: Null pointer dereference in
                    radeon_agp_head_init
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: calvin.walton@kepstin.ca
        Regression: No

Created attachment 298753
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298753&action=3Dedit
Complete kernel dmesg

I have an i586 system (ALi chipset, AMD CPU) running with a Radeon 9200 SE =
in
an AGP slot. This system was working correctly with the 5.13 kernel series,=
 but
after switching to 5.14 I no longer have kms graphics output.

The radeon module fails to initialize with the following backtrace:

Sep 12 13:15:53 mai kernel: [drm] radeon kernel modesetting enabled.
Sep 12 13:15:53 mai kernel: radeon 0000:01:00.0: vgaarb: deactivate vga con=
sole
Sep 12 13:15:53 mai kernel: Console: switching to colour dummy device 80x25
Sep 12 13:15:53 mai kernel: BUG: kernel NULL pointer dereference, address:
00000008
Sep 12 13:15:53 mai kernel: #PF: supervisor read access in kernel mode
Sep 12 13:15:53 mai kernel: #PF: error_code(0x0000) - not-present page
Sep 12 13:15:53 mai kernel: *pde =3D 00000000=20
Sep 12 13:15:53 mai kernel: Oops: 0000 [#1]
Sep 12 13:15:53 mai kernel: CPU: 0 PID: 288 Comm: systemd-udevd Tainted: G=
=20=20=20=20=20
  W         5.14.2 #2
Sep 12 13:15:53 mai kernel: Hardware name: American Megatrends Inc.=20=20=
=20=20=20=20=20=20
Uknown                          /PT-2200                         , BIOS 062=
710=20=20
Sep 12 13:15:53 mai kernel: EIP: radeon_agp_head_init+0xa/0xa0 [radeon]
Sep 12 13:15:53 mai kernel: Code: 85 fb fe ff 74 d6 84 c9 74 d6 84 c9 ff ff=
 e9
f7 ff ff e9 f7 90 66 90 66 90 66 90 66 55 ba c0 0d 55 ba c0 0d 56 53 8b 70 =
56
53 <8b> 70 6>
Sep 12 13:15:53 mai kernel: EAX: 00000000 EBX: b3978c00 ECX: b3a21ce8 EDX:
00000dc0
Sep 12 13:15:53 mai kernel: ESI: b493e000 EDI: b1cad000 EBP: b3a21cf8 ESP:
b3a21cf0
Sep 12 13:15:53 mai kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
EFLAGS: 00210202
Sep 12 13:15:53 mai kernel: CR0: 80050033 CR2: 00000008 CR3: 03f86000 CR4:
00000090
Sep 12 13:15:53 mai kernel: Call Trace:
Sep 12 13:15:53 mai kernel:  radeon_driver_load_kms+0x168/0x1a0 [radeon]
Sep 12 13:15:53 mai kernel:  drm_dev_register+0xb5/0x1a0 [drm]
Sep 12 13:15:53 mai kernel:  radeon_pci_probe+0xa1/0xe0 [radeon]
Sep 12 13:15:53 mai kernel:  pci_device_probe+0x88/0x100
Sep 12 13:15:53 mai kernel:  really_probe.part.0+0x78/0x220
Sep 12 13:15:53 mai kernel:  __driver_probe_device+0x7e/0x100
Sep 12 13:15:53 mai kernel:  driver_probe_device+0x19/0xe0
Sep 12 13:15:53 mai kernel:  __driver_attach+0x81/0x140
Sep 12 13:15:53 mai kernel:  ? __device_attach_driver+0xe0/0xe0
Sep 12 13:15:53 mai kernel:  bus_for_each_dev+0x47/0x80
Sep 12 13:15:53 mai kernel:  driver_attach+0x17/0x20
Sep 12 13:15:53 mai kernel:  ? __device_attach_driver+0xe0/0xe0
Sep 12 13:15:53 mai kernel:  bus_add_driver+0xec/0x1a0
Sep 12 13:15:53 mai kernel:  driver_register+0x74/0xc0
Sep 12 13:15:53 mai kernel:  ? 0xf0e5f000
Sep 12 13:15:53 mai kernel:  __pci_register_driver+0x37/0x40
Sep 12 13:15:53 mai kernel:  radeon_module_init+0x65/0x1000 [radeon]
Sep 12 13:15:53 mai kernel:  do_one_initcall+0x33/0x120
Sep 12 13:15:53 mai kernel:  ? kfree+0x151/0x160
Sep 12 13:15:53 mai kernel:  ? __vunmap+0x1d5/0x260
Sep 12 13:15:53 mai kernel:  ? kmem_cache_alloc+0x10a/0x160
Sep 12 13:15:53 mai kernel:  do_init_module+0x45/0x240
Sep 12 13:15:53 mai kernel:  load_module+0x1cc3/0x2020
Sep 12 13:15:53 mai kernel:  ? 0xf0e5f000
Sep 12 13:15:53 mai kernel:  __ia32_sys_finit_module+0x89/0xc0
Sep 12 13:15:53 mai kernel:  do_int80_syscall_32+0x2e/0x80
Sep 12 13:15:53 mai kernel:  entry_INT80_32+0x109/0x109
Sep 12 13:15:53 mai kernel: EIP: 0xa7b66332
Sep 12 13:15:53 mai kernel: Code: 90 66 90 66 90 66 90 90 55 57 56 53 8b 6c=
 24
2c 8b 7c 24 28 8b 74 24 24 8b 54 24 20 8b 4c 24 1c 8b 5c 24 18 8b 44 24 14 =
cd
80 <5b> 5e 5>
Sep 12 13:15:53 mai kernel: EAX: ffffffda EBX: 00000016 ECX: a7cbfb05 EDX:
00000000
Sep 12 13:15:53 mai kernel: ESI: 02068a50 EDI: 020677c0 EBP: ffffffff ESP:
affc0fcc
Sep 12 13:15:53 mai kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
EFLAGS: 00200292
Sep 12 13:15:53 mai kernel: Modules linked in: r8169 radeon(+) realtek
mdio_devres libphy snd_emu10k1 snd_ac97_codec ac97_bus snd_util_mem
i2c_algo_bit snd_hwdep drm_ttm>
Sep 12 13:15:53 mai kernel: CR2: 0000000000000008
Sep 12 13:15:53 mai kernel: ---[ end trace d1e7fe80690cc5a8 ]---
Sep 12 13:15:53 mai kernel: EIP: radeon_agp_head_init+0xa/0xa0 [radeon]
Sep 12 13:15:53 mai kernel: Code: 85 fb fe ff 74 d6 84 c9 74 d6 84 c9 ff ff=
 e9
f7 ff ff e9 f7 90 66 90 66 90 66 90 66 55 ba c0 0d 55 ba c0 0d 56 53 8b 70 =
56
53 <8b> 70 6>
Sep 12 13:15:53 mai kernel: EAX: 00000000 EBX: b3978c00 ECX: b3a21ce8 EDX:
00000dc0
Sep 12 13:15:53 mai kernel: ESI: b493e000 EDI: b1cad000 EBP: b3a21cf8 ESP:
b3a21cf0
Sep 12 13:15:53 mai kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
EFLAGS: 00210202
Sep 12 13:15:53 mai kernel: CR0: 80050033 CR2: 00000008 CR3: 03f86000 CR4:
00000090

It looks like this issue should be easy to bisect, but the system is pretty
slow, so that will take a while. Please let me know if there are any other =
logs
or debug options that you would like me to try. I've attached the full kern=
el
boot log from the boot that this backtrace was taken from.

Note that although I'm running Gentoo, I am using an unpatched upstream ker=
nel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
