Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C54944B12
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A15110E18D;
	Thu,  1 Aug 2024 12:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oF0/9To/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9F110E18D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85DBC626EE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B02DC4AF09
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722514480;
 bh=VmOb2j4+TvaNKz1MJ47GvCaxwu1ON52rdaAdKxAvtMs=;
 h=From:To:Subject:Date:From;
 b=oF0/9To/XRU9Ta16a5DZTkSFcUjzO3wgk7i3XRIvcDEzjHVxkGgmGj3k4Od20VMp6
 alQfarRuf2SH6TtdZcghKigitPFLpl5y9sdQaSThX49kta4yYDMqewH+2dtA4CEJol
 xW/WaSMwyCnr6bbbgPQJ/W7A9ZAMVJce9g7UyPSTiBKNMuy0H3HsSBAqd0Xb3dVCAQ
 uQnowVc1B/wZsXwDLpsl2RKpEl6dOpRJ6L7jxeTPg6WnlcgPkA38WR1kv4gl1vvv6+
 J6F7p4l05MyV7mB+EicxBAoKXZ8xMSAwq/jpdeKcCvvVjaDkoEvKPaEXvsNR7uQkIp
 71J3LlrWQtKgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2A49FC53B50; Thu,  1 Aug 2024 12:14:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219117] New: amdgpu: amdgpu_device_ip_init failed
Date: Thu, 01 Aug 2024 12:14:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression cf_bisect_commit
Message-ID: <bug-219117-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219117

            Bug ID: 219117
           Summary: amdgpu: amdgpu_device_ip_init failed
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.11.0-rc1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jean-christophe@guillain.net
        Regression: Yes
           Bisected 064d92436b6924937ef414894d9174fa4465f788
         commit-id:

Hello !

Since the last kernel RC (6.11-rc1), the boot process hangs on my computer
after a GPU error :

