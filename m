Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6AFAFD15D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F56210E028;
	Tue,  8 Jul 2025 16:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WT70nnZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC7810E028
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 16:35:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 68B7C6112D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 16:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F9B8C4CEED
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751992507;
 bh=MCMU/vicIYjI7hhx0VfPQQsK6mfoAqeUzVxxUmhEUjU=;
 h=From:To:Subject:Date:From;
 b=WT70nnZLpUeHl+lLJHaet7T3FCQ+Ferx37XXXOOj6IE+OgY/mhSVaoZD3Tia/YrUP
 lDtOj4VbgJd4NiXfWmLYSuantHEZmp6xsMIBWiJM/Pygq1elFKVhH55hguxsyMUjFD
 MGoWzLZXLtoTgyRjyCDkKJF3RukcqGQheI1oXrPB1wuNeGFAVQOqyyaNq5zJui9X3t
 KoGUizxTZuRjmYxf5X6SkC/8YCWAfNqHDeR0ehGcOMOuO5BctNW0Zs7CuTo0PUGRsY
 Tw8Gc6ZX0Wb3qCrpvYGAkA7m281aTeUlfMr1XdtQU/1mPdSbLmpLtiJujFgLCyEM9O
 wKF/Umz7pexnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 11465C3279F; Tue,  8 Jul 2025 16:35:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220326] New: Mismatch between the meanings of brightness and
 actual_brightness
Date: Tue, 08 Jul 2025 16:35:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernvirt@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220326-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220326

            Bug ID: 220326
           Summary: Mismatch between the meanings of brightness and
                    actual_brightness
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kernvirt@gmail.com
        Regression: No

Amd ryzen 5 7520u (Mendocino)
/sys/class/backlight/amdgpu_bl1/type =3D raw
max_brightness =3D 255
Bug: The meaning of brightness does not match the meaning of actual_brightn=
ess
in /sys/class/backlight/amdgpu_bl1. For example, I set brightness 160 and
actual_brightness at this moment =3D 100, Also for example 80/25. In other =
words,
the higher the brightness level I set, the larger the adjustment step per
brightness percentage becomes of actual_brightness, for example 0-4% bright=
ness
in kde =3D 0 in actual_brightness, While the difference between 40 and 45% =
is
already 11 units in actual_brightness.=20
Tested kernels:6.13-6.15.5
Distro - debian/fedora/arch
I've tried:
-kernel parameters: acpi_backlight=3Dvideo/vendor/native
amdgpu.backlight=3D0
-brightnessctl, acpilight=20
-tty, DE
Everywhere the result is the same as I described above.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
