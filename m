Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB0655A21A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34B10EB57;
	Fri, 24 Jun 2022 19:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091F610EB57
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:51:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0F0D62263
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BD82C3411C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656100281;
 bh=R6xck1XVRqjzBBPbP1hGlzeLPCehMMvMHTRheIhooTc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E8amzj9/ODyyuQyUoBxsd6fPQL0ZJfN/SUCUrxKNmivL4ZEyQZs6MRKCNKPVTtIdi
 jU7KWoJHZoybK7tJBJmBtix3I91J95yLR+erEZ7MZUghtWQ3ebM7+2gyKIpRMzuoRX
 Ax7TsistMzy4/X2JK3GqTEj/CUEUeWdpa64x8IlT8dNH3dt3gZR6Jpd1vrTIwUuSE9
 6Msn4e9rUmPyFeh277cMchefxsUh9ADzY+YlM80m/9Iwm8itdohX2tJCVQqwtJgglk
 Y783nd8YdPNV4bMUSBIXq7fbAWubUVtTfBecfN/0hhyYjtepKJ9gNVwARqZ5XdCnL/
 jjbC3MBTl8Upg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4759CC05FD5; Fri, 24 Jun 2022 19:51:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Fri, 24 Jun 2022 19:51:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-O8HZKgxfuC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #20 from Harald Judt (h.judt@gmx.at) ---
One thing that I have noticed: Since these changes, the kernel seems to swi=
tch
to text mode when hibernating. Before that I think it remained (frozen) on =
the
X screen.

Here are the results:
- 1+4: screen black, display suspend led, keyboard comes online again but no
ssh. can sysreq to reboot.
- 2+4: screen black first, comes back after some time, restores screen with
hibernation snapshotting progress visible (not those of resume), continues =
to
resume (resuming progress visible), but then screen goes black again in dpms
on, ssh available. was able to compile kernel and reboot via ssh.
- 3+4: does not compile. unknown fb struct or so. because of that, i tried
2+3+4 since 2+4 compiled fine and worked fine mostly.
- 2+3+4 works as good as 1+2+3+4. seems patch 1 is not necessary.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
