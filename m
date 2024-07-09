Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086D292B238
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 10:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABEE10E4AF;
	Tue,  9 Jul 2024 08:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jWsTlgnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A725710E4B6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:36:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1BC3DCE0F2B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EEB9C4AF0A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720514182;
 bh=l3BrGtfgwS0ZSl3hTfr4Vr5jpDBVrosczIP8PADLiUI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jWsTlgnQYIDIQVVyxamBZgE2t9bmMZ30jWWZuONDCGRmEYUGtwfXmaMCQ/syCpYvd
 FGY7o8ZIpUh5WmaTMF7j1L2ukUepk3ul4cKkifGDxpopwnPZtHOEJrXe1ziT5T9zca
 tRTZNznY8HuTw9TRQ4p8qYxATiA7ytfmP3BE+S3gmbA2RFCZtJVVA/O/G5WHmxJbhZ
 UhTtHF7zkMxMVci2xLY4B7QR9esdWwjbzxFAo5lx/BkJkZ4QLry6nhZQqZBhG+Rdgr
 tkzWtlRrekMdntHwAvDe6hSv4ssuV7rXnkrHeJN8TlepnX3D4MbYJ2LiVLPqPWaUcu
 blmHLymTxTEFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2FE28C53B73; Tue,  9 Jul 2024 08:36:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219007] opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system, 6.10.0-rc6+
Date: Tue, 09 Jul 2024 08:36:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219007-2300-6xR3QshGxj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219007-2300@https.bugzilla.kernel.org/>
References: <bug-219007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219007

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Colin, quick reminder: many bugs reported here are never forwarded to any
developer. For some of the details see https://lwn.net/Articles/910740/ and=
 the
links in there. So the people you are trying to reach most likely won't even
see this.

Mail is usually the best for reporting, as mentioned in
https://docs.kernel.org/admin-guide/reporting-issues.html (which also tells
people to avoid bugzilla in most cases)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
