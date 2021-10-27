Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA1D43D365
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29156E901;
	Wed, 27 Oct 2021 21:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2AE6E901
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 21:00:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D8D16109E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635368415;
 bh=ZCmPc69p3Cdve8GQCAozAx7L3qx9qC8lEE15iVYzX1g=;
 h=From:To:Subject:Date:From;
 b=HHis9uZQRDEEc+5oG8brxfoBAWbMLmNreYMHSDc4bi0F5pJrskaiIHScxD1Ng5ezB
 TAB4Sy1a6sVvyoPJS9m4FpbO7rpe/SEqcN8zdvkIOK/chFQ5elpkOg4Jmp+zeVYNbQ
 NZCClXdONFrEmAmVqfdrKEDcqWEbpJYeGOnuk+efsCzhofrzu0ppCp10ViY/Zms2dM
 mY8LJmjZPllSF1/vBIi3uYqopuwA3BV4w3m+ReyUSOQjJ9nOkiD7/ihDWeSnUIkYw8
 xTp5upa5vzLBOqaZ5fI6+P3N9szILJhfftlytI9TQuQVj2kTbO9umQ0RHntz8nkBH6
 3t1/5DjyztDXw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 95FCC610FC; Wed, 27 Oct 2021 21:00:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214853] New: [amdgpu] UBSAN shows several null-ptr-deref in
 ../dc/bios/command_table2.c some array-index-out-of-bounds in
 ../dc/bios/bios_parser2.c and an invalid-load in ../amdgpu_dm/amdgpu_dm.c
Date: Wed, 27 Oct 2021 21:00:15 +0000
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
Message-ID: <bug-214853-2300@https.bugzilla.kernel.org/>
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

            Bug ID: 214853
           Summary: [amdgpu] UBSAN shows several null-ptr-deref in
                    ../dc/bios/command_table2.c some
                    array-index-out-of-bounds in ../dc/bios/bios_parser2.c
                    and an invalid-load in ../amdgpu_dm/amdgpu_dm.c
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

Created attachment 299337
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299337&action=3Dedit
kernel dmesg (kernel 5.15-rc7, AMD FX-8370)

