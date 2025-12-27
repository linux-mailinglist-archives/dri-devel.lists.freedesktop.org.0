Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3EECE01CF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 21:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D33510E009;
	Sat, 27 Dec 2025 20:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yxu0vuq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EA210E009
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 20:14:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75AC24082A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 20:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56B6EC4CEF1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766866469;
 bh=4Jx7oenjJbJqRO3c17F4kdDY58mb2Inj73MBmv+YaiY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Yxu0vuq1WsNlEZ9x9F75joO+nxA9gCeGitGcByvNJid4RuaFofXXZ/sRu3XENY8QZ
 zjjBLYI12nVu1m7GXjELtrAztZjh0olFmkrgn6zSVTk2zM+UmjOvWh5upzbBSQ8378
 QKBW16uOZkrpOI5S9wmpVlqJLX7d/ra4cLE5yB/Q1FtwRHmASH5bYXtHp3AcgB6y2V
 EZUqHAahqo7H4azCaYFAw+iJrRz25s4w2H0c1yBjlURORtsCcQsdzqC2JxHzGbKPlx
 fX8YtVI9D+lE5KvnXaTySWeNiGyChXlBk+uInWNKHy3sYmUQHxFIsCcDkbqBxh4Nyu
 5+J/AHHhvL4fg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51537C41612; Sat, 27 Dec 2025 20:14:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Sat, 27 Dec 2025 20:14:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220906-2300-EErLOuylPj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220906-2300@https.bugzilla.kernel.org/>
References: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

--- Comment #7 from Andrei (danandrei@gmail.com) ---
I initially thought this was just an AMD driver bug, but after digging thro=
ugh
the logs across a few more versions, I think I=E2=80=99ve found a better le=
ad.

In 6.17.6, where the regression started for the first time, I'm seeing these
bridge resource failures pop up for the first time:

pci 0000:02:00.0: bridge window [io  size 0x1000]: can't assign; no space
pci 0000:02:00.0: bridge window [io  size 0x1000]: failed to assign

Bridge 02:00.0 is the gateway for the USB4/Thunderbolt 4 controller on this
machine. In version 6.17.5, the kernel assigns it just fine and my 4K output
works perfectly. Starting with 6.17.6, that assignment fails, which lines up
exactly with when the display stops working.

Interestingly, the ath12k driver also starts throwing an "invalid ACPI DSM =
TAS
config size" error in this same version. It feels like 6.17.6 changed somet=
hing
fundamental about how ACPI or PCI resource arbitration is handled, and now =
it's
just choking out the I/O space that the Thunderbolt subsystem needs to
function.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
