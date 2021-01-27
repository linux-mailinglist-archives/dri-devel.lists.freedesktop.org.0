Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D323055A1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4287A89D7C;
	Wed, 27 Jan 2021 08:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422789D7C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:29:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A26864D7C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611736165;
 bh=/f4D8DgtZSwN5JXHvzbjh2RjRbrTLlEEEzbcusgTDoE=;
 h=From:To:Subject:Date:From;
 b=nm+YtCgXOjYQ8ExCbJIR3qmdRiB7oJypw+QW7D5sv2e/AgcdyBSp/pLwUGSlZ/9aD
 qm7eJQwFLW0O9JsArDGAxpweUrayrspQgQRSSguMVzKXFu8mWyKsrp0HLMrIRCrQbp
 TNzPRNT6fgEutEq2aO7Canklp5IKKIt+YFI5pqROFBuGngRiCj0FLP7Vgdjt1hwCyg
 9wB1iIKY5yov7Jspi7BrXWTmN1SsY2FMfXDDOBCJIevSlz38MJZ5mTwXyY3+gHetfw
 s3lfogbtgCwbRP+W9tmcwKZqf5FLNW0nnVzVb9wFrlABs/IlnTmTnXvuqbhEBTY5mr
 sVNcWTWvX6IpQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5DD6761499; Wed, 27 Jan 2021 08:29:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] New: [drm:atom_op_jump] *ERROR* atombios stuck in loop
 for more than 20secs aborting
Date: Wed, 27 Jan 2021 08:29:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

            Bug ID: 211425
           Summary: [drm:atom_op_jump] *ERROR* atombios stuck in loop for
                    more than 20secs aborting
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.10
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: icedragon.aw@web.de
        Regression: No

Reproducible: Every times when I switched my monitor off and on again, then my
screen keeps black for round about a minute - the DP port seem to be in a kind
of suspend state. After a minute I can try to switch my monitor off and on
again or switching between the linux consoles, then my screen comes back.
If I try this earlier than after a minute I get no success.

My dmesg output shows the following errors (triggered by this event):
[Di Jan 26 12:59:17 2021] [drm] amdgpu_dm_irq_schedule_work FAILED src 2
[Di Jan 26 12:59:19 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Di Jan 26 12:59:19 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
[Di Jan 26 12:59:19 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Di Jan 26 12:59:19 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[Di Jan 26 12:59:41 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Di Jan 26 12:59:41 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB6EA
[Di Jan 26 12:59:41 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Di Jan 26 12:59:41 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[Di Jan 26 12:59:42 2021] [drm] amdgpu_dm_irq_schedule_work FAILED src 2

I observe such issues with switching monitor off and on again at least since
5.10.4 - I have not tested this with an older kernel version, because at this
time of 5.10.4 I changed my system from an intel processor to this AMD system:

System: Kubuntu 20.10, Ryzon 7 PRO 4750G - using only integrated GPU (Vega10):
Jan 24 17:41:38 localhost kernel: [    0.000000] Linux version 5.10.10-aw
(root@icehome) (gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0, GNU ld (GNU Binutils for
Ubuntu) 2.35.1) #1 SMP PREEMPT Sun Jan 24 17:36:28 CET 2021
Jan 24 17:41:38 localhost kernel: [    0.000000] Command line:
BOOT_IMAGE=/boot/vmlinuz-5.10.10-aw
root=UUID=6ff371aa-4315-475d-b8ec-b0a642c9eb5b ro nosplash video=1920x1080
Jan 24 17:41:38 localhost kernel: [    0.000000] KERNEL supported cpus:
Jan 24 17:41:38 localhost kernel: [    0.000000]   AMD AuthenticAMD
...

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
