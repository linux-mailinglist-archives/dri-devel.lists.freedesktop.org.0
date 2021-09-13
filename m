Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC36409D84
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367196E226;
	Mon, 13 Sep 2021 19:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DF46E226
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:57:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 508C561107
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631563033;
 bh=dYvAWMvUVweKnCMuAn/t26x8EH6w1avpltIG1hCRvCQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=afRMWpIqWy48rW+I12RQeOHCangecFfOVfpK4gaurA8lLuglOeIYA2HyzeFB2cOPe
 c7Ith/wGO55ODgGmAjw+m715qp/hDdlpO8BX++KE8IYpK1jVJ0QLi0qB3blA4Vd73/
 0vWCShSEBOXUWeVW3TuEwFGn8Xcu4WAvI38KWgbYncp2dAmK4ycJ2kgmmnyiKVhJDH
 TMRkjVef4KhoU3DTRzTDXud+RQzXjtMDzzasdvB+NhV65R7OCpbWWbt8cZ6sg/WyG3
 s/awyafsRTlWAkoRJA4ijKPSXGgQ/xay0aJ/QJlVzTd9LdCuoUZ4/+c+ncKT3ylZl8
 AhWGU1BdtKJ6w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4D59260F6B; Mon, 13 Sep 2021 19:57:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Mon, 13 Sep 2021 19:57:12 +0000
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
Message-ID: <bug-214029-2300-T1ines93YG@https.bugzilla.kernel.org/>
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

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298783
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298783&action=3Dedit
output of kmemleak (kernel 5.15-rc1, AMD FX-8370)

Seems unchanged in kernel 5.15-rc1.

 # cat /sys/kernel/debug/kmemleak
unreferenced object 0xffff88810830b400 (size 1024):
  comm "lxdm-greeter-gt", pid 624, jiffies 4294887923 (age 1566.300s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 b4 30 08 81 88 ff ff  ..........0.....
    08 b4 30 08 81 88 ff ff 30 f5 10 9b 81 88 ff ff  ..0.....0.......
  backtrace:
    [<ffffffffc1352a88>] amdgpu_job_alloc+0x38/0x2f0 [amdgpu]
    [<ffffffffc1352d67>] amdgpu_job_alloc_with_ib+0x27/0xf0 [amdgpu]
    [<ffffffffc0f37323>] amdgpu_copy_buffer+0x1d3/0x700 [amdgpu]
    [<ffffffffc0f37e4a>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f39586>] amdgpu_bo_move+0x356/0x2050 [amdgpu]
    [<ffffffffc06fa897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc06fe403>] ttm_bo_validate+0x2b3/0x3b0 [ttm]
    [<ffffffffc0f3fa84>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f4f903>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffff97568963>] __do_fault+0xf3/0x3e0
    [<ffffffff9757a5f5>] __handle_mm_fault+0x16e5/0x2aa0
    [<ffffffff9757bada>] handle_mm_fault+0x12a/0x490
    [<ffffffff9708e449>] do_user_addr_fault+0x259/0xb70
    [<ffffffff988137a5>] exc_page_fault+0x55/0xb0
    [<ffffffff98a00acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8881fe3ca4c0 (size 216):
  comm "lxdm-greeter-gt", pid 624, jiffies 4294887923 (age 1566.300s)
  hex dump (first 32 bytes):
    50 a5 3c fe 81 88 ff ff 20 ab 74 c0 ff ff ff ff  P.<..... .t.....
    e0 ea 04 ac 08 00 00 00 50 fd c5 08 00 c9 ff ff  ........P.......
  backtrace:
    [<ffffffffc07471df>] drm_sched_fence_create+0x1f/0x1d0 [gpu_sched]
    [<ffffffffc07424de>] drm_sched_job_init+0x10e/0x240 [gpu_sched]
    [<ffffffffc13538a5>] amdgpu_job_submit+0x25/0x100 [amdgpu]
    [<ffffffffc0f375ee>] amdgpu_copy_buffer+0x49e/0x700 [amdgpu]
    [<ffffffffc0f37e4a>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f39586>] amdgpu_bo_move+0x356/0x2050 [amdgpu]
    [<ffffffffc06fa897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc06fe403>] ttm_bo_validate+0x2b3/0x3b0 [ttm]
    [<ffffffffc0f3fa84>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f4f903>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffff97568963>] __do_fault+0xf3/0x3e0
    [<ffffffff9757a5f5>] __handle_mm_fault+0x16e5/0x2aa0
    [<ffffffff9757bada>] handle_mm_fault+0x12a/0x490
    [<ffffffff9708e449>] do_user_addr_fault+0x259/0xb70
    [<ffffffff988137a5>] exc_page_fault+0x55/0xb0
    [<ffffffff98a00acb>] asm_exc_page_fault+0x1b/0x20
unreferenced object 0xffff8881cdbb7000 (size 1024):
  comm "mate-session-ch", pid 722, jiffies 4294890054 (age 1559.204s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 70 bb cd 81 88 ff ff  .........p......
    08 70 bb cd 81 88 ff ff 30 f5 10 9b 81 88 ff ff  .p......0.......
  backtrace:
    [<ffffffffc1352a88>] amdgpu_job_alloc+0x38/0x2f0 [amdgpu]
    [<ffffffffc1352d67>] amdgpu_job_alloc_with_ib+0x27/0xf0 [amdgpu]
    [<ffffffffc0f37323>] amdgpu_copy_buffer+0x1d3/0x700 [amdgpu]
    [<ffffffffc0f37e4a>] amdgpu_ttm_copy_mem_to_mem+0x5fa/0xf00 [amdgpu]
    [<ffffffffc0f39586>] amdgpu_bo_move+0x356/0x2050 [amdgpu]
    [<ffffffffc06fa897>] ttm_bo_handle_move_mem+0x1c7/0x620 [ttm]
    [<ffffffffc06fe403>] ttm_bo_validate+0x2b3/0x3b0 [ttm]
    [<ffffffffc0f3fa84>] amdgpu_bo_fault_reserve_notify+0x2a4/0x640 [amdgpu]
    [<ffffffffc0f4f903>] amdgpu_gem_fault+0x123/0x2d0 [amdgpu]
    [<ffffffff97568963>] __do_fault+0xf3/0x3e0
    [<ffffffff9757a5f5>] __handle_mm_fault+0x16e5/0x2aa0
    [<ffffffff9757bada>] handle_mm_fault+0x12a/0x490
    [<ffffffff9708e449>] do_user_addr_fault+0x259/0xb70
    [<ffffffff988137a5>] exc_page_fault+0x55/0xb0
    [<ffffffff98a00acb>] asm_exc_page_fault+0x1b/0x20
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
