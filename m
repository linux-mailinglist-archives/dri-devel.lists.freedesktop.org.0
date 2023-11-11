Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8577E8ACD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 13:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3341F10E280;
	Sat, 11 Nov 2023 12:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B1010E280
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 12:03:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D970160B08
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 12:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB60BC433CB
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699704237;
 bh=2KPKjIYqrVMEvL+1tUVK+1Hm76iGsXgNIk2LqytFOcw=;
 h=From:To:Subject:Date:From;
 b=nmBq+yrhdWAjTWhRIgZtTFow6bzg/hLloHfL84ku4uTYvs/If9F8+OC4ISYTJutZs
 zsmCdF3oRgpx6okB4riCGGHyNcAyp/zP9UGduwD4oqeGmhj5BGUrwHmvr1mOGl3lmR
 6tjnRWOYjMyjk25hv6M0277pGKxS+auiaD7vbe7sanx3rP7SxxJOr+4MMcU9oZJsW1
 TLcqw988CAKlKI7V3dlZJFck386nnQEJT2be1WgRwqbIijzncQrI2y0a1Ikw1L7x2u
 YtsKXpCT7KgGWMenOQ/5Dql7KI+BRp3ZzDYQq90qQNoxstH7BVM/RHD0sg4ePKzMQx
 EFtAiXYk+NMnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 912B9C53BD3; Sat, 11 Nov 2023 12:03:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218134] New: Null pointer when rearranging screen layout in XFCE.
Date: Sat, 11 Nov 2023 12:03:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gmack@innerfire.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218134-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218134

            Bug ID: 218134
           Summary: Null pointer when rearranging screen layout in XFCE.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: gmack@innerfire.net
        Regression: No

If I attempt to change my screen layout in XFCE, I get a kernel NULL pointer
crash.  This is very reproduceable.

