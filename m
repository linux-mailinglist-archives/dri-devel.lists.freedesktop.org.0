Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE249FD406
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 12:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B8410E0D8;
	Fri, 27 Dec 2024 11:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t6asCc8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D0810E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 11:56:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D6C25C49C1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 11:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F8A7C4CED6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 11:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735300615;
 bh=R3E1GQ1LPHprG/V4KmYMWQJiiqYJqEkAXGVdL1nCqjs=;
 h=From:To:Subject:Date:From;
 b=t6asCc8zbnIwY6xEX2Tj8L5FcKSjyA+E7uVGxwd7Sp6nQx/8vlATSNDy4CAbHRKeE
 1IajiTmTB+TbP1sujb+BSyYlA81zmrYp3yJ3iIcVVNYmXIvwZU0wDS1599ua4bf/OC
 v1oahKdouTrS3IS+RpU3W7mEdhXldSQscp6xeBhEeMt9dYLvYb7iafnpS1bsXJ3OR4
 oIAROIggxleIJAe653p8jSOz+Po5jwoCj8hk92VP6i0YF8sWB45IAYInAuGPZLy2hf
 3EP/9aj7Uleg8xL/iB18cMvX+IhAhOtsigr1PmWWMa8ppACsYaDDLLNxiSZHFjz1MA
 lZ+waK/FLcP0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 624B3C41612; Fri, 27 Dec 2024 11:56:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219635] New: dc_resource.c:3395 calculate_phy_pix_clks+0xd3/0xe0
Date: Fri, 27 Dec 2024 11:56:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stoffel.010170@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219635-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219635

            Bug ID: 219635
           Summary: dc_resource.c:3395 calculate_phy_pix_clks+0xd3/0xe0
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: stoffel.010170@gmx.de
        Regression: No

Moin

see below.

Thanks in advance.
Stefan

