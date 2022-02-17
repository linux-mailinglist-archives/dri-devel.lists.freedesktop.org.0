Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C884BA8AE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B4210E265;
	Thu, 17 Feb 2022 18:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EBA10E265
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:48:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B39C61B8F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7EBDC340E8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645123685;
 bh=lIEfk+ufR2Ni3YqQHnpt50hwm46PJN1AR3TtMCaD0hQ=;
 h=From:To:Subject:Date:From;
 b=S6DRJFTQU4mFNLSFXe7qYHU3l7oyC3jHUErgs1SV9pT9rsmc8v5vc+zko1Go4HDJj
 Mb0auL9Cl9kKdhO1d3DqZeL7dLfQAXL4A4B/gCyXCWO+AZuYRK75wmWrfCbdldVQ6O
 rx3/mVyVTzqFzm8iMRLepnMH5ldzjL48OrKOJUBXSQrqmisB5jps0pxxs3NTQscZR0
 /sBvfxpWzThE++Y8K/0L2yXNtweQ83F4xCzKUPNXsoYdYKcZbv7Req10T8zyANrSG4
 CJNzhF21HQNpnMCiQWLxkb4HhNDXIxz41P7wsv9uDxZb7pmlHnSo/nJmWCVll3H7fq
 CzLeje/QZLbpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A5FFCC05FE2; Thu, 17 Feb 2022 18:48:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215618] New: vblank related lockup during start of SteamVR
 using Valve Index HMD
Date: Thu, 17 Feb 2022 18:48:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: farmboy0@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215618-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215618

            Bug ID: 215618
           Summary: vblank related lockup during start of SteamVR using
                    Valve Index HMD
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16.9
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: farmboy0@googlemail.com
        Regression: No

Happens on nearly every SteamVR start but not always.