[   50.275982] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[   50.275988] #PF: supervisor read access in kernel mode
[   50.275989] #PF: error_code(0x0000) - not-present page
[   50.275991] PGD 0 P4D 0=20
[   50.275993] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   50.275995] CPU: 18 PID: 1931 Comm: Xorg Not tainted 6.6.1 #106
d284c8807aa68b715e3e2f475c4079807a0b5cb5
[   50.275997] Hardware name: To Be Filled By O.E.M. B550 Taichi/B550 Taich=
i,
BIOS P3.20 09/27/2023
[   50.275999] RIP: 0010:drm_dp_atomic_find_time_slots+0x57/0x1e0
[drm_display_helper]
[   50.276007] Code: 0f 87 9d 01 00 00 48 8b 85 28 05 00 00 31 d2 48 63 80 =
88
00 00 00 41 3b 44 24 28 7d 0d 48 6b c0 28 49 03 44 24 30 48 8b 50 18 <48> 8=
b 42
08 48 89 ee 48 89 df 8b 88 90 00 00 00 b8 01 00 00 00 d3
[   50.276008] RSP: 0018:ffffad10544b76d8 EFLAGS: 00010286
[   50.276010] RAX: ffff9409ea510ca0 RBX: ffff940994c46900 RCX:
0000000000000002
[   50.276011] RDX: 0000000000000000 RSI: ffff940996bd0578 RDI:
ffff9409b11b7b00
[   50.276012] RBP: ffff94099317b800 R08: ffffad10544b7a58 R09:
0000000000000001
[   50.276012] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff9409b11b7b00
[   50.276013] R13: ffff940996bd0578 R14: 0000000000000224 R15:
0000000094c46900
[   50.276014] FS:  00007f4296208ac0(0000) GS:ffff94187ee80000(0000)
knlGS:0000000000000000
[   50.276015] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   50.276016] CR2: 0000000000000008 CR3: 000000010612e000 CR4:
0000000000f50ee0
[   50.276017] PKRU: 55555554
[   50.276018] Call Trace:
[   50.276020]  <TASK>
[   50.276021]  ? __die_body+0x15/0x54
[   50.276026]  ? page_fault_oops+0x323/0x36d
[   50.276030]  ? post_alloc_hook+0x9/0x50
[   50.276033]  ? prep_new_page+0x2c/0x41
[   50.276035]  ? get_page_from_freelist+0x6c4/0x7f6
[   50.276036]  ? exc_page_fault+0x159/0x4f9
[   50.276039]  ? asm_exc_page_fault+0x26/0x30
[   50.276043]  ? drm_dp_atomic_find_time_slots+0x57/0x1e0 [drm_display_hel=
per
13cd3e40727f81da5f41f67251f92c3e185bfce2]
[   50.276047]  ? drm_dp_atomic_find_time_slots+0x21/0x1e0 [drm_display_hel=
per
13cd3e40727f81da5f41f67251f92c3e185bfce2]
[   50.276051]  compute_mst_dsc_configs_for_link+0x29b/0x7fd [amdgpu
98fd76f1aa24e802b0010b76204b9775aacb3c0c]
[   50.276121]  ? free_tail_page_prepare+0xc0/0xdb
[   50.276123]  ? free_unref_page_commit+0x29/0xeb
[   50.276127]  compute_mst_dsc_configs_for_state+0x119/0x1a8 [amdgpu
98fd76f1aa24e802b0010b76204b9775aacb3c0c]
[   50.276178]  amdgpu_dm_atomic_check+0x9ba/0xd9e [amdgpu
98fd76f1aa24e802b0010b76204b9775aacb3c0c]
[   50.276229]  ? kmem_cache_debug_flags+0x5/0x11
[   50.276232]  ? amdgpu_dm_connector_atomic_duplicate_state+0x24/0xa4 [amd=
gpu
98fd76f1aa24e802b0010b76204b9775aacb3c0c]
[   50.276280]  ? kmem_cache_debug_flags+0x5/0x11
[   50.276281]  ? slab_post_alloc_hook+0x70/0x17f
[   50.276284]  ? slab_pre_alloc_hook.constprop.0+0x49/0x14c
[   50.276286]  ? amdgpu_dm_connector_atomic_duplicate_state+0x24/0xa4 [amd=
gpu
98fd76f1aa24e802b0010b76204b9775aacb3c0c]
[   50.276344]  ? __kmem_cache_alloc_node+0x10b/0x137
[   50.276345]  drm_atomic_check_only+0x6df/0x812
[   50.276349]  ? __drm_connector_put_safe+0x11/0x49
[   50.276351]  drm_atomic_commit+0x6a/0xc1
[   50.276352]  ? __drm_printfn_seq_file+0x17/0x17
[   50.276355]  ? __drm_printfn_seq_file+0x17/0x17
[   50.276356]  drm_atomic_connector_commit_dpms+0xc1/0xda
[   50.276358]  drm_mode_obj_set_property_ioctl+0xff/0x293
[   50.276361]  ? drm_connector_set_obj_prop+0x63/0x63
[   50.276362]  drm_connector_property_set_ioctl+0x36/0x51
[   50.276364]  drm_ioctl_kernel+0xe9/0x13c
[   50.276366]  drm_ioctl+0x278/0x3a4
[   50.276368]  ? drm_connector_set_obj_prop+0x63/0x63
[   50.276369]  ? rpm_resume+0x8b/0x3eb
[   50.276372]  amdgpu_drm_ioctl+0x4a/0x79 [amdgpu
98fd76f1aa24e802b0010b76204b9775aacb3c0c]
[   50.276414]  vfs_ioctl+0x1d/0x2b
[   50.276418]  __do_sys_ioctl+0x67/0x8a
[   50.276420]  do_syscall_64+0x82/0xa3
[   50.276422]  ? syscall_exit_to_user_mode+0x34/0x37
[   50.276424]  ? do_syscall_64+0x9c/0xa3
[   50.276425]  ? vfs_ioctl+0x1d/0x2b
[   50.276426]  ? __do_sys_ioctl+0x78/0x8a
[   50.276428]  ? exit_to_user_mode_prepare+0x15/0x108
[   50.276430]  ? syscall_exit_to_user_mode+0x34/0x37
[   50.276432]  ? do_syscall_64+0x9c/0xa3
[   50.276433]  ? syscall_exit_to_user_mode+0x34/0x37
[   50.276435]  ? do_syscall_64+0x9c/0xa3
[   50.276436]  ? do_syscall_64+0x9c/0xa3
[   50.276437]  ? do_syscall_64+0x9c/0xa3
[   50.276438]  ? do_syscall_64+0x9c/0xa3
[   50.276440]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   50.276442] RIP: 0033:0x7f4295f1b51b
[   50.276444] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00
00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c=
2 3d
00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   50.276445] RSP: 002b:00007ffc95c20100 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   50.276446] RAX: ffffffffffffffda RBX: 00005609596da8c0 RCX:
00007f4295f1b51b
[   50.276447] RDX: 00007ffc95c20190 RSI: 00000000c01064ab RDI:
000000000000000f
[   50.276448] RBP: 00007ffc95c20190 R08: 0000000000000000 R09:
00005609596dafe0
[   50.276449] R10: 0000000000000000 R11: 0000000000000246 R12:
00000000c01064ab
[   50.276449] R13: 000000000000000f R14: 00005609596d9340 R15:
0000000000000000
[   50.276451]  </TASK>
[   50.276451] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer tun l2tp=
_ppp
l2tp_netlink l2tp_core xfrm_interface xfrm6_tunnel pppox tunnel6 tunnel4
ppp_generic slhc xfrm_user xfrm_algo algif_hash algif_skcipher af_alg
binfmt_misc nls_utf8 nls_cp437 vfat fat squashfs crc32_pclmul polyval_clmul=
ni
polyval_generic ghash_clmulni_intel sha512_ssse3 uvcvideo aesni_intel wmi_b=
mof
crypto_simd videobuf2_vmalloc cryptd uvc btusb videobuf2_memops btrtl pcspkr
videobuf2_v4l2 btintel snd_usb_audio videobuf2_common btbcm ccp btmtk
snd_usbmidi_lib joydev snd_ump snd_rawmidi tpm_tis tpm_tis_core sg evdev
bonding tls lm92 msr loop efi_pstore dm_mod tpm rng_core ip_tables x_tables
autofs4 sd_mod raid10 raid456 async_raid6_recov async_memcpy async_pq async=
_xor
async_tx raid1 raid0 multipath linear md_mod amdgpu amdxcp drm_exec mfd_core
gpu_sched drm_buddy video drm_suballoc_helper i2c_algo_bit crc32c_intel
drm_ttm_helper hid_generic ttm atlantic usb_storage drm_display_helper sr_m=
od
cdrom wmi
[   50.276492] CR2: 0000000000000008
[   50.276494] ---[ end trace 0000000000000000 ]---
[   50.276494] RIP: 0010:drm_dp_atomic_find_time_slots+0x57/0x1e0
[drm_display_helper]
[   50.276499] Code: 0f 87 9d 01 00 00 48 8b 85 28 05 00 00 31 d2 48 63 80 =
88
00 00 00 41 3b 44 24 28 7d 0d 48 6b c0 28 49 03 44 24 30 48 8b 50 18 <48> 8=
b 42
08 48 89 ee 48 89 df 8b 88 90 00 00 00 b8 01 00 00 00 d3
[   50.276500] RSP: 0018:ffffad10544b76d8 EFLAGS: 00010286
[   50.276501] RAX: ffff9409ea510ca0 RBX: ffff940994c46900 RCX:
0000000000000002
[   50.276502] RDX: 0000000000000000 RSI: ffff940996bd0578 RDI:
ffff9409b11b7b00
[   50.276503] RBP: ffff94099317b800 R08: ffffad10544b7a58 R09:
0000000000000001
[   50.276503] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff9409b11b7b00
[   50.276504] R13: ffff940996bd0578 R14: 0000000000000224 R15:
0000000094c46900
[   50.276505] FS:  00007f4296208ac0(0000) GS:ffff94187ee80000(0000)
knlGS:0000000000000000
[   50.276506] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   50.276507] CR2: 0000000000000008 CR3: 000000010612e000 CR4:
0000000000f50ee0
[   50.276508] PKRU: 55555554
[   50.276508] note: Xorg[1931] exited with irqs disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
