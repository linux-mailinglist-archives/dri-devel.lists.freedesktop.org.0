Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12932500264
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F0110F1B4;
	Wed, 13 Apr 2022 23:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BEC10F1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:16:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01324B825E3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F791C385A3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649891798;
 bh=1cEfSCb3SkDZTxMHF1ru1Mw4D+YaIm+4guekayjIV/8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VPsvfkUqOvNVCGOrLjAkuFu68VVifCya487UHmX4X/s9eUaY0kpvBj4Vm9AG125cB
 L0k/bXKCvg4IbcbA3wXDVcq7VyKYyaYDHi2Sh1go1ZOar+QSTag3qt8M9WXASk71Tv
 Awmd9F/bYCDZjeFAtGebtpQpn26olgNuo2I3JZYspFxs+kI4gnEwwfQV9s61g+EYIN
 5/VfrItsbR5WKwhzESWvmu8NQL+NRsdFqAJJvAJ9HORynRLGXobNcS6Rzb+XqM2RC5
 wOHupCfKqxfGlAUfjefy1Cv2iJ3eKpxM2IrQOJix/plb8HhsFrtvkMtux9HI7CmlXU
 /j/0VM/0FWGfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 84995C05FD6; Wed, 13 Apr 2022 23:16:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215618] vblank related lockup during start of SteamVR using
 Valve Index HMD
Date: Wed, 13 Apr 2022 23:16:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ct.lrn@peuc.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215618-2300-hjPogOQFQY@https.bugzilla.kernel.org/>
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

Pierre Choffet (ct.lrn@peuc.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ct.lrn@peuc.net

--- Comment #1 from Pierre Choffet (ct.lrn@peuc.net) ---
I can reproduce the crash with a Radeon 6800XT in 5.17.1. GPU is then unsta=
ble
after it resets and system must be rebooted.

Here is my callstack - it's almost the same as the previous one:

> [drm:dm_vblank_get_counter [amdgpu]] *ERROR* dc_stream_state is NULL for =
crtc '1'!
> [drm:dm_crtc_get_scanoutpos [amdgpu]] *ERROR* dc_stream_state is NULL for=
 crtc '1'!
> [drm:dm_vblank_get_counter [amdgpu]] *ERROR* dc_stream_state is NULL for =
crtc '1'!
> ------------[ cut here ]------------
> amdgpu 0000:0b:00.0: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
> WARNING: CPU: 3 PID: 2263 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc_vb=
lank_helper_get_vblank_timestamp_internal+0x369/0x380
> Modules linked in: nf_tables nfnetlink snd_seq_dummy snd_hrtimer snd_seq =
cfg80211 8021q garp mrp stp llc nct6775 hwmon_vid eeepc_wmi intel_ra>
>  crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel aesni_int=
el ccp sr_mod xhci_pci crypto_simd cryptd rng_core cdrom xhci_pci_re>
> CPU: 3 PID: 2263 Comm: VulkanVblankThr Not tainted 5.17.1-arch1-1 #1 0ea9=
33cb6bfe82a8dc16ab834a4bccdd297f98b7
> Hardware name: ASUS System Product Name/ROG CROSSHAIR VIII DARK HERO, BIO=
S 3601 05/26/2021
> RIP: 0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x369/0x380
> Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 f0 6b 01 00 48 c7 c1 40 f3 d=
1 ad 4c 89 ea 48 c7 c7 c2 5d d1 ad 48 89 c6 e8 a3 43 3d 00 <0f> 0b e>
> RSP: 0018:ffff9beb86303b20 EFLAGS: 00010082
> RAX: 0000000000000000 RBX: ffffffffc0b7e840 RCX: 0000000000000027
> RDX: ffff8dca0eae1728 RSI: 0000000000000001 RDI: ffff8dca0eae1720
> RBP: ffff9beb86303b90 R08: 0000000000000000 R09: ffff9beb86303950
> R10: ffff9beb86303948 R11: ffff8dca2f2a9b28 R12: 0000000000000000
> R13: ffff8dc3023dae30 R14: 0000000000000000 R15: ffff8dc3376b21d8
> FS:  00007fa79444b640(0000) GS:ffff8dca0eac0000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fa6ec001278 CR3: 00000001e6984000 CR4: 0000000000750ee0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  drm_get_last_vbltimestamp+0xb2/0xc0
>  drm_update_vblank_count+0x91/0x3d0
>  drm_vblank_enable+0x14b/0x180
>  drm_vblank_get+0x95/0xe0
>  drm_crtc_queue_sequence_ioctl+0xfd/0x2d0
>  ? __check_object_size+0x46/0x140
>  ? drm_crtc_get_sequence_ioctl+0x1a0/0x1a0
>  drm_ioctl_kernel+0xb8/0x140
>  drm_ioctl+0x22a/0x3d0
>  ? drm_crtc_get_sequence_ioctl+0x1a0/0x1a0
>  amdgpu_drm_ioctl+0x49/0x80 [amdgpu 08a70cd20fdf14582ce9165e3698aeaecdd8c=
8f8]
>  __x64_sys_ioctl+0x82/0xb0
>  do_syscall_64+0x5c/0x80
>  ? do_user_addr_fault+0x1d7/0x690
>  ? do_syscall_64+0x69/0x80
>  ? exc_page_fault+0x72/0x170
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7fa7ac2a7e6f
> Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 4=
4 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c>
> RSP: 002b:00007fa79444ab00 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007fa79444ab90 RCX: 00007fa7ac2a7e6f
> RDX: 00007fa79444ab90 RSI: 00000000c018643c RDI: 000000000000004a
> RBP: 00000000c018643c R08: 0000000000000000 R09: 00007fa6ec000be0
> R10: 000000000000006e R11: 0000000000000246 R12: 000055d760b895b8
> R13: 000000000000004a R14: 000055d760c41d00 R15: 0000000000000000
>  </TASK>
> ---[ end trace 0000000000000000 ]---
> [drm:dm_vblank_get_counter [amdgpu]] *ERROR* dc_stream_state is NULL for =
crtc '1'!
> [drm:dm_crtc_get_scanoutpos [amdgpu]] *ERROR* dc_stream_state is NULL for=
 crtc '1'!
> [drm:dm_vblank_get_counter [amdgpu]] *ERROR* dc_stream_state is NULL for =
crtc '1'!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
