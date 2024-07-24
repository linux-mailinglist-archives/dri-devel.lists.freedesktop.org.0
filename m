Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538C93AC58
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 07:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6259C10E00A;
	Wed, 24 Jul 2024 05:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="in5ZRUWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB40710E00A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:56:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9707760DC6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49F43C32782
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721800583;
 bh=oNl4Z9G3T4fKj5sLASotheNI5tV+1UcwQYPKEv2dxwY=;
 h=From:To:Subject:Date:From;
 b=in5ZRUWVJOs/wPau/kXOkfeNhSbJMI0pntOWv0gMHylNmQMyhQQ1JQmTJ0Ra1EP4H
 uFVjI0O/O2RQzSV0nOQ8SQRCdSATZulUW9iPUHZ7+XbxyI+NRvqlryxJIoAs+JOL9y
 k7zBmW79jYqmYEg3B5gt5kdOi+GncNUAGBcQbbMpX5rSx/gHvLEgpBkrCwGRoi5ZBb
 pqgpSzUe9gjFnT6S9717yvdUlA8wOvonXWy+cHYEhQc+vHkRcjRjXxXig+UM9AnVi1
 x1oof4sbLcxlCYr2UWy54MOK6RDuihxAwzuHl4CiftAVMtzdkIHzN5/ugjfR4yQ5ys
 vYwv9/7cYKTrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F6CEC53B7E; Wed, 24 Jul 2024 05:56:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219091] New: amdgpu: after updating to linux 6.10, screen
 flickering occurs
Date: Wed, 24 Jul 2024 05:56:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hurricanepootis@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219091-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219091

            Bug ID: 219091
           Summary: amdgpu: after updating to linux 6.10, screen
                    flickering occurs
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: hurricanepootis@protonmail.com
        Regression: No

Arch Linux updated their linux package to 6.10 recently, and since then, my
system has had a screen flickering on the upper portion of the monitor. I t=
ried
out linux-lts, and the flickering went away. Furthermore, I downgraded the
linux package back to 6.9.10, and the flickering also went away.

My setup is: KDE Plasma 6.1.3, Xorg-Server 21.1.13, Mesa 24.1.4, and libdrm
2.4.122. I have a Radeon RX 6800 and a Ryzen 5 5600. The flickering occurs =
both
on X11 and Wayland. My display is an Acer KG240, and is connected over
displayport at 144hz.

I have found one other report, which has a youtube video uploaded of the
problem:
https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1981054.h=
tml

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
