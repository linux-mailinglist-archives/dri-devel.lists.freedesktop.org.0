Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793D841DFA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 09:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77206112CE3;
	Tue, 30 Jan 2024 08:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFA010F846
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:37:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B874626BC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD71BC433F1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706603823;
 bh=NirXOuQBlKvVFsFMY09rzx6VhmnzcS0IKXUxhsgs4mQ=;
 h=From:To:Subject:Date:From;
 b=Vz94nVP23L+xEDU/4s71UJy/iz+PvR3EuJhOAlOenxpHBYZ6CFG7RVMDG0oPS7RuA
 tzFVqOpgstfI2gRaLLycv/lcTCibkbS5aext4aTbAH63UsXfAn3H74zwibm/9oxL7U
 Zw0Tvcejy8vRA2THZl6CRvcMSO7gFOheTvF7PTtjHaoUGD986axNpkbI3UfaSkAJbg
 Cr3Xh9x/JS7osjxYhvbSmv3Ou6CDg7wm3zJSru0pihPcwirlI7tmsAutVu121J4ja9
 SvtpwB03R+gjYzQRHLeHvm/3inU4OBcmomo5SzsVAFtp2lleSCURsbWiJWyd43dM6f
 p51KM+CFKHSWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B3DD0C53BD0; Tue, 30 Jan 2024 08:37:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218435] New: UBSAN: array-index-out-of-bounds in
 radeon_atombios.c:2620:43
Date: Tue, 30 Jan 2024 08:37:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Sergey.Belyashov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218435-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218435

            Bug ID: 218435
           Summary: UBSAN: array-index-out-of-bounds in
                    radeon_atombios.c:2620:43
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: Sergey.Belyashov@gmail.com
        Regression: No

Created attachment 305789
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305789&action=3Dedit
Kernel config

