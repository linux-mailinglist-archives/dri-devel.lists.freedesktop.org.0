Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3B3FB73E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBEA89DDF;
	Mon, 30 Aug 2021 13:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9388189DFE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:49:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C9FA60F12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630331370;
 bh=3GSwVJmifEcmlA8ZGfvGXpodV8SQ+m8UenwiG3bSL6k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=L3c+yCEqb0UEA5xCxhhfBwALmGft3wRi5M+Y3RSiNO6f8dQ/yRiVk+bjXd09iAlfZ
 Gn20yZ6Ye1Z89JevAy14y6n+2jL2RQ01qWQCcwzedOYuTSfq1Rg9trkHyEQDQeW8rt
 zS8IP3AVDdc+/qNF+ZZalBD65L/KywsEqS4LJkmZSOALqW6xN9DRgy1VEulHR4ooI0
 F9xitUCcU8SQ/v7Rrb14idtT53fOZI+7qsOQL71FWC7qLy4r9dm8wDNEIqKiaObx55
 e4AfOQjinS/Vi+6o77GjulXZZI9wAtCgAWq0qte8zsHnZy56pfvMBhtQ/10vEu9TXf
 djPGWaauaZODA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 42F7460FC1; Mon, 30 Aug 2021 13:49:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Mon, 30 Aug 2021 13:49:29 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-214029-2300-sAdPc9KTz3@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298267|0                           |1
        is obsolete|                            |

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298529
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298529&action=3Dedit
output of kmemleak (kernel 5.14, AMD FX-8370)

[...]
unreferenced object 0xffff8881dd96f0c0 (size 216):
  comm "lxdm-greeter-gt", pid 619, jiffies 4294888177 (age 3729.577s)
  hex dump (first 32 bytes):
    50 f1 96 dd 81 88 ff ff 20 8b 72 c0 ff ff ff ff  P....... .r.....
    c0 3a 59 da 08 00 00 00 58 fd a6 08 00 c9 ff ff  .:Y.....X.......
  backtrace:
    [<ffffffffc072514f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc07204de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc159e317>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc118ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc118b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc118ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0887897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc088b297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc1193444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc11a3323>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffb255c853>] __do_fault+0xf3/0x3e0
    [<ffffffffb256ea4b>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffb256fa6a>] handle_mm_fault+0x12a/0x490
    [<ffffffffb2090909>] do_user_addr_fault+0x259/0xb70
    [<ffffffffb37ad665>] exc_page_fault+0x55/0xb0
    [<ffffffffb3800acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff888120f77100 (size 72):
  comm "sdma0", pid 344, jiffies 4294888177 (age 3729.577s)
  hex dump (first 32 bytes):
    30 f4 ec 3a 81 88 ff ff 20 8a f0 c1 ff ff ff ff  0..:.... .......
    a3 49 5d da 08 00 00 00 58 84 a3 0c 82 88 ff ff  .I].....X.......
  backtrace:
    [<ffffffffc1180521>] amdgpu_fence_emit+0x91/0x790 [amdgpu]
    [<ffffffffc11ed4cb>] amdgpu_ib_schedule+0x8cb/0x12f0 [amdgpu]
    [<ffffffffc159d67e>] amdgpu_job_run+0x35e/0x790 [amdgpu]
    [<ffffffffc072392e>] drm_sched_main+0x64e/0xc60 [gpu_sched]
    [<ffffffffb212fdf2>] kthread+0x342/0x410
    [<ffffffffb20030d2>] ret_from_fork+0x22/0x30
unreferenced object 0xffff888246342640 (size 216):
  comm "mate-session-ch", pid 718, jiffies 4294890392 (age 3722.200s)
  hex dump (first 32 bytes):
    d0 26 34 46 82 88 ff ff 20 8b 72 c0 ff ff ff ff  .&4F.... .r.....
    03 71 65 92 0a 00 00 00 58 fd a6 08 00 c9 ff ff  .qe.....X.......
  backtrace:
    [<ffffffffc072514f>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc07204de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc159e317>] amdgpu_job_submit+0x27/0x2d0 [amdgpu]
    [<ffffffffc118ae6e>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc118b6ca>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc118ce06>] amdgpu_bo_move+0x356/0x2180 [amdgpu]
    [<ffffffffc0887897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc088b297>] ttm_bo_validate+0x2c7/0x450 [ttm]
    [<ffffffffc1193444>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc11a3323>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffffb255c853>] __do_fault+0xf3/0x3e0
    [<ffffffffb256ea4b>] __handle_mm_fault+0x1bcb/0x2ac0
    [<ffffffffb256fa6a>] handle_mm_fault+0x12a/0x490
    [<ffffffffb2090909>] do_user_addr_fault+0x259/0xb70
    [<ffffffffb37ad665>] exc_page_fault+0x55/0xb0
    [<ffffffffb3800acb>] asm_exc_page_fault+0x1b/0x20
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
