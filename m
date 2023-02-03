Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93D6897AE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 12:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0A410E02E;
	Fri,  3 Feb 2023 11:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87E10E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:25:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 868BAB82A74
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D45AC4339E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675423541;
 bh=YhgbeFtdM4MkQIbiRvM+d6GjakZ5xZ0i+pL3uzvmwMA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QSEJzwsxcG0opMu58B0nNQchnlS++WQQo1mevXzlNss6rA6TH/rfUybhZDd/0Cg0V
 M97abgMgXL8MkrrqzUugIrdo2ZLfm8WsYxZHT7cOtajSaUn7ZkIKd1IQIQBa+I8y7a
 7i00GodDr+me16RN9Fx3ZCsdISTNn+nhahM4C7Z8DaAzNL+FGvR2NjfUs52Mo2rfJT
 KLnq8bN9bBelvwqzyafE+dmOF6h7bB3fgfq+xx75EbSW2WM52q4E2P4r/+9oMrICJF
 1HbNM3fQLePGsQlPe0SSLI8GEgH8cB7CffKl5ywUTZwYpJ55ebn6g0qaDVtVrY6IQs
 5JbA88FeCSMBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 15D01C072A6; Fri,  3 Feb 2023 11:25:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Fri, 03 Feb 2023 11:25:40 +0000
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
Message-ID: <bug-216119-2300-bKUQuYSYlh@https.bugzilla.kernel.org/>
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

--- Comment #51 from Harald Judt (h.judt@gmx.at) ---
Ok. After some tests with 6.1.8 and later, things seem to be a bit more sta=
ble,
though I do not know whether the reason is actually the newer kernel or more
exact tests on my part.

It now seems that as long as I only switch between X window sessions
(VT-switching from one X session to another one), the crash does not occur.=
 As
soon as I switch to any non-X VT, the screen stays blank or freezes with the
text cursor not visible. I can restart the computer using Ctrl-Alt-Delete, =
and
switching back to another X VT also works, but of course the X session is
frozen too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
