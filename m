Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D72565B83
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E54610ED08;
	Mon,  4 Jul 2022 16:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66B10E086
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 22:50:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8F04611D0
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 22:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09B7BC341CA
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656888608;
 bh=WTkCwU9JLpbG2jfS2fGa+LYHhLkwWftf/Ee5njDCF9Q=;
 h=From:To:Subject:Date:From;
 b=NCb84wmtynAXEnIGcbdEer7b3ABJO0IMqUsp0DVNknDk9POcc7iywbmbMNHEfxoNI
 mCB5dw3wcVgGp4iB2k0sjPeLsNk4ZHPOYJa6rZFlyB+D4fv705TWzamfoLhEIZ01yN
 dcf0PZbdGaJnA8a2EKoH8yFZQgQlXHjzGdCIHjBwrmj/YxsmhptanGm9bHN6o6nrN7
 I/LjtmcX+/II52F+ROaze9DNkygfbHmiz0zXM9n52bxvsmVakfk6xg9kHXaAmjcupb
 NKzgtB3LUtGHC9nD9iXgCN9QGf1YhUUd4sCK3dHLekZJGqlD/r8vzoo13HtgHgU3Tv
 rYzIhVrLyDSow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D406FCC13B0; Sun,  3 Jul 2022 22:50:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216200] New: AMDGPU hung after enabling HIP for gpu
 acceleration in Blender Cycles 3.2
Date: Sun, 03 Jul 2022 22:50:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: toadron@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216200-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216200

            Bug ID: 216200
           Summary: AMDGPU hung after enabling HIP for gpu acceleration in
                    Blender Cycles 3.2
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.9
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: toadron@yandex.ru
        Regression: No

Created attachment 301326
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301326&action=3Dedit
Full journal from the moment the system was launched

Description:

HIP for gpu acceleration in Blender render cycles 3.2 causes the screen to
freeze.

Video showing the problem on Youtube video hosting:
https://www.youtube.com/watch?v=3DtZzTuvRn3cw

Hardware:

CPU: AMD Ryzen=E2=84=A2 5 3600
MOTHERBOARD: MSI X470 GAMING PLUS MAX
GPU: SAPPHIRE Radeon RX 6600 8192Mb PULSE (11310-01-20G)

Software version:

Arch Linux x86-64
linux 5.18.9.arch1-1
xf86-video-amdgpu 22.0.0-1
mesa 22.1.3-1
rocm-llvm 5.2.0-1
hip-runtime-amd 5.2.0-3
blender 3.2.0-4

Partial log with the problem (see attachment for full log):

