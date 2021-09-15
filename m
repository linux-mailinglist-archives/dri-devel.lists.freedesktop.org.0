Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099640CE87
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 23:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF926EA36;
	Wed, 15 Sep 2021 21:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD36EA36
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 21:09:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 132BC60FED
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631740196;
 bh=gTSJNjeVBt41gxuTTmWm2DQT37J73c5hPnIKA48AeA8=;
 h=From:To:Subject:Date:From;
 b=QQG3uNNDo1JtbgNU3vpWcJZbz/fpjS3JKrjy83IkTsAUjcTGV/2ZeUNioTmWdxv0f
 tKCQGGEdTmVJqGXsCXauvzL3BhEk+xUG72wpIRPXeBW99CRelp495UMi6syb+7jNh/
 57L5ZwSGnWvdmwCDGNtszB0dKCma4czc6n5wt6fiGLXsG/JHP5dgridIYnabQE/h02
 IR5xlPjtVRk2LbQy1WwmIB/LrnLdbPwFRFjjZnSxaQHZMyEv7BoKRpi53TWqkYWL/W
 7V9wVyLhM9aEqIJG5OIIi3UgMgZPvJeaDkt5zA6OsjQodBBdwEFwZmccR01yV7472Z
 p63HEAugwRPwA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1083E61001; Wed, 15 Sep 2021 21:09:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214425] New: [drm][amdgpu][TTM] Page pool memory never gets freed
Date: Wed, 15 Sep 2021 21:09:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: doucha@swarmtech.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214425

            Bug ID: 214425
           Summary: [drm][amdgpu][TTM] Page pool memory never gets freed
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.3
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: doucha@swarmtech.cz
        Regression: No

Hello,
while playing certain webGL games, I've noticed what appears to be a memory
leak in the kernel. Further investigation revealed that after about an hour=
 of
gameplay, over 3GB of memory (half of all available RAM on my machine) will=
 be
taken by the TTM page pool.

While the excessive allocation may be caused by a resource leak in the game
itself (I need to investigate that further), the larger problem is that TTM
never releases the memory even after I quit the game. Closing the game only
moves the allocated memory from active buffer objects to idle memory pool w=
here
it'll get stuck until I reboot the system. Shutting down X server doesn't
release the memory either.

System specs:
HP Probook 455 G7
AMD Ryzen 5 4500U CPU
AMD Renoir GPU (Mesa 21.2.1, LLVM 12.0)
Gentoo Linux

TTM statistics before quitting the game:
/sys/kernel/debug/ttm/buffer_objects:
3116

/sys/kernel/debug/ttm/page_pool:
          --- 0--- --- 1--- --- 2--- --- 3--- --- 4--- --- 5--- --- 6--- ---
7--- --- 8--- --- 9--- ---10---
wc      :        2        2        1        1        8        2        0=20=
=20=20=20=20=20=20
1        2        1        2
uc      :        0        0        0        0        0        0        0=20=
=20=20=20=20=20=20
0        0        0        0
wc 32   :        0        0        0        0        0        0        0=20=
=20=20=20=20=20=20
0        0        0        0
uc 32   :        0        0        0        0        0        0        0=20=
=20=20=20=20=20=20
0        0        0        0

total   :     3410 of   939433

/sys/kernel/debug/ttm/page_pool_shrink:
2898/512


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

TTM statistics after quitting the game (until reboot):
/sys/kernel/debug/ttm/buffer_objects:
403

/sys/kernel/debug/ttm/page_pool:
          --- 0--- --- 1--- --- 2--- --- 3--- --- 4--- --- 5--- --- 6--- ---
7--- --- 8--- --- 9--- ---10---
wc      :      151      134       20        5      255      241      790=20=
=20=20=20=20
193      416     1121       83
uc      :        0        0        0        0        0        0        0=20=
=20=20=20=20=20=20
0        0        0        0
wc 32   :        0        0        0        0        0        0        0=20=
=20=20=20=20=20=20
0        0        0        0
uc 32   :        0        0        0        0        0        0        0=20=
=20=20=20=20=20=20
0        0        0        0

total   :   853035 of   939433

/sys/kernel/debug/ttm/page_pool_shrink:
853034/1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
