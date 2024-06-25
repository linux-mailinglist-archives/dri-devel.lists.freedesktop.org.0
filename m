Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC54916EEE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DC910E6E6;
	Tue, 25 Jun 2024 17:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cpNPOj0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F147A10E6E6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:14:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 106AC61684
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E459C4AF0A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719335666;
 bh=46Wl6Xkr1JbjUehyX5BwiPB9KPfZPBJARJydWbvf6gQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cpNPOj0g2JTehrxEUWkoiAB9LRoHLf3sWR5v3hs35yainoH/3hOF1ytkOe0BON9sd
 Jewa+eB5sS8fLkFK17nrZupvmCIQM8l+yvF40KngxynQWSTXuTQ+QU/T1W7YnyRPuz
 TW1SnR9rONeM2nSnpQptHChdl6ZHEz+0XE0MCx7I/YmiuywkNaI6yf4YR8ejMxIbla
 Sk4eDHRjo9zVddmkBlqtFTr5Xvn/QBEhTTzR0EtNOcUpnRbnI0Cu5Y28VvxTO1rjdF
 1rzRQi9HURrE9zgwdAKfp+t+M45mXWZQ1Jc+hP8QI11zTBbHuRkhzVzWShnmoiEY2K
 4Ba6LGWhvBqGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 87873C53BB8; Tue, 25 Jun 2024 17:14:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Tue, 25 Jun 2024 17:14:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vasant.hegde@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218900-2300-fU69vX9QYD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

--- Comment #19 from Vasant Hegde (vasant.hegde@amd.com) ---
Unfortunately there was another big in suspend/resume path. Can you please =
test
with below patch?

https://lore.kernel.org/linux-iommu/ZnqzXyCU8bn32j4-@8bytes.org/T/#m1cd1520=
facb8b758efdf7a8c0261f9ee2ec217d7



-Vasant

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
