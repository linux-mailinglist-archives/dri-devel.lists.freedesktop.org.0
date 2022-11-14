Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E99628C73
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 23:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76B510E10B;
	Mon, 14 Nov 2022 22:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D164A10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:58:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 557BDB815AC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED970C433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668466713;
 bh=8v2UWzS2azve1eA4nd+lywvSbWFhwVfWujV92AGiO3U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uhh7tQQs89E5QtQrVN/GNmzAh28VtwY9YYfE5/i9lT74HUskYjlp+yT0HN7o1IuM/
 7wVHwUHpHEgf9r0/gffi+grFz7DN3Iu7OzxhbN7HncQQUnsl9sBNoj6/D8RZFQMZTL
 WUPF4ai6KhNWyEac1U1Gw/6Q61pUAizJzAi8j68iMgZITCGjv8AjQerNYlyEuJzFCo
 Ehxd/MxPyQ8awMaUr5+Ru0PZAsrUURBRZqyl99JdwKTAzTKbiVlTGAGRQy8eCH5adU
 wK9VeMWBJ83CFPx0rC5bMD6npLko9cuF6aYINIRd051gdhHecjUP+pa3PXc90wfovR
 kO9gXXoexfBig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D900FC433E6; Mon, 14 Nov 2022 22:58:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Mon, 14 Nov 2022 22:58:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216143-2300-COkKZgPKoP@https.bugzilla.kernel.org/>
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

--- Comment #16 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303180
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303180&action=3Dedit
kernel dmesg (kernel 6.1-rc5, AMD Ryzen 9 5950X)

Reinvestigating on kernel 6.1-rc5 built with clang 15.0.3 + lld 15.0.3.

So far I was not able to reproduce the bug! X runs just fine for now.

I'll close here once 6.1 is stable and I can assure the bug does no longer =
show
up on my other affected machines (AMD PRO A12-8830B, AMD PRO A10-8750B) too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
