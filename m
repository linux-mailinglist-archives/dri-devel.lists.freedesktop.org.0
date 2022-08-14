Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE5591E91
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 07:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE6BC9778;
	Sun, 14 Aug 2022 05:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DB7C9765
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 05:55:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1862CB80AC9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 05:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC01EC433C1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 05:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660456552;
 bh=X89R2eG+bmnrFASDmNf3dhn0C+c1+i8EUIZnReeX9bk=;
 h=From:To:Subject:Date:From;
 b=sJqpbyhh+sdLjNJpN8u2a/jiuPavmhXsm/Mz/GRghBo/Phjj8Oj8tiPK8liEEdS23
 1UmxLgD2JrMdr/6LHp5d2HK8XaMZkA33aps6wzeqt07l9qNcN97mcEpwZtOZ/XkDDy
 uDLnd7HUZ3j/1DVmKGCeLXStT/0MNmn4+zK44MD6yMByz7qNIu2EIr/MmF782C/cwm
 poTigEWb+ZTif1TY4A61MLzfjVIdxA27IrzHplX/dDhKSEA0LtqaqFI91bj3AJqAWx
 qQ6nQtoMvZ6ACcgLudOD/GpsHHlvzxpseZy8ZnhATsvWflUdqFcKed/M8ZPIxnAKAE
 N/2kB/qYE6rOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A95A7C433E9; Sun, 14 Aug 2022 05:55:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216359] New: [amdgpu] ring gfx timeout after waking from
 suspend and exiting X
Date: Sun, 14 Aug 2022 05:55:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shlomo@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression
Message-ID: <bug-216359-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216359

            Bug ID: 216359
           Summary: [amdgpu] ring gfx timeout after waking from suspend
                    and exiting X
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.13, 5.19.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: shlomo@fastmail.com
                CC: alexdeucher@gmail.com
        Regression: Yes

After waking up from suspend and exiting X (and trying to switch to a diffe=
rent
tty, but I think the bug happens before that), I get:

Aug 14 08:27:21 up kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring =
gfx
timeout, but soft recovered
Aug 14 08:27:31 up kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring =
gfx
timeout, but soft recovered
Aug 14 08:27:42 up kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring =
gfx
timeout, but soft recovered

The screen freezes, and I have to reboot to get a stable system.

Arch Linux 5.18.12.arch1-1 is good.
Arch Linux 5.18.14.arch1-1 is bad.
Arch Linux 5.18.15.arch1-1 is bad.
Arch Linux 5.18.16.arch1-1 is bad.
Arch Linux 5.19.1.arch2-1 is bad.

4ffcacab7145080187330accafae69e87a481eec is the first bad commit
commit 4ffcacab7145080187330accafae69e87a481eec
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Jun 21 10:10:37 2022 -0400

    drm/amdgpu/display: disable prefer_shadow for generic fb helpers

    [ Upstream commit 3a4b1cc28fbdc2325b3e3ed7d8024995a75f9216 ]

    Seems to break hibernation.  Disable for now until we can root
    cause it.

    Fixes: 087451f372bf ("drm/amdgpu: use generic fb helpers instead of set=
ting
up AMD own's.")
    Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D216119
    Acked-by: Evan Quan <evan.quan@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            | 3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            | 3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             | 3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             | 3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
