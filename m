Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DCAF0526
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 22:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82D410E2E9;
	Tue,  1 Jul 2025 20:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZzP2lnYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D2D10E2F0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:53:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2FE92613A9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB314C4CEEB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751402895;
 bh=D8igEE3Z39OGUYyX4xgT6xT+wpADLLYmDeTj6lQGnKI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZzP2lnYhpfGkXpejxngwgUTqgDYVOaUX1MUaEcCdg/xStz7jDmcpysTMkDqWqDet9
 jUu3TMXRf55/iBAY7q4NMzAqi4/32ji1CBXDCSnd2i/3MVvvsUiSVLUuKgze+CCqpr
 IVlBi72XiFZqKgtoG85901GLQMoHqi/jty63q+zVmUI4uMvMzb2WIH9kcKw742UeOW
 4fTQMFf77/ty9y/Tk99ppyDXX9uX4P5oobKifS9Y37eCyLt58hgrw/AxqfAM78HKiW
 FtjWV7c3u2pKCyV/1MqlTcIGZLRil78wQF4GvnXuo/DRxurQR+kxOrVdmJp91Tq4L+
 05jpKZE7Bj0Pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C4321C4160E; Tue,  1 Jul 2025 20:48:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220304] [amdgpu] DisplayPort resource allocation issue (one
 blank screen)
Date: Tue, 01 Jul 2025 20:48:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonas@sldr.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220304-2300-zgovHHFDsz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220304-2300@https.bugzilla.kernel.org/>
References: <bug-220304-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220304

--- Comment #1 from J.A. Hult=C3=A9n (jonas@sldr.se) ---
As far as I've gotten, I've narrowed the bisect range down to:
bad: db5d28c0bfe566908719bec8e25443aabecbb802
good: afd29f36aaf733985df1ba162424581b8b8853b4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
