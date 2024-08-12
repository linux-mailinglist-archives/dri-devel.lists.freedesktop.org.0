Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731694F550
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 18:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EAC10E140;
	Mon, 12 Aug 2024 16:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nOrCVHxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3360710E140
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 16:54:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94C9C60FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 16:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47F79C4AF0C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723481643;
 bh=BPosyZJIuI+omVdIWTfY040hwuATQlA5mXspsbYiSh4=;
 h=From:To:Subject:Date:From;
 b=nOrCVHxlR+sqMv5MjENq9ANbn4oG/TXbUsHzOSHG/p+uB1HUfyLf2Jdo/E9xRP6ym
 TVuJeA6B8OlpD98z0JkP9ZuxFCQidw515wlN9ir4/lA+jTWeH/Yr7C7h/qxOcU6L8O
 Fbw/s2YOtX/L1cxEZmll03XfBpYa6X21Sa8c47r7pxZNnRZ74IKM+9x1EhSpZBd3PK
 rFOGrVElXAC3pLKuOPz2G9Xnt/BZQmbO7mEIHOmq7bkaOCQHTCT5yvTHWDlYGIb4du
 Iyj7H/Q/q9z/EFCbo6ZEUg4PkSehoKsY9z9xDJJNgHelHJs3cW0+P4TizpjwR0R16r
 APEZ3iMX0mRuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 395EAC53B73; Mon, 12 Aug 2024 16:54:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219152] New: 6.11 regression: AMD 7950x iGPU fails to
 initialize (with bisect)
Date: Mon, 12 Aug 2024 16:54:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: saverio.pub2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219152-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219152

            Bug ID: 219152
           Summary: 6.11 regression: AMD 7950x iGPU fails to initialize
                    (with bisect)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: saverio.pub2@gmail.com
        Regression: No

I've found a regression in the 6.11 kernel, caused by the commit 3af2c80ae2
("drm/amdgpu: refine gfx10 firmware loading").

On boot, the iGPU fails to initialize:

    [drm:amdgpu_device_init [amdgpu]] *ERROR* early_init of IP block
<gfx_v10_0> failed -22
    amdgpu: Fatal error during GPU init
    amdgpu: amdgpu: finishing device.

Reverting the commit fixes the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
