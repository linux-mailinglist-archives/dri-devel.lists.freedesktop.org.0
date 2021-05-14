Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B038015C
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 02:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80246E08C;
	Fri, 14 May 2021 00:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB4E6E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 00:59:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 032756135A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 00:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620953958;
 bh=TIc0wTQBxUmH00gYz4WfgQpsRsw7lB64oqduGusMQ5c=;
 h=From:To:Subject:Date:From;
 b=A/LCWbcRMhYzIpIAAU16UNk8t1FgazBPCcLoOsPZDMnEUpvZ6TOHYubf6eJEGF/UY
 H5lm1UEAwrcEZ6dIzFGzZSv7V3XOX9YsB0ZJPX1z13B++IuVXEu99zdIEdELnjmqoB
 wKLVm/SIhbhyZc0/8+aC8drqj9rUzy79ISbb2Wnex11ybkF5KiTnqCTTLtDCS4tlaN
 tbesrCpLihkZnco8zFI6LFhHF2Raot9tBPU3oI0RsohSPMAoy/g1PdzacwGVl8lt8w
 3ki7+XqRnLUSCZ5vN5EX8/9kLFO1+kCiHHa+R5StkcTXzo0yUmR9KclBLxzMClbvfZ
 IkDOhdrFiXveg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E9A2361289; Fri, 14 May 2021 00:59:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213053] New: WARNING on dcn30_hwseq.c dcn30_set_hubp_blank, AMD
 Radeon 6700XT
Date: Fri, 14 May 2021 00:59:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrewd18@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213053-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213053

            Bug ID: 213053
           Summary: WARNING on dcn30_hwseq.c dcn30_set_hubp_blank, AMD
                    Radeon 6700XT
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: andrewd18@gmail.com
        Regression: No

Created attachment 296743
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296743&action=3Dedit
Full dmesg 2021-05-13

I recently managed to snag a Gigabyte "Eagle 12G" Radeon 6700 XT. I am runn=
ing
latest Debian Testing with a 5.12.3 kernel (config based off Debian default=
s)
and latest linux-firmware from git.

Upon installing the card into my system and booting, it outputs the warning
below into kern.log. The UI is 3D accellerated, there are no errors or warn=
ings
in Xorg.log, but there is some graphical corruption and tearing in some gam=
es
or on KDE's panels that disappears when the object is repainted.

Neither this WARNING nor the corruption occurs when when I plug in my previ=
ous
video card, a Radeon Vega 64.

Please let me know if I can provide more information or test something.



