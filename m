Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC5B8431F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 12:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29D10E6E3;
	Thu, 18 Sep 2025 10:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qB3Yuv0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0565E10E6C9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:44:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A7F060209
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED8FBC4CEFA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758192271;
 bh=qFPAM6XzPNDpK2GPN8V+tpwWuys/+C+VgCKmzrrEMNw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qB3Yuv0vKiQ37ih3kWAaXggxHcmrV3GIj6r5oMNiu+S9Irl07dqyhVL95KK/aEW/W
 AU5ujVKx3kRmsXk23/QBHxBijE/Y7+uWiY2ttBIAngJJMDHfEQoKDzk6m/vvUDz1zI
 DF6n0RWJ/DzmS1ogZl5fyIfw5hhPjbcAcoXlJI0LoZTX6vj3NDGxSckv2lIz9+25pm
 N42evM26/+B4YCuobMJ9Ac/nU7tYJF1ZXLg/BlWYLdZ3rNX/PEX7eExpk+FqZVsUOr
 kr0T50gKwZoE+6deh7ct42NOZ5eC1TkjJu9aRRNe8L6wblef663YQdSeHTScLUtXlq
 BtffshUrfhLrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DF15CC53BBF; Thu, 18 Sep 2025 10:44:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220428] UBSAN array-index-out-of-bounds warning in
 radeon_atombios.c on kernel 6.15.9 with AMD Radeon HD 6250
Date: Thu, 18 Sep 2025 10:44:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: r.szwajkowski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220428-2300-5zqCzxn3UK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220428-2300@https.bugzilla.kernel.org/>
References: <bug-220428-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220428

r.szwajkowski@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |r.szwajkowski@gmail.com

--- Comment #1 from r.szwajkowski@gmail.com ---
I've encountered the same error in kernel 6.16.5-200.fc42.x86_64. There is =
also
another one next to it that seems related:

UBSAN: array-index-out-of-bounds in drivers/gpu/drm/radeon/si_dpm.c:6824:32

both stack traces attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
