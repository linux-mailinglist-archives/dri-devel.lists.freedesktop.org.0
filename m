Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E53CADA16E
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 11:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0C210E0D3;
	Sun, 15 Jun 2025 09:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ph6F5/ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131D910E0D3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 09:13:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42ECE61137
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 09:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DE5AC4CEE3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749978786;
 bh=ViOQ7zr+P5L4FaHUhqeSK0Zg0nOFzYi/aRV1+FEE8XM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ph6F5/keiEw+CoDCGTFsrh6d4JzTjvEM6uofJm08hcI+cOZyrYnirp9OcY4vNQEGr
 0YXcCeqey9KGM9/0Cy9AsSOD8yHalofOJXv6cjwMOWtyU7ahOBpa/77GzawdBiensq
 TrPuwhErjtLTHntgBgIKQS8RxNJUkWttHxHo19N1kJGSXRBOs0mYAGrNiBatlk2bHh
 cPpGRPei0CgchVy5P5Owz9L0aSV2J7CmvL5pd3Z4RRDCC3fiPzAjxPvvRWW/vaop6D
 0ZPxyGO8mluzLUjZ/uMT3KDaPHwpLsIbRRkYu8UsNrnbArsQhWMxXtxtxkj4gKHjRN
 yzql0kWR9FEPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 823EFC41612; Sun, 15 Jun 2025 09:13:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220230] linux-firmware 20250613 breaks AMD iGPU
Date: Sun, 15 Jun 2025 09:13:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: therealgraysky@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220230-2300-DOWs3LgP0X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220230-2300@https.bugzilla.kernel.org/>
References: <bug-220230-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220230

--- Comment #1 from therealgraysky@proton.me ---
If I revert the following 4 commits, everything works as expected:

% git log --no-merges --pretty=3Doneline --abbrev-commit 20250509...20250613
|grep amdgpu
5ac6303062e4 amdgpu: DMCUB updates for various ASICs
25750add9b77 amdgpu: DMCUB updates for various ASICs
6b9fb15a5b49 amdgpu: DMCUB updates for various ASICs
e663dc7a2122 amdgpu: updates for dcn 3.20 and dcn 4.01 firmware to 0.1.10.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
