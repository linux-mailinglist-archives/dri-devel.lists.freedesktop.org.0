Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A1D41532B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 00:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F3A6E054;
	Wed, 22 Sep 2021 22:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D496E054
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 22:05:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1584661107
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 22:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632348308;
 bh=5t3BDvCLIFZ9QjiGCmr30FLfFkUbkyHP1/epfq22Xt4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PhtFTASTEfWJdMZH1xXg4YxqnsfOtDPnnnswDgvylt/5WI8JolaoIvd4lHMOCcjSL
 2do12nXbv2iGK0o+HqMh4wLBT+sX2js0MPR0hijCFY+I7aybFUhKg5c7t87X6vN0tA
 QMJMOUuy/tuLCAvrYgr8D5WmRLexxgyUxuY95p11VwwBzYHTlISbpxmGS/n4UCbEnu
 ufdg3zWtFRUgGFvwj9xfqgjAfE4mPJwOF6duouHBwoVxanbK4CSERMhk0V+LYUgEki
 mbLcC5pt4Z8SROCYOgcAbbQz9F92ta8izAXa8FbQD3yEcHayXsRPQhDnGS0LOfldfK
 MVdkJlfDfIYLA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 11C8760FC4; Wed, 22 Sep 2021 22:05:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [NAVI] Several memory leaks in amdgpu and ttm
Date: Wed, 22 Sep 2021 22:05:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214029-2300-cA7jLjEnTC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298927
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298927&action=3Dedit
kernel dmesg (kernel 5.14.6, AMD Opteron 6386 SE)

Does not seem to be Navi specific after all as the leaks do happen with the
Radeon R7 360 in my Opteron box too.

[...]
unreferenced object 0xffff8afeddd0c2c0 (size 176):
  comm "Web Content", pid 1830253, jiffies 4302445561 (age 2701.157s)
  hex dump (first 32 bytes):
    50 c3 d0 dd fe 8a ff ff 80 51 3a c0 ff ff ff ff  P........Q:.....
    0f 89 14 e9 f1 16 00 00 48 fe b6 09 41 a7 ff ff  ........H...A...
  backtrace:
    [<ffffffffc03a347d>] drm_sched_fence_create+0x1d/0xb0 [gpu_sched]
    [<ffffffffc03a20d0>] drm_sched_job_init+0x58/0xa0 [gpu_sched]
    [<ffffffffc10fb711>] amdgpu_job_submit+0x21/0xe0 [amdgpu]
    [<ffffffffc0feef6a>] amdgpu_copy_buffer+0x1ea/0x290 [amdgpu]
    [<ffffffffc0fef292>] amdgpu_ttm_copy_mem_to_mem+0x282/0x5b0 [amdgpu]
    [<ffffffffc0fefad8>] amdgpu_bo_move+0x130/0x7d8 [amdgpu]
    [<ffffffffc0609e49>] ttm_bo_handle_move_mem+0x89/0x178 [ttm]
    [<ffffffffc060b1ba>] ttm_bo_validate+0xba/0x140 [ttm]
    [<ffffffffc0ff13ae>] amdgpu_bo_fault_reserve_notify+0xb6/0x160 [amdgpu]
    [<ffffffffc0ff62f8>] amdgpu_gem_fault+0x78/0x100 [amdgpu]
    [<ffffffff9b166941>] __do_fault+0x31/0xe8
    [<ffffffff9b16dc4a>] __handle_mm_fault+0xe1a/0x1290
    [<ffffffff9b16e175>] handle_mm_fault+0xb5/0x218
    [<ffffffff9b6ca347>] exc_page_fault+0x177/0x5d0
    [<ffffffff9b800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8b01f00bd0c0 (size 72):
  comm "sdma0", pid 403, jiffies 4302445561 (age 2701.157s)
  hex dump (first 32 bytes):
    e0 c7 64 13 ff 8a ff ff 00 1c 30 c1 ff ff ff ff  ..d.......0.....
    65 59 16 e9 f1 16 00 00 58 28 b9 86 03 8b ff ff  eY......X(......
  backtrace:
    [<ffffffffc0febecb>] amdgpu_fence_emit+0x2b/0x1f0 [amdgpu]
    [<ffffffffc100945b>] amdgpu_ib_schedule+0x2e3/0x4e8 [amdgpu]
    [<ffffffffc10fb34b>] amdgpu_job_run+0x8b/0x1e8 [amdgpu]
    [<ffffffffc03a2ad7>] drm_sched_main+0x1b7/0x3d8 [gpu_sched]
    [<ffffffff9b05f9e2>] kthread+0x122/0x140
    [<ffffffff9b001102>] ret_from_fork+0x22/0x30
unreferenced object 0xffff8b02ec1796c0 (size 176):
  comm "Renderer", pid 108402, jiffies 4302694486 (age 1871.424s)
  hex dump (first 32 bytes):
    50 97 17 ec 02 8b ff ff 80 51 3a c0 ff ff ff ff  P........Q:.....
    4f 9c 02 1a b3 17 00 00 48 fe b6 09 41 a7 ff ff  O.......H...A...
  backtrace:
    [<ffffffffc03a347d>] drm_sched_fence_create+0x1d/0xb0 [gpu_sched]
    [<ffffffffc03a20d0>] drm_sched_job_init+0x58/0xa0 [gpu_sched]
    [<ffffffffc10fb711>] amdgpu_job_submit+0x21/0xe0 [amdgpu]
    [<ffffffffc0feef6a>] amdgpu_copy_buffer+0x1ea/0x290 [amdgpu]
    [<ffffffffc0fef292>] amdgpu_ttm_copy_mem_to_mem+0x282/0x5b0 [amdgpu]
    [<ffffffffc0fefad8>] amdgpu_bo_move+0x130/0x7d8 [amdgpu]
    [<ffffffffc0609e49>] ttm_bo_handle_move_mem+0x89/0x178 [ttm]
    [<ffffffffc060b1ba>] ttm_bo_validate+0xba/0x140 [ttm]
    [<ffffffffc0ff13ae>] amdgpu_bo_fault_reserve_notify+0xb6/0x160 [amdgpu]
    [<ffffffffc0ff62f8>] amdgpu_gem_fault+0x78/0x100 [amdgpu]
    [<ffffffff9b166941>] __do_fault+0x31/0xe8
    [<ffffffff9b16dc4a>] __handle_mm_fault+0xe1a/0x1290
    [<ffffffff9b16e175>] handle_mm_fault+0xb5/0x218
    [<ffffffff9b6ca347>] exc_page_fault+0x177/0x5d0
    [<ffffffff9b800acb>] asm_exc_page_fault+0x1b/0x20


 # lspci -s 01:00.0 -v
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Tobago PRO [Radeon R7 360 / R9 360 OEM] (rev 81) (prog-if 00 [VGA controlle=
r])
        Subsystem: PC Partner Limited / Sapphire Technology Tobago PRO [Rad=
eon
R7 360 / R9 360 OEM]
        Flags: bus master, fast devsel, latency 0, IRQ 47, IOMMU group 11
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at cf800000 (64-bit, prefetchable) [size=3D8M]
        I/O ports at c000 [size=3D256]
        Memory at fdc80000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [200] Physical Resizable BAR
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Kernel driver in use: amdgpu
        Kernel modules: radeon, amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
