Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9BC3E830F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 20:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1AF89F75;
	Tue, 10 Aug 2021 18:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19689F75
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 18:35:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A81E960E09
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628620499;
 bh=tgMZ1Q7zgN7Fbb1dCCTECRsFW1vJiwi21NDhw8wnmNk=;
 h=From:To:Subject:Date:From;
 b=EWGcfeWyD0aXllBvTQRR/rIRAaIz/4PCbEgT2B7XotDbRaHJtCdb3cNU6jts5qJxD
 U6uAcxfngZyP22qMBQxmt2PgB8/rfaZu6dCFL4jbg/4Eg/aR90FLwxVPkzTwF2NSNZ
 rLlszJ97sFVbCbtNzuLyZzIXOlLOBFQmC/BS8/+wf9l3pU93Pqg9oXU2/geuZWlM5a
 kXOR/RHzI0Glygfvc80gcNmd+chd+XS27NBx98vUxK1uxIbDL+tsjRRXLI60EyeAml
 cOpn47fNFkqT8v2z1lnhHI3m+2+Kn0kjT1bulDeF5HVx8AhKeKh0s3YsqxOjGjlBjz
 jaLf0SnvjB7Fg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9E74160186; Tue, 10 Aug 2021 18:34:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] New: [NAVI] Several memory leaks in amdgpu and ttm
Date: Tue, 10 Aug 2021 18:34:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-214029-2300@https.bugzilla.kernel.org/>
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

            Bug ID: 214029
           Summary: [NAVI] Several memory leaks in amdgpu and ttm
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14-rc5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: daniel@ffwll.ch
        Regression: No

Created attachment 298265
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298265&action=3Dedit
kernel dmesg (kernel 5.14-rc5, AMD FX-8370)

Getting this on kernel 5.14-rc5 with my Radeon RX 5500.

