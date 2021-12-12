Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B240471E9B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 00:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C4510F7DB;
	Sun, 12 Dec 2021 23:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C1F10F7DB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:08:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45DBFB80D8E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA665C341CA
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639350509;
 bh=d8/K6xL0tp4zqfZygx5Z4OCO95MpUxurEW/NxfCA/8g=;
 h=From:To:Subject:Date:From;
 b=YHm6Igjy1XJ82ENLSJVhW8pHI73s916zVN37q5SibfY4fhCIDce75KEZTFVHmmSlU
 p0fUhqPd2Sr0x5ew4MqAXvuYnRwECcxWHWyR54zo1lQ9BTlhzkTYCGpyvJ1XvIbLAy
 au0obvr/0cQGuEWHaWqEhV6xyZnJwzwPen28dRq1KyKSBVP8w9uI6uO5siAu9AKkCy
 HLTfAXuAkJSUa6TlreV6W4EdLxxQxX1mrdBN6iaun6aimTSDcXhCLntieJw3pRgX87
 hwcpNypAPmMNVwRZahbbyjgFco9SN3P5MfxCZ1/gLyrYzOh4/sLhaAFjFK63rhaM6g
 pjb/3/4sM/GEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D178B61106; Sun, 12 Dec 2021 23:08:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215315] New: [REGRESSION BISECTED] amdgpu crashes system
 suspend - NUC8i7HVKVA
Date: Sun, 12 Dec 2021 23:08:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lenb@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215315-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215315

            Bug ID: 215315
           Summary: [REGRESSION BISECTED] amdgpu crashes system suspend -
                    NUC8i7HVKVA
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15-rc1, 5.15, 5.16-rc4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: lenb@kernel.org
        Regression: No

My Intel NUC8i7HVKVA has an AMD GPU.

Until 5.15-rc1, this machine was rock solid in suspend stress testing -- ne=
ver
crashing after hundreds of hours of back-to-back suspend cycles.

Until this patch went upstream:

commit f7d6779df642720e22bffd449e683bb8690bd3bf (refs/bisect/bad)
Author: Guchun Chen <guchun.chen@amd.com>
Date:   Fri Aug 27 18:31:41 2021 +0800

    drm/amdgpu: stop scheduler when calling hw_fini (v2)

    This gurantees no more work on the ring can be submitted
    to hardware in suspend/resume case, otherwise a potential
    race will occur and the ring will get no chance to stay
    empty before suspend.

    v2: Call drm_sched_resubmit_job before drm_sched_start to
    restart jobs from the pending list.

    Suggested-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
    Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Signed-off-by: Guchun Chen <guchun.chen@amd.com>
    Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: stable@vger.kernel.org

I bisected that the patch before this one was integrated can handle over 1,=
000
back-to-back "freeze" system suspend cycles.  Yet, when this patch is prese=
nt,
the system may crash before it completes only 100 cycles, and at most lasts=
 a
few hundred cycles.

This crash is present in all following upstream rc's, including 5.15-rc4.

When I revert this patch from 5.15-rc4, stability returns.

Usually, the crash is manifest by a black screen, and a system that does not
respond to ping, and will only respond to a long AC power button press to
remove power; and a subsequent cold reboot.

I have witnessed the crash occur, and the "ubuntu color themed" screen ente=
rs
some sort of reverse video mode.  In this weird color mode, I've seen a text
window oscillate between scrolling and un-scrolling for a line -- sort of l=
ike
it is going back in time, but then changes its mind.  There is no response =
to
keyboard, mouse, or network input.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
