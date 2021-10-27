Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0A43CC6F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD746E8A3;
	Wed, 27 Oct 2021 14:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7B56E8A3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:38:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 011B760F9D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635345521;
 bh=6W24dcWAxfUWWYURZ4SYHC2hUxkR8EMGLRGEzZmqOo0=;
 h=From:To:Subject:Date:From;
 b=a7qd3Y+jMYSSacQI0VdzoLLZ0jkJksHxA13GsJK6gEqaEq3P91CElzp5zftiO7+dT
 99vEvj3idLMMpXJsK+HdeeKX5pvJvRuB57nRISV1jFWZKljz79T6xPccpHZ3AaIeyI
 jqqxI6alD8FragX03E8WFsER3rdn9vHBMQ6eJcD0pqFuzZAkED+vx6+tO+e2ZWG6cy
 fHOj9F/Wz7ROflVaGQPP3ZdrBg3oAyUoS1tLdjEBJKl1OkptIjvAzeQVE/y+88IGoU
 K9cFkKWmixHD7kPHHQYVJeni6IfIXZRrv4UiT2gLRf9/Rgh4Q7EJN6UanTvx0raO9U
 Hc6ZKnn3pcWDw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EAC2260F5D; Wed, 27 Oct 2021 14:38:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214847] New: [radeon] UBSAN shows several null-ptr-deref in
 drm/radeon/atom.c, radeon_atombios.c, atombios_encoders.c, atombios_crtc.c
Date: Wed, 27 Oct 2021 14:38:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-214847-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214847

            Bug ID: 214847
           Summary: [radeon] UBSAN shows several null-ptr-deref in
                    drm/radeon/atom.c, radeon_atombios.c,
                    atombios_encoders.c, atombios_crtc.c
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15-rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: christian.koenig@amd.com
        Regression: No

Created attachment 299331
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299331&action=3Dedit
kernel dmesg (kernel 5.15-rc7, AMD Ryzen 9 5950X)

[...]
[drm] radeon kernel modesetting enabled.
checking generic (e0000000 300000) vs hw (e0000000 10000000)
fb0: switching to radeon from simple
Console: switching to colour dummy device 80x25
radeon 0000:07:00.0: vgaarb: deactivate vga console
[drm] initializing kernel modesetting (RV515 0x1002:0x7187 0x174B:0x3000 0x=
00).
ATOM BIOS: X1550
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: null-ptr-deref in drivers/gpu/drm/radeon/atom.c:1400:14
member access within null pointer of type 'ATOM_MASTER_LIST_OF_DATA_TABLES'
(aka 'struct _ATOM_MASTER_LIST_OF_DATA_TABLES')
CPU: 26 PID: 418 Comm: systemd-udevd Not tainted 5.15.0-rc7-Zen3+ #5
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./B450M Steel
Legend, BIOS P4.20 08/03/2021
Call Trace:
 dump_stack_lvl+0x7f/0xc0
 ubsan_type_mismatch_common+0x248/0x290
 __ubsan_handle_type_mismatch_v1+0x49/0x50
 atom_allocate_fb_scratch+0x2b/0xf0 [radeon]
 radeon_atombios_init+0x113/0x130 [radeon]
 rv515_init+0x5b/0x250 [radeon]
 radeon_device_init+0x99a/0xe00 [radeon]
 radeon_driver_load_kms+0xb8/0x1a0 [radeon]
 drm_dev_register+0xec/0x1d0 [drm]
 radeon_pci_probe+0xaa/0x100 [radeon]
 pci_device_probe+0xaa/0x140
 really_probe+0x111/0x360
 __driver_probe_device+0x84/0xf0
 __driver_attach+0xbb/0x120
 ? driver_attach+0x20/0x20
 bus_for_each_dev+0x93/0xd0
 bus_add_driver+0xf5/0x200
 driver_register+0x66/0xf0
 do_one_initcall+0x11a/0x2e0
 ? __kernel_text_address+0x56/0xa0
 ? 0xffffffffc0760000
 ? mmu_interval_notifier_insert+0xa/0xa0
 do_init_module+0x55/0x200
 load_module+0x1b50/0x1ee0
 ? kernel_read_file_from_fd+0x58/0x80
 __x64_sys_finit_module+0xa8/0xd0
 do_syscall_64+0x79/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f5c569992c9
Code: 0c 00 b8 ca 00 00 00 0f 05 eb a4 66 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48
89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 6f 1b 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffe2a4aefe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 0000558584ea2070 RCX: 00007f5c569992c9
RDX: 0000000000000000 RSI: 00007f5c56adc97f RDI: 0000000000000016
RBP: 0000000000020000 R08: 0000000000000000 R09: fffffffffffffeb8
R10: 0000000000000016 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5c56adc97f R14: 0000558584e510c0 R15: 0000000000000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: null-ptr-deref in drivers/gpu/drm/radeon/radeon_atombios.c:1126:14
member access within null pointer of type 'ATOM_MASTER_LIST_OF_DATA_TABLES'
(aka 'struct _ATOM_MASTER_LIST_OF_DATA_TABLES')
CPU: 26 PID: 418 Comm: systemd-udevd Not tainted 5.15.0-rc7-Zen3+ #5
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./B450M Steel
Legend, BIOS P4.20 08/03/2021
Call Trace:
 dump_stack_lvl+0x7f/0xc0
 ubsan_type_mismatch_common+0x248/0x290
 __ubsan_handle_type_mismatch_v1+0x49/0x50
 radeon_atom_get_clock_info+0x2e/0x410 [radeon]
 ? atom_allocate_fb_scratch+0xa7/0xf0 [radeon]
 radeon_get_clock_info+0x170/0x470 [radeon]
 rv515_init+0xa0/0x250 [radeon]
 radeon_device_init+0x99a/0xe00 [radeon]
 radeon_driver_load_kms+0xb8/0x1a0 [radeon]
 drm_dev_register+0xec/0x1d0 [drm]
 radeon_pci_probe+0xaa/0x100 [radeon]
 pci_device_probe+0xaa/0x140
 really_probe+0x111/0x360
 __driver_probe_device+0x84/0xf0
 __driver_attach+0xbb/0x120
 ? driver_attach+0x20/0x20
 bus_for_each_dev+0x93/0xd0
 bus_add_driver+0xf5/0x200
 driver_register+0x66/0xf0
 do_one_initcall+0x11a/0x2e0
 ? __kernel_text_address+0x56/0xa0
 ? 0xffffffffc0760000
 ? mmu_interval_notifier_insert+0xa/0xa0
 do_init_module+0x55/0x200
 load_module+0x1b50/0x1ee0
 ? kernel_read_file_from_fd+0x58/0x80
 __x64_sys_finit_module+0xa8/0xd0
 do_syscall_64+0x79/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f5c569992c9
Code: 0c 00 b8 ca 00 00 00 0f 05 eb a4 66 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48
89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 6f 1b 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffe2a4aefe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 0000558584ea2070 RCX: 00007f5c569992c9
RDX: 0000000000000000 RSI: 00007f5c56adc97f RDI: 0000000000000016
RBP: 0000000000020000 R08: 0000000000000000 R09: fffffffffffffeb8
R10: 0000000000000016 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5c56adc97f R14: 0000558584e510c0 R15: 0000000000000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
