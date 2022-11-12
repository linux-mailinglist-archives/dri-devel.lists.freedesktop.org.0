Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A6626A88
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 17:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6B10E183;
	Sat, 12 Nov 2022 16:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D067E10E183
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 16:24:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14F3860CEB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 16:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D3DDC43145
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668270262;
 bh=m9D1sK4zbSxnQiGItDsKN/0MegVlDFCdzyV2FPkmISg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ip/oPMjPnST/5caWgsvKuZISrCqCGoK7mm8I5ERvqgzpZH4J3V4poF5vsr7z9tbJw
 85k8UDmLagLMeSiV/ynj1jhZr8mpCTPD6ZjueNi/eXyDdaHxG9g9Cq5WO61LTq7LLd
 X4gKME+iCC2OvxflMJT/zyr7n3xVMk71s2AlgBLfau81hz6sz5D8Vk+eU44sfnQ6cS
 hxUo94GtiOFNdK9CZpm39aWr3x7nZpoeRjl35dfSUklx7a+o2AINYL/u38i9HBnKjV
 zaoinWuCOmLrBH5xarXb/sFIXn1d5kO0YaZbfJfnNhgT7TQLaMPnUMvZ0npY8OY/vC
 G/UhRMDLm81tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F1D6AC433E7; Sat, 12 Nov 2022 16:24:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sat, 12 Nov 2022 16:24:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fmhirtz@maunet.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-wWErLALaxN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

fmhirtz@maunet.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fmhirtz@maunet.org

--- Comment #28 from fmhirtz@maunet.org ---
I'm seeing what appears to be this on Fedora 37 with an AMD 5700xt. Normal
desktop use in Wayland/Gnome will sporadically freeze and crash every coupl=
e of
days. It normally will reset back to the login given some time:

Kernel: 6.0.7-301.fc37.x86_64
Mesa: mesa-*23.0.0-0.3.git74bbeb5.fc37

~~~
Nov 08 02:01:33 workstation kernel: [drm:amdgpu_dm_atomic_commit_tail [amdg=
pu]]
*ERROR* Waiting for fences timed out!
Nov 08 02:01:33 workstation kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERR=
OR*
ring gfx_0.0.0 timeout, signaled seq=3D14613616, emitted seq=3D14613618
Nov 08 02:01:33 workstation kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERR=
OR*
Process information: process firefox pid 21845 thread firefox:cs0 pid 21922
Nov 08 02:01:33 workstation kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset
begin!
Nov 08 02:01:34 workstation kernel: amdgpu 0000:0c:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Nov 08 02:01:34 workstation kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR*
KGQ disable failed
Nov 08 02:01:34 workstation kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR*
failed to halt cp gfx
Nov 08 02:01:34 workstation kernel: [drm] free PSP TMR buffer
Nov 08 02:01:34 workstation kernel: CPU: 19 PID: 871009 Comm: kworker/u64:3=
 Not
tainted 5.19.16-301.fc37.x86_64 #1
Nov 08 02:01:34 workstation kernel: Hardware name: MicroElectronics G464/TUF
GAMING X570-PLUS (WI-FI), BIOS 3001 12/04/2020
Nov 08 02:01:34 workstation kernel: Workqueue: amdgpu-reset-dev
drm_sched_job_timedout [gpu_sched]
Nov 08 02:01:34 workstation kernel: Call Trace:
Nov 08 02:01:34 workstation kernel:  <TASK>
Nov 08 02:01:34 workstation kernel:  dump_stack_lvl+0x44/0x5c
Nov 08 02:01:34 workstation kernel:  amdgpu_do_asic_reset+0x26/0x459 [amdgp=
u]
Nov 08 02:01:34 workstation kernel:=20
amdgpu_device_gpu_recover_imp.cold+0x59d/0x8cb [amdgpu]
Nov 08 02:01:34 workstation kernel:  amdgpu_job_timedout+0x156/0x190 [amdgp=
u]
Nov 08 02:01:34 workstation kernel:  ? __switch_to+0x106/0x430
Nov 08 02:01:34 workstation kernel:  drm_sched_job_timedout+0x76/0x110
[gpu_sched]
Nov 08 02:01:34 workstation kernel:  process_one_work+0x1c7/0x380
Nov 08 02:01:34 workstation kernel:  worker_thread+0x4d/0x380
Nov 08 02:01:34 workstation kernel:  ? _raw_spin_lock_irqsave+0x23/0x50
Nov 08 02:01:34 workstation kernel:  ? process_one_work+0x380/0x380
Nov 08 02:01:34 workstation kernel:  kthread+0xe9/0x110
Nov 08 02:01:34 workstation kernel:  ? kthread_complete_and_exit+0x20/0x20
Nov 08 02:01:34 workstation kernel:  ret_from_fork+0x22/0x30
Nov 08 02:01:34 workstation kernel:  </TASK>
Nov 08 02:01:34 workstation kernel: amdgpu 0000:0c:00.0: amdgpu: BACO reset
Nov 08 02:01:37 workstation kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset
succeeded, trying to resume
Nov 08 02:01:37 workstation kernel: [drm] PCIE GART of 512M enabled (table =
at
0x0000008000300000).
Nov 08 02:01:37 workstation kernel: [drm] VRAM is lost due to GPU reset!
Nov 08 02:01:37 workstation kernel: [drm] PSP is resuming...
Nov 08 02:01:37 workstation kernel: [drm] reserve 0x900000 from 0x81fe600000
for PSP TMR
...
~~~

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
