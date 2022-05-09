Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1FC51FAC7
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 13:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C95F10EC26;
	Mon,  9 May 2022 11:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91710EC26
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:05:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 494D9CE0F71
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9003BC385B0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652094298;
 bh=cuK4nFO5lrti2rVJejhYhOgd9DEdGUlUNb86ML7YXU4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NG7dAenpZDeoq7V1Xw9C6qMcevpfhL6a+M8+6aWCUWvC1ZoYUrKh+rjjH8aq+KWHC
 rnTWAHNAUa2q5Zbs7Ws+OsCOW+QOtMRv/nXhOww9ZwVGSwwm1n9Qv0Lju1B1nzqKPE
 /xB2tDUi11uMBlVOhRTd/4MoP+ioJd3XHPVXq0BaA07LjprX+kiMgP67HEBOi/mkbU
 NxL6QLdjGeDRgZsO/IJFznLJpkZ8u2Or5H1uv2MuVzqaew031cRg9BzOP2/VM4M5wM
 vEPKnKnNyfy5m+iM1zBksz5/7/Y8i/xiQ+iF3GkJbPXPFXfdCy6HCbPoN5FUG5kY8S
 o8KItxTVavWnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7C6F4C05FE2; Mon,  9 May 2022 11:04:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214853] [amdgpu] UBSAN shows several null-ptr-deref in
 ../dc/bios/command_table2.c some array-index-out-of-bounds in
 ../dc/bios/bios_parser2.c and an invalid-load in ../amdgpu_dm/amdgpu_dm.c
Date: Mon, 09 May 2022 11:04:58 +0000
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
Message-ID: <bug-214853-2300-skFvm6JkEP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214853-2300@https.bugzilla.kernel.org/>
References: <bug-214853-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214853

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300911
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300911&action=3Dedit
kernel dmesg (kernel 5.18-rc6, AMD Ryzen 9 5950X)

Same card in another machine, still tha same problem in 5.18-rc6:

[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: array-index-out-of-bounds in
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:388:3
index 8 is out of range for type 'struct atom_gpio_pin_assignment [8]'
CPU: 8 PID: 443 Comm: systemd-udevd Not tainted 5.18.0-rc6-Zen3+ #5
Hardware name: To Be Filled By O.E.M. B450M Steel Legend/B450M Steel Legend,
BIOS P4.30 02/25/2022
Call Trace:
 <TASK>
 dump_stack_lvl+0xe5/0x154
 __ubsan_handle_out_of_bounds+0xd2/0x110
 get_gpio_i2c_info+0x474/0xb10 [amdgpu]
 bios_parser_get_i2c_info+0x94/0x350 [amdgpu]
 ? dal_ddc_service_create+0x63/0x620 [amdgpu]
 ? bios_parser_get_src_obj+0x4a0/0x4a0 [amdgpu]
 dal_ddc_service_create+0x257/0x620 [amdgpu]
 dcn20_create_resource_pool+0x40ec/0x4150 [amdgpu]
 ? dal_gpio_service_create+0x160/0x4f0 [amdgpu]
 dc_create_resource_pool+0x2bf/0x5a0 [amdgpu]
 dc_create+0xa6d/0x14c0 [amdgpu]
 dm_hw_init+0x8d3/0x6d40 [amdgpu]
 ? dev_vprintk_emit+0x20f/0x28c
 ? dev_printk_emit+0x7c/0xa0
 ? smu_hw_init+0x741/0xab0 [amdgpu]
 amdgpu_device_ip_hw_init_phase2+0x15b/0x430 [amdgpu]
 amdgpu_device_ip_init+0xb1f/0xfc0 [amdgpu]
 amdgpu_device_init+0x4845/0x6f20 [amdgpu]
 ? check_chain_key+0x111/0x540
 amdgpu_driver_load_kms+0x16/0x470 [amdgpu]
 amdgpu_pci_probe+0x531/0xb60 [amdgpu]
 pci_device_probe+0x167/0x2c0
 really_probe+0x3fb/0x820
 __driver_probe_device+0x147/0x240
 driver_probe_device+0x4b/0x320
 __driver_attach+0x263/0x4f0
 ? driver_attach+0x40/0x40
 bus_for_each_dev+0xff/0x140
 bus_add_driver+0x2b7/0x480
 driver_register+0x1f5/0x330
 ? 0xffffffffc0d79000
 do_one_initcall+0x12b/0x2d0
 ? 0xffffffffc0d79000
 ? __asan_register_globals+0x5b/0x70
 do_init_module+0x1b3/0x4e0
 load_module+0x3d50/0x4730
 ? kernel_read_file_from_fd+0x84/0xc0
 __se_sys_finit_module+0x128/0x180
 do_syscall_64+0x31/0x50
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fba28d5c789
Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 =
48
89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 77 86 0e 00 f7 d8 64 89 01 48
RSP: 002b:00007fff5e63a018 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 00005623c86daf90 RCX: 00007fba28d5c789
RDX: 0000000000000000 RSI: 00007fba28eaa97f RDI: 0000000000000019
RBP: 0000000000020000 R08: 0000000000000000 R09: fffffffffffffeb8
R10: 0000000000000019 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fba28eaa97f R14: 00005623c86dd550 R15: 0000000000000000
 </TASK>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
