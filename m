Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522B52F8BE
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 06:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F591129B0;
	Sat, 21 May 2022 04:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABD71129B0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 04:50:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E8D560BA1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 04:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E4B5C34115
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 04:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653108631;
 bh=u2TNrbGCWPzTEwjb15D+6AuDWcAPX/VTUhZMGTxyjAI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dWckQ76th7YJz+Ykx6r6Z5NMHGJyN3TYdzySxzmfz+FX4s+jiFLm4JHKun4HOH8Ox
 6Sl8eaMLLkSrpQT2DEbGJTFUarGnOFULraHQdxWno2G8V/d40e+asy3dAtu0yJ49XF
 h2XcPn+VVDieodG1RAJ5FOStF3vIOd05kr7VegjJgFZXOcA99mE4rqJmA0P2RTVjVj
 gFdV7kEy1bs+0/pAHsKPtvoe5I3xIUyXIJzjjED/eHYd/XAQqUNandybnHIz8nFP9R
 rCjoTq26ihzBCb45zQRVIyJYFJF54YCISFpnTItCwNarl0I8YXD4wQxYTqzqoXeyF5
 WMq2TY2GUrAQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 349CDC05FD5; Sat, 21 May 2022 04:50:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215618] vblank related lockup during start of SteamVR using
 Valve Index HMD
Date: Sat, 21 May 2022 04:50:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: primalucegd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215618-2300-twufyIxcmZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215618-2300@https.bugzilla.kernel.org/>
References: <bug-215618-2300@https.bugzilla.kernel.org/>
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

