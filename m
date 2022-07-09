Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539F56C789
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 08:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4510FA9D;
	Sat,  9 Jul 2022 06:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6BE10FA9D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:26:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A87DDB82A55
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 706ADC3411C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657348014;
 bh=8P//rT/TJEjGtI+ACR/+28LrSm/0dvRao1H2AwLk4x8=;
 h=From:To:Subject:Date:From;
 b=baGGRg9vTvCPonXKgK8wUTWeeOBFfMZYGGWhk8lILgtHDLvqtrVWA5dcBT2r66kLl
 H+uaXjYC4qp64BpoW12RqurKBfhX7wtjwFFbPjD7dmZmU5U8Bn8RTMJNOrNVG0WEBE
 gZpYYEs8OnDudT7gXGS19w0WjY6FdFaQ9a3KZJ4JyvfoTLiLg+sHIxyJ7VP5I+YfQ4
 hbmu0wnCQa3Gh4MT/1FJnOUXbJzu8JKuV3vL+HqfWtScTblR8GAE076YaT97t+MHte
 2ig7rHe0JIaujriCUcgiMgd+tbinaP5kjNj/HS4lgAKf3U2st+ftexzsnxbt+smZX9
 bjFRTy1Jjn9aA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 59246CC13B0; Sat,  9 Jul 2022 06:26:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216224] New: AMDGPU fails to reset RX 480 after Ring GFX timeout
Date: Sat, 09 Jul 2022 06:26:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216224-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216224

            Bug ID: 216224
           Summary: AMDGPU fails to reset RX 480 after Ring GFX timeout
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.0 and earlier versions
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: happysmash27@protonmail.com
        Regression: No

Created attachment 301374
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301374&action=3Dedit
SteamTV-induced crash 2022-07-08

This is perhaps the worst bug I have ever experienced and has been going on=
 for
a couple years now. A ring GFX timeout can be triggered fairly reliably by
launching SteamVR while using literally anything else that uses the GPU (ev=
en
having Waterfox open usually causes a crash) or by running an Ethereum miner
(every one I have tried does this, some worse than others) and having somet=
hing
else using the GPU such as Blender (moving around in a 3D scene should do i=
t).
Other things do this as well (such as the time this happened when running S=
way
and LXDE at the same time) but Ethereum miners and SteamVR seem to be the
programs that trigger it the most reliably. I imagine trying to run both at
once would be a guaranteed GPU meltdown.=20

When the bug occurs, something like:=20

[1767311.339261] [drm:amdgpu_job_timedout] *ERROR* ring comp_1.0.0 timeout,
signaled seq=3D23354655, emitted seq=3D23354657
[1767311.339274] [drm:amdgpu_job_timedout] *ERROR* Process information: pro=
cess
vrcompositor pid 7701 thread vrcompositor pid 7701
[1767311.339279] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!

or:=20

57492.984178] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, signaled
seq=3D9450226, emitted seq=3D9450228
[57492.984189] [drm:amdgpu_job_timedout] *ERROR* Process information: proce=
ss
vrcompositor pid 8198 thread vrcompositor pid 8198
[57492.984194] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!

or:=20

[112094.633679] [drm:dm_vblank_get_counter] *ERROR* dc_stream_state is NULL=
 for
crtc '2'!
[112094.633696] [drm:dm_crtc_get_scanoutpos] *ERROR* dc_stream_state is NULL
for crtc '2'!
[112094.633699] [drm:dm_vblank_get_counter] *ERROR* dc_stream_state is NULL=
 for
crtc '2'!
[112094.633703] ------------[ cut here ]------------
[112094.633704] amdgpu 0000:03:00.0:
drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
[112094.633735] WARNING: CPU: 9 PID: 12640 at drivers/gpu/drm/drm_vblank.c:=
728
drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x331/0x340
[112094.633741] Modules linked in: uvcvideo videobuf2_vmalloc videobuf2_mem=
ops
videobuf2_v4l2 videobuf2_common videodev mc bpfilter btusb btrtl btbcm btin=
tel
mptsas mptscsih mptbase
[112094.633754] CPU: 9 PID: 12640 Comm: VulkanVblankThr Not tainted
5.18.0-gentoo #1
[112094.633757] Hardware name: Supermicro X8DT3/X8DT3, BIOS 2.1     03/17/2=
012
[112094.633758] RIP:
0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x331/0x340
[112094.633762] Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 28 81 32 00 48=
 c7
