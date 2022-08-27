Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477F5A37FF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CDF10E445;
	Sat, 27 Aug 2022 13:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3100D10E445
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:51:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74ADB60CF1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7AF4C433D7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661608282;
 bh=XW64LLVq53HuXI1MVlwjFkDy/avRwt9Xltxtlatekcc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=e3/E9pcTu3TwdmT7a/Die1JmaGUn7Dv/2xTTS7OiNit2tuOI7LAUKCVkwrw6BKo/v
 eZGmUMRcn1M+o4nOKdpOlVBVY6E8pdrbNP1mKnd4Hin/LrQLYpo3eYG0sp+IKSyg2i
 gQVBuJO3+vM1QCYvciZkKJvngQLMEei0S5+nEvxJoPj9FIqXrVhVu9g6+dGFkOTZnf
 PLnGrZsDaBGRUy6lWlx7aFpdrAcDQiCjJT8w4Nn5695HldWZmfnsely3qrsHhS6SDt
 2H+844QZtbNibLKmj5N9t9sVkBB00g12OIatHMqD85H4LQGA3orzmvSsIKIH92Fs1m
 ZfirAuWCq5ynw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BE908C04231; Sat, 27 Aug 2022 13:51:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Sat, 27 Aug 2022 13:51:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216143-2300-PBAREyJ42Q@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #13 from Erhard F. (erhard_f@mailbox.org) ---
Interesting! Found out this is a gcc vs. clang issue.

Using a kernel built with the attached 5.19.4 config with clang-14.0.6 lead=
s to
the issue as described. Using a kernel built with the same config but with
gcc-12.2.0 just works fine!

I'll close here as it's clear this is not strictly an AMD driver issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
