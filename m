Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66511443B8F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 03:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364573A6D;
	Wed,  3 Nov 2021 02:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D876873A6D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 02:46:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AC7FB60EFE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635907613;
 bh=i0IMsV8fX95pekyN6qzYCZnPbfZhxxRKkhLTB5L38Wk=;
 h=From:To:Subject:Date:From;
 b=Gt0GBL2GZJEvwXdFnJ65512ynHEsAXEg1c3vVkS5spBhmnpd/ddeZpRqZdqWp8eS6
 1tHuLLAZ+Jj1uQHGOX6/jVaXbakLllRHab4McvDZ3tVyP2a3+me5FgDYEZ0nf663p3
 IDEWNdIVjPBKsh1bLQqlbsd4iWi/SzJ2+b4oMNqMM5zqNgvu4/XqC0/RRO2bqZDKfv
 T3dB/sARXptDszh/+pQAizlOR63XzjG8nhcNFCpToR+tt7hcC9MgPhfPxRtZG8xdEf
 LgzVgHzC/4g/Vx1kXPqLDexAiFGo3wm2g/ZMbx78axT2YAIg/jkTmJgacC+U8e1YSr
 157ejB5Ndm9HA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A215961004; Wed,  3 Nov 2021 02:46:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] New: amdgpu hangs HP Laptop on shutdown
Date: Wed, 03 Nov 2021 02:46:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

            Bug ID: 214921
           Summary: amdgpu hangs HP Laptop on shutdown
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: spasswolf@web.de
        Regression: No

Commit bf756fb833cbe8c6881c964f09db718bade6e591 leads to an improper shutdo=
wn,
i.e. the System does not switch off and has to be powered off by pressing t=
he
power button for a long time. The problem seems to occur relatively late in=
 the
shutdown as it leaves no trace in logfiles.=20=20
It also does not fix hangs on suspension on this Laptop.
Reverting this commit in 5.15 leads to working shutdown again while=20
resuming from suspension still does not work.
Hardware:
HP bw064-ng
CPU:
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 101
model name      : AMD A10-9620P RADEON R5, 10 COMPUTE CORES 4C+6G
stepping        : 1
microcode       : 0x6006118
GPU:
00:01.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Wani [Radeon R5/R6/R7 Graphics] [1002:9874] (rev ca)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
