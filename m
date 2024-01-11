Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EF82B41B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C00810E989;
	Thu, 11 Jan 2024 17:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E164210E989
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:31:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E7C961B80
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFCB7C433F1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704994261;
 bh=L5p0HyBc5dSZ5OzGYTajznTvighydEMys3jKWayKfyU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MLo3P2qnzDEaSoLKz/K9jHItsWdtWFmAimPXOKjJ8AwPa0rh/EYCdgxNYT+qW7hLe
 OJNqglkhmmAmWYrZcIrQgqK2NieLnnO0jL2oyuo9kanLh+x/QBRoO6ItT28JaIYx7b
 TJZcqgeD2+Yynjc7z3iulJ5VvGH18OM6Hz/YaOuYAwXWxBmvEm5ZqnoFM8MpConJ5s
 UVIv1YiMhODwmJE0YS6sDvEOKaLZVG6XAzm7fjS3jbYWrr0xVgxvPsrySCUk4TJJHk
 tJ4eEu7pq/eGHONZlSUS9S0WDNTm53kRAQokonWmNOumCuo1h/U1IMthGXv8fh+eNB
 72J9U++m7/ivg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E08F2C53BCD; Thu, 11 Jan 2024 17:31:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218368] amdgpu crashes on loading on both kernel-6.6.9 and
 kernel-6.1.69 at cold boot
Date: Thu, 11 Jan 2024 17:31:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218368-2300-bJF3yy4U2F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218368-2300@https.bugzilla.kernel.org/>
References: <bug-218368-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218368

--- Comment #2 from nvaert1986 (nvaert1986@hotmail.com) ---
Jan 11 18:20:27  pc02 kernel: WARNING: CPU: 24 PID: 468 at 0xffffffffc06b26=
f1
Jan 11 18:20:27  pc02 kernel: Modules linked in: amdgpu(+) drm_ttm_helper
snd_hda_codec_hdmi ttm amdxcp drm_exec gpu_sched i2c_algo_bit kvm_amd drm_b=
uddy
snd_hda_intel mt7921e drm_suballoc_helper snd_intel_dspcfg mt7921_common
drm_display_helper mt792x_lib snd_hda_codec cec mt76_connac_lib igc
snd_hda_core mt>
Jan 11 18:20:27  pc02 kernel: CPU: 24 PID: 468 Comm: (udev-worker) Tainted:=
 G=20=20
     W  O       6.6.9-gentoo #2
