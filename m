Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DA245578
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 04:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2DA6E0E4;
	Sun, 16 Aug 2020 02:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF00D6E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 02:36:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208913] New: amdgpu: RIP:
 0010:amdgpu_dm_atomic_commit_tail+0x1cce/0x1de0
Date: Sun, 16 Aug 2020 02:36:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexander@tsoy.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208913-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208913

            Bug ID: 208913
           Summary: amdgpu: RIP:
                    0010:amdgpu_dm_atomic_commit_tail+0x1cce/0x1de0
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.58
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alexander@tsoy.me
        Regression: No

Created attachment 290913
  --> https://bugzilla.kernel.org/attachment.cgi?id=290913&action=edit
dmesg

I'm using 5.4.x kernels for quite some time. And recently X server started to
hang sometimes after switching users. It starts using 100% CPU and killing it
with sigkill is the only thing I can do. I'm using GNOME, so each user has its
own X server.

I believe this is caused by the following patch that was included in 5.4.56:

"drm/amd/display: Clear dm_state for fast updates"

But since the issue is not 100% reproducible, I need some time to confirm it.


From dmesg:

[99448.103350] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[99458.343984] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
[PLANE:45:plane-5] flip_done timed out
[99458.353716] ------------[ cut here ]------------
[99458.358491] WARNING: CPU: 1 PID: 2240 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5883
amdgpu_dm_atomic_commit_tail+0x1cce/0x1de0 [amdgpu]
[99458.372659] Modules linked in: ebtable_filter ebtables netconsole bridge stp
llc wireguard curve25519_x86_64 libchacha20poly1305 ip6_udp_tunnel udp_tunnel
libblake2s blake2s_x86_64 libcurve25519_generic libblake2s_generic xt_limit
xt_comment xt_recent xt_MASQUERADE xt_multiport iptable_nat nf_nat
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT iptable_raw ip6table_raw
snd_seq_midi snd_seq_midi_event uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2 videodev amd64_edac_mod snd_usb_audio kvm_amd videobuf2_common
kvm snd_usbmidi_lib snd_rawmidi joydev snd_hda_codec_hdmi irqbypass pcspkr
snd_hda_intel snd_intel_nhlt snd_hda_codec snd_hwdep sp5100_tco e1000e
snd_hda_core snd_pcm tcp_yeah tcp_vegas sch_fq_codel nfsd amdgpu crc32c_intel
mgag200 drm_vram_helper gpu_sched ttm vhost_scsi target_core_mod configfs
vhost_net tun tap vhost vhba(O) jc42 ipmi_si ipmi_devintf ipmi_msghandler fuse
eeprom
[99458.452852] CPU: 1 PID: 2240 Comm: X Tainted: G           O    T
5.4.58-gentoo #1
[99458.460345] Hardware name: Supermicro H8SCM/H8SCM, BIOS 3.5b      
03/18/2016
[99458.467620] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1cce/0x1de0 [amdgpu]
[99458.474412] Code: 70 fb ff ff 41 8b 4c 24 60 48 c7 c2 c0 92 59 c0 bf 02 00
00 00 48 c7 c6 28 69 5f c0 e8 0b a0 32 ca 49 8b 57 08 e9 09 e5 ff ff <0f> 0b e9
c3 f0 ff ff 0f 0b 0f 0b e9 d9 f0 ff ff 48 8b 85 38 fd ff
[99458.493248] RSP: 0018:ffff9b20c277b840 EFLAGS: 00010002
[99458.498473] RAX: 0000000000000002 RBX: 00000000000004d6 RCX:
0000000000000000
[99458.505634] RDX: 0000000000000001 RSI: 0000000000000206 RDI:
0000000000000000
[99458.512792] RBP: ffff9b20c277bb70 R08: ffff9b20c277b7a4 R09:
0000000000000000
[99458.519941] R10: 0000000000000001 R11: 0000000000000000 R12:
0000000000000286
[99458.527100] R13: ffff8f41ba0b8c00 R14: ffff8f4585fc0000 R15:
ffff8f4588b57000
[99458.534254] FS:  00007fc7988b2dc0(0000) GS:ffff8f4696a40000(0000)
knlGS:0000000000000000
[99458.542364] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[99458.548129] CR2: 00007f8a3e4eb950 CR3: 0000000811b4c000 CR4:
00000000000406e0
[99458.555287] Call Trace:
[99458.557750]  ? __switch_to_asm+0x40/0x70
[99458.561689]  ? commit_tail+0x8f/0x110
[99458.565402]  commit_tail+0x8f/0x110
[99458.568899]  drm_atomic_helper_commit+0xb9/0x130
[99458.573519]  drm_atomic_helper_set_config+0x75/0x90
[99458.578407]  drm_mode_setcrtc+0x1f5/0x730
[99458.582433]  ? drm_mode_getcrtc+0x180/0x180
[99458.586621]  drm_ioctl_kernel+0xb0/0x100
[99458.590551]  drm_ioctl+0x20d/0x370
[99458.593963]  ? drm_mode_getcrtc+0x180/0x180
[99458.598225]  amdgpu_drm_ioctl+0x44/0x80 [amdgpu]
[99458.602849]  do_vfs_ioctl+0x46c/0x710
[99458.606522]  ? __fget+0x6c/0xa0
[99458.609667]  ksys_ioctl+0x5b/0x90
[99458.612986]  __x64_sys_ioctl+0x15/0x20
[99458.616741]  do_syscall_64+0x46/0xf0
[99458.620323]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[99458.625433] RIP: 0033:0x7fc798138d87
[99458.629013] Code: 00 00 90 48 8b 05 f9 40 0c 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d c9 40 0c 00 f7 d8 64 89 01 48
[99458.647862] RSP: 002b:00007fff6e3bf348 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[99458.655447] RAX: ffffffffffffffda RBX: 00007fff6e3bf380 RCX:
00007fc798138d87
[99458.662606] RDX: 00007fff6e3bf380 RSI: 00000000c06864a2 RDI:
000000000000000c
[99458.669764] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000557cbb19ab20
[99458.676920] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[99458.684064] R13: 000000000000000c R14: 0000557cba4c5810 R15:
0000000000000000
[99458.691226] ---[ end trace a04ff37c5785331b ]---
[99458.695881] ------------[ cut here ]------------
[99458.700621] WARNING: CPU: 1 PID: 2240 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5485
amdgpu_dm_atomic_commit_tail+0x1cd7/0x1de0 [amdgpu]
[99458.714771] Modules linked in: ebtable_filter ebtables netconsole bridge stp
llc wireguard curve25519_x86_64 libchacha20poly1305 ip6_udp_tunnel udp_tunnel
libblake2s blake2s_x86_64 libcurve25519_generic libblake2s_generic xt_limit
xt_comment xt_recent xt_MASQUERADE xt_multiport iptable_nat nf_nat
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT iptable_raw ip6table_raw
snd_seq_midi snd_seq_midi_event uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2 videodev amd64_edac_mod snd_usb_audio kvm_amd videobuf2_common
kvm snd_usbmidi_lib snd_rawmidi joydev snd_hda_codec_hdmi irqbypass pcspkr
snd_hda_intel snd_intel_nhlt snd_hda_codec snd_hwdep sp5100_tco e1000e
snd_hda_core snd_pcm tcp_yeah tcp_vegas sch_fq_codel nfsd amdgpu crc32c_intel
mgag200 drm_vram_helper gpu_sched ttm vhost_scsi target_core_mod configfs
vhost_net tun tap vhost vhba(O) jc42 ipmi_si ipmi_devintf ipmi_msghandler fuse
eeprom
[99458.794965] CPU: 1 PID: 2240 Comm: X Tainted: G        W  O    T
5.4.58-gentoo #1
[99458.802469] Hardware name: Supermicro H8SCM/H8SCM, BIOS 3.5b      
03/18/2016
[99458.809740] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1cd7/0x1de0 [amdgpu]
[99458.816529] Code: 48 c7 c2 c0 92 59 c0 bf 02 00 00 00 48 c7 c6 28 69 5f c0
e8 0b a0 32 ca 49 8b 57 08 e9 09 e5 ff ff 0f 0b e9 c3 f0 ff ff 0f 0b <0f> 0b e9
d9 f0 ff ff 48 8b 85 38 fd ff ff 48 8d 8d a0 fd ff ff 48
[99458.835361] RSP: 0018:ffff9b20c277b840 EFLAGS: 00010082
[99458.840594] RAX: 0000000000000002 RBX: 00000000000004d6 RCX:
0000000000000000
[99458.847755] RDX: 0000000000000101 RSI: 0000000000000206 RDI:
0000000000000000
[99458.854905] RBP: ffff9b20c277bb70 R08: ffff9b20c277b7a4 R09:
0000000000000000
[99458.862063] R10: 0000000000000001 R11: 0000000000000000 R12:
0000000000000286
[99458.869222] R13: ffff8f41ba0b8c00 R14: ffff8f4585fc0000 R15:
ffff8f4588b57000
[99458.876375] FS:  00007fc7988b2dc0(0000) GS:ffff8f4696a40000(0000)
knlGS:0000000000000000
[99458.884487] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[99458.890250] CR2: 00007f8a3e4eb950 CR3: 0000000811b4c000 CR4:
00000000000406e0
[99458.897399] Call Trace:
[99458.899859]  ? __switch_to_asm+0x40/0x70
[99458.903802]  ? commit_tail+0x8f/0x110
[99458.907473]  commit_tail+0x8f/0x110
[99458.910966]  drm_atomic_helper_commit+0xb9/0x130
[99458.915587]  drm_atomic_helper_set_config+0x75/0x90
[99458.920465]  drm_mode_setcrtc+0x1f5/0x730
[99458.924482]  ? drm_mode_getcrtc+0x180/0x180
[99458.928673]  drm_ioctl_kernel+0xb0/0x100
[99458.932600]  drm_ioctl+0x20d/0x370
[99458.936006]  ? drm_mode_getcrtc+0x180/0x180
[99458.940323]  amdgpu_drm_ioctl+0x44/0x80 [amdgpu]
[99458.944961]  do_vfs_ioctl+0x46c/0x710
[99458.948674]  ? __fget+0x6c/0xa0
[99458.951854]  ksys_ioctl+0x5b/0x90
[99458.955178]  __x64_sys_ioctl+0x15/0x20
[99458.958934]  do_syscall_64+0x46/0xf0
[99458.962521]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[99458.967580] RIP: 0033:0x7fc798138d87
[99458.971162] Code: 00 00 90 48 8b 05 f9 40 0c 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d c9 40 0c 00 f7 d8 64 89 01 48
[99458.989985] RSP: 002b:00007fff6e3bf348 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[99458.997574] RAX: ffffffffffffffda RBX: 00007fff6e3bf380 RCX:
00007fc798138d87
[99459.004727] RDX: 00007fff6e3bf380 RSI: 00000000c06864a2 RDI:
000000000000000c
[99459.011877] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000557cbb19ab20
[99459.019028] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[99459.026185] R13: 000000000000000c R14: 0000557cba4c5810 R15:
0000000000000000
[99459.033339] ---[ end trace a04ff37c5785331c ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
