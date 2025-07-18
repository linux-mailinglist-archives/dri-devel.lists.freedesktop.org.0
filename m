Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F8B09DB1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 10:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C50710E3F5;
	Fri, 18 Jul 2025 08:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XqpWhvwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1EA10E3F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:19:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F47F601D3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36594C4CEF5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752826761;
 bh=TMCR+AW7rbjE3t71ltT8r8uKebUwike2HN7RH5DQ0d0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XqpWhvwXP9NVVlbtnerTS5M5EmDF/UbDXLcyg1Sn3gYSiTDrCSS4Qn6cJdjzYloIP
 XaPTN38cP3hZfbpwlPqUE/L3dG/zmgS3yl1rzDQ5zuuHbG1mRt6TTkzWbILc1A+tl5
 4sK5PdyWj9+Q83eEPuHQSpdtyV1nDD1txq1f8ECj3N/PyX1xKdjrlO28xN2e9s9KRU
 /Lga9gU2ZLaIrnAEq2Cy/uPpx+WfbZBGQj4LaGanIjer9ffaJdUit3k+UVLNVl/JBG
 DkO2BMwPj1+sYq1b0+er8L/N3Q0ahQNkLzyFzNXPqOzgEqtw16vgxTPf7pDRj87akA
 j/RdrbCQm9kjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 242A5C53BBF; Fri, 18 Jul 2025 08:19:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220339] Use-After-Free in vmw_surface_unref_ioctl() in vmwgfx
 DRM Driver via Stale Surface Handle Dereference
Date: Fri, 18 Jul 2025 08:19:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220339-2300-WoPlr5hlku@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220339-2300@https.bugzilla.kernel.org/>
References: <bug-220339-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220339

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
This kernel release is not supported.

Try to reproduce in 6.15.7 or 6.16-rc6 and reopen if needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