unreferenced object 0xffff888169af1b40 (size 216):
  comm "lightdm-gtk-gre", pid 662, jiffies 4294902381 (age 13444.937s)
  hex dump (first 32 bytes):
    d0 1b af 69 81 88 ff ff 60 cb b9 c0 ff ff ff ff  ...i....`.......
    80 73 48 e1 13 00 00 00 58 7d c1 0b 00 c9 ff ff  .sH.....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff888263377700 (size 72):
  comm "sdma0", pid 345, jiffies 4294902381 (age 13444.937s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    f2 a0 4c e1 13 00 00 00 58 28 9b c9 81 88 ff ff  ..L.....X(......
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff88811314b9c0 (size 216):
  comm "mate-session-ch", pid 768, jiffies 4294905408 (age 13434.854s)
  hex dump (first 32 bytes):
    50 ba 14 13 81 88 ff ff 60 cb b9 c0 ff ff ff ff  P.......`.......
    dc 7a c1 3a 16 00 00 00 58 7d c1 0b 00 c9 ff ff  .z.:....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff888167ffc340 (size 72):
  comm "sdma0", pid 345, jiffies 4294905408 (age 13434.854s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    ac b5 c5 3a 16 00 00 00 58 e4 a7 01 81 88 ff ff  ...:....X.......
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff888113b6d240 (size 216):
  comm "mate-screensave", pid 57770, jiffies 4295052030 (age 12946.214s)
  hex dump (first 32 bytes):
    d0 d2 b6 13 81 88 ff ff 60 cb b9 c0 ff ff ff ff  ........`.......
    a2 85 ff 05 88 00 00 00 58 7d c1 0b 00 c9 ff ff  ........X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8881c85d6e80 (size 72):
  comm "sdma0", pid 345, jiffies 4295052030 (age 12946.217s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    0c a0 03 06 88 00 00 00 58 34 14 75 82 88 ff ff  ........X4.u....
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff888119b78940 (size 216):
  comm "mate-screensave", pid 98610, jiffies 4295149755 (age 12620.510s)
  hex dump (first 32 bytes):
    d0 89 b7 19 81 88 ff ff 60 cb b9 c0 ff ff ff ff  ........`.......
    08 db 28 de d3 00 00 00 58 7d c1 0b 00 c9 ff ff  ..(.....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8882589af700 (size 72):
  comm "sdma0", pid 345, jiffies 4295149755 (age 12620.514s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    17 3c 2d de d3 00 00 00 58 b4 df 67 81 88 ff ff  .<-.....X..g....
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff8881274ccac0 (size 216):
  comm "mate-screensave", pid 98731, jiffies 4295150087 (age 12619.460s)
  hex dump (first 32 bytes):
    50 cb 4c 27 81 88 ff ff 60 cb b9 c0 ff ff ff ff  P.L'....`.......
    7e bc 18 20 d4 00 00 00 58 7d c1 0b 00 c9 ff ff  ~.. ....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff888255796940 (size 72):
  comm "sdma0", pid 345, jiffies 4295150087 (age 12619.464s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    0f be 1c 20 d4 00 00 00 58 70 a1 be 81 88 ff ff  ... ....Xp......
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff88823ef75540 (size 216):
  comm "glxinfo", pid 173188, jiffies 4298442862 (age 1643.630s)
  hex dump (first 32 bytes):
    d0 55 f7 3e 82 88 ff ff 60 cb b9 c0 ff ff ff ff  .U.>....`.......
    d7 bb 9c a7 cf 0a 00 00 58 7d c1 0b 00 c9 ff ff  ........X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff88826dfee1c0 (size 72):
  comm "sdma0", pid 345, jiffies 4298442862 (age 1643.630s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    91 e3 a0 a7 cf 0a 00 00 58 04 01 14 81 88 ff ff  ........X.......
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff88823ef756c0 (size 216):
  comm "glxinfo:sh0", pid 173194, jiffies 4298442879 (age 1643.620s)
  hex dump (first 32 bytes):
    50 57 f7 3e 82 88 ff ff 60 cb b9 c0 ff ff ff ff  PW.>....`.......
    3a 18 f8 aa cf 0a 00 00 58 7d c1 0b 00 c9 ff ff  :.......X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8882a950cb80 (size 72):
  comm "sdma0", pid 345, jiffies 4298442879 (age 1643.620s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    27 7b fc aa cf 0a 00 00 58 cc ec 19 81 88 ff ff  '{......X.......
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff888227171840 (size 216):
  comm "glxinfo", pid 173188, jiffies 4298442879 (age 1643.620s)
  hex dump (first 32 bytes):
    d0 18 17 27 82 88 ff ff 60 cb b9 c0 ff ff ff ff  ...'....`.......
    f0 c7 0c ab cf 0a 00 00 58 7d c1 0b 00 c9 ff ff  ........X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8882a950cac0 (size 72):
  comm "sdma0", pid 345, jiffies 4298442879 (age 1643.620s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    f1 fe 10 ab cf 0a 00 00 58 9c ec 19 81 88 ff ff  ........X.......
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff88816aaca940 (size 216):
  comm "glxinfo", pid 173247, jiffies 4298445099 (age 1636.294s)
  hex dump (first 32 bytes):
    d0 a9 ac 6a 81 88 ff ff 60 cb b9 c0 ff ff ff ff  ...j....`.......
    4d 52 2f 64 d1 0a 00 00 58 7d c1 0b 00 c9 ff ff  MR/d....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff88825fe8d700 (size 72):
  comm "sdma0", pid 345, jiffies 4298445099 (age 1636.294s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    63 72 33 64 d1 0a 00 00 58 64 7b 47 81 88 ff ff  cr3d....Xd{G....
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff8881433c2940 (size 216):
  comm "glxinfo:sh0", pid 173253, jiffies 4298445116 (age 1636.240s)
  hex dump (first 32 bytes):
    d0 29 3c 43 81 88 ff ff 60 cb b9 c0 ff ff ff ff  .)<C....`.......
    1b 8a 79 67 d1 0a 00 00 58 7d c1 0b 00 c9 ff ff  ..yg....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff88825fe8d580 (size 72):
  comm "sdma0", pid 345, jiffies 4298445116 (age 1636.240s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    99 20 7e 67 d1 0a 00 00 58 a8 28 8b 82 88 ff ff  . ~g....X.(.....
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff8881433c24c0 (size 216):
  comm "glxinfo", pid 173247, jiffies 4298445116 (age 1636.314s)
  hex dump (first 32 bytes):
    50 25 3c 43 81 88 ff ff 60 cb b9 c0 ff ff ff ff  P%<C....`.......
    57 37 94 67 d1 0a 00 00 58 7d c1 0b 00 c9 ff ff  W7.g....X}......
  backtrace:
    [<ffffffffc0b9914f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc0b944de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc138dd37>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc0f7ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f7b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f7ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0a79897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc0a7d297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc0f83444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f93313>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffab55c3b3>] __do_fault+0xf3/0x3e0
    [<ffffffffab56e5ab>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffab56f5ca>] handle_mm_fault+0x12a/0x490
    [<ffffffffab0908b9>] do_user_addr_fault+0x259/0xb70
    [<ffffffffac7b6935>] exc_page_fault+0x55/0xb0
    [<ffffffffac800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8881dbf6b340 (size 72):
  comm "sdma0", pid 345, jiffies 4298445116 (age 1636.314s)
  hex dump (first 32 bytes):
    f0 f3 5c 69 81 88 ff ff 80 8a cf c1 ff ff ff ff  ..\i............
    f9 60 98 67 d1 0a 00 00 58 b4 28 8b 82 88 ff ff  .`.g....X.(.....
  backtrace:
    [<ffffffffc0f70521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc0fdd4bb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc138d09e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc0b9792e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffab12fda2>] kthread+0x342/0x410
    [<ffffffffab0030d2>] ret_from_fork+0x22/0x30


 $ inxi -bZ
System:    Kernel: 5.14.0-rc5-bdver2 x86_64 bits: 64 Desktop: MATE 1.24.1
Distro: Gentoo Base System release 2.7=20
Machine:   Type: Desktop System: Gigabyte product: N/A v: N/A serial:
<superuser/root required>=20
           Mobo: Gigabyte model: 970-GAMING v: x.x serial: <superuser/root
required> UEFI: American Megatrends v: F2=20
           date: 04/06/2016=20
CPU:       Info: 8-Core AMD FX-8370 [MCP] speed: 1727 MHz min/max: 1400/4000
MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Navi 14 [Radeon RX
5500/5500M / Pro 5500M] driver: amdgpu v: kernel=20
           Display: x11 server: X.Org 1.20.11 driver: amdgpu,ati unloaded:
fbdev,modesetting,radeon resolution: 1920x1080~60Hz=20
           OpenGL: renderer: Radeon RX 5500 XT (NAVI14 DRM 3.42.0
5.14.0-rc5-bdver2 LLVM 12.0.1) v: 4.6 Mesa 21.1.4=20
Network:   Device-1: Qualcomm Atheros Killer E2400 Gigabit Ethernet driver:=
 alx=20

 $ lspci=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD9x0/RX980 Host
Bridge (rev 02)
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O Memo=
ry
Management Unit (IOMMU)
00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GFX port 0)
00:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 0)
00:06.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 2)
00:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980
PCI to PCI bridge (PCI Express GPP Port 4)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 SATA Controller [AHCI mode] (rev 40)
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller
(rev 42)
00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 Azalia
(Intel HDA) (rev 40)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0
LPC host controller (rev 40)
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI
Bridge (rev 40)
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI2 Controller
00:15.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB700/SB800/SB900
PCI to PCI bridge (PCIE port 0)
00:16.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:16.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]
SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h Processor
Function 5
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam
Port of PCI Express Switch (rev c5)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI A=
udio
04:00.0 USB controller: Renesas Technology Corp. uPD720201 USB 3.0 Host
Controller (rev 03)
05:00.0 Non-Volatile memory controller: Shenzhen Longsys Electronics Co., L=
td.
Device 2263 (rev 03)
06:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Contro=
ller
08:00.0 Ethernet controller: Qualcomm Atheros Killer E2400 Gigabit Ethernet
Controller (rev 10)

 # lspci -vv -s 03:00.0
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
14 [Radeon RX 5500/5500M / Pro 5500M] (rev c5) (prog-if 00 [VGA controller])
        Subsystem: ASRock Incorporation Navi 14 [Radeon RX 5500/5500M / Pro
5500M]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 65
        IOMMU group: 17
        Region 0: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at d0000000 (64-bit, prefetchable) [size=3D2M]
        Region 4: I/O ports at e000 [size=3D256]
        Region 5: Memory at fe500000 (32-bit, non-prefetchable) [size=3D512=
K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1+,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us=
, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 16GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrP=
rP-
LTR+
                         10BitTagComp+ 10BitTagReq+ OBFF Not Supported, Ext=
Fmt+
EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Reti=
mer+
2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedD=
is-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee01004  Data: 0025
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D010 <?>
        Capabilities: [150 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap+ ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [200 v1] Physical Resizable BAR
                BAR 0: current size: 256MB, supported: 256MB 512MB 1GB 2GB =
4GB
8GB
                BAR 2: current size: 2MB, supported: 2MB 4MB 8MB 16MB 32MB =
64MB
128MB 256MB
        Capabilities: [240 v1] Power Budgeting <?>
        Capabilities: [270 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamF=
wd-
EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamF=
wd-
EgressCtrl- DirectTrans-
        Capabilities: [2b0 v1] Address Translation Service (ATS)
                ATSCap: Invalidate Queue Depth: 00
                ATSCtl: Enable-, Smallest Translation Unit: 00
        Capabilities: [2c0 v1] Page Request Interface (PRI)
                PRICtl: Enable- Reset-
                PRISta: RF- UPRGI- Stopped+
                Page Request Capacity: 00000100, Page Request Allocation:
00000000
        Capabilities: [2d0 v1] Process Address Space ID (PASID)
                PASIDCap: Exec+ Priv+, Max PASID Width: 10
                PASIDCtl: Enable- Exec- Priv-
        Capabilities: [320 v1] Latency Tolerance Reporting
                Max snoop latency: 0ns
                Max no snoop latency: 0ns
        Capabilities: [400 v1] Data Link Feature <?>
        Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
        Capabilities: [440 v1] Lane Margining at the Receiver <?>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
