Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9144F330
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 14:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A966E0CF;
	Sat, 13 Nov 2021 13:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5636E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 13:04:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9715461077
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636808641;
 bh=jrWzKIp3ImXoK2HRelBwwLJEm71xPJiR2G3gUCki7gI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VyCpdH1UuSuL867vp7WI5FQ/7UFzhNj4rrPUw4T1zbgu6DmFBrnpMcv8sxjofU0WH
 BbudZCyAFEE9Nj79ge6Xw0ggIuGgy1k2lSJIYVnr/Oha7GpNViPXoxAFffRyqN9V9s
 JfRQBHqPJ1naFd0QTOPkyD0+Dgr4HLzNDrNGhpfxxiVzul72WSssn3LvxyIQfihck6
 Sg2aVZ+KmqeF8paTppWw7nYEEj1ual8JN959naXTiYBmnwvScD+9yuG8bGxPMBEb6k
 d4WENTyc47M5dMZ3RqaqORqV3kVUZgTHGzbJ3EciaCR0jbc29qWQNTWlWK+fQZ9Lzc
 lW8iMt0cKlaJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8DB146112E; Sat, 13 Nov 2021 13:04:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] apple_gmux fails to initialize and iGPU unclaimed on
 MacBook Pro 16" 2019
Date: Sat, 13 Nov 2021 13:04:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215003-2300-3rmlI4Zep1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215003-2300@https.bugzilla.kernel.org/>
References: <bug-215003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

Lukas Wunner (lukas@wunner.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lukas@wunner.de

--- Comment #2 from Lukas Wunner (lukas@wunner.de) ---
vga_switcheroo_client_probe_defer() only returns true if invoked by the
*inactive* GPU's driver. (That's the "pdev !=3D vga_default_device()" condi=
tion.)
In other words, you've enabled the iGPU but it's not the *active* one. You =
need
to use the gpu-switch utility (https://github.com/0xbb/gpu-switch) to tell =
the
EFI BIOS that it should switch to the iGPU on next boot. That should resolve
the issue.

Unfortunately we don't support GPU switching for retina MBPs in the kernel =
yet,
hence have to rely on the EFI BIOS to do that for now. (We do support GPU
switching for *pre-retina* MBPs in the kernel since early 2016.)

However, I'd like to know why apple_gmux fails to probe with "Failed to find
gmux I/O resource". Could you attach an ACPI dump to this bugzilla? Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