Jul 04 01:01:55 sanka kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
Jul 04 01:01:55 sanka kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ri=
ng
gfx_0.0.0 timeout, signaled seq=3D6213, emitted seq=3D6215
Jul 04 01:01:55 sanka kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process blender pid 2776 thread blender:cs0 pid 2798
Jul 04 01:01:55 sanka kernel: amdgpu 0000:29:00.0: amdgpu: GPU reset begin!
Jul 04 01:01:55 sanka kernel: amdgpu: Failed to suspend process 0x800c
Jul 04 01:01:55 sanka /usr/lib/gdm-x-session[1604]: [2022-07-04 01:01:55.07=
2]
[1649] (device_info_linux.cc:45): NumberOfDevices
Jul 04 01:01:55 sanka /usr/lib/gdm-x-session[1604]: [2022-07-04 01:01:55.18=
9]
[1649] (device_info_linux.cc:45): NumberOfDevices
Jul 04 01:01:55 sanka /usr/lib/gdm-x-session[1604]: [2022-07-04 01:01:55.18=
9]
[1649] (device_info_linux.cc:78): GetDeviceName
Jul 04 01:01:55 sanka kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
Jul 04 01:01:55 sanka kernel: amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_he=
lper
[amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
Jul 04 01:01:55 sanka kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ
disable failed
Jul 04 01:01:55 sanka kernel: amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_he=
lper
[amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
Jul 04 01:01:55 sanka kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ
disable failed
Jul 04 01:01:55 sanka kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* fail=
ed
to halt cp gfx
Jul 04 01:01:55 sanka kernel: [drm] free PSP TMR buffer
Jul 04 01:01:55 sanka kernel: CPU: 5 PID: 158 Comm: kworker/u64:7 Tainted: =
G=20=20=20
       OE     5.18.9-arch1-1 #1 137f0035b2ece06cb65382579db27e9de66af504
Jul 04 01:01:55 sanka kernel: Hardware name: Micro-Star International Co., =
Ltd.
MS-7B79/X470 GAMING PLUS MAX (MS-7B79), BIOS H.F1 05/24/2022
Jul 04 01:01:55 sanka kernel: Workqueue: amdgpu-reset-dev
drm_sched_job_timedout [gpu_sched]
Jul 04 01:01:55 sanka kernel: Call Trace:
Jul 04 01:01:55 sanka kernel:  <TASK>
Jul 04 01:01:55 sanka kernel:  dump_stack_lvl+0x48/0x5d
Jul 04 01:01:55 sanka kernel:  amdgpu_do_asic_reset+0x2a/0x470 [amdgpu
c3399060640045ce33894f35f697ceceab8d3be0]
Jul 04 01:01:55 sanka kernel:  amdgpu_device_gpu_recover_imp.cold+0x537/0x8=
cc
[amdgpu c3399060640045ce33894f35f697ceceab8d3be0]
Jul 04 01:01:55 sanka kernel:  amdgpu_job_timedout+0x18c/0x1c0 [amdgpu
c3399060640045ce33894f35f697ceceab8d3be0]
Jul 04 01:01:55 sanka kernel:  drm_sched_job_timedout+0x76/0x100 [gpu_sched
b54a976254cd79f6332eedc913d0037b3c33b883]
Jul 04 01:01:55 sanka kernel:  process_one_work+0x1c7/0x380
Jul 04 01:01:55 sanka kernel:  worker_thread+0x51/0x380
Jul 04 01:01:55 sanka kernel:  ? rescuer_thread+0x3a0/0x3a0
Jul 04 01:01:55 sanka kernel:  kthread+0xde/0x110
Jul 04 01:01:55 sanka kernel:  ? kthread_complete_and_exit+0x20/0x20
Jul 04 01:01:55 sanka kernel:  ret_from_fork+0x22/0x30
Jul 04 01:01:55 sanka kernel:  </TASK>
Jul 04 01:01:55 sanka kernel: amdgpu 0000:29:00.0: amdgpu: MODE1 reset
Jul 04 01:01:55 sanka kernel: amdgpu 0000:29:00.0: amdgpu: GPU mode1 reset
Jul 04 01:01:55 sanka kernel: amdgpu 0000:29:00.0: amdgpu: GPU smu mode1 re=
set
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: GPU reset succee=
ded,
trying to resume
Jul 04 01:01:56 sanka kernel: [drm] PCIE GART of 512M enabled (table at
0x0000008000300000).
Jul 04 01:01:56 sanka kernel: [drm] VRAM is lost due to GPU reset!
Jul 04 01:01:56 sanka kernel: [drm] PSP is resuming...
Jul 04 01:01:56 sanka kernel: [drm] reserve 0xa00000 from 0x81fe000000 for =
PSP
TMR
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: RAS: optional ra=
s ta
ucode is not available
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: SMU is resuming.=
..
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: smu driver if
version =3D 0x0000000f, smu fw if version =3D 0x00000013, smu fw program =
=3D 0,
version =3D 0x003b2900 (59.41.0)
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: SMU driver if
version not matched
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: SMU is resumed
successfully!
Jul 04 01:01:56 sanka kernel: [drm] DMUB hardware initialized:
version=3D0x0202000F
Jul 04 01:01:56 sanka kernel: [drm] kiq ring mec 2 pipe 1 q 0
Jul 04 01:01:56 sanka kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Jul 04 01:01:56 sanka kernel: [drm] JPEG decode initialized successfully.
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring gfx_0.0.0 u=
ses
VM inv eng 0 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.0.0 =
uses
VM inv eng 1 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.1.0 =
uses
VM inv eng 4 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.2.0 =
uses
VM inv eng 5 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.3.0 =
uses
VM inv eng 6 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.0.1 =
uses
VM inv eng 7 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.1.1 =
uses
VM inv eng 8 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.2.1 =
uses
VM inv eng 9 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring comp_1.3.1 =
uses
VM inv eng 10 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring kiq_2.1.0 u=
ses
VM inv eng 11 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring sdma0 uses =
VM
inv eng 12 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring sdma1 uses =
VM
inv eng 13 on hub 0
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring vcn_dec_0 u=
ses
VM inv eng 0 on hub 1
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring vcn_enc_0.0
uses VM inv eng 1 on hub 1
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring vcn_enc_0.1
uses VM inv eng 4 on hub 1
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: ring jpeg_dec us=
es
VM inv eng 5 on hub 1
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: recover vram bo =
from
shadow start
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: recover vram bo =
from
shadow done
Jul 04 01:01:56 sanka kernel: [drm] Skip scheduling IBs!
Jul 04 01:01:56 sanka kernel: [drm] Skip scheduling IBs!
Jul 04 01:01:56 sanka kernel: amdgpu 0000:29:00.0: amdgpu: GPU reset(2)
succeeded!
Jul 04 01:01:56 sanka kernel: [drm] Skip scheduling IBs!
Jul 04 01:01:56 sanka kernel: [drm] Skip scheduling IBs!
Jul 04 01:01:56 sanka kernel: [drm] Skip scheduling IBs!
...I skip repeated lines...
Jul 04 01:01:56 sanka kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed=
 to
initialize parser -125!
Jul 04 01:01:56 sanka kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed=
 to
initialize parser -125!
Jul 04 01:01:56 sanka kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed=
 to
initialize parser -125!
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[2747]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka /usr/lib/gdm-x-session[1000]: amdgpu: The CS has been
cancelled because the context is lost.
Jul 04 01:01:56 sanka kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed=
 to
initialize parser -125!
Jul 04 01:01:56 sanka kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed=
 to
initialize parser -125!
Jul 04 01:01:56 sanka kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed=
 to
initialize parser -125!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