[    5.760260] ------------[ cut here ]------------
[    5.760262] WARNING: CPU: 7 PID: 436 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:3395
calculate_phy_pix_clks+0xd3/0xe0 [amdgpu]
[    5.760742] Modules linked in: amdgpu(+) amdxcp i2c_algo_bit drm_ttm_hel=
per
ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy drm_display_helper
hid_logitech_hidpp cec crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_sss=
e3
serio_raw sha1_ssse3 video sp5100_tco hid_microsoft wmi ff_memless
[    5.760776] CPU: 7 UID: 0 PID: 436 Comm: (udev-worker) Not tainted
6.12.6-200.fc41.x86_64 #1
[    5.760780] Hardware name: LENOVO 10VHS0PB00/3130, BIOS M1XKT63A 04/11/2=
024
[    5.760782] RIP: 0010:calculate_phy_pix_clks+0xd3/0xe0 [amdgpu]
[    5.761167] Code: ab aa aa aa c1 e1 04 48 0f af ca 48 c1 e9 24 eb c9 8d =
14
f6 8d 0c 95 00 00 00 00 ba ab aa aa aa 48 0f af ca 48 c1 e9 24 eb b0 <0f> 0=
b eb
ac 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90
[    5.761170] RSP: 0018:ffffc34580c2f4d0 EFLAGS: 00010297
[    5.761173] RAX: ffff9f8dd2e08000 RBX: ffff9f8dd2e08000 RCX:
00000000005aa320
[    5.761175] RDX: 0000000000000005 RSI: 00000000002d5190 RDI:
ffff9f8dd2e08000
[    5.761177] RBP: ffff9f8dd3400000 R08: 0000000000000000 R09:
ffff9f8dd2e08294
[    5.761179] R10: 000000000000000a R11: 000000000000000a R12:
ffff9f8dc1c85a00
[    5.761181] R13: ffff9f8dd2e08058 R14: ffff9f8dc92f1800 R15:
ffff9f8dd5f80010
[    5.761183] FS:  00007f529b22fbc0(0000) GS:ffff9f908fd80000(0000)
knlGS:0000000000000000
[    5.761186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.761188] CR2: 0000564440b2df10 CR3: 000000010aba6000 CR4:
00000000003506f0
[    5.761190] Call Trace:
[    5.761195]  <TASK>
[    5.761197]  ? calculate_phy_pix_clks+0xd3/0xe0 [amdgpu]
[    5.761583]  ? __warn.cold+0x93/0xfa
[    5.761587]  ? calculate_phy_pix_clks+0xd3/0xe0 [amdgpu]
[    5.761971]  ? report_bug+0xff/0x140
[    5.761976]  ? handle_bug+0x58/0x90
[    5.761980]  ? exc_invalid_op+0x17/0x70
[    5.761984]  ? asm_exc_invalid_op+0x1a/0x20
[    5.761990]  ? calculate_phy_pix_clks+0xd3/0xe0 [amdgpu]
[    5.762367]  dc_validate_stream+0x47/0xe0 [amdgpu]
[    5.762747]  create_validate_stream_for_sink+0x261/0x400 [amdgpu]
[    5.763165]  create_validate_stream_for_sink+0x315/0x400 [amdgpu]
[    5.763579]  amdgpu_dm_connector_mode_valid+0x63/0x1f0 [amdgpu]
[    5.763987]  ? drm_connector_list_update+0x1d8/0x220
[    5.763991]  drm_connector_mode_valid+0x3b/0x60
[    5.763995]  __drm_helper_update_and_validate+0x11d/0x400
[    5.763998]  ? srso_return_thunk+0x5/0x5f
[    5.764002]  ? amdgpu_dm_connector_get_modes+0x1f9/0x510 [amdgpu]
[    5.764408]  drm_helper_probe_single_connector_modes+0x332/0x630
[    5.764416]  drm_client_modeset_probe+0x267/0x1910
[    5.764424]  ? srso_return_thunk+0x5/0x5f
[    5.764427]  ? drm_exec_fini+0x1b/0x60 [drm_exec]
[    5.764434]  __drm_fb_helper_initial_config_and_unlock+0x3b/0x480
[    5.764437]  ? amdgpu_driver_open_kms+0x106/0x280 [amdgpu]
[    5.764755]  ? srso_return_thunk+0x5/0x5f
[    5.764759]  ? drm_file_alloc+0x1e6/0x290
[    5.764763]  drm_fbdev_ttm_client_hotplug+0x6b/0xa0 [drm_ttm_helper]
[    5.764767]  ? srso_return_thunk+0x5/0x5f
[    5.764770]  drm_client_register+0x79/0xc0
[    5.764775]  amdgpu_pci_probe+0x446/0x4c0 [amdgpu]
[    5.765087]  local_pci_probe+0x45/0x90
[    5.765092]  pci_device_probe+0x23f/0x290
[    5.765097]  really_probe+0xde/0x340
[    5.765101]  ? pm_runtime_barrier+0x54/0x90
[    5.765105]  ? __pfx___driver_attach+0x10/0x10
[    5.765109]  __driver_probe_device+0x78/0x110
[    5.765113]  driver_probe_device+0x1f/0xa0
[    5.765117]  __driver_attach+0xba/0x1c0
[    5.765120]  bus_for_each_dev+0x8f/0xe0
[    5.765125]  bus_add_driver+0x142/0x220
[    5.765129]  driver_register+0x72/0xd0
[    5.765132]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
[    5.765443]  do_one_initcall+0x5b/0x310
[    5.765450]  do_init_module+0x90/0x260
[    5.765455]  __do_sys_init_module+0x17a/0x1b0
[    5.765463]  do_syscall_64+0x82/0x160
[    5.765467]  ? srso_return_thunk+0x5/0x5f
[    5.765469]  ? vms_complete_munmap_vmas+0x16b/0x190
[    5.765474]  ? srso_return_thunk+0x5/0x5f
[    5.765477]  ? do_vmi_align_munmap+0x1d7/0x250
[    5.765487]  ? srso_return_thunk+0x5/0x5f
[    5.765489]  ? __do_sys_brk+0x37c/0x3d0
[    5.765495]  ? srso_return_thunk+0x5/0x5f
[    5.765498]  ? syscall_exit_to_user_mode+0x10/0x210
[    5.765507]  ? srso_return_thunk+0x5/0x5f
[    5.765510]  ? do_syscall_64+0x8e/0x160
[    5.765513]  ? srso_return_thunk+0x5/0x5f
[    5.765515]  ? do_user_addr_fault+0x55a/0x7b0
[    5.765521]  ? srso_return_thunk+0x5/0x5f
[    5.765524]  ? exc_page_fault+0x7e/0x180
[    5.765527]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    5.765532] RIP: 0033:0x7f529bad528e
[    5.765536] Code: 48 8b 0d 85 3b 0f 00 f7 d8 64 89 01 48 83 c8 ff c3 66 =
2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 52 3b 0f 00 f7 d8 64 89 01 48
[    5.765538] RSP: 002b:00007ffc1856ed68 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[    5.765541] RAX: ffffffffffffffda RBX: 0000564440b38bf0 RCX:
00007f529bad528e
[    5.765544] RDX: 00007f529b2263bd RSI: 00000000028c075e RDI:
00007f52977a6010
[    5.765546] RBP: 00007ffc1856ee20 R08: 0000564440adc010 R09:
0000000000000007
[    5.765547] R10: 0000000000000005 R11: 0000000000000246 R12:
00007f529b2263bd
[    5.765549] R13: 0000000000020000 R14: 0000564440b36910 R15:
0000564440bdc690
[    5.765555]  </TASK>
[    5.765557] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