[...]
UBSAN: null-ptr-deref in
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:872:3
member access within null pointer of type 'struct
atom_master_list_of_command_functions_v2_1'
CPU: 3 PID: 234 Comm: systemd-udevd Not tainted 5.15.0-rc7-bdver2 #11
Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./970-GAM=
ING,
BIOS F2 04/06/2016
Call Trace:
 dump_stack_lvl+0x8d/0xd9
 ubsan_epilogue+0x5/0x44
 __ubsan_handle_type_mismatch_v1+0x45/0x4a
 dal_firmware_parser_init_cmd_tbl+0x31c/0x37c [amdgpu]
 bios_parser2_construct+0x16f/0x9cb [amdgpu]
 firmware_parser_create+0x36/0x4c [amdgpu]
 dal_bios_parser_create+0xc/0x20 [amdgpu]
 dc_create+0x25d/0x764 [amdgpu]
 dm_hw_init+0x28a/0x697 [amdgpu]
 ? dev_printk_emit+0x4c/0x66
 amdgpu_device_init+0x1847/0x1e13 [amdgpu]
 amdgpu_driver_load_kms+0x47/0x33d [amdgpu]
 amdgpu_pci_probe+0xeb/0x1a6 [amdgpu]
 pci_device_probe+0xa1/0x121
 really_probe+0xe4/0x331
 __driver_probe_device+0x84/0xe1
 driver_probe_device+0x1a/0x6d
 __driver_attach+0xac/0xc3
 ? driver_attach+0x15/0x15
 bus_for_each_dev+0x8c/0xc0
 bus_add_driver+0xf5/0x1f2
 driver_register+0x66/0xe7
 ? 0xffffffffc0ff2000
 do_one_initcall+0x109/0x1f4
 ? 0xffffffffc0ff2000
 do_init_module+0x5c/0x1f1
 load_module+0x193f/0x1ca9
 ? kernel_read_file_from_fd+0x5b/0x7e
 __se_sys_finit_module+0xa7/0xce
 do_syscall_64+0x79/0xa3
 ? lockdep_hardirqs_on_prepare+0xf6/0x1e3
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fa99ef681e9
Code: 00 00 b8 ca 00 00 00 0f 05 eb ac 66 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48
89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 4f fc 0b 00 f7 d8 64 89 01 48
RSP: 002b:00007fff06041ba8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055f2d378be20 RCX: 00007fa99ef681e9
RDX: 0000000000000000 RSI: 00007fa99f0af97f RDI: 0000000000000018
RBP: 0000000000020000 R08: 0000000000000000 R09: fffffffffffffeb8
R10: 0000000000000018 R11: 0000000000000246 R12: 0000000000000000
R13: 000055f2d38eba60 R14: 00007fa99f0af97f R15: 0000000000000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: array-index-out-of-bounds in
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:384:3
index 8 is out of range for type 'struct atom_gpio_pin_assignment [8]'
CPU: 3 PID: 234 Comm: systemd-udevd Not tainted 5.15.0-rc7-bdver2 #11
Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./970-GAM=
ING,
BIOS F2 04/06/2016
Call Trace:
 dump_stack_lvl+0x8d/0xd9
 ubsan_epilogue+0x5/0x44
 __ubsan_handle_out_of_bounds+0x9e/0xa0
 get_gpio_i2c_info+0xe0/0x17e [amdgpu]
 bios_parser_get_i2c_info+0x5b/0xfa [amdgpu]
 dal_ddc_service_create+0xa7/0x1a8 [amdgpu]
 dcn20_resource_construct+0x106e/0x10ba [amdgpu]
 ? find_held_lock+0x41/0xc1
 ? slab_post_alloc_hook+0x5f/0x8a
 dcn20_create_resource_pool+0x39/0x6f [amdgpu]
 dc_create_resource_pool+0x164/0x213 [amdgpu]
 ? dal_gpio_service_create+0x8f/0x193 [amdgpu]
 dc_create+0x2b3/0x764 [amdgpu]
 dm_hw_init+0x28a/0x697 [amdgpu]
 ? dev_printk_emit+0x4c/0x66
 amdgpu_device_init+0x1847/0x1e13 [amdgpu]
 amdgpu_driver_load_kms+0x47/0x33d [amdgpu]
 amdgpu_pci_probe+0xeb/0x1a6 [amdgpu]
 pci_device_probe+0xa1/0x121
 really_probe+0xe4/0x331
 __driver_probe_device+0x84/0xe1
 driver_probe_device+0x1a/0x6d
 __driver_attach+0xac/0xc3
 ? driver_attach+0x15/0x15
 bus_for_each_dev+0x8c/0xc0
 bus_add_driver+0xf5/0x1f2
 driver_register+0x66/0xe7
 ? 0xffffffffc0ff2000
 do_one_initcall+0x109/0x1f4
 ? 0xffffffffc0ff2000
 do_init_module+0x5c/0x1f1
 load_module+0x193f/0x1ca9
 ? kernel_read_file_from_fd+0x5b/0x7e
 __se_sys_finit_module+0xa7/0xce
 do_syscall_64+0x79/0xa3
 ? lockdep_hardirqs_on_prepare+0xf6/0x1e3
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fa99ef681e9
Code: 00 00 b8 ca 00 00 00 0f 05 eb ac 66 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48
89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 4f fc 0b 00 f7 d8 64 89 01 48
RSP: 002b:00007fff06041ba8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055f2d378be20 RCX: 00007fa99ef681e9
RDX: 0000000000000000 RSI: 00007fa99f0af97f RDI: 0000000000000018
RBP: 0000000000020000 R08: 0000000000000000 R09: fffffffffffffeb8
R10: 0000000000000018 R11: 0000000000000246 R12: 0000000000000000
R13: 000055f2d38eba60 R14: 00007fa99f0af97f R15: 0000000000000000
[...]
=3D
UBSAN: invalid-load in
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5865:85
load of value 170 is not a valid value for type 'bool' (aka '_Bool')
CPU: 5 PID: 234 Comm: systemd-udevd Not tainted 5.15.0-rc7-bdver2 #11
Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./970-GAM=
ING,
BIOS F2 04/06/2016
Call Trace:
 dump_stack_lvl+0x8d/0xd9
 ubsan_epilogue+0x5/0x44
 __ubsan_handle_load_invalid_value+0x9e/0xa0
 create_validate_stream_for_sink+0x6bb/0x777 [amdgpu]
 ? lockdep_hardirqs_on_prepare+0xf6/0x1e3
 amdgpu_dm_connector_mode_valid+0x70/0x1b9 [amdgpu]
 ? drm_connector_list_update+0xba/0x121 [drm]
 drm_connector_mode_valid+0x34/0x42 [drm_kms_helper]
 drm_helper_probe_single_connector_modes+0x4d7/0x88e [drm_kms_helper]
 ? drm_client_modeset_probe+0x1fa/0x14c9 [drm]
 drm_client_modeset_probe+0x232/0x14c9 [drm]
 ? add_chain_block+0x165/0x22f
 ? __lock_acquire+0xc7c/0x1e4d
 ? rcu_read_lock_sched_held+0x45/0xa5
 ? lock_acquire+0xcb/0x210
 ? drm_fb_helper_initial_config+0x32/0x4f [drm_kms_helper]
 __drm_fb_helper_initial_config_and_unlock+0x3e/0x5f0 [drm_kms_helper]
 amdgpu_fbdev_init+0xee/0x110 [amdgpu]
 amdgpu_device_init+0x1996/0x1e13 [amdgpu]
 amdgpu_driver_load_kms+0x47/0x33d [amdgpu]
 amdgpu_pci_probe+0xeb/0x1a6 [amdgpu]
 pci_device_probe+0xa1/0x121
 really_probe+0xe4/0x331
 __driver_probe_device+0x84/0xe1
 driver_probe_device+0x1a/0x6d
 __driver_attach+0xac/0xc3
 ? driver_attach+0x15/0x15
 bus_for_each_dev+0x8c/0xc0
 bus_add_driver+0xf5/0x1f2
 driver_register+0x66/0xe7
 ? 0xffffffffc0ff2000
 do_one_initcall+0x109/0x1f4
 ? 0xffffffffc0ff2000
 do_init_module+0x5c/0x1f1
 load_module+0x193f/0x1ca9
 ? kernel_read_file_from_fd+0x5b/0x7e
 __se_sys_finit_module+0xa7/0xce
 do_syscall_64+0x79/0xa3
 ? lockdep_hardirqs_on_prepare+0xf6/0x1e3
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fa99ef681e9
Code: 00 00 b8 ca 00 00 00 0f 05 eb ac 66 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48
89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 4f fc 0b 00 f7 d8 64 89 01 48
RSP: 002b:00007fff06041ba8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055f2d378be20 RCX: 00007fa99ef681e9
RDX: 0000000000000000 RSI: 00007fa99f0af97f RDI: 0000000000000018
RBP: 0000000000020000 R08: 0000000000000000 R09: fffffffffffffeb8
R10: 0000000000000018 R11: 0000000000000246 R12: 0000000000000000
R13: 000055f2d38eba60 R14: 00007fa99f0af97f R15: 0000000000000000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
