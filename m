Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B993358CAD0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 16:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADB8914B4;
	Mon,  8 Aug 2022 14:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551D90E44
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:40:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A399360E8A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E84DC433C1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659969602;
 bh=s3EqGhxvwOo6OF6HENAUKKizdqH2s9IZxUfOaxnI1AU=;
 h=From:To:Subject:Date:From;
 b=jbT+d1wZ/y6pgnWdCL6RnBeIyakV3RxXbZI9wkcxlYEZotZHvJVsGSZXRn8VCfZkz
 iIxSdBiCHg4tygDZknpOUK03TeKYWxnp2HWLHkx71I2jvLnnaCtiIwRuP2Y/YcTwzC
 5RyxSoxKLBRziTfFpYad8iIIAYR145ful5iNTk1YikhGYphCcoGRMAMhmnPBWT5NLp
 Tvs4ANWJDrN7w1li+BBnnuh3cjF2qzZQYHq6Pz4H50WLf1qLFwQPfi/TIoeQAhl2fy
 mgumnvNusC5QGVBGc8wogYVE4USHVkM6wwVadsxp0w3WvrPhiJo6oWdfLkC6Iu6FuW
 yzmuHW1Z2q1MQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2834C433E7; Mon,  8 Aug 2022 14:40:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216338] New: Null Pointer Dereference in rockchip_drm_vop2.c
Date: Mon, 08 Aug 2022 14:40:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: macromorgan@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216338-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216338

            Bug ID: 216338
           Summary: Null Pointer Dereference in rockchip_drm_vop2.c
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.0
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: macromorgan@hotmail.com
        Regression: No

When you use more than 1 video port (VP0 and VP1, for instance) on a Rockch=
ip
RK3566 with the VOP2 driver, the driver issues a null pointer dereference w=
hen
it gets to the drm_crtc_init_with_planes function here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/rockchip/rockchip_drm_vop2.c?h=3Dv5.19#n2333

This appears to be because the function above it assigns primary planes to =
all
active video ports, but since it has special logic for the RK3566 it only e=
nds
up with 1 primary plane to assign to a video port. When it encounters a sec=
ond
video port it assigns it nothing, and then triggers a null pointer derefere=
nce
when it gets to the drm_crtc_init_with_planes function because plane is nul=
l.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
