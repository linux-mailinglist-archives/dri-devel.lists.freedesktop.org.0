Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05036B012A2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 07:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90110E9A9;
	Fri, 11 Jul 2025 05:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CVmnjnce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EC410E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:20:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 850195C41E7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 365A2C4CEED
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752211244;
 bh=FL1hPr58+R3MrJ3dFY8stkSZZVc9wE9uJjmNsQyxKM8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CVmnjncee62oolwznH4z0zpviU/Mh698PaF2HcAlTgKLUGBv4KNa9+mbWZBov93Xa
 tP1k/Q9Js1NSROz16qB7y8MVHRI8l9/0G0CH5Zl3dLJPe/rUDtDdDpHB+HnqitXv6b
 TBO4nF3NKmYvkXwZ+oH6ZBJcLmSx9NNTOkwfM+quD0JXcnu2/TDuwIsgFpOJVZpHEd
 nXY01Mih8Lc0oyrww70bUIrA6twV6Jep6FlBr8e3MLZS4wE5TJdEpLwbzRgoq4eewH
 Pzk38wxz5AC/0/kmg5WSNDPdiF3arfv9ff1QX0Uhq+8tXFA5Rv+O7Fy/NXVDkEIDg+
 U666AV0AGszDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2E7EBC41612; Fri, 11 Jul 2025 05:20:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220326] Mismatch between the meanings of brightness and
 actual_brightness
Date: Fri, 11 Jul 2025 05:20:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220326-2300-NlKyE1EKpK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220326-2300@https.bugzilla.kernel.org/>
References: <bug-220326-2300@https.bugzilla.kernel.org/>
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

--- Comment #2 from Van (kernvirt@gmail.com) ---
Update 2: I'm tested Ubuntu 25.04 with kernel 6.14, amdgpu_bl1, and brightn=
ess
works the same as on Debian with 6.12 lts, But for some reason on Fedora and
Arch with kernels 6.14 and 6.15.5 the brightness is non-linear, as I said
earlier, That is, the meaning of brightness does not match with the meaning=
 of
actual brightness.=20

Model of laptop: ASUS Vivobook go E1504FA

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