c1 f0 2a 2d 83 4c 89 ea 48 c7 c7 f2 b0 2c 83 48 89 c6 e8 67 b6 b8 00 <0f> 0=
b e9
d0 fe ff ff e8 23 ec c3 00 0f 1f 00 48 8b 87 b0 01 00 00
[112094.633764] RSP: 0018:ffffc9000b1e7bb0 EFLAGS: 00010082
[112094.633766] RAX: 0000000000000000 RBX: ffffffff81aeae50 RCX:
0000000000000000
[112094.633767] RDX: 0000000000000003 RSI: ffffffff8330cd18 RDI:
00000000ffffffff
[112094.633769] RBP: ffffc9000b1e7c20 R08: ffffffff837653c8 R09:
00000000ffffdfff
[112094.633770] R10: ffffffff836853e0 R11: ffffffff8373edb8 R12:
0000000000000000
[112094.633771] R13: ffff888103ee7380 R14: 0000000000000003 R15:
ffff888e448e6b08
[112094.633773] FS:  00007fcf587f8640(0000) GS:ffff889dffac0000(0000)
knlGS:0000000000000000
[112094.633775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[112094.633776] CR2: 00007fceec001258 CR3: 0000000363f60003 CR4:
00000000000206e0
[112094.633778] Call Trace:
[112094.633780]  <TASK>
[112094.633783]  drm_get_last_vbltimestamp+0xa5/0xb0
[112094.633789]  drm_update_vblank_count+0x7f/0x3c0
[112094.633793]  drm_vblank_enable+0x13e/0x170
[112094.633796]  drm_vblank_get+0x8b/0xd0
[112094.633798]  drm_crtc_queue_sequence_ioctl+0xee/0x2a0
[112094.633801]  ? drm_crtc_get_sequence_ioctl+0x190/0x190
[112094.633803]  drm_ioctl_kernel+0xac/0x140
[112094.633809]  drm_ioctl+0x1f5/0x3c0
[112094.633812]  ? drm_crtc_get_sequence_ioctl+0x190/0x190
[112094.633814]  ? ioctl_has_perm.constprop.0.isra.0+0xb4/0x110
[112094.633821]  amdgpu_drm_ioctl+0x44/0x80
[112094.633825]  __x64_sys_ioctl+0x7d/0xb0
[112094.633830]  do_syscall_64+0x3b/0x90
[112094.633833]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[112094.633838] RIP: 0033:0x7fcf8d9f2f0b
[112094.633840] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00=
 00
00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 8=
9 c0
3d 00 f0 ff ff 77 1b 48 8b 44 24 18 64 48 2b 04 25 28 00
[112094.633842] RSP: 002b:00007fcf587f7aa0 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[112094.633844] RAX: ffffffffffffffda RBX: 00007fcf587f7b30 RCX:
00007fcf8d9f2f0b
[112094.633845] RDX: 00007fcf587f7b30 RSI: 00000000c018643c RDI:
000000000000004c
[112094.633847] RBP: 00000000c018643c R08: 0000000000000000 R09:
00007fceec000be0
[112094.633848] R10: 00007fcf89fc5ba0 R11: 0000000000000246 R12:
000055e7852de508
[112094.633849] R13: 000000000000004c R14: 000055e785460fd0 R15:
000055e7852de4c0
[112094.633852]  </TASK>
[112094.633852] ---[ end trace 0000000000000000 ]---
[112094.633854] [drm:dm_vblank_get_counter] *ERROR* dc_stream_state is NULL=
 for
crtc '2'!
[112094.633857] [drm:dm_crtc_get_scanoutpos] *ERROR* dc_stream_state is NULL
for crtc '2'!
[112094.633859] [drm:dm_vblank_get_counter] *ERROR* dc_stream_state is NULL=
 for
crtc '2'!
[112114.167264] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, signaled
seq=3D3094506, emitted seq=3D3094508
[112114.167276] [drm:amdgpu_job_timedout] *ERROR* Process information: proc=
ess
vrcompositor pid 12498 thread vrcompositor pid 12498
[112114.167281] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[112148.281473] elogind-daemon[4528]: New session 8 of user happysmash27.
[112174.774130] elogind-daemon[4528]: New session 9 of user happysmash27.
[112192.196386] Discord[5027]: segfault at 0 ip 00007ff10741e0d6 sp
00007ff1073fdd00 error 4 in discord_utils.node[7ff107400000+8d000]
[112192.196413] Code: 38 48 83 ff 01 77 09 49 8d 70 ff 48 21 ce eb 13 48 89=
 ce
4c 39 c1 72 0b 48 89 c8 31 d2 49 f7 f0 48 89 d6 48 8b 05 5a 47 27 00 <48> 8=
b 04
f0 48 85 c0 74 76 48 8b 18 48 85 db 74 6e 4d 8d 48 ff eb

will occur, all on kernel 5.18.0, but various similar issues also occured on
earlier kernel versions. These more recent ones are all triggered by SteamV=
R.
Ethereum miners (if I am reading this log properly) on older versions (this=
 one
is 5.17.4) would trigger something like:=20

[3986931.032554] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, signal=
ed
seq=3D296571651, emitted seq=3D296571653
[3986931.032566] [drm:amdgpu_job_timedout] *ERROR* Process information: pro=
cess
blender-3.3 pid 11711 thread blender-3.:cs0 pid 11747
[3986931.032571] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[3986931.291361] amdgpu 0000:03:00.0: amdgpu: BACO reset
[3986931.477687] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying to
resume
[3986931.478926] [drm] PCIE GART of 256M enabled (table at 0x000000F4005000=
00).
[3986931.478942] [drm] VRAM is lost due to GPU reset!
[3986933.521790] amdgpu:
                  failed to send message 200 ret is 0
[3986937.653740] amdgpu:
                  last message was failed ret is 0
[3986939.720118] amdgpu:
                  failed to send message 100 ret is 0
[3986941.821883] amdgpu:
                  last message was failed ret is 0
[3986941.825119] amdgpu: SMU Firmware start failed!
[3986941.825123] amdgpu: Failed to load SMU ucode.
[3986941.825125] amdgpu: fw load failed
[3986941.825126] amdgpu: smu firmware loading failed
[3986941.825129] [drm] Skip scheduling IBs!
[3986941.825131] [drm] Skip scheduling IBs!
[3986941.825140] [drm] Skip scheduling IBs!
[3986941.825145] [drm] Skip scheduling IBs!
[3986941.825160] amdgpu 0000:03:00.0: amdgpu: GPU reset(2) failed

and a large amount of other messages, many repeating, including:=20

[3986941.825198] [drm] Skip scheduling IBs!

[3986941.825315] [drm:amdgpu_cs_ioctl] *ERROR* Failed to initialize parser
-125!

and

[3986963.354537] amdgpu:
                  failed to send message 200 ret is 0
[3986965.419403] amdgpu:
                  last message was failed ret is 0

In all of these cases `cat /sys/kernel/debug/dri/0/amdgpu_gpu_recover` will
generally either return some vague vague number, -11 IIRC, or will just fre=
eze,
as has happened with my most recent SteamVR-induced freeze today. If frozen,
cat cannot be killed with signal 2 or signal 9, as it will be in a d state.
Furthermore, X and sometimes vrcompositor cannot be killed with it either as
they will also be in d states. Shutdown will do nothing, so the only way to
reboot is to manually shut down all processes then use the magic sysrq sequ=
ence
to shut down everything. In one instance even that didn't work and I needed=
 to
hold the power key. SSH works fine as in other bugs related to ring GFX
timeout.=20

The subject of this bug isn't the ring GFX timeout itself, but the fact that
the GPU reset never works. It's worked a couple of times (after manually
restarting X from SSH of course), but 90% of the time it hangs and does not
reset successfully.=20

I will attach several dmesg (with color) logs from the several times this h=
as
happened in the past couple months, but if needed I have logs going all the=
 way
back to February 2020 as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
