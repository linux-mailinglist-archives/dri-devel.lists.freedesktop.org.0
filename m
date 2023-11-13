Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0E7E958A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 04:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2826E10E0D8;
	Mon, 13 Nov 2023 03:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C656710E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:31:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11ABE60C40
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0DBEC433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699846299;
 bh=2oMXicnQhy0SmoLwjcdfLVg5HcM63wf/hysylrwi6oI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fJrolmNlm3FHOaVFOOoaXmvEwud8KYfolFJ7wSRfqkem3+qJCBlmfjnS8q8pisfWQ
 EdqlG1a/xaRLc0JbhL0TT80u4TqlY8KW5SHNXHB2gOv8yA1ugP5bHyBz11YoELoPXO
 1+dupsKjYR/6Jx+wlG17CEUH7rSwj9w4HDPdDGsWOCdFhOdDqRS2YR9tcr59dzLEVb
 0Uqp8Gbg691f2HCflnfXVxQ/b/4TgtIcwEIdMG0t7z319HsN8HgQpX8L4+FaYg84Lu
 paGLB6QVBhaRPv0ilmChQNvIu5yLYBjVfk/d+qWQq/mnxJZZUB3UTJb0tf2TJUvamA
 kyskzwUHTTC+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A00CBC53BD3; Mon, 13 Nov 2023 03:31:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218134] Null pointer when rearranging screen layout in XFCE.
Date: Mon, 13 Nov 2023 03:31:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gmack@innerfire.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218134-2300-zXNuisCvrw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218134-2300@https.bugzilla.kernel.org/>
References: <bug-218134-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218134

--- Comment #4 from Gerhard Mack (gmack@innerfire.net) ---
I have opened the bug report as requested
(https://gitlab.freedesktop.org/drm/amd/-/issues/2981)

I also found this while I was digging in the logs and it was just prior to =
the
crash:

[ T8277] [drm] enabling link 2 failed: 15
[T735019] [drm] DM_MST: starting TM on aconnector: 00000000c46ac3ce [id: 90]
[T735019] [drm] DM_MST: DP14, 4-lane link detected
[ T1964] [drm] Downstream port present 1, type 0
[ T1964] [drm] Downstream port present 1, type 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