Jan 11 18:20:27  pc02 kernel: Hardware name: ASUS System Product Name/ROG S=
TRIX
X670E-A GAMING WIFI, BIOS 1807 12/14/2023
Jan 11 18:20:27  pc02 kernel: RIP: 0010:0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29 =
89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 e9 14 eb 60 cf e9 9f =
fd
ff ff <0f> 0b b8 ea ff ff ff e9 03 eb 60 cf b8 ea ff ff ff e9 f9 ea 60 cf
Jan 11 18:20:27  pc02 kernel: RSP: 0018:ffffb7a6028bfb38 EFLAGS: 00010246
Jan 11 18:20:27  pc02 kernel: RAX: ffff9db705a29f8c RBX: ffff9db717219098 R=
CX:
0000000000000000
Jan 11 18:20:27  pc02 kernel: RDX: 0000000000000003 RSI: ffff9db7172278f0 R=
DI:
ffff9db717200000
Jan 11 18:20:27  pc02 kernel: RBP: ffff9db7172100f8 R08: 0000000000000000 R=
09:
ffff9dc63d897b40
Jan 11 18:20:27  pc02 kernel: R10: 0000000000000003 R11: ffffffff9050ef28 R=
12:
ffff9db7172104c8
Jan 11 18:20:27  pc02 kernel: R13: ffff9db717200010 R14: ffff9db717200000 R=
15:
00000000ffffff01
Jan 11 18:20:27  pc02 kernel: FS:  00007ff1f6fa5340(0000)
GS:ffff9dc63dc00000(0000) knlGS:0000000000000000
Jan 11 18:20:27  pc02 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jan 11 18:20:27  pc02 kernel: CR2: 00007f657532049c CR3: 00000001141f6000 C=
R4:
0000000000f50ee0
Jan 11 18:20:27  pc02 kernel: PKRU: 55555554
Jan 11 18:20:27  pc02 kernel: Call Trace:
Jan 11 18:20:27  pc02 kernel:  <TASK>
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f18ee7f
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fc8705e
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcaba9a
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcabb77
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fe0120a
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcc1205
Jan 11 18:20:27  pc02 kernel:  0xffffffffc063a3d7
Jan 11 18:20:27  pc02 kernel:  0xffffffffc06267f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f1b88a9
Jan 11 18:20:27  pc02 kernel:  0xffffffffc062c1a1
Jan 11 18:20:27  pc02 kernel:  0xffffffffc0623824
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f6b8754
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f82ce
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f7f8760
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f84ce
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f858a
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f87e3
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f6390
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f75d7
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f9414
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc0d8a000
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f000723
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f20ee3b
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f210fd1
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f21112c
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f211351
Jan 11 18:20:27  pc02 kernel:  0xffffffff8fcab7c4
Jan 11 18:20:27  pc02 kernel:  0xffffffff8fe000c7
Jan 11 18:20:27  pc02 kernel: RIP: 0033:0x00007ff1f7b4eca9
Jan 11 18:20:27  pc02 kernel: Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 =
00
00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2f e1 0c 00 f7 d8 64 89 01 48
Jan 11 18:20:27  pc02 kernel: RSP: 002b:00007ffd84d4f018 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Jan 11 18:20:27  pc02 kernel: RAX: ffffffffffffffda RBX: 00005641b982ad80 R=
CX:
00007ff1f7b4eca9
Jan 11 18:20:27  pc02 kernel: RDX: 0000000000000000 RSI: 00007ff1f7c3b2df R=
DI:
0000000000000017
Jan 11 18:20:27  pc02 kernel: RBP: 0000000000000000 R08: 0000000000000000 R=
09:
0000000000000000
Jan 11 18:20:27  pc02 kernel: R10: 0000000000000050 R11: 0000000000000246 R=
12:
00007ff1f7c3b2df
Jan 11 18:20:27  pc02 kernel: R13: 0000000000020000 R14: 00005641b9844ba0 R=
15:
0000000000000000
Jan 11 18:20:27  pc02 kernel:  </TASK>
Jan 11 18:20:27  pc02 kernel: ---[ end trace 0000000000000000 ]---
Jan 11 18:20:27  pc02 kernel: ------------[ cut here ]------------
Jan 11 18:20:27  pc02 kernel: WARNING: CPU: 24 PID: 468 at 0xffffffffc06b26=
f1
Jan 11 18:20:27  pc02 kernel: Modules linked in: amdgpu(+) drm_ttm_helper
snd_hda_codec_hdmi ttm amdxcp drm_exec gpu_sched i2c_algo_bit kvm_amd drm_b=
uddy
snd_hda_intel mt7921e drm_suballoc_helper snd_intel_dspcfg mt7921_common
drm_display_helper mt792x_lib snd_hda_codec cec mt76_connac_lib igc
snd_hda_core mt>
Jan 11 18:20:27  pc02 kernel: CPU: 24 PID: 468 Comm: (udev-worker) Tainted:=
 G=20=20
     W  O       6.6.9-gentoo #2