Feb 17 00:06:29 kernel: [  125.716702] [drm:dm_vblank_get_counter] *ERROR*
dc_stream_state is NULL for crtc '1'!
Feb 17 00:06:29 kernel: [  125.716711] [drm:dm_crtc_get_scanoutpos] *ERROR*
dc_stream_state is NULL for crtc '1'!
Feb 17 00:06:29 kernel: [  125.716713] [drm:dm_vblank_get_counter] *ERROR*
dc_stream_state is NULL for crtc '1'!
Feb 17 00:06:29 kernel: [  125.716715] ------------[ cut here ]------------
Feb 17 00:06:29 kernel: [  125.716715] amdgpu 0000:29:00.0:
drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
Feb 17 00:06:29 kernel: [  125.716722] WARNING: CPU: 9 PID: 4516 at
drivers/gpu/drm/drm_vblank.c:728
drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x367/0x380
Feb 17 00:06:29 kernel: [  125.716728] Modules linked in: joydev
Feb 17 00:06:29 kernel: [  125.716730] CPU: 9 PID: 4516 Comm: VulkanVblankT=
hr
Not tainted 5.16.9 #1
Feb 17 00:06:29 kernel: [  125.716732] Hardware name: Micro-Star Internatio=
nal
Co., Ltd. MS-7A31/X370 XPOWER GAMING TITANIUM (MS-7A31), BIOS 1.MS 06/24/20=
20
Feb 17 00:06:29 kernel: [  125.716734] RIP:
0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x367/0x380
Feb 17 00:06:29 kernel: [  125.716737] Code: 4c 8b 6f 50 4d 85 ed 75 03 4c =
8b
2f e8 82 a7 35 00 48 c7 c1 d0 ca f1 ae 48 89 c6 4c 89 ea 48 c7 c7 92 36 f1 =
ae
e8 cd 56 7d 00 <0f> 0b e9 ba fe ff ff e8 cd e0 84 00 66 66 2e 0f 1f 84 00 0=
0 00
00
Feb 17 00:06:29 kernel: [  125.716738] RSP: 0018:ffffad1f42d63b20 EFLAGS:
00010082
Feb 17 00:06:29 kernel: [  125.716740] RAX: 0000000000000000 RBX:
ffffffffad6e9060 RCX: 0000000000000000
Feb 17 00:06:29 kernel: [  125.716741] RDX: 0000000000000003 RSI:
ffffffffaeee68eb RDI: 00000000ffffffff
Feb 17 00:06:29 kernel: [  125.716742] RBP: ffffad1f42d63bb8 R08:
0000000000000000 R09: ffffad1f42d63958
Feb 17 00:06:29 kernel: [  125.716743] R10: 0000000000000001 R11:
0000000000000001 R12: 0000000000000000
Feb 17 00:06:29 kernel: [  125.716744] R13: ffffa369c190c660 R14:
0000000000000000 R15: ffffa369c565e9d8
Feb 17 00:06:29 kernel: [  125.716745] FS:  00007fb348913640(0000)
GS:ffffa370bea40000(0000) knlGS:0000000000000000
Feb 17 00:06:29 kernel: [  125.716746] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Feb 17 00:06:29 kernel: [  125.716747] CR2: 00007fb31c001248 CR3:
00000001cbf37000 CR4: 00000000003506e0
Feb 17 00:06:29 kernel: [  125.716748] Call Trace:
Feb 17 00:06:29 kernel: [  125.716750]  <TASK>
Feb 17 00:06:29 kernel: [  125.716752]  ? __drm_err+0x72/0x90
Feb 17 00:06:29 kernel: [  125.716755]  drm_get_last_vbltimestamp+0xc8/0xe0
Feb 17 00:06:29 kernel: [  125.716758]  drm_update_vblank_count+0x84/0x3d0
Feb 17 00:06:29 kernel: [  125.716759]  ? queue_work_on+0x79/0x80
Feb 17 00:06:29 kernel: [  125.716763]  drm_vblank_enable+0x16b/0x1a0
Feb 17 00:06:29 kernel: [  125.716765]  drm_vblank_get+0xb8/0x100
Feb 17 00:06:29 kernel: [  125.716767]=20
drm_crtc_queue_sequence_ioctl+0x112/0x2d0
Feb 17 00:06:29 kernel: [  125.716769]  ? _drm_lease_held+0x46/0x80
Feb 17 00:06:29 kernel: [  125.716771]  ?
drm_crtc_get_sequence_ioctl+0x1c0/0x1c0
Feb 17 00:06:29 kernel: [  125.716773]  drm_ioctl_kernel+0xd4/0x170
Feb 17 00:06:29 kernel: [  125.716776]  drm_ioctl+0x270/0x430
Feb 17 00:06:29 kernel: [  125.716777]  ? __check_object_size+0x68/0x180
Feb 17 00:06:29 kernel: [  125.716781]  ?
drm_crtc_get_sequence_ioctl+0x1c0/0x1c0
Feb 17 00:06:29 kernel: [  125.716783]  ? smk_tskacc+0xd7/0x110
Feb 17 00:06:29 kernel: [  125.716786]  ? smack_file_ioctl+0xdb/0x120
Feb 17 00:06:29 kernel: [  125.716788]  ? trace_hardirqs_on+0x35/0xf0
Feb 17 00:06:29 kernel: [  125.716791]  amdgpu_drm_ioctl+0x5d/0xa0
Feb 17 00:06:29 kernel: [  125.716793]  __x64_sys_ioctl+0xac/0xe0
Feb 17 00:06:29 kernel: [  125.716796]  ? trace_hardirqs_on+0x35/0xf0
Feb 17 00:06:29 kernel: [  125.716797]  do_syscall_64+0x5c/0x80
Feb 17 00:06:29 kernel: [  125.716800]  ? exit_to_user_mode_prepare+0x44/0x=
1a0
Feb 17 00:06:29 kernel: [  125.716803]  ? trace_hardirqs_on_prepare+0x24/0x=
90
Feb 17 00:06:29 kernel: [  125.716805]  ? syscall_exit_to_user_mode+0x29/0x=
60
Feb 17 00:06:29 kernel: [  125.716807]  ? do_syscall_64+0x69/0x80
Feb 17 00:06:29 kernel: [  125.716809]=20
entry_SYSCALL_64_after_hwframe+0x44/0xae
Feb 17 00:06:29 kernel: [  125.716812] RIP: 0033:0x7fb398cdaa97
Feb 17 00:06:29 kernel: [  125.716813] Code: 3c 1c e8 1c ff ff ff 85 c0 79 =
87
49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 =
10
00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a9 63 0c 00 f7 d8 64 8=
9 01
48
Feb 17 00:06:29 kernel: [  125.716815] RSP: 002b:00007fb348912af8 EFLAGS:
00000246 ORIG_RAX: 0000000000000010
Feb 17 00:06:29 kernel: [  125.716816] RAX: ffffffffffffffda RBX:
00007fb348912b30 RCX: 00007fb398cdaa97
Feb 17 00:06:29 kernel: [  125.716817] RDX: 00007fb348912b30 RSI:
00000000c018643c RDI: 0000000000000050
Feb 17 00:06:29 kernel: [  125.716818] RBP: 00000000c018643c R08:
0000000000000000 R09: 00007fb31c000bd0
Feb 17 00:06:29 kernel: [  125.716819] R10: 0000000000000000 R11:
0000000000000246 R12: 00005652b28e1de8
Feb 17 00:06:29 kernel: [  125.716820] R13: 0000000000000050 R14:
00005652b29acef0 R15: 00005652b28e1da0
Feb 17 00:06:29 kernel: [  125.716822]  </TASK>
Feb 17 00:06:29 kernel: [  125.716822] ---[ end trace e8b4537a57c9dbe1 ]---
Feb 17 00:06:29 kernel: [  125.716823] [drm:dm_vblank_get_counter] *ERROR*
dc_stream_state is NULL for crtc '1'!
Feb 17 00:06:29 kernel: [  125.716825] [drm:dm_crtc_get_scanoutpos] *ERROR*
dc_stream_state is NULL for crtc '1'!
Feb 17 00:06:29 kernel: [  125.716827] [drm:dm_vblank_get_counter] *ERROR*
dc_stream_state is NULL for crtc '1'!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
