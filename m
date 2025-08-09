Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB8B1F21E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 06:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF8F10E0F2;
	Sat,  9 Aug 2025 04:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kJcfcOEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FBC10E0EE
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 04:45:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 713E45C2303
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 04:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD96AC4CEF0
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 04:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754714701;
 bh=95BJv/06XQSuj5ZgeWBspotE8aN1RwN5vAMhcurxwY0=;
 h=From:To:Subject:Date:From;
 b=kJcfcOEH0ga0B2m1KTYVUz/Vz/yKbnwgSFk2JDFVAOAoTDz4pBgGUllz4bsSaNhDA
 geFOjbWmKw6xvw5j14eCxidTrXTjcwDKyhobxIjH8q0l7P38k/i1Fcx7DNZiX+39wf
 /FOO3vKQNhbZIoTZcrFrG5DnEJoF3ZSaiOs4ef57amUASXspg5dYICzvsabfIFXD7U
 5Hz3xf2J48PAo0P4m2LAxYUgJvjyYP63a/flGheHYxbX6sJYsIkc5ZsgmVFSWFhOuq
 GQ3SffM6jt4DpFH2UWp6cxnBO9Xsuiyea6vgz9ptqD4LNz8XfEPDRHY2FyTSS+dBeZ
 Xt7EBkvxYPaRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9B3EFC433E1; Sat,  9 Aug 2025 04:45:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220428] New: UBSAN array-index-out-of-bounds warning in
 radeon_atombios.c on kernel 6.15.9 with AMD Radeon HD 6250
Date: Sat, 09 Aug 2025 04:45:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dutra.astro@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-220428-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220428

            Bug ID: 220428
           Summary: UBSAN array-index-out-of-bounds warning in
                    radeon_atombios.c on kernel 6.15.9 with AMD Radeon HD
                    6250
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.15.9
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dutra.astro@gmail.com
        Regression: No

[   17.138975] ------------[ cut here ]------------
[   17.138980] UBSAN: array-index-out-of-bounds in
drivers/gpu/drm/radeon/radeon_atombios.c:2720:34
[   17.138991] index 16 is out of range for type 'UCHAR [*]'
[   17.139004] CPU: 1 UID: 0 PID: 544 Comm: (udev-worker) Not tainted
6.15.9-201.fc42.x86_64 #1 PREEMPT(lazy)=20
[   17.139016] Hardware name: Acer Aspire 5250/JE50-BZ, BIOS V1.08 09/26/20=
12
[   17.139022] Call Trace:
[   17.139031]  <TASK>
[   17.139041]  dump_stack_lvl+0x5d/0x80
[   17.139060]  ubsan_epilogue+0x5/0x2b
[   17.139070]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[   17.139086]  radeon_atombios_parse_power_table_6+0x3bc/0x3e0 [radeon]
[   17.139581]  radeon_atombios_get_power_modes+0x220/0x240 [radeon]
[   17.139977]  radeon_pm_init_dpm+0x77/0x240 [radeon]
[   17.140428]  evergreen_init+0x154/0x2b0 [radeon]
[   17.140885]  radeon_device_init+0x484/0xa60 [radeon]
[   17.141275]  ? pci_find_capability+0x79/0xb0
[   17.141288]  radeon_driver_load_kms+0xa6/0x230 [radeon]
[   17.141681]  radeon_pci_probe+0xef/0x1b0 [radeon]
[   17.142069]  local_pci_probe+0x42/0x90
[   17.142081]  pci_call_probe+0x5b/0x190
[   17.142090]  ? kernfs_create_link+0x61/0xb0
[   17.142106]  pci_device_probe+0x95/0x140
[   17.142117]  really_probe+0xde/0x340
[   17.142128]  ? pm_runtime_barrier+0x55/0x90
[   17.142141]  __driver_probe_device+0x78/0x140
[   17.142152]  driver_probe_device+0x1f/0xa0
[   17.142164]  ? __pfx___driver_attach+0x10/0x10
[   17.142173]  __driver_attach+0xcb/0x1e0
[   17.142185]  bus_for_each_dev+0x85/0xd0
[   17.142197]  bus_add_driver+0x12f/0x210
[   17.142209]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   17.142604]  driver_register+0x75/0xe0
[   17.142613]  ? radeon_register_atpx_handler+0xe/0x30 [radeon]
[   17.143030]  do_one_initcall+0x5b/0x300
[   17.143052]  do_init_module+0x84/0x260
[   17.143064]  init_module_from_file+0x8a/0xe0
[   17.143081]  idempotent_init_module+0x114/0x310
[   17.143095]  __x64_sys_finit_module+0x67/0xc0
[   17.143107]  do_syscall_64+0x7b/0x160
[   17.143119]  ? syscall_exit_to_user_mode+0x10/0x210
[   17.143141]  ? vfs_read+0x160/0x390
[   17.143150]  ? vfs_read+0x160/0x390
[   17.143163]  ? ksys_read+0x73/0xe0
[   17.143172]  ? syscall_exit_to_user_mode+0x10/0x210
[   17.143182]  ? do_syscall_64+0x87/0x160
[   17.143195]  ? syscall_exit_to_user_mode+0x10/0x210
[   17.143206]  ? do_syscall_64+0x87/0x160
[   17.143214]  ? exc_page_fault+0x7e/0x1a0
[   17.143224]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   17.143235] RIP: 0033:0x7f924c636a4d
[   17.143255] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 83 53 0f 00 f7 d8 64 89 01 48
[   17.143263] RSP: 002b:00007ffcb7ab1498 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   17.143274] RAX: ffffffffffffffda RBX: 00005643357c7350 RCX:
00007f924c636a4d
[   17.143280] RDX: 0000000000000004 RSI: 00007f924b0ec965 RDI:
000000000000002b
[   17.143285] RBP: 00007ffcb7ab1550 R08: 0000000000000000 R09:
00007ffcb7ab1500
[   17.143290] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000020000
[   17.143294] R13: 00005643357ca790 R14: 00007f924b0ec965 R15:
0000000000000000
[   17.143306]  </TASK>
[   17.143470] ---[ end trace ]---


Since this is a Kernel video driver problem, I am reporting here and not
elsewhere.

This MAY be related to https://bugzilla.kernel.org/show_bug.cgi?id=3D218435

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