Jul 30 10:18:10 youpi kernel: amdgpu 0000:00:01.0: [drm:amdgpu_ring_test_he=
lper
[amdgpu]] *ERROR* ring gfx test failed (-110)
Jul 30 10:18:10 youpi kernel: [drm:amdgpu_device_init [amdgpu]] *ERROR* hw_=
init
of IP block <gfx_v8_0> failed -110
Jul 30 10:18:10 youpi kernel: amdgpu 0000:00:01.0: amdgpu:
amdgpu_device_ip_init failed
Jul 30 10:18:10 youpi kernel: amdgpu 0000:00:01.0: amdgpu: Fatal error duri=
ng
GPU init
Jul 30 10:18:10 youpi kernel: amdgpu 0000:00:01.0: amdgpu: amdgpu: finishing
device.
Jul 30 10:18:10 youpi kernel: ------------[ cut here ]------------
Jul 30 10:18:10 youpi kernel: WARNING: CPU: 0 PID: 186 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:631 amdgpu_irq_put+0x45/0x70 [amdgp=
u]
Jul 30 10:18:10 youpi kernel: Modules linked in: sd_mod usbhid uas hid
usb_storage amdgpu(+) amdxcp drm_exec gpu_sched drm_buddy i2c_algo_bit
drm_suballoc_helper drm>
Jul 30 10:18:10 youpi kernel: CPU: 0 UID: 0 PID: 186 Comm: (udev-worker) Not
tainted 6.11.0-rc1-jcg+ #1
Jul 30 10:18:10 youpi kernel: Hardware name: LENOVO 10VGS02P00/3130, BIOS
M1XKT57A 02/10/2022
Jul 30 10:18:10 youpi kernel: RIP: 0010:amdgpu_irq_put+0x45/0x70 [amdgpu]
Jul 30 10:18:10 youpi kernel: Code: 48 8b 4e 10 48 83 39 00 74 2c 89 d1 48 =
8d
04 88 8b 08 85 c9 74 14 f0 ff 08 b8 00 00 00 00 74 05 e9 50 c5 f7 d8 e9 6b =
fd
ff ff <0f>
Jul 30 10:18:10 youpi kernel: RSP: 0018:ffffaf1480677940 EFLAGS: 00010246
Jul 30 10:18:10 youpi kernel: RAX: ffff94f286417540 RBX: ffff94f285818880 R=
CX:
0000000000000000
Jul 30 10:18:10 youpi kernel: RDX: 0000000000000000 RSI: ffff94f2858254c0 R=
DI:
ffff94f285800000
Jul 30 10:18:10 youpi kernel: RBP: ffff94f285810208 R08: 0000000000000002 R=
09:
0000000000000003
Jul 30 10:18:10 youpi kernel: R10: ffffaf1480677768 R11: ffffffff9a4c96c8 R=
12:
ffff94f2858105e8
Jul 30 10:18:10 youpi kernel: R13: ffff94f285800010 R14: ffff94f285800000 R=
15:
ffff94f2858254c0
Jul 30 10:18:10 youpi kernel: FS:  00007f03450bb8c0(0000)
GS:ffff94f317600000(0000) knlGS:0000000000000000
Jul 30 10:18:10 youpi kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jul 30 10:18:10 youpi kernel: CR2: 00007f03450b2028 CR3: 00000001458d8000 C=
R4:
00000000001506f0
Jul 30 10:18:10 youpi kernel: Call Trace:
Jul 30 10:18:10 youpi kernel:  <TASK>
Jul 30 10:18:10 youpi kernel:  ? __warn+0x7c/0x120
Jul 30 10:18:10 youpi kernel:  ? amdgpu_irq_put+0x45/0x70 [amdgpu]
Jul 30 10:18:10 youpi kernel:  ? report_bug+0x155/0x170
Jul 30 10:18:10 youpi kernel:  ? handle_bug+0x3f/0x80
Jul 30 10:18:10 youpi kernel:  ? exc_invalid_op+0x13/0x60
Jul 30 10:18:10 youpi kernel:  ? asm_exc_invalid_op+0x16/0x20
Jul 30 10:18:10 youpi kernel:  ? amdgpu_irq_put+0x45/0x70 [amdgpu]
Jul 30 10:18:10 youpi kernel:  amdgpu_fence_driver_hw_fini+0xfa/0x130 [amdg=
pu]
Jul 30 10:18:10 youpi kernel:  amdgpu_device_fini_hw+0xa2/0x3f0 [amdgpu]
Jul 30 10:18:10 youpi kernel:  amdgpu_driver_load_kms+0x79/0xb0 [amdgpu]
Jul 30 10:18:10 youpi kernel:  amdgpu_pci_probe+0x195/0x520 [amdgpu]
Jul 30 10:18:10 youpi kernel:  local_pci_probe+0x41/0x90
Jul 30 10:18:10 youpi kernel:  pci_device_probe+0xbb/0x1e0
Jul 30 10:18:10 youpi kernel:  really_probe+0xd6/0x390
Jul 30 10:18:10 youpi kernel:  ? __pfx___driver_attach+0x10/0x10
Jul 30 10:18:10 youpi kernel:  __driver_probe_device+0x78/0x150
Jul 30 10:18:10 youpi kernel:  driver_probe_device+0x1f/0x90
Jul 30 10:18:10 youpi kernel:  __driver_attach+0xce/0x1c0
Jul 30 10:18:10 youpi kernel:  bus_for_each_dev+0x84/0xd0
Jul 30 10:18:10 youpi kernel:  bus_add_driver+0x10e/0x240
Jul 30 10:18:10 youpi kernel:  driver_register+0x55/0x100
Jul 30 10:18:10 youpi kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
Jul 30 10:18:10 youpi kernel:  do_one_initcall+0x57/0x320
Jul 30 10:18:10 youpi kernel:  do_init_module+0x60/0x230
Jul 30 10:18:10 youpi kernel:  init_module_from_file+0x86/0xc0
Jul 30 10:18:10 youpi kernel:  idempotent_init_module+0x11b/0x2b0
Jul 30 10:18:10 youpi kernel:  __x64_sys_finit_module+0x5a/0xb0
Jul 30 10:18:10 youpi kernel:  do_syscall_64+0x7e/0x190
Jul 30 10:18:10 youpi kernel:  ? syscall_exit_to_user_mode+0xc/0x1d0
Jul 30 10:18:10 youpi kernel:  ? do_syscall_64+0x8a/0x190
Jul 30 10:18:10 youpi kernel:  ? do_syscall_64+0x8a/0x190
Jul 30 10:18:10 youpi kernel:  ? syscall_exit_to_user_mode+0xc/0x1d0
Jul 30 10:18:10 youpi kernel:  ? do_syscall_64+0x8a/0x190
Jul 30 10:18:10 youpi kernel:  ? syscall_exit_to_user_mode+0xc/0x1d0
Jul 30 10:18:10 youpi kernel:  ? do_syscall_64+0x8a/0x190
Jul 30 10:18:10 youpi kernel:  ? do_syscall_64+0x8a/0x190
Jul 30 10:18:10 youpi kernel:  ? do_syscall_64+0x8a/0x190
Jul 30 10:18:10 youpi kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Jul 30 10:18:10 youpi kernel: RIP: 0033:0x7f0344f0f719
Jul 30 10:18:10 youpi kernel: Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 =
00
00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08
0f 05 <48>
Jul 30 10:18:10 youpi kernel: RSP: 002b:00007ffcfd2cf3e8 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Jul 30 10:18:10 youpi kernel: RAX: ffffffffffffffda RBX: 000055e7ba5a8370 R=
CX:
00007f0344f0f719
Jul 30 10:18:10 youpi kernel: RDX: 0000000000000000 RSI: 00007f03450b3efd R=
DI:
0000000000000017
Jul 30 10:18:10 youpi kernel: RBP: 00007f03450b3efd R08: 0000000000000000 R=
09:
000055e7ba58a1d0
Jul 30 10:18:10 youpi kernel: R10: 0000000000000017 R11: 0000000000000246 R=
12:
0000000000020000
Jul 30 10:18:10 youpi kernel: R13: 0000000000000000 R14: 000055e7ba5a6f20 R=
15:
00007ffcfd2cf620
Jul 30 10:18:10 youpi kernel:  </TASK>
Jul 30 10:18:10 youpi kernel: ---[ end trace 0000000000000000 ]---
Jul 30 10:18:10 youpi kernel: ------------[ cut here ]------------



I bisected this issue to the commit :
[064d92436b6924937ef414894d9174fa4465f788] drm/amd/pm: avoid to load smu
firmware for APUs
Author: Tim Huang <Tim.Huang@amd.com>
Date:   Thu Jun 13 10:34:13 2024 +0800

    drm/amd/pm: avoid to load smu firmware for APUs

    Certain call paths still load the SMU firmware for APUs,
    which needs to be skipped.

    Signed-off-by: Tim Huang <Tim.Huang@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c | 8 +++-----
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c    | 2 +-
 4 files changed, 10 insertions(+), 16 deletions(-)


My PC :
Lenovo ThinkCentre M715q
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] W=
ani
[Radeon R5/R6/R7 Graphics] (rev e4)


Let me now if you need more information.

Cheers,
jC

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