Jan 11 18:20:27  pc02 kernel: Hardware name: ASUS System Product Name/ROG S=
TRIX
X670E-A GAMING WIFI, BIOS 1807 12/14/2023
Jan 11 18:20:27  pc02 kernel: RIP: 0010:0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29 =
89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 e9 14 eb 60 cf e9 9f =
fd
ff ff <0f> 0b b8 ea ff ff ff e9 03 eb 60 cf b8 ea ff ff ff e9 f9 ea 60 cf
Jan 11 18:20:27  pc02 kernel: RSP: 0018:ffffb7a6028bfb38 EFLAGS: 00010246
Jan 11 18:20:27  pc02 kernel: RAX: ffff9db705a29f90 RBX: ffff9db717219448 R=
CX:
0000000000000000
Jan 11 18:20:27  pc02 kernel: RDX: 0000000000000004 RSI: ffff9db7172278f0 R=
DI:
ffff9db717200000
Jan 11 18:20:27  pc02 kernel: RBP: ffff9db717210100 R08: 0000000000000000 R=
09:
ffff9dc63d897b40
Jan 11 18:20:27  pc02 kernel: R10: 0000000000000003 R11: ffffffff9050ef28 R=
12:
ffff9db7172104c8
Jan 11 18:20:27  pc02 kernel: R13: ffff9db717200010 R14: ffff9db717200000 R=
15:
00000000ffffff01
Jan 11 18:20:27  pc02 kernel: FS:  00007ff1f6fa5340(0000)
GS:ffff9dc63dc00000(0000) knlGS:0000000000000000
Jan 11 18:20:27  pc02 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jan 11 18:20:27  pc02 kernel: CR2: 00007f657532049c CR3: 00000001141f6000 C=
R4:
0000000000f50ee0
Jan 11 18:20:27  pc02 kernel: PKRU: 55555554
Jan 11 18:20:27  pc02 kernel: Call Trace:
Jan 11 18:20:27  pc02 kernel:  <TASK>
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f18ee7f
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fc8705e
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcaba9a
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcabb77
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fe0120a
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcc1205
Jan 11 18:20:27  pc02 kernel:  0xffffffffc063a3d7
Jan 11 18:20:27  pc02 kernel:  0xffffffffc06267f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f1b88a9
Jan 11 18:20:27  pc02 kernel:  0xffffffffc062c1a1
Jan 11 18:20:27  pc02 kernel:  0xffffffffc0623824
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f6b8754
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f82ce
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f7f8760
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f84ce
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f858a
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f87e3
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f6390
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f75d7
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f9414
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc0d8a000
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f000723
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f20ee3b
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f210fd1
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f21112c
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f211351
Jan 11 18:20:27  pc02 kernel:  0xffffffff8fcab7c4
Jan 11 18:20:27  pc02 kernel:  0xffffffff8fe000c7
Jan 11 18:20:27  pc02 kernel: RIP: 0033:0x00007ff1f7b4eca9
Jan 11 18:20:27  pc02 kernel: Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 =
00
00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2f e1 0c 00 f7 d8 64 89 01 48
Jan 11 18:20:27  pc02 kernel: RSP: 002b:00007ffd84d4f018 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Jan 11 18:20:27  pc02 kernel: RAX: ffffffffffffffda RBX: 00005641b982ad80 R=
CX:
00007ff1f7b4eca9
Jan 11 18:20:27  pc02 kernel: RDX: 0000000000000000 RSI: 00007ff1f7c3b2df R=
DI:
0000000000000017
Jan 11 18:20:27  pc02 kernel: RBP: 0000000000000000 R08: 0000000000000000 R=
09:
0000000000000000
Jan 11 18:20:27  pc02 kernel: R10: 0000000000000050 R11: 0000000000000246 R=
12:
00007ff1f7c3b2df
Jan 11 18:20:27  pc02 kernel: R13: 0000000000020000 R14: 00005641b9844ba0 R=
15:
0000000000000000
Jan 11 18:20:27  pc02 kernel:  </TASK>
Jan 11 18:20:27  pc02 kernel: ---[ end trace 0000000000000000 ]---
Jan 11 18:20:27  pc02 kernel: ------------[ cut here ]------------
Jan 11 18:20:27  pc02 kernel: WARNING: CPU: 24 PID: 468 at 0xffffffffc06b26=
f1
Jan 11 18:20:27  pc02 kernel: Modules linked in: amdgpu(+) drm_ttm_helper
snd_hda_codec_hdmi ttm amdxcp drm_exec gpu_sched i2c_algo_bit kvm_amd drm_b=
uddy
snd_hda_intel mt7921e drm_suballoc_helper snd_intel_dspcfg mt7921_common
drm_display_helper mt792x_lib snd_hda_codec cec mt76_connac_lib igc
snd_hda_core mt>
Jan 11 18:20:27  pc02 kernel: CPU: 24 PID: 468 Comm: (udev-worker) Tainted:=
 G=20=20
     W  O       6.6.9-gentoo #2
