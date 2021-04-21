Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E063665A1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257A26E18E;
	Wed, 21 Apr 2021 06:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0866E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:49:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 611C6613ED
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618987759;
 bh=SJBYKGP4MrY9yWy2IegX5Yq8Yoetqhy1H5JaCvzrj9A=;
 h=From:To:Subject:Date:From;
 b=L6gvcmGi28Ar5qjU7VJPO2rQJ8nP9ck/m9k5Qy6n99+pv1UGukxJ7AzwNdW9c9Xrk
 HqWFBbJjN8IuIDcx+D669Yom6EM5IQziCVxIqIYMwgaN/xJWbjc4fuADMeMPiEZ5yj
 yBP/y7D7vlS8r6eiTvmDVQVARgqVyyUbz/AmtRsqVJcWGMiOGywBtOEeBOLvwl+jP6
 AN+prmKeaKWHPc2b8V/GHTL5NUPAozzns1POvi4z44p2ZihxnB/SGq3rx7hpEFvGKz
 H8W2K+iQX7ag4t8uy9be4Qz25Px+ODUzMFIy/p0prOI5CNAT9oklXlS01MucU8BKT0
 8KO4bZl+9vPog==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 59099610C9; Wed, 21 Apr 2021 06:49:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212739] New: [amdgpu] Sporadic GPU errors, screen artifacts and
 GPU-induced system lockups on Vega 10 (Raven Ridge)
Date: Wed, 21 Apr 2021 06:49:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tunas@cryptolab.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212739-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212739

            Bug ID: 212739
           Summary: [amdgpu] Sporadic GPU errors, screen artifacts and
                    GPU-induced system lockups on Vega 10 (Raven Ridge)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.14-1, 5.12.rc7.d0411.gd434405-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: tunas@cryptolab.net
        Regression: No

Created attachment 296449
  --> https://bugzilla.kernel.org/attachment.cgi?id=296449&action=edit
Example of GPU artifacts from the recoverable variant of this error

From time to time, the amdgpu driver will report a page fault (sometimes coming
from pid 0, sometimes coming from the web browser, sometimes the screen
compositor or Xorg, sometimes a video player, etc.) as shown below:

>kernel: amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault (src_id:0
>ring:0 vmid:4 pasid:0, for process  pid 0 thread  pid 0)
>kernel: amdgpu 0000:05:00.0: amdgpu:   in page starting at address
>0x800101606000 from client 27
>kernel: amdgpu 0000:05:00.0: amdgpu: VM_L2_PROTECTION_FAULT_STATUS:0x00401031
>kernel: amdgpu 0000:05:00.0: amdgpu:          Faulty UTCL2 client ID: TCP
>(0x8)
>kernel: amdgpu 0000:05:00.0: amdgpu:          MORE_FAULTS: 0x1
>kernel: amdgpu 0000:05:00.0: amdgpu:          WALKER_ERROR: 0x0
>kernel: amdgpu 0000:05:00.0: amdgpu:          PERMISSION_FAULTS: 0x3
>kernel: amdgpu 0000:05:00.0: amdgpu:          MAPPING_ERROR: 0x0
>kernel: amdgpu 0000:05:00.0: amdgpu:          RW: 0x0`

This message is repeated several thousand times in dmesg ("x callbacks
suppressed") with different addresses of form 0x80010160Y000 (where Y is a hex
digit between 1-8.)
In the meantime, the computer is completely hung in terms of display, i.e.
inputs go through, music keeps playing, but the screen is static.

Then, several seconds later, it's followed by:
>kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences
>timed out!

And finally,

>[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft
>recovered

After this, the computer resumes operation (but with GPU artifacts having
appeared on the screen - for an example of these, see attached screenshot).

Alternatively, sometimes instead of the soft recovery message, the GPU cannot
recover and displays the following messages in the kernel log:

>kernel: [drm:gfx_v9_0_priv_reg_irq [amdgpu]] *ERROR* Illegal register access
>in command stream
>kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
>seq=3356413, emitted seq=3356415
>kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
>process Xorg pid 14524 thread Xorg:cs0 pid 14539
>kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset begin!
>kernel: [drm] free PSP TMR buffer
>kernel: amdgpu 0000:05:00.0: amdgpu: MODE2 reset
>kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset succeeded, trying to resume
>kernel: [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
>kernel: [drm] PSP is resuming...
>kernel: [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
>kernel: amdgpu 0000:05:00.0: amdgpu: RAS: optional ras ta ucode is not
>available
>kernel: amdgpu 0000:05:00.0: amdgpu: RAP: optional rap ta ucode is not
>available
>kernel: [drm] kiq ring mec 2 pipe 1 q 0
>kernel: amdgpu 0000:05:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR*
>ring sdma0 test failed (-110)
>kernel: [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP
>block <sdma_v4_0> failed -110
>kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset(4) failed
>kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset end with ret = -110

at which point rebooting is necessary as the GPU will not resume operation.

This also happens on the latest 5.12 rc (as of the writing of this bug report,
this is rc7).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
