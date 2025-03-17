Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0698A63B47
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 03:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A17010E069;
	Mon, 17 Mar 2025 02:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rYVehdnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7ED10E069
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:19:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D84865C463A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E03BC4CEEF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742177939;
 bh=KM0SW9CCMWri3PenRY9cwFkRjnJEE2JcQuvjMSB17UU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rYVehdnI99HJzk68Y7zEO0U+WmY99/0qE7bu5KQyRer5f5nqK4mYp4NnKdP80+7G8
 RNr4A43IPkAtpFiBiRISB2LaBt3QurgWeJO9IUWKZJxjRrP91xW4aGsPfdHDvP4cb/
 uve2q8Hj4kKbe1BYKMscXyObgsfvaW6fCEyy8Ydam+EWSHIGX0tlP/cP2zaVcuz73C
 f6UvPJUgvrH+981hfQ4CdYnbZXyLF8LCe3yf2WxmH2iQGguddDzRCEuck3nkaKQYj8
 rDIFeN1oIDXaYXIFylkqMzPJXlDc94nW0k/3KQoPxRarBTCVfFpLUze0VEqBw7meOS
 OBT2O3jObhzDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 479A1C53BC5; Mon, 17 Mar 2025 02:18:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850 (Pitcairn)
Date: Mon, 17 Mar 2025 02:18:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit cc cf_kernel_version cf_regression
Message-ID: <bug-219888-2300-EEDB7Idg7W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

Alexandre Demers (alexandre.f.demers@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|                            |e6a901a00822659181c93c86d8b
                   |                            |bc2a17779fddc
                 CC|                            |alexdeucher@gmail.com
     Kernel Version|6.13.0                      |6.11.0
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