Part of kernel log:
...
[    2.391350] ATOM BIOS: 87829JEB.SGH
[    2.391375] radeon 0000:01:00.0: VRAM: 1024M 0x0000000000000000 -
0x000000003FFFFFFF (1024M used)
[    2.391379] radeon 0000:01:00.0: GTT: 1024M 0x0000000040000000 -
0x000000007FFFFFFF
[    2.391383] [drm] Detected VRAM RAM=3D1024M, BAR=3D256M
[    2.391384] [drm] RAM width 128bits DDR
[    2.391471] [drm] radeon: 1024M of VRAM memory ready
[    2.391474] [drm] radeon: 1024M of GTT memory ready.
[    2.391487] [drm] Loading RV730 Microcode
[    2.391827] [drm] Internal thermal controller with fan control
[    2.391829]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[    2.391835] fbcon: Taking over console
[    2.391840] UBSAN: array-index-out-of-bounds in
/build/linux-hwe-6.5-BV4m5T/linux-hwe-6.5-6.5.0/drivers/gpu/drm/radeon/rade=
on_atombios.c:2620:43
[    2.391847] index 1 is out of range for type 'UCHAR [1]'
[    2.391850] CPU: 0 PID: 113 Comm: systemd-udevd Tainted: G          I=20=
=20=20=20=20=20=20
6.5.0-15-generic #15~22.04.1-Ubuntu
[    2.391853] Hardware name: Dell Inc. OptiPlex 380                 /0HN7X=
N,
BIOS A07 06/13/2012
[    2.391855] Call Trace:
[    2.391857]  <TASK>
[    2.391861]  dump_stack_lvl+0x48/0x70
[    2.391868]  dump_stack+0x10/0x20
[    2.391871]  __ubsan_handle_out_of_bounds+0xc6/0x110
[    2.391877]  radeon_atombios_parse_power_table_4_5+0x3c6/0x3e0 [radeon]
[    2.392018]  radeon_atombios_get_power_modes+0x205/0x210 [radeon]
[    2.392099]  radeon_pm_init_dpm+0x8e/0x2f0 [radeon]
[    2.392202]  radeon_pm_init+0xdf/0x120 [radeon]
[    2.392304]  rv770_init+0x1fa/0x3d0 [radeon]
[    2.392406]  radeon_device_init+0x57e/0xaf0 [radeon]
[    2.392485]  radeon_driver_load_kms+0xcc/0x300 [radeon]
[    2.392565]  drm_dev_register+0x10e/0x240 [drm]
[    2.392652]  radeon_pci_probe+0xec/0x180 [radeon]
[    2.392730]  local_pci_probe+0x47/0xb0
[    2.392734]  pci_call_probe+0x55/0x190
[    2.392737]  pci_device_probe+0x84/0x120
[    2.392740]  really_probe+0x1cc/0x430
[    2.392743]  __driver_probe_device+0x8c/0x190
[    2.392746]  driver_probe_device+0x24/0xd0
[    2.392748]  __driver_attach+0x10b/0x210
[    2.392750]  ? __pfx___driver_attach+0x10/0x10
[    2.392753]  bus_for_each_dev+0x8d/0xf0
[    2.392757]  driver_attach+0x1e/0x30
[    2.392760]  bus_add_driver+0x127/0x240
[    2.392763]  driver_register+0x5e/0x130
[    2.392766]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[    2.392843]  __pci_register_driver+0x62/0x70
[    2.392846]  radeon_module_init+0x4c/0xff0 [radeon]
[    2.392924]  do_one_initcall+0x5e/0x340
[    2.392929]  do_init_module+0x68/0x260
[    2.392933]  load_module+0xb85/0xcd0
[    2.392937]  ? security_kernel_post_read_file+0x75/0x90
[    2.392940]  ? security_kernel_post_read_file+0x75/0x90
[    2.392943]  init_module_from_file+0x96/0x100
[    2.392946]  ? init_module_from_file+0x96/0x100
[    2.392950]  idempotent_init_module+0x11c/0x2b0
[    2.392954]  __x64_sys_finit_module+0x64/0xd0
[    2.392958]  do_syscall_64+0x5b/0x90
[    2.392961]  ? do_syscall_64+0x67/0x90
[    2.392964]  ? do_syscall_64+0x67/0x90
[    2.392966]  ? do_syscall_64+0x67/0x90
[    2.392969]  ? sysvec_call_function_single+0x4b/0xd0
[    2.392972]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[    2.392977] RIP: 0033:0x7ff88150588d
[    2.392984] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
[    2.392986] RSP: 002b:00007ffef9db25b8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    2.392990] RAX: ffffffffffffffda RBX: 00005590544f1df0 RCX:
00007ff88150588d
[    2.392992] RDX: 0000000000000000 RSI: 00007ff88169d441 RDI:
0000000000000016
[    2.392993] RBP: 0000000000020000 R08: 0000000000000000 R09:
0000000000000002
[    2.392995] R10: 0000000000000016 R11: 0000000000000246 R12:
00007ff88169d441
[    2.392997] R13: 00005590544f4030 R14: 00005590544f5c10 R15:
00005590544f6ff0
[    2.392999]  </TASK>
[    2.393021]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[    2.394165] [drm] radeon: dpm initialized
[    2.395090] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    2.425952] [drm] PCIE GART of 1024M enabled (table at 0x000000000014C00=
0).
[    2.426006] radeon 0000:01:00.0: WB enabled
[    2.426010] radeon 0000:01:00.0: fence driver on ring 0 use gpu addr
0x0000000040000c00
[    2.426013] radeon 0000:01:00.0: fence driver on ring 3 use gpu addr
0x0000000040000c0c
[    2.426407] radeon 0000:01:00.0: fence driver on ring 5 use gpu addr
0x000000000005c598
[    2.426511] radeon 0000:01:00.0: radeon: MSI limited to 32-bit
[    2.426574] radeon 0000:01:00.0: radeon: using MSI.
[    2.426602] [drm] radeon: irq initialized.
[    2.472785] [drm] ring test on 0 succeeded in 1 usecs
[    2.472794] [drm] ring test on 3 succeeded in 2 usecs
[    2.657384] [drm] ring test on 5 succeeded in 1 usecs
[    2.657397] [drm] UVD initialized successfully.
[    2.657674] [drm] ib test on ring 0 succeeded in 0 usecs
[    2.657692] [drm] ib test on ring 3 succeeded in 0 usecs
...

Hardware:
- Dell Optiplex 380
- Radeon HD 4670
- 8 GB RAM
- Intel Core 2 Duo CPU E8400 3.00GHz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