Jan 11 18:20:27  pc02 kernel: Hardware name: ASUS System Product Name/ROG S=
TRIX
X670E-A GAMING WIFI, BIOS 1807 12/14/2023
Jan 11 18:20:27  pc02 kernel: RIP: 0010:0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29 =
89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 e9 14 eb 60 cf e9 9f =
fd
ff ff <0f> 0b b8 ea ff ff ff e9 03 eb 60 cf b8 ea ff ff ff e9 f9 ea 60 cf
Jan 11 18:20:27  pc02 kernel: RSP: 0018:ffffb7a6028bfb38 EFLAGS: 00010246
Jan 11 18:20:27  pc02 kernel: RAX: ffff9db705a29f94 RBX: ffff9db7172197f8 R=
CX:
0000000000000000
Jan 11 18:20:27  pc02 kernel: RDX: 0000000000000005 RSI: ffff9db7172278f0 R=
DI:
ffff9db717200000
Jan 11 18:20:27  pc02 kernel: RBP: ffff9db717210108 R08: 0000000000000000 R=
09:
ffff9dc63d897b40
Jan 11 18:20:27  pc02 kernel: R10: 0000000000000003 R11: ffffffff9050ef28 R=
12:
ffff9db7172104c8
Jan 11 18:20:27  pc02 kernel: R13: ffff9db717200010 R14: ffff9db717200000 R=
15:
00000000ffffff01
Jan 11 18:20:27  pc02 kernel: FS:  00007ff1f6fa5340(0000)
GS:ffff9dc63dc00000(0000) knlGS:0000000000000000
Jan 11 18:20:27  pc02 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jan 11 18:20:27  pc02 kernel: CR2: 00007f657532049c CR3: 00000001141f6000 C=
R4:
0000000000f50ee0
Jan 11 18:20:27  pc02 kernel: PKRU: 55555554
Jan 11 18:20:27  pc02 kernel: Call Trace:
Jan 11 18:20:27  pc02 kernel:  <TASK>
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f18ee7f
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fc8705e
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcaba9a
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcabb77
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fe0120a
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc06b26f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8fcc1205
Jan 11 18:20:27  pc02 kernel:  0xffffffffc063a3d7
Jan 11 18:20:27  pc02 kernel:  0xffffffffc06267f1
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f1b88a9
Jan 11 18:20:27  pc02 kernel:  0xffffffffc062c1a1
Jan 11 18:20:27  pc02 kernel:  0xffffffffc0623824
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f6b8754
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f82ce
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffff8f7f8760
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f84ce
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f858a
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f87e3
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f6390
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f75d7
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f7f9414
Jan 11 18:20:27  pc02 kernel:  ? 0xffffffffc0d8a000
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f000723
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f20ee3b
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f210fd1
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f21112c
Jan 11 18:20:27  pc02 kernel:  0xffffffff8f211351
Jan 11 18:20:27  pc02 kernel:  0xffffffff8fcab7c4
Jan 11 18:20:27  pc02 kernel:  0xffffffff8fe000c7
Jan 11 18:20:27  pc02 kernel: RIP: 0033:0x00007ff1f7b4eca9
Jan 11 18:20:27  pc02 kernel: Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 =
00
00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2f e1 0c 00 f7 d8 64 89 01 48
Jan 11 18:20:27  pc02 kernel: RSP: 002b:00007ffd84d4f018 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Jan 11 18:20:27  pc02 kernel: RAX: ffffffffffffffda RBX: 00005641b982ad80 R=
CX:
00007ff1f7b4eca9
Jan 11 18:20:27  pc02 kernel: RDX: 0000000000000000 RSI: 00007ff1f7c3b2df R=
DI:
0000000000000017
Jan 11 18:20:27  pc02 kernel: RBP: 0000000000000000 R08: 0000000000000000 R=
09:
0000000000000000
Jan 11 18:20:27  pc02 kernel: R10: 0000000000000050 R11: 0000000000000246 R=
12:
00007ff1f7c3b2df
Jan 11 18:20:27  pc02 kernel: R13: 0000000000020000 R14: 00005641b9844ba0 R=
15:
0000000000000000
Jan 11 18:20:27  pc02 kernel:  </TASK>
Jan 11 18:20:27  pc02 kernel: ---[ end trace 0000000000000000 ]---
Jan 11 18:20:27  pc02 kernel: ------------[ cut here ]------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