Aurorans Solis (primalucegd@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |primalucegd@gmail.com

--- Comment #2 from Aurorans Solis (primalucegd@gmail.com) ---
Hello, wanted to confirm that I also have gotten this issue using an HTC Vi=
ve
HMD on kernel version 5.15.32. Here's /var/log/messages for the first few
seconds before the crash, the actual crash log, and the few messages before=
 the
system finally shut down. This is consistent on the game "Jet Island" when
attempting to load into the game world - the menus in the game prior to doi=
ng
so appear to present no issues.

May 17 18:48:15 auro-desktop steam[6275]: LHR-84CF93F9: Triggered keepalive
(succeeded)=20
May 17 18:48:15 auro-desktop steam[6275]: LHR-84CF93F9: Packet received aft=
er
0.019s, keepalive (0/1)=20
May 17 18:48:18 auro-desktop kernel: ------------[ cut here ]------------
May 17 18:48:18 auro-desktop kernel: amdgpu 0000:01:00.0:
drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
May 17 18:48:18 auro-desktop kernel: WARNING: CPU: 0 PID: 6896 at
drivers/gpu/drm/drm_vblank.c:728
drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x34b/0x360
May 17 18:48:18 auro-desktop kernel: Modules linked in: rfcomm xt_CHECKSUM
xt_MASQUERADE xt_conntrack iptable_nat algif_hash algif_skcipher af_alg bnep
nvidia_drm(PO) nvidia_modeset(PO) mxm_wmi x86_pkg_temp_thermal btusb nvidia=
(PO)
btrtl btbcm btintel bluetooth kvm_intel ecdh_generic ecc iwlmvm amdgpu iwlw=
ifi
drm_ttm_helper wmi gpu_sched vboxnetflt(O) vboxnetadp(O) vboxdrv(O)
v4l2loopback(O) efivarfs
May 17 18:48:18 auro-desktop kernel: CPU: 0 PID: 6896 Comm: VulkanVblankThr
Tainted: P           O      5.15.32-gentoo-r1 #1
May 17 18:48:18 auro-desktop kernel: Hardware name: Gigabyte Technology Co.,
Ltd. Z170XP-SLI/Z170XP-SLI-CF, BIOS F22d 01/11/2018
May 17 18:48:18 auro-desktop kernel: RIP:
0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x34b/0x360
May 17 18:48:18 auro-desktop kernel: Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b=
 2f
e8 ae 6b 16 00 48 c7 c1 80 47 37 9b 4c 89 ea 48 c7 c7 4b b5 36 9b 48 89 c6 =
e8
1f 60 77 00 <0f> 0b e9 d0 fe ff ff e8 99 d7 7e 00 66 0f 1f 84 00 00 00 00 0=
0 0f
May 17 18:48:18 auro-desktop kernel: RSP: 0018:ffffafa8c29efbc8 EFLAGS:
00010082
May 17 18:48:18 auro-desktop kernel: RAX: 0000000000000000 RBX:
ffffffffc04e80e0 RCX: 0000000000000027
May 17 18:48:18 auro-desktop kernel: RDX: ffff96a95ec1b458 RSI:
0000000000000001 RDI: ffff96a95ec1b450
May 17 18:48:18 auro-desktop kernel: RBP: ffffafa8c29efc38 R08:
ffffffff9b74a9c8 R09: 00000000ffffdfff
May 17 18:48:18 auro-desktop kernel: R10: ffffffff9b66a9e0 R11:
ffffffff9b66a9e0 R12: 0000000000000000
May 17 18:48:18 auro-desktop kernel: R13: ffff96a240ef4ad0 R14:
0000000000000000 R15: ffff96a24e53a9d8
May 17 18:48:18 auro-desktop kernel: FS:  00007fd630203640(0000)
GS:ffff96a95ec00000(0000) knlGS:0000000000000000
May 17 18:48:18 auro-desktop kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 17 18:48:18 auro-desktop kernel: CR2: 00007fd60c001268 CR3:
00000001b9df0003 CR4: 00000000003706f0
May 17 18:48:18 auro-desktop kernel: DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
May 17 18:48:18 auro-desktop kernel: DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
May 17 18:48:18 auro-desktop kernel: Call Trace:
May 17 18:48:18 auro-desktop kernel:  <TASK>
May 17 18:48:18 auro-desktop kernel:  drm_get_last_vbltimestamp+0xaa/0xc0
May 17 18:48:18 auro-desktop kernel:  drm_update_vblank_count+0x88/0x3c0
May 17 18:48:18 auro-desktop kernel:  drm_vblank_enable+0x154/0x190
May 17 18:48:18 auro-desktop kernel:  drm_vblank_get+0x95/0xe0
May 17 18:48:18 auro-desktop kernel:  drm_crtc_queue_sequence_ioctl+0xea/0x=
290
May 17 18:48:18 auro-desktop kernel:  ? drm_crtc_get_sequence_ioctl+0x190/0=
x190
May 17 18:48:18 auro-desktop kernel:  drm_ioctl_kernel+0xaa/0xf0
May 17 18:48:18 auro-desktop kernel:  drm_ioctl+0x1ff/0x3d0
May 17 18:48:18 auro-desktop kernel:  ? drm_crtc_get_sequence_ioctl+0x190/0=
x190
May 17 18:48:18 auro-desktop kernel:  ? selinux_file_ioctl+0x144/0x250
May 17 18:48:18 auro-desktop kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
May 17 18:48:18 auro-desktop kernel:  __x64_sys_ioctl+0x82/0xb0
May 17 18:48:18 auro-desktop kernel:  do_syscall_64+0x3b/0x90
May 17 18:48:18 auro-desktop kernel:  entry_SYSCALL_64_after_hwframe+0x44/0=
xae
May 17 18:48:18 auro-desktop kernel: RIP: 0033:0x7fd6502b7457
May 17 18:48:18 auro-desktop kernel: Code: 3c 1c e8 2c ff ff ff 85 c0 79 97=
 5b
49 c7 c4 ff ff ff ff 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 =
00
00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 e9 0e 00 f7 d8 64 89 0=
1 48
May 17 18:48:18 auro-desktop kernel: RSP: 002b:00007fd630202af8 EFLAGS:
00000246 ORIG_RAX: 0000000000000010
May 17 18:48:18 auro-desktop kernel: RAX: ffffffffffffffda RBX:
00007fd630202b30 RCX: 00007fd6502b7457
May 17 18:48:18 auro-desktop kernel: RDX: 00007fd630202b30 RSI:
00000000c018643c RDI: 0000000000000056
May 17 18:48:18 auro-desktop kernel: RBP: 00000000c018643c R08:
0000000000000000 R09: 00007fd60c000bd0
May 17 18:48:18 auro-desktop kernel: R10: 00007fd64c846b70 R11:
0000000000000246 R12: 000055d3a8389898
May 17 18:48:18 auro-desktop kernel: R13: 0000000000000056 R14:
000055d3a8521b00 R15: 000055d3a8389850
May 17 18:48:18 auro-desktop kernel:  </TASK>
May 17 18:48:18 auro-desktop kernel: ---[ end trace ece90a9627f14e87 ]---
May 17 18:48:26 auro-desktop crash_20220517184826_2.dmp[7049]: Uploading du=
mp
(out-of-process) /tmp/dumps/crash_20220517184826_2.dmp=20
May 17 18:48:26 auro-desktop kernel: RenderThread[6902]: segfault at 0 ip
000055d3a6274c7b sp 00007fd5fb5f9ee0 error 4 in
vrcompositor[55d3a6035000+4bc000]
May 17 18:48:26 auro-desktop kernel: Code: f8 ff ff 66 90 66 2e 0f 1f 84 00=
 00
00 00 00 55 48 89 e5 41 56 41 89 ce 41 55 49 89 fd 48 89 f7 41 54 49 89 d4 =
53
48 83 ec 30 <48> 8b 06 ff 50 18 f6 40 1c 10 48 89 c3 0f 85 02 01 00 00 48 8=
d 45
May 17 18:48:42 auro-desktop crash_20220517184842_2.dmp[7178]: Uploading du=
mp
(out-of-process) /tmp/dumps/crash_20220517184842_2.dmp=20
May 17 18:48:42 auro-desktop kernel: traps: vrmonitor[6912] trap divide err=
or
ip:7f5e4ab3b893 sp:7ffebc5ed130 error:0 in
libQt5XcbQpa.so.5[7f5e4aad5000+15b000]
May 17 18:48:43 auro-desktop crash_20220517184842_2.dmp[7178]: Finished
uploading minidump (out-of-process): success =3D yes=20
May 17 18:48:43 auro-desktop crash_20220517184842_2.dmp[7178]: response:
CrashID=3Dbp-5c64aa69-8191-446a-9bbd-78d142220517=20
May 17 18:48:43 auro-desktop crash_20220517184842_2.dmp[7178]: file
''/tmp/dumps/crash_20220517184842_2.dmp'', upload yes:
''CrashID=3Dbp-5c64aa69-8191-446a-9bbd-78d142220517''=20
May 17 18:49:17 auro-desktop crash_20220517184826_2.dmp[7049]: Finished
uploading minidump (out-of-process): success =3D no=20
May 17 18:49:17 auro-desktop crash_20220517184826_2.dmp[7049]: error: HTTP
response code said error=20
May 17 18:49:17 auro-desktop crash_20220517184826_2.dmp[7049]: file
''/tmp/dumps/crash_20220517184826_2.dmp'', upload no: ''HTTP response code =
said
error''

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