[    5.481569] ------------[ cut here ]------------
[    5.481570] WARNING: CPU: 6 PID: 165 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:959
dcn30_set_hubp_blank+0x214/0x220 [amdgpu]
[    5.481725] Modules linked in: hid_generic(E) usbhid(E) hid(E) sd_mod(E)
t10_pi(E) amdgpu(E+) gpu_sched(E) drm_ttm_helper(E) ttm(E) drm_kms_helper(E)
xhci_pci(E) ahci(E) cec(E) xhci_pci_renesas(E) mxm_wmi(E) crc32_pclmul(E)
crc32c_intel(E) igb(E) libahci(E) xhci_hcd(E) i2c_piix4(E) dca(E) drm(E)
libata(E) i2c_algo_bit(E) usbcore(E) scsi_mod(E) wmi(E) gpio_amdpt(E)
gpio_generic(E) button(E)
[    5.481736] CPU: 6 PID: 165 Comm: systemd-udevd Tainted: G            E=
=20=20=20=20
5.12.3 #69
[    5.481738] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 5837 02/01/2021
[    5.481739] RIP: 0010:dcn30_set_hubp_blank+0x214/0x220 [amdgpu]
[    5.481879] Code: 31 f6 48 8b 07 48 8b 40 50 e8 58 c5 ea ed 48 8b 9b d0 =
02
00 00 48 85 db 75 df eb 8c 0f 0b e9 46 ff ff ff 0f 0b e9 be fe ff ff <0f> 0=
b e9
42 fe ff ff 0f 1f 44 00 00 0f 1f 44 00 00 41 57 41 56 45
[    5.481880] RSP: 0018:ffffae8d8126b328 EFLAGS: 00010246
[    5.481882] RAX: 0000000000000000 RBX: 0000000000000001 RCX:
0000000000000003
[    5.481882] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffff9ec790180000
[    5.481883] RBP: ffff9ec791ee01e8 R08: ffffae8d8126b314 R09:
ffffae8d8126b270
[    5.481884] R10: 0000000000000002 R11: 343a656e696c2063 R12:
ffff9ec791ee01e8
[    5.481884] R13: ffff9ec792980000 R14: 0000000000000000 R15:
ffff9ec791ee01e8
[    5.481885] FS:  00007ff744baf8c0(0000) GS:ffff9eca9e980000(0000)
knlGS:0000000000000000
[    5.481886] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.481887] CR2: 00007ff744b9b50f CR3: 00000001100a2000 CR4:
00000000003506e0
[    5.481888] Call Trace:
[    5.481890]  dcn10_wait_for_mpcc_disconnect+0x116/0x190 [amdgpu]
[    5.482034]  dcn20_plane_atomic_disable+0x3e/0x150 [amdgpu]
[    5.482178]  dcn20_disable_plane+0x24/0x40 [amdgpu]
[    5.482320]  dcn10_init_pipes+0x307/0x3f0 [amdgpu]
[    5.482460]  dce110_enable_accelerated_mode+0x9c/0x260 [amdgpu]
[    5.482599]  dc_commit_state+0x942/0xa40 [amdgpu]
[    5.482736]  amdgpu_dm_atomic_commit_tail+0x585/0x2610 [amdgpu]
[    5.482878]  ? kfree+0xc3/0x410
[    5.482881]  ? dcn30_validate_bandwidth+0x11f/0x270 [amdgpu]
[    5.483019]  ? dcn30_validate_bandwidth+0x11f/0x270 [amdgpu]
[    5.483155]  ? __bpf_trace_amdgpu_dm_plane_state_template+0x10/0x10 [amd=
gpu]
[    5.483295]  ? dm_plane_helper_prepare_fb+0x1f1/0x250 [amdgpu]
[    5.483434]  ? drm_atomic_helper_setup_commit+0x74d/0x810 [drm_kms_helpe=
r]
[    5.483446]  commit_tail+0x94/0x130 [drm_kms_helper]
[    5.483457]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[    5.483467]  drm_client_modeset_commit_atomic+0x1e4/0x220 [drm]
[    5.483488]  drm_client_modeset_commit_locked+0x56/0x150 [drm]
[    5.483506]  drm_client_modeset_commit+0x24/0x40 [drm]
[    5.483524]  drm_fb_helper_set_par+0xa5/0xd0 [drm_kms_helper]
[    5.483533]  fbcon_init+0x264/0x4f0
[    5.483536]  visual_init+0xce/0x130
[    5.483539]  do_bind_con_driver.isra.0+0x1db/0x2e0
[    5.483541]  do_take_over_console+0x116/0x180
[    5.483542]  do_fbcon_takeover+0x5c/0xc0
[    5.483543]  register_framebuffer+0x1e4/0x300
[    5.483546]  __drm_fb_helper_initial_config_and_unlock+0x321/0x4a0
[drm_kms_helper]
[    5.483556]  amdgpu_fbdev_init+0xb9/0xf0 [amdgpu]
[    5.483664]  amdgpu_device_init.cold+0x1625/0x1ad5 [amdgpu]
[    5.483805]  ? pci_conf1_read+0xa4/0x100
[    5.483807]  ? pci_bus_read_config_word+0x49/0x70
[    5.483810]  amdgpu_driver_load_kms+0x64/0x260 [amdgpu]
[    5.483919]  amdgpu_pci_probe+0x10a/0x190 [amdgpu]
[    5.484021]  local_pci_probe+0x42/0x80
[    5.484023]  ? __cond_resched+0x16/0x40
[    5.484025]  pci_device_probe+0xfa/0x1b0
[    5.484027]  really_probe+0xf2/0x440
[    5.484029]  driver_probe_device+0xe1/0x150
[    5.484031]  device_driver_attach+0xa1/0xb0
[    5.484032]  __driver_attach+0x8a/0x150
[    5.484034]  ? device_driver_attach+0xb0/0xb0
[    5.484035]  ? device_driver_attach+0xb0/0xb0
[    5.484037]  bus_for_each_dev+0x78/0xc0
[    5.484038]  bus_add_driver+0x12b/0x1e0
[    5.484040]  driver_register+0x8b/0xe0
[    5.484042]  ? 0xffffffffc0f14000
[    5.484043]  do_one_initcall+0x44/0x1d0
[    5.484045]  ? do_init_module+0x23/0x260
[    5.484047]  ? kmem_cache_alloc_trace+0xfd/0x200
[    5.484049]  do_init_module+0x5c/0x260
[    5.484050]  __do_sys_finit_module+0xb1/0x110
[    5.484052]  do_syscall_64+0x33/0x80
[    5.484054]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    5.484056] RIP: 0033:0x7ff7450689b9
[    5.484057] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
[    5.484058] RSP: 002b:00007ffff1849268 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    5.484059] RAX: ffffffffffffffda RBX: 000055a1d6cd79f0 RCX:
00007ff7450689b9
[    5.484060] RDX: 0000000000000000 RSI: 00007ff7451f3e2d RDI:
0000000000000011
[    5.484061] RBP: 0000000000020000 R08: 0000000000000000 R09:
000055a1d6cd4e40
[    5.484061] R10: 0000000000000011 R11: 0000000000000246 R12:
00007ff7451f3e2d
[    5.484062] R13: 0000000000000000 R14: 000055a1d6cd7950 R15:
000055a1d6cd79f0
[    5.484063] ---[ end trace d62e2afb8d38cfd0 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
