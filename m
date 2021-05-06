Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77D3754B5
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 15:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8C889DA7;
	Thu,  6 May 2021 13:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1B589D60
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 13:28:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B678E613F5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620307715;
 bh=GcN5MbRzYMpGVp2UedPShBflsnv48mcwT25wHk25OeQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mFtZjFO6nynvbZbwLBYJu9djnyH4OntyRVHPt9gV9/dkDWFFehxaZk2gl6MpZie/9
 8HgaCka9hRqVz1YjX/zXKu2WUTM19z7PtR0fM9LdGXhaPPhT38lyHMsdP8243biWl3
 YLV5Udc7bItksxdcY4/8NtmPetsBZKTwA5sEqlET6sW84HGcgKHGmS5USLiJtWzvP3
 8LXsA0CIgfN9upg/Tp75yLloCI8a5XDXRXSJJ2jKvoggGxkzKLeKDHpd+eB1pw6aKY
 eTp9jRZLo8Jrvogi5LcB0JbgfCXBzRxrVXn706TJGCcwMdPBbyVss/LrGeL8Kb4o6P
 XnPfPRTVIas8g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B2C2C6127C; Thu,  6 May 2021 13:28:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 06 May 2021 13:28:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: filip.hejsek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-50ZcN3hIWk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203905

--- Comment #32 from Filip Hejsek (filip.hejsek@gmail.com) ---
The acpi_video error seems to be
https://github.com/systemd/systemd/issues/15329 - first the ACPI driver cre=
ates
acpi_video1 device, then amdgpu removes it in favor of amdgpu_bl1, but syst=
emd
still tries to set brightness on the removed device (which fails). You can
remove the error by masking `systemd-backlight@backlight:acpi_video1.servic=
e`.

The amdgpu_bl1 error is probably the bug i linked earlier -
https://bugzilla.kernel.org/show_bug.cgi?id=3D210263. Do you have silent bo=
ot? If
yes, you need to print something to console before setting backlight during
boot. You can use the workaround i posted here:
https://bbs.archlinux.org/viewtopic.php?pid=3D1971198#p1971198. If you use =
my
workaround, make sure to remove other workarounds you may have applied for =
that
error (like another service that runs systemctl start
systemd-backlight@backlight:amdgpu_bl0).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
