Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E700AB2FCF3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4E210E9B0;
	Thu, 21 Aug 2025 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MFeCDprX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243510E9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:39:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 72874601F8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22ED4C4CEEB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755787155;
 bh=9XCXaxoCbDyW2pZDl95WZ2xiUuyQqv5p7fZedFto1G8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MFeCDprXE1YKOPXS8VFKkz4MH2NZDDJLtg64YWdXLxAij5Vv0EnMXxwIisnVLD0GH
 UnsltNrJ+nj9samGpI76+MuPoBMTqjPLWzug7OYuF0T2Gz37zAJ6Sm9lHSUym3KP4n
 0B7Y/p+tR3mFr+jVU99xj2YjINNFmEKakZMLjhkKpYqcYkjLemiKP1OyjIn+G9orf5
 b4W2uacMOzFW1W+3gXtJindkSCNeFlSnu3p0hoeaMGwcGfMri5ovstWqjDkS1+y7UR
 LFVBM36yq0o+rDU4xu2/liNzYQoXmUNcy1Ayf0mP7i6kBMZP3Dwp5MuIS+6WJ/ymBE
 OpbGOtfHjkXyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1859AC53BC7; Thu, 21 Aug 2025 14:39:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Thu, 21 Aug 2025 14:39:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jerbear3.14159@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206309-2300-oOMQuPvKDH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

--- Comment #8 from jerbear3.14159@gmail.com ---
Hi, if you're comfortable modding your kernel, I managed to fix a couple GPU
power management bugs, and I have the slightly slower "battery" clock speeds
working reliably now (haven't cracked full power AC mode yet). It also
correctly lowers clock speeds when not in use, in order to not run so hot
anymore. I opened a bug report on the official amdgpu issue tracker with al=
l my
findings so far: https://gitlab.freedesktop.org/drm/amd/-/issues/3619

I intend to take another look someday, and eventually submit a proper patch=
/PR,
but just having this hack is such a massive improvement that it hasn't been
worth it yet for me personally.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
