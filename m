Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C456CEA5
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 13:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FF012B3B2;
	Sun, 10 Jul 2022 11:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C001812B3B2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:02:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F2BF611D9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78296C341CA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657450935;
 bh=I9xeGoW3EQpsSEeukLfFqiEPvV3ZNfWFnEnXPsNONYo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qDAQ2Pvr7/VL91EzGBfx/svhKNJufgVpUNRCxAAJR+p41a+I9ZrypwdutFuB+CD7p
 WR8wlQ9dKUR3M4Iw23n9nAz2yxxe2oncj9SJTZQz/oV/QpWPYVG9MAbNdK2yF36Xe2
 fNFCNqYPBvSzyVeM+YBg9aYDugddnkQSu7+2v4xV4I8hz+FEjwAL7Ifj3cqI0saqtC
 8FvyNTyMIX1e8YWkDvqFyRPLg5gwW5f07bw/+Gen2GgxqgPLRAWTzUITZXkAuFJlkB
 vfqf3u9BtNLlljwFu3WPyRb0V/CAU82BVk7i1hxJm6S5RB+GwQaaOPSGYhA3AjE7fu
 RA2HGu3fmxXhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 65622C05FD2; Sun, 10 Jul 2022 11:02:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Sun, 10 Jul 2022 11:02:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216143-2300-sTRxWJtDnw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Tried
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=3Ddrm-misc-fixes&id=3D9=
25b6e59138cefa47275c67891c65d48d3266d57
suggested in https://gitlab.freedesktop.org/drm/amd/-/issues/2050#note_1461=
646
but it did not work out. This bug here seems an entirely different matter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
